﻿CREATE TABLE FOXBPM_DEF_PROCESSDEFINITION
(
  DIFINITIONS_KEY       VARCHAR(512),
  DIFINITIONS_ID        VARCHAR(512),
  PROCESS_KEY           VARCHAR(512),
  PROCESS_ID            VARCHAR(250) NOT NULL,
  CATEGORY              VARCHAR(255),
  PROCESS_NAME          VARCHAR(255),
  VERSION               INTEGER,
  RESOURCE_NAME         VARCHAR(4000),
  DEPLOYMENT_ID         VARCHAR(64),
  DIAGRAM_RESOURCE_NAME VARCHAR(512),
  START_FORM_KEY        VARCHAR(1024),
  RESOURCE_ID           VARCHAR(64),
  SUB_TASK_ID           VARCHAR(128)
)
;

ALTER TABLE FOXBPM_DEF_PROCESSDEFINITION
  ADD CONSTRAINT FOXBPM_DEF_PROCESSDEFINI_PK PRIMARY KEY (PROCESS_ID)
;

CREATE TABLE FOXBPM_MAIL
(
  MAIL_ID        VARCHAR(128) NOT NULL,
  MAIL_NAME      VARCHAR(4000),
  MAIL_TO        VARCHAR(4000),
  MAIL_SUBJECT   VARCHAR(4000),
  MAIL_BODY      BLOB,
  BIZ_TYPE       VARCHAR(128),
  BIZ_VALUE      VARCHAR(512),
  MAIL_STATUS    VARCHAR(64),
  CREATE_TIME    DATETIME,
  SEND_TIME      DATETIME,
  MAIL_CC        VARCHAR(4000),
  CREATE_USER    VARCHAR(64),
  FAILURE_REASON VARCHAR(4000)
)
;

ALTER TABLE FOXBPM_MAIL
  ADD CONSTRAINT FOXBPM_MAIL_PK PRIMARY KEY (MAIL_ID)
;


CREATE TABLE FOXBPM_RUN_PROCESSINSTANCE
(
  PROCESSINSTANCE_ID       VARCHAR(64) NOT NULL,
  PROCESSDEFINITION_ID      VARCHAR(512),
  SUBJECT                  VARCHAR(4000),
  START_TIME               DATETIME,
  END_TIME                 DATETIME,
  DEFINITION_ID            VARCHAR(64),
  ROOTTOKEN_ID             VARCHAR(64),
  BIZ_KEY                  VARCHAR(64),
  INITIATOR                VARCHAR(64),
  ISSUSPENDED              VARCHAR(20),
  PROCESSDEFINITION_KEY    VARCHAR(512),
  PARENT_INSTANCE_ID       VARCHAR(64),
  PARENT_INSTANCE_TOKEN_ID VARCHAR(64),
  UPDATE_TIME              DATETIME,
  START_AUTHOR VARCHAR(64),
  PROCESSLOCATION          VARCHAR(2048),
  ISPIGEONHOLE		   VARCHAR(1),
  INSTANCE_STATUS          VARCHAR(45),
  ARCHIVE_TIME   DATETIME DEFAULT NULL
)
;

ALTER TABLE FOXBPM_RUN_PROCESSINSTANCE
  ADD CONSTRAINT FOXBPM_RUN_PROCESSINSTAN_PK PRIMARY KEY (PROCESSINSTANCE_ID)
;

CREATE TABLE FOXBPM_RUN_TASKINSTANCE
(
  TASKINSTANCE_ID       VARCHAR(64) NOT NULL,
  PROCESSINSTANCE_ID    VARCHAR(64),
  PROCESSDEFINITION_ID   VARCHAR(512),
  VERSION               INTEGER,
  TOKEN_ID              VARCHAR(64),
  NODE_ID               VARCHAR(64),
  DESCRIPTION           VARCHAR(4000),
  PARENTTASK_ID         VARCHAR(64),
  ASSIGNEE              VARCHAR(64),
  CLAIM_TIME            DATETIME,
  NAME                  VARCHAR(255),
  CREATE_TIME           DATETIME,
  START_TIME            DATETIME,
  ISBLOCKING            VARCHAR(20),
  END_TIME              DATETIME,
  DUEDATE               DATETIME,
  PRIORITY              DECIMAL(6),
  CATEGORY              VARCHAR(64),
  OWNER                 VARCHAR(64),
  DELEGATIONSTATESTRING VARCHAR(64),
  BIZKEY                VARCHAR(64),
  COMMAND_TYPE          VARCHAR(256),
  COMMAND_MESSAGE       VARCHAR(256),
  TASK_COMMENT          VARCHAR(4000),
  NODE_NAME             VARCHAR(512),
  PROCESSDEFINITION_KEY VARCHAR(512),
  FORMURI               VARCHAR(256),
  TASKGROUP             VARCHAR(64),
  TASKTYPE              VARCHAR(64),
  PROCESSDEFINITION_NAME VARCHAR(512),
  ISCANCELLED VARCHAR(64),
  ISSUSPENDED VARCHAR(64),
  ISOPEN VARCHAR(64),
  ISDRAFT VARCHAR(64),
  EXPECTED_EXECUTIONTIME DECIMAL(12,0),
  AGENT VARCHAR(64),
  ADMIN VARCHAR(64),
  FORMURIVIEW VARCHAR(512),
  CALLACTIVITY_INSTANCE_ID VARCHAR(256),
  COMMAND_ID VARCHAR(64),
  PENDINGTASKID VARCHAR(64),
  ARCHIVE_TIME   DATETIME DEFAULT NULL
)
;

