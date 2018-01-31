


-- ----------------------------
-- Records of type
-- ----------------------------
INSERT INTO `type` VALUES ('1','技术','2017-01-16 16:21:43','2017-01-16 16:21:43');
INSERT INTO `type` VALUES ('2','随笔','2017-01-16 16:21:43','2017-01-16 16:21:43');
INSERT INTO `type` VALUES ('3','杂谈','2017-01-16 16:21:43','2017-01-16 16:21:43');
INSERT INTO `type` VALUES ('4','算法','2017-01-16 16:21:43','2017-01-16 16:21:43');
INSERT INTO `type` VALUES ('5','视频','2017-01-16 16:21:43','2017-01-16 16:21:43');
INSERT INTO `type` VALUES ('6','音乐','2017-01-16 16:21:43','2017-01-16 16:21:43');
INSERT INTO `type` VALUES ('7','文本','2017-01-16 16:21:43','2017-01-16 16:21:43');

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '0', '转载','1','技术','0', '2017-12-21 13:28:35', '2017-12-26 09:03:09');
INSERT INTO `category` VALUES ('2', '0', '原创', '1','技术','0', '2017-12-21 13:28:40', '2017-12-26 09:15:46');
INSERT INTO `category` VALUES ('3', '0', '其他', '1','技术','0', '2017-12-26 09:19:49', '2017-12-26 09:19:49');


-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', '100100', '搜索', '0', '搜索', '2017-12-29 11:42:40', '2017-12-29 11:42:42');
INSERT INTO `menu` VALUES ('2', '100200', 'IT', '0', '互联网', '2017-12-29 11:42:40', '2017-12-29 11:42:42');
INSERT INTO `menu` VALUES ('3', '100101', '百度', '100100', '百度', '2017-12-29 11:42:40', '2017-12-29 11:42:42');
INSERT INTO `menu` VALUES ('4', '100201', '前端', '100200', '前端', '2017-12-29 11:42:40', '2017-12-29 11:42:42');


-- ----------------------------
-- Records of link
-- ----------------------------
INSERT INTO `link` VALUES ('1', '百度', 'http://www.baidu.com', 'hhh@qq.com', '百度首页', '0', null, '1','2017-12-29 10:16:49', '2017-12-29 10:16:49');
INSERT INTO `link` VALUES ('2', 'layui', 'http://www.layui.com/', 'xian@qq.com', '经典模块化前端UI框架', '0', null, '1','2017-12-29 10:16:57', '2017-12-29 10:16:57');



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

-- ----------------------------
-- Records of tag
-- ----------------------------
INSERT INTO `tag` VALUES ('1', '0', 'Java', '0', '2017-12-26 09:56:56', null);
INSERT INTO `tag` VALUES ('2', '0', 'JavaScript', '0', '2017-12-26 09:57:22', null);
INSERT INTO `tag` VALUES ('3', '0', 'SpringBoot', '0', '2017-12-26 09:57:31', null);
INSERT INTO `tag` VALUES ('4', '0', 'C++', '0', '2017-12-26 09:57:46', '2017-12-26 09:59:44');
INSERT INTO `tag` VALUES ('5', '0', 'PHP', '0', '2017-12-26 09:57:55', null);

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'jcohy', '111', '1', 'jcohy', '2JA4GMHUOU9TU79RF18KPAS82G', 'jiachao', '1', 'jcohy', '2017-12-19 08:42:40', '2017-12-19 08:42:42');

