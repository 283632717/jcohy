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
  `title` varchar(255) DEFAULT NULL COMMENT '标题|jiac|201180117',
  `content` longtext COMMENT '内容|jiac|201180117',
  `privacy` int(11) DEFAULT NULL COMMENT '权限级别 0 公开 1私密|jiac|201180117',
  `status` int(11) DEFAULT NULL COMMENT '状态|jiac|201180117',
  `summary` varchar(500) DEFAULT NULL COMMENT '摘要|jiac|201180117',
  `tags` varchar(255) DEFAULT NULL COMMENT '标签|jiac|201180117',
  `istop` int(11)  DEFAULT '0' COMMENT '是否置顶|jiac|201180117',
  `iscomment` int(11) DEFAULT '0' COMMENT '是否推荐|jiac|201180117',
  `comment_num` int(11) NOT NULL DEFAULT '0' COMMENT '评论数|jiac|201180117',
  `heart_num` int(11) NOT NULL DEFAULT '0' COMMENT '点赞数|jiac|201180117',
  `read_num` int(11) NOT NULL DEFAULT '0' COMMENT '阅读数|jiac|201180117',
  `coverURL` varchar(255) DEFAULT NULL COMMENT '封面图片地址|jiac|201180117',
  `publishTime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '文章发布时间',
  `url` VARCHAR (255) NOT NULL DEFAULT '0' COMMENT '博客地址|jiac|201180117',
  `type_id` int(11) NOT NULL DEFAULT '1' COMMENT '博文类型，0表示普通博文，1表示富博文(带封面图片)',
  `author_id` bigint(20) DEFAULT NULL COMMENT '作者|jiac|201180117',
  `category_id` bigint(20) DEFAULT NULL COMMENT '分类|jiac|201180117',
  `create_date` timestamp NOT NULL  ON UPDATE CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL  ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `author_id` (`author_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `author_id` FOREIGN KEY (`author_id`) REFERENCES `user` (`id`),
  CONSTRAINT `category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8  COMMENT='博客信息|jiac|20180117';

-- ----------------------------
-- Records of blog
-- ----------------------------

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `count` int(11) NOT NULL DEFAULT '0' COMMENT '数量|jiac|201180117',
  `name` varchar(255) DEFAULT NULL COMMENT '名称|jiac|201180117',
  `typeID` bigint(20) DEFAULT '1' COMMENT '类型|jiac|201180117',
  `keywords` varchar(50) DEFAULT '' COMMENT '关键字|jiac|201180117',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态，可见或者不可见|jiac|201180117',
  `create_date` timestamp NOT NULL  ON UPDATE CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL  ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8  COMMENT='分类表|jiac|20180117';



-- ----------------------------
-- Table structure for link
-- ----------------------------
DROP TABLE IF EXISTS `link`;
CREATE TABLE `link` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL COMMENT '标题|jiac|201180117',
  `url` varchar(500) DEFAULT NULL COMMENT '地址|jiac|201180117',
  `email` varchar(255) DEFAULT NULL COMMENT '站长邮箱|jiac|201180117',
  `description` varchar(255) DEFAULT NULL COMMENT '描述|jiac|201180117',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态，可见或者不可见|jiac|201180117',
  `logo` VARCHAR(255) DEFAULT '' COMMENT 'logo|jiac|201180117',
  `menu_id` bigint(20) DEFAULT NULL,
  `create_date` timestamp NOT NULL  ON UPDATE CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL  ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk` (`menu_id`),
  CONSTRAINT `fk` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8  COMMENT='友情链接表|jiac|20180117';


-- ----------------------------
-- Table structure for login_log
-- ----------------------------
DROP TABLE IF EXISTS `login_log`;
CREATE TABLE `login_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ip` varchar(255) DEFAULT NULL COMMENT 'ip|jiac|201180117',
  `login_at` datetime DEFAULT NULL COMMENT '登录时间|jiac|201180117',
  `user_id` bigint(20) DEFAULT NULL COMMENT 'user|jiac|201180117',
  `create_date` timestamp NOT NULL  ON UPDATE CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL  ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_login_id` (`user_id`),
  CONSTRAINT `user_login_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8  COMMENT='登录日志|jiac|20180117';

