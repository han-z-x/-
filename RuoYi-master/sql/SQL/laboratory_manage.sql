-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: laboratory_manage
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `device`
--

DROP TABLE IF EXISTS `device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `device` (
  `dv_id` int NOT NULL AUTO_INCREMENT COMMENT '设备编号',
  `dv_sort` char(20) NOT NULL COMMENT '设备类别',
  `dv_title` char(20) NOT NULL COMMENT '设备名称',
  `dv_type` char(20) NOT NULL COMMENT '设备型号',
  `dv_specification` char(20) DEFAULT NULL COMMENT '设备规格',
  `dv_price` int NOT NULL COMMENT '设备单价',
  `dv_number` int NOT NULL COMMENT '数量',
  `dv_purchase_date` date NOT NULL COMMENT '购置日期',
  `dv_producer` char(20) NOT NULL COMMENT '生产厂商',
  `dv_manager` bigint NOT NULL COMMENT '经办人',
  `dv_status` int NOT NULL DEFAULT '0' COMMENT '设备状态',
  PRIMARY KEY (`dv_id`),
  KEY `device___fk_manager` (`dv_manager`),
  CONSTRAINT `device___fk_manager` FOREIGN KEY (`dv_manager`) REFERENCES `sys_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='实验室设备';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device`
--

LOCK TABLES `device` WRITE;
/*!40000 ALTER TABLE `device` DISABLE KEYS */;
INSERT INTO `device` VALUES (1,'大型器械','双料高级天文望远镜','L001','2m',8848,1,'2022-06-18','哈药六厂',100,0),(3,'精密仪器','超微蓝猫显微镜','L004','2mm',648,2,'2022-06-18','哈药六厂',101,0),(4,'精密仪器','干细胞娃娃机','C017','10μm',300000,1,'2022-06-18','卧底硅硅实验室',101,0),(5,'废品','破浪量杯','T001','1L',1,15,'2022-06-25','纯碱拉机厂',100,2);
/*!40000 ALTER TABLE `device` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_table`
--