ALTER TABLE FOXBPM_RUN_TASKINSTANCE
  ADD CONSTRAINT FOXBPM_RUN_TASKINSTANCE_PK PRIMARY KEY (TASKINSTANCE_ID)
;
CREATE INDEX INDEX12 ON FOXBPM_RUN_TASKINSTANCE (ISBLOCKING)
;
CREATE INDEX INDEX19 ON FOXBPM_RUN_TASKINSTANCE (PROCESSINSTANCE_ID)
;
CREATE INDEX INDEX2 ON FOXBPM_RUN_TASKINSTANCE (ASSIGNEE)
;
CREATE INDEX INDEX6 ON FOXBPM_RUN_TASKINSTANCE (CREATE_TIME)
;

CREATE TABLE FOXBPM_RUN_TASKIDENTITYLINK
(
  ID                VARCHAR(64) NOT NULL,
  TYPE              VARCHAR(64),
  USER_ID           VARCHAR(64),
  GROUP_ID          VARCHAR(64),
  GROUP_TYPE        VARCHAR(64),
  TASKINSTANCE_ID   VARCHAR(64),
  PROCESSDEFINITION_ID VARCHAR(64),
  PROCESSINSTANCE_ID    VARCHAR(64),
  ARCHIVE_TIME   DATETIME DEFAULT NULL
)
;
ALTER TABLE FOXBPM_RUN_TASKIDENTITYLINK
  ADD CONSTRAINT FOXBPM_RUN_TASKIDENTITYL_PK PRIMARY KEY (ID)
;

CREATE TABLE FOXBPM_RUN_TOKEN
(
  TOKEN_ID                 VARCHAR(64) NOT NULL,
  NAME                     VARCHAR(128),
  START_TIME               DATETIME,
  END_TIME                 DATETIME,
  NODEENTER_TIME           DATETIME,
  ISABLETOREACTIVATEPARENT VARCHAR(64),
  ISSUSPENDED              VARCHAR(64),
  TOKEN_LOCK               VARCHAR(64),
  NODE_ID                  VARCHAR(128),
  PROCESSINSTANCE_ID       VARCHAR(64),
  PARENT_ID                VARCHAR(64),
  ISSUBPROCESSROOTTOKEN    VARCHAR(20),
  FREETOKEN                VARCHAR(64),
  PARENT_FREETOKEN_ID      VARCHAR(64),
  ARCHIVE_TIME   DATETIME DEFAULT NULL
)
;

ALTER TABLE FOXBPM_RUN_TOKEN
  ADD CONSTRAINT FOXBPM_RUN_TOKEN_PK PRIMARY KEY (TOKEN_ID)
;
CREATE INDEX INDEX22 ON FOXBPM_RUN_TOKEN (PROCESSINSTANCE_ID)
;

CREATE TABLE FOXBPM_RUN_VARIABLE
(
  PROCESSINSTANCE_ID VARCHAR(64),
  VARIABLE_KEY       VARCHAR(64),
  VARIABLE_VALUE     BLOB,
  VARIABLE_CLASSNAME VARCHAR(64),
  TASKINSTANCE_ID VARCHAR(64),
  TOKEN_ID VARCHAR(64),
  NODE_ID  VARCHAR(512),
  ARCHIVE_TIME   DATETIME DEFAULT NULL,
  VARIABLE_TYPE VARCHAR(45),
  BIZ_DATA VARCHAR(2048)
)
;

CREATE INDEX INDEX30 ON FOXBPM_RUN_VARIABLE (PROCESSINSTANCE_ID)
;

CREATE TABLE FOXBPM_WORKDATE_DES
(

  RULE_ID         VARCHAR(64) NOT NULL,
  WEEK_NUM        VARCHAR(64) NOT NULL,
  AM_PM          VARCHAR(64) NOT NULL,
  BEGIN_DATE      VARCHAR(64),
  END_DATE        VARCHAR(64)
)
;
ALTER TABLE FOXBPM_WORKDATE_DES ADD CONSTRAINT PK_FOXBPM_WORKDATE_DES PRIMARY KEY (RULE_ID,WEEK_NUM,AM_PM)
;

