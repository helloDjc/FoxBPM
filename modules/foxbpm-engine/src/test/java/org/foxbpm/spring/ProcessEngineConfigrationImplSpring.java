package org.foxbpm.spring;

import org.foxbpm.engine.ProcessEngine;
import org.foxbpm.engine.impl.ProcessEngineConfigurationImpl;
public class ProcessEngineConfigrationImplSpring extends ProcessEngineConfigurationImpl {

	@Override
	public ProcessEngine buildProcessEngine() {
		this.dataSourceManager = new SpringDataSourceManage();
		return super.buildProcessEngine();
	}
}