DROP TABLE IF EXISTS `gen_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gen_table` (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作 sub主子表操作）',
  `package_name` varchar(100) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='代码生成业务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table`
--

LOCK TABLES `gen_table` WRITE;
/*!40000 ALTER TABLE `gen_table` DISABLE KEYS */;
INSERT INTO `gen_table` VALUES (1,'device','实验室设备','',NULL,'Device','crud','com.ruoyi.lab','lab','device','设备管理','ruoyi','0','/','{\"parentMenuId\":\"2000\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"实验室设备管理\",\"treeCode\":\"\"}','admin','2022-06-18 21:12:17','','2022-06-18 23:18:37',''),(2,'purchase_request','购买申请','',NULL,'PurchaseRequest','crud','com.ruoyi.lab','lab','request','购买申请管理','ruoyi','0','/','{\"parentMenuId\":\"2000\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"实验室设备管理\",\"treeCode\":\"\"}','admin','2022-06-18 21:12:17','','2022-06-18 21:15:33',''),(3,'repairment','修理记录','',NULL,'Repairment','crud','com.ruoyi.lab','lab','repairment','修理记录管理','ruoyi','0','/','{\"parentMenuId\":\"2000\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"实验室设备管理\",\"treeCode\":\"\"}','admin','2022-06-18 21:12:17','','2022-06-18 23:00:43',''),(4,'scrap','报废记录','',NULL,'Scrap','crud','com.ruoyi.lab','lab','scrap','报废记录管理','ruoyi','0','/','{\"parentMenuId\":\"2000\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"实验室设备管理\",\"treeCode\":\"\"}','admin','2022-06-18 21:12:17','','2022-06-18 23:22:45','');
/*!40000 ALTER TABLE `gen_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_table_column`
--

DROP TABLE IF EXISTS `gen_table_column`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gen_table_column` (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) DEFAULT '' COMMENT '字典类型',
  `sort` int DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='代码生成业务表字段';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table_column`
--

LOCK TABLES `gen_table_column` WRITE;
/*!40000 ALTER TABLE `gen_table_column` DISABLE KEYS */;
INSERT INTO `gen_table_column` VALUES (1,'1','dv_id','设备编号','int','Long','dvId','1','1',NULL,'1',NULL,NULL,'1','EQ','input','',1,'admin','2022-06-18 21:12:17',NULL,'2022-06-18 23:18:37'),(2,'1','dv_sort','设备类别','char(20)','String','dvSort','0','0','1','1','1','1','1','EQ','input','',2,'admin','2022-06-18 21:12:17',NULL,'2022-06-18 23:18:37'),(3,'1','dv_title','设备名称','char(20)','String','dvTitle','0','0','1','1','1','1','1','EQ','input','',3,'admin','2022-06-18 21:12:17',NULL,'2022-06-18 23:18:37'),(4,'1','dv_type','设备型号','char(20)','String','dvType','0','0','1','1','1','1','1','EQ','input','',4,'admin','2022-06-18 21:12:17',NULL,'2022-06-18 23:18:37'),(5,'1','dv_specification','设备规格','char(20)','String','dvSpecification','0','0',NULL,'1','1','1','1','EQ','input','',5,'admin','2022-06-18 21:12:17',NULL,'2022-06-18 23:18:37'),(6,'1','dv_price','设备单价','int','Long','dvPrice','0','0','1','1','1','1','1','EQ','input','',6,'admin','2022-06-18 21:12:17',NULL,'2022-06-18 23:18:37'),(7,'1','dv_number','数量','int','Long','dvNumber','0','0','1','1','1','1','1','EQ','input','',7,'admin','2022-06-18 21:12:17',NULL,'2022-06-18 23:18:37'),(8,'1','dv_purchase_date','购置日期','date','Date','dvPurchaseDate','0','0','1','1','1','1','1','EQ','datetime','',8,'admin','2022-06-18 21:12:17',NULL,'2022-06-18 23:18:37'),(9,'1','dv_producer','生产厂商','char(20)','String','dvProducer','0','0','1','1','1','1','1','EQ','input','',9,'admin','2022-06-18 21:12:17',NULL,'2022-06-18 23:18:37'),(10,'1','dv_manager','经办人','bigint','Long','dvManager','0','0','1','1','1','1','1','EQ','input','',10,'admin','2022-06-18 21:12:17',NULL,'2022-06-18 23:18:37'),(11,'1','dv_status','设备状态','int','Long','dvStatus','0','0','1','1','1','1','1','EQ','radio','lab_device_status',11,'admin','2022-06-18 21:12:17',NULL,'2022-06-18 23:18:37'),(12,'2','pr_id','购买申请编号','int','Long','prId','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2022-06-18 21:12:17',NULL,'2022-06-18 21:15:33'),(13,'2','pr_title','申请购买设备名称','char(20)','String','prTitle','0','0','1','1','1','1','1','EQ','input','',2,'admin','2022-06-18 21:12:17',NULL,'2022-06-18 21:15:33'),(14,'2','pr_number','申请购买数量','int','Long','prNumber','0','0','1','1','1','1','1','EQ','input','',3,'admin','2022-06-18 21:12:17',NULL,'2022-06-18 21:15:33'),(15,'2','pr_reason','申请购买原因','char(255)','String','prReason','0','0','1','1','1','1','1','EQ','input','',4,'admin','2022-06-18 21:12:17',NULL,'2022-06-18 21:15:33'),(16,'2','pr_requester','申请人','bigint','Long','prRequester','0','0','1','1','1','1','1','EQ','input','',5,'admin','2022-06-18 21:12:17',NULL,'2022-06-18 21:15:33'),(17,'2','pr_request_date','申请时间','date','Date','prRequestDate','0','0','1','1','1','1','1','EQ','datetime','',6,'admin','2022-06-18 21:12:17',NULL,'2022-06-18 21:15:33'),(18,'2','pr_status','申请状态','int','Long','prStatus','0','0','1','1','1','1','1','EQ','radio','',7,'admin','2022-06-18 21:12:17',NULL,'2022-06-18 21:15:33'),(19,'3','rp_id','修理记录编号','int','Long','rpId','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2022-06-18 21:12:17',NULL,'2022-06-18 23:00:43'),(20,'3','rp_device','待修理设备','int','Long','rpDevice','0','0','1','1','1','1','1','EQ','input','',2,'admin','2022-06-18 21:12:17',NULL,'2022-06-18 23:00:43'),(21,'3','rp_liable_person','责任人','bigint','Long','rpLiablePerson','0','0','1','1','1','1','1','EQ','input','',3,'admin','2022-06-18 21:12:17',NULL,'2022-06-18 23:00:43'),(22,'3','rp_factory','修理厂家','char(20)','String','rpFactory','0','0','1','1','1','1','1','EQ','input','',4,'admin','2022-06-18 21:12:17',NULL,'2022-06-18 23:00:43'),(23,'3','rp_price','修理费用','int','Long','rpPrice','0','0',NULL,'1','1','1','1','EQ','input','',5,'admin','2022-06-18 21:12:17',NULL,'2022-06-18 23:00:43'),(24,'3','rp_status','修理状态','int','Long','rpStatus','0','0','1','1','1','1','1','EQ','radio','lab_repairment_status',6,'admin','2022-06-18 21:12:17',NULL,'2022-06-18 23:00:43'),(25,'3','rp_date','修理完成日期','date','Date','rpDate','0','0',NULL,'1','1','1','1','EQ','datetime','',7,'admin','2022-06-18 21:12:17',NULL,'2022-06-18 23:00:43'),(26,'4','sc_id','报废记录编号','int','Long','scId','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2022-06-18 21:12:17',NULL,'2022-06-18 23:22:45'),(27,'4','sc_device','报废设备','int','Long','scDevice','0','0','1','1','1','1','1','EQ','input','',2,'admin','2022-06-18 21:12:17',NULL,'2022-06-18 23:22:45'),(28,'4','sc_status','报废状态确认','int','Long','scStatus','0','0','1','1','1','1','1','EQ','radio','',3,'admin','2022-06-18 21:12:17',NULL,'2022-06-18 23:22:45'),(29,'4','sc_date','报废日期','date','Date','scDate','0','0',NULL,'1','1','1','1','EQ','datetime','',4,'admin','2022-06-18 21:12:17',NULL,'2022-06-18 23:22:45');
/*!40000 ALTER TABLE `gen_table_column` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_request`
--

DROP TABLE IF EXISTS `purchase_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchase_request` (
  `pr_id` int NOT NULL AUTO_INCREMENT COMMENT '购买申请编号',
  `pr_title` char(20) NOT NULL COMMENT '申请购买设备名称',
  `pr_number` int NOT NULL COMMENT '申请购买数量',
  `pr_reason` char(255) NOT NULL COMMENT '申请购买原因',
  `pr_requester` bigint NOT NULL COMMENT '申请人',
  `pr_request_date` date NOT NULL COMMENT '申请时间',
  `pr_status` int NOT NULL DEFAULT '0' COMMENT '申请状态',
  PRIMARY KEY (`pr_id`),
  KEY `purchase_request___fk_requester` (`pr_requester`),
  CONSTRAINT `purchase_request___fk_requester` FOREIGN KEY (`pr_requester`) REFERENCES `sys_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='购买申请';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_request`
--

LOCK TABLES `purchase_request` WRITE;
/*!40000 ALTER TABLE `purchase_request` DISABLE KEYS */;
INSERT INTO `purchase_request` VALUES (1,'挖掘机',1,'实验室应该扩建',100,'2022-06-18',0);
/*!40000 ALTER TABLE `purchase_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_blob_triggers`
--

DROP TABLE IF EXISTS `qrtz_blob_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_blob_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Blob类型的触发器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_blob_triggers`
--

LOCK TABLES `qrtz_blob_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_blob_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_blob_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_calendars`
--

DROP TABLE IF EXISTS `qrtz_calendars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_calendars` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`,`calendar_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='日历信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_calendars`
--

LOCK TABLES `qrtz_calendars` WRITE;
/*!40000 ALTER TABLE `qrtz_calendars` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_calendars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_cron_triggers`
--

DROP TABLE IF EXISTS `qrtz_cron_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_cron_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Cron类型的触发器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_cron_triggers`
--

LOCK TABLES `qrtz_cron_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_cron_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_cron_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_fired_triggers`
--

DROP TABLE IF EXISTS `qrtz_fired_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_fired_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint NOT NULL COMMENT '触发的时间',
  `sched_time` bigint NOT NULL COMMENT '定时器制定的时间',
  `priority` int NOT NULL COMMENT '优先级',
  `state` varchar(16) NOT NULL COMMENT '状态',
  `job_name` varchar(200) DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`,`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='已触发的触发器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_fired_triggers`
--

LOCK TABLES `qrtz_fired_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_fired_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_fired_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_job_details`
--

DROP TABLE IF EXISTS `qrtz_job_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_job_details` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) NOT NULL COMMENT '任务组名',
  `description` varchar(250) DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`,`job_name`,`job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='任务详细信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_job_details`
--

LOCK TABLES `qrtz_job_details` WRITE;
/*!40000 ALTER TABLE `qrtz_job_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_job_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_locks`
--

DROP TABLE IF EXISTS `qrtz_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_locks` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`,`lock_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='存储的悲观锁信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_locks`
--

LOCK TABLES `qrtz_locks` WRITE;
/*!40000 ALTER TABLE `qrtz_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_paused_trigger_grps`
--

DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`,`trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='暂停的触发器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_paused_trigger_grps`
--

LOCK TABLES `qrtz_paused_trigger_grps` WRITE;
/*!40000 ALTER TABLE `qrtz_paused_trigger_grps` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_paused_trigger_grps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_scheduler_state`
--

DROP TABLE IF EXISTS `qrtz_scheduler_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_scheduler_state` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`,`instance_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='调度器状态表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_scheduler_state`
--

LOCK TABLES `qrtz_scheduler_state` WRITE;
/*!40000 ALTER TABLE `qrtz_scheduler_state` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_scheduler_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_simple_triggers`
--

DROP TABLE IF EXISTS `qrtz_simple_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_simple_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='简单触发器的信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_simple_triggers`
--

LOCK TABLES `qrtz_simple_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_simple_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_simple_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_simprop_triggers`
--

DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_simprop_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='同步机制的行锁表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_simprop_triggers`
--

LOCK TABLES `qrtz_simprop_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_simprop_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_simprop_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_triggers`
--

DROP TABLE IF EXISTS `qrtz_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) NOT NULL COMMENT '触发器的类型',
  `start_time` bigint NOT NULL COMMENT '开始时间',
  `end_time` bigint DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  KEY `sched_name` (`sched_name`,`job_name`,`job_group`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='触发器详细信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_triggers`
--

LOCK TABLES `qrtz_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repairment`
--

DROP TABLE IF EXISTS `repairment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `repairment` (
  `rp_id` int NOT NULL AUTO_INCREMENT COMMENT '修理记录编号',
  `rp_device` int NOT NULL COMMENT '待修理设备',
  `rp_liable_person` bigint NOT NULL COMMENT '责任人',
  `rp_factory` char(20) NOT NULL COMMENT '修理厂家',
  `rp_price` int DEFAULT NULL COMMENT '修理费用',
  `rp_status` int NOT NULL DEFAULT '0' COMMENT '修理状态',
  `rp_date` date DEFAULT NULL COMMENT '修理完成日期',
  PRIMARY KEY (`rp_id`),
  KEY `repairment___fk_r_device` (`rp_device`),
  KEY `repairment___fk_liable_person` (`rp_liable_person`),
  CONSTRAINT `repairment___fk_liable_person` FOREIGN KEY (`rp_liable_person`) REFERENCES `sys_user` (`user_id`),
  CONSTRAINT `repairment___fk_r_device` FOREIGN KEY (`rp_device`) REFERENCES `device` (`dv_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='修理记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repairment`
--

LOCK TABLES `repairment` WRITE;
/*!40000 ALTER TABLE `repairment` DISABLE KEYS */;
INSERT INTO `repairment` VALUES (1,4,101,'硅硅谷',50,1,'2022-06-22'),(2,1,100,'哈药六厂',50,1,'2022-06-23'),(3,5,100,'强酸拉机厂',NULL,2,NULL);
/*!40000 ALTER TABLE `repairment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scrap`
--

DROP TABLE IF EXISTS `scrap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scrap` (
  `sc_id` int NOT NULL AUTO_INCREMENT COMMENT '报废记录编号',
  `sc_device` int NOT NULL COMMENT '报废设备',
  `sc_status` int NOT NULL DEFAULT '0' COMMENT '报废状态确认',
  `sc_date` date DEFAULT NULL COMMENT '报废日期',
  PRIMARY KEY (`sc_id`),
  KEY `scrap___fk_sc_device` (`sc_device`),
  CONSTRAINT `scrap___fk_sc_device` FOREIGN KEY (`sc_device`) REFERENCES `device` (`dv_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='报废记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scrap`
--

LOCK TABLES `scrap` WRITE;
/*!40000 ALTER TABLE `scrap` DISABLE KEYS */;
INSERT INTO `scrap` VALUES (1,4,0,NULL),(2,5,1,'2022-06-23');
/*!40000 ALTER TABLE `scrap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_config`
--

DROP TABLE IF EXISTS `sys_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_config` (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='参数配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_config`
--

LOCK TABLES `sys_config` WRITE;
/*!40000 ALTER TABLE `sys_config` DISABLE KEYS */;
INSERT INTO `sys_config` VALUES (1,'主框架页-默认皮肤样式名称','sys.index.skinName','skin-blue','Y','admin','2022-06-18 19:13:42','',NULL,'蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow'),(2,'用户管理-账号初始密码','sys.user.initPassword','123456','Y','admin','2022-06-18 19:13:42','',NULL,'初始化密码 123456'),(3,'主框架页-侧边栏主题','sys.index.sideTheme','theme-dark','Y','admin','2022-06-18 19:13:42','',NULL,'深黑主题theme-dark，浅色主题theme-light，深蓝主题theme-blue'),(4,'账号自助-是否开启用户注册功能','sys.account.registerUser','false','Y','admin','2022-06-18 19:13:42','',NULL,'是否开启注册用户功能（true开启，false关闭）'),(5,'用户管理-密码字符范围','sys.account.chrtype','0','Y','admin','2022-06-18 19:13:42','',NULL,'默认任意字符范围，0任意（密码可以输入任意字符），1数字（密码只能为0-9数字），2英文字母（密码只能为a-z和A-Z字母），3字母和数字（密码必须包含字母，数字）,4字母数字和特殊字符（目前支持的特殊字符包括：~!@#$%^&*()-=_+）'),(6,'用户管理-初始密码修改策略','sys.account.initPasswordModify','0','Y','admin','2022-06-18 19:13:42','',NULL,'0：初始密码修改策略关闭，没有任何提示，1：提醒用户，如果未修改初始密码，则在登录时就会提醒修改密码对话框'),(7,'用户管理-账号密码更新周期','sys.account.passwordValidateDays','0','Y','admin','2022-06-18 19:13:42','',NULL,'密码更新周期（填写数字，数据初始化值为0不限制，若修改必须为大于0小于365的正整数），如果超过这个周期登录系统时，则在登录时就会提醒修改密码对话框'),(8,'主框架页-菜单导航显示风格','sys.index.menuStyle','default','Y','admin','2022-06-18 19:13:42','',NULL,'菜单导航显示风格（default为左侧导航菜单，topnav为顶部导航菜单）'),(9,'主框架页-是否开启页脚','sys.index.footer','true','Y','admin','2022-06-18 19:13:42','',NULL,'是否开启底部页脚显示（true显示，false隐藏）'),(10,'主框架页-是否开启页签','sys.index.tagsView','true','Y','admin','2022-06-18 19:13:42','',NULL,'是否开启菜单多页签显示（true显示，false隐藏）');
/*!40000 ALTER TABLE `sys_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dept`
--

DROP TABLE IF EXISTS `sys_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dept` (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='部门表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dept`
--

LOCK TABLES `sys_dept` WRITE;
/*!40000 ALTER TABLE `sys_dept` DISABLE KEYS */;
INSERT INTO `sys_dept` VALUES (100,0,'0','若依科技',0,'若依','15888888888','ry@qq.com','0','0','admin','2022-06-18 19:13:41','',NULL),(101,100,'0,100','深圳总公司',1,'若依','15888888888','ry@qq.com','0','0','admin','2022-06-18 19:13:41','',NULL),(102,100,'0,100','长沙分公司',2,'若依','15888888888','ry@qq.com','0','0','admin','2022-06-18 19:13:41','',NULL),(103,101,'0,100,101','研发部门',1,'若依','15888888888','ry@qq.com','0','0','admin','2022-06-18 19:13:41','',NULL),(104,101,'0,100,101','市场部门',2,'若依','15888888888','ry@qq.com','0','0','admin','2022-06-18 19:13:41','',NULL),(105,101,'0,100,101','测试部门',3,'若依','15888888888','ry@qq.com','0','0','admin','2022-06-18 19:13:41','',NULL),(106,101,'0,100,101','财务部门',4,'若依','15888888888','ry@qq.com','0','0','admin','2022-06-18 19:13:41','',NULL),(107,101,'0,100,101','运维部门',5,'若依','15888888888','ry@qq.com','0','0','admin','2022-06-18 19:13:41','',NULL),(108,102,'0,100,102','市场部门',1,'若依','15888888888','ry@qq.com','0','0','admin','2022-06-18 19:13:41','',NULL),(109,102,'0,100,102','财务部门',2,'若依','15888888888','ry@qq.com','0','0','admin','2022-06-18 19:13:41','',NULL);
/*!40000 ALTER TABLE `sys_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_data`
--

DROP TABLE IF EXISTS `sys_dict_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='字典数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_data`
--

LOCK TABLES `sys_dict_data` WRITE;
/*!40000 ALTER TABLE `sys_dict_data` DISABLE KEYS */;
INSERT INTO `sys_dict_data` VALUES (1,1,'男','0','sys_user_sex','','','Y','0','admin','2022-06-18 19:13:42','',NULL,'性别男'),(2,2,'女','1','sys_user_sex','','','N','0','admin','2022-06-18 19:13:42','',NULL,'性别女'),(3,3,'未知','2','sys_user_sex','','','N','0','admin','2022-06-18 19:13:42','',NULL,'性别未知'),(4,1,'显示','0','sys_show_hide','','primary','Y','0','admin','2022-06-18 19:13:42','',NULL,'显示菜单'),(5,2,'隐藏','1','sys_show_hide','','danger','N','0','admin','2022-06-18 19:13:42','',NULL,'隐藏菜单'),(6,1,'正常','0','sys_normal_disable','','primary','Y','0','admin','2022-06-18 19:13:42','',NULL,'正常状态'),(7,2,'停用','1','sys_normal_disable','','danger','N','0','admin','2022-06-18 19:13:42','',NULL,'停用状态'),(8,1,'正常','0','sys_job_status','','primary','Y','0','admin','2022-06-18 19:13:42','',NULL,'正常状态'),(9,2,'暂停','1','sys_job_status','','danger','N','0','admin','2022-06-18 19:13:42','',NULL,'停用状态'),(10,1,'默认','DEFAULT','sys_job_group','','','Y','0','admin','2022-06-18 19:13:42','',NULL,'默认分组'),(11,2,'系统','SYSTEM','sys_job_group','','','N','0','admin','2022-06-18 19:13:42','',NULL,'系统分组'),(12,1,'是','Y','sys_yes_no','','primary','Y','0','admin','2022-06-18 19:13:42','',NULL,'系统默认是'),(13,2,'否','N','sys_yes_no','','danger','N','0','admin','2022-06-18 19:13:42','',NULL,'系统默认否'),(14,1,'通知','1','sys_notice_type','','warning','Y','0','admin','2022-06-18 19:13:42','',NULL,'通知'),(15,2,'公告','2','sys_notice_type','','success','N','0','admin','2022-06-18 19:13:42','',NULL,'公告'),(16,1,'正常','0','sys_notice_status','','primary','Y','0','admin','2022-06-18 19:13:42','',NULL,'正常状态'),(17,2,'关闭','1','sys_notice_status','','danger','N','0','admin','2022-06-18 19:13:42','',NULL,'关闭状态'),(18,99,'其他','0','sys_oper_type','','info','N','0','admin','2022-06-18 19:13:42','',NULL,'其他操作'),(19,1,'新增','1','sys_oper_type','','info','N','0','admin','2022-06-18 19:13:42','',NULL,'新增操作'),(20,2,'修改','2','sys_oper_type','','info','N','0','admin','2022-06-18 19:13:42','',NULL,'修改操作'),(21,3,'删除','3','sys_oper_type','','danger','N','0','admin','2022-06-18 19:13:42','',NULL,'删除操作'),(22,4,'授权','4','sys_oper_type','','primary','N','0','admin','2022-06-18 19:13:42','',NULL,'授权操作'),(23,5,'导出','5','sys_oper_type','','warning','N','0','admin','2022-06-18 19:13:42','',NULL,'导出操作'),(24,6,'导入','6','sys_oper_type','','warning','N','0','admin','2022-06-18 19:13:42','',NULL,'导入操作'),(25,7,'强退','7','sys_oper_type','','danger','N','0','admin','2022-06-18 19:13:42','',NULL,'强退操作'),(26,8,'生成代码','8','sys_oper_type','','warning','N','0','admin','2022-06-18 19:13:42','',NULL,'生成操作'),(27,9,'清空数据','9','sys_oper_type','','danger','N','0','admin','2022-06-18 19:13:42','',NULL,'清空操作'),(28,1,'成功','0','sys_common_status','','primary','N','0','admin','2022-06-18 19:13:42','',NULL,'正常状态'),(29,2,'失败','1','sys_common_status','','danger','N','0','admin','2022-06-18 19:13:42','',NULL,'停用状态'),(100,1,'正常','0','lab_device_status','','info','Y','0','admin','2022-06-18 22:37:28','admin','2022-06-18 22:38:15',''),(101,2,'待维修','1','lab_device_status',NULL,'warning','Y','0','admin','2022-06-18 22:37:51','',NULL,NULL),(102,3,'报废','2','lab_device_status',NULL,'danger','Y','0','admin','2022-06-18 22:38:09','',NULL,NULL),(103,1,'修理中','0','lab_repairment_status','','warning','Y','0','admin','2022-06-18 22:39:39','admin','2022-06-18 22:40:01',''),(104,2,'修理完成','1','lab_repairment_status',NULL,'info','Y','0','admin','2022-06-18 22:40:13','',NULL,NULL),(105,1,'待确认报废','0','lab_scrap_status',NULL,'warning','Y','0','admin','2022-06-18 22:41:13','',NULL,NULL),(106,2,'已报废','1','lab_scrap_status',NULL,'danger','Y','0','admin','2022-06-18 22:41:25','',NULL,NULL),(107,1,'审核中','0','lab_purchase_request_status',NULL,'primary','Y','0','admin','2022-06-18 23:03:05','',NULL,NULL),(108,2,'已通过','1','lab_purchase_request_status',NULL,'success','Y','0','admin','2022-06-18 23:03:15','',NULL,NULL),(110,3,'已报废','2','lab_repairment_status',NULL,'danger','Y','0','admin','2022-06-22 22:11:30','',NULL,NULL);
/*!40000 ALTER TABLE `sys_dict_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_type`
--

DROP TABLE IF EXISTS `sys_dict_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='字典类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_type`
--

LOCK TABLES `sys_dict_type` WRITE;
/*!40000 ALTER TABLE `sys_dict_type` DISABLE KEYS */;
INSERT INTO `sys_dict_type` VALUES (1,'用户性别','sys_user_sex','0','admin','2022-06-18 19:13:42','',NULL,'用户性别列表'),(2,'菜单状态','sys_show_hide','0','admin','2022-06-18 19:13:42','',NULL,'菜单状态列表'),(3,'系统开关','sys_normal_disable','0','admin','2022-06-18 19:13:42','',NULL,'系统开关列表'),(4,'任务状态','sys_job_status','0','admin','2022-06-18 19:13:42','',NULL,'任务状态列表'),(5,'任务分组','sys_job_group','0','admin','2022-06-18 19:13:42','',NULL,'任务分组列表'),(6,'系统是否','sys_yes_no','0','admin','2022-06-18 19:13:42','',NULL,'系统是否列表'),(7,'通知类型','sys_notice_type','0','admin','2022-06-18 19:13:42','',NULL,'通知类型列表'),(8,'通知状态','sys_notice_status','0','admin','2022-06-18 19:13:42','',NULL,'通知状态列表'),(9,'操作类型','sys_oper_type','0','admin','2022-06-18 19:13:42','',NULL,'操作类型列表'),(10,'系统状态','sys_common_status','0','admin','2022-06-18 19:13:42','',NULL,'登录状态列表'),(100,'设备状态','lab_device_status','0','admin','2022-06-18 22:36:53','admin','2022-06-18 22:43:02',''),(101,'修理状态','lab_repairment_status','0','admin','2022-06-18 22:39:10','admin','2022-06-18 22:43:09',''),(102,'报废状态确认','lab_scrap_status','0','admin','2022-06-18 22:40:40','admin','2022-06-18 22:43:14',''),(103,'购买申请状态','lab_purchase_request_status','0','admin','2022-06-18 23:02:34','admin','2022-06-18 23:04:54','');
/*!40000 ALTER TABLE `sys_dict_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_job`
--

DROP TABLE IF EXISTS `sys_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_job` (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='定时任务调度表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job`
--

LOCK TABLES `sys_job` WRITE;
/*!40000 ALTER TABLE `sys_job` DISABLE KEYS */;
INSERT INTO `sys_job` VALUES (1,'系统默认（无参）','DEFAULT','ryTask.ryNoParams','0/10 * * * * ?','3','1','1','admin','2022-06-18 19:13:42','',NULL,''),(2,'系统默认（有参）','DEFAULT','ryTask.ryParams(\'ry\')','0/15 * * * * ?','3','1','1','admin','2022-06-18 19:13:42','',NULL,''),(3,'系统默认（多参）','DEFAULT','ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)','0/20 * * * * ?','3','1','1','admin','2022-06-18 19:13:42','',NULL,'');
/*!40000 ALTER TABLE `sys_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_job_log`
--

DROP TABLE IF EXISTS `sys_job_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_job_log` (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='定时任务调度日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job_log`
--

LOCK TABLES `sys_job_log` WRITE;
/*!40000 ALTER TABLE `sys_job_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_job_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_logininfor`
--

DROP TABLE IF EXISTS `sys_logininfor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(128) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=148 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统访问记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_logininfor`
--

LOCK TABLES `sys_logininfor` WRITE;
/*!40000 ALTER TABLE `sys_logininfor` DISABLE KEYS */;
INSERT INTO `sys_logininfor` VALUES (100,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-06-18 21:11:31'),(101,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-06-18 21:31:14'),(102,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-06-18 22:36:27'),(103,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-06-18 22:42:05'),(104,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-06-18 22:56:39'),(105,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-06-18 22:57:49'),(106,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-06-18 23:08:39'),(107,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-06-18 23:13:19'),(108,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-06-18 23:19:12'),(109,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-06-18 23:20:16'),(110,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-06-18 23:25:32'),(111,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-06-18 23:27:51'),(112,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-06-20 18:52:45'),(113,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-06-20 18:54:47'),(114,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-06-20 18:58:44'),(115,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-06-20 19:14:39'),(116,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-06-20 19:30:32'),(117,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-06-20 20:31:39'),(118,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-06-20 20:56:27'),(119,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-06-21 12:47:18'),(120,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-06-22 21:24:36'),(121,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-06-22 21:39:18'),(122,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-06-22 21:45:31'),(123,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-06-22 21:52:48'),(124,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','1','验证码错误','2022-06-22 22:04:05'),(125,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-06-22 22:04:07'),(126,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-06-22 22:05:59'),(127,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-06-22 22:07:25'),(128,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-06-22 22:09:12'),(129,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-06-22 22:14:38'),(130,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-06-22 22:28:21'),(131,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-06-22 22:32:46'),(132,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','1','验证码错误','2022-06-22 22:33:49'),(133,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-06-22 22:33:51'),(134,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','退出成功','2022-06-22 22:53:51'),(135,'worker1','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-06-22 22:54:03'),(136,'worker1','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-06-22 22:55:53'),(137,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-06-22 22:57:46'),(138,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-06-22 23:01:22'),(139,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-06-22 23:02:48'),(140,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-06-22 23:03:33'),(141,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','1','验证码错误','2022-06-22 23:04:31'),(142,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-06-22 23:04:33'),(143,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-06-22 23:05:16'),(144,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-06-22 23:05:53'),(145,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','1','验证码错误','2022-06-22 23:08:57'),(146,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-06-22 23:08:59'),(147,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-06-22 23:09:48');
/*!40000 ALTER TABLE `sys_logininfor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_menu` (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `url` varchar(200) DEFAULT '#' COMMENT '请求地址',
  `target` varchar(20) DEFAULT '' COMMENT '打开方式（menuItem页签 menuBlank新窗口）',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `is_refresh` char(1) DEFAULT '1' COMMENT '是否刷新（0刷新 1不刷新）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2026 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='菜单权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (1,'系统管理',0,1,'#','','M','0','1','','fa fa-gear','admin','2022-06-18 19:13:41','',NULL,'系统管理目录'),(2,'系统监控',0,2,'#','','M','0','1','','fa fa-video-camera','admin','2022-06-18 19:13:41','',NULL,'系统监控目录'),(3,'系统工具',0,3,'#','','M','0','1','','fa fa-bars','admin','2022-06-18 19:13:41','',NULL,'系统工具目录'),(4,'若依官网',0,4,'http://ruoyi.vip','menuBlank','C','0','1','','fa fa-location-arrow','admin','2022-06-18 19:13:41','',NULL,'若依官网地址'),(100,'用户管理',1,1,'/system/user','','C','0','1','system:user:view','fa fa-user-o','admin','2022-06-18 19:13:41','',NULL,'用户管理菜单'),(101,'角色管理',1,2,'/system/role','','C','0','1','system:role:view','fa fa-user-secret','admin','2022-06-18 19:13:41','',NULL,'角色管理菜单'),(102,'菜单管理',1,3,'/system/menu','','C','0','1','system:menu:view','fa fa-th-list','admin','2022-06-18 19:13:41','',NULL,'菜单管理菜单'),(103,'部门管理',1,4,'/system/dept','','C','0','1','system:dept:view','fa fa-outdent','admin','2022-06-18 19:13:41','',NULL,'部门管理菜单'),(104,'岗位管理',1,5,'/system/post','','C','0','1','system:post:view','fa fa-address-card-o','admin','2022-06-18 19:13:41','',NULL,'岗位管理菜单'),(105,'字典管理',1,6,'/system/dict','','C','0','1','system:dict:view','fa fa-bookmark-o','admin','2022-06-18 19:13:41','',NULL,'字典管理菜单'),(106,'参数设置',1,7,'/system/config','','C','0','1','system:config:view','fa fa-sun-o','admin','2022-06-18 19:13:41','',NULL,'参数设置菜单'),(107,'通知公告',1,8,'/system/notice','','C','0','1','system:notice:view','fa fa-bullhorn','admin','2022-06-18 19:13:41','',NULL,'通知公告菜单'),(108,'日志管理',1,9,'#','','M','0','1','','fa fa-pencil-square-o','admin','2022-06-18 19:13:41','',NULL,'日志管理菜单'),(109,'在线用户',2,1,'/monitor/online','','C','0','1','monitor:online:view','fa fa-user-circle','admin','2022-06-18 19:13:41','',NULL,'在线用户菜单'),(110,'定时任务',2,2,'/monitor/job','','C','0','1','monitor:job:view','fa fa-tasks','admin','2022-06-18 19:13:41','',NULL,'定时任务菜单'),(111,'数据监控',2,3,'/monitor/data','','C','0','1','monitor:data:view','fa fa-bug','admin','2022-06-18 19:13:41','',NULL,'数据监控菜单'),(112,'服务监控',2,4,'/monitor/server','','C','0','1','monitor:server:view','fa fa-server','admin','2022-06-18 19:13:41','',NULL,'服务监控菜单'),(113,'缓存监控',2,5,'/monitor/cache','','C','0','1','monitor:cache:view','fa fa-cube','admin','2022-06-18 19:13:41','',NULL,'缓存监控菜单'),(114,'表单构建',3,1,'/tool/build','','C','0','1','tool:build:view','fa fa-wpforms','admin','2022-06-18 19:13:41','',NULL,'表单构建菜单'),(115,'代码生成',3,2,'/tool/gen','','C','0','1','tool:gen:view','fa fa-code','admin','2022-06-18 19:13:41','',NULL,'代码生成菜单'),(116,'系统接口',3,3,'/tool/swagger','','C','0','1','tool:swagger:view','fa fa-gg','admin','2022-06-18 19:13:41','',NULL,'系统接口菜单'),(500,'操作日志',108,1,'/monitor/operlog','','C','0','1','monitor:operlog:view','fa fa-address-book','admin','2022-06-18 19:13:41','',NULL,'操作日志菜单'),(501,'登录日志',108,2,'/monitor/logininfor','','C','0','1','monitor:logininfor:view','fa fa-file-image-o','admin','2022-06-18 19:13:41','',NULL,'登录日志菜单'),(1000,'用户查询',100,1,'#','','F','0','1','system:user:list','#','admin','2022-06-18 19:13:41','',NULL,''),(1001,'用户新增',100,2,'#','','F','0','1','system:user:add','#','admin','2022-06-18 19:13:41','',NULL,''),(1002,'用户修改',100,3,'#','','F','0','1','system:user:edit','#','admin','2022-06-18 19:13:41','',NULL,''),(1003,'用户删除',100,4,'#','','F','0','1','system:user:remove','#','admin','2022-06-18 19:13:41','',NULL,''),(1004,'用户导出',100,5,'#','','F','0','1','system:user:export','#','admin','2022-06-18 19:13:41','',NULL,''),(1005,'用户导入',100,6,'#','','F','0','1','system:user:import','#','admin','2022-06-18 19:13:41','',NULL,''),(1006,'重置密码',100,7,'#','','F','0','1','system:user:resetPwd','#','admin','2022-06-18 19:13:41','',NULL,''),(1007,'角色查询',101,1,'#','','F','0','1','system:role:list','#','admin','2022-06-18 19:13:41','',NULL,''),(1008,'角色新增',101,2,'#','','F','0','1','system:role:add','#','admin','2022-06-18 19:13:41','',NULL,''),(1009,'角色修改',101,3,'#','','F','0','1','system:role:edit','#','admin','2022-06-18 19:13:41','',NULL,''),(1010,'角色删除',101,4,'#','','F','0','1','system:role:remove','#','admin','2022-06-18 19:13:41','',NULL,''),(1011,'角色导出',101,5,'#','','F','0','1','system:role:export','#','admin','2022-06-18 19:13:41','',NULL,''),(1012,'菜单查询',102,1,'#','','F','0','1','system:menu:list','#','admin','2022-06-18 19:13:41','',NULL,''),(1013,'菜单新增',102,2,'#','','F','0','1','system:menu:add','#','admin','2022-06-18 19:13:41','',NULL,''),(1014,'菜单修改',102,3,'#','','F','0','1','system:menu:edit','#','admin','2022-06-18 19:13:41','',NULL,''),(1015,'菜单删除',102,4,'#','','F','0','1','system:menu:remove','#','admin','2022-06-18 19:13:41','',NULL,''),(1016,'部门查询',103,1,'#','','F','0','1','system:dept:list','#','admin','2022-06-18 19:13:41','',NULL,''),(1017,'部门新增',103,2,'#','','F','0','1','system:dept:add','#','admin','2022-06-18 19:13:41','',NULL,''),(1018,'部门修改',103,3,'#','','F','0','1','system:dept:edit','#','admin','2022-06-18 19:13:41','',NULL,''),(1019,'部门删除',103,4,'#','','F','0','1','system:dept:remove','#','admin','2022-06-18 19:13:41','',NULL,''),(1020,'岗位查询',104,1,'#','','F','0','1','system:post:list','#','admin','2022-06-18 19:13:41','',NULL,''),(1021,'岗位新增',104,2,'#','','F','0','1','system:post:add','#','admin','2022-06-18 19:13:41','',NULL,''),(1022,'岗位修改',104,3,'#','','F','0','1','system:post:edit','#','admin','2022-06-18 19:13:41','',NULL,''),(1023,'岗位删除',104,4,'#','','F','0','1','system:post:remove','#','admin','2022-06-18 19:13:41','',NULL,''),(1024,'岗位导出',104,5,'#','','F','0','1','system:post:export','#','admin','2022-06-18 19:13:41','',NULL,''),(1025,'字典查询',105,1,'#','','F','0','1','system:dict:list','#','admin','2022-06-18 19:13:41','',NULL,''),(1026,'字典新增',105,2,'#','','F','0','1','system:dict:add','#','admin','2022-06-18 19:13:41','',NULL,''),(1027,'字典修改',105,3,'#','','F','0','1','system:dict:edit','#','admin','2022-06-18 19:13:41','',NULL,''),(1028,'字典删除',105,4,'#','','F','0','1','system:dict:remove','#','admin','2022-06-18 19:13:41','',NULL,''),(1029,'字典导出',105,5,'#','','F','0','1','system:dict:export','#','admin','2022-06-18 19:13:41','',NULL,''),(1030,'参数查询',106,1,'#','','F','0','1','system:config:list','#','admin','2022-06-18 19:13:41','',NULL,''),(1031,'参数新增',106,2,'#','','F','0','1','system:config:add','#','admin','2022-06-18 19:13:41','',NULL,''),(1032,'参数修改',106,3,'#','','F','0','1','system:config:edit','#','admin','2022-06-18 19:13:41','',NULL,''),(1033,'参数删除',106,4,'#','','F','0','1','system:config:remove','#','admin','2022-06-18 19:13:41','',NULL,''),(1034,'参数导出',106,5,'#','','F','0','1','system:config:export','#','admin','2022-06-18 19:13:41','',NULL,''),(1035,'公告查询',107,1,'#','','F','0','1','system:notice:list','#','admin','2022-06-18 19:13:41','',NULL,''),(1036,'公告新增',107,2,'#','','F','0','1','system:notice:add','#','admin','2022-06-18 19:13:41','',NULL,''),(1037,'公告修改',107,3,'#','','F','0','1','system:notice:edit','#','admin','2022-06-18 19:13:41','',NULL,''),(1038,'公告删除',107,4,'#','','F','0','1','system:notice:remove','#','admin','2022-06-18 19:13:41','',NULL,''),(1039,'操作查询',500,1,'#','','F','0','1','monitor:operlog:list','#','admin','2022-06-18 19:13:41','',NULL,''),(1040,'操作删除',500,2,'#','','F','0','1','monitor:operlog:remove','#','admin','2022-06-18 19:13:41','',NULL,''),(1041,'详细信息',500,3,'#','','F','0','1','monitor:operlog:detail','#','admin','2022-06-18 19:13:41','',NULL,''),(1042,'日志导出',500,4,'#','','F','0','1','monitor:operlog:export','#','admin','2022-06-18 19:13:41','',NULL,''),(1043,'登录查询',501,1,'#','','F','0','1','monitor:logininfor:list','#','admin','2022-06-18 19:13:41','',NULL,''),(1044,'登录删除',501,2,'#','','F','0','1','monitor:logininfor:remove','#','admin','2022-06-18 19:13:41','',NULL,''),(1045,'日志导出',501,3,'#','','F','0','1','monitor:logininfor:export','#','admin','2022-06-18 19:13:41','',NULL,''),(1046,'账户解锁',501,4,'#','','F','0','1','monitor:logininfor:unlock','#','admin','2022-06-18 19:13:41','',NULL,''),(1047,'在线查询',109,1,'#','','F','0','1','monitor:online:list','#','admin','2022-06-18 19:13:41','',NULL,''),(1048,'批量强退',109,2,'#','','F','0','1','monitor:online:batchForceLogout','#','admin','2022-06-18 19:13:41','',NULL,''),(1049,'单条强退',109,3,'#','','F','0','1','monitor:online:forceLogout','#','admin','2022-06-18 19:13:41','',NULL,''),(1050,'任务查询',110,1,'#','','F','0','1','monitor:job:list','#','admin','2022-06-18 19:13:41','',NULL,''),(1051,'任务新增',110,2,'#','','F','0','1','monitor:job:add','#','admin','2022-06-18 19:13:41','',NULL,''),(1052,'任务修改',110,3,'#','','F','0','1','monitor:job:edit','#','admin','2022-06-18 19:13:41','',NULL,''),(1053,'任务删除',110,4,'#','','F','0','1','monitor:job:remove','#','admin','2022-06-18 19:13:41','',NULL,''),(1054,'状态修改',110,5,'#','','F','0','1','monitor:job:changeStatus','#','admin','2022-06-18 19:13:41','',NULL,''),(1055,'任务详细',110,6,'#','','F','0','1','monitor:job:detail','#','admin','2022-06-18 19:13:41','',NULL,''),(1056,'任务导出',110,7,'#','','F','0','1','monitor:job:export','#','admin','2022-06-18 19:13:41','',NULL,''),(1057,'生成查询',115,1,'#','','F','0','1','tool:gen:list','#','admin','2022-06-18 19:13:41','',NULL,''),(1058,'生成修改',115,2,'#','','F','0','1','tool:gen:edit','#','admin','2022-06-18 19:13:41','',NULL,''),(1059,'生成删除',115,3,'#','','F','0','1','tool:gen:remove','#','admin','2022-06-18 19:13:41','',NULL,''),(1060,'预览代码',115,4,'#','','F','0','1','tool:gen:preview','#','admin','2022-06-18 19:13:41','',NULL,''),(1061,'生成代码',115,5,'#','','F','0','1','tool:gen:code','#','admin','2022-06-18 19:13:41','',NULL,''),(2000,'实验室设备管理',0,1,'#','menuItem','M','0','1',NULL,'fa fa-database','admin','2022-06-18 21:14:19','',NULL,''),(2001,'设备管理',2000,1,'/lab/device','','C','0','1','lab:device:view','#','admin','2022-06-18 21:25:23','',NULL,'设备管理菜单'),(2002,'设备查询',2001,1,'#','menuItem','F','0','1','lab:device:list','#','admin','2022-06-18 21:25:23','admin','2022-06-20 19:02:18',''),(2003,'设备新增',2001,2,'#','menuItem','F','0','1','lab:device:add','#','admin','2022-06-18 21:25:23','admin','2022-06-20 19:02:32',''),(2004,'设备修改',2001,3,'#','menuItem','F','0','1','lab:device:edit','#','admin','2022-06-18 21:25:23','admin','2022-06-20 19:02:53',''),(2005,'设备删除',2001,4,'#','menuItem','F','0','1','lab:device:remove','#','admin','2022-06-18 21:25:23','admin','2022-06-20 19:03:01',''),(2006,'设备导出',2001,5,'#','menuItem','F','0','1','lab:device:export','#','admin','2022-06-18 21:25:23','admin','2022-06-20 19:03:08',''),(2007,'修理记录管理',2000,1,'/lab/repairment','','C','0','1','lab:repairment:view','#','admin','2022-06-18 21:25:36','',NULL,'修理记录管理菜单'),(2008,'修理记录管理查询',2007,1,'#','','F','0','1','lab:repairment:list','#','admin','2022-06-18 21:25:36','',NULL,''),(2009,'报修',2007,2,'#','menuItem','F','0','1','lab:repairment:add','#','admin','2022-06-18 21:25:36','admin','2022-06-20 20:42:29',''),(2010,'修理记录管理修改',2007,3,'#','','F','0','1','lab:repairment:edit','#','admin','2022-06-18 21:25:36','',NULL,''),(2011,'修理记录管理删除',2007,4,'#','','F','0','1','lab:repairment:remove','#','admin','2022-06-18 21:25:36','',NULL,''),(2012,'修理记录管理导出',2007,5,'#','','F','0','1','lab:repairment:export','#','admin','2022-06-18 21:25:36','',NULL,''),(2013,'购买申请管理',2000,1,'/lab/request','','C','0','1','lab:request:view','#','admin','2022-06-18 21:25:47','',NULL,'购买申请管理菜单'),(2014,'购买申请管理查询',2013,1,'#','','F','0','1','lab:request:list','#','admin','2022-06-18 21:25:47','',NULL,''),(2015,'购买申请管理新增',2013,2,'#','','F','0','1','lab:request:add','#','admin','2022-06-18 21:25:47','',NULL,''),(2016,'购买申请管理修改',2013,3,'#','','F','0','1','lab:request:edit','#','admin','2022-06-18 21:25:47','',NULL,''),(2017,'购买申请管理删除',2013,4,'#','','F','0','1','lab:request:remove','#','admin','2022-06-18 21:25:47','',NULL,''),(2018,'购买申请管理导出',2013,5,'#','','F','0','1','lab:request:export','#','admin','2022-06-18 21:25:47','',NULL,''),(2019,'报废记录管理',2000,1,'/lab/scrap','','C','0','1','lab:scrap:view','#','admin','2022-06-18 21:25:59','',NULL,'报废记录管理菜单'),(2020,'报废记录管理查询',2019,1,'#','','F','0','1','lab:scrap:list','#','admin','2022-06-18 21:25:59','',NULL,''),(2021,'报废记录管理新增',2019,2,'#','','F','0','1','lab:scrap:add','#','admin','2022-06-18 21:25:59','',NULL,''),(2022,'报废记录管理修改',2019,3,'#','','F','0','1','lab:scrap:edit','#','admin','2022-06-18 21:25:59','',NULL,''),(2023,'报废记录管理删除',2019,4,'#','','F','0','1','lab:scrap:remove','#','admin','2022-06-18 21:25:59','',NULL,''),(2024,'报废记录管理导出',2019,5,'#','','F','0','1','lab:scrap:export','#','admin','2022-06-18 21:25:59','',NULL,'');
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_notice`
--

DROP TABLE IF EXISTS `sys_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_notice` (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` varchar(2000) DEFAULT NULL COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='通知公告表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_notice`
--

LOCK TABLES `sys_notice` WRITE;
/*!40000 ALTER TABLE `sys_notice` DISABLE KEYS */;
INSERT INTO `sys_notice` VALUES (1,'温馨提醒：2018-07-01 若依新版本发布啦','2','新版本内容','0','admin','2022-06-18 19:13:42','',NULL,'管理员'),(2,'维护通知：2018-07-01 若依系统凌晨维护','1','维护内容','0','admin','2022-06-18 19:13:42','',NULL,'管理员');
/*!40000 ALTER TABLE `sys_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_oper_log`
--

DROP TABLE IF EXISTS `sys_oper_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
  `operator_type` int DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) DEFAULT '' COMMENT '返回参数',
  `status` int DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=186 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='操作日志记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_oper_log`
--

LOCK TABLES `sys_oper_log` WRITE;
/*!40000 ALTER TABLE `sys_oper_log` DISABLE KEYS */;
INSERT INTO `sys_oper_log` VALUES (100,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin','研发部门','/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":[\"device,purchase_request,repairment,scrap\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-06-18 21:12:17'),(101,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.addSave()','POST',1,'admin','研发部门','/system/menu/add','127.0.0.1','内网IP','{\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"实验室设备管理\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-database\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-06-18 21:14:19'),(102,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','POST',1,'admin','研发部门','/tool/gen/edit','127.0.0.1','内网IP','{\"tableId\":[\"1\"],\"tableName\":[\"device\"],\"tableComment\":[\"实验室设备\"],\"className\":[\"Device\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"1\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"设备编号\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"dvId\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"2\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"设备类别\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"dvSort\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"3\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"设备名称\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"dvTitle\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"4\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"设备型号\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"dvType\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"select\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"5\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"设备规格\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"dvSpecification\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"6\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"设备单价\"],\"columns[5','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-06-18 21:15:06'),(103,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','POST',1,'admin','研发部门','/tool/gen/edit','127.0.0.1','内网IP','{\"tableId\":[\"2\"],\"tableName\":[\"purchase_request\"],\"tableComment\":[\"购买申请\"],\"className\":[\"PurchaseRequest\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"12\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"购买申请编号\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"prId\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"13\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"申请购买设备名称\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"prTitle\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"14\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"申请购买数量\"],\"columns[2].javaType\":[\"Long\"],\"columns[2].javaField\":[\"prNumber\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"15\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"申请购买原因\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"prReason\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"16\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"申请人\"],\"columns[4].javaType\":[\"Long\"],\"columns[4].javaField\":[\"prRequester\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"17\"],\"columns[5].','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-06-18 21:15:33'),(104,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','POST',1,'admin','研发部门','/tool/gen/edit','127.0.0.1','内网IP','{\"tableId\":[\"3\"],\"tableName\":[\"repairment\"],\"tableComment\":[\"修理记录\"],\"className\":[\"Repairment\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"19\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"修理记录编号\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"rpId\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"20\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"待修理设备\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"rpDevice\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"21\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"责任人\"],\"columns[2].javaType\":[\"Long\"],\"columns[2].javaField\":[\"rpLiablePerson\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"22\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"修理厂家\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"rpFactory\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"23\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"修理费用\"],\"columns[4].javaType\":[\"Long\"],\"columns[4].javaField\":[\"rpPrice\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"24\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"修理状态\"','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-06-18 21:15:59'),(105,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','POST',1,'admin','研发部门','/tool/gen/edit','127.0.0.1','内网IP','{\"tableId\":[\"4\"],\"tableName\":[\"scrap\"],\"tableComment\":[\"报废记录\"],\"className\":[\"Scrap\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"26\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"报废记录编号\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"scId\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"27\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"报废设备\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"scDevice\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"28\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"报废状态确认\"],\"columns[2].javaType\":[\"Long\"],\"columns[2].javaField\":[\"scStatus\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"radio\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"29\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"报废日期\"],\"columns[3].javaType\":[\"Date\"],\"columns[3].javaField\":[\"scDate\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"datetime\"],\"columns[3].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.lab\"],\"moduleName\":[\"lab\"],\"businessName\":[\"scrap\"],\"functionName\":[\"报废记录管理\"],\"params[parentMenuId]\":[\"2000\"],\"params[parentMenuName]\":[\"实验室设备管理\"],\"genType\":[\"0\"],\"genPath\":[\"/\"],\"subTableName\":[\"\"],\"params[treeCode]\":[\"\"],\"params[treeParentCode]\":[\"\"],\"params[treeName]\":[\"\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-06-18 21:16:22'),(106,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":[\"device,purchase_request,repairment,scrap\"]}',NULL,0,NULL,'2022-06-18 21:16:33'),(107,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":[\"device,purchase_request,repairment,scrap\"]}',NULL,0,NULL,'2022-06-18 21:16:37'),(108,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":[\"device,purchase_request,repairment,scrap\"]}',NULL,1,'java.io.IOException: 你的主机中的软件中止了一个已建立的连接。','2022-06-18 21:16:38'),(109,'角色管理',1,'com.ruoyi.web.controller.system.SysRoleController.addSave()','POST',1,'admin','研发部门','/system/role/add','127.0.0.1','内网IP','{\"roleName\":[\"实验室小白\"],\"roleKey\":[\"worker\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"实验室工作人员\"],\"menuIds\":[\"2000,2001,2002,2003,2004,2006,2007,2008,2012,2013,2014,2015,2019,2020\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-06-18 21:45:33'),(110,'角色管理',1,'com.ruoyi.web.controller.system.SysRoleController.addSave()','POST',1,'admin','研发部门','/system/role/add','127.0.0.1','内网IP','{\"roleName\":[\"实验室领导\"],\"roleKey\":[\"leader\"],\"roleSort\":[\"4\"],\"status\":[\"0\"],\"remark\":[\"实验室大佬\"],\"menuIds\":[\"2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2020,2021,2022,2023,2024\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-06-18 21:45:55'),(111,'用户管理',1,'com.ruoyi.web.controller.system.SysUserController.addSave()','POST',1,'admin','研发部门','/system/user/add','127.0.0.1','内网IP','{\"deptId\":[\"\"],\"userName\":[\"燮华\"],\"deptName\":[\"\"],\"phonenumber\":[\"\"],\"email\":[\"\"],\"loginName\":[\"worker1\"],\"sex\":[\"0\"],\"role\":[\"100\"],\"remark\":[\"实验室小白\"],\"status\":[\"0\"],\"roleIds\":[\"100\"],\"postIds\":[\"\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-06-18 21:46:33'),(112,'用户管理',1,'com.ruoyi.web.controller.system.SysUserController.addSave()','POST',1,'admin','研发部门','/system/user/add','127.0.0.1','内网IP','{\"deptId\":[\"\"],\"userName\":[\"哩哒\"],\"deptName\":[\"\"],\"phonenumber\":[\"\"],\"email\":[\"\"],\"loginName\":[\"leader1\"],\"sex\":[\"0\"],\"role\":[\"101\"],\"remark\":[\"boss\"],\"status\":[\"0\"],\"roleIds\":[\"101\"],\"postIds\":[\"\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-06-18 21:47:04'),(113,'字典类型',1,'com.ruoyi.web.controller.system.SysDictTypeController.addSave()','POST',1,'admin','研发部门','/system/dict/add','127.0.0.1','内网IP','{\"dictName\":[\"设备状态\"],\"dictType\":[\"device_status\"],\"status\":[\"0\"],\"remark\":[\"\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-06-18 22:36:53'),(114,'字典数据',1,'com.ruoyi.web.controller.system.SysDictDataController.addSave()','POST',1,'admin','研发部门','/system/dict/data/add','127.0.0.1','内网IP','{\"dictLabel\":[\"正常\"],\"dictValue\":[\"0\"],\"dictType\":[\"device_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"success\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-06-18 22:37:28'),(115,'字典数据',1,'com.ruoyi.web.controller.system.SysDictDataController.addSave()','POST',1,'admin','研发部门','/system/dict/data/add','127.0.0.1','内网IP','{\"dictLabel\":[\"待维修\"],\"dictValue\":[\"1\"],\"dictType\":[\"device_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"warning\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-06-18 22:37:51'),(116,'字典数据',1,'com.ruoyi.web.controller.system.SysDictDataController.addSave()','POST',1,'admin','研发部门','/system/dict/data/add','127.0.0.1','内网IP','{\"dictLabel\":[\"报废\"],\"dictValue\":[\"2\"],\"dictType\":[\"device_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"3\"],\"listClass\":[\"danger\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-06-18 22:38:09'),(117,'字典数据',2,'com.ruoyi.web.controller.system.SysDictDataController.editSave()','POST',1,'admin','研发部门','/system/dict/data/edit','127.0.0.1','内网IP','{\"dictCode\":[\"100\"],\"dictLabel\":[\"正常\"],\"dictValue\":[\"0\"],\"dictType\":[\"device_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"info\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-06-18 22:38:15'),(118,'字典类型',1,'com.ruoyi.web.controller.system.SysDictTypeController.addSave()','POST',1,'admin','研发部门','/system/dict/add','127.0.0.1','内网IP','{\"dictName\":[\"修理状态\"],\"dictType\":[\"repairment_status\"],\"status\":[\"0\"],\"remark\":[\"\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-06-18 22:39:10'),(119,'字典数据',1,'com.ruoyi.web.controller.system.SysDictDataController.addSave()','POST',1,'admin','研发部门','/system/dict/data/add','127.0.0.1','内网IP','{\"dictLabel\":[\"修理中\"],\"dictValue\":[\"0\"],\"dictType\":[\"repairment_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"primary\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-06-18 22:39:39'),(120,'字典数据',2,'com.ruoyi.web.controller.system.SysDictDataController.editSave()','POST',1,'admin','研发部门','/system/dict/data/edit','127.0.0.1','内网IP','{\"dictCode\":[\"103\"],\"dictLabel\":[\"修理中\"],\"dictValue\":[\"0\"],\"dictType\":[\"repairment_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"default\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-06-18 22:39:47'),(121,'字典数据',2,'com.ruoyi.web.controller.system.SysDictDataController.editSave()','POST',1,'admin','研发部门','/system/dict/data/edit','127.0.0.1','内网IP','{\"dictCode\":[\"103\"],\"dictLabel\":[\"修理中\"],\"dictValue\":[\"0\"],\"dictType\":[\"repairment_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"success\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-06-18 22:39:53'),(122,'字典数据',2,'com.ruoyi.web.controller.system.SysDictDataController.editSave()','POST',1,'admin','研发部门','/system/dict/data/edit','127.0.0.1','内网IP','{\"dictCode\":[\"103\"],\"dictLabel\":[\"修理中\"],\"dictValue\":[\"0\"],\"dictType\":[\"repairment_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"warning\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-06-18 22:40:01'),(123,'字典数据',1,'com.ruoyi.web.controller.system.SysDictDataController.addSave()','POST',1,'admin','研发部门','/system/dict/data/add','127.0.0.1','内网IP','{\"dictLabel\":[\"修理完成\"],\"dictValue\":[\"1\"],\"dictType\":[\"repairment_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"info\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-06-18 22:40:13'),(124,'字典类型',1,'com.ruoyi.web.controller.system.SysDictTypeController.addSave()','POST',1,'admin','研发部门','/system/dict/add','127.0.0.1','内网IP','{\"dictName\":[\"报废状态确认\"],\"dictType\":[\"scrap_status\"],\"status\":[\"0\"],\"remark\":[\"\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-06-18 22:40:40'),(125,'字典数据',1,'com.ruoyi.web.controller.system.SysDictDataController.addSave()','POST',1,'admin','研发部门','/system/dict/data/add','127.0.0.1','内网IP','{\"dictLabel\":[\"待确认报废\"],\"dictValue\":[\"0\"],\"dictType\":[\"scrap_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"warning\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-06-18 22:41:13'),(126,'字典数据',1,'com.ruoyi.web.controller.system.SysDictDataController.addSave()','POST',1,'admin','研发部门','/system/dict/data/add','127.0.0.1','内网IP','{\"dictLabel\":[\"已报废\"],\"dictValue\":[\"1\"],\"dictType\":[\"scrap_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"danger\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-06-18 22:41:25'),(127,'字典类型',2,'com.ruoyi.web.controller.system.SysDictTypeController.editSave()','POST',1,'admin','研发部门','/system/dict/edit','127.0.0.1','内网IP','{\"dictId\":[\"100\"],\"dictName\":[\"设备状态\"],\"dictType\":[\"lab_device_status\"],\"status\":[\"0\"],\"remark\":[\"\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-06-18 22:43:02'),(128,'字典类型',2,'com.ruoyi.web.controller.system.SysDictTypeController.editSave()','POST',1,'admin','研发部门','/system/dict/edit','127.0.0.1','内网IP','{\"dictId\":[\"101\"],\"dictName\":[\"修理状态\"],\"dictType\":[\"lab_repairment_status\"],\"status\":[\"0\"],\"remark\":[\"\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-06-18 22:43:09'),(129,'字典类型',2,'com.ruoyi.web.controller.system.SysDictTypeController.editSave()','POST',1,'admin','研发部门','/system/dict/edit','127.0.0.1','内网IP','{\"dictId\":[\"102\"],\"dictName\":[\"报废状态确认\"],\"dictType\":[\"lab_scrap_status\"],\"status\":[\"0\"],\"remark\":[\"\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-06-18 22:43:14'),(130,'字典类型',9,'com.ruoyi.web.controller.system.SysDictTypeController.refreshCache()','GET',1,'admin','研发部门','/system/dict/refreshCache','127.0.0.1','内网IP','','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-06-18 22:44:10'),(131,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','POST',1,'admin','研发部门','/tool/gen/edit','127.0.0.1','内网IP','{\"tableId\":[\"1\"],\"tableName\":[\"device\"],\"tableComment\":[\"实验室设备\"],\"className\":[\"Device\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"1\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"设备编号\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"dvId\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"2\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"设备类别\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"dvSort\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"3\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"设备名称\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"dvTitle\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"4\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"设备型号\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"dvType\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"select\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"5\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"设备规格\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"dvSpecification\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"6\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"设备单价\"],\"columns[5','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-06-18 22:52:17'),(132,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','POST',1,'admin','研发部门','/tool/gen/edit','127.0.0.1','内网IP','{\"tableId\":[\"3\"],\"tableName\":[\"repairment\"],\"tableComment\":[\"修理记录\"],\"className\":[\"Repairment\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"19\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"修理记录编号\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"rpId\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"20\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"待修理设备\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"rpDevice\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"21\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"责任人\"],\"columns[2].javaType\":[\"Long\"],\"columns[2].javaField\":[\"rpLiablePerson\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"22\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"修理厂家\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"rpFactory\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"23\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"修理费用\"],\"columns[4].javaType\":[\"Long\"],\"columns[4].javaField\":[\"rpPrice\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"24\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"修理状态\"','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-06-18 23:00:43'),(133,'字典类型',1,'com.ruoyi.web.controller.system.SysDictTypeController.addSave()','POST',1,'admin','研发部门','/system/dict/add','127.0.0.1','内网IP','{\"dictName\":[\"购买申请状态\"],\"dictType\":[\"lab_purchase_request\"],\"status\":[\"0\"],\"remark\":[\"\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-06-18 23:02:34'),(134,'字典数据',1,'com.ruoyi.web.controller.system.SysDictDataController.addSave()','POST',1,'admin','研发部门','/system/dict/data/add','127.0.0.1','内网IP','{\"dictLabel\":[\"审核中\"],\"dictValue\":[\"0\"],\"dictType\":[\"lab_purchase_request\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"primary\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-06-18 23:03:05'),(135,'字典数据',1,'com.ruoyi.web.controller.system.SysDictDataController.addSave()','POST',1,'admin','研发部门','/system/dict/data/add','127.0.0.1','内网IP','{\"dictLabel\":[\"已通过\"],\"dictValue\":[\"1\"],\"dictType\":[\"lab_purchase_request\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"success\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-06-18 23:03:15'),(136,'字典类型',2,'com.ruoyi.web.controller.system.SysDictTypeController.editSave()','POST',1,'admin','研发部门','/system/dict/edit','127.0.0.1','内网IP','{\"dictId\":[\"103\"],\"dictName\":[\"购买申请状态\"],\"dictType\":[\"lab_purchase_request_status\"],\"status\":[\"0\"],\"remark\":[\"\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-06-18 23:04:54'),(137,'设备管理',1,'com.ruoyi.web.controller.lab.DeviceController.addSave()','POST',1,'admin','研发部门','/lab/device/add','127.0.0.1','内网IP','{\"dvSort\":[\"小型器械\"],\"dvTitle\":[\"超微蓝猫显微镜\"],\"dvSpecification\":[\"2cm\"],\"dvPrice\":[\"648\"],\"dvNumber\":[\"2\"],\"dvPurchaseDate\":[\"2022-06-18\"],\"dvProducer\":[\"哈药六厂\"],\"dvManager\":[\"3\"]}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'dv_type\' doesn\'t have a default value\r\n### The error may exist in file [D:\\Project\\webProject\\软件工程综合实验 实验室器材管理系统\\RuoYi-master\\ruoyi-lab\\target\\classes\\mapper\\lab\\DeviceMapper.xml]\r\n### The error may involve com.ruoyi.lab.mapper.DeviceMapper.insertDevice-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into device          ( dv_sort,             dv_title,                          dv_specification,             dv_price,             dv_number,             dv_purchase_date,             dv_producer,             dv_manager )           values ( ?,             ?,                          ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'dv_type\' doesn\'t have a default value\n; Field \'dv_type\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'dv_type\' doesn\'t have a default value','2022-06-18 23:10:12'),(138,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','POST',1,'admin','研发部门','/tool/gen/edit','127.0.0.1','内网IP','{\"tableId\":[\"1\"],\"tableName\":[\"device\"],\"tableComment\":[\"实验室设备\"],\"className\":[\"Device\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"1\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"设备编号\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"dvId\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"2\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"设备类别\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"dvSort\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"3\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"设备名称\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"dvTitle\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"4\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"设备型号\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"dvType\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"5\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"设备规格\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"dvSpecification\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"6\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"设备单价\"],\"columns[5]','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-06-18 23:11:44'),(139,'设备管理',1,'com.ruoyi.web.controller.lab.DeviceController.addSave()','POST',1,'admin','研发部门','/lab/device/add','127.0.0.1','内网IP','{\"dvSort\":[\"精密仪器\"],\"dvTitle\":[\"超微蓝猫显微镜\"],\"dvType\":[\"L004\"],\"dvSpecification\":[\"2mm\"],\"dvPrice\":[\"648\"],\"dvNumber\":[\"2\"],\"dvPurchaseDate\":[\"2022-06-18\"],\"dvProducer\":[\"哈药六厂\"],\"dvManager\":[\"3\"]}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`laboratory_manage`.`device`, CONSTRAINT `device___fk_manager` FOREIGN KEY (`dv_manager`) REFERENCES `sys_user` (`user_id`))\r\n### The error may exist in file [D:\\Project\\webProject\\软件工程综合实验 实验室器材管理系统\\RuoYi-master\\ruoyi-lab\\target\\classes\\mapper\\lab\\DeviceMapper.xml]\r\n### The error may involve com.ruoyi.lab.mapper.DeviceMapper.insertDevice-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into device          ( dv_sort,             dv_title,             dv_type,             dv_specification,             dv_price,             dv_number,             dv_purchase_date,             dv_producer,             dv_manager )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`laboratory_manage`.`device`, CONSTRAINT `device___fk_manager` FOREIGN KEY (`dv_manager`) REFERENCES `sys_user` (`user_id`))\n; Cannot add or update a child row: a foreign key constraint fails (`laboratory_manage`.`device`, CONSTRAINT `device___fk_manager` FOREIGN KEY (`dv_manager`) REFERENCES `sys_user` (`user_id`)); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`laboratory_manage`.`device`, CONSTRAINT `device___fk_manager` FOREIGN KEY (`dv_manager`) REFERENCES `sys_user` (`user_id`))','2022-06-18 23:14:05'),(140,'设备管理',1,'com.ruoyi.web.controller.lab.DeviceController.addSave()','POST',1,'admin','研发部门','/lab/device/add','127.0.0.1','内网IP','{\"dvSort\":[\"精密仪器\"],\"dvTitle\":[\"超微蓝猫显微镜\"],\"dvType\":[\"L004\"],\"dvSpecification\":[\"2mm\"],\"dvPrice\":[\"648\"],\"dvNumber\":[\"2\"],\"dvPurchaseDate\":[\"2022-06-18\"],\"dvProducer\":[\"哈药六厂\"],\"dvManager\":[\"101\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-06-18 23:14:17'),(141,'设备管理',1,'com.ruoyi.web.controller.lab.DeviceController.addSave()','POST',1,'admin','研发部门','/lab/device/add','127.0.0.1','内网IP','{\"dvSort\":[\"精密仪器\"],\"dvTitle\":[\"干细胞娃娃机\"],\"dvType\":[\"C017\"],\"dvSpecification\":[\"10μm\"],\"dvPrice\":[\"300000\"],\"dvNumber\":[\"1\"],\"dvPurchaseDate\":[\"2022-06-18\"],\"dvProducer\":[\"卧底硅硅实验室\"],\"dvManager\":[\"101\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-06-18 23:16:49'),(142,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','POST',1,'admin','研发部门','/tool/gen/edit','127.0.0.1','内网IP','{\"tableId\":[\"1\"],\"tableName\":[\"device\"],\"tableComment\":[\"实验室设备\"],\"className\":[\"Device\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"1\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"设备编号\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"dvId\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].isQuery\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"2\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"设备类别\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"dvSort\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"3\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"设备名称\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"dvTitle\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"4\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"设备型号\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"dvType\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"5\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"设备规格\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"dvSpecification\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"6\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnCo','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-06-18 23:18:37'),(143,'修理记录管理',1,'com.ruoyi.web.controller.lab.RepairmentController.addSave()','POST',1,'admin','研发部门','/lab/repairment/add','127.0.0.1','内网IP','{\"rpDevice\":[\"4\"],\"rpLiablePerson\":[\"101\"],\"rpFactory\":[\"硅硅谷\"],\"rpPrice\":[\"\"],\"rpDate\":[\"\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-06-18 23:20:50'),(144,'购买申请管理',1,'com.ruoyi.web.controller.lab.PurchaseRequestController.addSave()','POST',1,'admin','研发部门','/lab/request/add','127.0.0.1','内网IP','{\"prTitle\":[\"挖掘机\"],\"prNumber\":[\"1\"],\"prReason\":[\"实验室应该扩建\"],\"prRequester\":[\"100\"],\"prRequestDate\":[\"2022-06-18\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-06-18 23:21:43'),(145,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','POST',1,'admin','研发部门','/tool/gen/edit','127.0.0.1','内网IP','{\"tableId\":[\"4\"],\"tableName\":[\"scrap\"],\"tableComment\":[\"报废记录\"],\"className\":[\"Scrap\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"26\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"报废记录编号\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"scId\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"27\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"报废设备\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"scDevice\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"28\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"报废状态确认\"],\"columns[2].javaType\":[\"Long\"],\"columns[2].javaField\":[\"scStatus\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"radio\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"29\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"报废日期\"],\"columns[3].javaType\":[\"Date\"],\"columns[3].javaField\":[\"scDate\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"datetime\"],\"columns[3].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.lab\"],\"moduleName\":[\"lab\"],\"businessName\":[\"scrap\"],\"functionName\":[\"报废记录管理\"],\"params[parentMenuId]\":[\"2000\"],\"params[parentMenuName]\":[\"实验室设备管理\"],\"genType\":[\"0\"],\"genPath\":[\"/\"],\"subTableName\":[\"\"],\"params[treeCode]\":[\"\"],\"params[treeParentCode]\":[\"\"],\"params[treeName]\":[\"\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-06-18 23:22:45'),(146,'报废记录管理',1,'com.ruoyi.web.controller.lab.ScrapController.addSave()','POST',1,'admin','研发部门','/lab/scrap/add','127.0.0.1','内网IP','{\"scDevice\":[\"4\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-06-18 23:25:39'),(147,'字典类型',1,'com.ruoyi.web.controller.system.SysDictTypeController.addSave()','POST',1,'admin','研发部门','/system/dict/add','127.0.0.1','内网IP','{\"dictName\":[\"仪器名称\"],\"dictType\":[\"lab_device_name\"],\"status\":[\"0\"],\"remark\":[\"\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-06-20 18:53:54'),(148,'字典数据',1,'com.ruoyi.web.controller.system.SysDictDataController.addSave()','POST',1,'admin','研发部门','/system/dict/data/add','127.0.0.1','内网IP','{\"dictLabel\":[\"双料高级天文望远镜\"],\"dictValue\":[\"1\"],\"dictType\":[\"lab_device_name\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"default\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-06-20 18:54:37'),(149,'购买申请管理',5,'com.ruoyi.web.controller.lab.PurchaseRequestController.export()','POST',1,'admin','研发部门','/lab/request/export','127.0.0.1','内网IP','{\"prTitle\":[\"\"],\"prNumber\":[\"\"],\"prReason\":[\"\"],\"prRequester\":[\"\"],\"prRequestDate\":[\"\"],\"dvStatus\":[\"\"],\"orderByColumn\":[\"\"],\"isAsc\":[\"asc\"]}','{\"msg\":\"ac810ef9-13c8-49b6-a42c-480f3d2fd22e_购买申请管理数据.xlsx\",\"code\":0}',0,NULL,'2022-06-20 18:54:57'),(150,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.editSave()','POST',1,'admin','研发部门','/system/menu/edit','127.0.0.1','内网IP','{\"menuId\":[\"2002\"],\"parentId\":[\"2001\"],\"menuType\":[\"F\"],\"menuName\":[\"设备查询\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"lab:device:list\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-06-20 19:02:18'),(151,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.editSave()','POST',1,'admin','研发部门','/system/menu/edit','127.0.0.1','内网IP','{\"menuId\":[\"2003\"],\"parentId\":[\"2001\"],\"menuType\":[\"F\"],\"menuName\":[\"设备新增\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"lab:device:add\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-06-20 19:02:32'),(152,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.editSave()','POST',1,'admin','研发部门','/system/menu/edit','127.0.0.1','内网IP','{\"menuId\":[\"2004\"],\"parentId\":[\"2001\"],\"menuType\":[\"F\"],\"menuName\":[\"设备修改\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"lab:device:edit\"],\"orderNum\":[\"3\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-06-20 19:02:53'),(153,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.editSave()','POST',1,'admin','研发部门','/system/menu/edit','127.0.0.1','内网IP','{\"menuId\":[\"2005\"],\"parentId\":[\"2001\"],\"menuType\":[\"F\"],\"menuName\":[\"设备删除\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"lab:device:remove\"],\"orderNum\":[\"4\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-06-20 19:03:01'),(154,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.editSave()','POST',1,'admin','研发部门','/system/menu/edit','127.0.0.1','内网IP','{\"menuId\":[\"2006\"],\"parentId\":[\"2001\"],\"menuType\":[\"F\"],\"menuName\":[\"设备导出\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"lab:device:export\"],\"orderNum\":[\"5\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-06-20 19:03:08'),(155,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.editSave()','POST',1,'admin','研发部门','/system/menu/edit','127.0.0.1','内网IP','{\"menuId\":[\"2009\"],\"parentId\":[\"2007\"],\"menuType\":[\"F\"],\"menuName\":[\"报修\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"lab:repairment:add\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-06-20 20:42:29'),(156,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.addSave()','POST',1,'admin','研发部门','/system/menu/add','127.0.0.1','内网IP','{\"parentId\":[\"2007\"],\"menuType\":[\"F\"],\"menuName\":[\"已修复\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"lab:repairment:repaired\"],\"orderNum\":[\"6\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-06-20 20:44:02'),(157,'修理记录管理',1,'com.ruoyi.web.controller.lab.RepairmentController.addSave()','POST',1,'admin','研发部门','/lab/repairment/add','127.0.0.1','内网IP','{\"rpDevice\":[\"3\"],\"rpLiablePerson\":[\"100\"],\"rpFactory\":[\"哈药六厂\"],\"rpPrice\":[\"\"],\"rpDate\":[\"\"]}',NULL,1,'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'dvStatus\' in \'class com.ruoyi.lab.domain.Repairment\'','2022-06-20 20:56:47'),(158,'修理记录管理',2,'com.ruoyi.web.controller.lab.RepairmentController.editSave()','POST',1,'admin','研发部门','/lab/repairment/edit','127.0.0.1','内网IP','{\"rpId\":[\"1\"],\"rpDevice\":[\"4\"],\"rpLiablePerson\":[\"101\"],\"rpFactory\":[\"硅硅谷\"],\"rpPrice\":[\"50\"],\"rpDate\":[\"2022-06-22\"]}',NULL,1,'','2022-06-22 21:45:49'),(159,'修理记录管理',1,'com.ruoyi.web.controller.lab.RepairmentController.addSave()','POST',1,'admin','研发部门','/lab/repairment/add','127.0.0.1','内网IP','{\"rpDevice\":[\"1\"],\"rpLiablePerson\":[\"100\"],\"rpFactory\":[\"哈药六厂\"],\"rpPrice\":[\"\"],\"rpDate\":[\"\"]}',NULL,1,'','2022-06-22 21:50:09'),(160,'修理记录管理',1,'com.ruoyi.web.controller.lab.RepairmentController.addSave()','POST',1,'admin','研发部门','/lab/repairment/add','127.0.0.1','内网IP','{\"params\":{}}',NULL,1,'','2022-06-22 21:50:09'),(161,'修理记录管理',1,'com.ruoyi.web.controller.lab.RepairmentController.addSave()','POST',1,'admin','研发部门','/lab/repairment/add','127.0.0.1','内网IP','{\"rpDevice\":[\"1\"],\"rpLiablePerson\":[\"100\"],\"rpFactory\":[\"哈药六厂\"],\"rpPrice\":[\"\"],\"rpDate\":[\"\"]}',NULL,1,'','2022-06-22 21:53:22'),(162,'修理记录管理',1,'com.ruoyi.web.controller.lab.RepairmentController.addSave()','POST',1,'admin','研发部门','/lab/repairment/add','127.0.0.1','内网IP','{\"params\":{}}',NULL,1,'','2022-06-22 21:53:22'),(163,'修理记录管理',2,'com.ruoyi.web.controller.lab.RepairmentController.editSave()','POST',1,'admin','研发部门','/lab/repairment/edit','127.0.0.1','内网IP','{\"rpId\":[\"1\"],\"rpDevice\":[\"4\"],\"rpLiablePerson\":[\"101\"],\"rpFactory\":[\"硅硅谷\"],\"rpPrice\":[\"50\"],\"rpDate\":[\"2022-06-22\"]}',NULL,1,'','2022-06-22 21:57:32'),(164,'修理记录管理',1,'com.ruoyi.web.controller.lab.RepairmentController.addSave()','POST',1,'admin','研发部门','/lab/repairment/add','127.0.0.1','内网IP','{\"rpDevice\":[\"1\"],\"rpLiablePerson\":[\"100\"],\"rpFactory\":[\"哈药六厂\"],\"rpPrice\":[\"\"],\"rpDate\":[\"\"]}',NULL,1,'','2022-06-22 22:04:19'),(165,'修理记录管理',1,'com.ruoyi.web.controller.lab.RepairmentController.addSave()','POST',1,'admin','研发部门','/lab/repairment/add','127.0.0.1','内网IP','{\"params\":{}}',NULL,1,'','2022-06-22 22:04:20'),(166,'修理记录管理',1,'com.ruoyi.web.controller.lab.RepairmentController.addSave()','POST',1,'admin','研发部门','/lab/repairment/add','127.0.0.1','内网IP','{\"rpDevice\":[\"1\"],\"rpLiablePerson\":[\"100\"],\"rpFactory\":[\"哈药六厂\"],\"rpPrice\":[\"\"],\"rpDate\":[\"\"]}',NULL,1,'','2022-06-22 22:07:09'),(167,'修理记录管理',1,'com.ruoyi.web.controller.lab.RepairmentController.addSave()','POST',1,'admin','研发部门','/lab/repairment/add','127.0.0.1','内网IP','{\"params\":{}}',NULL,1,'','2022-06-22 22:07:09'),(168,'修理记录管理',1,'com.ruoyi.web.controller.lab.RepairmentController.addSave()','POST',1,'admin','研发部门','/lab/repairment/add','127.0.0.1','内网IP','{\"rpDevice\":[\"1\"],\"rpLiablePerson\":[\"100\"],\"rpFactory\":[\"哈药六厂\"],\"rpPrice\":[\"\"],\"rpDate\":[\"\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-06-22 22:07:57'),(169,'修理记录管理',1,'com.ruoyi.web.controller.lab.RepairmentController.addSave()','POST',1,'admin','研发部门','/lab/repairment/add','127.0.0.1','内网IP','{\"params\":{}}',NULL,1,'','2022-06-22 22:08:01'),(170,'修理记录管理',2,'com.ruoyi.web.controller.lab.RepairmentController.editSave()','POST',1,'admin','研发部门','/lab/repairment/edit','127.0.0.1','内网IP','{\"rpId\":[\"1\"],\"rpDevice\":[\"4\"],\"rpLiablePerson\":[\"101\"],\"rpFactory\":[\"硅硅谷\"],\"rpPrice\":[\"50\"],\"rpDate\":[\"2022-06-22\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-06-22 22:09:24'),(171,'修理记录管理',2,'com.ruoyi.web.controller.lab.RepairmentController.editSave()','POST',1,'admin','研发部门','/lab/repairment/edit','127.0.0.1','内网IP','{\"rpId\":[\"2\"],\"rpDevice\":[\"1\"],\"rpLiablePerson\":[\"100\"],\"rpFactory\":[\"哈药六厂\"],\"rpPrice\":[\"50\"],\"rpDate\":[\"\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-06-22 22:09:32'),(172,'修理记录管理',2,'com.ruoyi.web.controller.lab.RepairmentController.editSave()','POST',1,'admin','研发部门','/lab/repairment/edit','127.0.0.1','内网IP','{\"rpId\":[\"2\"],\"rpDevice\":[\"1\"],\"rpLiablePerson\":[\"100\"],\"rpFactory\":[\"哈药六厂\"],\"rpPrice\":[\"50\"],\"rpDate\":[\"2022-06-23\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-06-22 22:09:48'),(173,'字典数据',1,'com.ruoyi.web.controller.system.SysDictDataController.addSave()','POST',1,'admin','研发部门','/system/dict/data/add','127.0.0.1','内网IP','{\"dictLabel\":[\"已报废\"],\"dictValue\":[\"2\"],\"dictType\":[\"lab_repairment_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"3\"],\"listClass\":[\"danger\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-06-22 22:11:30'),(174,'字典类型',3,'com.ruoyi.web.controller.system.SysDictTypeController.remove()','POST',1,'admin','研发部门','/system/dict/remove','127.0.0.1','内网IP','{\"ids\":[\"104\"]}',NULL,1,'仪器名称已分配,不能删除','2022-06-22 22:12:43'),(175,'字典数据',3,'com.ruoyi.web.controller.system.SysDictDataController.remove()','POST',1,'admin','研发部门','/system/dict/data/remove','127.0.0.1','内网IP','{\"ids\":[\"109\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-06-22 22:12:54'),(176,'字典类型',3,'com.ruoyi.web.controller.system.SysDictTypeController.remove()','POST',1,'admin','研发部门','/system/dict/remove','127.0.0.1','内网IP','{\"ids\":[\"104\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-06-22 22:12:59'),(177,'设备管理',1,'com.ruoyi.web.controller.lab.DeviceController.addSave()','POST',1,'admin','研发部门','/lab/device/add','127.0.0.1','内网IP','{\"dvSort\":[\"废品\"],\"dvTitle\":[\"破浪量杯\"],\"dvType\":[\"T001\"],\"dvSpecification\":[\"1L\"],\"dvPrice\":[\"1\"],\"dvNumber\":[\"15\"],\"dvPurchaseDate\":[\"2022-06-25\"],\"dvProducer\":[\"纯碱拉机厂\"],\"dvManager\":[\"100\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-06-22 22:29:38'),(178,'修理记录管理',1,'com.ruoyi.web.controller.lab.RepairmentController.addSave()','POST',1,'admin','研发部门','/lab/repairment/add','127.0.0.1','内网IP','{\"rpDevice\":[\"5\"],\"rpLiablePerson\":[\"100\"],\"rpFactory\":[\"强酸拉机厂\"],\"rpPrice\":[\"\"],\"rpDate\":[\"\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-06-22 22:30:15'),(179,'修理记录管理',1,'com.ruoyi.web.controller.lab.RepairmentController.addSave()','POST',1,'admin','研发部门','/lab/repairment/add','127.0.0.1','内网IP','{\"params\":{}}',NULL,1,'','2022-06-22 22:30:15'),(180,'报废记录管理',1,'com.ruoyi.web.controller.lab.ScrapController.addSave()','POST',1,'admin','研发部门','/lab/scrap/add','127.0.0.1','内网IP','{\"scDevice\":[\"5\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-06-22 22:30:33'),(181,'报废记录管理',2,'com.ruoyi.web.controller.lab.ScrapController.editSave()','POST',1,'admin','研发部门','/lab/scrap/edit','127.0.0.1','内网IP','{\"scId\":[\"2\"],\"scDevice\":[\"5\"],\"scDate\":[\"2022-06-22\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-06-22 22:30:40'),(182,'报废记录管理',2,'com.ruoyi.web.controller.lab.ScrapController.editSave()','POST',1,'admin','研发部门','/lab/scrap/edit','127.0.0.1','内网IP','{\"scId\":[\"2\"],\"scDevice\":[\"5\"],\"scDate\":[\"2022-06-23\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-06-22 22:33:17'),(183,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.editSave()','POST',1,'admin','研发部门','/system/role/edit','127.0.0.1','内网IP','{\"roleId\":[\"100\"],\"roleName\":[\"实验室小白\"],\"roleKey\":[\"worker\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"实验室工作人员\"],\"menuIds\":[\"2000,2001,2002,2003,2004,2006,2007,2008,2009,2010,2012,2013,2014,2015,2018,2019,2020,2021,2024\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-06-22 22:52:54'),(184,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','GET',1,'admin','研发部门','/system/menu/remove/2025','127.0.0.1','内网IP','2025','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-06-22 22:53:03'),(185,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.editSave()','POST',1,'admin','研发部门','/system/role/edit','127.0.0.1','内网IP','{\"roleId\":[\"101\"],\"roleName\":[\"实验室领导\"],\"roleKey\":[\"leader\"],\"roleSort\":[\"4\"],\"status\":[\"0\"],\"remark\":[\"实验室大佬\"],\"menuIds\":[\"2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2020,2021,2022,2023,2024\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-06-22 22:53:38');
/*!40000 ALTER TABLE `sys_oper_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_post`
--

DROP TABLE IF EXISTS `sys_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_post` (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='岗位信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_post`
--

LOCK TABLES `sys_post` WRITE;
/*!40000 ALTER TABLE `sys_post` DISABLE KEYS */;
INSERT INTO `sys_post` VALUES (1,'ceo','董事长',1,'0','admin','2022-06-18 19:13:41','',NULL,''),(2,'se','项目经理',2,'0','admin','2022-06-18 19:13:41','',NULL,''),(3,'hr','人力资源',3,'0','admin','2022-06-18 19:13:41','',NULL,''),(4,'user','普通员工',4,'0','admin','2022-06-18 19:13:41','',NULL,'');
/*!40000 ALTER TABLE `sys_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role` (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (1,'超级管理员','admin',1,'1','0','0','admin','2022-06-18 19:13:41','',NULL,'超级管理员'),(2,'普通角色','common',2,'2','0','0','admin','2022-06-18 19:13:41','',NULL,'普通角色'),(100,'实验室小白','worker',3,'1','0','0','admin','2022-06-18 21:45:33','admin','2022-06-22 22:52:54','实验室工作人员'),(101,'实验室领导','leader',4,'1','0','0','admin','2022-06-18 21:45:55','admin','2022-06-22 22:53:38','实验室大佬');
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_dept`
--

DROP TABLE IF EXISTS `sys_role_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色和部门关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_dept`
--

LOCK TABLES `sys_role_dept` WRITE;
/*!40000 ALTER TABLE `sys_role_dept` DISABLE KEYS */;
INSERT INTO `sys_role_dept` VALUES (2,100),(2,101),(2,105);
/*!40000 ALTER TABLE `sys_role_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_menu`
--

DROP TABLE IF EXISTS `sys_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色和菜单关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_menu`
--

LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
INSERT INTO `sys_role_menu` VALUES (2,1),(2,2),(2,3),(2,4),(2,100),(2,101),(2,102),(2,103),(2,104),(2,105),(2,106),(2,107),(2,108),(2,109),(2,110),(2,111),(2,112),(2,113),(2,114),(2,115),(2,116),(2,500),(2,501),(2,1000),(2,1001),(2,1002),(2,1003),(2,1004),(2,1005),(2,1006),(2,1007),(2,1008),(2,1009),(2,1010),(2,1011),(2,1012),(2,1013),(2,1014),(2,1015),(2,1016),(2,1017),(2,1018),(2,1019),(2,1020),(2,1021),(2,1022),(2,1023),(2,1024),(2,1025),(2,1026),(2,1027),(2,1028),(2,1029),(2,1030),(2,1031),(2,1032),(2,1033),(2,1034),(2,1035),(2,1036),(2,1037),(2,1038),(2,1039),(2,1040),(2,1041),(2,1042),(2,1043),(2,1044),(2,1045),(2,1046),(2,1047),(2,1048),(2,1049),(2,1050),(2,1051),(2,1052),(2,1053),(2,1054),(2,1055),(2,1056),(2,1057),(2,1058),(2,1059),(2,1060),(2,1061),(100,2000),(100,2001),(100,2002),(100,2003),(100,2004),(100,2006),(100,2007),(100,2008),(100,2009),(100,2010),(100,2012),(100,2013),(100,2014),(100,2015),(100,2018),(100,2019),(100,2020),(100,2021),(100,2024),(101,2000),(101,2001),(101,2002),(101,2003),(101,2004),(101,2005),(101,2006),(101,2007),(101,2008),(101,2009),(101,2010),(101,2011),(101,2012),(101,2013),(101,2014),(101,2015),(101,2016),(101,2017),(101,2018),(101,2019),(101,2020),(101,2021),(101,2022),(101,2023),(101,2024);
/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `login_name` varchar(30) NOT NULL COMMENT '登录账号',
  `user_name` varchar(30) DEFAULT '' COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户 01注册用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像路径',
  `password` varchar(50) DEFAULT '' COMMENT '密码',
  `salt` varchar(20) DEFAULT '' COMMENT '盐加密',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `pwd_update_date` datetime DEFAULT NULL COMMENT '密码最后更新时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,103,'admin','若依','00','ry@163.com','15888888888','1','','29c67a30398638269fe600f73a054934','111111','0','0','127.0.0.1','2022-06-22 23:09:48','2022-06-18 19:13:41','admin','2022-06-18 19:13:41','','2022-06-22 23:09:48','管理员'),(2,105,'ry','若依','00','ry@qq.com','15666666666','1','','8e6d98b90472783cc73c17047ddccf36','222222','0','0','127.0.0.1','2022-06-18 19:13:41','2022-06-18 19:13:41','admin','2022-06-18 19:13:41','',NULL,'测试员'),(100,NULL,'worker1','燮华','00','','','0','','c32ee19b0495ce7f4d9f41196fa02c64','c34212','0','0','127.0.0.1','2022-06-22 22:55:53',NULL,'admin','2022-06-18 21:46:33','','2022-06-22 22:55:52','实验室小白'),(101,NULL,'leader1','哩哒','00','','','0','','96d2e050a3635936f01f347f6cc311a6','1c66c7','0','0','',NULL,NULL,'admin','2022-06-18 21:47:04','',NULL,'boss');
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_online`
--

DROP TABLE IF EXISTS `sys_user_online`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_online` (
  `sessionId` varchar(50) NOT NULL DEFAULT '' COMMENT '用户会话id',
  `login_name` varchar(50) DEFAULT '' COMMENT '登录账号',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `ipaddr` varchar(128) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `start_timestamp` datetime DEFAULT NULL COMMENT 'session创建时间',
  `last_access_time` datetime DEFAULT NULL COMMENT 'session最后访问时间',
  `expire_time` int DEFAULT '0' COMMENT '超时时间，单位为分钟',
  PRIMARY KEY (`sessionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='在线用户记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_online`
--

LOCK TABLES `sys_user_online` WRITE;
/*!40000 ALTER TABLE `sys_user_online` DISABLE KEYS */;
INSERT INTO `sys_user_online` VALUES ('5a2fd317-7cd7-4b7d-900e-31511140e085','admin','研发部门','127.0.0.1','内网IP','Firefox 10','Windows 10','on_line','2022-06-22 22:57:45','2022-06-22 23:09:48',1800000);
/*!40000 ALTER TABLE `sys_user_online` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_post`
--

DROP TABLE IF EXISTS `sys_user_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_post` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户与岗位关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_post`
--

LOCK TABLES `sys_user_post` WRITE;
/*!40000 ALTER TABLE `sys_user_post` DISABLE KEYS */;
INSERT INTO `sys_user_post` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `sys_user_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_role` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户和角色关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` VALUES (1,1),(2,2),(100,100),(101,101);
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-24 19:37:21