CREATE TABLE FOXBPM_WORKDATE_DETAIL
(
  RULE_ID          VARCHAR(64) NOT NULL,
  COMMOM_DATE     VARCHAR(64) NOT NULL,
  BEGIN_DATE      VARCHAR(64),
  END_DATE        VARCHAR(64),
  AM_PM          VARCHAR(64) NOT NULL,
  IS_WORK      INTEGER,
  MINUTES      INTEGER
)
;
ALTER TABLE FOXBPM_WORKDATE_DETAIL ADD CONSTRAINT PK_FOXBPM_WORKDATE_DETAIL PRIMARY KEY (COMMOM_DATE,AM_PM,RULE_ID)
;

CREATE TABLE FOXBPM_WORKDATE_RULE
(
  RULE_ID         VARCHAR(64) NOT NULL,
  RULE_NAME      VARCHAR(64),
  RULE_DESC       VARCHAR(512),
  CREATE_DATE      VARCHAR(512),
  CREATE_USERID    VARCHAR(64),
  CREATE_USERNAME VARCHAR(64),
  FIELD1          VARCHAR(64),
  FIELD2          VARCHAR(64)
)
;
ALTER TABLE FOXBPM_WORKDATE_RULE ADD CONSTRAINT PK_FOXBPM_WORKDATE_RULE PRIMARY KEY (RULE_ID)
;

CREATE TABLE FOXBPM_WORKDATE_SPEC
(
  RULE_ID          VARCHAR(64) NOT NULL,
  SPEC_DATE       VARCHAR(64)NOT NULL,
  BEGIN_DATE      VARCHAR(64),
  END_DATE        VARCHAR(64),
  AM_PM           VARCHAR(64) NOT NULL
)
;
ALTER TABLE FOXBPM_WORKDATE_SPEC ADD CONSTRAINT PK_FOXBPM_WORKDATE_SPEC PRIMARY KEY (SPEC_DATE,AM_PM)
;


CREATE TABLE FOXBPM_WORKDATE_WEEKNUM
(
  WEEK_NUM         VARCHAR(64) NOT NULL,
  AMPM             VARCHAR(64) NOT NULL,
  BEGINDATE        VARCHAR(64) NOT NULL,
  ENDDATE          VARCHAR(64) NOT NULL
)

;
ALTER TABLE FOXBPM_WORKDATE_WEEKNUM ADD CONSTRAINT FOXBPM_WORKDATE_WEEKNUM1 PRIMARY KEY (WEEK_NUM,AMPM)
;

CREATE TABLE FOXBPM_AGENT_AGENTDETAILS (
  AGENT_ID VARCHAR(64) NOT NULL,
  PROCESS_ID VARCHAR(64) NOT NULL,
  PROCESS_NAME VARCHAR(512) DEFAULT NULL,
  NODE_ID VARCHAR(1024) DEFAULT NULL,
  NODE_NAME VARCHAR(1024) DEFAULT NULL,
  AUSER VARCHAR(64) DEFAULT NULL,
  GUID VARCHAR(64)  NOT NULL,
  PRIMARY KEY (GUID)
)
;

CREATE TABLE `FOXBPM_AGENT_AGENTINFO` (
  `AGENT_ID` VARCHAR(64) NOT NULL,
  `ODATE` DATETIME DEFAULT NULL,
  `OPERATOR` VARCHAR(64) DEFAULT NULL,
  `SDATE` DATETIME DEFAULT NULL,
  `EDATE` DATETIME DEFAULT NULL,
  `VIEW_TYPE` VARCHAR(64) DEFAULT NULL,
  `STATUS` VARCHAR(20) DEFAULT NULL,
  `RESERVER1` VARCHAR(64) DEFAULT NULL,
  `RESERVER2` VARCHAR(64) DEFAULT NULL,
  PRIMARY KEY (`AGENT_ID`)
) 
;

CREATE TABLE FOXBPM_DEF_BYTEARRAY
(
  ID            VARCHAR(64) NOT NULL,
  REV           DECIMAL(12),
  NAME          VARCHAR(512),
  BYTES         BLOB,
  DEPLOYMENT_ID VARCHAR(256)
)
;

CREATE TABLE FOXBPM_DEF_DEPLOYMENT
(
  ID          VARCHAR(64) NOT NULL,
  NAME        VARCHAR(512),
  DEPLOY_TIME DATETIME
)
;
ALTER TABLE FOXBPM_DEF_DEPLOYMENT
  ADD CONSTRAINT FOXBPM_DEF_DEPLOYMENT_PK PRIMARY KEY (ID)
;


CREATE TABLE FOXBPM_HIS_IDENTITYLINK
(
  ID              VARCHAR(64) NOT NULL,
  TYPE            VARCHAR(64),
  USER_ID         VARCHAR(64),
  ROLE_ID         VARCHAR(64),
  DEPT_ID         VARCHAR(64),
  TASKINSTANCE_ID VARCHAR(64),
  ARCHIVE_TIME   DATETIME DEFAULT NULL
)
;
ALTER TABLE FOXBPM_HIS_IDENTITYLINK
  ADD CONSTRAINT FOXBPM_HIS_IDENTITYLINK_PK PRIMARY KEY (ID)
