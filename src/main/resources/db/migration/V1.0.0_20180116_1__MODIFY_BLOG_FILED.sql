ALTER TABLE `blog` CHANGE `commentNum` `comment_num` int(11) NOT NULL DEFAULT '0' COMMENT '评论数';
ALTER TABLE `blog` CHANGE `heartNum` `heart_num` int(11) NOT NULL DEFAULT '0' COMMENT '点赞数';
ALTER TABLE `blog` CHANGE `readNum` `read_num` int(11) NOT NULL DEFAULT '0' COMMENT '阅读数';
ALTER TABLE `blog` CHANGE `isrecomment` `iscomment` int(11) NOT NULL DEFAULT '0' COMMENT '是否推荐';