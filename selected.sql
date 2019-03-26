-- MySQL dump 10.16  Distrib 10.1.25-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: my_idea_cms
-- ------------------------------------------------------
-- Server version	10.1.25-MariaDB-1~xenial

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
-- Table structure for table `prepaid_pack`
--

DROP TABLE IF EXISTS `prepaid_pack`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prepaid_pack` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_mkt_desc` text CHARACTER SET utf8 NOT NULL,
  `uup_circle` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `cgrp_end_range` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `up_sell_caption` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `access_fee_tax_type` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `open_market_flag` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `cross_sell` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `talktime_line_1` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `talk_time_tax` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `validity_period` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `product_sub_category` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `web_sub_category_2` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `web_sellable` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `vas_tax_type` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `service_tax` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `grace_period` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `display_rank` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `product_category` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `product_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `vas_tax` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `data_line_2` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `access_fee_tax` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `voucher_amount` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `bonus_talktime_type` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `cgrp_start_range` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `web_validity` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `up_sell` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `voice_line_1` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `card_group_set_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `lastupdate` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `voice_line_2` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `service_tax_type` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `talktime_line_2` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `read_more` text COLLATE utf8_unicode_ci NOT NULL,
  `app_sellable` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `online_recharge_flag` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `sms_line_1` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `access_fee_min` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `csmdealercode` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `bonus_talktime` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `voucher_enabled` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `homepage_display_flag` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `additional_categories` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `sms_line_2` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `bonus_validity` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `product_rating` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `cross_sell_caption` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `country` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `web_exclusive` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `voucher_count` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `talk_time_type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `data_line_1` varchar(200) CHARACTER SET utf8 NOT NULL,
  `homepage_display_rank` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `creation_date` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `access_fee_max` int(10) unsigned NOT NULL DEFAULT '0',
  `in_cgrp` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `vtopupcsmid` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `promotion_title` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `vtopupdbillid` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `assume_infinite_inventory` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cost_currency` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `effective_start_date` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `manufacturer_item_desc` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `manufacturer_name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `short_description` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unitcost` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `circle_code` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `item_group_code` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ItemID` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `organization_code` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit_of_measure` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32963 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prepaid_pack`
--
-- WHERE:  ItemID IN ('TN_RC_DEFAULT_TN_82970448','TN_RC_DEFAULT_TN_28017921','TN_RC_DEFAULT_TN_16369626','WB_RC_DEFAULT_WB_46375711','WB_RC_MBB_WB_48423823','WB_RC_WB01_FRC56_13601262','WB_RC_WB01_RET_SRC4_21147333','WB_RC_WB01_RET_SRC4_6874224','WB_RC_DEFAULT_WB_54119792','WB_RC_MBB_WB_63529868','WB_RC_WB01_FRC56_89182577','KO_RC_DEFAULT_KO_83597179','KO_RC_MBB_KO_78123844','KO_KOL01_RET_FRC56_30709617','KO_KOL01_RET_FRC56_86055663','KO_RC_DEFAULT_KO_32904061','KO_RC_MBB_KO_74479855')

LOCK TABLES `prepaid_pack` WRITE;
/*!40000 ALTER TABLE `prepaid_pack` DISABLE KEYS */;
INSERT INTO `prepaid_pack` VALUES (2662,'UL SMS','KOL','63','-','AMT','N','-','-','-','28','SMS Pack','-','-','PCT','18','90','210','SMS','SMS Pack','-','-','5339','-','AMT','63','28 Days','-','-','KOL01_RET_FRC56','2018-12-14 06:07:58.669','-','PCT','-','-','-','Y','100 LN SMS/Day - 28 days','-','-','63','-','-','-','Local & National','-','-','-','-','N','-','PCT','-','-','2018-02-13 06:08:34.87',63,'A947','-','100 LN SMS/Day - 28 days','-','Y','INR','VUwgU01T','2018-12-13 11:55:00','KOL01_RET_FRC56_A947_63_KO','VTOPUP','UL SMS','2000','63','KO','PROD','KO_KOL01_RET_FRC56_30709617','IDEA_CELL','EACH','Item','PREPAID/VTOPUP','2018-11-20 03:03:51','2018-12-18 07:04:04'),(2822,'120 LN SMS - 10 days','KOL','12','-','AMT','N','-','-','-','-','SMS Pack','-','-','PCT','18','90','210','SMS','SMS Pack','-','-','1017','-','AMT','12','10 Days','-','-','KOL01_RET_FRC56','2018-12-14 06:07:41.481','-','PCT','-','-','-','Y','120 LN SMS - 10 days','-','-','-','-','-','-','Local & National','-','-','-','-','N','-','PCT','-','-','2018-06-23 06:08:54.029232',12,'B053','-','120 LN SMS - 10 days','-','Y','INR','MTIwIEwvTiBTTVM=','2018-12-13 11:55:00','KOL01_RET_FRC56_B053_12_KO','VTOPUP','120 L/N SMS','2000','12','KO','PROD','KO_KOL01_RET_FRC56_86055663','IDEA_CELL','EACH','Item','PREPAID/VTOPUP','2018-11-20 03:03:52','2018-12-18 07:04:07'),(9956,'UL SMS','KOL','63','-','AMT','Y','-','-','-','28','SMS Pack','-','1','PCT','18','90','210','SMS','SMS Pack','-','-','5339','-','AMT','63','28 Days','-','-','RC_DEFAULT_KO','2018-12-14 06:08:18.357','-','PCT','-','-','1','Y','100 LN SMS/Day - 28 days','-','-','63','-','-','-','Local & National','-','-','-','-','N','-','PCT','-','-','2018-02-13 06:09:13.704',63,'A947','-','100 LN SMS/Day - 28 days','-','Y','INR','VUwgU01T','2018-12-13 11:55:00','RC_DEFAULT_KO_A947_63_KO','VTOPUP','UL SMS','3000','63','KO','PROD','KO_RC_DEFAULT_KO_83597179','IDEA_CELL','EACH','Item','PREPAID/VTOPUP','2018-11-20 03:06:01','2018-12-18 07:05:31'),(10116,'120 LN SMS - 10 days','KOL','12','-','AMT','Y','-','-','-','-','SMS Pack','-','1','PCT','18','90','210','SMS','SMS Pack','-','-','1017','-','AMT','12','10 Days','-','-','RC_DEFAULT_KO','2018-12-14 06:08:00.997','-','PCT','-','-','1','Y','120 LN SMS - 10 days','-','-','-','-','-','-','Local & National','-','-','-','-','N','-','PCT','-','-','2018-06-23 06:09:34.325326',12,'B053','-','120 LN SMS - 10 days','-','Y','INR','MTIwIEwvTiBTTVM=','2018-12-13 11:55:00','RC_DEFAULT_KO_B053_12_KO','VTOPUP','120 L/N SMS','3000','12','KO','PROD','KO_RC_DEFAULT_KO_32904061','IDEA_CELL','EACH','Item','PREPAID/VTOPUP','2018-11-20 03:06:05','2018-12-18 07:05:35'),(16686,'UL SMS 28 Days','WB','63','-','AMT','Y','-','-','-','28','SMS Pack','-','1','PCT','18','90','210','SMS','SMS','-','-','5339','-','AMT','63','28 Days','-','-','RC_DEFAULT_WB','2018-12-14 06:15:53.536','-','PCT','-','-','1','Y','100 LN SMS/Day -28 Days','-','-','63','-','-','-','Local & National SMS','-','-','-','-','N','-','PCT','-','-','2018-02-13 06:17:29.461',63,'H945','-','-','-','Y','INR','VUwgU01TIDI4IERheXM=','2018-12-13 11:50:00','RC_DEFAULT_WB_H945_63_WB','VTOPUP','UL SMS 28 Days','3000','63','WB','PROD','WB_RC_DEFAULT_WB_46375711','IDEA_CELL','EACH','Item','PREPAID/VTOPUP','2018-11-20 03:09:36','2018-12-18 07:06:43'),(22306,'UL SMS','KOL','63','-','AMT','N','-','-','-','28','SMS Pack','-','-','PCT','18','90','210','SMS','SMS Pack','-','-','5339','-','AMT','63','28 Days','-','-','RC_MBB_KO','2018-12-14 06:08:37.841','-','PCT','-','-','-','Y','100 LN SMS/Day - 28 days','-','-','63','-','-','-','Local & National','-','-','-','-','N','-','PCT','-','-','2018-02-13 06:09:49.917',63,'A947','-','100 LN SMS/Day - 28 days','-','Y','INR','VUwgU01T','2018-12-13 11:55:00','RC_MBB_KO_A947_63_KO','VTOPUP','UL SMS','2000','63','KO','PROD','KO_RC_MBB_KO_78123844','IDEA_CELL','EACH','Item','PREPAID/VTOPUP','2018-11-20 03:13:48','2018-12-18 07:07:37'),(22466,'120 LN SMS - 10 days','KOL','12','-','AMT','N','-','-','-','-','SMS Pack','-','-','PCT','18','90','210','SMS','SMS Pack','-','-','1017','-','AMT','12','10 Days','-','-','RC_MBB_KO','2018-12-14 06:08:20.773','-','PCT','-','-','-','Y','120 LN SMS - 10 days','-','-','-','-','-','-','Local & National','-','-','-','-','N','-','PCT','-','-','2018-06-23 06:10:15.576425',12,'B053','-','120 LN SMS - 10 days','-','Y','INR','MTIwIEwvTiBTTVM=','2018-12-13 11:55:00','RC_MBB_KO_B053_12_KO','VTOPUP','120 L/N SMS','2000','12','KO','PROD','KO_RC_MBB_KO_74479855','IDEA_CELL','EACH','Item','PREPAID/VTOPUP','2018-11-20 03:13:56','2018-12-18 07:07:41'),(25108,'UL SMS 28 Days','WB','63','-','AMT','N','-','-','-','28','SMS Pack','-','-','PCT','18','90','210','SMS','SMS','-','-','5339','-','AMT','63','28 Days','-','-','RC_MBB_WB','2018-12-14 06:16:13.331','-','PCT','-','-','-','Y','100 LN SMS/Day -28 Days','-','-','63','-','-','-','Local & National SMS','-','-','-','-','N','-','PCT','-','-','2018-02-13 06:17:57.498',63,'H945','-','-','-','Y','INR','VUwgU01TIDI4IERheXM=','2018-12-13 11:50:00','RC_MBB_WB_H945_63_WB','VTOPUP','UL SMS 28 Days','2000','63','WB','PROD','WB_RC_MBB_WB_48423823','IDEA_CELL','EACH','Item','PREPAID/VTOPUP','2018-11-20 03:16:19','2018-12-18 07:08:10'),(30212,'UL SMS 28 Days','WB','63','-','AMT','N','-','-','-','28','SMS Pack','-','-','PCT','18','90','210','SMS','SMS','-','-','5339','-','AMT','63','28 Days','-','-','RC_WB01_FRC56','2018-12-14 06:16:33.519','-','PCT','-','-','-','Y','100 LN SMS/Day -28 Days','-','-','63','-','-','-','Local & National SMS','-','-','-','-','N','-','PCT','-','-','2018-02-13 06:18:26.235',63,'H945','-','-','-','Y','INR','VUwgU01TIDI4IERheXM=','2018-12-13 11:50:00','RC_WB01_FRC56_H945_63_WB','VTOPUP','UL SMS 28 Days','2000','63','WB','PROD','WB_RC_WB01_FRC56_13601262','IDEA_CELL','EACH','Item','PREPAID/VTOPUP','2018-11-20 03:21:38','2018-12-18 07:08:44'),(31056,'UL SMS 28 Days','WB','63','-','AMT','N','-','-','-','28','SMS Pack','-','-','PCT','18','90','210','SMS','SMS','-','-','5339','-','AMT','63','28 Days','-','-','RC_WB01_RET_SRC4','2018-12-14 06:16:54.212','-','PCT','-','-','-','Y','100 LN SMS/Day -28 Days','-','-','63','-','-','-','Local & National SMS','-','-','-','-','N','-','PCT','-','-','2018-02-13 06:18:59.027',63,'H945','-','-','-','Y','INR','VUwgU01TIDI4IERheXM=','2018-12-13 11:50:00','RC_WB01_RET_SRC4_H945_63_WB','VTOPUP','UL SMS 28 Days','2000','63','WB','PROD','WB_RC_WB01_RET_SRC4_21147333','IDEA_CELL','EACH','Item','PREPAID/VTOPUP','2018-11-20 03:22:36','2018-12-18 07:08:54'),(32772,'-','TN','26','-','AMT','Y','-','-','-','-','SMS Pack','-','1','PCT','18','90','-','SMS','SMS Pack','-','-','260','-','PCT','26','28 Days','-','-','RC_DEFAULT_TN','2018-12-14 06:14:09.129','-','PCT','-','Validity 28 Days','-','Y','250 SMS','-','-','-','-','-','-','Local & National','-','-','-','-','-','-','PCT','-','-','2018-12-01 06:12:57.951545',3,'B8','-','-','-','Y','INR','UkMyNl9TTVNfUEFDSw==','2018-12-13 07:35:00','RC_DEFAULT_TN_B8_26_TN','VTOPUP','RC26_SMS_PACK','3000','26','TN','PROD','TN_RC_DEFAULT_TN_82970448','IDEA_CELL','EACH','Item','PREPAID/VTOPUP','2018-12-18 01:36:26','2018-12-18 07:06:26'),(32774,'-','TN','36','-','AMT','Y','-','-','-','-','SMS Pack','-','1','PCT','18','90','-','SMS','SMS Pack','-','-','300','-','PCT','36','28 Days','-','-','RC_DEFAULT_TN','2018-12-14 06:14:10.941','-','PCT','-','Validity 28 Days','-','Y','350 SMS','-','-','-','-','-','-','Local & National','-','-','-','-','-','-','PCT','-','-','2018-12-01 06:12:59.360109',3,'SR','-','-','-','Y','INR','UkMzNl9TTVNfUEFDSw==','2018-12-13 07:35:00','RC_DEFAULT_TN_SR_36_TN','VTOPUP','RC36_SMS_PACK','3000','36','TN','PROD','TN_RC_DEFAULT_TN_28017921','IDEA_CELL','EACH','Item','PREPAID/VTOPUP','2018-12-18 01:36:32','2018-12-18 07:06:32'),(32776,'-','TN','46','-','AMT','Y','-','-','-','-','SMS Pack','-','1','PCT','18','90','-','SMS','SMS Pack','-','-','300','-','PCT','46','28 Days','-','-','RC_DEFAULT_TN','2018-12-14 06:14:12.308','-','PCT','-','Validity 28 Days','-','Y','450 SMS','-','-','-','-','-','-','Local & National','-','-','-','-','-','-','PCT','-','-','2018-12-01 06:13:00.492856',3,'SS','-','-','-','Y','INR','UkM0Nl9TTVNfUEFDSw==','2018-12-13 07:35:00','RC_DEFAULT_TN_SS_46_TN','VTOPUP','RC46_SMS_PACK','3000','46','TN','PROD','TN_RC_DEFAULT_TN_16369626','IDEA_CELL','EACH','Item','PREPAID/VTOPUP','2018-12-18 01:36:32','2018-12-18 07:06:32'),(32792,'120 LN SMS - 10 Days','WB','12','-','AMT','Y','-','-','-','10','SMS Pack','-','1','PCT','18','90','210','SMS','SMS','-','-','1017','-','PCT','12','10 Days','-','-','RC_DEFAULT_WB','2018-12-14 06:15:37.138','-','PCT','-','-','1','Y','120 LN SMS - 10 Days','-','-','-','-','-','-','Local & National SMS','-','-','-','-','N','-','PCT','-','-','2018-12-06 06:13:44.549482',12,'W094','-','-','-','Y','INR','MTIwIFNNUyBMb2MvTmF0IGZvciAyOCBkYXlz','2018-12-13 11:50:00','RC_DEFAULT_WB_W094_12_WB','VTOPUP','120 SMS Loc/Nat for 28 days','3000','12','WB','PROD','WB_RC_DEFAULT_WB_54119792','IDEA_CELL','EACH','Item','PREPAID/VTOPUP','2018-12-18 01:36:52','2018-12-18 07:06:52'),(32884,'120 LN SMS - 10 Days','WB','12','-','AMT','N','-','-','-','10','SMS Pack','-','-','PCT','18','90','210','SMS','SMS','-','-','1017','-','PCT','12','10 Days','-','-','RC_MBB_WB','2018-12-14 06:15:56.754','-','PCT','-','-','-','Y','120 LN SMS - 10 Days','-','-','-','-','-','-','Local & National SMS','-','-','-','-','N','-','PCT','-','-','2018-12-06 06:14:08.604817',12,'W094','-','-','-','Y','INR','MTIwIFNNUyBMb2MvTmF0IGZvciAyOCBkYXlz','2018-12-13 11:50:00','RC_MBB_WB_W094_12_WB','VTOPUP','120 SMS Loc/Nat for 28 days','2000','12','WB','PROD','WB_RC_MBB_WB_63529868','IDEA_CELL','EACH','Item','PREPAID/VTOPUP','2018-12-18 01:38:18','2018-12-18 07:08:18'),(32916,'120 LN SMS - 10 Days','WB','12','-','AMT','N','-','-','-','10','SMS Pack','-','-','PCT','18','90','210','SMS','SMS','-','-','1017','-','PCT','12','10 Days','-','-','RC_WB01_FRC56','2018-12-14 06:16:17.07','-','PCT','-','-','-','Y','120 LN SMS - 10 Days','-','-','-','-','-','-','Local & National SMS','-','-','-','-','N','-','PCT','-','-','2018-12-06 06:14:31.902454',12,'W094','-','-','-','Y','INR','MTIwIFNNUyBMb2MvTmF0IGZvciAyOCBkYXlz','2018-12-13 11:50:00','RC_WB01_FRC56_W094_12_WB','VTOPUP','120 SMS Loc/Nat for 28 days','2000','12','WB','PROD','WB_RC_WB01_FRC56_89182577','IDEA_CELL','EACH','Item','PREPAID/VTOPUP','2018-12-18 01:38:52','2018-12-18 07:08:52'),(32928,'120 LN SMS - 10 Days','WB','12','-','AMT','N','-','-','-','10','SMS Pack','-','-','PCT','18','90','210','SMS','SMS','-','-','1017','-','PCT','12','10 Days','-','-','RC_WB01_RET_SRC4','2018-12-14 06:16:37.063','-','PCT','-','-','-','Y','120 LN SMS - 10 Days','-','-','-','-','-','-','Local & National SMS','-','-','-','-','N','-','PCT','-','-','2018-12-06 06:14:54.757313',12,'W094','-','-','-','Y','INR','MTIwIFNNUyBMb2MvTmF0IGZvciAyOCBkYXlz','2018-12-13 11:50:00','RC_WB01_RET_SRC4_W094_12_WB','VTOPUP','120 SMS Loc/Nat for 28 days','2000','12','WB','PROD','WB_RC_WB01_RET_SRC4_6874224','IDEA_CELL','EACH','Item','PREPAID/VTOPUP','2018-12-18 01:39:03','2018-12-18 07:09:03');
/*!40000 ALTER TABLE `prepaid_pack` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-18 19:46:47