;

CREATE TABLE FOXBPM_HIS_PROCESSINSTANCE
(
  PROCESSINSTANCE_ID       VARCHAR(64) NOT NULL,
  PROCESSDEFINITION_ID      VARCHAR(512),
  SUBJECT                  VARCHAR(4000),
  START_TIME               DATETIME,
  END_TIME                 DATETIME,
  DEFINITION_ID            VARCHAR(64),
  ROOTTOKEN_ID             VARCHAR(64),
  BIZ_KEY                  VARCHAR(64),
  INITIATOR                VARCHAR(64),
  ISSUSPENDED              VARCHAR(20),
  PROCESSDEFINITION_KEY    VARCHAR(512),
  PARENT_INSTANCE_ID       VARCHAR(64),
  PARENT_INSTANCE_TOKEN_ID VARCHAR(64),
  UPDATE_TIME              DATETIME,
  START_AUTHOR VARCHAR(64),
  PROCESSLOCATION          VARCHAR(2048),
  ISPIGEONHOLE		VARCHAR(1),
  INSTANCE_STATUS          VARCHAR(45),
  ARCHIVE_TIME   DATETIME DEFAULT NULL
)
;

ALTER TABLE FOXBPM_HIS_PROCESSINSTANCE
  ADD CONSTRAINT FOXBPM_HIS_PROCESSINSTAN_PK PRIMARY KEY (PROCESSINSTANCE_ID)
;

CREATE TABLE FOXBPM_HIS_TASKINSTANCE
(
  TASKINSTANCE_ID       VARCHAR(64) NOT NULL,
  PROCESSINSTANCE_ID    VARCHAR(64),
  PROCESSDEFINITION_ID   VARCHAR(512),
  VERSION               INTEGER,
  TOKEN_ID              VARCHAR(64),
  NODE_ID               VARCHAR(64),
  DESCRIPTION           VARCHAR(4000),
  PARENTTASK_ID         VARCHAR(64),
  ASSIGNEE              VARCHAR(64),
  CLAIM_TIME            DATETIME,
  NAME                  VARCHAR(255),
  CREATE_TIME           DATETIME,
  START_TIME            DATETIME,
  ISBLOCKING            VARCHAR(20),
  END_TIME              DATETIME,
  DUEDATE               DATETIME,
  PRIORITY              DECIMAL(6),
  CATEGORY              VARCHAR(64),
  OWNER                 VARCHAR(64),
  DELEGATIONSTATESTRING VARCHAR(64),
  BIZKEY                VARCHAR(64),
  COMMAND_TYPE          VARCHAR(256),
  COMMAND_MESSAGE       VARCHAR(256),
  TASK_COMMENT          VARCHAR(4000),
  NODE_NAME             VARCHAR(512),
  PROCESSDEFINITION_KEY VARCHAR(512),
  FORMURI               VARCHAR(256),
  TASKGROUP             VARCHAR(64),
  TASKTYPE              VARCHAR(64),
  PROCESSDEFINITION_NAME VARCHAR(512),
  ISCANCELLED VARCHAR(64),
  ISSUSPENDED VARCHAR(64),
  ISOPEN VARCHAR(64),
  ISDRAFT VARCHAR(64),
  EXPECTED_EXECUTIONTIME DECIMAL(12,0),
  AGENT VARCHAR(64),
  ADMIN VARCHAR(64),
  FORMURIVIEW VARCHAR(512),
  CALLACTIVITY_INSTANCE_ID VARCHAR(256),
  COMMAND_ID VARCHAR(64),
  PENDINGTASKID VARCHAR(64),
  ARCHIVE_TIME   DATETIME DEFAULT NULL
)
;

ALTER TABLE FOXBPM_HIS_TASKINSTANCE
  ADD CONSTRAINT FOXBPM_HIS_TASKINSTANCE_PK PRIMARY KEY (TASKINSTANCE_ID)
;
CREATE INDEX INDEX12 ON FOXBPM_HIS_TASKINSTANCE (ISBLOCKING)
;
CREATE INDEX INDEX19 ON FOXBPM_HIS_TASKINSTANCE (PROCESSINSTANCE_ID)
;
CREATE INDEX INDEX2 ON FOXBPM_HIS_TASKINSTANCE (ASSIGNEE)
;
CREATE INDEX INDEX6 ON FOXBPM_HIS_TASKINSTANCE (CREATE_TIME)
;

