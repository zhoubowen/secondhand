# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.20)
# Database: ask
# Generation Time: 2018-04-12 14:34:51 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table t_article
# ------------------------------------------------------------

DROP TABLE IF EXISTS `t_article`;

CREATE TABLE `t_article` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '''''' COMMENT '标题',
  `pic` varchar(128) DEFAULT '''''' COMMENT '主图',
  `content` text COMMENT '内容',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0:待审核，1审核通过，2已删除',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '0:供求，1:招商投资',
  `create_by` int(11) NOT NULL COMMENT '创建人',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='供求，招商信息';



# Dump of table t_ask
# ------------------------------------------------------------

DROP TABLE IF EXISTS `t_ask`;

CREATE TABLE `t_ask` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `create_by` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `concerns` int(11) DEFAULT '0' COMMENT '关注数',
  `descript` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '0：未解决，1已解决',
  `deleted` int(11) NOT NULL DEFAULT '0' COMMENT '0:未删除，1删除',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `t_ask` WRITE;
/*!40000 ALTER TABLE `t_ask` DISABLE KEYS */;

INSERT INTO `t_ask` (`id`, `create_by`, `title`, `concerns`, `descript`, `status`, `deleted`, `create_time`, `update_time`)
VALUES
	(1,81,'怎么记英语单词更有效？',4,'怎么记英语单词更有效？',1,0,'2018-04-01 10:09:06','2018-04-06 21:12:02'),
	(2,85,'一个高中数学基础的人怎样通过自学理解微积分？',1,'微积分的思想在小学中学都出现过?',1,0,'2018-04-05 01:19:05','2018-04-06 21:12:10'),
	(3,85,'微积分的思想在小学中学都出现过?',1,'微积分的思想在小学中学都出现过?',1,0,'2018-04-05 01:20:52','2018-04-06 21:12:09'),
	(4,86,'阿里斯顿；爱神的箭；阿斯蒂芬；电视机发',0,'阿什顿发是的',1,0,'2018-04-05 01:55:50','2018-04-06 23:12:22'),
	(5,86,'怎么提高物理学科知识？',0,'本人高二，求指点',1,0,'2018-04-05 01:55:50','2018-04-06 23:12:23'),
	(6,86,'怎么提高物理学科知识？',0,'本人高二，求指点',1,0,'2018-04-05 01:55:50','2018-04-06 23:12:24'),
	(7,86,'怎么提高物理学科知识？',0,'本人高二，求指点',1,0,'2018-04-05 01:55:50','2018-04-06 23:12:25'),
	(8,86,'怎么提高物理学科知识？',0,'本人高二，求指点',1,0,'2018-04-05 01:55:50','2018-04-06 23:12:26'),
	(9,86,'怎么提高物理学科知识？',0,'本人高二，求指点',1,0,'2018-04-05 01:55:50','2018-04-06 23:12:27'),
	(10,86,'怎么提高物理学科知识？',0,'本人高二，求指点',1,0,'2018-04-05 01:55:50','2018-04-06 23:12:27'),
	(11,86,'量子机器学习领域的研究者于东京大学工学系研究科',0,'越来越多的研究者认为量子物理和人工智能有深刻联系。我希望能这个系列 Live 里深入浅出地将「量子与智能」最精彩、最具启发性的几个视角呈现给更多感兴趣的人<br />',0,0,'2018-04-06 23:27:40','2018-04-06 23:30:13'),
	(12,86,'第10颗北斗导航卫星相对地面的8字形轨迹怎么解释？',1,'这种轨道可以适合于某些地方的监控。此外，三个这种轨道的卫星还可以组成星座，升交点赤经和平近点角各自相差120°，也有广泛应用',1,0,'2018-04-06 23:30:06','2018-04-06 23:38:11'),
	(13,86,'事实上，没有卫星的轨道是正圆，因此都会一定程度上形成8字形。',0,'我们从真近点角0开始分析这个卫星的运动：假设我们的轨道是50度的轨道倾角，同步轨道的Z轴角速度都是正的',1,0,'2018-04-06 23:31:01','2018-04-06 23:41:26');

