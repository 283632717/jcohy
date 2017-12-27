/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50637
Source Host           : localhost:3306
Source Database       : jcohy

Target Server Type    : MYSQL
Target Server Version : 50637
File Encoding         : 65001

Date: 2017-12-27 17:15:24
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for blog
-- ----------------------------
DROP TABLE IF EXISTS `blog`;
CREATE TABLE `blog` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` longtext,
  `featured` int(11) DEFAULT NULL,
  `privacy` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `summary` varchar(500) DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `views` int(11) NOT NULL DEFAULT '0',
  `author_id` bigint(20) DEFAULT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  `create_date` timestamp NULL DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FKkrg0cqj6o7b7lvqkn1gjuwjuo` (`author_id`),
  KEY `FKqyvjif1i2geaeuvkh3n1jrnn4` (`category_id`),
  CONSTRAINT `FKkrg0cqj6o7b7lvqkn1gjuwjuo` FOREIGN KEY (`author_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKqyvjif1i2geaeuvkh3n1jrnn4` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog
-- ----------------------------

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `count` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '2017-12-21 13:28:35', '2017-12-26 09:03:09', '0', '转载', '0');
INSERT INTO `category` VALUES ('2', '2017-12-21 13:28:40', '2017-12-26 09:15:46', '0', '原创', '0');
INSERT INTO `category` VALUES ('3', '2017-12-26 09:19:49', '2017-12-26 09:19:49', '0', '其他', '0');