CREATE TABLE FOXBPM_HIS_TASKIDENTITYLINK
(
  ID                VARCHAR(64) NOT NULL,
  TYPE              VARCHAR(64),
  USER_ID           VARCHAR(64),
  GROUP_ID          VARCHAR(64),
  GROUP_TYPE        VARCHAR(64),
  TASKINSTANCE_ID   VARCHAR(64),
  INCLUDE_EXCLUSION VARCHAR(64),
  ARCHIVE_TIME   DATETIME DEFAULT NULL
)
;
ALTER TABLE FOXBPM_HIS_TASKIDENTITYLINK
  ADD CONSTRAINT FOXBPM_HIS_TASKIDENTITYL_PK PRIMARY KEY (ID)
;

CREATE TABLE FOXBPM_HIS_TOKEN
(
  TOKEN_ID                 VARCHAR(64) NOT NULL,
  NAME                     VARCHAR(128),
  START_TIME               DATETIME,
  END_TIME                 DATETIME,
  NODEENTER_TIME           DATETIME,
  ISABLETOREACTIVATEPARENT VARCHAR(64),
  ISSUSPENDED              VARCHAR(64),
  TOKEN_LOCK               VARCHAR(64),
  NODE_ID                  VARCHAR(128),
  PROCESSINSTANCE_ID       VARCHAR(64),
  PARENT_ID                VARCHAR(64),
  ISSUBPROCESSROOTTOKEN    VARCHAR(20),
  FREETOKEN                VARCHAR(64),
  PARENT_FREETOKEN_ID      VARCHAR(64),
  ARCHIVE_TIME   DATETIME DEFAULT NULL
)
;

ALTER TABLE FOXBPM_HIS_TOKEN
  ADD CONSTRAINT FOXBPM_HIS_TOKEN_PK PRIMARY KEY (TOKEN_ID)
;
CREATE INDEX INDEX22 ON FOXBPM_HIS_TOKEN (PROCESSINSTANCE_ID)
;


CREATE TABLE FOXBPM_HIS_VARIABLE
(
  PROCESSINSTANCE_ID VARCHAR(64),
  VARIABLE_KEY       VARCHAR(64),
  VARIABLE_VALUE     BLOB,
  VARIABLE_CLASSNAME VARCHAR(64),
  TASKINSTANCE_ID VARCHAR(64),
  TOKEN_ID VARCHAR(64),
  NODE_ID  VARCHAR(512),
  ARCHIVE_TIME   DATETIME DEFAULT NULL,
  VARIABLE_TYPE VARCHAR(45),
  BIZ_DATA VARCHAR(2048)
)
;

CREATE INDEX INDEX30 ON FOXBPM_HIS_VARIABLE (PROCESSINSTANCE_ID)
;

CREATE TABLE AU_ORGINFO
(
  ORGID      VARCHAR(50) NOT NULL,
  SUPORGID   VARCHAR(50),
  ORGNAME    VARCHAR(200),
  ORGLEVELID VARCHAR(50),
  UPDATE_BY  VARCHAR(50),
  UPDATE_DT  DATETIME,
  CREATE_BY  VARCHAR(50),
  UNIT_TYPE  VARCHAR(50),
  CREATE_DT  DATETIME,
  ONSTATUS   DECIMAL(12),
  SORT_ORDER DECIMAL(12),
  ORGPATH VARCHAR(800)
)
;

ALTER TABLE AU_ORGINFO
  ADD CONSTRAINT PK_AU_ORGINFO PRIMARY KEY (ORGID)
;

CREATE TABLE AU_ROLEINFO
(
  ROLEID       VARCHAR(50) NOT NULL,
  NAME         VARCHAR(50),
  BIZTYPE      VARCHAR(50),
  PRUGROUP     VARCHAR(50),
  PLATFORM     VARCHAR(50),
  MEMO         VARCHAR(500),
  UPDATE_BY    VARCHAR(50),
  CREATE_BY    VARCHAR(50),
  CREATE_DT    DATETIME,
  UPDATE_DT    DATETIME,
  CREATE_ORGID VARCHAR(50),
  STATUS VARCHAR(10),
  LEVELNUM INTEGER,
  ENAME VARCHAR(128)
)
;

ALTER TABLE AU_ROLEINFO
  ADD CONSTRAINT PK_AU_ROLEINFO PRIMARY KEY (ROLEID)
;

CREATE TABLE AU_USERINFO
(
  USERID        VARCHAR(50) NOT NULL,
  USERNAME      VARCHAR(50),
  LOGINID       VARCHAR(50),
  JOBID         VARCHAR(50),
  PASSWORD      VARCHAR(50),
  CONF_PASSWORD VARCHAR(50),
  ISADMIN       INTEGER DEFAULT 0,
  EMAIL         VARCHAR(50),
  TELEPHONE     VARCHAR(30),
  MOBILEPHONE   VARCHAR(30),
  FAX           VARCHAR(30),
  TITLEOFPOST   VARCHAR(30),
  WORKED_TIME   DATETIME,
  ISENABLE      INTEGER DEFAULT 1,
  MEMO          NVARCHAR(1000),
  CREATE_BY     VARCHAR(50),
  CREATE_DT     DATETIME,
  UPDATE_BY     VARCHAR(50),
  UPDATE_DT     DATETIME,
  SSOID         VARCHAR(50),
  POSITION		VARCHAR(64),
  LOCATION_NAME VARCHAR(64),
  IMG VARCHAR(64),
  SUPERLEADER  VARCHAR(64)
)
;