/*!40000 ALTER TABLE `t_ask` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table t_comment
# ------------------------------------------------------------

DROP TABLE IF EXISTS `t_comment`;

CREATE TABLE `t_comment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT NULL COMMENT '会员ID',
  `article_id` int(11) DEFAULT NULL COMMENT '招商,供求信息ID',
  `content` varchar(255) DEFAULT NULL COMMENT '评论内容',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='投标信息';

LOCK TABLES `t_comment` WRITE;
/*!40000 ALTER TABLE `t_comment` DISABLE KEYS */;

INSERT INTO `t_comment` (`id`, `member_id`, `article_id`, `content`, `create_time`, `update_time`)
VALUES
	(1,87,1,'asdf','2018-04-04 20:30:09','2018-04-06 23:13:23'),
	(2,87,1,'adsfadsfl','2018-04-04 21:34:08','2018-04-06 23:13:24'),
	(3,87,3,'是的，没错。出现过！','2018-04-05 01:30:32','2018-04-06 23:13:25'),
	(4,87,2,'看书呗！','2018-04-05 01:54:58','2018-04-06 23:13:27'),
	(5,87,1,'每天都要背','2018-04-05 01:57:25','2018-04-05 01:57:25'),
	(6,87,2,'楼上没错','2018-04-05 01:58:03','2018-04-05 01:58:03'),
	(7,87,4,'多学多看','2018-04-05 01:58:39','2018-04-05 01:58:39'),
	(8,87,4,'我的回答','2018-04-06 23:03:07','2018-04-06 23:03:07'),
	(9,87,4,'我来回答你','2018-04-06 23:06:54','2018-04-06 23:06:54'),
	(10,87,4,'1','2018-04-06 23:07:30','2018-04-06 23:07:30'),
	(11,87,4,'阿斯蒂芬','2018-04-06 23:07:46','2018-04-06 23:07:46'),
	(12,87,4,'阿萨德','2018-04-06 23:08:56','2018-04-06 23:13:28'),
	(13,87,12,'很好，子物理学是研究组成世界的基本粒子，以及它们之间的相互作。','2018-04-06 23:38:07','2018-04-06 23:38:07'),
	(14,87,13,'哎哟，不错！很好。','2018-04-06 23:41:26','2018-04-06 23:41:26');

/*!40000 ALTER TABLE `t_comment` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table t_concerns
# ------------------------------------------------------------

DROP TABLE IF EXISTS `t_concerns`;

CREATE TABLE `t_concerns` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ask_id` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `t_concerns` WRITE;
/*!40000 ALTER TABLE `t_concerns` DISABLE KEYS */;

INSERT INTO `t_concerns` (`id`, `ask_id`, `member_id`)
VALUES
	(1,1,84),
	(2,1,84),
	(3,1,84),
	(4,1,84),
	(5,3,84),
	(6,1,86),
	(7,2,84),
	(8,4,87),
	(9,12,86);

/*!40000 ALTER TABLE `t_concerns` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table t_member
# ------------------------------------------------------------

DROP TABLE IF EXISTS `t_member`;

CREATE TABLE `t_member` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `account` varchar(16) NOT NULL DEFAULT '''''' COMMENT '账号',
  `password` varchar(32) NOT NULL DEFAULT '''''' COMMENT '密码',
  `role_type` int(11) DEFAULT '2' COMMENT '0：管理员，1教师，2学生',
  `email` varchar(32) NOT NULL DEFAULT '''''' COMMENT '邮箱',
  `name` varchar(16) NOT NULL DEFAULT '''''' COMMENT '姓名',
  `join_schedue` int(11) DEFAULT '1' COMMENT '是否参与排班，0否，1是',
  `phone` bigint(12) DEFAULT '0' COMMENT '手机号码',
  `company` varchar(32) DEFAULT '''''' COMMENT '所属公司',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '0：删除，1正常',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='账户信息';

LOCK TABLES `t_member` WRITE;
/*!40000 ALTER TABLE `t_member` DISABLE KEYS */;