-- ----------------------------
-- Table structure for link
-- ----------------------------
DROP TABLE IF EXISTS `link`;
CREATE TABLE `link` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `url` varchar(500) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL COMMENT '站长邮箱',
  `description` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `create_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of link
-- ----------------------------
INSERT INTO `link` VALUES ('1', '百度', 'http://www.baidu.com', 'hhh@qq.com', '百度首页', '0', '2017-12-27 09:19:24', '2017-12-27 13:06:51');
INSERT INTO `link` VALUES ('2', 'layui', 'http://www.layui.com/', 'xian@qq.com', '经典模块化前端UI框架', '0', '2017-12-27 09:56:37', '2017-12-27 10:33:28');

-- ----------------------------
-- Table structure for login_log
-- ----------------------------
DROP TABLE IF EXISTS `login_log`;
CREATE TABLE `login_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ip` varchar(255) DEFAULT NULL,
  `login_at` datetime DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `create_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FKa9ca70emkdxbpw4u0voihgers` (`user_id`),
  CONSTRAINT `FKa9ca70emkdxbpw4u0voihgers` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of login_log
-- ----------------------------
INSERT INTO `login_log` VALUES ('1', '0:0:0:0:0:0:0:1', '2017-12-19 08:51:12', '1', null, null);
INSERT INTO `login_log` VALUES ('2', '0:0:0:0:0:0:0:1', '2017-12-19 08:58:30', '1', null, null);
INSERT INTO `login_log` VALUES ('3', '0:0:0:0:0:0:0:1', '2017-12-19 08:58:30', '1', null, null);
INSERT INTO `login_log` VALUES ('4', '0:0:0:0:0:0:0:1', '2017-12-19 09:50:02', '1', null, null);
INSERT INTO `login_log` VALUES ('5', '0:0:0:0:0:0:0:1', '2017-12-19 10:18:23', '1', null, null);
INSERT INTO `login_log` VALUES ('6', '0:0:0:0:0:0:0:1', '2017-12-20 17:48:20', '1', null, null);
INSERT INTO `login_log` VALUES ('7', '0:0:0:0:0:0:0:1', '2017-12-20 18:02:32', '1', null, null);
INSERT INTO `login_log` VALUES ('8', '0:0:0:0:0:0:0:1', '2017-12-20 18:03:51', '1', null, null);
INSERT INTO `login_log` VALUES ('9', '0:0:0:0:0:0:0:1', '2017-12-20 18:04:28', '1', null, null);
INSERT INTO `login_log` VALUES ('10', '0:0:0:0:0:0:0:1', '2017-12-20 18:04:35', '1', null, null);
INSERT INTO `login_log` VALUES ('11', '0:0:0:0:0:0:0:1', '2017-12-20 18:10:57', '1', null, null);
INSERT INTO `login_log` VALUES ('12', '0:0:0:0:0:0:0:1', '2017-12-20 18:12:37', '1', null, null);
INSERT INTO `login_log` VALUES ('13', '0:0:0:0:0:0:0:1', '2017-12-20 18:18:36', '1', null, null);
INSERT INTO `login_log` VALUES ('14', '0:0:0:0:0:0:0:1', '2017-12-20 18:19:01', '1', null, null);
INSERT INTO `login_log` VALUES ('15', '0:0:0:0:0:0:0:1', '2017-12-20 18:19:52', '1', null, null);
INSERT INTO `login_log` VALUES ('16', '0:0:0:0:0:0:0:1', '2017-12-20 18:31:46', '1', null, null);
INSERT INTO `login_log` VALUES ('17', '0:0:0:0:0:0:0:1', '2017-12-21 08:43:08', '1', null, null);
INSERT INTO `login_log` VALUES ('18', '0:0:0:0:0:0:0:1', '2017-12-21 08:46:50', '1', null, null);
INSERT INTO `login_log` VALUES ('19', '0:0:0:0:0:0:0:1', '2017-12-21 08:47:53', '1', null, null);
INSERT INTO `login_log` VALUES ('20', '127.0.0.1', '2017-12-21 08:53:37', '1', null, null);
INSERT INTO `login_log` VALUES ('21', '127.0.0.1', '2017-12-21 08:54:51', '1', null, null);
INSERT INTO `login_log` VALUES ('22', '0:0:0:0:0:0:0:1', '2017-12-21 08:56:04', '1', null, null);
INSERT INTO `login_log` VALUES ('23', '0:0:0:0:0:0:0:1', '2017-12-21 08:59:00', '1', null, null);
INSERT INTO `login_log` VALUES ('24', '0:0:0:0:0:0:0:1', '2017-12-21 09:07:58', '1', null, null);
INSERT INTO `login_log` VALUES ('25', '0:0:0:0:0:0:0:1', '2017-12-21 09:09:17', '1', null, null);
INSERT INTO `login_log` VALUES ('26', '0:0:0:0:0:0:0:1', '2017-12-21 09:10:01', '1', null, null);
INSERT INTO `login_log` VALUES ('27', '127.0.0.1', '2017-12-21 09:12:06', '1', null, null);
INSERT INTO `login_log` VALUES ('28', '0:0:0:0:0:0:0:1', '2017-12-21 09:14:54', '1', null, null);
INSERT INTO `login_log` VALUES ('29', '0:0:0:0:0:0:0:1', '2017-12-21 09:19:06', '1', null, null);
INSERT INTO `login_log` VALUES ('30', '0:0:0:0:0:0:0:1', '2017-12-21 09:19:43', '1', null, null);
INSERT INTO `login_log` VALUES ('31', '0:0:0:0:0:0:0:1', '2017-12-21 09:21:09', '1', null, null);
INSERT INTO `login_log` VALUES ('32', '0:0:0:0:0:0:0:1', '2017-12-21 09:22:49', '1', null, null);
INSERT INTO `login_log` VALUES ('33', '127.0.0.1', '2017-12-21 09:41:44', '1', null, null);
INSERT INTO `login_log` VALUES ('34', '127.0.0.1', '2017-12-21 09:43:24', '1', null, null);
INSERT INTO `login_log` VALUES ('35', '0:0:0:0:0:0:0:1', '2017-12-21 09:45:43', '1', '2017-12-21 10:40:52', '2017-12-21 10:41:26');
INSERT INTO `login_log` VALUES ('36', '0:0:0:0:0:0:0:1', '2017-12-21 10:45:14', '1', null, null);
INSERT INTO `login_log` VALUES ('37', '0:0:0:0:0:0:0:1', '2017-12-21 11:14:55', '1', null, null);
INSERT INTO `login_log` VALUES ('38', '0:0:0:0:0:0:0:1', '2017-12-21 11:17:19', '1', null, null);
INSERT INTO `login_log` VALUES ('39', '0:0:0:0:0:0:0:1', '2017-12-21 11:18:48', '1', null, null);
INSERT INTO `login_log` VALUES ('40', '127.0.0.1', '2017-12-21 11:19:57', '1', null, null);
INSERT INTO `login_log` VALUES ('41', '0:0:0:0:0:0:0:1', '2017-12-21 11:28:44', '1', null, null);
INSERT INTO `login_log` VALUES ('42', '0:0:0:0:0:0:0:1', '2017-12-21 11:35:12', '1', null, null);
INSERT INTO `login_log` VALUES ('43', '0:0:0:0:0:0:0:1', '2017-12-21 11:38:32', '1', null, null);
INSERT INTO `login_log` VALUES ('44', '0:0:0:0:0:0:0:1', '2017-12-21 11:40:08', '1', null, null);
INSERT INTO `login_log` VALUES ('45', '0:0:0:0:0:0:0:1', '2017-12-21 11:42:27', '1', null, null);
INSERT INTO `login_log` VALUES ('46', '127.0.0.1', '2017-12-21 11:46:18', '1', null, null);
INSERT INTO `login_log` VALUES ('47', '0:0:0:0:0:0:0:1', '2017-12-21 11:48:30', '1', null, null);
INSERT INTO `login_log` VALUES ('48', '0:0:0:0:0:0:0:1', '2017-12-21 11:52:33', '1', null, null);
INSERT INTO `login_log` VALUES ('49', '0:0:0:0:0:0:0:1', '2017-12-21 12:03:19', '1', null, null);
INSERT INTO `login_log` VALUES ('50', '0:0:0:0:0:0:0:1', '2017-12-21 12:08:49', '1', null, null);
INSERT INTO `login_log` VALUES ('51', '0:0:0:0:0:0:0:1', '2017-12-21 12:11:23', '1', null, null);
INSERT INTO `login_log` VALUES ('52', '0:0:0:0:0:0:0:1', '2017-12-21 12:13:31', '1', null, null);
INSERT INTO `login_log` VALUES ('53', '0:0:0:0:0:0:0:1', '2017-12-21 12:14:44', '1', null, null);
INSERT INTO `login_log` VALUES ('54', '0:0:0:0:0:0:0:1', '2017-12-21 13:07:44', '1', null, null);
INSERT INTO `login_log` VALUES ('55', '0:0:0:0:0:0:0:1', '2017-12-21 13:10:16', '1', null, null);
INSERT INTO `login_log` VALUES ('56', '0:0:0:0:0:0:0:1', '2017-12-21 13:20:45', '1', null, null);
INSERT INTO `login_log` VALUES ('57', '0:0:0:0:0:0:0:1', '2017-12-21 13:23:55', '1', null, null);
INSERT INTO `login_log` VALUES ('58', '0:0:0:0:0:0:0:1', '2017-12-21 13:25:06', '1', null, null);
INSERT INTO `login_log` VALUES ('59', '0:0:0:0:0:0:0:1', '2017-12-21 13:28:09', '1', null, null);
INSERT INTO `login_log` VALUES ('60', '0:0:0:0:0:0:0:1', '2017-12-21 13:45:37', '1', null, null);
INSERT INTO `login_log` VALUES ('61', '0:0:0:0:0:0:0:1', '2017-12-21 13:49:05', '1', null, null);
INSERT INTO `login_log` VALUES ('62', '0:0:0:0:0:0:0:1', '2017-12-21 13:52:18', '1', null, null);
INSERT INTO `login_log` VALUES ('63', '0:0:0:0:0:0:0:1', '2017-12-21 13:55:33', '1', null, null);
INSERT INTO `login_log` VALUES ('64', '0:0:0:0:0:0:0:1', '2017-12-21 13:57:56', '1', null, null);
INSERT INTO `login_log` VALUES ('65', '0:0:0:0:0:0:0:1', '2017-12-21 13:59:58', '1', null, null);
INSERT INTO `login_log` VALUES ('66', '0:0:0:0:0:0:0:1', '2017-12-21 14:01:42', '1', null, null);
INSERT INTO `login_log` VALUES ('67', '0:0:0:0:0:0:0:1', '2017-12-21 14:06:40', '1', null, null);
INSERT INTO `login_log` VALUES ('68', '0:0:0:0:0:0:0:1', '2017-12-21 14:24:03', '1', null, null);
INSERT INTO `login_log` VALUES ('69', '0:0:0:0:0:0:0:1', '2017-12-21 14:25:07', '1', null, null);
INSERT INTO `login_log` VALUES ('70', '0:0:0:0:0:0:0:1', '2017-12-21 14:51:16', '1', null, null);
INSERT INTO `login_log` VALUES ('71', '0:0:0:0:0:0:0:1', '2017-12-21 14:52:25', '1', null, null);
INSERT INTO `login_log` VALUES ('72', '0:0:0:0:0:0:0:1', '2017-12-21 14:53:28', '1', null, null);
INSERT INTO `login_log` VALUES ('73', '0:0:0:0:0:0:0:1', '2017-12-21 14:54:42', '1', null, null);
INSERT INTO `login_log` VALUES ('74', '0:0:0:0:0:0:0:1', '2017-12-21 14:56:29', '1', null, null);
INSERT INTO `login_log` VALUES ('75', '0:0:0:0:0:0:0:1', '2017-12-21 14:57:55', '1', null, null);
INSERT INTO `login_log` VALUES ('76', '0:0:0:0:0:0:0:1', '2017-12-21 15:03:33', '1', null, null);
INSERT INTO `login_log` VALUES ('77', '0:0:0:0:0:0:0:1', '2017-12-21 15:05:12', '1', null, null);
INSERT INTO `login_log` VALUES ('78', '127.0.0.1', '2017-12-21 15:06:42', '1', null, null);
INSERT INTO `login_log` VALUES ('79', '0:0:0:0:0:0:0:1', '2017-12-21 15:13:43', '1', null, null);
INSERT INTO `login_log` VALUES ('80', '0:0:0:0:0:0:0:1', '2017-12-21 15:14:55', '1', null, null);
INSERT INTO `login_log` VALUES ('81', '0:0:0:0:0:0:0:1', '2017-12-21 15:21:13', '1', null, null);
INSERT INTO `login_log` VALUES ('82', '0:0:0:0:0:0:0:1', '2017-12-21 15:23:36', '1', null, null);
INSERT INTO `login_log` VALUES ('83', '0:0:0:0:0:0:0:1', '2017-12-21 15:30:21', '1', null, null);
INSERT INTO `login_log` VALUES ('84', '0:0:0:0:0:0:0:1', '2017-12-21 16:01:13', '1', null, null);
INSERT INTO `login_log` VALUES ('85', '0:0:0:0:0:0:0:1', '2017-12-21 16:09:49', '1', null, null);
INSERT INTO `login_log` VALUES ('86', '0:0:0:0:0:0:0:1', '2017-12-21 16:12:33', '1', null, null);
INSERT INTO `login_log` VALUES ('87', '127.0.0.1', '2017-12-21 16:17:51', '1', null, null);
INSERT INTO `login_log` VALUES ('88', '0:0:0:0:0:0:0:1', '2017-12-21 16:19:41', '1', null, null);
INSERT INTO `login_log` VALUES ('89', '0:0:0:0:0:0:0:1', '2017-12-21 16:24:12', '1', null, null);
INSERT INTO `login_log` VALUES ('90', '0:0:0:0:0:0:0:1', '2017-12-21 16:32:11', '1', null, null);
INSERT INTO `login_log` VALUES ('91', '0:0:0:0:0:0:0:1', '2017-12-21 16:33:34', '1', null, null);
INSERT INTO `login_log` VALUES ('92', '0:0:0:0:0:0:0:1', '2017-12-21 16:34:26', '1', null, null);
INSERT INTO `login_log` VALUES ('93', '0:0:0:0:0:0:0:1', '2017-12-21 16:37:53', '1', null, null);
INSERT INTO `login_log` VALUES ('94', '0:0:0:0:0:0:0:1', '2017-12-21 16:40:15', '1', null, null);
INSERT INTO `login_log` VALUES ('95', '0:0:0:0:0:0:0:1', '2017-12-21 17:06:04', '1', null, null);
INSERT INTO `login_log` VALUES ('96', '0:0:0:0:0:0:0:1', '2017-12-21 17:06:37', '1', null, null);
INSERT INTO `login_log` VALUES ('97', '0:0:0:0:0:0:0:1', '2017-12-21 17:08:00', '1', null, null);
INSERT INTO `login_log` VALUES ('98', '0:0:0:0:0:0:0:1', '2017-12-21 17:16:45', '1', null, null);
INSERT INTO `login_log` VALUES ('99', '0:0:0:0:0:0:0:1', '2017-12-21 17:19:37', '1', null, null);
INSERT INTO `login_log` VALUES ('100', '0:0:0:0:0:0:0:1', '2017-12-21 17:23:21', '1', null, null);
INSERT INTO `login_log` VALUES ('101', '0:0:0:0:0:0:0:1', '2017-12-21 17:30:00', '1', null, null);
INSERT INTO `login_log` VALUES ('102', '0:0:0:0:0:0:0:1', '2017-12-21 17:39:16', '1', null, null);
INSERT INTO `login_log` VALUES ('103', '0:0:0:0:0:0:0:1', '2017-12-21 17:40:47', '1', null, null);
INSERT INTO `login_log` VALUES ('104', '0:0:0:0:0:0:0:1', '2017-12-21 17:43:17', '1', null, null);
INSERT INTO `login_log` VALUES ('105', '0:0:0:0:0:0:0:1', '2017-12-21 17:46:18', '1', null, null);
INSERT INTO `login_log` VALUES ('106', '0:0:0:0:0:0:0:1', '2017-12-21 17:53:34', '1', null, null);
INSERT INTO `login_log` VALUES ('107', '0:0:0:0:0:0:0:1', '2017-12-22 14:35:12', '1', null, null);
INSERT INTO `login_log` VALUES ('108', '0:0:0:0:0:0:0:1', '2017-12-25 11:32:16', '1', null, null);
INSERT INTO `login_log` VALUES ('109', '0:0:0:0:0:0:0:1', '2017-12-25 11:38:59', '1', null, null);
INSERT INTO `login_log` VALUES ('110', '0:0:0:0:0:0:0:1', '2017-12-25 11:41:24', '1', null, null);
INSERT INTO `login_log` VALUES ('111', '0:0:0:0:0:0:0:1', '2017-12-25 11:42:40', '1', null, null);
INSERT INTO `login_log` VALUES ('112', '0:0:0:0:0:0:0:1', '2017-12-25 11:50:06', '1', null, null);
INSERT INTO `login_log` VALUES ('113', '0:0:0:0:0:0:0:1', '2017-12-25 11:50:44', '1', null, null);
INSERT INTO `login_log` VALUES ('114', '0:0:0:0:0:0:0:1', '2017-12-25 11:53:37', '1', null, null);
INSERT INTO `login_log` VALUES ('115', '0:0:0:0:0:0:0:1', '2017-12-25 15:56:14', '1', null, null);
INSERT INTO `login_log` VALUES ('116', '0:0:0:0:0:0:0:1', '2017-12-25 16:19:11', '1', null, null);
INSERT INTO `login_log` VALUES ('117', '0:0:0:0:0:0:0:1', '2017-12-25 16:31:11', '1', null, null);
INSERT INTO `login_log` VALUES ('118', '0:0:0:0:0:0:0:1', '2017-12-25 16:32:45', '1', null, null);
INSERT INTO `login_log` VALUES ('119', '0:0:0:0:0:0:0:1', '2017-12-25 16:34:37', '1', null, null);
INSERT INTO `login_log` VALUES ('120', '0:0:0:0:0:0:0:1', '2017-12-25 16:36:20', '1', null, null);
INSERT INTO `login_log` VALUES ('121', '0:0:0:0:0:0:0:1', '2017-12-25 16:42:11', '1', null, null);
INSERT INTO `login_log` VALUES ('122', '0:0:0:0:0:0:0:1', '2017-12-25 16:55:48', '1', null, null);
INSERT INTO `login_log` VALUES ('123', '0:0:0:0:0:0:0:1', '2017-12-25 16:56:56', '1', null, null);
INSERT INTO `login_log` VALUES ('124', '0:0:0:0:0:0:0:1', '2017-12-25 17:00:04', '1', null, null);
INSERT INTO `login_log` VALUES ('125', '0:0:0:0:0:0:0:1', '2017-12-25 17:23:17', '1', null, null);
INSERT INTO `login_log` VALUES ('126', '0:0:0:0:0:0:0:1', '2017-12-26 08:29:48', '1', null, null);
INSERT INTO `login_log` VALUES ('127', '0:0:0:0:0:0:0:1', '2017-12-26 08:37:29', '1', null, null);
INSERT INTO `login_log` VALUES ('128', '0:0:0:0:0:0:0:1', '2017-12-26 08:45:54', '1', null, null);
INSERT INTO `login_log` VALUES ('129', '0:0:0:0:0:0:0:1', '2017-12-26 08:48:49', '1', null, null);
INSERT INTO `login_log` VALUES ('130', '0:0:0:0:0:0:0:1', '2017-12-26 09:00:12', '1', null, null);
INSERT INTO `login_log` VALUES ('131', '0:0:0:0:0:0:0:1', '2017-12-26 09:02:40', '1', null, null);
INSERT INTO `login_log` VALUES ('132', '0:0:0:0:0:0:0:1', '2017-12-26 09:04:25', '1', null, null);
INSERT INTO `login_log` VALUES ('133', '0:0:0:0:0:0:0:1', '2017-12-26 09:07:22', '1', null, null);
INSERT INTO `login_log` VALUES ('134', '0:0:0:0:0:0:0:1', '2017-12-26 09:15:19', '1', null, null);
INSERT INTO `login_log` VALUES ('135', '0:0:0:0:0:0:0:1', '2017-12-26 09:17:05', '1', null, null);
INSERT INTO `login_log` VALUES ('136', '0:0:0:0:0:0:0:1', '2017-12-26 09:18:37', '1', null, null);
INSERT INTO `login_log` VALUES ('137', '0:0:0:0:0:0:0:1', '2017-12-26 09:28:20', '1', null, null);
INSERT INTO `login_log` VALUES ('138', '0:0:0:0:0:0:0:1', '2017-12-26 09:31:12', '1', null, null);
INSERT INTO `login_log` VALUES ('139', '0:0:0:0:0:0:0:1', '2017-12-26 09:33:00', '1', null, null);
INSERT INTO `login_log` VALUES ('140', '0:0:0:0:0:0:0:1', '2017-12-26 09:46:42', '1', null, null);
INSERT INTO `login_log` VALUES ('141', '0:0:0:0:0:0:0:1', '2017-12-26 09:56:43', '1', null, null);
INSERT INTO `login_log` VALUES ('142', '0:0:0:0:0:0:0:1', '2017-12-26 10:12:05', '1', null, null);
INSERT INTO `login_log` VALUES ('143', '0:0:0:0:0:0:0:1', '2017-12-26 10:18:32', '1', null, null);
INSERT INTO `login_log` VALUES ('144', '0:0:0:0:0:0:0:1', '2017-12-26 10:20:51', '1', null, null);
INSERT INTO `login_log` VALUES ('145', '0:0:0:0:0:0:0:1', '2017-12-26 10:30:38', '1', null, null);
INSERT INTO `login_log` VALUES ('146', '0:0:0:0:0:0:0:1', '2017-12-27 09:18:44', '1', null, null);
INSERT INTO `login_log` VALUES ('147', '0:0:0:0:0:0:0:1', '2017-12-27 10:11:37', '1', null, null);
INSERT INTO `login_log` VALUES ('148', '0:0:0:0:0:0:0:1', '2017-12-27 10:13:23', '1', null, null);
INSERT INTO `login_log` VALUES ('149', '0:0:0:0:0:0:0:1', '2017-12-27 10:15:26', '1', null, null);
INSERT INTO `login_log` VALUES ('150', '0:0:0:0:0:0:0:1', '2017-12-27 10:30:49', '1', null, null);
INSERT INTO `login_log` VALUES ('151', '0:0:0:0:0:0:0:1', '2017-12-27 10:32:09', '1', null, null);
INSERT INTO `login_log` VALUES ('152', '0:0:0:0:0:0:0:1', '2017-12-27 11:04:45', '1', null, null);
INSERT INTO `login_log` VALUES ('153', '0:0:0:0:0:0:0:1', '2017-12-27 11:06:06', '1', null, null);
INSERT INTO `login_log` VALUES ('154', '0:0:0:0:0:0:0:1', '2017-12-27 11:24:54', '1', null, null);
INSERT INTO `login_log` VALUES ('155', '0:0:0:0:0:0:0:1', '2017-12-27 11:33:33', '1', null, null);
INSERT INTO `login_log` VALUES ('156', '0:0:0:0:0:0:0:1', '2017-12-27 11:59:22', '1', null, null);
INSERT INTO `login_log` VALUES ('157', '0:0:0:0:0:0:0:1', '2017-12-27 12:09:55', '1', null, null);
INSERT INTO `login_log` VALUES ('158', '192.168.21.132', '2017-12-27 15:27:56', '1', null, null);

-- ----------------------------
-- Table structure for options
-- ----------------------------
DROP TABLE IF EXISTS `options`;
CREATE TABLE `options` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `option_key` varchar(255) DEFAULT NULL,
  `option_value` varchar(255) DEFAULT NULL,
  `create_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of options