ALTER TABLE AU_USERINFO
  ADD CONSTRAINT PK_AU_USERINFO PRIMARY KEY (USERID)
;

CREATE TABLE FIX_GROUP_RELATION
(
  GUID          VARCHAR(50) NOT NULL,
  USER_ID    VARCHAR(50) NOT NULL,
  GROUP_ID      VARCHAR(50) NOT NULL,
  GROUP_TYPE    VARCHAR(50) NOT NULL,
  IS_PRIDUTY VARCHAR(50),
  IS_DEPUTE  VARCHAR(10),
  CREATE_DT     DATETIME NOT NULL,
  UPDATE_DT     DATETIME NOT NULL,
  CREATE_BY     VARCHAR(50) NOT NULL,
  UPDATE_BY     VARCHAR(50) NOT NULL
)
;

ALTER TABLE FIX_GROUP_RELATION
  ADD PRIMARY KEY (GUID)
;





#
# In your Quartz properties file, you'll need to set 
# org.quartz.jobStore.driverDelegateClass = org.quartz.impl.jdbcjobstore.StdJDBCDelegate
#
#
# By: Ron Cordell - roncordell
#  I didn't see this anywhere, so I thought I'd post it here. This is the script from Quartz to create the tables in a MySQL database, modified to use INNODB instead of MYISAM.

DROP TABLE IF EXISTS QRTZ_FIRED_TRIGGERS
;
DROP TABLE IF EXISTS QRTZ_PAUSED_TRIGGER_GRPS
;
DROP TABLE IF EXISTS QRTZ_SCHEDULER_STATE
;
DROP TABLE IF EXISTS QRTZ_LOCKS
;
DROP TABLE IF EXISTS QRTZ_SIMPLE_TRIGGERS
;
DROP TABLE IF EXISTS QRTZ_SIMPROP_TRIGGERS
;
DROP TABLE IF EXISTS QRTZ_CRON_TRIGGERS
;
DROP TABLE IF EXISTS QRTZ_BLOB_TRIGGERS
;
DROP TABLE IF EXISTS QRTZ_TRIGGERS
;
DROP TABLE IF EXISTS QRTZ_JOB_DETAILS
;
DROP TABLE IF EXISTS QRTZ_CALENDARS
;

CREATE TABLE QRTZ_JOB_DETAILS(
SCHED_NAME VARCHAR(120) NOT NULL,
JOB_NAME VARCHAR(200) NOT NULL,
JOB_GROUP VARCHAR(200) NOT NULL,
DESCRIPTION VARCHAR(250) NULL,
JOB_CLASS_NAME VARCHAR(250) NOT NULL,
IS_DURABLE VARCHAR(1) NOT NULL,
IS_NONCONCURRENT VARCHAR(1) NOT NULL,
IS_UPDATE_DATA VARCHAR(1) NOT NULL,
REQUESTS_RECOVERY VARCHAR(1) NOT NULL,
JOB_DATA BLOB NULL,
PRIMARY KEY (SCHED_NAME,JOB_NAME,JOB_GROUP))
ENGINE=InnoDB
;

CREATE TABLE QRTZ_TRIGGERS (
SCHED_NAME VARCHAR(120) NOT NULL,
TRIGGER_NAME VARCHAR(200) NOT NULL,
TRIGGER_GROUP VARCHAR(200) NOT NULL,
JOB_NAME VARCHAR(200) NOT NULL,
JOB_GROUP VARCHAR(200) NOT NULL,
DESCRIPTION VARCHAR(250) NULL,
NEXT_FIRE_TIME BIGINT(13) NULL,
PREV_FIRE_TIME BIGINT(13) NULL,
PRIORITY INTEGER NULL,
TRIGGER_STATE VARCHAR(16) NOT NULL,
TRIGGER_TYPE VARCHAR(8) NOT NULL,
START_TIME BIGINT(13) NOT NULL,
END_TIME BIGINT(13) NULL,
CALENDAR_NAME VARCHAR(200) NULL,
MISFIRE_INSTR SMALLINT(2) NULL,
JOB_DATA BLOB NULL,
PRIMARY KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP),
FOREIGN KEY (SCHED_NAME,JOB_NAME,JOB_GROUP)
REFERENCES QRTZ_JOB_DETAILS(SCHED_NAME,JOB_NAME,JOB_GROUP))
ENGINE=InnoDB
;

