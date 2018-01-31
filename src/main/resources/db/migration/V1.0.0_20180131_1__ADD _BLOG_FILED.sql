




ALTER TABLE `menu` ADD `visible` int(11) NOT NULL DEFAULT '1' COMMENT 'menu可见|jiac|20180131' AFTER  `content`;
ALTER TABLE `menu` ADD `url` VARCHAR (255) NOT NULL DEFAULT '' COMMENT 'menu链接|jiac|20180131' AFTER `content`;
ALTER TABLE `notice` ADD `url` VARCHAR (255) NOT NULL DEFAULT '' COMMENT 'notice链接|jiac|20180131' AFTER `content`;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES ('1', '网站新开张了','', '2018-01-31 11:37:24', '2018-01-31 11:37:24', '0', '2018-01-31 11:37:24', '2018-01-31 11:37:24');
INSERT INTO `notice` VALUES ('2', '网站新开张了','http://www.jcohy.com', '2018-01-31 11:37:24', '2018-01-31 11:37:24', '0', '2018-01-31 11:37:24', '2018-01-31 11:37:24');

INSERT INTO `menu` VALUES ('5', '2', '文章专栏', '2', '文章专栏','article/index','0', '2017-12-29 11:42:40', '2017-12-29 11:42:42');
INSERT INTO `menu` VALUES ('6', '3', '资源分享', '3', '资源分享','resource/index','0', '2017-12-29 11:42:40', '2017-12-29 11:42:42');
INSERT INTO `menu` VALUES ('7', '4', '点点滴滴', '4', '点点滴滴','timeline/index','0', '2017-12-29 11:42:40', '2017-12-29 11:42:42');