-- ----------------------------

-- ----------------------------
-- Table structure for session
-- ----------------------------
DROP TABLE IF EXISTS `session`;
CREATE TABLE `session` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `expire_at` bigint(20) DEFAULT NULL,
  `session_id` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `create_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK1bi1pmqjgipw7dx3j6bl37dja` (`user_id`),
  CONSTRAINT `FK1bi1pmqjgipw7dx3j6bl37dja` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of session
-- ----------------------------
INSERT INTO `session` VALUES ('1', '1513644731484', 'cd201c0f153f4b3db1da1804548450b9', '1', null, null);
INSERT INTO `session` VALUES ('2', '1513645169501', '2b7e6412fbde4175bb6fcf71ddeb5060', '1', null, null);
INSERT INTO `session` VALUES ('3', '1513645169496', 'b9cbefd66d0e4c41a097bdb33e483265', '1', null, null);
INSERT INTO `session` VALUES ('4', '12122', 'ab805cdf41d747e985ba93ea2e463c89', '1', '2017-12-19 10:21:11', '2017-12-19 10:21:11');
INSERT INTO `session` VALUES ('5', '212121', 'bb442f16e764424ba2660955a501e130', '1', '2017-12-19 10:21:09', '2017-12-19 10:21:09');
INSERT INTO `session` VALUES ('6', '1513763360250', '6842568867ce4ce0b76a23cceabea0f0', '1', null, null);
INSERT INTO `session` VALUES ('7', '1513764211949', '1f747ab1f34847aca290602014d0e6f4', '1', null, null);
INSERT INTO `session` VALUES ('8', '1513764290623', '50832620369642778b5471c0ea6367c9', '1', null, null);
INSERT INTO `session` VALUES ('9', '1513764327320', '722c6033c03c4afdbae4930e37080cfa', '1', null, null);
INSERT INTO `session` VALUES ('10', '1513764335377', 'f3e5bab65202414a8edccc48b0a72839', '1', null, null);
INSERT INTO `session` VALUES ('11', '1513764716850', '31c6b2db98d54791a9cc80b4d89491ab', '1', null, null);
INSERT INTO `session` VALUES ('12', '1513764816829', 'f6a1754729e84387b90863fb2ad64d0f', '1', null, null);
INSERT INTO `session` VALUES ('13', '1513765176127', '66b436560a724cac960ec44a2828d34c', '1', null, null);
INSERT INTO `session` VALUES ('14', '1513765201135', '998f19cfaaab4c90b2f3cedd32951683', '1', null, null);
INSERT INTO `session` VALUES ('15', '1513765252206', 'fd28386031c344f3898d7ee51760f245', '1', null, null);
INSERT INTO `session` VALUES ('16', '1513765965627', 'b3f9efbd9e7246d8a31e9de362ccd62c', '1', null, null);
INSERT INTO `session` VALUES ('17', '1513817048108', 'a84db82caac84ab0a88919445283b7ae', '1', null, null);
INSERT INTO `session` VALUES ('18', '1513817269746', '3da308014fa7479e89fcb81513ecfb00', '1', null, null);
INSERT INTO `session` VALUES ('19', '1513817333091', '0f01312c94384f619a3a097dc41f8ab6', '1', null, null);
INSERT INTO `session` VALUES ('20', '1513817676284', '3106a1eddd3447e8ae8f8945c8fc2a91', '1', null, null);
INSERT INTO `session` VALUES ('21', '1513817751036', '10c29d0389d1463b87ed7316b7460a51', '1', null, null);
INSERT INTO `session` VALUES ('22', '1513817824215', '80f18b6d20ee45bc89fcffd47342b1ea', '1', null, null);
INSERT INTO `session` VALUES ('23', '1513817999877', 'b717842bce184464aaf07c716161e13c', '1', null, null);
INSERT INTO `session` VALUES ('24', '1513818538327', 'c6a62238a80247d6bf6af7bcfbe44e30', '1', null, null);
INSERT INTO `session` VALUES ('25', '1513818617442', 'c4021690f0534471b67927a4031db771', '1', null, null);
INSERT INTO `session` VALUES ('26', '1513818661263', 'f6008a89b954401b8ba03a3f48e3ae91', '1', null, null);
INSERT INTO `session` VALUES ('27', '1513818786407', '336750427874498288d418dbf48fae60', '1', null, null);
INSERT INTO `session` VALUES ('28', '1513818953705', 'ffba2a6149cd474fac16dc9b43cd70bc', '1', null, null);
INSERT INTO `session` VALUES ('29', '1513819205649', 'a8fea1fac57d490280161efe492c97ba', '1', null, null);
INSERT INTO `session` VALUES ('30', '1513819242956', '41e74f1fc0074440a856c4cf72d959dc', '1', null, null);
INSERT INTO `session` VALUES ('31', '1513819328541', 'f9646f3bb6b041178a952fc8ef372145', '1', null, null);
INSERT INTO `session` VALUES ('32', '1513819429328', 'c6875e6adcdc43e0a9c89a635025ab46', '1', null, null);
INSERT INTO `session` VALUES ('33', '1513820563502', '4e440bb1902e45fd8c48238d34924873', '1', null, null);
INSERT INTO `session` VALUES ('34', '1513820663805', 'bd3aa40721604b22aa4acbb78d0ee43f', '1', null, null);
INSERT INTO `session` VALUES ('35', '1513820803298', 'af7c5ec804454383bf5629d47f1fe370', '1', null, null);
INSERT INTO `session` VALUES ('36', '1513824374285', '011f5f70e8e8443c9f64d4fdbbf68b88', '1', null, null);
INSERT INTO `session` VALUES ('37', '1513826155116', '71ab53bc133a4613b8afeacda84af784', '1', null, null);
INSERT INTO `session` VALUES ('38', '1513826298662', '8b250d2cfb884c4296e2aef63941a35e', '1', null, null);
INSERT INTO `session` VALUES ('39', '1513826388185', '1afcc0a9a2874bba9d182a7778668b43', '1', null, null);
INSERT INTO `session` VALUES ('40', '1513826457239', '0b610ae09889491f906a4c94ca0bccd1', '1', null, null);
INSERT INTO `session` VALUES ('41', '1513826984053', '09594255370b4d4a8ea848b769bd923a', '1', null, null);
INSERT INTO `session` VALUES ('42', '1513827371830', 'd484da0212884b7e916b884e2226b5f0', '1', null, null);
INSERT INTO `session` VALUES ('43', '1513827572092', '217fe61ac6c94169b8a7c1bea7856874', '1', null, null);
INSERT INTO `session` VALUES ('44', '1513827667610', 'b5fd1fa2fa5e4c13b44469fa5ba1ae0e', '1', null, null);
INSERT INTO `session` VALUES ('45', '1513827806967', '8ddceff93f8e414c83964f6cf8bc6488', '1', null, null);
INSERT INTO `session` VALUES ('46', '1513828038188', '026020b795784be09e9365c2a0647209', '1', null, null);
INSERT INTO `session` VALUES ('47', '1513828170196', 'ff2f7d1ec83c4ccc827707fc934278fb', '1', null, null);
INSERT INTO `session` VALUES ('48', '1513828412644', 'ef2f83d0398e42ac80d85671947e0d3f', '1', null, null);
INSERT INTO `session` VALUES ('49', '1513829058917', 'c4949343beeb41729154419f49415b76', '1', null, null);
INSERT INTO `session` VALUES ('50', '1513829388956', '06f6c95ceb6544a090fb8ae16f0c4478', '1', null, null);
INSERT INTO `session` VALUES ('51', '1513829542463', '4c86d75bc1cf4671be2a02f51909bc0a', '1', null, null);
INSERT INTO `session` VALUES ('52', '1513829671018', '2048a0cfa09b4182baa474804a177e5e', '1', null, null);
INSERT INTO `session` VALUES ('53', '1513829743639', 'd1b1e5a2313543aba39768b056768a80', '1', null, null);
INSERT INTO `session` VALUES ('54', '1513832923758', 'a3c98fb3961d446382c5f11ee02e7d27', '1', null, null);
INSERT INTO `session` VALUES ('55', '1513833076162', 'f10d1ad4f7594b219e4819c9f7314288', '1', null, null);
INSERT INTO `session` VALUES ('56', '1513833704658', '9b3eabb641c54403b258524ba8251d8b', '1', null, null);
INSERT INTO `session` VALUES ('57', '1513833894971', 'aaef5f1089524ce7aa1a2b431c820a28', '1', null, null);
INSERT INTO `session` VALUES ('58', '1513833965471', '2dc3e6256ca84967b824821a2c816577', '1', null, null);
INSERT INTO `session` VALUES ('59', '1513834148408', '567f6edfef75494c82c818798adb6ae7', '1', null, null);
INSERT INTO `session` VALUES ('60', '1513835196442', 'e1cae45ca76f4643a8572dd7be05338b', '1', null, null);
INSERT INTO `session` VALUES ('61', '1513835404673', '5c84690f824d4064b04e01d274bd3289', '1', null, null);
INSERT INTO `session` VALUES ('62', '1513835598214', '23551de3a81342bda63f24db7775c5d8', '1', null, null);
INSERT INTO `session` VALUES ('63', '1513835792979', '681195ba30034492aed77fbb267faf27', '1', null, null);
INSERT INTO `session` VALUES ('64', '1513835936165', '8e7c8b03c38147ffa89b3c3d251d331d', '1', null, null);
INSERT INTO `session` VALUES ('65', '1513836057606', '89e11cf7ff65464bb84a0e7301de21dc', '1', null, null);
INSERT INTO `session` VALUES ('66', '1513836161745', '42a34ec6cee34650b21ae52e8f9b8401', '1', null, null);
INSERT INTO `session` VALUES ('67', '1513836459696', '4187b71cecc94df3b56b6044fb3e5568', '1', null, null);
INSERT INTO `session` VALUES ('68', '1513837502458', '3adeffec589448d8bf425207fbc8410a', '1', null, null);
INSERT INTO `session` VALUES ('69', '1513837567091', '0e2bf3a78a7a4034bbcf1059ccc595f1', '1', null, null);
INSERT INTO `session` VALUES ('70', '1513839136203', '81c6e6b61c7747e285619d6fa0d4ba77', '1', null, null);
INSERT INTO `session` VALUES ('71', '1513839204699', 'd53c7417ff4d4ffe80fcc8f1f0ed4858', '1', null, null);
INSERT INTO `session` VALUES ('72', '1513839268233', '002a82e6d3b149f08edefe93fddb6376', '1', null, null);
INSERT INTO `session` VALUES ('73', '1513839342363', '3d1d12d9d53642cbbdb48f3aa7e845fb', '1', null, null);
INSERT INTO `session` VALUES ('74', '1513839448985', '4ed5948b5a054984ae5c0944e645a8f0', '1', null, null);
INSERT INTO `session` VALUES ('75', '1513839534980', 'fefe501915ad482a80d0112112692e4d', '1', null, null);
INSERT INTO `session` VALUES ('76', '1513839873360', 'f6bbee4c004f43759b4b28fa4a6ada98', '1', null, null);
INSERT INTO `session` VALUES ('77', '1513839971467', '623690b57b214641940649ce4eedacf0', '1', null, null);
INSERT INTO `session` VALUES ('78', '1513840061774', 'a41e1dab68fc4e1c974959bb9e3a6ae3', '1', null, null);
INSERT INTO `session` VALUES ('79', '1513840483310', 'f96e367695554bddbc3ffc68a00dc477', '1', null, null);
INSERT INTO `session` VALUES ('80', '1513840555200', 'ac9aac3b7aed4f47bed19849c1c64086', '1', null, null);
INSERT INTO `session` VALUES ('81', '1513840932528', 'c8d1031c08234c04befe8d4f24e3b189', '1', null, null);
INSERT INTO `session` VALUES ('82', '1513841076126', '93b37da9625c47f0ad94c646a33425f0', '1', null, null);
INSERT INTO `session` VALUES ('83', '1513841480699', 'feccb9e1d91741f5adb18af4e14ff4c6', '1', null, null);
INSERT INTO `session` VALUES ('84', '1513843333221', 'dd28750bdf98418282159e56130a47dd', '1', null, null);
INSERT INTO `session` VALUES ('85', '1513843848437', '326cda8aa43a468f89f551ce32fb8801', '1', null, null);
INSERT INTO `session` VALUES ('86', '1513844013118', '3ccf83e408e84430a4b17d59a0a7f74b', '1', null, null);
INSERT INTO `session` VALUES ('87', '1513844331383', '74de4fc9748f405bb240ff47315f5f5d', '1', null, null);
INSERT INTO `session` VALUES ('88', '1513844440774', '086d5a836fb84e87b3f26c6f460a3b6c', '1', null, null);
INSERT INTO `session` VALUES ('89', '1513844711793', 'fe6c32ce0bba4a67831eced1dcdedb66', '1', null, null);
INSERT INTO `session` VALUES ('90', '1513845191116', '0aa8a2ad2f4343dca88801eddc7b4fdc', '1', null, null);
INSERT INTO `session` VALUES ('91', '1513845274051', 'ddfd0d40beb24cf9884b9ed1e89c6353', '1', null, null);
INSERT INTO `session` VALUES ('92', '1513845326382', 'ed2afc9734e548f29b0f8ac4e7a71752', '1', null, null);
INSERT INTO `session` VALUES ('93', '1513845532657', '664ef158dea84498a5fdbf93d4d0c3c6', '1', null, null);
INSERT INTO `session` VALUES ('94', '1513845674743', '5b11889948b848fb91192072978c76a7', '1', null, null);
INSERT INTO `session` VALUES ('95', '1513847223760', '088201ed42e4452b97751c2a9758e59c', '1', null, null);
INSERT INTO `session` VALUES ('96', '1513847256606', 'ff19ebbdd01241a188ff4fd91477730c', '1', null, null);
INSERT INTO `session` VALUES ('97', '1513847340098', 'f0b07a729f3e4e6f962849cdf2f0c2a3', '1', null, null);
INSERT INTO `session` VALUES ('98', '1513847864488', 'c1eb82d90c8d4617a981454fa76eef6e', '1', null, null);
INSERT INTO `session` VALUES ('99', '1513848037328', 'ba649ed8f379415ab4e589ea83bfdc49', '1', null, null);
INSERT INTO `session` VALUES ('100', '1513848260753', '5698c7cd707f4b2098f85d05ada6bd4a', '1', null, null);
INSERT INTO `session` VALUES ('101', '1513848660078', 'cbcad8d2b79b46d49e27040ae0c3c4b9', '1', null, null);
INSERT INTO `session` VALUES ('102', '1513849215460', '7008d40cf1ad46d3a5c41a3953dd7942', '1', null, null);
INSERT INTO `session` VALUES ('103', '1513849307219', '3cf345cd58494443920cbf3fac71fba7', '1', null, null);
INSERT INTO `session` VALUES ('104', '1513849457288', '634b0da0c02d490e86080298d8fdd9af', '1', null, null);
INSERT INTO `session` VALUES ('105', '1513849637996', '6b899b17005942eba7ea7a198c41c9a0', '1', null, null);
INSERT INTO `session` VALUES ('106', '1513850073826', '2e2cf7372fe2499584960be76dd4a13c', '1', null, null);
INSERT INTO `session` VALUES ('107', '1513924572095', '7e1db9f8dab04eccb14302b38ac0af6f', '1', null, null);
INSERT INTO `session` VALUES ('108', '1514172796206', '809ae627b14d4f21b89dcae19b404cdc', '1', null, null);
INSERT INTO `session` VALUES ('109', '1514173199372', '1d5afe5ed04e452e8efd4865d7ef580c', '1', null, null);
INSERT INTO `session` VALUES ('110', '1514173344327', '4b9ebf44e8734c33b4838926cd05704a', '1', null, null);
INSERT INTO `session` VALUES ('111', '1514173419760', 'c8b15cfac1aa43a18ee5bb4eca7ca094', '1', null, null);
INSERT INTO `session` VALUES ('112', '1514173865786', 'c12256d0803044a4b16e9779ec4f8568', '1', null, null);
INSERT INTO `session` VALUES ('113', '1514173903640', '1ddaf130bde340c69f41b11270b675bc', '1', null, null);
INSERT INTO `session` VALUES ('114', '1514174077204', '726c153fe0ff44c5a1c717c1ec9d5422', '1', null, null);
INSERT INTO `session` VALUES ('115', '1514188633623', '39c9293a4b574c5081d65d6028a9db9b', '1', null, null);
INSERT INTO `session` VALUES ('116', '1514190011365', '8fe3df0c5c304af0b33a5a6b9ff3f943', '1', null, null);
INSERT INTO `session` VALUES ('117', '1514190730883', '1688135beda94d80831b103bf6ccceb7', '1', null, null);
INSERT INTO `session` VALUES ('118', '1514190825322', 'ba935fba4d35423999a6f4b34fc8f0dd', '1', null, null);
INSERT INTO `session` VALUES ('119', '1514190937304', '8e4e8ac9cffe43b790c788ab6d03e1ca', '1', null, null);
INSERT INTO `session` VALUES ('120', '1514191040335', '01eefb7ad3b641a1a40b3ceab970d8bd', '1', null, null);
INSERT INTO `session` VALUES ('121', '1514191391068', 'e5166d319864481f8beb50ce255e333e', '1', null, null);
INSERT INTO `session` VALUES ('122', '1514192207906', 'f80f966d52444affad8e9e4d923272c3', '1', null, null);
INSERT INTO `session` VALUES ('123', '1514192276182', '615f788a7baa436190cb22619a4d3286', '1', null, null);
INSERT INTO `session` VALUES ('124', '1514192463680', 'b1c6a71c7e88491780a9d201b9cff672', '1', null, null);
INSERT INTO `session` VALUES ('125', '1514193856584', '786a7e4022ab4f038f37ca8d81ab51b9', '1', null, null);
INSERT INTO `session` VALUES ('126', '1514248248175', '5675713d4e2448348dc52a1685acd7c4', '1', null, null);
INSERT INTO `session` VALUES ('127', '1514248709076', '1c9fb16b18d848d89c1fba54c4c05918', '1', null, null);
INSERT INTO `session` VALUES ('128', '1514249213915', '0be58e08fec24b3885440da1c3a132e3', '1', null, null);
INSERT INTO `session` VALUES ('129', '1514249389149', '5526edb3dc104a45856f3bd2515d235b', '1', null, null);
INSERT INTO `session` VALUES ('130', '1514250071612', '4c682e535e304639aa47a6bf40abb7cd', '1', null, null);
INSERT INTO `session` VALUES ('131', '1514250220310', '78b26567e44841c4b7436717362e0192', '1', null, null);
INSERT INTO `session` VALUES ('132', '1514250324704', 'dd3892cb8dd54b1589ec7ec58454b7d4', '1', null, null);
INSERT INTO `session` VALUES ('133', '1514250501848', 'b157ff0638c24af78b78b7ebc172b4d2', '1', null, null);
INSERT INTO `session` VALUES ('134', '1514250979211', '893fdbcf9b5d4553b122dbde2fa94a15', '1', null, null);
INSERT INTO `session` VALUES ('135', '1514251085286', '8c109d02752547d48db28c9313d05812', '1', null, null);
INSERT INTO `session` VALUES ('136', '1514251176636', '715e0c05cd9a4918940e38b19a9eda36', '1', null, null);
INSERT INTO `session` VALUES ('137', '1514251760041', 'a54ac4787bf0461c838e98655122ec06', '1', null, null);
INSERT INTO `session` VALUES ('138', '1514251932326', 'b22f3649b5dd46749637df064f948d5f', '1', null, null);
INSERT INTO `session` VALUES ('139', '1514252039744', 'e1ab90fff1b24b8093829b89c799da7c', '1', null, null);
INSERT INTO `session` VALUES ('140', '1514252862181', 'b10d6c66a365450db5109e9b9908b1ec', '1', null, null);
INSERT INTO `session` VALUES ('141', '1514253462898', 'ed44f9ef208b4036956a2b1c14aeb4ed', '1', null, null);
INSERT INTO `session` VALUES ('142', '1514254384635', 'ea671433e4aa4e3d84a882d71482bd82', '1', null, null);
INSERT INTO `session` VALUES ('143', '1514254771560', 'd3e260d6a03d44138635c11fdca4948d', '1', null, null);
INSERT INTO `session` VALUES ('144', '1514254911039', 'bf9f26a5b36548bc852a55c3554110ce', '1', null, null);
INSERT INTO `session` VALUES ('145', '1514255497507', 'd6a70d9dc393413084fc0fb125aca22f', '1', null, null);
INSERT INTO `session` VALUES ('146', '1514337584186', '0f5e109041b74274a092d947f4253d3a', '1', null, null);
INSERT INTO `session` VALUES ('147', '1514340756621', 'e08c28302571404cbe7fa550526b522e', '1', null, null);
INSERT INTO `session` VALUES ('148', '1514340863235', '633a406ba9af4b22987631ffd01ed4bc', '1', null, null);
INSERT INTO `session` VALUES ('149', '1514340985478', '840f9eb90d234705a36ed9b60db3057d', '1', null, null);
INSERT INTO `session` VALUES ('150', '1514341908484', 'f87ff1c896f645bb85b07471c21e48c4', '1', null, null);
INSERT INTO `session` VALUES ('151', '1514341989079', '83319e3a6d254c7c9b01d69c37e78972', '1', null, null);
INSERT INTO `session` VALUES ('152', '1514343944771', '0608116b55864a9eacb10ad1e992749f', '1', null, null);
INSERT INTO `session` VALUES ('153', '1514344025995', 'a67cd87f68684ce5b01a816664086962', '1', null, null);
INSERT INTO `session` VALUES ('154', '1514345153504', '9272c495d61441f3848e4061e7dd68ad', '1', null, null);
INSERT INTO `session` VALUES ('155', '1514345672764', 'fb6825494b37421ba6e25d23c3853f97', '1', null, null);
INSERT INTO `session` VALUES ('156', '1514347221576', '50783e1ba4b9408795576f32ba630bd9', '1', null, null);
INSERT INTO `session` VALUES ('157', '1514347854565', '6f528ec84b35406f8fcaee9d40883bac', '1', null, null);
INSERT INTO `session` VALUES ('158', '1514359735998', 'd801ba001f9f4fd089f3a003ffd38964', '1', null, null);

-- ----------------------------
-- Table structure for tag
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `count` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `create_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tag
-- ----------------------------
INSERT INTO `tag` VALUES ('1', '0', 'Java', '0', '2017-12-26 09:56:56', null);
INSERT INTO `tag` VALUES ('2', '0', 'JavaScript', '0', '2017-12-26 09:57:22', null);
INSERT INTO `tag` VALUES ('3', '0', 'SpringBoot', '0', '2017-12-26 09:57:31', null);
INSERT INTO `tag` VALUES ('4', '0', 'C++', '0', '2017-12-26 09:57:46', '2017-12-26 09:59:44');
INSERT INTO `tag` VALUES ('5', '0', 'PHP', '0', '2017-12-26 09:57:55', null);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `avatar` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `nick_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `create_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'jcohy', '111', '1', 'jcohy', '2JA4GMHUOU9TU79RF18KPAS82G', 'jiachao', '1', 'jcohy', '2017-12-19 08:42:40', '2017-12-19 08:42:42');