CREATE TABLE QRTZ_SIMPLE_TRIGGERS (
SCHED_NAME VARCHAR(120) NOT NULL,
TRIGGER_NAME VARCHAR(200) NOT NULL,
TRIGGER_GROUP VARCHAR(200) NOT NULL,
REPEAT_COUNT BIGINT(7) NOT NULL,
REPEAT_INTERVAL BIGINT(12) NOT NULL,
TIMES_TRIGGERED BIGINT(10) NOT NULL,
PRIMARY KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP),
FOREIGN KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
REFERENCES QRTZ_TRIGGERS(SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP))
ENGINE=InnoDB
;

CREATE TABLE QRTZ_CRON_TRIGGERS (
SCHED_NAME VARCHAR(120) NOT NULL,
TRIGGER_NAME VARCHAR(200) NOT NULL,
TRIGGER_GROUP VARCHAR(200) NOT NULL,
CRON_EXPRESSION VARCHAR(120) NOT NULL,
TIME_ZONE_ID VARCHAR(80),
PRIMARY KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP),
FOREIGN KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
REFERENCES QRTZ_TRIGGERS(SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP))
ENGINE=InnoDB
;

CREATE TABLE QRTZ_SIMPROP_TRIGGERS
  (          
    SCHED_NAME VARCHAR(120) NOT NULL,
    TRIGGER_NAME VARCHAR(200) NOT NULL,
    TRIGGER_GROUP VARCHAR(200) NOT NULL,
    STR_PROP_1 VARCHAR(512) NULL,
    STR_PROP_2 VARCHAR(512) NULL,
    STR_PROP_3 VARCHAR(512) NULL,
    INT_PROP_1 INT NULL,
    INT_PROP_2 INT NULL,
    LONG_PROP_1 BIGINT NULL,
    LONG_PROP_2 BIGINT NULL,
    DEC_PROP_1 NUMERIC(13,4) NULL,
    DEC_PROP_2 NUMERIC(13,4) NULL,
    BOOL_PROP_1 VARCHAR(1) NULL,
    BOOL_PROP_2 VARCHAR(1) NULL,
    PRIMARY KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP),
    FOREIGN KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP) 
    REFERENCES QRTZ_TRIGGERS(SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP))
ENGINE=InnoDB
;

CREATE TABLE QRTZ_BLOB_TRIGGERS (
SCHED_NAME VARCHAR(120) NOT NULL,
TRIGGER_NAME VARCHAR(200) NOT NULL,
TRIGGER_GROUP VARCHAR(200) NOT NULL,
BLOB_DATA BLOB NULL,
PRIMARY KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP),
INDEX (SCHED_NAME,TRIGGER_NAME, TRIGGER_GROUP),
FOREIGN KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
REFERENCES QRTZ_TRIGGERS(SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP))
ENGINE=InnoDB
;

CREATE TABLE QRTZ_CALENDARS (
SCHED_NAME VARCHAR(120) NOT NULL,
CALENDAR_NAME VARCHAR(200) NOT NULL,
CALENDAR BLOB NOT NULL,
PRIMARY KEY (SCHED_NAME,CALENDAR_NAME))
ENGINE=InnoDB
;

CREATE TABLE QRTZ_PAUSED_TRIGGER_GRPS (
SCHED_NAME VARCHAR(120) NOT NULL,
TRIGGER_GROUP VARCHAR(200) NOT NULL,
PRIMARY KEY (SCHED_NAME,TRIGGER_GROUP))
ENGINE=InnoDB
;

CREATE TABLE QRTZ_FIRED_TRIGGERS (
SCHED_NAME VARCHAR(120) NOT NULL,
ENTRY_ID VARCHAR(95) NOT NULL,
TRIGGER_NAME VARCHAR(200) NOT NULL,
TRIGGER_GROUP VARCHAR(200) NOT NULL,
INSTANCE_NAME VARCHAR(200) NOT NULL,
FIRED_TIME BIGINT(13) NOT NULL,
PRIORITY INTEGER NOT NULL,
STATE VARCHAR(16) NOT NULL,
JOB_NAME VARCHAR(200) NULL,
JOB_GROUP VARCHAR(200) NULL,
IS_NONCONCURRENT VARCHAR(1) NULL,
REQUESTS_RECOVERY VARCHAR(1) NULL,
PRIMARY KEY (SCHED_NAME,ENTRY_ID))
ENGINE=InnoDB
;

CREATE TABLE QRTZ_SCHEDULER_STATE (
SCHED_NAME VARCHAR(120) NOT NULL,
INSTANCE_NAME VARCHAR(200) NOT NULL,
LAST_CHECKIN_TIME BIGINT(13) NOT NULL,
CHECKIN_INTERVAL BIGINT(13) NOT NULL,
PRIMARY KEY (SCHED_NAME,INSTANCE_NAME))
ENGINE=InnoDB
;