INSERT INTO `blog` VALUES ('1', 'CentOS下安装Nginx教程', '<p>1.Nginx 简介</p><p>Nginx (&quot;engine x&quot;) 是一个高性能的 HTTP 和 反向代理 服务器，也是一个 IMAP/POP3/SMTP 代理服务器。 Nginx</p><p>是由 Igor Sysoev 为俄罗斯访问量第二的 Rambler.ru 站点开发的，它已经在该站点运行超过两年半了。 Igor 将</p><p>源代码以类 BSD 许可证的形式发布。尽管还是测试版，但是，Nginx 已经因为它的稳定性、丰富的功能集、示例配置</p><p>文件和低系统资源的消耗而闻名了。</p><p>&nbsp;&nbsp; Nginx采用最新的epoll（Linux 2.6内核）和kqueue(freebsd)网络I/O模型，而Apache则使用的是传统的select</p><p>模型。目前Linux下能够承受高并方访问的Squid、Memcached都是采用是epoll网络I/O模型。</p><p>2.使用 Nginx 前必须了解的事项</p><p>1.目前官方 Nginx 并不支持 Windows，您只能在包括 Linux、UNIX、BSD 系统下安装和使用；<br/>2.Nginx 本身只是一个 HTTP 和反向代理服务器，它无法像 Apache 一样通过安装各种模块来支持不同的页面脚本，</p><p>例如 PHP、CGI 等；<br/>3.Nginx 支持简单的负载均衡和容错；<br/>4.支持作为基本 HTTP 服务器的功能，例如日志、压缩、Byte ranges、Chunked responses、SSL、虚拟主机等等，</p><p>应有尽有。</p><p>3.下载介质<br/>&nbsp;&nbsp; Nginx部署之前，首先根据项目的需要选择需要安装的组件，实际环境一般会考虑需要支持gzip压缩和rewrite模</p><p>块。所以安装的第一步是下载Ngix及Ngix的相关组件。<br/>1) Nginx本身<br/>&nbsp;&nbsp; 下载地址：http://nginx.org/en/download.html<br/>&nbsp;&nbsp; 建议下载最新版本介质，目前最新的是：1.0.2<br/>2) gzip压缩依赖库：zlib<br/>&nbsp;&nbsp; 下载地址:http://www.zlib.net<br/>&nbsp;&nbsp; 下载版本：Version 1.2.5<br/>3)Rewrite模块的正则表达式依赖库:pcre<br/>&nbsp;&nbsp; pcre库简称：Perl兼容正则表达式<br/>&nbsp;&nbsp; 下载地址：http://www.pcre.org<br/>&nbsp;&nbsp; 下载版本：pcre-8.02<br/>&nbsp;</p><p>4.开始安装</p><p><br/></p><p>1) .安装&nbsp;pcre</p><p>tar -zxvf pcre-8.02.tar.gz<br/>./configure<br/>make<br/>make install<br/>默认安装到/usr/local/lib下即可。<br/>安装完成后可以#ls -l /usr/local/lib/libpcre.so</p><p>2）.安装nginx</p><p>tar zxvf nginx-1.0.11.tar.gz</p><p>cd nginx-1.0.11<br/>./configure --prefix=/usr/local/nginx&nbsp; --with-poll_module&nbsp;&nbsp; --with-http_stub_status_module</p><p>make &amp;&amp; make install</p><p>3）管理nginx服务</p><p>启动：</p><p>/usr/local/nginx/sbin/nginx</p><p>停止</p><p>/usr/local/nginx/sbin/nginx -s stop</p><p>重启</p><p>/usr/local/nginx/sbin/nginx&nbsp; -s reload</p><p>查看状态</p><p>netstat -autlp| grep nginx</p><p><br/></p>', '0', '0', '1.Nginx 简介Nginx (&quot;engine x&quot;) 是一个高性能的 HTTP 和 反向代理 服务器，也是一个 IMAP/POP3/SMTP 代理服务器。 Nginx是由 Igor Sysoev 为俄罗斯访问量第二的 Rambler.ru 站...', 'nginx', '0', '0', '0', '0','0','images/blog/01.jpg','2017-12-29 16:21:43','images/blog/01.jpg','1', '1', '2','2017-12-29 16:21:43', '2017-12-29 16:21:45');

INSERT INTO `timeline` VALUES ('1','博客系统的整体框架的搭建','2017年12月5日','2017-12-26 09:59:44','2017-12-26 09:59:44');
INSERT INTO `timeline` VALUES ('2','博客系统的分类管理，标签管理模块完成','2017年12月20日','2017-12-26 09:59:44','2017-12-26 09:59:44');
INSERT INTO `timeline` VALUES ('3','博客系统的时光轴','2018年1月20日','2017-12-26 09:59:44','2017-12-26 09:59:44');