-- ----------------------------
-- Records of login_log
-- ----------------------------

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` int(11) DEFAULT NULL COMMENT '编号|jiac|201180117',
  `name` varchar(255) DEFAULT NULL COMMENT '名称|jiac|201180117',
  `parent_code` int(11) DEFAULT NULL COMMENT '父级编号|jiac|201180117',
  `content` longtext COMMENT '内容|jiac|201180117',
  `create_date` timestamp NOT NULL  ON UPDATE CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL  ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8  COMMENT='菜单表|jiac|20180117';


-- ----------------------------
-- Table structure for options
-- ----------------------------
DROP TABLE IF EXISTS `options`;
CREATE TABLE `options` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `option_key` varchar(255) DEFAULT NULL COMMENT 'key|jiac|201180117',
  `option_value` varchar(255) DEFAULT NULL COMMENT 'value|jiac|201180117',
  `description` varchar(255) DEFAULT NULL COMMENT 'description|jiac|201180117',
  `create_date` timestamp NOT NULL  ON UPDATE CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL  ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='网站信息|jiac|20180117';


 ----------------------------
-- Table structure for session
-- ----------------------------
DROP TABLE IF EXISTS `session`;
CREATE TABLE `session` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `expire_at` bigint(20) DEFAULT NULL COMMENT '失效时间|jiac|201180117',
  `session_id` varchar(255) DEFAULT NULL COMMENT 'sessionId|jiac|201180117',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户|jiac|201180117',
  `create_date` timestamp NOT NULL  ON UPDATE CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL  ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_session_id` (`user_id`),
  CONSTRAINT `user_session_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8  COMMENT='session表|jiac|20180117';

-- ----------------------------
-- Table structure for tag
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `count` int(11) NOT NULL DEFAULT '0' COMMENT '博客数量|jiac|201180117',
  `name` varchar(255) DEFAULT NULL COMMENT '名称|jiac|201180117',
  `status` int(11) DEFAULT NULL COMMENT '状态|jiac|201180117',
  `create_date` timestamp NOT NULL  ON UPDATE CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL  ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8  COMMENT='tags表|jiac|20180117';


-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像|jiac|201180117',
  `description` varchar(255) DEFAULT NULL COMMENT '简介|jiac|201180117',
  `ip` varchar(255) DEFAULT NULL COMMENT '注册修改ip|jiac|201180117',
  `nick_name` varchar(255) DEFAULT NULL COMMENT '昵称|jiac|201180117',
  `password` varchar(255) DEFAULT NULL COMMENT '密码|jiac|201180117',
  `salt` varchar(255) DEFAULT NULL COMMENT 'description|jiac|201180117',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态|jiac|201180117',
  `name` varchar(255) DEFAULT NULL COMMENT '真实姓名|jiac|201180117',
  `create_date` timestamp NOT NULL  ON UPDATE CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL  ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8  COMMENT='用户表|jiac|20180117';


-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
   `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` mediumtext NOT NULL COMMENT '公告内容|jiac|201180117',
  `start` datetime NOT NULL COMMENT '开始时间|jiac|201180117',
  `end` datetime NOT NULL COMMENT '结束时间|jiac|201180117',
  `visible` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0,不可见，1可见|jiac|201180117''',
  `create_date` timestamp NOT NULL  ON UPDATE CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL  ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='公告|jiac|20180117';


-- -----------------------------------
-- Table structure for comment  评论
-- -----------------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
   `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(20) NOT NULL COMMENT '公告内容|jiac|201180117',
  `email` varchar(50) NOT NULL COMMENT '公告内容|jiac|201180117',
  `content` text NOT NULL COMMENT '公告内容|jiac|201180117',
  `likeNum` int(11) NOT NULL DEFAULT '0' COMMENT '公告内容|jiac|201180117',
  `hateNum` int(11) NOT NULL DEFAULT '0' COMMENT '公告内容|jiac|201180117',
  `parent` int(20) DEFAULT NULL COMMENT '公告内容|jiac|201180117',
  `blogID` int(20) NOT NULL COMMENT '公告内容|jiac|201180117',
  `headURL` varchar(100) DEFAULT NULL,
  `check` int(11) DEFAULT '0' COMMENT '是否审核，0表示未审核，1表示审核|jiac|201180117',
  `status` int(11) DEFAULT '1' COMMENT '是否合法，0未通过，1通过|jiac|201180117',
  `create_date` timestamp NOT NULL  ON UPDATE CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL  ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评论|jiac|20180117';


-- ---------------------------------
-- Table structure for type
-- ---------------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '分类名称|jiac|201180117',
  `create_date` timestamp NOT NULL  ON UPDATE CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL  ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='type|jiac|20180117';


-- -----------------------------------
-- Table structure for comment  时光轴
-- -----------------------------------
DROP TABLE IF EXISTS `timeline`;
CREATE TABLE `timeline` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `display_name` varchar(50) NOT NULL COMMENT '显示名称|jiac|201180117',
  `display_date` varchar(50) NOT NULL COMMENT '显示日期|jiac|201180117',
  `create_date` timestamp NOT NULL  ON UPDATE CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL  ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='type|jiac|20180117';