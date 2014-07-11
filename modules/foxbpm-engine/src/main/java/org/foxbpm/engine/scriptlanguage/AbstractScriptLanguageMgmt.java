/**
 * Copyright 1996-2014 FoxBPM ORG.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 *      http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * 
 * @author kenshin
 * @author ych
 */
package org.foxbpm.engine.scriptlanguage;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.lang3.StringUtils;
import org.foxbpm.engine.impl.datavariable.DataVariableDefinition;
import org.foxbpm.engine.impl.entity.ProcessDefinitionEntity;
import org.foxbpm.engine.impl.entity.ProcessInstanceEntity;
import org.foxbpm.engine.impl.entity.VariableInstanceEntity;
import org.foxbpm.engine.impl.mgmt.DataVariableMgmtInstance;
import org.foxbpm.kernel.runtime.FlowNodeExecutionContext;

public abstract class AbstractScriptLanguageMgmt {

	private static String __REGEX_SIGNS = "\\$\\{[^}{]+\\}";

	/**
	 * 执行表达式
	 * 
	 * @param scriptText
	 *            表达式文本
	 * @return
	 */
	public abstract Object execute(String scriptText);

	/**
	 * 执行表达式,对于没有流程上下文环境的时候,执行表达式的时候需要传入流程定义。
	 * 
	 * @param scriptText
	 *            表达式文本
	 * @param processDefinition
	 *            流程定义
	 * @return
	 */
	public abstract Object execute(String scriptText, ProcessDefinitionEntity processDefinition);

	/**
	 * 向表达式环境中放入变量
	 * 
	 * @param variableName
	 *            变量名称
	 * @param variableObj
	 *            变量值
	 */
	public abstract void setVariable(String variableName, Object variableObj);

	/**
	 * 向表达式环境中放入变量,这个变量将是流程变量${var}
	 * 
	 * @param variableName
	 *            变量名称
	 * @param variableObj
	 *            变量值
	 * @param executionContext
	 *            流程上下文
	 */
	public abstract void setVariable(String variableName, Object variableObj, FlowNodeExecutionContext executionContext);

	/**
	 * 获取变量值
	 * 
	 * @param variableName
	 *            变量名称
	 * @return
	 */
	public abstract Object getVariable(String variableName);

	/**
	 * 执行表达式
	 * 
	 * @param scriptText
	 *            表达式字符串
	 * @param executionContext
	 *            流程上下文
	 * @return
	 */
	public abstract Object execute(String scriptText, FlowNodeExecutionContext executionContext);

	/**
	 * 脚本管理器初始化方法
	 */
	public abstract AbstractScriptLanguageMgmt init();

	public abstract void close();

	public static List<String> getDataVariableList(String scriptText) {
		String inexp = scriptText;
		// ${test} afdfs ${test1}erewr ${test3}
		String regex = "\\$\\{[^}{]+\\}";
		Pattern regexExpType = Pattern.compile(regex);
		Matcher mType = regexExpType.matcher(inexp);
		String expType = inexp;
		List<String> list = new ArrayList<String>();
		while (mType.find()) {
			expType = mType.group();
			expType = expType.substring(2, expType.length() - 1);
			list.add(expType);
		}
		return list;
	}

	public static String getExpressionAll(String inexp) {
		String str = null;
		String regex = __REGEX_SIGNS;
		Pattern regexExpType = Pattern.compile(regex);
		Matcher mType = regexExpType.matcher(inexp);
		String expType = inexp;
		StringBuffer sb = new StringBuffer();
		while (mType.find()) {
			expType = mType.group();
			String dist = expType.substring(2, expType.length() - 1); // StringUtil.getString(getExpressionValue(dataView,expType));
			mType.appendReplacement(sb, dist);
		}
		mType.appendTail(sb);
		str = sb.toString();
		return str;
	}

	protected void dataVariableCalculate(String scriptText, FlowNodeExecutionContext executionContext) {

		ProcessInstanceEntity processInstance = (ProcessInstanceEntity) executionContext.getProcessInstance();
		DataVariableMgmtInstance dataVariableMgmtInstance = processInstance.getDataVariableMgmtInstance();
		ProcessDefinitionEntity processDefinition = (ProcessDefinitionEntity) processInstance.getProcessDefinition();
		List<DataVariableDefinition> dataVariableBehaviors = null;
		List<String> dataVariableList = getDataVariableList(scriptText);
		if(dataVariableList != null && dataVariableList.size() > 0){
			dataVariableBehaviors = processDefinition.getDataVariableMgmtDefinition().getDataVariableBehaviorsByProcess();
		}
		for (String expressionId : dataVariableList) {
			if (dataVariableMgmtInstance.getDataVariableByExpressionId(expressionId) == null) {
				/*
				//先去数据库查询
				VariableInstanceEntity variable = Context.getCommandContext().getVariableManager().findVariableByProcessInstanceIdAndKey("", "");
				if(variable==null){
					//不存在数据库中
					
				}else{
					//存在数据库中
					
				}
				*/
				
				for (DataVariableDefinition dataVariableBehavior : dataVariableBehaviors) {
					if (StringUtils.equals(dataVariableBehavior.getId(), expressionId)) {
						dataVariableMgmtInstance.createDataVariableInstance(dataVariableBehavior).executeExpression(executionContext);
					} else {
						if (StringUtils.equals(dataVariableBehavior.getBizType(), VariableInstanceEntity.QUERY_DATA_KEY)) {
							dataVariableMgmtInstance.createDataVariableInstance(dataVariableBehavior).executeExpression(executionContext);
						}
					}

				}

			}

		}

	}
}
