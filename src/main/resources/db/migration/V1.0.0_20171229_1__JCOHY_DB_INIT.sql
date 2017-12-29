/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50637
Source Host           : localhost:3306
Source Database       : jcohy

Target Server Type    : MYSQL
Target Server Version : 50637
File Encoding         : 65001

Date: 2017-12-29 16:14:57
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
  `privacy` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `summary` varchar(500) DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `istop` int(11)  DEFAULT '0',
  `isrecomment` int(11) DEFAULT '0',
  `views` int(11) NOT NULL DEFAULT '0',
  `author_id` bigint(20) DEFAULT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  `create_date` timestamp NULL DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `author_id` (`author_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `author_id` FOREIGN KEY (`author_id`) REFERENCES `user` (`id`),
  CONSTRAINT `category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
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
  `menu_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk` (`menu_id`),
  CONSTRAINT `fk` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of link
-- ----------------------------
INSERT INTO `link` VALUES ('1', '百度', 'http://www.baidu.com', 'hhh@qq.com', '百度首页', '0', '2017-12-29 10:16:49', '2017-12-29 10:16:49', null);
INSERT INTO `link` VALUES ('2', 'layui', 'http://www.layui.com/', 'xian@qq.com', '经典模块化前端UI框架', '0', '2017-12-29 10:16:57', '2017-12-29 10:16:57', null);

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
  KEY `user_login_id` (`user_id`),
  CONSTRAINT `user_login_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of login_log
-- ----------------------------

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `parent_code` int(11) DEFAULT NULL,
  `content` longtext,
  `create_date` timestamp NULL DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', '100100', '搜索', '0', '搜索', '2017-12-29 11:42:40', '2017-12-29 11:42:42');
INSERT INTO `menu` VALUES ('2', '100200', 'IT', '0', '互联网', '2017-12-29 11:42:40', '2017-12-29 11:42:42');
INSERT INTO `menu` VALUES ('3', '100101', '百度', '100000', '百度', '2017-12-29 11:42:40', '2017-12-29 11:42:42');
INSERT INTO `menu` VALUES ('4', '100201', '前端', '100200', '前端', '2017-12-29 11:42:40', '2017-12-29 11:42:42');

-- ----------------------------
-- Table structure for options
-- ----------------------------
DROP TABLE IF EXISTS `options`;
CREATE TABLE `options` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `option_key` varchar(255) DEFAULT NULL,
  `option_value` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `create_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of options
-- ----------------------------
INSERT INTO `options` VALUES ('1', 'title', '个人博客', null, null, null);
INSERT INTO `options` VALUES ('2', 'domain_name', 'www.jcohy.com', null, null, null);
INSERT INTO `options` VALUES ('3', 'keyword', 'jcohy，个人博客', null, '2017-12-28 11:36:24', '2017-12-28 11:36:24');
INSERT INTO `options` VALUES ('4', 'description', '描述', null, null, null);
INSERT INTO `options` VALUES ('5', 'email', 'jia_chao23@126.com', null, null, null);
INSERT INTO `options` VALUES ('6', 'phone', '18515892938', null, null, null);
INSERT INTO `options` VALUES ('7', 'qq1', '317022800', null, '2017-12-28 11:32:35', '2017-12-28 11:32:35');
INSERT INTO `options` VALUES ('8', 'qq2', '317022800', null, '2017-12-28 11:34:38', '2017-12-28 11:34:38');
INSERT INTO `options` VALUES ('9', 'record_number', '京ICP备17050179号-1', null, '2017-12-28 11:34:44', '2017-12-28 11:34:44');
INSERT INTO `options` VALUES ('10', 'record_address', '北京市通州驻区大队', null, '2017-12-28 11:34:48', '2017-12-28 11:34:48');

 ----------------------------
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
  KEY `user_session_id` (`user_id`),
  CONSTRAINT `user_session_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
