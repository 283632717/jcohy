

-- -----------------------------------
-- Table structure for comment  时光轴
-- -----------------------------------
DROP TABLE IF EXISTS `timeline`;
CREATE TABLE `timeline` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `displayName` varchar(30) NOT NULL COMMENT '显示名称',
  `displayDate` datetime DEFAULT NULL COMMENT '显示日期',
  `create_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- -----------------------------------
-- Table structure for comment  日志
-- -----------------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
   `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` mediumtext NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0,不可见，1可见',
  `create_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- -----------------------------------
-- Table structure for comment  评论
-- -----------------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
   `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `content` text NOT NULL,
  `likeNum` int(11) NOT NULL DEFAULT '0',
  `hateNum` int(11) NOT NULL DEFAULT '0',
  `parent` int(20) DEFAULT NULL,
  `blogID` int(20) NOT NULL,
  `shareNum` int(11) NOT NULL DEFAULT '0',
  `replyNum` int(11) NOT NULL DEFAULT '0',
  `headURL` varchar(100) DEFAULT NULL,
  `check` int(11) DEFAULT '0' COMMENT '是否审核，0表示未审核，1表示审核',
  `status` int(11) DEFAULT '1' COMMENT '是否合法，0未通过，1通过',
  `create_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ---------------------------------
-- Table structure for blog_tags
-- ---------------------------------
DROP TABLE IF EXISTS `blog_tags`;
CREATE TABLE `blog_tags` (
  `tagID` bigint(20) NOT NULL,
  `blogID` bigint(20) NOT NULL,
  `create_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`tagID`,`blogID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ---------------------------------
-- Table structure for type
-- ---------------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `create_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;



ALTER table `link` add logo VARCHAR(255);

ALTER table `category` add  `typeID` bigint(20) DEFAULT '1';
ALTER table `category` add  `keywords` varchar(50) DEFAULT '';

ALTER table `blog` ADD  `commentNum` int(11) NOT NULL DEFAULT '0' COMMENT '评论数';
ALTER table `blog` ADD  `heartNum` int(11) NOT NULL DEFAULT '0' COMMENT '点赞数';
ALTER table `blog` ADD  `readNum` int(11) NOT NULL DEFAULT '0' COMMENT '阅读数';
ALTER table `blog` ADD  `coverURL` varchar(255) DEFAULT NULL COMMENT '封面图片';
ALTER table `blog` ADD  `type_id` int(11) NOT NULL DEFAULT '0' COMMENT '博文类型，0表示普通博文，1表示富博文(带封面图片)';
ALTER table `blog` ADD  `publishTime` DATE NOT NULL COMMENT '文章发布时间';
ALTER table `blog` ADD  `url` VARCHAR (255) NOT NULL DEFAULT '0';