INSERT INTO `t_member` (`id`, `account`, `password`, `role_type`, `email`, `name`, `join_schedue`, `phone`, `company`, `status`, `create_time`, `update_time`)
VALUES
	(1,'admin','4QrcOUm6Wau+VuBX8g+IPg==',0,'admin@gmail.com','系统管理员',0,12345678911,'腾讯科技',1,'2018-03-12 22:58:04','2018-03-30 18:52:06'),
	(81,'lisi','4QrcOUm6Wau+VuBX8g+IPg==',1,'lisi@gmail.com','李四老师',0,12345678911,'腾讯科技',2,'2018-03-12 22:58:04','2018-04-04 23:58:35'),
	(82,'wangmazi','f6goKtkwR6TW/mERyTswig==',2,'m-chou@foxmail.com','王麻子学生',NULL,15906693578,NULL,1,'2018-03-31 11:32:36','2018-04-04 23:59:01'),
	(83,'liangjingru','f6goKtkwR6TW/mERyTswig==',1,'m-chou@foxmail.com','梁静茹老师',NULL,15906693578,NULL,1,'2018-03-31 11:33:08','2018-04-04 23:58:55'),
	(84,'zhangsan','lueSGJZetyySpUndWjMBEg==',1,'m-chou@foxmail.com','张三老师',NULL,15906693570,NULL,1,'2018-04-04 20:18:49','2018-04-04 23:58:43'),
	(85,'zhaoliu','lueSGJZetyySpUndWjMBEg==',2,'m-chou@foxmail.com','赵六',NULL,15906693578,NULL,1,'2018-04-05 00:31:53',NULL),
	(86,'lieruge','lueSGJZetyySpUndWjMBEg==',2,'m-chou@foxmail.com','烈如歌',NULL,15906693570,NULL,1,'2018-04-05 01:54:27','2018-04-05 01:55:10'),
	(87,'liemingjing','lueSGJZetyySpUndWjMBEg==',1,'abc@gmail.com','列明镜',NULL,15906693578,NULL,1,'2018-04-05 01:56:55','2018-04-05 01:58:14'),
	(88,'zhangsangfeng','f6goKtkwR6TW/mERyTswig==',1,'m-chou@foxmail.com','张三丰',NULL,15906693578,NULL,1,'2018-04-05 02:01:11',NULL),
	(89,'xiaoming','f6goKtkwR6TW/mERyTswig==',2,'m-chou@foxmail.com','黄晓明',NULL,15906693578,NULL,1,'2018-04-05 02:01:29',NULL);

/*!40000 ALTER TABLE `t_member` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table t_setting
# ------------------------------------------------------------

DROP TABLE IF EXISTS `t_setting`;

CREATE TABLE `t_setting` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `s_key` varchar(64) NOT NULL DEFAULT '',
  `s_value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `t_setting` WRITE;
/*!40000 ALTER TABLE `t_setting` DISABLE KEYS */;

INSERT INTO `t_setting` (`id`, `s_key`, `s_value`)
VALUES
	(1,'ASK_THRESHOLD','5');

/*!40000 ALTER TABLE `t_setting` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table t_video
# ------------------------------------------------------------

DROP TABLE IF EXISTS `t_video`;

CREATE TABLE `t_video` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `descript` varchar(255) DEFAULT NULL COMMENT '描述',
  `url` varchar(64) DEFAULT NULL COMMENT '视频地址',
  `create_by` int(11) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='教学视频';

LOCK TABLES `t_video` WRITE;
/*!40000 ALTER TABLE `t_video` DISABLE KEYS */;

INSERT INTO `t_video` (`id`, `title`, `descript`, `url`, `create_by`, `create_time`, `update_time`)
VALUES
	(3,'测试无量实验','测试无量实验测试无量实验','/uploads/test-video.mov',NULL,'2018-04-05 02:00:23',NULL),
	(7,'测试无量实验','测试无量实验测试无量实验','/uploads/test-video.mov',NULL,'2018-04-05 02:00:23',NULL),
	(8,'测试无量实验','测试无量实验测试无量实验','/uploads/test-video.mov',NULL,'2018-04-05 02:00:23',NULL),
	(9,'微积分基础视频，拿走不谢','微积分基础视频','/uploads/test-video.mov',NULL,'2018-04-06 22:35:38','2018-04-06 22:39:17');

/*!40000 ALTER TABLE `t_video` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