CREATE TABLE QRTZ_LOCKS (
SCHED_NAME VARCHAR(120) NOT NULL,
LOCK_NAME VARCHAR(40) NOT NULL,
PRIMARY KEY (SCHED_NAME,LOCK_NAME))
ENGINE=InnoDB
;

-- Create table
create table DEMOTABLE
(
  COL1 VARCHAR(50),
  COL2 VARCHAR(50)
)ENGINE=InnoDB;

CREATE INDEX IDX_QRTZ_J_REQ_RECOVERY ON QRTZ_JOB_DETAILS(SCHED_NAME,REQUESTS_RECOVERY)
;
CREATE INDEX IDX_QRTZ_J_GRP ON QRTZ_JOB_DETAILS(SCHED_NAME,JOB_GROUP)
;

CREATE INDEX IDX_QRTZ_T_J ON QRTZ_TRIGGERS(SCHED_NAME,JOB_NAME,JOB_GROUP)
;
CREATE INDEX IDX_QRTZ_T_JG ON QRTZ_TRIGGERS(SCHED_NAME,JOB_GROUP)
;
CREATE INDEX IDX_QRTZ_T_C ON QRTZ_TRIGGERS(SCHED_NAME,CALENDAR_NAME)
;
CREATE INDEX IDX_QRTZ_T_G ON QRTZ_TRIGGERS(SCHED_NAME,TRIGGER_GROUP)
;
CREATE INDEX IDX_QRTZ_T_STATE ON QRTZ_TRIGGERS(SCHED_NAME,TRIGGER_STATE)
;
CREATE INDEX IDX_QRTZ_T_N_STATE ON QRTZ_TRIGGERS(SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP,TRIGGER_STATE)
;
CREATE INDEX IDX_QRTZ_T_N_G_STATE ON QRTZ_TRIGGERS(SCHED_NAME,TRIGGER_GROUP,TRIGGER_STATE)
;
CREATE INDEX IDX_QRTZ_T_NEXT_FIRE_TIME ON QRTZ_TRIGGERS(SCHED_NAME,NEXT_FIRE_TIME)
;
CREATE INDEX IDX_QRTZ_T_NFT_ST ON QRTZ_TRIGGERS(SCHED_NAME,TRIGGER_STATE,NEXT_FIRE_TIME)
;
CREATE INDEX IDX_QRTZ_T_NFT_MISFIRE ON QRTZ_TRIGGERS(SCHED_NAME,MISFIRE_INSTR,NEXT_FIRE_TIME)
;
CREATE INDEX IDX_QRTZ_T_NFT_ST_MISFIRE ON QRTZ_TRIGGERS(SCHED_NAME,MISFIRE_INSTR,NEXT_FIRE_TIME,TRIGGER_STATE)
;
CREATE INDEX IDX_QRTZ_T_NFT_ST_MISFIRE_GRP ON QRTZ_TRIGGERS(SCHED_NAME,MISFIRE_INSTR,NEXT_FIRE_TIME,TRIGGER_GROUP,TRIGGER_STATE)
;

CREATE INDEX IDX_QRTZ_FT_TRIG_INST_NAME ON QRTZ_FIRED_TRIGGERS(SCHED_NAME,INSTANCE_NAME)
;
CREATE INDEX IDX_QRTZ_FT_INST_JOB_REQ_RCVRY ON QRTZ_FIRED_TRIGGERS(SCHED_NAME,INSTANCE_NAME,REQUESTS_RECOVERY)
;
CREATE INDEX IDX_QRTZ_FT_J_G ON QRTZ_FIRED_TRIGGERS(SCHED_NAME,JOB_NAME,JOB_GROUP)
;
CREATE INDEX IDX_QRTZ_FT_JG ON QRTZ_FIRED_TRIGGERS(SCHED_NAME,JOB_GROUP)
;
CREATE INDEX IDX_QRTZ_FT_T_G ON QRTZ_FIRED_TRIGGERS(SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
;
CREATE INDEX IDX_QRTZ_FT_TG ON QRTZ_FIRED_TRIGGERS(SCHED_NAME,TRIGGER_GROUP)
;





delete from AU_USERINFO
;
INSERT INTO AU_USERINFO (USERID, USERNAME, LOGINID, JOBID, PASSWORD, CONF_PASSWORD, ISADMIN, EMAIL, TELEPHONE, MOBILEPHONE, FAX, TITLEOFPOST, WORKED_TIME, ISENABLE, MEMO, CREATE_BY, CREATE_DT, UPDATE_BY, UPDATE_DT, SSOID)
VALUES ('1200119390', '管理员', 'admin', NULL, '21218cca77804d2ba1922c33e0151105', '21218cca77804d2ba1922c33e0151105', 1, '649536128@QQ.COM', '8888888', '8888888', NULL, NULL, NULL, 1, '610303691230381', 'ORIG', SYSDATE(), '1200298057', SYSDATE(), '11138')
;


commit
; 