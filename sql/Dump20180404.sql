CREATE DATABASE  IF NOT EXISTS `fhadmin` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `fhadmin`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: fhadmin
-- ------------------------------------------------------
-- Server version	5.7.20-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `db_fhdb`
--

DROP TABLE IF EXISTS `db_fhdb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_fhdb` (
  `FHDB_ID` varchar(100) NOT NULL,
  `USERNAME` varchar(50) DEFAULT NULL COMMENT '操作用户',
  `BACKUP_TIME` varchar(32) DEFAULT NULL COMMENT '备份时间',
  `TABLENAME` varchar(50) DEFAULT NULL COMMENT '表名',
  `SQLPATH` varchar(300) DEFAULT NULL COMMENT '存储位置',
  `TYPE` int(1) NOT NULL COMMENT '类型',
  `DBSIZE` varchar(10) DEFAULT NULL COMMENT '文件大小',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`FHDB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_fhdb`
--

LOCK TABLES `db_fhdb` WRITE;
/*!40000 ALTER TABLE `db_fhdb` DISABLE KEYS */;
INSERT INTO `db_fhdb` VALUES ('26da360588a3440a9f9b23b339c20f93','admin','2017-04-10 03:43:59','sys_app_user','e:/mysql_backup/20170410/sys_app_user_20170410034359.sql',2,'2.921','admin备份单表');
/*!40000 ALTER TABLE `db_fhdb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_timingbackup`
--

DROP TABLE IF EXISTS `db_timingbackup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_timingbackup` (
  `TIMINGBACKUP_ID` varchar(100) NOT NULL,
  `JOBNAME` varchar(50) DEFAULT NULL COMMENT '任务名称',
  `CREATE_TIME` varchar(32) DEFAULT NULL COMMENT '创建时间',
  `TABLENAME` varchar(50) DEFAULT NULL COMMENT '表名',
  `STATUS` int(1) NOT NULL COMMENT '类型',
  `FHTIME` varchar(30) DEFAULT NULL COMMENT '时间规则',
  `TIMEEXPLAIN` varchar(100) DEFAULT NULL COMMENT '规则说明',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`TIMINGBACKUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_timingbackup`
--

LOCK TABLES `db_timingbackup` WRITE;
/*!40000 ALTER TABLE `db_timingbackup` DISABLE KEYS */;
INSERT INTO `db_timingbackup` VALUES ('0badd700085144709dc8d13ef00baf2d','all_868550','2017-08-23 15:30:02','all',2,'0 0 1 0 * ?','每个月的  1号 1点时执行一次','sss'),('25134cded5f848bea44818e503d3710e','all_721182','2017-08-23 15:30:28','all',2,'0 0 24 1 3 ?','每年 3 月份的  1号 24点时执行一次','sss'),('5392678d8a0d475db9886eee5b3b01ea','all_602714','2017-08-23 15:29:18','all',2,'0 0 24 1 * ?','每个月的  1号 24点时执行一次','rrr'),('824ea4fca209467badacd8317fe9db3f','all_382886','2017-08-23 15:29:32','all',2,'0 0 23 1 * ?','每个月的  1号 23点时执行一次','rr');
/*!40000 ALTER TABLE `db_timingbackup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hr_goods`
--

DROP TABLE IF EXISTS `hr_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hr_goods` (
  `GOODS_ID` varchar(100) NOT NULL,
  `GOOD_ID` varchar(255) DEFAULT NULL COMMENT '商品编号',
  `GOODNAME` varchar(255) DEFAULT NULL COMMENT '商品名称',
  `GOODUNIT` varchar(255) DEFAULT NULL COMMENT '商品单位',
  `SPEC` varchar(255) DEFAULT NULL COMMENT '商品规格',
  `MEMO` varchar(255) DEFAULT NULL COMMENT '商品说明',
  `GOODCATEGORYID` varchar(255) DEFAULT NULL COMMENT '商品类别号',
  `REMARK` varchar(255) DEFAULT NULL COMMENT '备注',
  `CREATETIME` varchar(32) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`GOODS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hr_goods`
--

LOCK TABLES `hr_goods` WRITE;
/*!40000 ALTER TABLE `hr_goods` DISABLE KEYS */;
INSERT INTO `hr_goods` VALUES ('56ad18b6d6144b5ab40d5bb3dc4735df','HR0002','越南进口青芒4斤装','件','单果 200-300g','广西中通直发','新鲜水果','4月','2018-03-27 00:05:02'),('c8fcd18a26014c219041bfc0fbc4bd43','HR0001','越南进口青芒 8斤装 ','件','单果 200-300g','广西中通直发','新鲜水果','4月成熟','2018-03-27 00:04:02');
/*!40000 ALTER TABLE `hr_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hr_orderinfo`
--

DROP TABLE IF EXISTS `hr_orderinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hr_orderinfo` (
  `ORDERINFO_ID` varchar(100) NOT NULL,
  `ODER_ID` varchar(255) DEFAULT NULL COMMENT '订单编号',
  `GOODNUM` varchar(255) DEFAULT NULL COMMENT '订单数量',
  `SELLNAME` varchar(255) DEFAULT NULL COMMENT '发件人',
  `SELLPHONE` varchar(255) DEFAULT NULL COMMENT '发件电话',
  `RECNAME` varchar(255) DEFAULT NULL COMMENT '收件人',
  `RECPHONE` varchar(255) DEFAULT NULL COMMENT '收件电话',
  `RECADDRESS` varchar(255) DEFAULT NULL COMMENT '收件地址',
  `EXPRESS` varchar(255) DEFAULT NULL COMMENT '快递公司',
  `EXPRESSNO` varchar(255) DEFAULT NULL COMMENT '快递单号',
  `SELLPRICE` double(11,3) DEFAULT NULL COMMENT '商品售价单价',
  `SELLTOTALPRICE` double(11,3) DEFAULT NULL COMMENT '商品售价总价',
  `PURCHASEPRICE` double(11,3) DEFAULT NULL COMMENT '商品采购单价',
  `PURCHASETOTALPRICE` double(11,3) DEFAULT NULL COMMENT '商品采购总价',
  `PLATFORMID` varchar(255) DEFAULT NULL COMMENT '所属平台id',
  `SUPPLIER_ID` varchar(255) DEFAULT NULL COMMENT '供应商id ',
  `SUPPLIER_EMAIL` varchar(255) DEFAULT NULL COMMENT '供应商email',
  `CREATETIME` varchar(32) DEFAULT NULL COMMENT '创建时间',
  `REMARK` varchar(255) DEFAULT NULL COMMENT '备注',
  `EXTGOOD_ID` varchar(255) DEFAULT NULL COMMENT '第三方商品编号',
  PRIMARY KEY (`ORDERINFO_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hr_orderinfo`
--

LOCK TABLES `hr_orderinfo` WRITE;
/*!40000 ALTER TABLE `hr_orderinfo` DISABLE KEYS */;
INSERT INTO `hr_orderinfo` VALUES ('19870a0f9c684e14adc6a420c0eafede','P2018033022571729750346','2','华榕','13911112222','孙悟空','12912337788','北京海淀区西天街道哈哈城4-503','京东','VC40759559245',99.000,198.000,60.000,120.000,'yuhua','bobo','bobo@qq.com','2018-03-31 22:52:28','哈哈，请把贺卡填好','1438408'),('e7a5f66c030b46d1b8c78210812fe5d4','180331285541','1','华榕','13911112222','唐三藏','12912335566','北京海淀区大望街道哈哈城4-503','百世快递','486172538066',66.000,66.000,50.000,50.000,'品质365','bobo','bobo@qq.com','2018-03-31 22:50:11','明日发，卡片备注',NULL);
/*!40000 ALTER TABLE `hr_orderinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_datajur`
--

DROP TABLE IF EXISTS `oa_datajur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_datajur` (
  `DATAJUR_ID` varchar(100) NOT NULL,
  `DEPARTMENT_IDS` varchar(5000) DEFAULT NULL COMMENT '部门ID组合',
  `STAFF_ID` varchar(100) DEFAULT NULL COMMENT '员工ID',
  `DEPARTMENT_ID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`DATAJUR_ID`),
  KEY `FSTAFF` (`STAFF_ID`),
  CONSTRAINT `FSTAFF` FOREIGN KEY (`STAFF_ID`) REFERENCES `oa_staff` (`STAFF_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_datajur`
--

LOCK TABLES `oa_datajur` WRITE;
/*!40000 ALTER TABLE `oa_datajur` DISABLE KEYS */;
INSERT INTO `oa_datajur` VALUES ('9fd17463ffd7487ab90e683c76026655','(\'d41af567914a409893d011aa53eda797\',\'3e7227e11dc14b4d9e863dd1a1fcedf6\',\'0956d8c279274fca92f4091f2a69a9ad\',\'fh\')','9fd17463ffd7487ab90e683c76026655','a6c6695217ba4a4dbfe9f7e9d2c06730'),('c9f05f925dfc485b9e352916612ab669','(\'a0982dea52554225ab682cd4b421de47\',\'fh\')','c9f05f925dfc485b9e352916612ab669','8f8b045470f342fdbc4c312ab881d62b');
/*!40000 ALTER TABLE `oa_datajur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_department`
--

DROP TABLE IF EXISTS `oa_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_department` (
  `DEPARTMENT_ID` varchar(100) NOT NULL,
  `NAME` varchar(30) DEFAULT NULL COMMENT '名称',
  `NAME_EN` varchar(50) DEFAULT NULL COMMENT '英文',
  `BIANMA` varchar(50) DEFAULT NULL COMMENT '编码',
  `PARENT_ID` varchar(100) DEFAULT NULL COMMENT '上级ID',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  `HEADMAN` varchar(30) DEFAULT NULL COMMENT '负责人',
  `TEL` varchar(50) DEFAULT NULL COMMENT '电话',
  `FUNCTIONS` varchar(255) DEFAULT NULL COMMENT '部门职能',
  `ADDRESS` varchar(255) DEFAULT NULL COMMENT '地址',
  PRIMARY KEY (`DEPARTMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_department`
--

LOCK TABLES `oa_department` WRITE;
/*!40000 ALTER TABLE `oa_department` DISABLE KEYS */;
INSERT INTO `oa_department` VALUES ('0956d8c279274fca92f4091f2a69a9ad','销售会计','xiaokuai','05896','d41af567914a409893d011aa53eda797','','','','',''),('3e7227e11dc14b4d9e863dd1a1fcedf6','成本会计','chengb','03656','d41af567914a409893d011aa53eda797','','','','',''),('5cccdb7c432449d8b853c52880058140','B公司','b','002','0','冶铁','李四','112','冶铁','河北'),('83a25761c618457cae2fa1211bd8696d','销售B组','xiaob','002365','cbbc84eddde947ba8af7d509e430eb70','','李四','','',''),('8f8b045470f342fdbc4c312ab881d62b','销售A组','xiaoA','0326','cbbc84eddde947ba8af7d509e430eb70','','张三','0201212','',''),('a0982dea52554225ab682cd4b421de47','1队','yidui','02563','8f8b045470f342fdbc4c312ab881d62b','','小王','12356989','',''),('a6c6695217ba4a4dbfe9f7e9d2c06730','A公司','a','001','0','挖煤','张三','110','洼煤矿','山西'),('cbbc84eddde947ba8af7d509e430eb70','销售部','xiaoshoubu','00201','5cccdb7c432449d8b853c52880058140','推销商品','小明','11236','推销商品','909办公室'),('d41af567914a409893d011aa53eda797','财务部','caiwubu','00101','a6c6695217ba4a4dbfe9f7e9d2c06730','负责发工资','王武','11236','管理财务','308办公室');
/*!40000 ALTER TABLE `oa_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_fhfile`
--

DROP TABLE IF EXISTS `oa_fhfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_fhfile` (
  `FHFILE_ID` varchar(100) NOT NULL,
  `NAME` varchar(30) DEFAULT NULL COMMENT '文件名',
  `FILEPATH` varchar(100) DEFAULT NULL COMMENT '路径',
  `CTIME` varchar(32) DEFAULT NULL COMMENT '上传时间',
  `BZ` varchar(100) DEFAULT NULL COMMENT '备注',
  `USERNAME` varchar(50) DEFAULT NULL COMMENT '长传者',
  `DEPARTMENT_ID` varchar(100) DEFAULT NULL COMMENT '部门ID',
  `FILESIZE` varchar(255) DEFAULT NULL COMMENT '文件大小',
  PRIMARY KEY (`FHFILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_fhfile`
--

LOCK TABLES `oa_fhfile` WRITE;
/*!40000 ALTER TABLE `oa_fhfile` DISABLE KEYS */;
INSERT INTO `oa_fhfile` VALUES ('0f92667b4bd84571adb39408a42f7ac1','xiaoxiong','2018020611282291045.jpg','2018-02-06 23:28:22','aa','admin','0','317.788');
/*!40000 ALTER TABLE `oa_fhfile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_staff`
--

DROP TABLE IF EXISTS `oa_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_staff` (
  `STAFF_ID` varchar(100) NOT NULL,
  `NAME` varchar(50) DEFAULT NULL COMMENT '姓名',
  `NAME_EN` varchar(50) DEFAULT NULL COMMENT '英文',
  `BIANMA` varchar(100) DEFAULT NULL COMMENT '编码',
  `DEPARTMENT_ID` varchar(100) DEFAULT NULL COMMENT '部门',
  `FUNCTIONS` varchar(255) DEFAULT NULL COMMENT '职责',
  `TEL` varchar(20) DEFAULT NULL COMMENT '电话',
  `EMAIL` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `SEX` varchar(10) DEFAULT NULL COMMENT '性别',
  `BIRTHDAY` varchar(32) DEFAULT NULL COMMENT '出生日期',
  `NATION` varchar(10) DEFAULT NULL COMMENT '民族',
  `JOBTYPE` varchar(30) DEFAULT NULL COMMENT '岗位类别',
  `JOBJOINTIME` varchar(32) DEFAULT NULL COMMENT '参加工作时间',
  `FADDRESS` varchar(100) DEFAULT NULL COMMENT '籍贯',
  `POLITICAL` varchar(30) DEFAULT NULL COMMENT '政治面貌',
  `PJOINTIME` varchar(32) DEFAULT NULL COMMENT '入团时间',
  `SFID` varchar(20) DEFAULT NULL COMMENT '身份证号',
  `MARITAL` varchar(10) DEFAULT NULL COMMENT '婚姻状况',
  `DJOINTIME` varchar(32) DEFAULT NULL COMMENT '进本单位时间',
  `POST` varchar(30) DEFAULT NULL COMMENT '现岗位',
  `POJOINTIME` varchar(32) DEFAULT NULL COMMENT '上岗时间',
  `EDUCATION` varchar(10) DEFAULT NULL COMMENT '学历',
  `SCHOOL` varchar(30) DEFAULT NULL COMMENT '毕业学校',
  `MAJOR` varchar(30) DEFAULT NULL COMMENT '专业',
  `FTITLE` varchar(30) DEFAULT NULL COMMENT '职称',
  `CERTIFICATE` varchar(30) DEFAULT NULL COMMENT '职业资格证',
  `CONTRACTLENGTH` int(2) NOT NULL COMMENT '劳动合同时长',
  `CSTARTTIME` varchar(32) DEFAULT NULL COMMENT '签订日期',
  `CENDTIME` varchar(32) DEFAULT NULL COMMENT '终止日期',
  `ADDRESS` varchar(100) DEFAULT NULL COMMENT '现住址',
  `USER_ID` varchar(100) DEFAULT NULL COMMENT '绑定账号ID',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`STAFF_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_staff`
--

LOCK TABLES `oa_staff` WRITE;
/*!40000 ALTER TABLE `oa_staff` DISABLE KEYS */;
INSERT INTO `oa_staff` VALUES ('9fd17463ffd7487ab90e683c76026655','www','www','ww','5cccdb7c432449d8b853c52880058140','ww','ww','www','男','2016-04-27','ww','ww','2016-05-03','ww','ww','2016-04-25','ww','未婚','2016-05-09','ww','2016-05-17','w','w','w','w','www',2,'2016-05-23','2016-05-16','w','san','www'),('c9f05f925dfc485b9e352916612ab669','fw','y','y','8f8b045470f342fdbc4c312ab881d62b','y','y','y','男','2016-06-08','y','y','2016-06-03','y','y','2016-05-31','y','已婚','2016-06-07','y','2016-06-08','y','y','y','y','y',4,'2016-06-21','2016-06-21','y','lisi','y');
/*!40000 ALTER TABLE `oa_staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_app_user`
--

DROP TABLE IF EXISTS `sys_app_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_app_user` (
  `USER_ID` varchar(100) NOT NULL,
  `USERNAME` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `RIGHTS` varchar(255) DEFAULT NULL,
  `ROLE_ID` varchar(100) DEFAULT NULL,
  `LAST_LOGIN` varchar(255) DEFAULT NULL,
  `IP` varchar(100) DEFAULT NULL,
  `STATUS` varchar(32) DEFAULT NULL,
  `BZ` varchar(255) DEFAULT NULL,
  `PHONE` varchar(100) DEFAULT NULL,
  `SFID` varchar(100) DEFAULT NULL,
  `START_TIME` varchar(100) DEFAULT NULL,
  `END_TIME` varchar(100) DEFAULT NULL,
  `YEARS` int(10) DEFAULT NULL,
  `NUMBER` varchar(100) DEFAULT NULL,
  `EMAIL` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_app_user`
--

LOCK TABLES `sys_app_user` WRITE;
/*!40000 ALTER TABLE `sys_app_user` DISABLE KEYS */;
INSERT INTO `sys_app_user` VALUES ('0b1a689b7cbf46128429989b2ad12f59',NULL,NULL,NULL,'',NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('1841d87c2bd14ad0a8cdee21bc4cf30a',NULL,NULL,NULL,'',NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('1e89e6504be349a68c025976b3ecc1d1','a1','698d51a19d8a121ce581499d7b701668','会员甲','','115b386ff04f4352b060dffcd2b5d1da','','','1','121','1212','1212','2015-12-02','2015-12-25',2,'111','313596790@qq.com'),('55d00299ec76448790e5f38da99b8ed6','dd','698d51a19d8a121ce581499d7b701668','1212','','1b67fc82ce89457a8347ae53e43a347e','','','1','1213','213123','213','2016-03-30','2016-03-31',123,'1121','213435345@qq.com'),('6d44cba257b643d19e10df86b61073d9',NULL,NULL,NULL,'',NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('7853b5ad3dc34e0485537059c1ecc582',NULL,NULL,NULL,'',NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('9543617e42324a58b2f47f7b27a63586',NULL,NULL,NULL,'',NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('9b0f2998ce0843ed898cb2fa768c65cc',NULL,NULL,NULL,'',NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sys_app_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_codeeditor`
--

DROP TABLE IF EXISTS `sys_codeeditor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_codeeditor` (
  `CODEEDITOR_ID` varchar(100) NOT NULL,
  `TYPE` varchar(30) DEFAULT NULL COMMENT '类型',
  `FTLNMAME` varchar(30) DEFAULT NULL COMMENT '文件名',
  `CTIME` varchar(32) DEFAULT NULL COMMENT '创建时间',
  `CODECONTENT` text COMMENT '代码',
  PRIMARY KEY (`CODEEDITOR_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_codeeditor`
--

LOCK TABLES `sys_codeeditor` WRITE;
/*!40000 ALTER TABLE `sys_codeeditor` DISABLE KEYS */;
INSERT INTO `sys_codeeditor` VALUES ('a449439b29bc40c4b84fa5cc1e31537c','createCode','mysql_SQL_Template','2017-06-12 17:55:05','SET FOREIGN_KEY_CHECKS=0;\n\n-- ----------------------------\n-- Table structure for `${tabletop}${objectNameUpper}`\n-- ----------------------------\nDROP TABLE IF EXISTS `${tabletop}${objectNameUpper}`;\nCREATE TABLE `${tabletop}${objectNameUpper}` (\n 		`${objectNameUpper}_ID` varchar(100) NOT NULL,\n	<#list fieldList as var>\n		<#if var[1] == \'Integer\'>\n		`${var[0]}` int(${var[5]}) NOT NULL COMMENT \'${var[2]}\',\n		<#elseif var[1] == \'Double\'>\n		`${var[0]}` double(${var[5]},${var[6]}) DEFAULT NULL COMMENT \'${var[2]}\',\n		<#else>\n		`${var[0]}` varchar(${var[5]}) DEFAULT NULL COMMENT \'${var[2]}\',\n		</#if>\n	</#list>\n  		PRIMARY KEY (`${objectNameUpper}_ID`)\n) ENGINE=InnoDB DEFAULT CHARSET=utf8;\n');
/*!40000 ALTER TABLE `sys_codeeditor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_createcode`
--

DROP TABLE IF EXISTS `sys_createcode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_createcode` (
  `CREATECODE_ID` varchar(100) NOT NULL,
  `PACKAGENAME` varchar(50) DEFAULT NULL COMMENT '包名',
  `OBJECTNAME` varchar(50) DEFAULT NULL COMMENT '类名',
  `TABLENAME` varchar(50) DEFAULT NULL COMMENT '表名',
  `FIELDLIST` varchar(5000) DEFAULT NULL COMMENT '属性集',
  `CREATETIME` varchar(100) DEFAULT NULL COMMENT '创建时间',
  `TITLE` varchar(255) DEFAULT NULL COMMENT '描述',
  `FHTYPE` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`CREATECODE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_createcode`
--

LOCK TABLES `sys_createcode` WRITE;
/*!40000 ALTER TABLE `sys_createcode` DISABLE KEYS */;
INSERT INTO `sys_createcode` VALUES ('002ea762e3e242a7a10ea5ca633701d8','system','Buttonrights','sys_,fh,BUTTONRIGHTS','NAME,fh,String,fh,名称,fh,是,fh,无,fh,255Q313596790','2016-01-16 23:20:36','按钮权限','single'),('00a938ea20934672800d0ffee0f7f64b','ehuarong','Goods','HR_,fh,GOODS','GOOD_ID,fh,String,fh,商品编号,fh,是,fh,无,fh,255,fh,0Q313596790GOODNAME,fh,String,fh,商品名称,fh,是,fh,无,fh,255,fh,0Q313596790GOODUNIT,fh,String,fh,商品单位,fh,是,fh,无,fh,255,fh,0Q313596790SPEC,fh,String,fh,商品规格,fh,是,fh,无,fh,255,fh,0Q313596790MEMO,fh,String,fh,商品说明,fh,是,fh,无,fh,255,fh,0Q313596790GOODCATEGORYID,fh,String,fh,商品类别号,fh,是,fh,无,fh,255,fh,0Q313596790REMARK,fh,String,fh,备注,fh,是,fh,无,fh,255,fh,0Q313596790CREATETIME,fh,Date,fh,创建时间,fh,否,fh,无,fh,32,fh,0Q313596790','2018-03-26 23:32:19','华榕商品表','single'),('043843a286f84549ad3fa71aac827f6f','system','FHlog','SYS_,fh,FHLOG','USERNAME,fh,String,fh,用户名,fh,是,fh,无,fh,100,fh,0Q313596790CZTIME,fh,Date,fh,操作时间,fh,否,fh,无,fh,32,fh,0Q313596790CONTENT,fh,String,fh,事件,fh,是,fh,无,fh,255,fh,0Q313596790','2016-05-10 21:10:16','操作日志记录','single'),('0ee023606efb45b9a3baaa072e502161','information','FtestMx','FH_,fh,FTESTMX','TITLE,fh,String,fh,标题,fh,是,fh,无,fh,255,fh,0Q313596790CHANGDU,fh,Integer,fh,长度,fh,是,fh,无,fh,11,fh,0Q313596790','2016-04-21 01:52:11','主表测试(明细)','sontable'),('1be959583e82473b82f6e62087bd0d38','information','Attached','TB_,fh,ATTACHED','NAME,fh,String,fh,NAME,fh,是,fh,无,fh,255,fh,0Q313596790FDESCRIBE,fh,String,fh,FDESCRIBE,fh,是,fh,无,fh,255,fh,0Q313596790PRICE,fh,Double,fh,PRICE,fh,是,fh,无,fh,11,fh,2Q313596790CTIME,fh,Date,fh,CTIME,fh,否,fh,无,fh,32,fh,0Q313596790','2016-04-21 17:07:59','主表测试','fathertable'),('3da8e8bd757c44148d89931a54d29c88','system','UserPhoto','SYS_,fh,USERPHOTO','USERNAME,fh,String,fh,用户名,fh,否,fh,无,fh,30,fh,0Q313596790PHOTO0,fh,String,fh,原图,fh,否,fh,无,fh,100,fh,0Q313596790PHOTO1,fh,String,fh,头像1,fh,否,fh,无,fh,100,fh,0Q313596790PHOTO2,fh,String,fh,头像2,fh,否,fh,无,fh,100,fh,0Q313596790PHOTO3,fh,String,fh,头像3,fh,否,fh,无,fh,100,fh,0Q313596790','2016-06-05 17:54:25','用户头像','single'),('4173a8c56a504dd6b6213d2b9cd3e91b','information','AttachedMx','TB_,fh,ATTACHEDMX','NAME,fh,String,fh,NAME,fh,是,fh,无,fh,255,fh,0Q313596790TITLE,fh,String,fh,TITLE,fh,是,fh,无,fh,255,fh,0Q313596790CTIME,fh,Date,fh,CTIME,fh,否,fh,无,fh,32,fh,0Q313596790PRICE,fh,Double,fh,PRICE,fh,是,fh,无,fh,11,fh,2Q313596790','2016-04-21 17:09:40','主表测试(明细)','sontable'),('41e07fb03763434daef41cd99d0406c3','system','LogInImg','SYS_,fh,LOGINIMG','NAME,fh,String,fh,文件名,fh,是,fh,无,fh,30,fh,0Q313596790FILEPATH,fh,String,fh,路径,fh,是,fh,无,fh,100,fh,0Q313596790TYPE,fh,Integer,fh,状态,fh,是,fh,无,fh,2,fh,0Q313596790FORDER,fh,Integer,fh,排序,fh,是,fh,无,fh,3,fh,0Q313596790','2016-06-03 17:53:22','登录页面背景图片','single'),('499706b2482e4c81a26be694b62c2a35','information','Area','A_,fh,AREA','NAME,fh,String,fh,地区名称,fh,是,fh,无,fh,32,fh,0Q313596790ANUMBER,fh,Integer,fh,编码,fh,是,fh,无,fh,4,fh,0Q313596790','2017-09-08 02:31:05','地区','tree'),('49d985e081ed44e6b34ba1b8c5466e39','fhdb','TimingBackUp','DB_,fh,TIMINGBACKUP','JOBNAME,fh,String,fh,任务名称,fh,否,fh,无,fh,50Q313596790CREATE_TIME,fh,Date,fh,创建时间,fh,否,fh,无,fh,32Q313596790TABLENAME,fh,String,fh,表名,fh,是,fh,无,fh,50Q313596790TYPE,fh,Integer,fh,类型,fh,否,fh,无,fh,1Q313596790FHTIME,fh,String,fh,时间规则,fh,是,fh,无,fh,30Q313596790TIMEEXPLAIN,fh,String,fh,规则说明,fh,是,fh,无,fh,100Q313596790BZ,fh,String,fh,备注,fh,是,fh,无,fh,255Q313596790','2016-04-09 11:53:38','定时备份','single'),('4def60c58aa148b7998270978660ef30','fhoa','Fhfile','OA_,fh,FHFILE','NAME,fh,String,fh,文件名,fh,是,fh,无,fh,30,fh,0Q313596790FILEPATH,fh,String,fh,路径,fh,是,fh,无,fh,100,fh,0Q313596790CTIME,fh,Date,fh,上传时间,fh,否,fh,无,fh,32,fh,0Q313596790BZ,fh,String,fh,备注,fh,是,fh,无,fh,100,fh,0Q313596790USERNAME,fh,String,fh,长传者,fh,否,fh,无,fh,50,fh,0Q313596790DEPARTMENT_ID,fh,String,fh,部门ID,fh,否,fh,无,fh,100,fh,0Q313596790FILESIZE,fh,String,fh,文件大小,fh,否,fh,无,fh,10,fh,0Q313596790','2016-05-27 20:52:01','文件管理','single'),('5ab2b66d9a9f4cf6ad51b78954cf1b1d','information','XueshengMx','X_,fh,XUESHENGMX','KEMU,fh,String,fh,科目,fh,是,fh,无,fh,100,fh,0Q313596790FENSHU,fh,Double,fh,分数,fh,是,fh,无,fh,3,fh,1Q313596790','2017-09-08 03:01:56','学生(明细)','sontable'),('6a93dc8348064e4c8d93f48e72c64689','ehuarong','Goods','HR_,fh,GOODS','GOOD_ID,fh,String,fh,商品编号,fh,是,fh,无,fh,255,fh,0Q313596790GOODNAME,fh,String,fh,商品名称,fh,是,fh,无,fh,255,fh,0Q313596790GOODUNIT,fh,String,fh,商品单位,fh,是,fh,无,fh,255,fh,0Q313596790SPEC,fh,String,fh,商品规格,fh,是,fh,无,fh,255,fh,0Q313596790MEMO,fh,String,fh,商品说明,fh,是,fh,无,fh,255,fh,0Q313596790GOODCATEGORYID,fh,String,fh,商品类别号,fh,是,fh,无,fh,255,fh,0Q313596790REMARK,fh,String,fh,备注,fh,是,fh,无,fh,255,fh,0Q313596790CREATETIME,fh,Date,fh,创建时间,fh,否,fh,无,fh,32,fh,0Q313596790','2018-03-26 23:43:30','华榕商品表','single'),('7899e622cafc40cdb775cf3294133d7d','system','LogInImg','SYS_,fh,LOGINIMG','NAME,fh,String,fh,文件名,fh,是,fh,无,fh,30,fh,0Q313596790FILEPATH,fh,String,fh,路径,fh,是,fh,无,fh,100,fh,0Q313596790TYPE,fh,Integer,fh,状态,fh,是,fh,无,fh,2,fh,0Q313596790FORDER,fh,Integer,fh,排序,fh,是,fh,无,fh,3,fh,0Q313596790','2017-04-10 03:13:05','登录页面背景图片','single'),('91af9fe509704fa68f6bca121359e3ec','fhoa','Staff','OA_,fh,STAFF','NAME,fh,String,fh,姓名,fh,是,fh,无,fh,50,fh,0Q313596790NAME_EN,fh,String,fh,英文,fh,是,fh,无,fh,50,fh,0Q313596790BIANMA,fh,String,fh,编码,fh,是,fh,无,fh,100,fh,0Q313596790DEPARTMENT_ID,fh,String,fh,部门,fh,是,fh,无,fh,100,fh,0Q313596790FUNCTIONS,fh,String,fh,职责,fh,是,fh,无,fh,255,fh,0Q313596790TEL,fh,String,fh,电话,fh,是,fh,无,fh,20,fh,0Q313596790EMAIL,fh,String,fh,邮箱,fh,是,fh,无,fh,50,fh,0Q313596790SEX,fh,String,fh,性别,fh,是,fh,无,fh,10,fh,0Q313596790BIRTHDAY,fh,Date,fh,出生日期,fh,是,fh,无,fh,32,fh,0Q313596790NATION,fh,String,fh,民族,fh,是,fh,无,fh,10,fh,0Q313596790JOBTYPE,fh,String,fh,岗位类别,fh,是,fh,无,fh,30,fh,0Q313596790JOBJOINTIME,fh,Date,fh,参加工作时间,fh,是,fh,无,fh,32,fh,0Q313596790FADDRESS,fh,String,fh,籍贯,fh,是,fh,无,fh,100,fh,0Q313596790POLITICAL,fh,String,fh,政治面貌,fh,是,fh,无,fh,30,fh,0Q313596790PJOINTIME,fh,Date,fh,入团时间,fh,是,fh,无,fh,32,fh,0Q313596790SFID,fh,String,fh,身份证号,fh,是,fh,无,fh,20,fh,0Q313596790MARITAL,fh,String,fh,婚姻状况,fh,是,fh,无,fh,10,fh,0Q313596790DJOINTIME,fh,Date,fh,进本单位时间,fh,是,fh,无,fh,32,fh,0Q313596790POST,fh,String,fh,现岗位,fh,是,fh,无,fh,30,fh,0Q313596790POJOINTIME,fh,Date,fh,上岗时间,fh,是,fh,无,fh,32,fh,0Q313596790EDUCATION,fh,String,fh,学历,fh,是,fh,无,fh,10,fh,0Q313596790SCHOOL,fh,String,fh,毕业学校,fh,是,fh,无,fh,30,fh,0Q313596790MAJOR,fh,String,fh,专业,fh,是,fh,无,fh,30,fh,0Q313596790FTITLE,fh,String,fh,职称,fh,是,fh,无,fh,30,fh,0Q313596790CERTIFICATE,fh,String,fh,职业资格证,fh,是,fh,无,fh,30,fh,0Q313596790CONTRACTLENGTH,fh,Integer,fh,劳动合同时长,fh,是,fh,无,fh,2,fh,0Q313596790CSTARTTIME,fh,Date,fh,签订日期,fh,是,fh,无,fh,32,fh,0Q313596790CENDTIME,fh,Date,fh,终止日期,fh,是,fh,无,fh,32,fh,0Q313596790ADDRESS,fh,String,fh,现住址,fh,是,fh,无,fh,100,fh,0Q313596790USER_ID,fh,String,fh,绑定账号ID,fh,否,fh,无,fh,100,fh,0Q313596790BZ,fh,String,fh,备注,fh,是,fh,无,fh,255,fh,0Q313596790','2016-04-23 20:44:31','员工管理','single'),('ac905cc1fc874c508aad10431f2df785','ehuarong','Orderinfo','HR_,fh,ORDERINFO','ODER_ID,fh,String,fh,订单编号,fh,是,fh,无,fh,255,fh,0Q313596790GOODNUM,fh,String,fh,订单数量,fh,是,fh,无,fh,255,fh,0Q313596790SELLNAME,fh,String,fh,发件人,fh,是,fh,无,fh,255,fh,0Q313596790SELLPHONE,fh,String,fh,发件电话,fh,是,fh,无,fh,255,fh,0Q313596790RECNAME,fh,String,fh,收件人,fh,是,fh,无,fh,255,fh,0Q313596790RECPHONE,fh,String,fh,收件电话,fh,是,fh,无,fh,255,fh,0Q313596790RECADDRESS,fh,String,fh,收件地址,fh,是,fh,无,fh,255,fh,0Q313596790EXPRESS,fh,String,fh,快递公司,fh,是,fh,无,fh,255,fh,0Q313596790EXPRESSNO,fh,String,fh,快递单号,fh,是,fh,无,fh,255,fh,0Q313596790SELLPRICE,fh,Double,fh,商品售价单价,fh,是,fh,无,fh,11,fh,3Q313596790SELLTOTALPRICE,fh,Double,fh,商品售价总价,fh,是,fh,无,fh,11,fh,3Q313596790PURCHASEPRICE,fh,Double,fh,商品采购单价,fh,是,fh,无,fh,11,fh,3Q313596790PURCHASETOTALPRICE,fh,Double,fh,商品采购总价,fh,是,fh,无,fh,11,fh,3Q313596790PLATFORMID,fh,String,fh,所属平台id,fh,是,fh,无,fh,255,fh,0Q313596790SUPPLIER_ID,fh,String,fh,供应商id ,fh,是,fh,无,fh,255,fh,0Q313596790SUPPLIER_EMAIL,fh,String,fh,供应商email,fh,是,fh,无,fh,255,fh,0Q313596790CREATETIME,fh,Date,fh,创建时间,fh,否,fh,无,fh,32,fh,0Q313596790REMARK,fh,String,fh,备注,fh,是,fh,无,fh,255,fh,0Q313596790','2018-03-29 00:05:25','订单信息表','single'),('ae92803163ff44539e91711cfbe35411','fhoa','Datajur','OA_,fh,DATAJUR','DEPARTMENT_IDS,fh,String,fh,部门ID组合,fh,否,fh,无,fh,5000,fh,0Q313596790STAFF_ID,fh,String,fh,员工ID,fh,否,fh,无,fh,100,fh,0Q313596790DEPARTMENT_ID,fh,String,fh,部门ID,fh,是,fh,无,fh,100,fh,0Q313596790','2016-04-27 03:49:39','数据权限表','single'),('bf35ab8b2d064bf7928a04bba5e5a6dd','system','Fhsms','SYS_,fh,FHSMS','CONTENT,fh,String,fh,内容,fh,是,fh,无,fh,1000Q313596790TYPE,fh,String,fh,类型,fh,否,fh,无,fh,5Q313596790TO_USERNAME,fh,String,fh,收信人,fh,是,fh,无,fh,255Q313596790FROM_USERNAME,fh,String,fh,发信人,fh,是,fh,无,fh,255Q313596790SEND_TIME,fh,String,fh,发信时间,fh,是,fh,无,fh,100Q313596790STATUS,fh,String,fh,状态,fh,否,fh,无,fh,5Q313596790SANME_ID,fh,String,fh,共同ID,fh,是,fh,无,fh,100Q313596790','2016-03-27 21:39:45','站内信','single'),('c7586f931fd44c61beccd3248774c68c','system','Department','SYS_,fh,DEPARTMENT','NAME,fh,String,fh,名称,fh,是,fh,无,fh,30Q313596790NAME_EN,fh,String,fh,英文,fh,是,fh,无,fh,50Q313596790BIANMA,fh,String,fh,编码,fh,是,fh,无,fh,50Q313596790PARENT_ID,fh,String,fh,上级ID,fh,否,fh,无,fh,100Q313596790BZ,fh,String,fh,备注,fh,是,fh,无,fh,255Q313596790HEADMAN,fh,String,fh,负责人,fh,是,fh,无,fh,30Q313596790TEL,fh,String,fh,电话,fh,是,fh,无,fh,50Q313596790FUNCTIONS,fh,String,fh,部门职能,fh,是,fh,无,fh,255Q313596790ADDRESS,fh,String,fh,地址,fh,是,fh,无,fh,255Q313596790','2015-12-20 01:49:25','组织机构','tree'),('c937e21208914e5b8fb1202c685bbf2f','fhdb','Fhdb','DB_,fh,FHDB','USERNAME,fh,String,fh,操作用户,fh,否,fh,无,fh,50Q313596790BACKUP_TIME,fh,Date,fh,备份时间,fh,否,fh,无,fh,32Q313596790TABLENAME,fh,String,fh,表名,fh,是,fh,无,fh,50Q313596790SQLPATH,fh,String,fh,存储位置,fh,否,fh,无,fh,300Q313596790TYPE,fh,Integer,fh,类型,fh,是,fh,无,fh,1Q313596790DBSIZE,fh,String,fh,文件大小,fh,否,fh,无,fh,10Q313596790BZ,fh,String,fh,备注,fh,否,fh,无,fh,255Q313596790','2016-03-30 13:46:54','数据库管理','single'),('d165025c63ea4e89a93bca4fcf41ba42','information','Area','A_,fh,AREA','ANUMBER,fh,Integer,fh,编码,fh,是,fh,无,fh,4,fh,0Q313596790','2017-09-08 02:32:42','地区','tree'),('d5e8a310478c4b5db40b45fa765b87eb','information','Xuesheng','X_,fh,XUESHENG','NAME,fh,String,fh,姓名,fh,是,fh,无,fh,32,fh,0Q313596790AGE,fh,Integer,fh,年龄,fh,是,fh,无,fh,3,fh,0Q313596790','2017-09-08 02:56:24','学生','fathertable'),('e863404caba5407db21c016f65122ec9','orderinfo','Orderinfo','HR_,fh,ORDERINFO','ODER_ID,fh,String,fh,订单编号,fh,是,fh,无,fh,255,fh,0Q313596790GOODNUM,fh,String,fh,订单数量,fh,是,fh,无,fh,255,fh,0Q313596790SELLNAME,fh,String,fh,发件人,fh,是,fh,无,fh,255,fh,0Q313596790SELLPHONE,fh,String,fh,发件电话,fh,是,fh,无,fh,255,fh,0Q313596790RECNAME,fh,String,fh,收件人,fh,是,fh,无,fh,255,fh,0Q313596790RECPHONE,fh,String,fh,收件电话,fh,是,fh,无,fh,255,fh,0Q313596790RECADDRESS,fh,String,fh,收件地址,fh,是,fh,无,fh,255,fh,0Q313596790EXPRESS,fh,String,fh,快递公司,fh,是,fh,无,fh,255,fh,0Q313596790EXPRESSNO,fh,String,fh,快递单号,fh,是,fh,无,fh,255,fh,0Q313596790SELLPRICE,fh,Double,fh,商品售价单价,fh,是,fh,无,fh,11,fh,3Q313596790SELLTOTALPRICE,fh,Double,fh,商品售价总价,fh,是,fh,无,fh,11,fh,3Q313596790PURCHASEPRICE,fh,Double,fh,商品采购单价,fh,是,fh,无,fh,11,fh,3Q313596790PURCHASETOTALPRICE,fh,Double,fh,商品采购总价,fh,是,fh,无,fh,11,fh,3Q313596790PLATFORMID,fh,String,fh,所属平台id,fh,是,fh,无,fh,255,fh,0Q313596790SUPPLIER_ID,fh,String,fh,供应商id ,fh,是,fh,无,fh,255,fh,0Q313596790SUPPLIER_EMAIL,fh,String,fh,供应商email,fh,是,fh,无,fh,255,fh,0Q313596790CREATETIME,fh,Date,fh,创建时间,fh,否,fh,无,fh,32,fh,0Q313596790REMARK,fh,String,fh,备注,fh,是,fh,无,fh,255,fh,0Q313596790','2018-03-29 00:00:55','订单信息表','single'),('f148276493914b1ba78942d0124d482c','system','CodeEditor','SYS_,fh,CODEEDITOR','TYPE,fh,String,fh,类型,fh,是,fh,无,fh,30,fh,0Q313596790FTLNMAME,fh,String,fh,文件名,fh,是,fh,无,fh,30,fh,0Q313596790CTIME,fh,Date,fh,创建时间,fh,否,fh,无,fh,32,fh,0Q313596790CODECONTENT,fh,String,fh,代码,fh,是,fh,无,fh,255,fh,0Q313596790','2017-06-11 22:35:02','代码编辑器','single'),('fe239f8742194481a5b56f90cad71520','system','Fhbutton','SYS_,fh,FHBUTTON','NAME,fh,String,fh,名称,fh,是,fh,无,fh,30Q313596790QX_NAME,fh,String,fh,权限标识,fh,是,fh,无,fh,50Q313596790BZ,fh,String,fh,备注,fh,是,fh,无,fh,255Q313596790','2016-01-15 18:38:40','按钮管理','single'),('ff6e6cdc87ba42579b033cf4925d4d70','dst','DataSource2','DS_,fh,DATASOURCE2','TITLE,fh,String,fh,标题,fh,是,fh,无,fh,100,fh,0Q313596790CONTENT,fh,String,fh,内容,fh,是,fh,无,fh,255,fh,0Q313596790','2016-05-23 15:51:46','第2数据源例子','single');
/*!40000 ALTER TABLE `sys_createcode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dictionaries`
--

DROP TABLE IF EXISTS `sys_dictionaries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_dictionaries` (
  `DICTIONARIES_ID` varchar(100) NOT NULL,
  `NAME` varchar(30) DEFAULT NULL COMMENT '名称',
  `NAME_EN` varchar(50) DEFAULT NULL COMMENT '英文',
  `BIANMA` varchar(50) DEFAULT NULL COMMENT '编码',
  `ORDER_BY` int(11) NOT NULL COMMENT '排序',
  `PARENT_ID` varchar(100) DEFAULT NULL COMMENT '上级ID',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  `TBSNAME` varchar(100) DEFAULT NULL COMMENT '排查表',
  PRIMARY KEY (`DICTIONARIES_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dictionaries`
--

LOCK TABLES `sys_dictionaries` WRITE;
/*!40000 ALTER TABLE `sys_dictionaries` DISABLE KEYS */;
INSERT INTO `sys_dictionaries` VALUES ('00ef925d227444859eef2057693722ae','达州','dazhou','0032504',4,'d3538add7125404aba4b0007ef9fde50','达州市',''),('010692054ac24eeebf5b8067f0f0521a','安庆','anqing','0030401',1,'249999f296d14f95b8138a30bbb2c374','安庆市',''),('023473e9e6204583a110531036357514','山西','shanxi','00323',23,'1','山西省',''),('02e5eb8f50bd4824ad97427e2b372d14','绥化','suihua','0031312',12,'b2d4133b5dbf4599ada940620d2ab250','绥化市',''),('035fe989f54742ac8b64b80b24213442','来宾','laibin','0030809',9,'c5f3d426c582410281f89f1451e1d854','来宾市',''),('055273fe79f94e09a64698dab8d30ea8','揭阳','jieyang','0030708',8,'0dd1f40bcb9d46aeba015dc19645a5b9','揭阳市',''),('05ab2921b64d4f5c935c35228cc49ecb','大同','datong','0032302',2,'023473e9e6204583a110531036357514','大同市',''),('05ed855479d94b139c77ae82452bb39c','涪陵区','fulingqu','0033102',2,'1c85fbd06cf840d093f3640aca1b6b2d','涪陵区',''),('076995f7d0034b32a94e0130d406d137','湖州','huzhou','0033002',2,'6d846178376549ed878d11d109819f25','湖州市',''),('076a163af6814f93954a543bd3b2fa4d','广州','guangzhou','0030704',4,'0dd1f40bcb9d46aeba015dc19645a5b9','广州市',''),('085ebd2776384eff842de8b61b781a7e','潼南区','tongnanqu','0033122',22,'1c85fbd06cf840d093f3640aca1b6b2d','潼南区',''),('0953fe05e34642169c4cf24492b163b9','湘西','xiangxi','0031514',14,'c59f91630bef4289b71fcb2a48994582','湘西市',''),('098bf5e3603e44889a2c4bb25e350400','阿坝','a\'ba','0032501',1,'d3538add7125404aba4b0007ef9fde50','阿坝市',''),('0a2561ec256b4f46b4fa76c621256595','鹤岗','hegang','0031304',4,'b2d4133b5dbf4599ada940620d2ab250','鹤岗市',''),('0a65f2ef68d54b7c8772e1d916684c4a','岳阳','yueyang','0031506',6,'c59f91630bef4289b71fcb2a48994582','岳阳市',''),('0a754e878c304b99bf5d34a82ca3705c','吉林','jilin','0031604',4,'857be71b0d6d4a40a2c83476824206d1','吉林市',''),('0b08e52f2b264d0da66d37e718e32aba','常德','changde','0031507',7,'c59f91630bef4289b71fcb2a48994582','常德市',''),('0c908137935946ac885cb56e55ff4f5d','北碚区','beibeiqu','0033109',9,'1c85fbd06cf840d093f3640aca1b6b2d','北碚区',''),('0dba32de24014bcab807fd0fc51953aa','北海','beihai','0030802',2,'c5f3d426c582410281f89f1451e1d854','北海市',''),('0dd1f40bcb9d46aeba015dc19645a5b9','广东','guangdong','00307',7,'1','广东省',''),('0e18ab3edf5e43ee8737c156b0b50692','吉安','ji\'an','0031803',3,'cb3008cbd6ae4b5f8cebd2254ccb8603','吉安市',''),('0eb279a28a0d43c7a075d58c6cfc3e02','长寿区','changshouqu','0033115',15,'1c85fbd06cf840d093f3640aca1b6b2d','长寿区',''),('0efda23d751b42cb9472ca4f80cdf6c5','德州','dezhou','0030303',3,'10f46a521ea0471f8d71ee75ac3b5f3a','德州市',''),('0f975f2f51e245439b7d759f822a4a43','嘉定区','jiadingqu','0030210',10,'f1ea30ddef1340609c35c88fb2919bee','嘉定区',''),('1','地区','diqu','003',3,'0','地区',''),('10a2b2b54bce432baf603c7fa4b45de0','淮北','huaibei','0030409',9,'249999f296d14f95b8138a30bbb2c374','淮北市',''),('10c14cd82df9496bb86c5681ddfb92fb','本溪','benxi','0031902',2,'b3366626c66c4b61881f09e1722e8495','本溪市',''),('10f46a521ea0471f8d71ee75ac3b5f3a','山东','shandong','00303',3,'1','山东省',''),('10f5278b19824877988e8baa5a1b58f4','邯郸','handan','0031104',4,'75362368f22f4d60a810c2a45cced487','邯郸市',''),('11ab8df614c14451bb08a91fbe05162e','防城港','fangchenggang','0030804',4,'c5f3d426c582410281f89f1451e1d854','防城港市',''),('12a62a3e5bed44bba0412b7e6b733c93','北京','beijing','00301',1,'1','北京',''),('13b4d440cdd043378c2bbd0b797bc7b7','黄石','huangshi','0031404',4,'312b80775e104ba08c8244a042a658df','黄石市',''),('13e9e380abed4def837bea1671b92633','大兴安岭','daxinganling','0031302',2,'b2d4133b5dbf4599ada940620d2ab250','大兴安岭市',''),('14452abafbef4cadbb05a5a74a61eb6f','广安','guang\'an','0032507',7,'d3538add7125404aba4b0007ef9fde50','广安市',''),('158588bf48464dcca0e656968b8e09c0','密云区','miyunqu','0030115',15,'12a62a3e5bed44bba0412b7e6b733c93','密云区',''),('159d49075827476490aee58956fb159c','潜江','qianjiang','0031406',6,'312b80775e104ba08c8244a042a658df','潜江市',''),('15da226f465b4dac95c8333fd3d81747','淮安','huaian','0031702',2,'577405ff648240959b3765c950598ab0','淮安市',''),('16535e38a2534f4781353e7570831ea1','丽江','lijiang','0032909',9,'510607a1836e4079b3103e14ec5864ed','丽江',''),('165fd1c02d98439d8d7cc2e81def88d6','陇南','longnan','0030609',9,'3283f1a77180495f9a0b192d0f9cdd35','陇南市',''),('16a1eb63489e4d28827fc16a90e2ed61','贵港','guigang','0030805',5,'c5f3d426c582410281f89f1451e1d854','贵港市',''),('1895a514cda74329817bce6a5fe918f4','济源','jiyuan','0031203',3,'7336944efb4b40fcae9118fc9a970d2d','济源市',''),('1929f99821f2484fa33991233c1555e9','大理','dali','0032904',4,'510607a1836e4079b3103e14ec5864ed','大理',''),('192a36eb3d234a909e339c06b9cf723a','许昌','xuchang','0031215',15,'7336944efb4b40fcae9118fc9a970d2d','许昌市',''),('19cf8222eac9457280ebb40f14052590','南岸区','nan\'anqu','0033108',8,'1c85fbd06cf840d093f3640aca1b6b2d','南岸区',''),('1a99e7e302ce4f24b4b5d5d4b20a75fe','清远','qingyuan','0030711',11,'0dd1f40bcb9d46aeba015dc19645a5b9','清远市',''),('1ac809034f3d471592a5c74e19c7f1bc','烟台','yantai','0030315',15,'10f46a521ea0471f8d71ee75ac3b5f3a','烟台市',''),('1b65dd2a2057489c9598c789b4114d24','孝感','xiaogan','0031415',15,'312b80775e104ba08c8244a042a658df','孝感市',''),('1b79421601744059a4ef6b0ca9be32f9','上学期','shangxueqi','0010101',1,'5b1905ef82bf48039a96cd5dd1d8da10','上学期',''),('1b8b44f0c4384a09987ab0c5d9ceedd2','神农架林区','shennongjialinqu','0031407',7,'312b80775e104ba08c8244a042a658df','神农架林区',''),('1c4313525bdc4d4b9f7849dfb614cfb3','柳州','liuzhou','0030810',10,'c5f3d426c582410281f89f1451e1d854','柳州市',''),('1c85fbd06cf840d093f3640aca1b6b2d','重庆','chongqing','00331',31,'1','重庆',''),('1cf92384c7ee46faa91acface462b32f','沧州','cangzhou','0031102',2,'75362368f22f4d60a810c2a45cced487','沧州市',''),('1d0deff7da2745cc960cfa9ae07bdd13','抚顺','fushun','0031906',6,'b3366626c66c4b61881f09e1722e8495','抚顺市',''),('1d6d2d9af05849da9807d4cba0144695','南通','nantong','0031705',5,'577405ff648240959b3765c950598ab0','南通市',''),('1e228d052ec24bb7ba64524f51689cef','鄂尔多斯','eerduosi','0032005',5,'c072c248c7ab47dda7bf24f5e577925c','鄂尔多斯市',''),('1e429ce404794a30aad09bc592d0f5ce','荆门','jingmen','0031405',5,'312b80775e104ba08c8244a042a658df','荆门市',''),('1e89ca839dbf46a3bc8c02b7d55802c5','长沙','changsha','0031501',1,'c59f91630bef4289b71fcb2a48994582','长沙市',''),('2087851693514e3c9c98fd843fb5b32c','河西区','hexiqu','0032603',3,'2c254799d3454f2cbc338ef5712548e9','河西区',''),('20a08ca32856488dad122529f901fb9b','固原','guyuan','0032101',1,'5690b0534fe745e5ba0f504f0c260559','固原市',''),('20f6d6c3b3234c21b52755ab6b690ffe','杭州','hangzhou','0033001',1,'6d846178376549ed878d11d109819f25','杭州市',''),('212dbe5474304ad8b5f6e6049a72da46','包头','baotou','0032003',3,'c072c248c7ab47dda7bf24f5e577925c','包头市',''),('217c993dce9544c89279e88bdd60e7a8','黄冈','huanggang','0031403',3,'312b80775e104ba08c8244a042a658df','黄冈市',''),('22ef24142b0a4d6e9f05582e3c8790a9','济南','jinan','0030301',1,'10f46a521ea0471f8d71ee75ac3b5f3a','济南市',''),('2303cab27d704a259d7b0c42a687f3db','马鞍山','maanshan','0030413',13,'249999f296d14f95b8138a30bbb2c374','马鞍山市',''),('23aff8da2e6c4513be3155f372c45046','石嘴山','shizuishan','0032103',3,'5690b0534fe745e5ba0f504f0c260559','石嘴山市',''),('23caa037fe8c4283b7a7fc42da4a45a9','武威','wuwei','0030613',13,'3283f1a77180495f9a0b192d0f9cdd35','武威市',''),('23f71d660bb94d239dde6738b73d3905','延边','yanbian','0031609',9,'857be71b0d6d4a40a2c83476824206d1','延边市',''),('24007511f8ec42da8c6555305afe56ce','青岛','qindao','0030310',10,'10f46a521ea0471f8d71ee75ac3b5f3a','青岛市',''),('2431e2f471624fd9bf0f76b7049b1296','驻马店','zhumadian','0031218',18,'7336944efb4b40fcae9118fc9a970d2d','驻马店市',''),('244ffa16c2cd4594af2dfed2f7257d24','德阳','deyang','0032505',5,'d3538add7125404aba4b0007ef9fde50','德阳市',''),('2477f3e5e2c94c73844b060d9dc82316','深圳','shenzhen','0030715',15,'0dd1f40bcb9d46aeba015dc19645a5b9','深圳市',''),('249999f296d14f95b8138a30bbb2c374','安徽','anhui','00304',4,'1','安徽省',''),('25892ce9cba1429fb1b45d4aaeaf3bca','石家庄','shijiazhuang','0031108',8,'75362368f22f4d60a810c2a45cced487','石家庄市',''),('2627d3e9f98a4cdfbe0f59a4c5d3772a','白银','baiyin','0030601',1,'3283f1a77180495f9a0b192d0f9cdd35','白银市',''),('26a79d023ad7483194241cddf97f3689','莱芜','laiwu','0030307',7,'10f46a521ea0471f8d71ee75ac3b5f3a','莱芜市',''),('26b093ae7635474d8da8162efe7e4035','合川区','hechuanqu','0033117',17,'1c85fbd06cf840d093f3640aca1b6b2d','合川区',''),('26d4e79797d34b11b58eb12e5c0c55ae','抚州','fuzhou','0031801',1,'cb3008cbd6ae4b5f8cebd2254ccb8603','抚州市',''),('273f2c545056473abaf320327073b48b','无锡','wuxi','0031709',9,'577405ff648240959b3765c950598ab0','无锡市',''),('27927fbc83154894b096221da15b326a','保定','baoding','0031101',1,'75362368f22f4d60a810c2a45cced487','保定市',''),('287baf1c903444359971b0ce8d58dce2','普洱','pu\'er','0032912',12,'510607a1836e4079b3103e14ec5864ed','普洱',''),('29a4dbca082b49078af67caf5fd28f4f','漳州','zhangzhou','0030509',9,'d4066f6f425a4894a77f49f539f2a34f','漳州市',''),('2a4c3b9f024743d19907b36ab4a43499','宣城','xuancheng','0030417',17,'249999f296d14f95b8138a30bbb2c374','宣城市',''),('2a4f0cb0748645bab53b94b62412df04','黔西南','qianxinan','0030907',7,'592f6fcf45a74524aa8ea853fc9761d5','黔西南市',''),('2ae081dd5d3c47b584fdaf24769e49e1','玉溪','yuxi','0032915',15,'510607a1836e4079b3103e14ec5864ed','玉溪',''),('2ba8e6d0fd944983aa19b781c6b53477','海南','hainan','00310',10,'1','海南省',''),('2bd0431e3566451297ecd194287a878a','甘孜','ganzi','0032506',6,'d3538add7125404aba4b0007ef9fde50','甘孜',''),('2c0da3154cc74d7990c597bed6ebf2d6','大兴区','daxingqu','0030112',12,'12a62a3e5bed44bba0412b7e6b733c93','大兴区',''),('2c254799d3454f2cbc338ef5712548e9','天津','tianjin','00326',26,'1','天津',''),('2d0e4687904b48738ac6bd6a42e7f32d','忻州','xinzhou','0032309',9,'023473e9e6204583a110531036357514','忻州市',''),('2d0ff92556b544c19dbfc8b8b055e19a','常州','changzhou','0031701',1,'577405ff648240959b3765c950598ab0','常州市',''),('2e3c279cf0a44115869049e4a6d9ed08','西宁','xining','0032207',7,'5a80e3435c0e4dc09bafceeadb38e5f0','西宁',''),('2f097a8914de4b01a04bf61852435672','阿勒泰','a\'letai','0032802',2,'2fabed91c6d94e698ed449165cd250ca','阿勒泰',''),('2f5e433682f24e20b600532062ff0bcb','白山','baishan','0031602',2,'857be71b0d6d4a40a2c83476824206d1','白山市',''),('2f7f68eb9be845be90e74a0763de2c7f','平谷区','pingguqu','0030114',14,'12a62a3e5bed44bba0412b7e6b733c93','平谷区',''),('2f8e7a55eaab4649b9abe43ade744e58','大庆','daqing','0031301',1,'b2d4133b5dbf4599ada940620d2ab250','大庆市',''),('2fabed91c6d94e698ed449165cd250ca','新疆','xinjiang','00328',28,'1','新疆',''),('30d424f63bf44e8391683f371ed3552f','秦皇岛','qinhuangdao','0031107',7,'75362368f22f4d60a810c2a45cced487','秦皇岛市',''),('312b80775e104ba08c8244a042a658df','湖北','hubei','00314',14,'1','湖北省',''),('3186f859efa246f793401c475d3d0090','阿里','a\'li','0032701',1,'3e846b08dbbe495e93bc93f8f202de79','阿里',''),('325e45e49c1849efb7fea2296f686210','赣州','ganzhou','0031802',2,'cb3008cbd6ae4b5f8cebd2254ccb8603','赣州市',''),('3283f1a77180495f9a0b192d0f9cdd35','甘肃','gansu','00306',6,'1','甘肃省',''),('329838f633f340779483910f33387ccd','通州区','tongzhouqu','0030109',9,'12a62a3e5bed44bba0412b7e6b733c93','通州区',''),('3326f321dfe54e5292e94a9f2a518723','乌鲁木齐','wulumuqi','0032812',12,'2fabed91c6d94e698ed449165cd250ca','乌鲁木齐',''),('33fe30734ed84994bdd46ebe69aac088','朝阳区','chaoyangqu','0030103',3,'12a62a3e5bed44bba0412b7e6b733c93','朝阳区',''),('34bc05269e304e2e99c9ded314a12321','石景山区','shijingshanqu','0030105',5,'12a62a3e5bed44bba0412b7e6b733c93','石景山区',''),('34d6634b8baa47a3b1c0d0346d93873b','和平区','hepingqu','0032601',1,'2c254799d3454f2cbc338ef5712548e9','和平区',''),('3521e41344aa42aaa1cd212482992055','漯河','luohe','0031207',7,'7336944efb4b40fcae9118fc9a970d2d','漯河市',''),('38bc876c1cab4434af9d14be194463c8','南充','nanchong','0032514',14,'d3538add7125404aba4b0007ef9fde50','南充市',''),('39595ea4b765445dae9c26ae870b3a0f','克州','kezhou','0032809',9,'2fabed91c6d94e698ed449165cd250ca','克州',''),('3a3b4ea7445a4aec80083e5957028990','汕头','shantou','0030712',12,'0dd1f40bcb9d46aeba015dc19645a5b9','汕头市',''),('3a5d1b6e800541c683724672cae3e0f6','泰安','taian','0030312',12,'10f46a521ea0471f8d71ee75ac3b5f3a','泰安市',''),('3ad7c52e9a7044a1a9ab00f29f8cef7c','阿克苏','a\'kesu','0032801',1,'2fabed91c6d94e698ed449165cd250ca','阿克苏',''),('3ae7c64c40c147eeb3898883e20a7fe0','山南','shannan','0032707',7,'3e846b08dbbe495e93bc93f8f202de79','山南',''),('3d2a8f11e6d345b5af2f8e5d8bb6bb7a','鹰潭','yingtan','0031811',11,'cb3008cbd6ae4b5f8cebd2254ccb8603','鹰潭市',''),('3dbed4444dfc4884ab57d769ceac9507','松江区','songjiangqu','0030213',13,'f1ea30ddef1340609c35c88fb2919bee','松江区',''),('3e846b08dbbe495e93bc93f8f202de79','西藏','xizang','00327',27,'1','西藏',''),('3eed1c5fb2c9420dbe6e76fdb0f9c4cb','眉山','meishan','0032511',11,'d3538add7125404aba4b0007ef9fde50','眉山市',''),('3ef5fb1ad8e24696a9de78b987847238','中学','zhongxue','00102',2,'b602b0bc378a46629cc37dc037eb9684','中学',''),('3f7c5e8ba51849549f5e5dfee72566cc','呼伦贝尔','hulunbeier','0032007',7,'c072c248c7ab47dda7bf24f5e577925c','呼伦贝尔市',''),('3fb6c72b11124211a22d9f8f40715737','辽阳','liaoyang','0031910',10,'b3366626c66c4b61881f09e1722e8495','辽阳市',''),('3fffacbb502d4647bd358ff00412f536','长治','changzhi','0032301',1,'023473e9e6204583a110531036357514','长治市',''),('407fa7f152f4461582cfd6904b2c454a','晋城','jincheng','0032303',3,'023473e9e6204583a110531036357514','晋城市',''),('415fe5fbf3054a3ea2ebdbe24ce4c49f','永川区','yongchuanqu','0033118',18,'1c85fbd06cf840d093f3640aca1b6b2d','永川区',''),('417d25314a9e43c6b7b725db160db360','延安','yan\'an','0032409',9,'534850c72ceb4a57b7dc269da63c330a','延安市',''),('4266f08d4bc24321bba7ea3a83a8ba95','永州','yongzhou','0031511',11,'c59f91630bef4289b71fcb2a48994582','永州市',''),('429dc62e0f6641b8b2ddced272d5d087','遵义','zunyi','0030909',9,'592f6fcf45a74524aa8ea853fc9761d5','遵义市',''),('432c0a1be10143beba6de15ad8811b64','安顺','anshun','0030901',1,'592f6fcf45a74524aa8ea853fc9761d5','安顺市',''),('44fee1b9a9e141f9bdf90053f4972d2e','北辰区','beichenqu','0032610',10,'2c254799d3454f2cbc338ef5712548e9','北辰区',''),('458411aef2d34ccd99ab5976f0f1f030','金华','jinhua','0033004',4,'6d846178376549ed878d11d109819f25','金华市',''),('45a5be4b22ec494c99b112a7c96bca47','钦州','qinzhou','0030812',12,'c5f3d426c582410281f89f1451e1d854','钦州市',''),('4795a00ae89441ce82bcabdf086e8316','宝鸡','baoji','0032402',2,'534850c72ceb4a57b7dc269da63c330a','宝鸡市',''),('480875fd43a947119e24c2302eeead53','伊春','yichun','0031313',13,'b2d4133b5dbf4599ada940620d2ab250','伊春市',''),('4921e0e6f9d445cdb6a4b3da98ab3555','林芝','linzhi','0032704',4,'3e846b08dbbe495e93bc93f8f202de79','林芝',''),('4972af008f074efd91ea8312587afb42','牡丹江','mudanjiang','0031308',8,'b2d4133b5dbf4599ada940620d2ab250','牡丹江市',''),('49b4639e83e441c581bfdefda3a9ac27','宜春','yichun','0031810',10,'cb3008cbd6ae4b5f8cebd2254ccb8603','宜春市',''),('4b41fbe4cdae414a91af371e3105ebe5','景德镇','jingdezhen','0031804',4,'cb3008cbd6ae4b5f8cebd2254ccb8603','景德镇市',''),('4b72f022312e4664ae7863b343239ff0','淄博','zibo','0030317',17,'10f46a521ea0471f8d71ee75ac3b5f3a','淄博市',''),('4be3e0a560a2486eae928b44110e971e','白城','baicheng','0031601',1,'857be71b0d6d4a40a2c83476824206d1','白城市',''),('4c5dbcb293bf40f8837c0acec1ad67eb','佳木斯','jiamusi','0031307',7,'b2d4133b5dbf4599ada940620d2ab250','佳木斯市',''),('4cee922697a64ec78de69210e8e40af1','昌都','changdu','0032702',2,'3e846b08dbbe495e93bc93f8f202de79','昌都',''),('50b42656af3f4068984fa042e81d7d22','威海','weihai','0030313',13,'10f46a521ea0471f8d71ee75ac3b5f3a','威海市',''),('510607a1836e4079b3103e14ec5864ed','云南','yunnan','00329',29,'1','云南省',''),('512a316326984ed8aa32d7f610b7604f','玉树','yushu','0032208',8,'5a80e3435c0e4dc09bafceeadb38e5f0','玉树',''),('51f23688604848809184ec828f89cfca','嘉兴','jiaxing','0033003',3,'6d846178376549ed878d11d109819f25','嘉兴市',''),('5259c4093aa84f7c88a367685581fbc6','门头沟区','mentougouqu','0030107',7,'12a62a3e5bed44bba0412b7e6b733c93','门头沟区',''),('52630830669149edba48a7bb9b06e297','中卫','zhongwei','0032106',6,'5690b0534fe745e5ba0f504f0c260559','中卫市',''),('534850c72ceb4a57b7dc269da63c330a','陕西','shanxi','00324',24,'1','陕西省',''),('537974fdf5f54b8f99452bb8a03cf37b','厦门','xiamen','0030508',8,'d4066f6f425a4894a77f49f539f2a34f','厦门市',''),('53ca3f5aede8420b835b38bbc542da81','松源','songyuan','0031607',7,'857be71b0d6d4a40a2c83476824206d1','松源市',''),('558d920174014b4cb5a0c8f518b5819b','东城区','dongchengqu','0030101',1,'12a62a3e5bed44bba0412b7e6b733c93','东城区',''),('56103b0e83a44d07a6025061fab4cebc','运城','yuncheng','0032311',11,'023473e9e6204583a110531036357514','运城市',''),('5690b0534fe745e5ba0f504f0c260559','宁夏','ningxia','00321',21,'1','宁夏',''),('576fa3bd7d294f61af1315e95f70d44c','九龙坡区','jiulongpoqu','0033107',7,'1c85fbd06cf840d093f3640aca1b6b2d','九龙坡区',''),('577405ff648240959b3765c950598ab0','江苏','jiangsu','00317',17,'1','江苏省',''),('58ed29aefce044339ecf067f514c43cb','宁德','ningde','0030504',4,'d4066f6f425a4894a77f49f539f2a34f','宁德市',''),('5908fbf750a347b8a6b82af7778bb866','商洛','shangluo','0032404',4,'534850c72ceb4a57b7dc269da63c330a','商洛市',''),('592f6fcf45a74524aa8ea853fc9761d5','贵州','guizhou','00309',9,'1','贵州省',''),('59dbb93b007d44a6ae97744ac14e642c','龙岩','longyan','0030502',2,'d4066f6f425a4894a77f49f539f2a34f','龙岩市',''),('5a80e3435c0e4dc09bafceeadb38e5f0','青海','qinghai','00322',22,'1','青海',''),('5b1905ef82bf48039a96cd5dd1d8da10','小学','xiaoxue','00101',1,'b602b0bc378a46629cc37dc037eb9684','小学',''),('5b5747166f714882b5cdfbeb7856f965','周口','zhoukou','0031217',17,'7336944efb4b40fcae9118fc9a970d2d','周口市',''),('5c91965168eb4deaab99266bbb4b64e1','朝阳','chaoyang','0031903',3,'b3366626c66c4b61881f09e1722e8495','朝阳市',''),('5d2d367b0aee49449e65d0dd7601ee29','巴中','bazhong','0032502',2,'d3538add7125404aba4b0007ef9fde50','巴中市',''),('5ddde49610d4433eb157897d01ba6838','东莞','dongguan','0030702',2,'0dd1f40bcb9d46aeba015dc19645a5b9','东莞市',''),('5e85d09db1054472bcca22d82da6ec5d','乐山','leshan','0032509',9,'d3538add7125404aba4b0007ef9fde50','乐山市',''),('60c96ec0debf4cc4bf5974c93d4f638c','阳泉','yangquan','0032310',10,'023473e9e6204583a110531036357514','阳泉市',''),('61c3711334fe44b0806e717e6fb238b0','滨海新区','binhaixinqu','0032613',13,'2c254799d3454f2cbc338ef5712548e9','滨海新区',''),('6214f40ad2704fb6af0ded59420ca958','安康','ankang','0032401',1,'534850c72ceb4a57b7dc269da63c330a','安康市',''),('62ed6854726c4674ae2f5b676ddec7fb','新乡','xinxiang','0031213',13,'7336944efb4b40fcae9118fc9a970d2d','新乡市',''),('6303e3eeffb441018044b039063e3f96','丹东','dandong','0031905',5,'b3366626c66c4b61881f09e1722e8495','丹东市',''),('644316de71f942f9a90eb1f810eca872','怀柔区','huairouqu','0030113',13,'12a62a3e5bed44bba0412b7e6b733c93','怀柔区',''),('64a03236dd084d09ada9a1ca22b3815f','长春','changchun','0031603',3,'857be71b0d6d4a40a2c83476824206d1','长春市',''),('65629a05de764a19b66b752726f5cdbd','海淀区','haidianqu','0030106',6,'12a62a3e5bed44bba0412b7e6b733c93','海淀区',''),('6567a081f5d142779e17edbda3da9a04','宁波','ningbo','0033006',6,'6d846178376549ed878d11d109819f25','宁波市',''),('6624ad3b318149f3a8ee5beef1b8b38f','肇庆','zhaoqing','0030719',19,'0dd1f40bcb9d46aeba015dc19645a5b9','肇庆市',''),('66d9ddeebbea43f4b52cd33964c4c429','语文','yuwen','001010101',1,'1b79421601744059a4ef6b0ca9be32f9','语文',''),('674ec37e9641450dadc9798df10c58bc','静安区','jing\'anqu','0030204',4,'f1ea30ddef1340609c35c88fb2919bee','静安区',''),('67cba9a4ca4c4c38ac3ba2c21dd191e6','南昌','nanchang','0031806',6,'cb3008cbd6ae4b5f8cebd2254ccb8603','南昌市',''),('68a8f7a8337141d3a092fadfd2457970','鸡西','jixi','0031306',6,'b2d4133b5dbf4599ada940620d2ab250','鸡西市',''),('6932b6b7b5124bef8385fb8e5b5c2568','通化','tonghua','0031608',8,'857be71b0d6d4a40a2c83476824206d1','通化市',''),('694348f8e1c0444e8e0b2c2caf4de1a6','榆林','yulin','0032410',10,'534850c72ceb4a57b7dc269da63c330a','榆林市',''),('697141b58ada46518bc8ec0cc3d64b31','博州','bozhou','032804',4,'2fabed91c6d94e698ed449165cd250ca','博州',''),('6a2226c73bc745faa6973dd3af3e274a','吐鲁番','tulufan','0032811',11,'2fabed91c6d94e698ed449165cd250ca','吐鲁番',''),('6b2b1d55b06b44cd8a487d327397b69b','徐汇区','xuhuiqu','0030202',2,'f1ea30ddef1340609c35c88fb2919bee','徐汇区',''),('6d1e9b9c9c334448878312d589eeaeac','荣昌区','rongchangqu','0033123',23,'1c85fbd06cf840d093f3640aca1b6b2d','荣昌区',''),('6d846178376549ed878d11d109819f25','浙江','zhejiang','00330',30,'1','浙江省',''),('6daab50a4a1048f993f348a66dcfa83d','喀什','kashi','0032807',7,'2fabed91c6d94e698ed449165cd250ca','喀什',''),('6dc38f66c86a4f32ac9d585e668c110e','怒江','nujiang','0032911',11,'510607a1836e4079b3103e14ec5864ed','怒江',''),('6e1f1c6d82704e5cadcd0bc8ef2ab79f','昆明','kunming','0032908',8,'510607a1836e4079b3103e14ec5864ed','昆明',''),('6e639147d90943c38490cafe223985ce','梅州','meizhou','0030710',10,'0dd1f40bcb9d46aeba015dc19645a5b9','梅州市',''),('6e67518f1da44dbaa8cf95920779f188','汕尾','shanwei','0030713',13,'0dd1f40bcb9d46aeba015dc19645a5b9','汕尾市',''),('6eaa823330da42b6b5783e389707853c','四平','siping','0031606',6,'857be71b0d6d4a40a2c83476824206d1','四平市',''),('6ecc40e527404bba89207cc158ef3994','河源','heyuan','0030705',5,'0dd1f40bcb9d46aeba015dc19645a5b9','河源市',''),('6ee20f02066e43a29f10ca6dbd0b7c71','普陀区','putuoqu','0030205',5,'f1ea30ddef1340609c35c88fb2919bee','普陀区',''),('6f5749ab2b5d4cbea1655e9a5197096d','湛江','zhanjiang','0030718',18,'0dd1f40bcb9d46aeba015dc19645a5b9','湛江市',''),('6f8c18c8b3a54bc287c1dfc5642be577','三明','sanming','0030507',7,'d4066f6f425a4894a77f49f539f2a34f','三明市',''),('6f9601270aca46519e7f8836e0d2446c','广元','guangyuan','0032508',8,'d3538add7125404aba4b0007ef9fde50','广元市',''),('6fd083505ab24086b234c032dab3c2a7','海口','haikou','0031001',1,'2ba8e6d0fd944983aa19b781c6b53477','海口市',''),('70733399b60d4b058c255fa9fff2eee0','莆田','putian','0030505',5,'d4066f6f425a4894a77f49f539f2a34f','莆田市',''),('70c1525174a04767865d0e6b7ed01f5a','七台河','qitaihe','0031309',9,'b2d4133b5dbf4599ada940620d2ab250','七台河市',''),('70c41ec5cb9e4aec98bd2357702c4082','江门','jiangmen','0030707',7,'0dd1f40bcb9d46aeba015dc19645a5b9','江门市',''),('71aba068cd5b4588a03be75e2e49f496','鄂州','ezhou','0031401',1,'312b80775e104ba08c8244a042a658df','鄂州市',''),('7336944efb4b40fcae9118fc9a970d2d','河南','henan','00312',12,'1','河南省',''),('748623f3282b4ca7ace0e73303327310','巴南区','bananqu','0033113',13,'1c85fbd06cf840d093f3640aca1b6b2d','巴南区',''),('74d2aaddaf294355b01970d52e303a1a','资阳','ziyang','0032519',19,'d3538add7125404aba4b0007ef9fde50','资阳市',''),('75362368f22f4d60a810c2a45cced487','河北','hebei','00311',11,'1','河北省',''),('755e2d15540c49dbad6be564f694a4af','曲靖','qujing','0032913',13,'510607a1836e4079b3103e14ec5864ed','曲靖',''),('75b889c8e86c4d518a1fb74b089ceae8','攀枝花','panzhihua','0032515',15,'d3538add7125404aba4b0007ef9fde50','攀枝花市',''),('75e0334ad60b41a1b42ae6724b06c874','镇江','zhenjiang','0031713',13,'577405ff648240959b3765c950598ab0','镇江市',''),('762bc3b1443e4ea98ab051b4007c0238','邢台','xingtai','0031110',10,'75362368f22f4d60a810c2a45cced487','邢台市',''),('76d023f160e448c8bcb78598bf246a44','黔南','qiannan','0030906',6,'592f6fcf45a74524aa8ea853fc9761d5','黔南市',''),('773cb4f25b9d4ebcba2953570da776c9','吴忠','wuzhong','0032104',4,'5690b0534fe745e5ba0f504f0c260559','吴忠市',''),('776b55acb6804296a00c9f97723633ba','舟山','zhoushan','0033011',11,'6d846178376549ed878d11d109819f25','舟山市',''),('79b98f7f0c054fa0ab2a3a2cb75d1b87','邵阳','shaoyang','0031505',5,'c59f91630bef4289b71fcb2a48994582','邵阳市',''),('7a8097646dc8419284201db66dd6eda1','芜湖','wuhu','0030416',16,'249999f296d14f95b8138a30bbb2c374','芜湖市',''),('7ab1618b70354ee2ab49e8fd5cbca27f','哈密','hami','0032806',6,'2fabed91c6d94e698ed449165cd250ca','哈密',''),('7bed9f7f137e4048bbfd0d564283312d','日照','rizhao','0030311',11,'10f46a521ea0471f8d71ee75ac3b5f3a','日照市',''),('7c6addc8becd4e759479228f6dd38bb2','通辽','tongliao','0032008',8,'c072c248c7ab47dda7bf24f5e577925c','通辽市',''),('7f69cfd9e1ae4c92b4ddf13b9f78cb6c','保山','baoshan','0032902',2,'510607a1836e4079b3103e14ec5864ed','保山',''),('802ef5c62bbb47e3a026e3c92989f53e','临夏','linxia','0030608',8,'3283f1a77180495f9a0b192d0f9cdd35','临夏市',''),('8114568fa8a34c6e878ff13d5ba59006','齐齐哈尔','qiqihaer','0031310',10,'b2d4133b5dbf4599ada940620d2ab250','齐齐哈尔市',''),('8127fbeb13a44c3284dfa8e2326ce19a','茂名','maoming','0030709',9,'0dd1f40bcb9d46aeba015dc19645a5b9','茂名市',''),('813ff1376c0445c6a64b9f00452c2427','成都','chengdu','0032503',3,'d3538add7125404aba4b0007ef9fde50','成都市',''),('81443e6b687349c6ae3231aff5e038ba','铜陵','tongling','0030415',15,'249999f296d14f95b8138a30bbb2c374','铜陵市',''),('8170c3271bc840d78e92ed355851aa5e','西城区','xichengqu','0030102',2,'12a62a3e5bed44bba0412b7e6b733c93','西城区',''),('8346ebddc2464a9bbb99f7b0794da39c','韶关','shaoguan','0030714',14,'0dd1f40bcb9d46aeba015dc19645a5b9','韶关市',''),('8362c89358c748a5907b44de500a1333','泰州','taizhou','0031708',8,'577405ff648240959b3765c950598ab0','泰州市',''),('83e9fbd9e7fa4d878575088df7798b5e','泸州','luzhou','0032510',10,'d3538add7125404aba4b0007ef9fde50','泸州市',''),('857be71b0d6d4a40a2c83476824206d1','吉林','jilin','00316',16,'1','吉林省',''),('85b8accc31b34d70bce548a9d42767dd','汉中','hanzhong','0032403',3,'534850c72ceb4a57b7dc269da63c330a','汉中市',''),('85c0cb3849bc4d79b9c2fa2b63b2c858','福州','fuzhou','0030501',1,'d4066f6f425a4894a77f49f539f2a34f','福州市',''),('85da31513d984f3e8a179b764efb3a22','太原','taiyuan','0032308',8,'023473e9e6204583a110531036357514','太原市',''),('863205a0ac1d4c50b19bb79f602dbea7','张家口','zhangjiakou','0031111',11,'75362368f22f4d60a810c2a45cced487','张家口市',''),('8636d6e9bdb34510bcb528159ca4f29d','辽源','liaoyuan','0031605',5,'857be71b0d6d4a40a2c83476824206d1','辽源市',''),('866bf0b4a8cc41dfb5071f8edb271934','佛山','foshan','0030703',3,'0dd1f40bcb9d46aeba015dc19645a5b9','佛山市',''),('86b85d3d8ddc4632946bdc4cdf642504','虹口区','hongkouqu','0030206',6,'f1ea30ddef1340609c35c88fb2919bee','虹口区',''),('871c4e3b4a044b2e8235d731835db559','酒泉','jiuquan','0030606',6,'3283f1a77180495f9a0b192d0f9cdd35','酒泉市',''),('87563959aa914187a0b5af82f862a0f0','金昌','jinchang','0030605',5,'3283f1a77180495f9a0b192d0f9cdd35','金昌市',''),('886a63c7def64cdfad1cfc0a2de8a1e0','崇左','chongzuo','0030803',3,'c5f3d426c582410281f89f1451e1d854','崇左市',''),('89341f9a48444d258609e87cf40604fa','伊犁州直','yilizhouzhi','0032813',13,'2fabed91c6d94e698ed449165cd250ca','伊犁州直',''),('89461222215e40f7b8067c7b791a9c2c','南平','nanping','0030503',3,'d4066f6f425a4894a77f49f539f2a34f','南平市',''),('895262136b904f4888aa5af2f89dc967','洛阳','luoyang','0031206',6,'7336944efb4b40fcae9118fc9a970d2d','洛阳市',''),('896bce499bd740ffb9f745a4782a7886','青浦区','qingpuqu','0030214',14,'f1ea30ddef1340609c35c88fb2919bee','青浦区',''),('8a7265e11f0141ba808c0410b76d415b','临沂','linyi','0030309',9,'10f46a521ea0471f8d71ee75ac3b5f3a','临沂市',''),('8a79e7d2af7244b0b543492374ec6549','兴安盟','xinganmeng','0032012',12,'c072c248c7ab47dda7bf24f5e577925c','兴安盟',''),('8abbfbb071f34df4b77e2828f53ef99b','怀化','huaihua','0031512',12,'c59f91630bef4289b71fcb2a48994582','怀化市',''),('8af40c23c6fe4ed8819dbe99f1f125f0','奉贤区','fengxianqu','0030215',15,'f1ea30ddef1340609c35c88fb2919bee','奉贤区',''),('8b336fb55c2346a2b5ec13f578c627ef','苏州','suzhou','0031706',6,'577405ff648240959b3765c950598ab0','苏州市',''),('8b5512281c364e09a67d8e81a5bd7ce9','南川区','nanchuanqu','0033119',19,'1c85fbd06cf840d093f3640aca1b6b2d','南川区',''),('8b95528d20c44f86adf1e64009ce317b','贵阳','guiyang','0030903',3,'592f6fcf45a74524aa8ea853fc9761d5','贵阳市',''),('8bfd173e34704a7f978c539f87a511a8','宝山区','baoshanqu','0030209',9,'f1ea30ddef1340609c35c88fb2919bee','宝山区',''),('8c64bc307e894223a429a4f50a0cd387','唐山','tangshan','0031109',9,'75362368f22f4d60a810c2a45cced487','唐山市',''),('8d10532fba444c66bead45a6d9e13b6a','延庆区','yanqingqu','0030116',16,'12a62a3e5bed44bba0412b7e6b733c93','延庆区',''),('8e35c978f8b248cb93863818be6be56b','大足区','dazuqu','0033111',11,'1c85fbd06cf840d093f3640aca1b6b2d','大足区',''),('8f617ff8e61c49689cb26540a618a80c','宁河区','ninghequ','0032614',14,'2c254799d3454f2cbc338ef5712548e9','宁河区',''),('8fa97a231db54e879ece49d566f0561d','天门','tianmen','0031410',10,'312b80775e104ba08c8244a042a658df','天门市',''),('9068c4ec7d1a4de69339fb61654cb3d9','温州','wenzhou','0033010',10,'6d846178376549ed878d11d109819f25','温州市',''),('921a9e3d2c434cca943aca4f3e5087b5','渝中区','yuzhongqu','0033103',3,'1c85fbd06cf840d093f3640aca1b6b2d','渝中区',''),('923ca61a8fdb4357a5220763fdbd7c37','台州','taizhou','0033009',9,'6d846178376549ed878d11d109819f25','台州市',''),('92800c5b33df4f15a689ceda6bd23f2b','信阳','xinyang','0031214',14,'7336944efb4b40fcae9118fc9a970d2d','信阳市',''),('9381ab9da4b64001b289252ee21d1157','河东区','hedongqu','0032602',2,'2c254799d3454f2cbc338ef5712548e9','河东区',''),('95a7fd77484f4ef39e9ed4596556a93c','海西','haixi','0032205',5,'5a80e3435c0e4dc09bafceeadb38e5f0','海西',''),('9795de38301642539aefda61adf595a4','江津区','jiangjinqu','0033116',16,'1c85fbd06cf840d093f3640aca1b6b2d','江津区',''),('97c543ee46e84586998554f5f745fcc6','杨浦区','yangpuqu','0030207',7,'f1ea30ddef1340609c35c88fb2919bee','杨浦区',''),('983eaae633244ecea99d11a804b1c736','万州区','wanzhouqu','0033101',1,'1c85fbd06cf840d093f3640aca1b6b2d','万州区',''),('9a7465597dda46c8bb4c5c98aabfb4b9','阳江','yangjiang','0030716',16,'0dd1f40bcb9d46aeba015dc19645a5b9','阳江市',''),('9b483ad27bc14af2a47d8facdf8fafca','嘉峪关','jiayuguan','0030604',4,'3283f1a77180495f9a0b192d0f9cdd35','嘉峪关市',''),('9bb5220b50dd4def87ffbf6444a28c58','黄浦区','huangpuqu','0030201',1,'f1ea30ddef1340609c35c88fb2919bee','黄浦区',''),('9c8a7d5f3423458eb9e6ef68f6185fca','黄山','huangshan','0030411',11,'249999f296d14f95b8138a30bbb2c374','黄山市',''),('9d9700b28ae347bca4db9f592c78eb02','百色','baise','0030801',1,'c5f3d426c582410281f89f1451e1d854','百色市',''),('9e4d7c5d9d86458d8c8d8a644e7eec9a','阿拉善盟','alashanmeng','0032001',1,'c072c248c7ab47dda7bf24f5e577925c','阿拉善盟',''),('9e833df814a74d1690f8039782ddf914','昭通','zhaotong','0032916',16,'510607a1836e4079b3103e14ec5864ed','昭通',''),('9e9d0ad23c9e45df9dd9c269c0e4fdfa','昌平区','changpingqu','0030111',11,'12a62a3e5bed44bba0412b7e6b733c93','昌平区',''),('9fc24347a7ca4a34bdea408dad223348','闵行区','minhangqu','0030208',8,'f1ea30ddef1340609c35c88fb2919bee','闵行区',''),('a013e3db1b384beb843959c33f361203','静海区','jinghaiqu','0032615',15,'2c254799d3454f2cbc338ef5712548e9','静海区',''),('a0d5b55e48c945faad1d7bb624de7de8','九江','jiujiang','0031805',5,'cb3008cbd6ae4b5f8cebd2254ccb8603','九江市',''),('a165da9b81b940fe9764fc7f5d41232d','银川','yinchuan','0032105',5,'5690b0534fe745e5ba0f504f0c260559','银川市',''),('a268c4b698274f12a64ba48db568d057','潮州','chaozhou','0030701',1,'0dd1f40bcb9d46aeba015dc19645a5b9','潮州市',''),('a34815cb348d4598a6fac4ece3baa0cd','衡阳','hengyang','0031504',4,'c59f91630bef4289b71fcb2a48994582','衡阳市',''),('a39af97e7ad04ebfb530f49b05c7b146','阜阳','fuyang','0030407',7,'249999f296d14f95b8138a30bbb2c374','阜阳市',''),('a405680276e645188a122e8933f77a38','乌兰察布','wulanchabu','0032010',10,'c072c248c7ab47dda7bf24f5e577925c','乌兰察布市',''),('a46bb0749dac4627b9a7d465dc75aca5','武汉','wuhan','0031411',11,'312b80775e104ba08c8244a042a658df','武汉市',''),('a4d4d8f678dd4dba958f466bbc581c5f','菏泽','heze','0030305',5,'10f46a521ea0471f8d71ee75ac3b5f3a','菏泽市',''),('a6898561d8664f6dad7a32f63ab64e19','铁岭','tieling','0031913',13,'b3366626c66c4b61881f09e1722e8495','铁岭市',''),('a76ed518fb584442aaf1769fd2583677','兰州','lanzhou','0030607',7,'3283f1a77180495f9a0b192d0f9cdd35','兰州市',''),('a7d500ab05844c45b839f4a30c1d7643','宜昌','yichang','0031416',16,'312b80775e104ba08c8244a042a658df','宜昌市',''),('a9093795a013403e869a4308f17c7588','海东','haidong','0032203',3,'5a80e3435c0e4dc09bafceeadb38e5f0','海东',''),('aa4b703a13dc4116bea578295efd9ea0','赤峰','chifeng','0032004',4,'c072c248c7ab47dda7bf24f5e577925c','赤峰市',''),('aab8d56a03de4bbc84d433bc24748730','贺州','hezhou','0030808',8,'c5f3d426c582410281f89f1451e1d854','贺州市',''),('ac1aa3c1b928467ebfa261cfaeb77be9','葫芦岛','huludao','0031908',8,'b3366626c66c4b61881f09e1722e8495','葫芦岛市',''),('ac23d537ccd64827ab44007c5503bd58','安阳','anyang','0031201',1,'7336944efb4b40fcae9118fc9a970d2d','安阳市',''),('acd9f9b8fb8a4e47bd1e5d4eea45809c','滁州','chuzhou','0030406',6,'249999f296d14f95b8138a30bbb2c374','滁州市',''),('acf5c250d6614fb9920e442a3b178b86','东营','dongying','0030304',4,'10f46a521ea0471f8d71ee75ac3b5f3a','东营市',''),('adfac2a66ce04767bdbabbd8c115cd5d','黄南','huangnan','0032206',6,'5a80e3435c0e4dc09bafceeadb38e5f0','黄南',''),('ae2c4a00360442f29ce8b0c284525ded','崇明县','chongmingxian','0030216',16,'f1ea30ddef1340609c35c88fb2919bee','崇明县',''),('ae384d9313e448949c8ed9c565e5cade','扬州','yangzhou','0031712',12,'577405ff648240959b3765c950598ab0','扬州市',''),('affc6a796b524efdb006bd1730003df7','西青区','xiqingqu','0032608',8,'2c254799d3454f2cbc338ef5712548e9','西青区',''),('b0251d85679b40dca30ee83af80838bb','拉萨','lasa','0032703',3,'3e846b08dbbe495e93bc93f8f202de79','拉萨市',''),('b041a523ae214f03969454aa8c180ced','房山区','fangshanqu','0030108',8,'12a62a3e5bed44bba0412b7e6b733c93','房山区',''),('b08ccea3cf89458e97b346546221e4ae','凉山','liangshan','0032102',2,'5690b0534fe745e5ba0f504f0c260559','凉山市',''),('b1d50a7eb21f44389733e17831fd121d','盘锦','panjin','0031911',11,'b3366626c66c4b61881f09e1722e8495','盘锦市',''),('b21a81793ca6459f97c246ccbd543c67','张掖','zhangye','0030614',14,'3283f1a77180495f9a0b192d0f9cdd35','张掖市',''),('b2356bf7a1d546709ac296de1bf2a9eb','连云港','lianyungang','0031703',3,'577405ff648240959b3765c950598ab0','连云港市',''),('b2409f9c928f4dd1bd224809f54a1225','宝坻区','baodiqu','0032612',12,'2c254799d3454f2cbc338ef5712548e9','宝坻区',''),('b2d4133b5dbf4599ada940620d2ab250','黑龙江','heilongjiang','00313',13,'1','黑龙江省',''),('b3221428d30249d8acbb40f0f38d7a5c','南宁','nanning','0030811',11,'c5f3d426c582410281f89f1451e1d854','南宁市',''),('b3366626c66c4b61881f09e1722e8495','辽宁','liaoning','00319',19,'1','辽宁省',''),('b38f0725533a47cea5d0f5f520ad72c7','沙坪坝区','shapingbaqu','0033106',6,'1c85fbd06cf840d093f3640aca1b6b2d','沙坪坝区',''),('b4736703fc064dbe8b8440c79991a1ed','大连','dalian','0031904',4,'b3366626c66c4b61881f09e1722e8495','大连市',''),('b5329030086d470fa8cf6b38aaafb320','随州','suizhou','0031409',9,'312b80775e104ba08c8244a042a658df','随州市',''),('b602b0bc378a46629cc37dc037eb9684','课程','kecheng','001',1,'0','课程',''),('b68e669c229945ae86e053d15c277a6a','惠州','huizhou','0030706',6,'0dd1f40bcb9d46aeba015dc19645a5b9','惠州市',''),('b7785f96730e4a35820e08da1c200c4d','璧山区','bishanqu','0033120',20,'1c85fbd06cf840d093f3640aca1b6b2d','璧山区',''),('b84acd830f3b4c65bd82c97cc925badf','自贡','zigong','0032520',20,'d3538add7125404aba4b0007ef9fde50','自贡市',''),('b8e203af46924284a9a8be9851a557a2','南开区','nankaiqu','0032604',4,'2c254799d3454f2cbc338ef5712548e9','南开区',''),('b908e46ac1544cb6a26f1e1fb22f2a94','宜宾','yibin','0032518',18,'d3538add7125404aba4b0007ef9fde50','宜宾市',''),('b9c02b885a4a49719b1000110ed47df4','毕节','bijie','0030902',2,'592f6fcf45a74524aa8ea853fc9761d5','毕节市',''),('b9c8e39d06c24e0c92c0be41a5c6d1e1','红色','red','00201',1,'ce174640544549f1b31c8f66e01c111b','红色',''),('ba821dcfd50d4f64af1cd3eecc5f54e0','海北','haibei','0032202',2,'5a80e3435c0e4dc09bafceeadb38e5f0','海北',''),('bbf9ff3b0fa444f18d70f2a4a9e45609','绵阳','mianyang','0032512',12,'d3538add7125404aba4b0007ef9fde50','绵阳市',''),('bc2ec49f78204ea29cd666e2dc6583a2','临沧','lincang','0032910',10,'510607a1836e4079b3103e14ec5864ed','临沧',''),('bc97087ea25547a794cec553d03c1abc','那曲','naqu','0032705',5,'3e846b08dbbe495e93bc93f8f202de79','那曲',''),('bd1efd2194724213b72efa91fe3d5ddc','浦东新区','pudongxinqu','0030211',11,'f1ea30ddef1340609c35c88fb2919bee','浦东新区',''),('bdb65b22a7c447dcadbc6328292e5aef','中山','zhongshan','0030720',20,'0dd1f40bcb9d46aeba015dc19645a5b9','中山市',''),('bdce443b39ba4cef8c0c0b75bdc8e253','沈阳','shenyang','0031912',12,'b3366626c66c4b61881f09e1722e8495','沈阳市',''),('be33f1cad2954520bbf033e4198890f7','亳州','bozhou','0030403',3,'249999f296d14f95b8138a30bbb2c374','亳州市',''),('be359cbd02944e1da5997ae560831db1','定西','dingxi','0030602',2,'3283f1a77180495f9a0b192d0f9cdd35','定西市',''),('beaf0090ebf94ad9af5dd78e372611fe','咸阳','xianyang','0032408',8,'534850c72ceb4a57b7dc269da63c330a','咸阳市',''),('bff8ba692e4c4d78a23309ec0ad745c7','桂林','guilin','0030806',6,'c5f3d426c582410281f89f1451e1d854','桂林市',''),('c0170db89f2e48fe99bfdcd857fe2016','承德','chengde','0031103',3,'75362368f22f4d60a810c2a45cced487','承德市',''),('c072c248c7ab47dda7bf24f5e577925c','内蒙古','neimenggu','00320',20,'1','内蒙古',''),('c0e55c6a60564359859d87d25c249ac4','锦州','jinzhou','0031909',9,'b3366626c66c4b61881f09e1722e8495','锦州市',''),('c1875ba50f6d4e61870be000be8ee78e','东丽区','dongliqu','0032607',7,'2c254799d3454f2cbc338ef5712548e9','东丽区',''),('c22083b403ba4ea698ba4dfc7245a317','平凉','pingliang','0030610',10,'3283f1a77180495f9a0b192d0f9cdd35','平凉市',''),('c256624d6caa49979ebc4dce35006945','武清区','wuqingqu','0032611',11,'2c254799d3454f2cbc338ef5712548e9','武清区',''),('c2e0fca8943d41ba8ec5d013e9bc3f41','日喀则','rikaze','0032706',6,'3e846b08dbbe495e93bc93f8f202de79','日喀则',''),('c3717fb4891148a0bef623dbd746e7e6','开封','kaifeng','0031205',5,'7336944efb4b40fcae9118fc9a970d2d','开封市',''),('c4817fc49be444e491920112aa9a3e32','淮南','huainan','0030410',10,'249999f296d14f95b8138a30bbb2c374','淮南市',''),('c59f91630bef4289b71fcb2a48994582','湖南','hunan','00315',15,'1','湖南省',''),('c5f3d426c582410281f89f1451e1d854','广西','guangxi','00308',8,'1','广西省',''),('c7852784049a473c917863c5bc84dd95','甘南','gannan','0030603',3,'3283f1a77180495f9a0b192d0f9cdd35','甘南市',''),('c7a5ba87961742f3b242ee4d30a55921','营口','yingkou','0031914',14,'b3366626c66c4b61881f09e1722e8495','营口市',''),('c8342c1dcf584cbf92f20d90a62a34bf','平顶山','pingdingshan','0031209',9,'7336944efb4b40fcae9118fc9a970d2d','平顶山市',''),('c8d4119e57f84e71815769f03935e471','黔东南','qiandongnan','0030905',5,'592f6fcf45a74524aa8ea853fc9761d5','黔东南市',''),('c928e9192e2f4f5ca06c6599371ff83c','六安','lu\'an','0030412',12,'249999f296d14f95b8138a30bbb2c374','六安市',''),('c9811aef284b4ae8b8bf7698e90d8b3b','泉州','quanzhou','0030506',6,'d4066f6f425a4894a77f49f539f2a34f','泉州市',''),('c9df1fd73d0642eea8b050738f6ed9fa','聊城','liaocheng','0030308',8,'10f46a521ea0471f8d71ee75ac3b5f3a','聊城市',''),('ca2e3717bb734c4b9142f29e36a31989','株洲','zhuzhou','0031502',2,'c59f91630bef4289b71fcb2a48994582','株洲市',''),('cabe896dba3a4a21ba194f8839a3eb98','大渡口区','dadukouqu','0033104',4,'1c85fbd06cf840d093f3640aca1b6b2d','大渡口区',''),('caeba09845bf4a29960a840d4f436f09','上饶','shangrao','0031808',8,'cb3008cbd6ae4b5f8cebd2254ccb8603','上饶市',''),('cb3008cbd6ae4b5f8cebd2254ccb8603','江西','jiangxi','00318',18,'1','江西省',''),('cc2aaa3ed3904d66a2f79676b14a1b49','黔江区','qianjiangqu','0033114',14,'1c85fbd06cf840d093f3640aca1b6b2d','黔江区',''),('cd66a360619847d2b17989643f03dc8f','济宁','jining','0030306',6,'10f46a521ea0471f8d71ee75ac3b5f3a','济宁市',''),('cd87ffcb742744d18bbce6928922a5be','衡州','hengzhou','0033007',7,'6d846178376549ed878d11d109819f25','衡州市',''),('cdc1df5961994a9d94751003edd0fc58','宿州','suzhou','0030414',14,'249999f296d14f95b8138a30bbb2c374','宿州市',''),('cddd155314404710bd1ab3fa51d80cf2','天水','tianshui','0030612',12,'3283f1a77180495f9a0b192d0f9cdd35','天水市',''),('ce0dcc5a66dd44b3b9a42aef4aa8b4ba','蚌埠','bengbu','0030402',2,'249999f296d14f95b8138a30bbb2c374','蚌埠市',''),('ce174640544549f1b31c8f66e01c111b','颜色','yanse','002',2,'0','颜色',''),('cf632a4f4de54b619ad5cb6835f35434','玉林','yulin','0030814',14,'c5f3d426c582410281f89f1451e1d854','玉林市',''),('cf7d29feb2c34cbfaf4e28896ca577e4','巴彦淖尔','bayannaoer','0032002',2,'c072c248c7ab47dda7bf24f5e577925c','巴彦淖尔',''),('cfb2df83812d4fabb10ba91e98be9467','黑河','heihe','0031305',5,'b2d4133b5dbf4599ada940620d2ab250','黑河市',''),('cfee5c9833664e0aba76267389e4adbd','丰台区','fengtaiqu','0030104',4,'12a62a3e5bed44bba0412b7e6b733c93','丰台区',''),('d13b01a607e34fdfa16deb7292a0f299','鹤壁','hebi','0031202',2,'7336944efb4b40fcae9118fc9a970d2d','鹤壁市',''),('d1646344b9cc45018c3a347f6dc6c77b','红桥区','hongqiaoqu','0032606',6,'2c254799d3454f2cbc338ef5712548e9','红桥区',''),('d26fc248d49c4a71b2a003033adc88de','娄底','loudi','0031513',13,'c59f91630bef4289b71fcb2a48994582','娄底市',''),('d3538add7125404aba4b0007ef9fde50','四川','sichuan','00325',25,'1','四川省',''),('d3c2d3b9184b4e3185ca6bdbe73c5cff','襄樊','xiangfan','0031414',14,'312b80775e104ba08c8244a042a658df','襄樊市',''),('d3c76818757942fba8ebf8246fa257a9','咸宁','xianning','0031413',13,'312b80775e104ba08c8244a042a658df','咸宁市',''),('d4066f6f425a4894a77f49f539f2a34f','福建','fujian','00305',5,'1','福建省',''),('d4131ecb91d3435db1dbd770ac39221f','鞍山','anshan','0031901',1,'b3366626c66c4b61881f09e1722e8495','鞍山市',''),('d42e09432d10454caecf1d4335aca1da','合肥','hefei','0030408',8,'249999f296d14f95b8138a30bbb2c374','合肥市',''),('d4f8ba23c3ef4fbaa00c8f8a7c047bf1','商丘','shangqiu','0031212',12,'7336944efb4b40fcae9118fc9a970d2d','商丘市',''),('d5f5462779bc4976a3fbcbdeba45ed00','丽水','lishui','0033005',5,'6d846178376549ed878d11d109819f25','丽水市',''),('d5f621c6fab44d1eab1bdafd9d08e042','绍兴','shaoxing','0033008',8,'6d846178376549ed878d11d109819f25','绍兴市',''),('d7443dcd45704a27981810fc32b93390','潍坊','weifang','0030314',14,'10f46a521ea0471f8d71ee75ac3b5f3a','潍坊市',''),('d7c388a2ed58414a9bd4dfbedf6858b3','顺义区','shunyiqu','0030110',10,'12a62a3e5bed44bba0412b7e6b733c93','顺义区',''),('d7e006b55b96491282e9c2e672d35a34','克拉玛依','kelamayi','0032808',8,'2fabed91c6d94e698ed449165cd250ca','克拉玛依',''),('d7e25a4040694008b4cb8aa322f77ad9','张家界','zhangjiajie','0031508',8,'c59f91630bef4289b71fcb2a48994582','张家界市',''),('d80455402bc44d2ca15e905913301fb2','焦作','jiaozuo','0031204',4,'7336944efb4b40fcae9118fc9a970d2d','焦作市',''),('d90a14bfbfe44a3e8d60bda8f8f362a6','铜仁','tongren','0030908',8,'592f6fcf45a74524aa8ea853fc9761d5','铜仁市',''),('da583c36f6754d498176755c93db8d7c','遂宁','suining','0032516',16,'d3538add7125404aba4b0007ef9fde50','遂宁市',''),('db3b9c7116bc49e3a65fa641dd82155d','红河','honghe','0032907',7,'510607a1836e4079b3103e14ec5864ed','红河',''),('db6336fcf27f4c00b37513ff0e368ae6','长宁区','changningqu','0030203',3,'f1ea30ddef1340609c35c88fb2919bee','长宁区',''),('db77fd88654c4014a71d541171d2795b','西安','xi\'an','0032407',7,'534850c72ceb4a57b7dc269da63c330a','西安市',''),('dc022922169446549dfac0de221d2a4d','雅安','ya\'an','0032517',17,'d3538add7125404aba4b0007ef9fde50','雅安市',''),('dc9b2098188f4b5c93aec5c9bbfb895d','吕梁','lvliang','0032306',6,'023473e9e6204583a110531036357514','吕梁市',''),('dcbcde16e75643f9b8dd4b6293c87dd5','滨州','binzhou','0030302',2,'10f46a521ea0471f8d71ee75ac3b5f3a','滨州市',''),('dcd0ca1cde8f420dbfecbac4cf1506ee','巴州','bazhou','0032803',3,'2fabed91c6d94e698ed449165cd250ca','巴州',''),('dcd445ef42c9484bbd14bacd02bebf37','郑州','zhengzhou','0031216',16,'7336944efb4b40fcae9118fc9a970d2d','郑州市',''),('dcf99d941ca44b30915e16a4048d5004','益阳','yiyang','0031509',9,'c59f91630bef4289b71fcb2a48994582','益阳市',''),('dee1fa3295ec42219815769d00fabe70','迪庆','diqing','0032906',6,'510607a1836e4079b3103e14ec5864ed','迪庆',''),('e06c4a42478b4853827911b8adac6def','庆阳','qingyang','0030611',11,'3283f1a77180495f9a0b192d0f9cdd35','庆阳市',''),('e1204d4286834046886f26ae6af0722a','湘潭','xiangtan','0031503',3,'c59f91630bef4289b71fcb2a48994582','湘潭市',''),('e15cb9bb072248628b7ec481b6337229','六盘水','liupanshui','0030904',4,'592f6fcf45a74524aa8ea853fc9761d5','六盘水市',''),('e1bbd9b635e140ee8fcf0dc06743519b','廊坊','langfang','0031106',6,'75362368f22f4d60a810c2a45cced487','廊坊市',''),('e384a07d11bf413eb83cd490939ca7a2','綦江区','qijiangqu','0033110',10,'1c85fbd06cf840d093f3640aca1b6b2d','綦江区',''),('e3ca4d54f3354ba5b17e1f93415ceb1a','云浮','yunfu','0030717',17,'0dd1f40bcb9d46aeba015dc19645a5b9','云浮市',''),('e4adf72e96ee4b7fa3528ee5ba4eb5cf','梧州','wuzhou','0030813',13,'c5f3d426c582410281f89f1451e1d854','梧州市',''),('e556d8e5e148406883e1a83d6595e406','铜梁区','tongliangqu','0033121',21,'1c85fbd06cf840d093f3640aca1b6b2d','铜梁区',''),('e7200f8c6dce4ea193bf33f55d9fd192','池州','chizhou','0030405',5,'249999f296d14f95b8138a30bbb2c374','池州市',''),('e7de6c7b752040b2bd3175641d83d128','哈尔滨','haerbin','0031303',3,'b2d4133b5dbf4599ada940620d2ab250','哈尔滨市',''),('e8311a6f0ab4495484fdf24902ee97cc','新余','xinyu','0031809',9,'cb3008cbd6ae4b5f8cebd2254ccb8603','新余市',''),('e9a653c9850c46bc9e2e1916de643a52','楚雄','chuxiong','0032903',3,'510607a1836e4079b3103e14ec5864ed','楚雄',''),('ec0eed6293294d58aa56f6c381263288','郴州','chenzhou','0031510',10,'c59f91630bef4289b71fcb2a48994582','郴州市',''),('ec107e60189346adb2b5749d6f6fe074','德宏','dehong','0032905',5,'510607a1836e4079b3103e14ec5864ed','德宏',''),('ec892838cf4944cc8b330216f02de1e6','津南区','jinnanqu','0032609',9,'2c254799d3454f2cbc338ef5712548e9','津南区',''),('ec96c3771161459c99eb01124db7aa8a','三门峡','sanmenxia','0031211',11,'7336944efb4b40fcae9118fc9a970d2d','三门峡市',''),('eca8a2f4e2534f77b7bccf263139d8c7','内江','neijiang','0032513',13,'d3538add7125404aba4b0007ef9fde50','内江市',''),('ecb8f08c1408495bb31842c221d3edb4','渝北区','yubeiqu','0033112',12,'1c85fbd06cf840d093f3640aca1b6b2d','渝北区',''),('ed5391a7608b4a61a24d95f2384f2131','阜新','fuxin','0031907',7,'b3366626c66c4b61881f09e1722e8495','阜新市',''),('ed5b3d39695f496d88c37f56508d6447','仙桃','xiantao','0031412',12,'312b80775e104ba08c8244a042a658df','仙桃市',''),('ed97335f8b3d42fabfd89993bc68475d','海南','hainan','0032204',4,'5a80e3435c0e4dc09bafceeadb38e5f0','海南',''),('ede65c49ae624ef8900414298f79a438','乌海','wuhai','0032009',9,'c072c248c7ab47dda7bf24f5e577925c','乌海市',''),('f0570e2fe4644e32af5c5401e8c371ba','盐城','yancheng','0031711',11,'577405ff648240959b3765c950598ab0','盐城市',''),('f0eb076930844fe18fdd8dcf5fc1f56e','塔城','tacheng','0032810',10,'2fabed91c6d94e698ed449165cd250ca','塔城',''),('f16ddc177870477685297a6abb157637','朔州','shuozhou','0032307',7,'023473e9e6204583a110531036357514','朔州市',''),('f1e2cdd9518c4ac2b5e1ea52985b9771','果洛','guoluo','0032201',1,'5a80e3435c0e4dc09bafceeadb38e5f0','果洛',''),('f1ea30ddef1340609c35c88fb2919bee','上海','shanghai','00302',2,'1','上海',''),('f260eee573dc48fca1572b228d280849','版纳','banna','0032901',1,'510607a1836e4079b3103e14ec5864ed','版纳',''),('f389ad0eb7884c4d91d4f31312bc8771','萍乡','pingxiang','0031807',7,'cb3008cbd6ae4b5f8cebd2254ccb8603','萍乡市',''),('f416737f56924f7cb642a75f57b1530a','渭南','weinan','0032406',6,'534850c72ceb4a57b7dc269da63c330a','渭南市',''),('f498d09200ba48df9d6e281776eba4f8','徐州','xuzhou','0031710',10,'577405ff648240959b3765c950598ab0','徐州市',''),('f4bdd6b8f0704479a6d051f52d62d693','河池','hechi','0030807',7,'c5f3d426c582410281f89f1451e1d854','河池市',''),('f4f2434769b842afbbf1791018b69800','河北区','hebeiqu','0032605',5,'2c254799d3454f2cbc338ef5712548e9','河北区',''),('f57d2b8d983f43d5a035a596b690445b','金山区','jinshanqu','0030212',12,'f1ea30ddef1340609c35c88fb2919bee','金山区',''),('f6337bdeefa44b0db9f35fe2fe7d6d6f','十堰','shiyan','0031408',8,'312b80775e104ba08c8244a042a658df','十堰市',''),('f661c388a73d478699a2c1c5909b45f1','三亚','sanya','0031002',2,'2ba8e6d0fd944983aa19b781c6b53477','三亚市',''),('f6ff36eb35414a5dacf7ccc0c479d2ea','宿迁','suqian','0031707',7,'577405ff648240959b3765c950598ab0','宿迁市',''),('f775a440cb004c63b0b3d3429b58a1e6','衡水','hengshui','0031105',5,'75362368f22f4d60a810c2a45cced487','衡水市',''),('f845a1c0a62b45bfbf358688eec3680d','巢湖','chaohu','0030404',4,'249999f296d14f95b8138a30bbb2c374','巢湖市',''),('f9565fe7c0a348ba949131645d20e8fa','恩施','enshi','0031402',2,'312b80775e104ba08c8244a042a658df','恩施市',''),('f970bd1da8f94bfa92206fa94d595cbb','锡林郭勒盟','xilinguolemeng','0032011',11,'c072c248c7ab47dda7bf24f5e577925c','锡林郭勒盟',''),('f9a9156f0e9e41438e823f93070248bd','濮阳','puyang','0031210',10,'7336944efb4b40fcae9118fc9a970d2d','濮阳市',''),('f9ceff59e02c4be3a4b20aa806c1ec0d','呼和浩特','huhehaote','0032006',6,'c072c248c7ab47dda7bf24f5e577925c','呼和浩特市',''),('fa2ff170919e406d9d5547ff09d14d0d','双鸭山','shuangyashan','0031311',11,'b2d4133b5dbf4599ada940620d2ab250','双鸭山市',''),('fa3446ef035546c09c1f27268b43b937','南京','nanjing','0031704',4,'577405ff648240959b3765c950598ab0','南京市',''),('fc70429d9b8146e0ac31ce38410e2cb7','南阳','nanyang','0031208',8,'7336944efb4b40fcae9118fc9a970d2d','南阳市',''),('fd06b72a41654fcfbfe2c3327ca4e9fc','珠海','zhuhai','0030721',21,'0dd1f40bcb9d46aeba015dc19645a5b9','珠海市',''),('fd1d83119c414e56b3a35052c9d6dd0f','文山','wenshan','0032914',14,'510607a1836e4079b3103e14ec5864ed','文山',''),('fd2a0cad70c643528587d1ccde4c5530','铜川','tongchuan','0032405',5,'534850c72ceb4a57b7dc269da63c330a','铜川市',''),('fd79801a69ad4ec5857df82358c26368','江北区','jiangbeiqu','0033105',5,'1c85fbd06cf840d093f3640aca1b6b2d','江北区',''),('ff880943e156482ea50d1ece4ff233a6','昌吉州','changjizhou','0032805',5,'2fabed91c6d94e698ed449165cd250ca','昌吉州',''),('ffb2cc1e96fe485b94335589315ab38c','临汾','linfen','0032305',5,'023473e9e6204583a110531036357514','临汾市',''),('ffd838f71da648319bfe4f176e0e209f','晋中','jinzhong','0032304',4,'023473e9e6204583a110531036357514','晋中市',''),('ffeaa196501d4f35a486e42be17f2986','枣庄','zaozhuang','0030316',16,'10f46a521ea0471f8d71ee75ac3b5f3a','枣庄市','');
/*!40000 ALTER TABLE `sys_dictionaries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_fhbutton`
--

DROP TABLE IF EXISTS `sys_fhbutton`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_fhbutton` (
  `FHBUTTON_ID` varchar(100) NOT NULL,
  `NAME` varchar(30) DEFAULT NULL COMMENT '名称',
  `QX_NAME` varchar(50) DEFAULT NULL COMMENT '权限标识',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`FHBUTTON_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_fhbutton`
--

LOCK TABLES `sys_fhbutton` WRITE;
/*!40000 ALTER TABLE `sys_fhbutton` DISABLE KEYS */;
INSERT INTO `sys_fhbutton` VALUES ('3542adfbda73410c976e185ffe50ad06','导出EXCEL','toExcel','导出EXCEL'),('46992ea280ba4b72b29dedb0d4bc0106','发邮件','email','发送电子邮件'),('4c7f34b9eed54683957f356afcda24df','组织机构数据权限','Datajur','组织机构数据权限按钮'),('4efa162fce8340f0bd2dcd3b11d327ec','导入EXCEL','FromExcel','导入EXCEL到系统用户'),('cc51b694d5344d28a9aa13c84b7166cd','发短信','sms','发送短信'),('da7fd386de0b49ce809984f5919022b8','站内信','FHSMS','发送站内信'),('fc5e8767b4564f34a0d2ce2375fcc92e','绑定用户','userBinding','绑定用户');
/*!40000 ALTER TABLE `sys_fhbutton` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_fhlog`
--

DROP TABLE IF EXISTS `sys_fhlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_fhlog` (
  `FHLOG_ID` varchar(100) NOT NULL,
  `USERNAME` varchar(100) DEFAULT NULL COMMENT '用户名',
  `CZTIME` varchar(32) DEFAULT NULL COMMENT '操作时间',
  `CONTENT` varchar(255) DEFAULT NULL COMMENT '事件',
  PRIMARY KEY (`FHLOG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_fhlog`
--

LOCK TABLES `sys_fhlog` WRITE;
/*!40000 ALTER TABLE `sys_fhlog` DISABLE KEYS */;
INSERT INTO `sys_fhlog` VALUES ('01048717ffce40c98883b2865f655c3a','huarong','2018-03-28 23:25:38','退出'),('05bd75b871434ec295852845a11d52a4','admin','2018-04-04 14:00:32','登录系统密码或用户名错误'),('080cdfd41a324e5cbd1d5db76f38e229','admin','2018-03-26 23:57:04','登录系统'),('0d96d22d566c4f3e8822d33a0da7c8f4','admin','2018-03-28 23:22:34','登录系统'),('1228e2c1d27541f4956859f4e92deb4a','san','2018-02-06 23:14:42','登录系统'),('125d65a2dbdf436288d2bd8b0a41c0c3','admin','2018-04-04 20:58:48','修改角色菜单权限，角色ID为:1'),('16502410f4ec4bad9372abab252b91d3','admin','2018-03-28 23:18:04','新增角色:华榕测试'),('197a55ce3f9a476982eced0e6cce35d8','admin','2018-04-04 21:09:27','登录系统'),('1c3972e3ace942d68213471ac91e2df9','admin','2018-03-28 23:19:33','删除按钮权限{BUTTON_ID=4c7f34b9eed54683957f356afcda24df, ROLE_ID=75e75bc1b50c4ca1a6d64c1c4f249fd1, guid=1522250373357}'),('1e9d3658caa94b358c9c5c726a357ad6','admin','2018-03-26 23:54:53','修改菜单华榕订单管理'),('21a9d60ae34b49a8b55b45f32443aa9c','admin','2018-03-26 23:55:24','修改角色菜单权限，角色ID为:1'),('2abbfaf575fe4a14837e7bc7f33ae743','admin','2018-03-28 23:19:27','新增按钮权限pd{BUTTON_ID=3542adfbda73410c976e185ffe50ad06, RB_ID=80cc5ceca2fe4863ba9e00ff999ccd82, ROLE_ID=75e75bc1b50c4ca1a6d64c1c4f249fd1, guid=1522250367690}'),('31ee3942a46d43eaa41419c15b1301cc','admin','2018-04-04 14:00:50','登录系统'),('32ca3fdf4db744af92222c495fb79ab4','admin','2018-03-28 23:23:22','新增按钮权限pd{BUTTON_ID=fc5e8767b4564f34a0d2ce2375fcc92e, RB_ID=e8f525a2d0504896922435498986327e, ROLE_ID=75e75bc1b50c4ca1a6d64c1c4f249fd1, guid=1522250602334}'),('33397e12cdba463fa7a29e6678698e21','admin','2018-04-04 20:59:01','登录系统'),('348e6a2025d14cf3a5dbaff4bfddf835','admin','2018-03-29 00:12:07','修改菜单订单信息管理'),('37715e84bf4f4222acc7f6dbb4b0451f','admin','2018-03-24 01:42:38','登录系统'),('3951f3b098534ed8b767d7093f0900e6','admin','2018-03-28 23:21:58','退出'),('398bac7f1bed453299a8bc52dae58def','admin','2018-04-04 21:07:23','登录系统'),('4266e1bd99d7482ba36feb1257ef49a7','admin','2018-03-24 01:41:42','登录系统密码或用户名错误'),('42d9aa04cde640e5a871a57085011fac','admin','2018-03-29 00:21:45','登录系统'),('4467fcd5b14e4e2991cd0758e11050f9','admin','2018-03-26 23:22:43','登录系统'),('449ec0b78ec941b5a8fd18b82c6b1de6','admin','2018-03-28 23:23:23','删除按钮权限{BUTTON_ID=fc5e8767b4564f34a0d2ce2375fcc92e, ROLE_ID=75e75bc1b50c4ca1a6d64c1c4f249fd1, guid=1522250603256}'),('45d93e702c63472ab3ced20fdbeee7ee','admin','2018-04-04 14:00:38','登录系统密码或用户名错误'),('45f17a4ed4114e6490065826d2fd08df','admin','2018-03-29 00:18:52','新增菜单商品名称'),('4bb51dd32f164f259ea607237e330512','admin','2018-02-06 23:09:54','修改系统用户：admin'),('5e9c6a4697c5433a84a8417e99ad4374','admin','2018-03-28 23:19:36','新增按钮权限pd{BUTTON_ID=cc51b694d5344d28a9aa13c84b7166cd, RB_ID=40864ef63e5f4cb78c1560772b04a6b5, ROLE_ID=75e75bc1b50c4ca1a6d64c1c4f249fd1, guid=1522250376861}'),('606104f4716447feb99c12dc30c14bd3','admin','2018-02-08 22:48:49','登录系统'),('63988e4886a4474bbcf380583071bbe1','admin','2018-03-28 23:25:43','登录系统'),('64c67e90ff174d4a882879de7d204d9a','admin','2018-03-28 22:52:50','登录系统'),('6771f0cf53b3440a8b5c5f8e881577ae','admin','2018-04-04 20:43:08','修改角色菜单权限，角色ID为:75e75bc1b50c4ca1a6d64c1c4f249fd1'),('6dec2a5a99c1472ab8d28e2b66b22516','admin','2018-02-06 23:07:58','登录系统密码或用户名错误'),('6f0a39ebbf55499ea4a9055333e64f54','admin','2018-04-04 21:15:01','登录系统'),('6f63056a67624b438f9144f3555e203a','admin','2018-02-08 22:48:38','登录系统密码或用户名错误'),('73791df6e678450e87a3de52c7797f8f','admin','2018-04-04 20:42:41','新增菜单订单上传'),('756d4197dc5d4a4d9201f9a64ebf9a73','admin','2018-03-28 23:21:51','新增系统用户：huarong'),('77ed2f4185624fdf8bd0f3f189d18bbf','admin','2018-03-28 23:24:57','退出'),('7c37b59337d448a7b964d81f92a48f5a','admin','2018-04-03 07:00:38','登录系统'),('7ca95275fa1948639485dca2c287caea','admin','2018-03-29 00:16:04','登录系统'),('7fa3190650af4ecabbee98b85d6706ed','admin','2018-03-28 23:18:19','修改角色菜单权限，角色ID为:75e75bc1b50c4ca1a6d64c1c4f249fd1'),('802eadb65528466587ad57dcdc38da18','admin','2018-04-04 20:18:59','登录系统'),('8322070eb45e47ba807f24a3fe1272d1','admin','2018-03-26 23:56:58','登录系统密码或用户名错误'),('83bba2b38cea4da3859198dee682bc60','admin','2018-03-28 23:26:21','修改cha_qx权限，角色ID为:75e75bc1b50c4ca1a6d64c1c4f249fd1'),('8cfa387e70184a1895fa5b02723c8be6','admin','2018-04-04 21:57:01','登录系统'),('91500edef75441398356bbe1de53bed0','admin','2018-02-06 23:14:31','修改系统用户：san'),('9ea719221a3b4913812f3a4c197e378d','admin','2018-03-28 23:19:37','新增按钮权限pd{BUTTON_ID=da7fd386de0b49ce809984f5919022b8, RB_ID=5b4781c41d5840cb90907acc46893c82, ROLE_ID=75e75bc1b50c4ca1a6d64c1c4f249fd1, guid=1522250377578}'),('9ffb2a34d80e4c2785994400d0c0263d','admin','2018-03-29 00:21:30','修改角色菜单权限，角色ID为:1'),('a79b353d736f4537ad2126763e22e235','huarong','2018-03-28 23:25:08','登录系统'),('a8bf5df9063c4c678cd459c86f7be614','huarong','2018-03-28 23:22:09','登录系统'),('ab2eee3438bc4787922819d2a61a12f8','huarong','2018-03-28 23:22:26','退出'),('b1215a7383e74e698579ebd08d6606e0','admin','2018-03-28 23:19:29','新增按钮权限pd{BUTTON_ID=46992ea280ba4b72b29dedb0d4bc0106, RB_ID=eec36157e6c744d9a25c9fa29995264f, ROLE_ID=75e75bc1b50c4ca1a6d64c1c4f249fd1, guid=1522250369156}'),('b9d2c3094b15401caed6b3158380bc04','admin','2018-03-28 23:19:31','新增按钮权限pd{BUTTON_ID=4c7f34b9eed54683957f356afcda24df, RB_ID=a6443507a14049f3945690110a16de1b, ROLE_ID=75e75bc1b50c4ca1a6d64c1c4f249fd1, guid=1522250371949}'),('bd00d44a5d5e4a589fc44eca61ab7f9b','admin','2018-03-31 22:44:59','登录系统'),('bddcfdcca1134e8d936f8894fff75205','admin','2018-03-29 00:20:06','修改菜单商品管理'),('be70f611b52d4a5fb7f7ed541567382b','admin','2018-02-06 23:09:13','登录系统'),('c1d40d2911c9462f859fdd203dc3b13e','admin','2018-03-24 01:41:48','登录系统密码或用户名错误'),('c29b85cef1574e33943dfcc8ffecce07','admin','2018-03-26 23:56:52','退出'),('c91939370d024b7e89b65d06aba67dad','admin','2018-03-26 23:59:09','登录系统'),('ca27151b557740b6b1a2fc26169d0317','admin','2018-03-28 23:19:35','新增按钮权限pd{BUTTON_ID=4efa162fce8340f0bd2dcd3b11d327ec, RB_ID=7fcbbb2c319647ffb8642bfcfb64b430, ROLE_ID=75e75bc1b50c4ca1a6d64c1c4f249fd1, guid=1522250375661}'),('cefc1bc09c7141d8a77d8cbd44efe515','admin','2018-04-04 14:00:45','登录系统密码或用户名错误'),('d0b196d82e9a4c9e8c7089e36ad658b8','admin','2018-04-04 21:08:48','修改菜单订单上传'),('d0d7c4a847534d08a94cdfb9a4b58a40','admin','2018-02-08 22:48:26','登录系统密码或用户名错误'),('d26af9da898a4749b2c8a7f2f27fe628','admin','2018-04-04 22:12:47','登录系统'),('d4689599afa04d68b0d64cd6e3c6671c','admin','2018-02-08 22:56:21','删除系统用户：{USER_ID=e128d0b8807b4a128d6390c44a6accef, tm=1518101781568}'),('d5a58fbd1c2f49afa1488ffcf8f03938','admin','2018-03-28 23:23:17','新增按钮权限pd{BUTTON_ID=4c7f34b9eed54683957f356afcda24df, RB_ID=ac6547f3130c41e5882bf82dabbb18d5, ROLE_ID=75e75bc1b50c4ca1a6d64c1c4f249fd1, guid=1522250597404}'),('d6eb9d152e674850bdece6996ab6abfb','admin','2018-04-04 20:46:26','登录系统'),('de464f61489d4d4e86d848f31a20f11e','admin','2018-04-04 20:58:51','退出'),('e3de8db654034edea0327ea9641c7029','admin','2018-04-04 21:09:17','退出'),('ee4eb6f1f34e4f93b14dc7644c18cb60','admin','2018-02-08 22:55:08','删除系统用户：{USER_ID=eded77bdf35347249b2bacfa181c869d, tm=1518101708704}'),('f1144b466c7044b887de6204a6f615ba','admin','2018-04-03 23:57:41','登录系统'),('f551a80b963748aa8bea41d41da31361','admin','2018-02-06 23:08:27','登录系统'),('f60964f35af64224b0847c7f8382971e','admin','2018-03-29 00:21:38','退出'),('f8b90e3dfc8d4869837a554886128fdd','admin','2018-03-26 23:42:48','登录系统');
/*!40000 ALTER TABLE `sys_fhlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_fhsms`
--

DROP TABLE IF EXISTS `sys_fhsms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_fhsms` (
  `FHSMS_ID` varchar(100) NOT NULL,
  `CONTENT` varchar(1000) DEFAULT NULL COMMENT '内容',
  `TYPE` varchar(5) DEFAULT NULL COMMENT '类型',
  `TO_USERNAME` varchar(255) DEFAULT NULL COMMENT '收信人',
  `FROM_USERNAME` varchar(255) DEFAULT NULL COMMENT '发信人',
  `SEND_TIME` varchar(100) DEFAULT NULL COMMENT '发信时间',
  `STATUS` varchar(5) DEFAULT NULL COMMENT '状态',
  `SANME_ID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`FHSMS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_fhsms`
--

LOCK TABLES `sys_fhsms` WRITE;
/*!40000 ALTER TABLE `sys_fhsms` DISABLE KEYS */;
INSERT INTO `sys_fhsms` VALUES ('05879f5868824f35932ee9f2062adc03','你好','2','admin','san','2016-01-25 14:05:31','1','b311e893228f42d5a05dbe16917fd16f'),('071e50cb0b62419eae1d515258ba6cfa','qqqq','1','san','admin','2017-10-28 01:37:25','1','c9b9593a63fa46be93e02341f569af7c'),('073ca05d11a048b1afea20674e92ff2d','你好','1','admin','san','2017-04-10 03:02:09','1','89722f04dff4469e8e66e40aa5faec8d'),('07ffb9f3d56540b0a6ecc4efe687c093','eeee','1','admin','san','2017-10-28 01:07:33','1','547a335bfc474bdaa7b185030813d0e0'),('23b122605fa44215aed13fb0e7accfc8','你好','2','san','admin','2017-04-10 02:39:34','1','bc269cfdba1e4ec8a01950cca6433bdc'),('2635dd035c6f4bb5a091abdd784bd899','你好','2','san','admin','2016-01-25 14:05:02','1','1b7637306683460f89174c2b025862b5'),('3f8b758aad604b94b6546b3befc9771c','淡淡的','1','admin','san','2017-04-10 03:02:37','1','00af04f2a609428fb03fd173108ba44d'),('516924722fc34967b70b857c6cc15d98','qqqq','2','admin','san','2017-10-28 01:37:25','1','c9b9593a63fa46be93e02341f569af7c'),('537adc9283884c69bd1a4b526a162c09','dddd','1','admin','san22','2017-10-28 01:16:51','2','8bc4089fc4b54da8bf61baba205a39b6'),('5929bdf7ca5448078f5a87fd1d2b9a3d','淡淡的','2','san','admin','2017-04-10 03:02:37','1','00af04f2a609428fb03fd173108ba44d'),('6aca934070cb46cdb088f68d5cc60142','ddd','2','san','admin','2017-10-28 01:06:49','1','c1e0cc826f064b89b3ff9c44d874bed5'),('77ed13f9c49a4c4bb460c41b8580dd36','gggg','2','admin','san','2016-01-24 21:22:43','2','dd9ee339576e48c5b046b94fa1901d00'),('888782abb56a4f0dad9fc657572e7dd2','你也好','2','admin','san','2017-04-10 03:03:57','1','c146fb48cf7b47499840bfb94db40b7d'),('cbb6e6089e9f499089732a704edf74b4','你好','2','san','admin','2017-04-10 03:02:09','1','89722f04dff4469e8e66e40aa5faec8d'),('d3aedeb430f640359bff86cd657a8f59','你好','1','admin','san','2016-01-24 21:22:12','1','f022fbdce3d845aba927edb698beb90b'),('dead6d5b62b54cf58709e92a588dbfe7','你也好','1','san','admin','2017-04-10 03:03:57','1','c146fb48cf7b47499840bfb94db40b7d'),('e5376b1bd54b489cb7f2203632bd74ec','管理员好','2','admin','san','2016-01-25 14:06:13','2','b347b2034faf43c79b54be4627f3bd2b'),('e613ac0fcc454f32895a70b747bf4fb5','你也好','2','admin','san','2016-01-25 16:27:54','2','ce8dc3b15afb40f28090f8b8e13f078d'),('f25e00cfafe741a3a05e3839b66dc7aa','你好','2','san','admin','2016-01-25 16:26:44','1','920b20dafdfb4c09b560884eb277c51d'),('f525a636e99d4d599f511ea281756490','eee','1','admin','eee','2017-10-28 01:37:44','2','ceb7716a167b4eacbe310547470b6b8d');
/*!40000 ALTER TABLE `sys_fhsms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_loginimg`
--

DROP TABLE IF EXISTS `sys_loginimg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_loginimg` (
  `LOGINIMG_ID` varchar(100) NOT NULL,
  `NAME` varchar(30) DEFAULT NULL COMMENT '文件名',
  `FILEPATH` varchar(100) DEFAULT NULL COMMENT '路径',
  `TYPE` int(2) NOT NULL COMMENT '状态',
  `FORDER` int(3) NOT NULL COMMENT '排序',
  PRIMARY KEY (`LOGINIMG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_loginimg`
--

LOCK TABLES `sys_loginimg` WRITE;
/*!40000 ALTER TABLE `sys_loginimg` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_loginimg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_menu` (
  `MENU_ID` int(11) NOT NULL,
  `MENU_NAME` varchar(255) DEFAULT NULL,
  `MENU_URL` varchar(255) DEFAULT NULL,
  `PARENT_ID` varchar(100) DEFAULT NULL,
  `MENU_ORDER` varchar(100) DEFAULT NULL,
  `MENU_ICON` varchar(60) DEFAULT NULL,
  `MENU_TYPE` varchar(10) DEFAULT NULL,
  `MENU_STATE` int(1) DEFAULT NULL,
  PRIMARY KEY (`MENU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (1,'系统管理','#','0','1','menu-icon fa fa-home blue','2',1),(2,'权限管理','#','1','1','menu-icon fa fa-lock black','1',1),(3,'日志管理','fhlog/list.do','1','6','menu-icon fa fa-book blue','1',1),(4,'文件管理','fhfile/list.do','59','3','menu-icon fa fa-folder-open purple','1',1),(6,'信息管理','#','0','5','menu-icon fa fa-credit-card green','2',1),(7,'图片管理','#','6','1','menu-icon fa fa-folder-o pink','2',1),(8,'性能监控','druid/index.html','9','10','menu-icon fa fa-tachometer red','1',1),(9,'系统工具','#','0','3','menu-icon fa fa-cog black','2',1),(10,'接口测试','tool/interfaceTest.do','9','2','menu-icon fa fa-exchange green','1',1),(11,'发送邮件','tool/goSendEmail.do','9','3','menu-icon fa fa-envelope-o green','1',1),(12,'置二维码','tool/goTwoDimensionCode.do','9','4','menu-icon fa fa-barcode green','1',1),(14,'地图工具','tool/map.do','9','6','menu-icon fa fa-globe black','1',1),(15,'微信管理','#','0','4','menu-icon fa fa-comments purple','2',1),(16,'文本回复','textmsg/list.do','15','2','menu-icon fa fa-comment green','2',1),(17,'应用命令','command/list.do','15','4','menu-icon fa fa-comment grey','2',1),(18,'图文回复','imgmsg/list.do','15','3','menu-icon fa fa-comment pink','2',1),(19,'关注回复','textmsg/goSubscribe.do','15','1','menu-icon fa fa-comment orange','2',1),(20,'在线管理','onlinemanager/list.do','1','5','menu-icon fa fa-laptop green','1',1),(21,'打印测试','tool/printTest.do','9','7','menu-icon fa fa-hdd-o grey','1',1),(22,'一级菜单','#','0','10','menu-icon fa fa-fire orange','2',1),(23,'二级菜单','#','22','1','menu-icon fa fa-leaf black','1',1),(24,'三级菜单','#','23','1','menu-icon fa fa-leaf black','1',1),(30,'四级菜单','#','24','1','menu-icon fa fa-leaf black','1',1),(31,'五级菜单1','#','30','1','menu-icon fa fa-leaf black','1',1),(32,'五级菜单2','#','30','2','menu-icon fa fa-leaf black','1',1),(33,'六级菜单','#','31','1','menu-icon fa fa-leaf black','1',1),(34,'六级菜单2','login_default.do','31','2','menu-icon fa fa-leaf black','1',1),(35,'四级菜单2','login_default.do','24','2','menu-icon fa fa-leaf black','1',1),(36,'角色(基础权限)','role.do','2','1','menu-icon fa fa-key orange','1',1),(37,'按钮权限','buttonrights/list.do','2','2','menu-icon fa fa-key green','1',1),(38,'菜单管理','menu/listAllMenu.do','1','3','menu-icon fa fa-folder-open-o brown','1',1),(39,'按钮管理','fhbutton/list.do','1','2','menu-icon fa fa-download orange','1',1),(40,'用户管理','#','0','2','menu-icon fa fa-users blue','2',1),(41,'系统用户','user/listUsers.do','40','1','menu-icon fa fa-users green','1',1),(42,'会员管理','happuser/listUsers.do','40','2','menu-icon fa fa-users orange','1',1),(43,'数据字典','dictionaries/listAllDict.do?DICTIONARIES_ID=0','1','4','menu-icon fa fa-book purple','1',1),(44,'代码生成器','#','9','0','menu-icon fa fa-cogs brown','1',1),(45,'七级菜单1','#','33','1','menu-icon fa fa-leaf black','1',1),(46,'七级菜单2','#','33','2','menu-icon fa fa-leaf black','1',1),(47,'八级菜单','login_default.do','45','1','menu-icon fa fa-leaf black','1',1),(48,'图表报表',' tool/fusionchartsdemo.do','9','5','menu-icon fa fa-bar-chart-o black','1',1),(50,'订单信息管理','orderinfo/list.do','6','7','menu-icon fa fa-envelope green','1',1),(51,'图片列表','pictures/list.do','7','1','menu-icon fa fa-folder-open-o green','1',1),(52,'图片爬虫','pictures/goImageCrawler.do','7','2','menu-icon fa fa-cloud-download green','1',1),(53,'表单构建器','tool/goFormbuilder.do','9','1','menu-icon fa fa-leaf black','1',1),(54,'数据库管理','#','0','9','menu-icon fa fa-hdd-o blue','2',1),(55,'数据库备份','brdb/listAllTable.do','54','1','menu-icon fa fa-cloud-upload blue','1',1),(56,'数据库还原','brdb/list.do','54','3','menu-icon fa fa-cloud-download blue','1',1),(57,'备份定时器','timingbackup/list.do','54','2','menu-icon fa fa-tachometer blue','1',1),(58,'SQL编辑器','sqledit/view.do','54','4','menu-icon fa fa-pencil-square-o blue','1',1),(59,'OA办公','#','0','6','menu-icon fa fa-laptop pink','2',1),(60,'组织机构','department/listAllDepartment.do?DEPARTMENT_ID=0','59','1','menu-icon fa fa-users green','1',1),(61,'反向生成','recreateCode/list.do','44','2','menu-icon fa fa-cogs blue','1',1),(62,'正向生成','createCode/list.do','44','1','menu-icon fa fa-cogs green','1',1),(63,'主附结构','attached/list.do','6','2','menu-icon fa fa-folder-open blue','1',1),(64,'员工管理','staff/list.do','59','2','menu-icon fa fa-users blue','1',1),(65,'多数据源','datasource2/list.do','6','4','menu-icon fa fa-folder-open-o purple','1',0),(66,'下拉联动','linkage/view.do','6','5','menu-icon fa fa-exchange green','1',1),(67,'公众号管理','key/list.do','15','0','menu-icon fa fa-comments blue','1',1),(68,'快递查询','tool/queryExpress.do','9','8','menu-icon fa fa-fighter-jet green','1',1),(69,'模版管理','#','44','3','menu-icon fa fa-folder-open-o purple','1',1),(70,'单表模版','codeeditor/goEdit.do?type=createCode&ftl=controllerTemplate','69','1','menu-icon fa fa-folder-open green','1',1),(71,'树形表模版','codeeditor/goEdit.do?type=createTreeCode&ftl=controllerTemplate','69','4','menu-icon fa fa-folder-open blue','1',1),(72,'主表模版','codeeditor/goEdit.do?type=createFaCode&ftl=controllerTemplate','69','2','menu-icon fa fa-folder-open orange','1',1),(73,'明细表模版','codeeditor/goEdit.do?type=createSoCode&ftl=controllerTemplate','69','3','menu-icon fa fa-folder-open red','1',1),(74,'处理类','codeeditor/goEdit.do?type=createCode&ftl=controllerTemplate','70','1','menu-icon fa fa-folder green','1',1),(75,'service层','codeeditor/goEdit.do?type=createCode&ftl=serviceTemplate','70','3','menu-icon fa fa-folder orange','1',1),(76,'service层manager','codeeditor/goEdit.do?type=createCode&ftl=managerTemplate','70','2','menu-icon fa fa-folder blue','1',1),(77,'mapper_Mysql','codeeditor/goEdit2.do?type=createCode&ftl=mapperMysqlTemplate','70','4','menu-icon fa fa-folder red','1',1),(78,'mapper_Oracle','codeeditor/goEdit2.do?type=createCode&ftl=mapperOracleTemplate','70','5','menu-icon fa fa-folder black','1',1),(79,'mapper_Sqlserver','codeeditor/goEdit2.do?type=createCode&ftl=mapperSqlserverTemplate','70','6','menu-icon fa fa-folder grey','1',1),(80,'mysql_SQL脚本','codeeditor/goEdit.do?type=createCode&ftl=mysql_SQL_Template','70','7','menu-icon fa fa-folder pink','1',1),(81,'oracle_SQL脚本','codeeditor/goEdit.do?type=createCode&ftl=oracle_SQL_Template','70','8','menu-icon fa fa-folder brown','1',1),(82,'sqlserver_SQL脚本','codeeditor/goEdit.do?type=createCode&ftl=sqlserver_SQL_Template','70','9','menu-icon fa fa-folder purple','1',1),(83,'jsp_list','codeeditor/goEdit2.do?type=createCode&ftl=jsp_list_Template','70','10','menu-icon fa fa-folder orange','1',1),(84,'jsp_edit','codeeditor/goEdit2.do?type=createCode&ftl=jsp_edit_Template','70','11','menu-icon fa fa-folder blue','1',1),(86,'处理类','codeeditor/goEdit.do?type=createFaCode&ftl=controllerTemplate','72','1','menu-icon fa fa-folder blue','1',1),(87,'service层manager','codeeditor/goEdit.do?type=createFaCode&ftl=managerTemplate','72','2','menu-icon fa fa-folder green','1',1),(88,'service层','codeeditor/goEdit.do?type=createFaCode&ftl=serviceTemplate','72','3','menu-icon fa fa-folder black','1',1),(89,'mapper_Mysql','codeeditor/goEdit2.do?type=createFaCode&ftl=mapperMysqlTemplate','72','4','menu-icon fa fa-folder pink','1',1),(90,'mapper_Oracle ','codeeditor/goEdit2.do?type=createFaCode&ftl=mapperOracleTemplate','72','5','menu-icon fa fa-folder brown','1',1),(91,'mapper_Sqlserver','codeeditor/goEdit2.do?type=createFaCode&ftl=mapperSqlserverTemplate','72','6','menu-icon fa fa-folder purple','1',1),(92,'mysql_SQL脚本','codeeditor/goEdit.do?type=createFaCode&ftl=mysql_SQL_Template','72','7','menu-icon fa fa-folder blue','1',1),(93,'oracle_SQL脚本  ','codeeditor/goEdit.do?type=createFaCode&ftl=oracle_SQL_Template','72','8','menu-icon fa fa-folder orange','1',1),(94,'sqlserver_SQL脚本  ','codeeditor/goEdit.do?type=createFaCode&ftl=sqlserver_SQL_Template','72','9','menu-icon fa fa-folder green','1',1),(95,'jsp_list','codeeditor/goEdit2.do?type=createFaCode&ftl=jsp_list_Template','72','10','menu-icon fa fa-folder purple','1',1),(96,'jsp_edit','codeeditor/goEdit2.do?type=createFaCode&ftl=jsp_edit_Template','72','11','menu-icon fa fa-folder blue','1',1),(97,'处理类','codeeditor/goEdit.do?type=createSoCode&ftl=controllerTemplate','73','1','menu-icon fa fa-folder blue','1',1),(98,'service层manager','codeeditor/goEdit.do?type=createSoCode&ftl=managerTemplate','73','2','menu-icon fa fa-folder green','1',1),(99,'service层','codeeditor/goEdit.do?type=createSoCode&ftl=serviceTemplate','73','3','menu-icon fa fa-folder black','1',1),(100,'mapper_Mysql','codeeditor/goEdit2.do?type=createSoCode&ftl=mapperMysqlTemplate','73','4','menu-icon fa fa-folder pink','1',1),(101,'mapper_Oracle ','codeeditor/goEdit2.do?type=createSoCode&ftl=mapperOracleTemplate','73','5','menu-icon fa fa-folder brown','1',1),(102,'mapper_Sqlserver','codeeditor/goEdit2.do?type=createSoCode&ftl=mapperSqlserverTemplate','73','6','menu-icon fa fa-folder purple','1',1),(103,'mysql_SQL脚本','codeeditor/goEdit.do?type=createSoCode&ftl=mysql_SQL_Template','73','7','menu-icon fa fa-folder blue','1',1),(104,'oracle_SQL脚本  ','codeeditor/goEdit.do?type=createSoCode&ftl=oracle_SQL_Template','73','8','menu-icon fa fa-folder orange','1',1),(105,'sqlserver_SQL脚本  ','codeeditor/goEdit.do?type=createSoCode&ftl=sqlserver_SQL_Template','73','9','menu-icon fa fa-folder green','1',1),(106,'jsp_list','codeeditor/goEdit2.do?type=createSoCode&ftl=jsp_list_Template','73','10','menu-icon fa fa-folder purple','1',1),(107,'jsp_edit','codeeditor/goEdit2.do?type=createSoCode&ftl=jsp_edit_Template','73','11','menu-icon fa fa-folder blue','1',1),(108,'处理类','codeeditor/goEdit.do?type=createTreeCode&ftl=controllerTemplate','71','1','menu-icon fa fa-folder blue','1',1),(109,'service层manager','codeeditor/goEdit.do?type=createTreeCode&ftl=managerTemplate','71','2','menu-icon fa fa-folder green','1',1),(110,'service层','codeeditor/goEdit.do?type=createTreeCode&ftl=serviceTemplate','71','3','menu-icon fa fa-folder black','1',1),(111,'mapper_Mysql','codeeditor/goEdit2.do?type=createTreeCode&ftl=mapperMysqlTemplate','71','5','menu-icon fa fa-folder pink','1',1),(112,'mapper_Oracle ','codeeditor/goEdit2.do?type=createTreeCode&ftl=mapperOracleTemplate','71','6','menu-icon fa fa-folder brown','1',1),(113,'mapper_Sqlserver','codeeditor/goEdit2.do?type=createTreeCode&ftl=mapperSqlserverTemplate','71','7','menu-icon fa fa-folder purple','1',1),(114,'mysql_SQL脚本','codeeditor/goEdit.do?type=createTreeCode&ftl=mysql_SQL_Template','71','8','menu-icon fa fa-folder blue','1',1),(115,'oracle_SQL脚本  ','codeeditor/goEdit.do?type=createTreeCode&ftl=oracle_SQL_Template','71','9','menu-icon fa fa-folder orange','1',1),(116,'sqlserver_SQL脚本  ','codeeditor/goEdit.do?type=createTreeCode&ftl=sqlserver_SQL_Template','71','10','menu-icon fa fa-folder green','1',1),(117,'jsp_list','codeeditor/goEdit2.do?type=createTreeCode&ftl=jsp_list_Template','71','11','menu-icon fa fa-folder purple','1',1),(118,'jsp_edit','codeeditor/goEdit2.do?type=createTreeCode&ftl=jsp_edit_Template','71','12','menu-icon fa fa-folder blue','1',1),(119,'实体类','codeeditor/goEdit.do?type=createTreeCode&ftl=entityTemplate','71','4','menu-icon fa fa-folder green','1',1),(120,'jsp_tree','codeeditor/goEdit2.do?type=createTreeCode&ftl=jsp_tree_Template','71','13','menu-icon fa fa-folder purple','1',1),(121,'视频DEMO','tool/video.do','9','9','menu-icon fa fa-film blue','1',1),(122,'商品管理','goods/list.do','6','6','menu-icon fa fa-leaf black','1',1),(123,'订单上传','uploadtrigger/goupload.do','6','9','menu-icon fa fa-cloud-upload black','1',1);
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role` (
  `ROLE_ID` varchar(100) NOT NULL,
  `ROLE_NAME` varchar(100) DEFAULT NULL,
  `RIGHTS` varchar(255) DEFAULT NULL,
  `PARENT_ID` varchar(100) DEFAULT NULL,
  `ADD_QX` varchar(255) DEFAULT NULL,
  `DEL_QX` varchar(255) DEFAULT NULL,
  `EDIT_QX` varchar(255) DEFAULT NULL,
  `CHA_QX` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES ('1','系统管理组','21267647932519968340232681879901298654','0','1','1','1','1'),('115b386ff04f4352b060dffcd2b5d1da','中级会员','2658455991531145831358883798259359488','2','0','0','0','0'),('1b67fc82ce89457a8347ae53e43a347e','初级会员','2658455991531145831358883798259359488','2','0','0','0','0'),('2','会员组','2658455991531145831358883798259359488','0','0','0','0','1'),('3264c8e83d0248bb9e3ea6195b4c0216','一级管理员','2658455991569831745807617419095572992','1','1129198441726016','1125899906842688','1125899906842688','2658455991569831745808743319002513984'),('46294b31a71c4600801724a6eb06bb26','职位组','','0','0','0','0','0'),('5466347ac07044cb8d82990ec7f3a90e','主管','','46294b31a71c4600801724a6eb06bb26','0','0','0','0'),('68f8e4a39efe47c7bb869e9d15ab925d','二级管理员','119911717778459984064','1','98304','','3298534981632','5497558138880'),('75e75bc1b50c4ca1a6d64c1c4f249fd1','华榕测试','15950735949418990474846810623270977600','1','0','0','0','1125899906842688'),('856849f422774ad390a4e564054d8cc8','经理','','46294b31a71c4600801724a6eb06bb26','0','0','0','0'),('8b70a7e67f2841e7aaba8a4d92e5ff6f','高级会员','2658455991531145831358883798259359488','2','0','0','0','0'),('c21cecf84048434b93383182b1d98cba','组长','','46294b31a71c4600801724a6eb06bb26','0','0','0','0'),('d449195cd8e7491080688c58e11452eb','总监','','46294b31a71c4600801724a6eb06bb26','0','0','0','0'),('de9de2f006e145a29d52dfadda295353','三级管理员','20176126330619822096','1','','7696581492736','5497558138880',''),('fhadminzhuche','注册用户','','1','0','0','0','0');
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_fhbutton`
--

DROP TABLE IF EXISTS `sys_role_fhbutton`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role_fhbutton` (
  `RB_ID` varchar(100) NOT NULL,
  `ROLE_ID` varchar(100) DEFAULT NULL,
  `BUTTON_ID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`RB_ID`),
  KEY `角色表外键` (`ROLE_ID`) USING BTREE,
  KEY `fbutton` (`BUTTON_ID`),
  CONSTRAINT `fbutton` FOREIGN KEY (`BUTTON_ID`) REFERENCES `sys_fhbutton` (`FHBUTTON_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `frole` FOREIGN KEY (`ROLE_ID`) REFERENCES `sys_role` (`ROLE_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_fhbutton`
--

LOCK TABLES `sys_role_fhbutton` WRITE;
/*!40000 ALTER TABLE `sys_role_fhbutton` DISABLE KEYS */;
INSERT INTO `sys_role_fhbutton` VALUES ('143a2aed88d4406d82c90424b0dabbe0','3264c8e83d0248bb9e3ea6195b4c0216','cc51b694d5344d28a9aa13c84b7166cd'),('40864ef63e5f4cb78c1560772b04a6b5','75e75bc1b50c4ca1a6d64c1c4f249fd1','cc51b694d5344d28a9aa13c84b7166cd'),('4e9759f222ce4808b4cbde615981a7be','3264c8e83d0248bb9e3ea6195b4c0216','4c7f34b9eed54683957f356afcda24df'),('5b4781c41d5840cb90907acc46893c82','75e75bc1b50c4ca1a6d64c1c4f249fd1','da7fd386de0b49ce809984f5919022b8'),('6fbac1cee9f94c12a30a06f3a81aeed7','3264c8e83d0248bb9e3ea6195b4c0216','3542adfbda73410c976e185ffe50ad06'),('7fcbbb2c319647ffb8642bfcfb64b430','75e75bc1b50c4ca1a6d64c1c4f249fd1','4efa162fce8340f0bd2dcd3b11d327ec'),('80cc5ceca2fe4863ba9e00ff999ccd82','75e75bc1b50c4ca1a6d64c1c4f249fd1','3542adfbda73410c976e185ffe50ad06'),('8e22a4652f834909a8fa1d4abf3f90b4','de9de2f006e145a29d52dfadda295353','da7fd386de0b49ce809984f5919022b8'),('99752f66f2924695aa7e735f1d7bdb81','68f8e4a39efe47c7bb869e9d15ab925d','46992ea280ba4b72b29dedb0d4bc0106'),('ac6547f3130c41e5882bf82dabbb18d5','75e75bc1b50c4ca1a6d64c1c4f249fd1','4c7f34b9eed54683957f356afcda24df'),('eec36157e6c744d9a25c9fa29995264f','75e75bc1b50c4ca1a6d64c1c4f249fd1','46992ea280ba4b72b29dedb0d4bc0106'),('ef4e54bd358146158f8f5c1d932af465','fhadminzhuche','4c7f34b9eed54683957f356afcda24df');
/*!40000 ALTER TABLE `sys_role_fhbutton` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user` (
  `USER_ID` varchar(100) NOT NULL,
  `USERNAME` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `RIGHTS` varchar(255) DEFAULT NULL,
  `ROLE_ID` varchar(100) DEFAULT NULL,
  `LAST_LOGIN` varchar(255) DEFAULT NULL,
  `IP` varchar(100) DEFAULT NULL,
  `STATUS` varchar(32) DEFAULT NULL,
  `BZ` varchar(255) DEFAULT NULL,
  `SKIN` varchar(100) DEFAULT NULL,
  `EMAIL` varchar(32) DEFAULT NULL,
  `NUMBER` varchar(100) DEFAULT NULL,
  `PHONE` varchar(32) DEFAULT NULL,
  `ROLE_IDS` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES ('1','admin','de41b7fb99201d8334c23c014db35ecd92df81bc','LD','1133671055321055258374707980945218933803269864762743594642571294','1','2018-04-04 22:12:47','0:0:0:0:0:0:0:1','0','admin','default','a@main.com','001','18788888888',NULL),('16f59e60d97643c6a41d4b6027a0404a','huarong','c9e536f07b59ed10f769fd4a3fd1da661661838c','华榕','','75e75bc1b50c4ca1a6d64c1c4f249fd1','2018-03-28 23:25:08','0:0:0:0:0:0:0:1','0','','default','a@qq.com','huarong','13911111111','75e75bc1b50c4ca1a6d64c1c4f249fd1,fh,'),('280417faf62348ad82de85fa82206c85','w3','d77c1e457d6af24fa0bf31f0c08c331aaa15fd44','kkl','','3264c8e83d0248bb9e3ea6195b4c0216','2017-11-25 04:24:32','127.0.0.1','0','q1','default','25222222@qq.com','33656','13796586965','68f8e4a39efe47c7bb869e9d15ab925d,fh,'),('59c48e228f7243ae9246671708a36174','ft','01e8ff9758807284ae0d520905a4ba35f4efe688','1','','3264c8e83d0248bb9e3ea6195b4c0216','2017-11-25 04:25:34','127.0.0.1','0','ddd','default','ssdsd@qq.com','12','18765810286',''),('69177258a06e4927b4639ab1684c3320','san','a9812f34b2ae8f9dc912cee860e5e5025c117696','三','','3264c8e83d0248bb9e3ea6195b4c0216','2018-02-06 23:14:42','0:0:0:0:0:0:0:1','0','111','default','978336446@qq.com','333','13562202556','68f8e4a39efe47c7bb869e9d15ab925d,fh,de9de2f006e145a29d52dfadda295353,fh,'),('69a8805832814c78b61563b6e787bd40','w2','a5815a141484a0a71ac71a11ca2faf5f7c67e8e7','wwqw','','de9de2f006e145a29d52dfadda295353','','','0','1121','default','12111111@qq.com','121212','13562202225',NULL),('896496bf0906410d8495110e1b14f69e','oo1','6a3833e90aeb440deba899cc9b39fbc79c18a946','D1','','68f8e4a39efe47c7bb869e9d15ab925d','','','0','121','default','pppp@qq.com','12ww','13793758969',NULL),('9a89f6cd9b654b71b39c6f8c6a54d6df','s2','796927602c27126ba11cb413b8549e8dc9c20fad','qwq','','de9de2f006e145a29d52dfadda295353','','','0','qq1','default','wwwwww@qq.com','121211212','13797858569',NULL);
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_userphoto`
--

DROP TABLE IF EXISTS `sys_userphoto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_userphoto` (
  `USERPHOTO_ID` varchar(100) NOT NULL,
  `USERNAME` varchar(30) DEFAULT NULL COMMENT '用户名',
  `PHOTO0` varchar(255) DEFAULT NULL COMMENT '原图',
  `PHOTO1` varchar(100) DEFAULT NULL COMMENT '头像1',
  `PHOTO2` varchar(100) DEFAULT NULL COMMENT '头像2',
  `PHOTO3` varchar(100) DEFAULT NULL COMMENT '头像3',
  PRIMARY KEY (`USERPHOTO_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_userphoto`
--

LOCK TABLES `sys_userphoto` WRITE;
/*!40000 ALTER TABLE `sys_userphoto` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_userphoto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_attached`
--

DROP TABLE IF EXISTS `tb_attached`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_attached` (
  `ATTACHED_ID` varchar(100) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL COMMENT '名称',
  `FDESCRIBE` varchar(255) DEFAULT NULL COMMENT '描述',
  `PRICE` double(11,2) DEFAULT NULL COMMENT '价格',
  `CTIME` varchar(32) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`ATTACHED_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_attached`
--

LOCK TABLES `tb_attached` WRITE;
/*!40000 ALTER TABLE `tb_attached` DISABLE KEYS */;
INSERT INTO `tb_attached` VALUES ('60d05d8e7d9046a4893f8bdaa34d6488','eee','ee',22.00,'2016-04-22 15:33:23'),('d74b6f507e784607b8f85e31e3cfad22','AA','aaa',222.00,'2016-04-17 18:20:41');
/*!40000 ALTER TABLE `tb_attached` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_attachedmx`
--

DROP TABLE IF EXISTS `tb_attachedmx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_attachedmx` (
  `ATTACHEDMX_ID` varchar(100) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL COMMENT '名称',
  `TITLE` varchar(255) DEFAULT NULL COMMENT '标题',
  `CTIME` varchar(32) DEFAULT NULL COMMENT '创建日期',
  `PRICE` double(11,2) DEFAULT NULL COMMENT '单价',
  `ATTACHED_ID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ATTACHEDMX_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_attachedmx`
--

LOCK TABLES `tb_attachedmx` WRITE;
/*!40000 ALTER TABLE `tb_attachedmx` DISABLE KEYS */;
INSERT INTO `tb_attachedmx` VALUES ('04717d1a034c4e51aacd5e062a4c63bd','ddd','ddd','2016-03-29',111.00,'d74b6f507e784607b8f85e31e3cfad22'),('4394c6ace3d44b17a635de56f5c9a271','sss','ss','2016-11-29',1.00,'60d05d8e7d9046a4893f8bdaa34d6488'),('7992c783fd0b476d90be363858a941ba','ddd','ddsds','2016-04-06',222.00,'d74b6f507e784607b8f85e31e3cfad22');
/*!40000 ALTER TABLE `tb_attachedmx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_pictures`
--

DROP TABLE IF EXISTS `tb_pictures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_pictures` (
  `PICTURES_ID` varchar(100) NOT NULL,
  `TITLE` varchar(255) DEFAULT NULL COMMENT '标题',
  `NAME` varchar(255) DEFAULT NULL COMMENT '文件名',
  `PATH` varchar(255) DEFAULT NULL COMMENT '路径',
  `CREATETIME` varchar(100) DEFAULT NULL COMMENT '创建时间',
  `MASTER_ID` varchar(255) DEFAULT NULL COMMENT '属于',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`PICTURES_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_pictures`
--

LOCK TABLES `tb_pictures` WRITE;
/*!40000 ALTER TABLE `tb_pictures` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_pictures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weixin_command`
--

DROP TABLE IF EXISTS `weixin_command`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weixin_command` (
  `COMMAND_ID` varchar(100) NOT NULL,
  `KEYWORD` varchar(255) DEFAULT NULL COMMENT '关键词',
  `COMMANDCODE` varchar(255) DEFAULT NULL COMMENT '应用路径',
  `CREATETIME` varchar(255) DEFAULT NULL COMMENT '创建时间',
  `STATUS` int(1) NOT NULL COMMENT '状态',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`COMMAND_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weixin_command`
--

LOCK TABLES `weixin_command` WRITE;
/*!40000 ALTER TABLE `weixin_command` DISABLE KEYS */;
INSERT INTO `weixin_command` VALUES ('2636750f6978451b8330874c9be042c2','锁定服务器','rundll32.exe user32.dll,LockWorkStation','2015-05-10 21:25:06',1,'锁定计算机'),('46217c6d44354010823241ef484f7214','打开浏览器','C:/Program Files/Internet Explorer/iexplore.exe','2015-05-09 02:43:02',1,'打开浏览器操作'),('576adcecce504bf3bb34c6b4da79a177','关闭浏览器','taskkill /f /im iexplore.exe','2015-05-09 02:36:48',2,'关闭浏览器操作'),('854a157c6d99499493f4cc303674c01f','关闭QQ','taskkill /f /im qq.exe','2015-05-10 21:25:46',1,'关闭QQ'),('ab3a8c6310ca4dc8b803ecc547e55ae7','打开QQ','D:/SOFT/QQ/QQ/Bin/qq.exe','2015-05-10 21:25:25',1,'打开QQ');
/*!40000 ALTER TABLE `weixin_command` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weixin_imgmsg`
--

DROP TABLE IF EXISTS `weixin_imgmsg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weixin_imgmsg` (
  `IMGMSG_ID` varchar(100) NOT NULL,
  `KEYWORD` varchar(255) DEFAULT NULL COMMENT '关键词',
  `CREATETIME` varchar(100) DEFAULT NULL COMMENT '创建时间',
  `STATUS` int(11) NOT NULL COMMENT '状态',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  `TITLE1` varchar(255) DEFAULT NULL COMMENT '标题1',
  `DESCRIPTION1` varchar(255) DEFAULT NULL COMMENT '描述1',
  `IMGURL1` varchar(255) DEFAULT NULL COMMENT '图片地址1',
  `TOURL1` varchar(255) DEFAULT NULL COMMENT '超链接1',
  `TITLE2` varchar(255) DEFAULT NULL COMMENT '标题2',
  `DESCRIPTION2` varchar(255) DEFAULT NULL COMMENT '描述2',
  `IMGURL2` varchar(255) DEFAULT NULL COMMENT '图片地址2',
  `TOURL2` varchar(255) DEFAULT NULL COMMENT '超链接2',
  `TITLE3` varchar(255) DEFAULT NULL COMMENT '标题3',
  `DESCRIPTION3` varchar(255) DEFAULT NULL COMMENT '描述3',
  `IMGURL3` varchar(255) DEFAULT NULL COMMENT '图片地址3',
  `TOURL3` varchar(255) DEFAULT NULL COMMENT '超链接3',
  `TITLE4` varchar(255) DEFAULT NULL COMMENT '标题4',
  `DESCRIPTION4` varchar(255) DEFAULT NULL COMMENT '描述4',
  `IMGURL4` varchar(255) DEFAULT NULL COMMENT '图片地址4',
  `TOURL4` varchar(255) DEFAULT NULL COMMENT '超链接4',
  `TITLE5` varchar(255) DEFAULT NULL COMMENT '标题5',
  `DESCRIPTION5` varchar(255) DEFAULT NULL COMMENT '描述5',
  `IMGURL5` varchar(255) DEFAULT NULL COMMENT '图片地址5',
  `TOURL5` varchar(255) DEFAULT NULL COMMENT '超链接5',
  `TITLE6` varchar(255) DEFAULT NULL COMMENT '标题6',
  `DESCRIPTION6` varchar(255) DEFAULT NULL COMMENT '描述6',
  `IMGURL6` varchar(255) DEFAULT NULL COMMENT '图片地址6',
  `TOURL6` varchar(255) DEFAULT NULL COMMENT '超链接6',
  `TITLE7` varchar(255) DEFAULT NULL COMMENT '标题7',
  `DESCRIPTION7` varchar(255) DEFAULT NULL COMMENT '描述7',
  `IMGURL7` varchar(255) DEFAULT NULL COMMENT '图片地址7',
  `TOURL7` varchar(255) DEFAULT NULL COMMENT '超链接7',
  `TITLE8` varchar(255) DEFAULT NULL COMMENT '标题8',
  `DESCRIPTION8` varchar(255) DEFAULT NULL COMMENT '描述8',
  `IMGURL8` varchar(255) DEFAULT NULL COMMENT '图片地址8',
  `TOURL8` varchar(255) DEFAULT NULL COMMENT '超链接8',
  PRIMARY KEY (`IMGMSG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weixin_imgmsg`
--

LOCK TABLES `weixin_imgmsg` WRITE;
/*!40000 ALTER TABLE `weixin_imgmsg` DISABLE KEYS */;
INSERT INTO `weixin_imgmsg` VALUES ('380b2cb1f4954315b0e20618f7b5bd8f','首页','2015-05-10 20:51:09',1,'图文回复','图文回复标题','图文回复描述','http://a.hiphotos.baidu.com/image/h%3D360/sign=c6c7e73ebc389b5027ffe654b535e5f1/a686c9177f3e6709392bb8df3ec79f3df8dc55e3.jpg','www.baidu.com','','','','','','','','','','','','','','','','','','','','','','','','','','','','');
/*!40000 ALTER TABLE `weixin_imgmsg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weixin_key`
--

DROP TABLE IF EXISTS `weixin_key`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weixin_key` (
  `KEY_ID` varchar(100) NOT NULL,
  `USERNAME` varchar(100) DEFAULT NULL COMMENT '用户名',
  `APPID` varchar(100) DEFAULT NULL COMMENT 'appid',
  `APPSECRET` varchar(100) DEFAULT NULL COMMENT 'appsecret',
  `ACCESS_TOKEN` varchar(100) DEFAULT NULL COMMENT 'access_token',
  `CREATETIME` varchar(32) DEFAULT NULL COMMENT '创建时间',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  `WXUSERNAME` varchar(100) DEFAULT NULL COMMENT '公众号',
  PRIMARY KEY (`KEY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weixin_key`
--

LOCK TABLES `weixin_key` WRITE;
/*!40000 ALTER TABLE `weixin_key` DISABLE KEYS */;
INSERT INTO `weixin_key` VALUES ('58510f788aea4924b4a5438ecda5f749','itFteacher','111111122222','11112223332','','2017-03-29 02:31:03','itFteacher','itFteacher'),('a1e5687bbbc34a8eb148bec252d371e0','faz','wx1e00fb94a1fcd7295','e0e5c163bbc1758b9e7e2ef142131b7','','2017-04-10 00:34:00','faz','fzqcsdzf');
/*!40000 ALTER TABLE `weixin_key` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weixin_mymenu`
--

DROP TABLE IF EXISTS `weixin_mymenu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weixin_mymenu` (
  `MYMENU_ID` varchar(100) NOT NULL,
  `WXUSERNAME` varchar(100) DEFAULT NULL COMMENT '公众号',
  `USERNAME` varchar(100) DEFAULT NULL COMMENT '用户名',
  `TITLE` varchar(30) DEFAULT NULL COMMENT '菜单名称',
  `TYPE` varchar(10) DEFAULT NULL COMMENT '类型',
  `CONTENT` varchar(100) DEFAULT NULL COMMENT '指向',
  `XID` varchar(10) DEFAULT NULL COMMENT 'XID',
  PRIMARY KEY (`MYMENU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weixin_mymenu`
--

LOCK TABLES `weixin_mymenu` WRITE;
/*!40000 ALTER TABLE `weixin_mymenu` DISABLE KEYS */;
INSERT INTO `weixin_mymenu` VALUES ('00ca43bbba2746429c8a6e0028a2f197','itFteacher','itFteacher','','','','M33'),('02c67417e56f43a6be5356d5c5201ef7','itFteacher','itFteacher','ddd','click','eee','M21'),('0853ca56187044309ee5e2dfb93b2b16','fzqcsdzf','faz','公司介绍','click','首页','M31'),('0977efdd9394427abf73bf43a6c82a7e','fzqcsdzf','faz','','','','M34'),('13e5b9a51f87430dabe2d8cc998d297c','itFteacher','itFteacher','一级菜单','','','M1'),('14e68258190b45cba4d21e132508252d','itFteacher','itFteacher','','','','M13'),('16230e4149134556ac5edf691d25be2a','itFteacher','itFteacher','','','','M24'),('19353267c4ea43fb903b88f6401ea41a','itFteacher','itFteacher','','','','M25'),('1e4b0c96e0084ee4b80c8ea6d37a667f','fzqcsdzf','faz','','','','M25'),('230f6447fee84bcd827de0ec73970660','itFteacher','itFteacher','dde','','','M2'),('24315e33166647198dcbd31a44a1a866','itFteacher','itFteacher','','','','M14'),('35afd4adab304cde9a094d1df1d7ca97','fzqcsdzf','faz','服务指南','','','M2'),('3daed1d236224a729860e77fe7295ea7','itFteacher','itFteacher','','','','M32'),('3fbae4e173de4f36a6d721ca77b6480c','itFteacher','itFteacher','','','','M34'),('4532044ae6cd4c7cb1c89e2cfdb0d812','itFteacher','itFteacher','','','','M22'),('512c6fb9e4374ffa88397e5a5fcd7149','fzqcsdzf','faz','','','','M13'),('5f65f5be31e34b83b1f51afa4856c6db','fzqcsdzf','faz','','','','M24'),('5fb159eb85a049ef9e0f7b56c2c8538e','itFteacher','itFteacher','','','','M12'),('656c281ed7a142d6907baa6b36e93347','itFteacher','itFteacher','','','','M23'),('65c750aa4bf44b7a9de42352f8f409cb','fzqcsdzf','faz','','','','M23'),('679127c586784974a18e64a3660e0d11','itFteacher','itFteacher','','','','M35'),('71bb64b0be99487da8bb7f626f59ca92','fzqcsdzf','faz','','','','M35'),('72ccaa86b5eb4bdb85c368046f2c4a99','fzqcsdzf','faz','','','','M22'),('73438cf53ac9468895e6600b0a27437b','fzqcsdzf','faz','会员卡','click','会员卡','M11'),('77730082177e4960aa01a75b5b011c59','fzqcsdzf','faz','司考','click','司考','M21'),('82ce76710fd848028b158425bb88f61e','fzqcsdzf','faz','','','','M32'),('999a8965d4484facaaeb2768471207c5','itFteacher','itFteacher','','','','M3'),('aa09cedf69e04eda9bb3a0f3b77db46c','itFteacher','itFteacher','','','','M15'),('b003da264a08499e9c3c297001fbb080','fzqcsdzf','faz','','','','M14'),('b5ac19e5b3924dffa01ced024c5c0caa','fzqcsdzf','faz','会员中心','','','M1'),('bf05113f9ed84bba9874f081b3cc613f','fzqcsdzf','faz','商城','click','商城','M12'),('c193c0f155034d68a79c662b4046699f','itFteacher','itFteacher','','','','M11'),('d162cdf5d8494dff9c7825fa0f900f69','fzqcsdzf','faz','关于我们','','','M3'),('d998cb443172408bb713cf2c04d2388a','fzqcsdzf','faz','','','','M33'),('e940253208d84c81ae8fbec4f5f299a9','itFteacher','itFteacher','','','','M31'),('f3e3fc45b54e4888b2670ac09d85b478','fzqcsdzf','faz','','','','M15');
/*!40000 ALTER TABLE `weixin_mymenu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weixin_textmsg`
--

DROP TABLE IF EXISTS `weixin_textmsg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weixin_textmsg` (
  `TEXTMSG_ID` varchar(100) NOT NULL,
  `KEYWORD` varchar(255) DEFAULT NULL COMMENT '关键词',
  `CONTENT` varchar(255) DEFAULT NULL COMMENT '内容',
  `CREATETIME` varchar(100) DEFAULT NULL COMMENT '创建时间',
  `STATUS` int(2) DEFAULT NULL COMMENT '状态',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`TEXTMSG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weixin_textmsg`
--

LOCK TABLES `weixin_textmsg` WRITE;
/*!40000 ALTER TABLE `weixin_textmsg` DISABLE KEYS */;
INSERT INTO `weixin_textmsg` VALUES ('695cd74779734231928a253107ab0eeb','吃饭','吃了噢噢噢噢','2015-05-10 22:52:27',1,'文本回复'),('d4738af7aea74a6ca1a5fb25a98f9acb','关注','这里是关注后回复的内容','2015-05-11 02:12:36',1,'关注回复');
/*!40000 ALTER TABLE `weixin_textmsg` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-04-04 22:20:00
