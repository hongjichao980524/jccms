/*
Navicat MySQL Data Transfer

Source Server         : hongjichao
Source Server Version : 50726
Source Host           : localhost:3306
Source Database       : xpcms

Target Server Type    : MYSQL
Target Server Version : 50726
File Encoding         : 65001

Date: 2020-03-12 12:57:10
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `gid` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '分组',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `login_lasttime` int(10) NOT NULL DEFAULT '0' COMMENT '修改时间',
  `status` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '0开启 1关闭',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES ('1', 'member', '$2y$10$EWEAN2vfBCNINO97elISIOc/.PWnbEOS8ihfOpABmsOG.YXPwdiaG', '1', '1583324832', '1583655481', '0');
INSERT INTO `member` VALUES ('2', 'ceshi', '$2y$10$YEVOtymE7UkEGOZpdudZOuNSKe45uZZ0NGBuI/cdeZX54bdhKTJr.', '1', '1583324832', '1583668557', '0');
INSERT INTO `member` VALUES ('5', 'hongjichao', '$2y$10$isE1MzwXWdpV5SqyUDvQLeys7dc4B6Q1WCc6PPuEtx/Ao5qtB1L3K', '1', '1583651420', '1583651477', '0');
INSERT INTO `member` VALUES ('6', 'test', '$2y$10$QSNRG1L7LKKl00aG3TO32Oeo0ybYzNVf7HKp46ix5/P/Ch5I/.tby', '1', '1583655760', '1583655771', '0');
INSERT INTO `member` VALUES ('7', '123456', '$2y$10$dW/eoYy7dhWGJbkEqKDIW.txqVaKj6qrYy4NmFKEtNz8Ep0U095Pm', '1', '1583655815', '0', '0');
INSERT INTO `member` VALUES ('8', '1234567', '$2y$10$DORde0jPmMkl0NE2y5UAWuctff.lGBkKhf93mcBunhasnDvfv1R/u', '1', '1583655851', '0', '0');
INSERT INTO `member` VALUES ('9', '12345678', '$2y$10$RUDvRPhh6.ZAWVBeZNfpIORUn..NOSGeumKjYbRY5TmwpP4RVbTkq', '1', '1583655867', '1583655897', '0');

-- ----------------------------
-- Table structure for xpcms_aa
-- ----------------------------
DROP TABLE IF EXISTS `xpcms_aa`;
CREATE TABLE `xpcms_aa` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(500) NOT NULL COMMENT '标题',
  `img` varchar(500) NOT NULL COMMENT '图片',
  `stitle` varchar(500) NOT NULL COMMENT '副标题',
  `content` text NOT NULL COMMENT '介绍',
  `status` tinyint(3) NOT NULL COMMENT '状态',
  `statu` tinyint(3) NOT NULL COMMENT '多选框',
  `stat` tinyint(3) NOT NULL COMMENT '下拉框',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of xpcms_aa
-- ----------------------------
INSERT INTO `xpcms_aa` VALUES ('1', '1212', '2323', '1212', '2323', '1', '0', '2');
INSERT INTO `xpcms_aa` VALUES ('2', '2323', '232332', '3434', '323', '0', '0', '1');
INSERT INTO `xpcms_aa` VALUES ('3', 'aaaa', 'adfa', 'bbbb', 'adfad', '0', '1', '2');

-- ----------------------------
-- Table structure for xpcms_admin
-- ----------------------------
DROP TABLE IF EXISTS `xpcms_admin`;
CREATE TABLE `xpcms_admin` (
  `id` smallint(10) NOT NULL AUTO_INCREMENT COMMENT '管理员id',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '管理员登录用户名',
  `password` varchar(255) NOT NULL DEFAULT '' COMMENT '管理员登录密码',
  `group_id` smallint(5) NOT NULL DEFAULT '1' COMMENT '管理员组ID',
  `real_name` varchar(255) NOT NULL DEFAULT '' COMMENT '管理员真名',
  `mobile` varchar(255) NOT NULL DEFAULT '' COMMENT '管理员手机号',
  `add_time` int(10) NOT NULL DEFAULT '0' COMMENT '管理员信息创建时间',
  `edit_time` int(10) NOT NULL DEFAULT '0' COMMENT '管理员信息修改时间',
  `login_lastip` varchar(16) NOT NULL DEFAULT '',
  `login_lasttime` int(10) NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `security_question` varchar(255) NOT NULL DEFAULT '' COMMENT '密保问题',
  `security_answer` varchar(255) NOT NULL DEFAULT '' COMMENT '密保答案',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '管理员状态 0 正常，1禁用',
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_name` (`username`) USING HASH,
  KEY `admin_status` (`status`,`edit_time`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='小皮CMS 管理员信息表';

-- ----------------------------
-- Records of xpcms_admin
-- ----------------------------
INSERT INTO `xpcms_admin` VALUES ('1', 'admin', '$2y$10$EWEAN2vfBCNINO97elISIOc/.PWnbEOS8ihfOpABmsOG.YXPwdiaG', '1', '超管', '13888888888', '1542281140', '1547194297', '127.0.0.1', '1583671654', '你的年龄', '199', '0');
INSERT INTO `xpcms_admin` VALUES ('2', 'root', 'f8905d99f21aacfa38b1f1420bd85c51', '2', '大管', '13999999999', '1547099176', '1547194256', '58.218.208.14', '1547099176', '你的手机尾号', '1234', '0');
INSERT INTO `xpcms_admin` VALUES ('3', 'sysop', 'd3b1f6609750d8dee770764f4b3f2a18', '2', '大刘', '13777777777', '1542336855', '1542336855', '58.218.208.14', '1547099176', '你是哪里人', '中国人', '0');
INSERT INTO `xpcms_admin` VALUES ('4', 'mg', 'd3b1f6609750d8dee770764f4b3f2a18', '2', '王键', '13893893437', '1542336855', '1542336855', '58.218.208.14', '1547099176', '你是男是女', '男的', '0');
INSERT INTO `xpcms_admin` VALUES ('8', 'lixudong', '7c5abde1b2004a48f90bd610acaead1b', '3', '李旭东', '13879456711', '1547195130', '1547195130', '', '0', '我是谁', '我是编辑', '1');
INSERT INTO `xpcms_admin` VALUES ('9', 'test', '', '1', '', '', '1', '1547197142', '', '0', '', '', '1');
INSERT INTO `xpcms_admin` VALUES ('10', 'test2', '', '1', '', '', '1', '1547197142', '', '0', '', '', '1');
INSERT INTO `xpcms_admin` VALUES ('11', 'wuzhi', '12dcd54a6a7dc81a9d51fa3a02073ebe', '5', '张伟芳', '13789034563', '1547197120', '1547197135', '', '0', '你好', '大家好', '1');
INSERT INTO `xpcms_admin` VALUES ('15', 'admin235324', '$2y$10$TOSFR/V64bjT1TPoOZ8rZegvwPfHCTSS2ZITbP97Uk4/6Y0ceYGza', '1', '', '', '1574171019', '1582269010', '', '0', '', '', '0');
INSERT INTO `xpcms_admin` VALUES ('18', 'admin001', '$2y$10$R/4FsJBrVcNs/GTHB6uDlOZT/mDwt3u9e2ugA6aFlP28gr87ykM3S', '1', '123', '123', '1582239581', '1582239581', '', '0', '', '', '0');
INSERT INTO `xpcms_admin` VALUES ('19', 'hong1', '$2y$10$weFc/wgQ9KDAd2P3Ht3V3epeJQ.BdogxzVJ.4dNVFbUF5oOgcMpQi', '2', '', '123', '1582268954', '1582268969', '127.0.0.1', '1582466028', '', '', '0');

-- ----------------------------
-- Table structure for xpcms_admin_group
-- ----------------------------
DROP TABLE IF EXISTS `xpcms_admin_group`;
CREATE TABLE `xpcms_admin_group` (
  `gid` smallint(5) NOT NULL AUTO_INCREMENT COMMENT '管理员组ID',
  `title` char(32) NOT NULL COMMENT '管理组别名(保存中文）',
  `rights` text NOT NULL COMMENT '管理员组权限',
  `add_time` int(10) NOT NULL COMMENT '管理员组创建时间',
  `edit_time` int(10) NOT NULL COMMENT '管理员组修改时间',
  `admin_id` int(10) NOT NULL COMMENT '最后操作管理员',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '管理员组状态 ：0正常，1禁用，2删除',
  PRIMARY KEY (`gid`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='小皮CMS 管理员组信息表';

-- ----------------------------
-- Records of xpcms_admin_group
-- ----------------------------
INSERT INTO `xpcms_admin_group` VALUES ('1', '超级管理员', '[1,7,8,2,21,211,213,215,214,290,216,22,288,23,24,241,242,243,254,255,276,25,251,252,264,265,266,267,270,271,3,32,287,277,278,279,4,41,296,297,298,43,299,300,301,44,5,253,262,263,56,57,6,258,268,269,291,292,280,281,293,294,295,308,309,311,302,303,304,305,306,307]', '1542281727', '1583676572', '1', '1');
INSERT INTO `xpcms_admin_group` VALUES ('2', '管理员组', '[1,7,8,2,21,211,213,215,25,252,264,265,266,267]', '1542281727', '1542336855', '0', '1');
INSERT INTO `xpcms_admin_group` VALUES ('3', '内容管理组', '[1,7,8,3,32]', '1542336855', '1547198630', '0', '1');
INSERT INTO `xpcms_admin_group` VALUES ('4', '会员管理组', '', '1542336855', '1542336855', '0', '1');
INSERT INTO `xpcms_admin_group` VALUES ('5', '系统设置组', '', '1542336855', '1542336855', '0', '1');
INSERT INTO `xpcms_admin_group` VALUES ('6', '运维组', '', '1542336855', '1542336855', '0', '1');
INSERT INTO `xpcms_admin_group` VALUES ('7', '新闻编辑2组', '', '0', '1547200393', '0', '-2');
INSERT INTO `xpcms_admin_group` VALUES ('8', '测试11', '', '1547199076', '1547200377', '0', '-2');
INSERT INTO `xpcms_admin_group` VALUES ('9', '测试abcd', '[1,7,8,2]', '1574343513', '1574343924', '1', '0');
INSERT INTO `xpcms_admin_group` VALUES ('10', '洪吉潮', '[1,7,8,2]', '1582466193', '1582466251', '1', '0');

-- ----------------------------
-- Table structure for xpcms_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `xpcms_admin_log`;
CREATE TABLE `xpcms_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '后台操作日记记录ID',
  `admin_id` int(10) NOT NULL COMMENT '后台操作日志管理员',
  `descs` varchar(255) NOT NULL COMMENT '具体操作内容',
  `add_time` int(10) NOT NULL COMMENT '日志时间',
  `ip` varchar(255) NOT NULL COMMENT '操作IP',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=404 DEFAULT CHARSET=utf8 COMMENT='后台操作日记记录表';

-- ----------------------------
-- Records of xpcms_admin_log
-- ----------------------------
INSERT INTO `xpcms_admin_log` VALUES ('164', '0', '系统设置', '1548400580', '217.93.86.40');
INSERT INTO `xpcms_admin_log` VALUES ('101', '0', '系统设置', '1548918979', '123.97.202.181');
INSERT INTO `xpcms_admin_log` VALUES ('102', '0', '更新缓存', '1548314179', '163.57.226.102');
INSERT INTO `xpcms_admin_log` VALUES ('103', '0', '用户管理', '1548918979', '182.226.243.11');
INSERT INTO `xpcms_admin_log` VALUES ('104', '0', '新闻管理', '1548659779', '156.94.68.143');
INSERT INTO `xpcms_admin_log` VALUES ('105', '0', '删除新闻', '1548659779', '125.13.52.236');
INSERT INTO `xpcms_admin_log` VALUES ('106', '0', '编辑用户', '1548573379', '245.29.104.202');
INSERT INTO `xpcms_admin_log` VALUES ('107', '0', '添加用户', '1548314179', '233.5.185.229');
INSERT INTO `xpcms_admin_log` VALUES ('108', '0', '系统设置', '1548400579', '134.231.11.53');
INSERT INTO `xpcms_admin_log` VALUES ('109', '0', '更新缓存', '1548314179', '37.225.162.207');
INSERT INTO `xpcms_admin_log` VALUES ('110', '0', '用户管理', '1548746179', '207.64.189.198');
INSERT INTO `xpcms_admin_log` VALUES ('111', '0', '新闻管理', '1548918979', '9.186.201.5');
INSERT INTO `xpcms_admin_log` VALUES ('112', '0', '删除新闻', '1548746179', '240.167.164.39');
INSERT INTO `xpcms_admin_log` VALUES ('113', '0', '编辑用户', '1548659779', '89.228.42.174');
INSERT INTO `xpcms_admin_log` VALUES ('114', '0', '添加用户', '1548832579', '129.122.117.233');
INSERT INTO `xpcms_admin_log` VALUES ('115', '0', '系统设置', '1548573379', '94.110.90.237');
INSERT INTO `xpcms_admin_log` VALUES ('116', '0', '更新缓存', '1548746179', '180.16.174.251');
INSERT INTO `xpcms_admin_log` VALUES ('117', '0', '用户管理', '1548486979', '107.161.79.243');
INSERT INTO `xpcms_admin_log` VALUES ('118', '0', '新闻管理', '1548486979', '163.1.88.139');
INSERT INTO `xpcms_admin_log` VALUES ('119', '0', '删除新闻', '1548486979', '143.9.10.65');
INSERT INTO `xpcms_admin_log` VALUES ('120', '0', '编辑用户', '1548573379', '127.230.113.168');
INSERT INTO `xpcms_admin_log` VALUES ('121', '0', '添加用户', '1548832579', '229.97.89.234');
INSERT INTO `xpcms_admin_log` VALUES ('122', '0', '系统设置', '1548832579', '39.170.67.194');
INSERT INTO `xpcms_admin_log` VALUES ('123', '0', '更新缓存', '1548746179', '105.40.143.131');
INSERT INTO `xpcms_admin_log` VALUES ('124', '0', '用户管理', '1548573379', '214.45.8.57');
INSERT INTO `xpcms_admin_log` VALUES ('125', '0', '新闻管理', '1548746179', '123.50.218.8');
INSERT INTO `xpcms_admin_log` VALUES ('126', '0', '删除新闻', '1548486979', '58.167.241.137');
INSERT INTO `xpcms_admin_log` VALUES ('127', '0', '编辑用户', '1548486979', '130.232.160.128');
INSERT INTO `xpcms_admin_log` VALUES ('128', '0', '添加用户', '1548746179', '28.100.26.205');
INSERT INTO `xpcms_admin_log` VALUES ('129', '0', '系统设置', '1548486979', '140.184.62.194');
INSERT INTO `xpcms_admin_log` VALUES ('130', '0', '更新缓存', '1548659779', '248.141.189.167');
INSERT INTO `xpcms_admin_log` VALUES ('131', '0', '用户管理', '1548832579', '238.78.235.175');
INSERT INTO `xpcms_admin_log` VALUES ('132', '0', '新闻管理', '1548918979', '118.117.120.8');
INSERT INTO `xpcms_admin_log` VALUES ('133', '0', '删除新闻', '1548573379', '195.88.135.150');
INSERT INTO `xpcms_admin_log` VALUES ('134', '0', '编辑用户', '1548573379', '161.4.146.203');
INSERT INTO `xpcms_admin_log` VALUES ('135', '0', '添加用户', '1548486979', '167.192.58.96');
INSERT INTO `xpcms_admin_log` VALUES ('136', '0', '系统设置', '1548400579', '97.225.186.39');
INSERT INTO `xpcms_admin_log` VALUES ('137', '0', '更新缓存', '1548746179', '17.127.157.112');
INSERT INTO `xpcms_admin_log` VALUES ('138', '0', '用户管理', '1548400579', '171.241.222.74');
INSERT INTO `xpcms_admin_log` VALUES ('139', '0', '新闻管理', '1548573379', '11.162.221.189');
INSERT INTO `xpcms_admin_log` VALUES ('140', '0', '删除新闻', '1548573379', '39.97.74.149');
INSERT INTO `xpcms_admin_log` VALUES ('141', '0', '编辑用户', '1548400579', '20.231.254.194');
INSERT INTO `xpcms_admin_log` VALUES ('142', '0', '添加用户', '1548573380', '191.188.68.68');
INSERT INTO `xpcms_admin_log` VALUES ('143', '0', '系统设置', '1548400580', '21.171.239.5');
INSERT INTO `xpcms_admin_log` VALUES ('144', '0', '更新缓存', '1548832580', '97.87.23.127');
INSERT INTO `xpcms_admin_log` VALUES ('145', '0', '用户管理', '1548314180', '197.192.242.81');
INSERT INTO `xpcms_admin_log` VALUES ('146', '0', '新闻管理', '1548400580', '38.74.128.75');
INSERT INTO `xpcms_admin_log` VALUES ('147', '0', '删除新闻', '1548659780', '53.231.194.234');
INSERT INTO `xpcms_admin_log` VALUES ('148', '0', '编辑用户', '1548486980', '180.24.202.195');
INSERT INTO `xpcms_admin_log` VALUES ('149', '0', '添加用户', '1548832580', '153.50.151.34');
INSERT INTO `xpcms_admin_log` VALUES ('150', '0', '系统设置', '1548314180', '182.44.108.55');
INSERT INTO `xpcms_admin_log` VALUES ('151', '0', '更新缓存', '1548573380', '54.103.86.49');
INSERT INTO `xpcms_admin_log` VALUES ('152', '0', '用户管理', '1548659780', '59.48.228.56');
INSERT INTO `xpcms_admin_log` VALUES ('153', '0', '新闻管理', '1548314180', '134.17.83.168');
INSERT INTO `xpcms_admin_log` VALUES ('154', '0', '删除新闻', '1548746180', '52.69.219.170');
INSERT INTO `xpcms_admin_log` VALUES ('155', '0', '编辑用户', '1548486980', '59.171.27.91');
INSERT INTO `xpcms_admin_log` VALUES ('156', '0', '添加用户', '1548659780', '208.77.238.111');
INSERT INTO `xpcms_admin_log` VALUES ('157', '0', '系统设置', '1548918980', '165.71.208.104');
INSERT INTO `xpcms_admin_log` VALUES ('158', '0', '更新缓存', '1548573380', '101.70.70.7');
INSERT INTO `xpcms_admin_log` VALUES ('159', '0', '用户管理', '1548659780', '51.161.126.99');
INSERT INTO `xpcms_admin_log` VALUES ('160', '0', '新闻管理', '1548314180', '253.136.45.81');
INSERT INTO `xpcms_admin_log` VALUES ('161', '0', '删除新闻', '1548918980', '54.75.124.44');
INSERT INTO `xpcms_admin_log` VALUES ('162', '0', '编辑用户', '1548746180', '37.76.133.103');
INSERT INTO `xpcms_admin_log` VALUES ('163', '0', '添加用户', '1548832580', '230.251.62.22');
INSERT INTO `xpcms_admin_log` VALUES ('165', '0', '更新缓存', '1548918980', '191.224.71.12');
INSERT INTO `xpcms_admin_log` VALUES ('166', '0', '用户管理', '1548400580', '23.170.204.41');
INSERT INTO `xpcms_admin_log` VALUES ('167', '0', '新闻管理', '1548573380', '126.31.76.240');
INSERT INTO `xpcms_admin_log` VALUES ('168', '0', '删除新闻', '1548314180', '29.148.238.189');
INSERT INTO `xpcms_admin_log` VALUES ('169', '0', '编辑用户', '1548573380', '32.121.22.50');
INSERT INTO `xpcms_admin_log` VALUES ('170', '0', '添加用户', '1548486980', '46.217.139.228');
INSERT INTO `xpcms_admin_log` VALUES ('171', '0', '系统设置', '1548400580', '195.244.170.200');
INSERT INTO `xpcms_admin_log` VALUES ('172', '0', '更新缓存', '1548659780', '115.158.38.166');
INSERT INTO `xpcms_admin_log` VALUES ('173', '0', '用户管理', '1548314180', '24.99.122.25');
INSERT INTO `xpcms_admin_log` VALUES ('174', '0', '新闻管理', '1548659780', '197.189.5.205');
INSERT INTO `xpcms_admin_log` VALUES ('175', '0', '删除新闻', '1548746180', '138.173.227.144');
INSERT INTO `xpcms_admin_log` VALUES ('176', '0', '编辑用户', '1548400580', '114.194.188.206');
INSERT INTO `xpcms_admin_log` VALUES ('177', '0', '添加用户', '1548659780', '152.218.150.173');
INSERT INTO `xpcms_admin_log` VALUES ('178', '0', '系统设置', '1548746180', '39.44.243.221');
INSERT INTO `xpcms_admin_log` VALUES ('179', '0', '更新缓存', '1548486980', '177.95.113.215');
INSERT INTO `xpcms_admin_log` VALUES ('180', '0', '用户管理', '1548659780', '129.8.111.22');
INSERT INTO `xpcms_admin_log` VALUES ('181', '0', '新闻管理', '1548832580', '191.171.21.9');
INSERT INTO `xpcms_admin_log` VALUES ('182', '0', '删除新闻', '1548918980', '71.165.246.158');
INSERT INTO `xpcms_admin_log` VALUES ('183', '0', '编辑用户', '1548918980', '199.111.189.240');
INSERT INTO `xpcms_admin_log` VALUES ('184', '0', '添加用户', '1548832580', '89.190.106.66');
INSERT INTO `xpcms_admin_log` VALUES ('185', '0', '系统设置', '1548659780', '36.102.2.57');
INSERT INTO `xpcms_admin_log` VALUES ('186', '0', '更新缓存', '1548832580', '67.121.87.58');
INSERT INTO `xpcms_admin_log` VALUES ('187', '0', '用户管理', '1548314180', '126.71.177.244');
INSERT INTO `xpcms_admin_log` VALUES ('188', '0', '新闻管理', '1548918980', '3.204.103.24');
INSERT INTO `xpcms_admin_log` VALUES ('189', '0', '删除新闻', '1548400580', '131.186.72.225');
INSERT INTO `xpcms_admin_log` VALUES ('190', '0', '编辑用户', '1548486980', '113.154.60.19');
INSERT INTO `xpcms_admin_log` VALUES ('191', '0', '添加用户', '1548314180', '108.91.236.136');
INSERT INTO `xpcms_admin_log` VALUES ('192', '0', '系统设置', '1548573380', '87.124.62.69');
INSERT INTO `xpcms_admin_log` VALUES ('193', '0', '更新缓存', '1548918980', '39.35.48.166');
INSERT INTO `xpcms_admin_log` VALUES ('194', '0', '用户管理', '1548659780', '205.216.128.232');
INSERT INTO `xpcms_admin_log` VALUES ('195', '0', '新闻管理', '1548918980', '43.212.144.26');
INSERT INTO `xpcms_admin_log` VALUES ('196', '0', '删除新闻', '1548573380', '106.169.137.24');
INSERT INTO `xpcms_admin_log` VALUES ('197', '0', '编辑用户', '1548918980', '86.191.38.221');
INSERT INTO `xpcms_admin_log` VALUES ('198', '0', '添加用户', '1548573380', '19.85.95.46');
INSERT INTO `xpcms_admin_log` VALUES ('199', '0', '系统设置', '1548314180', '121.208.124.199');
INSERT INTO `xpcms_admin_log` VALUES ('200', '0', '更新缓存', '1548659780', '74.89.122.196');
INSERT INTO `xpcms_admin_log` VALUES ('327', '1', '修改敏感词：《猎枪》,ID：1', '1565431688', '127.0.0.1');
INSERT INTO `xpcms_admin_log` VALUES ('328', '1', '修改敏感词：《猎枪》,ID：13', '1565431728', '127.0.0.1');
INSERT INTO `xpcms_admin_log` VALUES ('329', '1', '添加敏感词：《哈哈》,ID：14', '1565589493', '127.0.0.1');
INSERT INTO `xpcms_admin_log` VALUES ('330', '1', '修改导航菜单：《测试导航》,ID：11', '1565602271', '127.0.0.1');
INSERT INTO `xpcms_admin_log` VALUES ('331', '1', '修改导航菜单：《测试导航》,ID：11', '1565602278', '127.0.0.1');
INSERT INTO `xpcms_admin_log` VALUES ('332', '1', '修改导航菜单：《测试导航》,ID：11', '1565602384', '127.0.0.1');
INSERT INTO `xpcms_admin_log` VALUES ('333', '1', '修改导航菜单：《测试导航》,ID：11', '1565602420', '127.0.0.1');
INSERT INTO `xpcms_admin_log` VALUES ('334', '1', '修改导航菜单：《测试导航》,ID：11', '1565602424', '127.0.0.1');
INSERT INTO `xpcms_admin_log` VALUES ('335', '1', '添加导航菜单：《测试测试测试》,ID：13', '1565602580', '127.0.0.1');
INSERT INTO `xpcms_admin_log` VALUES ('336', '1', '修改导航菜单：《测试测试测试》,ID：13', '1565602695', '127.0.0.1');
INSERT INTO `xpcms_admin_log` VALUES ('337', '1', '修改导航菜单：《测试导航》,ID：11', '1565602770', '127.0.0.1');
INSERT INTO `xpcms_admin_log` VALUES ('338', '1', '删除菜单：《测试测试测试》,ID：13', '1565602847', '127.0.0.1');
INSERT INTO `xpcms_admin_log` VALUES ('339', '1', '修改分类：《图片》,ID：1', '1565662834', '127.0.0.1');
INSERT INTO `xpcms_admin_log` VALUES ('340', '1', '修改分类：《图片》,ID：1', '1565662880', '127.0.0.1');
INSERT INTO `xpcms_admin_log` VALUES ('341', '1', '修改分类：《图片》,ID：1', '1565662927', '127.0.0.1');
INSERT INTO `xpcms_admin_log` VALUES ('342', '1', '修改分类：《图片》,ID：1', '1565662937', '127.0.0.1');
INSERT INTO `xpcms_admin_log` VALUES ('343', '1', '修改分类：《图片》,ID：1', '1565662974', '127.0.0.1');
INSERT INTO `xpcms_admin_log` VALUES ('344', '1', '修改分类：《图片》,ID：1', '1565663004', '127.0.0.1');
INSERT INTO `xpcms_admin_log` VALUES ('345', '1', '修改分类：《图片》,ID：1', '1565666010', '127.0.0.1');
INSERT INTO `xpcms_admin_log` VALUES ('346', '1', '修改分类：《图片》,ID：1', '1565666133', '127.0.0.1');
INSERT INTO `xpcms_admin_log` VALUES ('347', '1', '修改分类：《图片》,ID：3', '1565666720', '127.0.0.1');
INSERT INTO `xpcms_admin_log` VALUES ('348', '1', '修改分类：《图片》,ID：3', '1565666787', '127.0.0.1');
INSERT INTO `xpcms_admin_log` VALUES ('349', '1', '修改分类：《图片》,ID：3', '1565666803', '127.0.0.1');
INSERT INTO `xpcms_admin_log` VALUES ('350', '1', '修改分类：《图片》,ID：3', '1566018743', '127.0.0.1');
INSERT INTO `xpcms_admin_log` VALUES ('351', '1', '修改分类：《图片》,ID：3', '1566018758', '127.0.0.1');
INSERT INTO `xpcms_admin_log` VALUES ('352', '1', '删除模型：《1212》,ID：22', '1566609862', '127.0.0.1');
INSERT INTO `xpcms_admin_log` VALUES ('353', '1', '修改模型：《视频新闻》,ID：5', '1566610161', '127.0.0.1');
INSERT INTO `xpcms_admin_log` VALUES ('354', '1', '删除模型：《新闻模型》,ID：19', '1566610195', '127.0.0.1');
INSERT INTO `xpcms_admin_log` VALUES ('355', '1', '修改模型：《单页》,ID：1', '1566610201', '127.0.0.1');
INSERT INTO `xpcms_admin_log` VALUES ('356', '1', '修改模型：《在线课程》,ID：6', '1566610342', '127.0.0.1');
INSERT INTO `xpcms_admin_log` VALUES ('357', '1', '删除模型：《列表》,ID：20', '1566610355', '127.0.0.1');
INSERT INTO `xpcms_admin_log` VALUES ('358', '1', '修改模型：《资讯》,ID：2', '1566610571', '127.0.0.1');
INSERT INTO `xpcms_admin_log` VALUES ('359', '1', '添加分类：《器材》,ID：20', '1566615868', '127.0.0.1');
INSERT INTO `xpcms_admin_log` VALUES ('360', '1', '添加分类：《大师》,ID：21', '1566625312', '127.0.0.1');
INSERT INTO `xpcms_admin_log` VALUES ('361', '1', '修改分类：《资讯看学》,ID：28', '1566803366', '127.0.0.1');
INSERT INTO `xpcms_admin_log` VALUES ('362', '1', '修改分类：《资讯看学》,ID：28', '1566803916', '127.0.0.1');
INSERT INTO `xpcms_admin_log` VALUES ('363', '1', '修改分类：《资讯看学》,ID：28', '1566803927', '127.0.0.1');
INSERT INTO `xpcms_admin_log` VALUES ('364', '1', '修改分类：《资讯看学》,ID：28', '1566803991', '127.0.0.1');
INSERT INTO `xpcms_admin_log` VALUES ('365', '1', '修改分类：《资讯看学》,ID：28', '1566804067', '127.0.0.1');
INSERT INTO `xpcms_admin_log` VALUES ('366', '1', '修改分类：《小皮头条》,ID：29', '1566804079', '127.0.0.1');
INSERT INTO `xpcms_admin_log` VALUES ('367', '1', '修改分类：《今日资讯》,ID：30', '1566804087', '127.0.0.1');
INSERT INTO `xpcms_admin_log` VALUES ('368', '1', '修改分类：《图集大全》,ID：35', '1566804094', '127.0.0.1');
INSERT INTO `xpcms_admin_log` VALUES ('369', '1', '修改角色：《内容管理组》,ID：3', '1573738043', '127.0.0.1');
INSERT INTO `xpcms_admin_log` VALUES ('370', '1', '修改角色：《管理员组》,ID：2', '1574083270', '127.0.0.1');
INSERT INTO `xpcms_admin_log` VALUES ('371', '1', '修改角色：《管理员组》,ID：2', '1574083284', '127.0.0.1');
INSERT INTO `xpcms_admin_log` VALUES ('372', '1', '添加后台菜单：《管理员保存》,ID：270', '1574170775', '127.0.0.1');
INSERT INTO `xpcms_admin_log` VALUES ('373', '1', '修改角色：《超级管理员》,ID：1', '1574170791', '127.0.0.1');
INSERT INTO `xpcms_admin_log` VALUES ('374', '1', '添加后台菜单：《管理员删除》,ID：271', '1574172391', '127.0.0.1');
INSERT INTO `xpcms_admin_log` VALUES ('375', '1', '修改角色：《超级管理员》,ID：1', '1574172420', '127.0.0.1');
INSERT INTO `xpcms_admin_log` VALUES ('376', '1', '修改角色：《超级管理员》,ID：1', '1574254799', '127.0.0.1');
INSERT INTO `xpcms_admin_log` VALUES ('377', '1', '修改角色：《超级管理员》,ID：1', '1574256938', '127.0.0.1');
INSERT INTO `xpcms_admin_log` VALUES ('378', '1', '修改角色：《超级管理员》,ID：1', '1574256973', '127.0.0.1');
INSERT INTO `xpcms_admin_log` VALUES ('379', '1', '修改角色：《超级管理员》,ID：1', '1574257114', '127.0.0.1');
INSERT INTO `xpcms_admin_log` VALUES ('380', '1', '添加后台菜单：《保存设置》,ID：276', '1574345029', '127.0.0.1');
INSERT INTO `xpcms_admin_log` VALUES ('381', '1', '修改角色：《超级管理员》,ID：1', '1574345037', '127.0.0.1');
INSERT INTO `xpcms_admin_log` VALUES ('382', '1', '添加后台菜单：《内容添加》,ID：277', '1574688286', '127.0.0.1');
INSERT INTO `xpcms_admin_log` VALUES ('383', '1', '修改角色：《超级管理员》,ID：1', '1574688295', '127.0.0.1');
INSERT INTO `xpcms_admin_log` VALUES ('384', '1', '添加后台菜单：《内容保存》,ID：278', '1574689460', '127.0.0.1');
INSERT INTO `xpcms_admin_log` VALUES ('385', '1', '修改角色：《超级管理员》,ID：1', '1574689467', '127.0.0.1');
INSERT INTO `xpcms_admin_log` VALUES ('386', '1', '添加后台菜单：《图片上传》,ID：279', '1574772278', '127.0.0.1');
INSERT INTO `xpcms_admin_log` VALUES ('387', '1', '修改角色：《超级管理员》,ID：1', '1574772293', '127.0.0.1');
INSERT INTO `xpcms_admin_log` VALUES ('388', '1', '添加后台菜单：《商品管理》,ID：280', '1575029302', '127.0.0.1');
INSERT INTO `xpcms_admin_log` VALUES ('389', '1', '添加后台菜单：《商品列表》,ID：281', '1575029323', '127.0.0.1');
INSERT INTO `xpcms_admin_log` VALUES ('390', '1', '修改角色：《超级管理员》,ID：1', '1575029335', '127.0.0.1');
INSERT INTO `xpcms_admin_log` VALUES ('391', '1', '添加模型：《商城模型》,ID：23', '1575030502', '127.0.0.1');
INSERT INTO `xpcms_admin_log` VALUES ('392', '1', '添加后台菜单：《内容删除》,ID：287', '1582631374', '127.0.0.1');
INSERT INTO `xpcms_admin_log` VALUES ('393', '1', '修改角色：《超级管理员》,ID：1', '1582631392', '127.0.0.1');
INSERT INTO `xpcms_admin_log` VALUES ('394', '1', '添加后台菜单：《GD检测》,ID：288', '1582792406', '127.0.0.1');
INSERT INTO `xpcms_admin_log` VALUES ('395', '1', '添加后台菜单：《GD检测》,ID：289', '1582792407', '127.0.0.1');
INSERT INTO `xpcms_admin_log` VALUES ('396', '1', '添加后台菜单：《编辑分类》,ID：291', '1582885625', '127.0.0.1');
INSERT INTO `xpcms_admin_log` VALUES ('397', '1', '修改角色：《超级管理员》,ID：1', '1582885639', '127.0.0.1');
INSERT INTO `xpcms_admin_log` VALUES ('398', '1', '添加后台菜单：《保存分类》,ID：292', '1582893235', '127.0.0.1');
INSERT INTO `xpcms_admin_log` VALUES ('399', '1', '修改角色：《超级管理员》,ID：1', '1582893245', '127.0.0.1');
INSERT INTO `xpcms_admin_log` VALUES ('400', '1', '添加后台菜单：《用户组编辑》,ID：299', '1583330256', '127.0.0.1');
INSERT INTO `xpcms_admin_log` VALUES ('401', '1', '添加后台菜单：《用户组保存》,ID：300', '1583330276', '127.0.0.1');
INSERT INTO `xpcms_admin_log` VALUES ('402', '1', '添加后台菜单：《用户组删除》,ID：301', '1583330295', '127.0.0.1');
INSERT INTO `xpcms_admin_log` VALUES ('403', '1', '修改角色：《超级管理员》,ID：1', '1583330308', '127.0.0.1');

-- ----------------------------
-- Table structure for xpcms_admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `xpcms_admin_menu`;
CREATE TABLE `xpcms_admin_menu` (
  `mid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '后台菜单ID',
  `title` char(32) NOT NULL DEFAULT '' COMMENT '后台菜单名称',
  `pid` int(10) NOT NULL DEFAULT '0' COMMENT '父级ID',
  `controller` varchar(50) NOT NULL DEFAULT '' COMMENT 'class',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT 'function',
  `level` smallint(6) NOT NULL DEFAULT '0' COMMENT '等级',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1= 左侧菜单 \r\n2= 顶部+左侧联机菜单（以pid 为0 为基准）\r\n3= 顶部工具按钮\r\n4= 纯顶部下拉菜单',
  `folder` tinyint(1) NOT NULL DEFAULT '0',
  `icon` varchar(255) NOT NULL DEFAULT '' COMMENT '菜单图标',
  `jump_is` tinyint(1) NOT NULL DEFAULT '0',
  `jump` varchar(255) NOT NULL DEFAULT '' COMMENT '后台菜单链接',
  `jump_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1= hash jump 2 相对跳转， 3，外站跳转',
  `jump_target` varchar(16) NOT NULL DEFAULT '',
  `ord` tinyint(3) NOT NULL DEFAULT '0' COMMENT '菜单排序',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '菜单数据创建时间',
  `edit_time` int(10) NOT NULL DEFAULT '0' COMMENT '菜单数据修改时间',
  `admin_id` int(10) NOT NULL DEFAULT '0' COMMENT '操作管理员',
  `ishidden` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否隐藏',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '菜单状态',
  PRIMARY KEY (`mid`)
) ENGINE=MyISAM AUTO_INCREMENT=312 DEFAULT CHARSET=utf8 COMMENT='后台管理 - - 左侧菜单';

-- ----------------------------
-- Records of xpcms_admin_menu
-- ----------------------------
INSERT INTO `xpcms_admin_menu` VALUES ('1', '管理首页', '0', 'Home', 'index', '1', '0', '0', '', '1', '/index', '1', '', '1', '1545809412', '1545809412', '0', '1', '0');
INSERT INTO `xpcms_admin_menu` VALUES ('2', '网站设置', '0', 'Site', '', '1', '0', '1', 'phpcn-icon-icon_shezhi', '0', '', '1', '', '2', '1545809412', '1545809412', '0', '0', '0');
INSERT INTO `xpcms_admin_menu` VALUES ('21', '基本设置', '2', 'Site', 'index', '2', '0', '1', '', '0', '', '1', '', '3', '1545809412', '1545809412', '0', '0', '0');
INSERT INTO `xpcms_admin_menu` VALUES ('211', '网站设置', '21', 'Site', '', '3', '0', '0', '', '1', 'temp/admin_site_set_base', '1', '', '4', '1545809412', '1545809412', '0', '0', '0');
INSERT INTO `xpcms_admin_menu` VALUES ('213', '安全配置', '21', 'Site', '', '3', '0', '0', '', '1', 'temp/admin_site_set_security', '1', '', '6', '1545809412', '1545809412', '0', '0', '0');
INSERT INTO `xpcms_admin_menu` VALUES ('214', '邮箱配置', '2', 'Site', 'email', '3', '0', '0', '', '1', 'temp/admin_site_set_email', '1', '', '7', '1545809412', '1545809412', '0', '0', '0');
INSERT INTO `xpcms_admin_menu` VALUES ('215', '第三方登录配置', '21', 'Site', '', '3', '0', '0', '', '1', 'temp/admin_site_set_oauth', '1', '', '8', '1545809412', '1545809412', '0', '0', '0');
INSERT INTO `xpcms_admin_menu` VALUES ('216', '手机短信配置', '2', 'Site', 'sms', '2', '0', '0', '', '1', 'temp/admin_site_set_sms_list', '1', '', '9', '1545809412', '1545809412', '0', '1', '0');
INSERT INTO `xpcms_admin_menu` VALUES ('22', '附件配置', '2', 'Site', 'annex', '2', '0', '0', '', '1', 'temp/admin_site_set_ext', '1', '', '10', '1545809412', '1545809412', '0', '0', '0');
INSERT INTO `xpcms_admin_menu` VALUES ('23', '微信公众号配置', '2', 'Site', 'wechat', '2', '0', '0', '', '1', 'temp/admin_site_set_weixin_list', '1', '', '11', '1545809412', '1545809412', '0', '0', '0');
INSERT INTO `xpcms_admin_menu` VALUES ('24', '小程序配置', '2', 'Site', 'program', '3', '0', '1', '', '0', '', '1', '', '12', '1545809412', '1545809412', '0', '1', '0');
INSERT INTO `xpcms_admin_menu` VALUES ('241', '微信小程序', '24', 'Site', '', '3', '0', '0', '', '1', 'temp/admin_site_set_tinypro_weixin_list', '1', '', '13', '1545809412', '1545809412', '0', '1', '0');
INSERT INTO `xpcms_admin_menu` VALUES ('242', '支付宝小程序', '24', 'Site', '', '3', '0', '0', '', '1', 'temp/admin_site_set_tinypro_alipay_list', '1', '', '14', '1545809412', '1545809412', '0', '1', '0');
INSERT INTO `xpcms_admin_menu` VALUES ('243', '头条小程序 ', '24', 'Site', '', '3', '0', '0', '', '1', 'temp/admin_site_set_tinypro_toutiao_list', '1', '', '15', '1545809412', '1545809412', '0', '1', '0');
INSERT INTO `xpcms_admin_menu` VALUES ('25', '管理员管理', '0', '', '', '2', '0', '1', '', '0', '', '1', '', '16', '1545809412', '1545809412', '0', '0', '0');
INSERT INTO `xpcms_admin_menu` VALUES ('251', '管理员列表', '25', 'Admin', 'index', '3', '0', '0', '', '1', 'temp/admin_admin_user_list', '1', '', '17', '1545809412', '1545809412', '0', '0', '0');
INSERT INTO `xpcms_admin_menu` VALUES ('252', '角色管理', '25', 'Groups', 'index', '3', '0', '0', '', '1', 'temp/admin_admin_group_list', '1', '', '18', '1545809412', '1545809412', '0', '0', '0');
INSERT INTO `xpcms_admin_menu` VALUES ('253', '后台菜单', '5', 'Menus', 'index', '3', '0', '0', '', '1', 'temp/admin_admin_priv_list', '1', '', '19', '1545809412', '1545809412', '0', '0', '0');
INSERT INTO `xpcms_admin_menu` VALUES ('3', '内容管理', '0', 'Content', '', '1', '0', '1', 'phpcn-icon-jishufuwu', '0', '', '1', '', '20', '1545809412', '1545809412', '0', '0', '0');
INSERT INTO `xpcms_admin_menu` VALUES ('269', '分类管理', '268', 'Category', 'index', '2', '0', '0', '', '1', 'temp/admin_content_category_list', '1', '', '21', '1545809412', '1545809412', '0', '0', '0');
INSERT INTO `xpcms_admin_menu` VALUES ('32', '内容管理', '3', 'Content', 'index', '2', '0', '0', '', '1', 'temp/admin_content_news_list', '1', '', '22', '1545809412', '1545809412', '0', '0', '0');
INSERT INTO `xpcms_admin_menu` VALUES ('4', '用户管理', '0', 'User', '', '1', '0', '1', 'phpcn-icon-huiyuan2', '0', '', '1', '', '23', '1545809412', '1545809412', '0', '0', '0');
INSERT INTO `xpcms_admin_menu` VALUES ('41', '用户列表', '4', 'Users', 'index', '2', '0', '0', '', '1', 'temp/admin_user_user_list', '1', '', '24', '1545809412', '1545809412', '0', '0', '0');
INSERT INTO `xpcms_admin_menu` VALUES ('42', '审核用户', '4', 'Users', 'check', '2', '0', '0', '', '1', 'temp/admin_user_audi_list', '1', '', '25', '1545809412', '1545809412', '0', '1', '1');
INSERT INTO `xpcms_admin_menu` VALUES ('43', '用户组', '4', 'Usergroups', 'index', '2', '0', '0', '', '1', 'temp/admin_user_group_list', '1', '', '26', '1545809412', '1545809412', '0', '0', '0');
INSERT INTO `xpcms_admin_menu` VALUES ('44', '用户配置', '4', 'Site', 'user', '2', '0', '0', '', '1', 'temp/admin_user_set', '1', '', '27', '1545809412', '1545809412', '0', '0', '0');
INSERT INTO `xpcms_admin_menu` VALUES ('5', '扩展管理', '0', '', '', '1', '0', '1', 'phpcn-icon-fujian', '0', '', '1', '', '38', '1545809412', '1545809412', '0', '0', '0');
INSERT INTO `xpcms_admin_menu` VALUES ('51', '导航菜单', '5', 'Extension', 'nav', '2', '0', '0', '', '1', 'temp/admin_extend_menu_front_list', '1', '', '29', '1545809412', '1545809412', '0', '1', '1');
INSERT INTO `xpcms_admin_menu` VALUES ('53', '来源管理', '5', 'Sources', 'index', '2', '0', '0', '', '1', 'temp/admin_extend_from_org_list', '1', '', '31', '1545809412', '1545809412', '0', '1', '1');
INSERT INTO `xpcms_admin_menu` VALUES ('54', '更新全站缓存 ', '5', '', '', '2', '0', '0', '', '1', 'temp/admin_extend_cache_clear', '1', '', '32', '1545809412', '1545809412', '0', '0', '1');
INSERT INTO `xpcms_admin_menu` VALUES ('55', 'URL规则管理', '5', 'Urlrules', 'index', '2', '0', '0', '', '1', 'temp/admin_extend_url_manager', '1', '', '33', '1545809412', '1545809412', '0', '1', '1');
INSERT INTO `xpcms_admin_menu` VALUES ('56', '数据库工具', '5', '', '', '2', '0', '0', '', '1', 'temp/admin_extend_db_tools', '1', '', '34', '1545809412', '1545809412', '0', '1', '0');
INSERT INTO `xpcms_admin_menu` VALUES ('57', '敏感词管理', '5', 'Extension', 'badword', '2', '0', '0', '', '1', 'temp/admin_extend_sensitive_list', '1', '', '35', '1545809412', '1545809412', '0', '0', '0');
INSERT INTO `xpcms_admin_menu` VALUES ('58', '后台操作日志', '5', 'Extension', 'logs', '2', '0', '0', '', '1', 'temp/admin_extend_log_back_log_list', '1', '', '36', '1545809412', '1545809412', '0', '1', '1');
INSERT INTO `xpcms_admin_menu` VALUES ('6', '版本信息', '0', '', '', '1', '0', '0', '', '1', 'temp/admin_common_cp', '1', '', '40', '1545809412', '1545809412', '0', '1', '0');
INSERT INTO `xpcms_admin_menu` VALUES ('7', '后台欢迎页', '1', 'Home', 'welcome', '0', '1', '0', '', '0', '', '1', '', '0', '0', '0', '0', '1', '0');
INSERT INTO `xpcms_admin_menu` VALUES ('8', '后台主菜单', '1', 'Home', 'ajax_get_left_menu', '0', '1', '0', '', '0', '', '1', '', '0', '0', '0', '0', '1', '0');
INSERT INTO `xpcms_admin_menu` VALUES ('254', 'SEO设置', '2', 'Site', 'seo', '0', '1', '0', '', '0', '', '1', '', '0', '0', '0', '0', '0', '0');
INSERT INTO `xpcms_admin_menu` VALUES ('255', '安全设置', '2', 'Site', 'security', '0', '1', '0', '', '0', '', '1', '', '0', '0', '0', '0', '0', '0');
INSERT INTO `xpcms_admin_menu` VALUES ('257', '模型管理', '0', 'Model', '', '1', '0', '0', '', '0', '', '1', '', '18', '1545809412', '1545809412', '0', '1', '1');
INSERT INTO `xpcms_admin_menu` VALUES ('258', '模型管理', '257', 'Model', 'index', '2', '0', '0', '', '0', '', '1', '', '0', '1545809412', '1545809412', '0', '0', '0');
INSERT INTO `xpcms_admin_menu` VALUES ('262', '菜单添加', '253', 'Menus', 'add', '0', '1', '0', '', '0', '', '1', '', '0', '0', '0', '0', '0', '0');
INSERT INTO `xpcms_admin_menu` VALUES ('263', '菜单保存', '253', 'Menus', 'save', '0', '1', '0', '', '0', '', '1', '', '0', '0', '0', '0', '0', '0');
INSERT INTO `xpcms_admin_menu` VALUES ('264', '角色修改', '25', 'groups', 'add', '0', '1', '0', '', '0', '', '1', '', '0', '0', '0', '0', '1', '0');
INSERT INTO `xpcms_admin_menu` VALUES ('265', '删除菜单', '25', 'Menus', 'delete', '0', '1', '0', '', '0', '', '1', '', '0', '0', '0', '0', '1', '0');
INSERT INTO `xpcms_admin_menu` VALUES ('266', '管理员添加', '25', 'Admin', 'add', '0', '1', '0', '', '0', '', '1', '', '0', '0', '0', '0', '1', '0');
INSERT INTO `xpcms_admin_menu` VALUES ('267', '角色保存', '25', 'Groups', 'save', '0', '1', '0', '', '0', '', '1', '', '0', '0', '0', '0', '1', '0');
INSERT INTO `xpcms_admin_menu` VALUES ('268', '分类管理', '0', 'Category', '', '0', '1', '0', '', '0', '', '1', '', '19', '0', '0', '0', '0', '0');
INSERT INTO `xpcms_admin_menu` VALUES ('59', '友情链接', '5', 'Extension', 'fslink', '2', '0', '0', '', '1', '', '1', '', '31', '1545809412', '1545809412', '0', '1', '1');
INSERT INTO `xpcms_admin_menu` VALUES ('270', '管理员保存', '25', 'Admin', 'save', '0', '1', '0', '', '0', '', '1', '', '0', '0', '0', '0', '1', '0');
INSERT INTO `xpcms_admin_menu` VALUES ('271', '管理员删除', '25', 'Admin', 'del', '0', '1', '0', '', '0', '', '1', '', '0', '0', '0', '0', '1', '0');
INSERT INTO `xpcms_admin_menu` VALUES ('287', '内容删除', '3', 'Content', 'del', '0', '1', '0', '', '0', '', '1', '', '23', '0', '0', '0', '1', '0');
INSERT INTO `xpcms_admin_menu` VALUES ('277', '内容添加', '3', 'Content', 'add', '0', '1', '0', '', '0', '', '1', '', '0', '0', '0', '0', '1', '0');
INSERT INTO `xpcms_admin_menu` VALUES ('276', '保存设置', '2', 'Site', 'save', '0', '1', '0', '', '0', '', '1', '', '0', '0', '0', '0', '1', '0');
INSERT INTO `xpcms_admin_menu` VALUES ('278', '内容保存', '3', 'Content', 'save', '0', '1', '0', '', '0', '', '1', '', '0', '0', '0', '0', '1', '0');
INSERT INTO `xpcms_admin_menu` VALUES ('279', '图片上传', '3', 'Image', 'index', '0', '1', '0', '', '0', '', '1', '', '0', '0', '0', '0', '1', '0');
INSERT INTO `xpcms_admin_menu` VALUES ('280', '商品管理', '0', '', '', '0', '1', '0', '', '0', '', '1', '', '5', '0', '0', '0', '0', '0');
INSERT INTO `xpcms_admin_menu` VALUES ('281', '商品列表', '280', 'Products', 'index', '0', '1', '0', '', '0', '', '1', '', '0', '0', '0', '0', '0', '0');
INSERT INTO `xpcms_admin_menu` VALUES ('288', 'GD检测', '22', 'Site', 'check_gd', '0', '1', '0', '', '0', '', '1', '', '0', '0', '0', '0', '1', '0');
INSERT INTO `xpcms_admin_menu` VALUES ('290', '邮箱测试', '214', 'Site', 'check_email', '0', '1', '0', '', '0', '', '1', '', '0', '0', '0', '0', '1', '0');
INSERT INTO `xpcms_admin_menu` VALUES ('291', '编辑分类', '269', 'Category', 'add', '0', '1', '0', '', '0', '', '1', '', '0', '0', '0', '0', '1', '0');
INSERT INTO `xpcms_admin_menu` VALUES ('292', '保存分类', '269', 'Category', 'save', '0', '1', '0', '', '0', '', '1', '', '0', '0', '0', '0', '1', '0');
INSERT INTO `xpcms_admin_menu` VALUES ('293', '商品编辑', '280', 'Products', 'add', '0', '1', '0', '', '0', '', '1', '', '0', '0', '0', '0', '1', '0');
INSERT INTO `xpcms_admin_menu` VALUES ('294', '图片上传', '280', 'Image', 'shop', '0', '1', '0', '', '0', '', '1', '', '0', '0', '0', '0', '1', '0');
INSERT INTO `xpcms_admin_menu` VALUES ('295', '商品保存', '280', 'Products', 'save', '0', '1', '0', '', '0', '', '1', '', '0', '0', '0', '0', '1', '0');
INSERT INTO `xpcms_admin_menu` VALUES ('296', '编辑用户', '41', 'Users', 'add', '0', '1', '0', '', '0', '', '1', '', '0', '0', '0', '0', '1', '0');
INSERT INTO `xpcms_admin_menu` VALUES ('297', '用户保存', '41', 'Users', 'save', '0', '1', '0', '', '0', '', '1', '', '0', '0', '0', '0', '1', '0');
INSERT INTO `xpcms_admin_menu` VALUES ('298', '删除用户', '41', 'Users', 'del', '0', '1', '0', '', '0', '', '1', '', '0', '0', '0', '0', '1', '0');
INSERT INTO `xpcms_admin_menu` VALUES ('299', '用户组编辑', '43', 'Usergroups', 'add', '0', '1', '0', '', '0', '', '1', '', '0', '0', '0', '0', '1', '0');
INSERT INTO `xpcms_admin_menu` VALUES ('300', '用户组保存', '43', 'Usergroups', 'save', '0', '1', '0', '', '0', '', '1', '', '0', '0', '0', '0', '1', '0');
INSERT INTO `xpcms_admin_menu` VALUES ('301', '用户组删除', '43', 'Usergroups', 'del', '0', '1', '0', '', '0', '', '1', '', '0', '0', '0', '0', '1', '0');
INSERT INTO `xpcms_admin_menu` VALUES ('302', '笔记管理', '0', '', '', '0', '1', '0', '', '0', '', '1', '', '28', '0', '0', '0', '0', '0');
INSERT INTO `xpcms_admin_menu` VALUES ('303', '笔记列表', '302', 'Notes', 'index', '0', '1', '0', '', '0', '', '1', '', '0', '0', '0', '0', '0', '0');
INSERT INTO `xpcms_admin_menu` VALUES ('304', '笔记编辑', '302', 'Notes', 'add', '0', '1', '0', '', '0', '', '1', '', '0', '0', '0', '0', '1', '0');
INSERT INTO `xpcms_admin_menu` VALUES ('305', '笔记保存', '302', 'Notes', 'save', '0', '1', '0', '', '0', '', '1', '', '0', '0', '0', '0', '1', '0');
INSERT INTO `xpcms_admin_menu` VALUES ('306', '笔记删除', '302', 'Notes', 'del', '0', '1', '0', '', '0', '', '1', '', '0', '0', '0', '0', '1', '0');
INSERT INTO `xpcms_admin_menu` VALUES ('307', '图片上传', '302', 'Image', 'note', '0', '1', '0', '', '0', '', '1', '', '0', '0', '0', '0', '1', '0');
INSERT INTO `xpcms_admin_menu` VALUES ('308', '订单列表', '280', 'Products', 'orderlists', '0', '1', '0', '', '0', '', '1', '', '0', '0', '0', '0', '0', '0');
INSERT INTO `xpcms_admin_menu` VALUES ('309', '订单编辑', '280', 'Order', 'add', '0', '1', '0', '', '0', '', '1', '', '0', '0', '0', '0', '1', '0');
INSERT INTO `xpcms_admin_menu` VALUES ('311', '订单保存', '280', 'Order', 'save', '0', '1', '0', '', '0', '', '1', '', '0', '0', '0', '0', '1', '0');

-- ----------------------------
-- Table structure for xpcms_admin_priv
-- ----------------------------
DROP TABLE IF EXISTS `xpcms_admin_priv`;
CREATE TABLE `xpcms_admin_priv` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '权限ID',
  `title` varchar(80) NOT NULL COMMENT '权限名称',
  `gid` int(10) NOT NULL COMMENT '所属控制器分组',
  `rights` text NOT NULL COMMENT '具体权限',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=82 DEFAULT CHARSET=utf8 COMMENT='权限字典表';

-- ----------------------------
-- Records of xpcms_admin_priv
-- ----------------------------
INSERT INTO `xpcms_admin_priv` VALUES ('1', '管理员编辑', '0', 'admin@useredit');
INSERT INTO `xpcms_admin_priv` VALUES ('2', '管理员详情', '0', 'admin@userdetail');
INSERT INTO `xpcms_admin_priv` VALUES ('3', '管理员添加', '0', 'admin@useradd');
INSERT INTO `xpcms_admin_priv` VALUES ('4', '管理员密码修改', '0', 'admin@userpwd');
INSERT INTO `xpcms_admin_priv` VALUES ('5', '管理员删除', '0', 'admin@usersave');
INSERT INTO `xpcms_admin_priv` VALUES ('6', '管理组列表', '0', 'admin@grouplist');
INSERT INTO `xpcms_admin_priv` VALUES ('7', '管理组编辑', '0', 'admin@groupedit');
INSERT INTO `xpcms_admin_priv` VALUES ('8', '管理组详情', '0', 'admin@groupdetail');
INSERT INTO `xpcms_admin_priv` VALUES ('9', '管理组添加', '0', 'admin@groupadd');
INSERT INTO `xpcms_admin_priv` VALUES ('10', '管理组删除', '0', 'admin@groupsave');
INSERT INTO `xpcms_admin_priv` VALUES ('11', '权限字典列表', '0', 'admin@privlist');
INSERT INTO `xpcms_admin_priv` VALUES ('12', '权限字典添加', '0', 'admin@privadd');
INSERT INTO `xpcms_admin_priv` VALUES ('13', '权限字典编辑', '0', 'admin@privedit');
INSERT INTO `xpcms_admin_priv` VALUES ('14', '权限字典详情', '0', 'admin@privdetail');
INSERT INTO `xpcms_admin_priv` VALUES ('15', '频道分类列表', '0', 'content@categorylist');
INSERT INTO `xpcms_admin_priv` VALUES ('16', '频道分类添加', '0', 'content@categoryadd');
INSERT INTO `xpcms_admin_priv` VALUES ('17', '频道分类编辑', '0', 'content@categoryedit');
INSERT INTO `xpcms_admin_priv` VALUES ('18', '频道分类详情', '0', 'content@categorydetail');
INSERT INTO `xpcms_admin_priv` VALUES ('19', '文章列表', '0', 'content@newslist');
INSERT INTO `xpcms_admin_priv` VALUES ('20', '文章编辑', '0', 'content@newsedit');
INSERT INTO `xpcms_admin_priv` VALUES ('21', '文章详情', '0', 'content@newsdetail');
INSERT INTO `xpcms_admin_priv` VALUES ('22', '文章添加', '0', 'content@newsadd');
INSERT INTO `xpcms_admin_priv` VALUES ('23', '前台导航列表', '0', 'extend@menufrontlist');
INSERT INTO `xpcms_admin_priv` VALUES ('24', '前台导航添加', '0', 'extend@menufrontadd');
INSERT INTO `xpcms_admin_priv` VALUES ('25', '前台导航编辑', '0', 'extend@menufrontedit');
INSERT INTO `xpcms_admin_priv` VALUES ('26', '前台导航详情', '0', 'extend@menufrontdetail');
INSERT INTO `xpcms_admin_priv` VALUES ('27', '前台导航删除', '0', 'extend@menufrontsave');
INSERT INTO `xpcms_admin_priv` VALUES ('28', '后台菜单列表', '0', 'extend@menubacklist');
INSERT INTO `xpcms_admin_priv` VALUES ('29', '后台菜单编辑', '0', 'extend@menubackedit');
INSERT INTO `xpcms_admin_priv` VALUES ('30', '后台菜单详情', '0', 'extend@menubackdetail');
INSERT INTO `xpcms_admin_priv` VALUES ('31', '后台菜单添加', '0', 'extend@menubackadd');
INSERT INTO `xpcms_admin_priv` VALUES ('32', '新闻来源列表', '0', 'extend@fromorglist');
INSERT INTO `xpcms_admin_priv` VALUES ('33', '新闻来源编辑', '0', 'extend@fromorgedit');
INSERT INTO `xpcms_admin_priv` VALUES ('34', '新闻来源详情', '0', 'extend@fromorgdetail');
INSERT INTO `xpcms_admin_priv` VALUES ('35', '新闻来源添加', '0', 'extend@fromorgadd');
INSERT INTO `xpcms_admin_priv` VALUES ('36', '新闻来源删除', '0', 'extend@fromorgsave');
INSERT INTO `xpcms_admin_priv` VALUES ('37', '清除站点缓存', '0', 'extend@cacheclear');
INSERT INTO `xpcms_admin_priv` VALUES ('38', 'URL规则详情', '0', 'extend@urlmanagerdetail');
INSERT INTO `xpcms_admin_priv` VALUES ('39', 'URL规则编辑', '0', 'extend@urlmanageredit');
INSERT INTO `xpcms_admin_priv` VALUES ('40', '数据库工具', '0', 'extend@dbtoolsdetail');
INSERT INTO `xpcms_admin_priv` VALUES ('42', '敏感词列表', '0', 'extend@sensitivelist');
INSERT INTO `xpcms_admin_priv` VALUES ('43', '敏感词添加', '0', 'extend@sensitiveadd');
INSERT INTO `xpcms_admin_priv` VALUES ('44', '敏感词编辑', '0', 'extend@sensitiveedit');
INSERT INTO `xpcms_admin_priv` VALUES ('45', '敏感词详情', '0', 'extend@sensitivedetail');
INSERT INTO `xpcms_admin_priv` VALUES ('46', '敏感词删除', '0', 'extend@sensitivesave');
INSERT INTO `xpcms_admin_priv` VALUES ('47', '敏感词', '0', 'extend@sensitiveimport');
INSERT INTO `xpcms_admin_priv` VALUES ('48', '后台日志列表', '0', 'extend@logbackloglist');
INSERT INTO `xpcms_admin_priv` VALUES ('49', '站点配置详情', '0', 'site@setbasedetail');
INSERT INTO `xpcms_admin_priv` VALUES ('50', '站点配置编辑', '0', 'site@setbaseedit');
INSERT INTO `xpcms_admin_priv` VALUES ('51', 'SEO配置详情', '0', 'site@setseodetail');
INSERT INTO `xpcms_admin_priv` VALUES ('52', 'SEO配置编辑', '0', 'site@setseoedit');
INSERT INTO `xpcms_admin_priv` VALUES ('53', '安全配置详情', '0', 'site@setsecuritydetail');
INSERT INTO `xpcms_admin_priv` VALUES ('54', '安全配置编辑', '0', 'site@setsecurityedit');
INSERT INTO `xpcms_admin_priv` VALUES ('55', '邮件配置详情', '0', 'site@setemaildetail');
INSERT INTO `xpcms_admin_priv` VALUES ('56', '邮件配置编辑', '0', 'site@setemailedit');
INSERT INTO `xpcms_admin_priv` VALUES ('57', '联合登录配置详情', '0', 'site@setoauthdetail');
INSERT INTO `xpcms_admin_priv` VALUES ('58', '联合登录配置编辑', '0', 'site@setoauthedit');
INSERT INTO `xpcms_admin_priv` VALUES ('59', '发送短信配置列表', '0', 'site@setsmslist');
INSERT INTO `xpcms_admin_priv` VALUES ('60', '附件配置详情', '0', 'site@setextdetail');
INSERT INTO `xpcms_admin_priv` VALUES ('61', '附件配置编辑', '0', 'site@setextedit');
INSERT INTO `xpcms_admin_priv` VALUES ('66', '用户列表', '0', 'user@userlist');
INSERT INTO `xpcms_admin_priv` VALUES ('67', '用户编辑', '0', 'user@useredit');
INSERT INTO `xpcms_admin_priv` VALUES ('68', '用户详情', '0', 'user@userdetail');
INSERT INTO `xpcms_admin_priv` VALUES ('69', '用户添加', '0', 'user@useradd');
INSERT INTO `xpcms_admin_priv` VALUES ('70', '用户修改', '0', 'user@userpwd');
INSERT INTO `xpcms_admin_priv` VALUES ('71', '用户删除', '0', 'user@usersave');
INSERT INTO `xpcms_admin_priv` VALUES ('72', '待审核用户列表', '0', 'user@audilist');
INSERT INTO `xpcms_admin_priv` VALUES ('73', '待审核用户编辑', '0', 'user@audiedit');
INSERT INTO `xpcms_admin_priv` VALUES ('74', '待审核用户详情', '0', 'user@audidetail');
INSERT INTO `xpcms_admin_priv` VALUES ('75', '用户组列表', '0', 'user@grouplist');
INSERT INTO `xpcms_admin_priv` VALUES ('76', '用户组编辑', '0', 'user@groupedit');
INSERT INTO `xpcms_admin_priv` VALUES ('77', '用户组详情', '0', 'user@groupdetail');
INSERT INTO `xpcms_admin_priv` VALUES ('78', '用户组添加', '0', 'user@groupadd');
INSERT INTO `xpcms_admin_priv` VALUES ('79', '用户组删除', '0', 'user@groupsave');
INSERT INTO `xpcms_admin_priv` VALUES ('80', '用户配置详情', '0', 'user@setdetail');
INSERT INTO `xpcms_admin_priv` VALUES ('81', '用户配置编辑', '0', 'user@setedit');

-- ----------------------------
-- Table structure for xpcms_admin_tpl
-- ----------------------------
DROP TABLE IF EXISTS `xpcms_admin_tpl`;
CREATE TABLE `xpcms_admin_tpl` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '后台模板ID（数据模板分离）layui',
  `title` char(32) NOT NULL COMMENT '模板功能名称',
  `path` varchar(255) NOT NULL DEFAULT '/' COMMENT '模板存放路径（phpcnui）',
  `filename` varchar(255) NOT NULL DEFAULT '' COMMENT '模板文件名',
  `tpl_ext` varchar(16) NOT NULL DEFAULT '.html' COMMENT '模板文件扩展名',
  `type` tinyint(1) NOT NULL DEFAULT '2' COMMENT '1=框架页面 2=子页面 3=模块页面',
  `fk_name` varchar(16) NOT NULL DEFAULT 'layui' COMMENT '后台模板使用的前端框架',
  `add_time` int(10) NOT NULL DEFAULT '1' COMMENT '模板创建时间',
  `edit_time` int(10) NOT NULL DEFAULT '1' COMMENT '模板更新时间',
  `admin_id` int(10) NOT NULL COMMENT '模板创建管理员',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0启用 ，1 停用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=71 DEFAULT CHARSET=utf8 COMMENT='后台模板库';

-- ----------------------------
-- Records of xpcms_admin_tpl
-- ----------------------------
INSERT INTO `xpcms_admin_tpl` VALUES ('2', '后台-管理组添加表单模板', 'temp/', 'admin_admin_group_add', '.html', '2', 'layui', '1', '1', '0', '1');
INSERT INTO `xpcms_admin_tpl` VALUES ('3', '后台-管理组编辑表单模板', 'temp/', 'admin_admin_group_edit', '.html', '2', 'layui', '1', '1', '0', '1');
INSERT INTO `xpcms_admin_tpl` VALUES ('4', '后台-管理组列表模板', 'temp/', 'admin_admin_group_list', '.html', '2', 'layui', '1', '1', '0', '1');
INSERT INTO `xpcms_admin_tpl` VALUES ('5', '后台-权限编辑添加模板', 'temp/', 'admin_admin_priv_add', '.html', '2', 'layui', '1', '1', '0', '1');
INSERT INTO `xpcms_admin_tpl` VALUES ('6', '后台-权限编辑表单模板', 'temp/', 'admin_admin_priv_edit', '.html', '2', 'layui', '1', '1', '0', '1');
INSERT INTO `xpcms_admin_tpl` VALUES ('7', '后台-权限列表模板', 'temp/', 'admin_admin_priv_list', '.html', '2', 'layui', '1', '1', '0', '1');
INSERT INTO `xpcms_admin_tpl` VALUES ('8', '后台-管理员添加表单模板', 'temp/', 'admin_admin_user_add', '.html', '2', 'layui', '1', '1', '0', '1');
INSERT INTO `xpcms_admin_tpl` VALUES ('9', '后台-管理员编辑表单模板', 'temp/', 'admin_admin_user_edit', '.html', '2', 'layui', '1', '1', '0', '1');
INSERT INTO `xpcms_admin_tpl` VALUES ('10', '后台-管理员列表模板', 'temp/', 'admin_admin_user_list', '.html', '2', 'layui', '1', '1', '0', '1');
INSERT INTO `xpcms_admin_tpl` VALUES ('11', '后台-版本信息模板', 'temp/', 'admin_common_cp', '.html', '2', 'layui', '1', '1', '0', '1');
INSERT INTO `xpcms_admin_tpl` VALUES ('12', '后台-普通文章添加表单模板', 'temp/', 'admin_content_add', '.html', '2', 'layui', '1', '1', '0', '-1');
INSERT INTO `xpcms_admin_tpl` VALUES ('13', '后台-文章分类管理', 'temp/', 'admin_content_category', '.html', '2', 'layui', '1', '1', '0', '-1');
INSERT INTO `xpcms_admin_tpl` VALUES ('14', '后台-频道管理添加表单模板', 'temp/', 'admin_content_category_add', '.html', '2', 'layui', '1', '1', '0', '1');
INSERT INTO `xpcms_admin_tpl` VALUES ('15', '后台-频道管理编辑表单模板', 'temp/', 'admin_content_category_edit', '.html', '2', 'layui', '1', '1', '0', '1');
INSERT INTO `xpcms_admin_tpl` VALUES ('16', '后台-频道管理模板', 'temp/', 'admin_content_category_list', '.html', '2', 'layui', '1', '1', '0', '1');
INSERT INTO `xpcms_admin_tpl` VALUES ('17', '后台-普通文章编辑表单模板', 'temp/', 'admin_content_edit', '.html', '2', 'layui', '1', '1', '0', '-1');
INSERT INTO `xpcms_admin_tpl` VALUES ('18', '后台-普通文章列表模板', 'temp/', 'admin_content_list', '.html', '2', 'layui', '1', '1', '0', '1');
INSERT INTO `xpcms_admin_tpl` VALUES ('19', '后台-普通文章添加表单模板', 'temp/', 'admin_content_news_add', '.html', '2', 'layui', '1', '1', '0', '1');
INSERT INTO `xpcms_admin_tpl` VALUES ('20', '后台-普通文章编辑表单模板', 'temp/', 'admin_content_news_edit', '.html', '2', 'layui', '1', '1', '0', '1');
INSERT INTO `xpcms_admin_tpl` VALUES ('21', '后台-普通文章列表模板', 'temp/', 'admin_content_news_list', '.html', '2', 'layui', '1', '1', '0', '1');
INSERT INTO `xpcms_admin_tpl` VALUES ('22', '后台-更新全站缓存 模板', 'temp/', 'admin_extend_cache_clear', '.html', '2', 'layui', '1', '1', '0', '1');
INSERT INTO `xpcms_admin_tpl` VALUES ('23', '后台-数据库工具模板', 'temp/', 'admin_extend_db_tools', '.html', '2', 'layui', '1', '1', '0', '1');
INSERT INTO `xpcms_admin_tpl` VALUES ('24', '后台-来源管理添加表单模板', 'temp/', 'admin_extend_from_org_add', '.html', '2', 'layui', '1', '1', '0', '1');
INSERT INTO `xpcms_admin_tpl` VALUES ('25', '后台-来源管理编辑表单模板', 'temp/', 'admin_extend_from_org_edit', '.html', '2', 'layui', '1', '1', '0', '1');
INSERT INTO `xpcms_admin_tpl` VALUES ('26', '后台-来源管理列表模板', 'temp/', 'admin_extend_from_org_list', '.html', '2', 'layui', '1', '1', '0', '1');
INSERT INTO `xpcms_admin_tpl` VALUES ('27', '后台-后台操作日志详情模板', 'temp/', 'admin_extend_log_back_log_edit', '.html', '2', 'layui', '1', '1', '0', '1');
INSERT INTO `xpcms_admin_tpl` VALUES ('28', '后台-后台操作日志列表模板', 'temp/', 'admin_extend_log_back_log_list', '.html', '2', 'layui', '1', '1', '0', '1');
INSERT INTO `xpcms_admin_tpl` VALUES ('29', '后台-后台菜单添加模板', 'temp/', 'admin_extend_menu_back_add', '.html', '2', 'layui', '1', '1', '0', '1');
INSERT INTO `xpcms_admin_tpl` VALUES ('30', '后台-后台菜单编辑模板', 'temp/', 'admin_extend_menu_back_edit', '.html', '2', 'layui', '1', '1', '0', '1');
INSERT INTO `xpcms_admin_tpl` VALUES ('31', '后台-后台菜单管理模板', 'temp/', 'admin_extend_menu_back_list', '.html', '2', 'layui', '1', '1', '0', '1');
INSERT INTO `xpcms_admin_tpl` VALUES ('32', '后台-前台导航添加表单模板', 'temp/', 'admin_extend_menu_front_add', '.html', '2', 'layui', '1', '1', '0', '1');
INSERT INTO `xpcms_admin_tpl` VALUES ('33', '后台-前台导航编辑表单模板', 'temp/', 'admin_extend_menu_front_edit', '.html', '2', 'layui', '1', '1', '0', '1');
INSERT INTO `xpcms_admin_tpl` VALUES ('34', '后台-前台菜单模板', 'temp/', 'admin_extend_menu_front_list', '.html', '2', 'layui', '1', '1', '0', '1');
INSERT INTO `xpcms_admin_tpl` VALUES ('35', '后台-敏感词添加表单模板', 'temp/', 'admin_extend_sensitive_add', '.html', '2', 'layui', '1', '1', '0', '1');
INSERT INTO `xpcms_admin_tpl` VALUES ('36', '后台-敏感词编辑表单模板', 'temp/', 'admin_extend_sensitive_edit', '.html', '2', 'layui', '1', '1', '0', '1');
INSERT INTO `xpcms_admin_tpl` VALUES ('37', '后台-敏感词管理列表模板', 'temp/', 'admin_extend_sensitive_list', '.html', '2', 'layui', '1', '1', '0', '1');
INSERT INTO `xpcms_admin_tpl` VALUES ('38', '后台-URL规则管理模板', 'temp/', 'admin_extend_url_manager', '.html', '2', 'layui', '1', '1', '0', '1');
INSERT INTO `xpcms_admin_tpl` VALUES ('39', '后台-网站设置模板', 'temp/', 'admin_site_set_base', '.html', '2', 'layui', '1', '1', '0', '1');
INSERT INTO `xpcms_admin_tpl` VALUES ('40', '后台-邮箱配置模板', 'temp/', 'admin_site_set_email', '.html', '2', 'layui', '1', '1', '0', '1');
INSERT INTO `xpcms_admin_tpl` VALUES ('41', '后台-附件配置模板', 'temp/', 'admin_site_set_ext', '.html', '2', 'layui', '1', '1', '0', '1');
INSERT INTO `xpcms_admin_tpl` VALUES ('42', '后台-网站设置编辑模板', 'temp/', 'admin_site_set_main', '.html', '2', 'layui', '1', '1', '0', '1');
INSERT INTO `xpcms_admin_tpl` VALUES ('43', '后台-第三方登录配置模板', 'temp/', 'admin_site_set_oauth', '.html', '2', 'layui', '1', '1', '0', '1');
INSERT INTO `xpcms_admin_tpl` VALUES ('44', '后台-安全配置模板', 'temp/', 'admin_site_set_security', '.html', '2', 'layui', '1', '1', '0', '1');
INSERT INTO `xpcms_admin_tpl` VALUES ('45', '后台-SEO设置模板', 'temp/', 'admin_site_set_seo', '.html', '2', 'layui', '1', '1', '0', '1');
INSERT INTO `xpcms_admin_tpl` VALUES ('46', '后台-手机短信配置模板', 'temp/', 'admin_site_set_sms_list', '.html', '2', 'layui', '1', '1', '0', '1');
INSERT INTO `xpcms_admin_tpl` VALUES ('47', '后台-支付宝小程序模板', 'temp/', 'admin_site_set_tinypro_alipay_list', '.html', '2', 'layui', '1', '1', '0', '1');
INSERT INTO `xpcms_admin_tpl` VALUES ('48', '后台-头条小程序 模板', 'temp/', 'admin_site_set_tinypro_toutiao_list', '.html', '2', 'layui', '1', '1', '0', '1');
INSERT INTO `xpcms_admin_tpl` VALUES ('49', '后台-微信小程序模板', 'temp/', 'admin_site_set_tinypro_weixin_list', '.html', '2', 'layui', '1', '1', '0', '1');
INSERT INTO `xpcms_admin_tpl` VALUES ('50', '后台-微信公众号配置模板', 'temp/', 'admin_site_set_weixin_list', '.html', '2', 'layui', '1', '1', '0', '1');
INSERT INTO `xpcms_admin_tpl` VALUES ('51', '后台-待审核用户详情编辑模板', 'temp/', 'admin_user_audi_edit', '.html', '2', 'layui', '1', '1', '0', '1');
INSERT INTO `xpcms_admin_tpl` VALUES ('52', '后台-审核用户模板', 'temp/', 'admin_user_audi_list', '.html', '2', 'layui', '1', '1', '0', '1');
INSERT INTO `xpcms_admin_tpl` VALUES ('53', '后台-用户组新增表单模板', 'temp/', 'admin_user_group_add', '.html', '2', 'layui', '1', '1', '0', '1');
INSERT INTO `xpcms_admin_tpl` VALUES ('54', '后台-用户组编辑表单模板', 'temp/', 'admin_user_group_edit', '.html', '2', 'layui', '1', '1', '0', '1');
INSERT INTO `xpcms_admin_tpl` VALUES ('55', '后台-用户组模板', 'temp/', 'admin_user_group_list', '.html', '2', 'layui', '1', '1', '0', '1');
INSERT INTO `xpcms_admin_tpl` VALUES ('56', '后台-用户配置模板', 'temp/', 'admin_user_set', '.html', '2', 'layui', '1', '1', '0', '1');
INSERT INTO `xpcms_admin_tpl` VALUES ('57', '后台-用户新增表单模板', 'temp/', 'admin_user_user_add', '.html', '2', 'layui', '1', '1', '0', '1');
INSERT INTO `xpcms_admin_tpl` VALUES ('58', '后台-用户编辑表单模板', 'temp/', 'admin_user_user_edit', '.html', '2', 'layui', '1', '1', '0', '1');
INSERT INTO `xpcms_admin_tpl` VALUES ('59', '后台-用户列表模板', 'temp/', 'admin_user_user_list', '.html', '2', 'layui', '1', '1', '0', '1');
INSERT INTO `xpcms_admin_tpl` VALUES ('1', '后台-首页模板', '/', 'index', '.html', '2', 'layui', '1', '1', '0', '1');
INSERT INTO `xpcms_admin_tpl` VALUES ('60', '后台-内容管理-单页新闻列表模板', 'temp/', 'admin_content_news_page_list', '.html', '2', 'layui', '1', '1', '0', '1');
INSERT INTO `xpcms_admin_tpl` VALUES ('61', '后台-内容管理-图集新闻列表模板', 'temp/', 'admin_content_news_image_list', '.html', '2', 'layui', '1', '1', '0', '1');
INSERT INTO `xpcms_admin_tpl` VALUES ('62', '后台-内容管理-视频集新闻列表模板', 'temp/', 'admin_content_news_video_list', '.html', '2', 'layui', '1', '1', '0', '1');
INSERT INTO `xpcms_admin_tpl` VALUES ('63', '后台-内容管理-图集新闻编辑模板', 'temp/', 'admin_content_news_edit_images', '.html', '2', 'layui', '1', '1', '0', '1');
INSERT INTO `xpcms_admin_tpl` VALUES ('64', '后台-内容管理-视频新闻编辑模板', 'temp/', 'admin_content_news_edit_video', '.html', '2', 'layui', '1', '1', '0', '1');
INSERT INTO `xpcms_admin_tpl` VALUES ('65', '后台-内容管理-单页新闻编辑模板', 'temp/', 'admin_content_news_edit_single', '.html', '2', 'layui', '1', '1', '0', '1');
INSERT INTO `xpcms_admin_tpl` VALUES ('66', '后台-内容管理-图集新闻添加模板', 'temp/', 'admin_content_news_add_images', '.html', '2', 'layui', '1', '1', '0', '1');
INSERT INTO `xpcms_admin_tpl` VALUES ('67', '后台-内容管理-视频新闻添加模板', 'temp/', 'admin_content_news_add_video', '.html', '2', 'layui', '1', '1', '0', '1');
INSERT INTO `xpcms_admin_tpl` VALUES ('68', '后台-内容管理-单页新闻添加模板', 'temp/', 'admin_content_news_add_single', '.html', '2', 'layui', '1', '1', '0', '1');
INSERT INTO `xpcms_admin_tpl` VALUES ('69', '后台-用户管理-修改用户密码弹出层模板', 'temp/', 'admin_user_user_popup_modifypwd', '.html', '2', 'layui', '1', '1', '0', '1');
INSERT INTO `xpcms_admin_tpl` VALUES ('70', '后台-用户管理-修改管理员密码弹出层模板', 'temp/', 'admin_admin_user_popup_modifypwd', '.html', '2', 'layui', '1', '1', '0', '1');

-- ----------------------------
-- Table structure for xpcms_area
-- ----------------------------
DROP TABLE IF EXISTS `xpcms_area`;
CREATE TABLE `xpcms_area` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '地区编码',
  `name` varchar(255) NOT NULL COMMENT '地区名称',
  `parent_id` bigint(20) NOT NULL DEFAULT '0',
  `sort` int(11) NOT NULL COMMENT '显示排序',
  PRIMARY KEY (`id`),
  KEY `pid` (`parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=910011 DEFAULT CHARSET=utf8 COMMENT='全国行政地址编码表';

-- ----------------------------
-- Records of xpcms_area
-- ----------------------------
INSERT INTO `xpcms_area` VALUES ('110000', '北京市', '0', '1');
INSERT INTO `xpcms_area` VALUES ('120000', '天津市', '0', '2');
INSERT INTO `xpcms_area` VALUES ('130000', '河北省', '0', '3');
INSERT INTO `xpcms_area` VALUES ('140000', '山西省', '0', '4');
INSERT INTO `xpcms_area` VALUES ('150000', '内蒙古', '0', '5');
INSERT INTO `xpcms_area` VALUES ('210000', '辽宁省', '0', '6');
INSERT INTO `xpcms_area` VALUES ('220000', '吉林省', '0', '7');
INSERT INTO `xpcms_area` VALUES ('230000', '黑龙江', '0', '8');
INSERT INTO `xpcms_area` VALUES ('310000', '上海市', '0', '9');
INSERT INTO `xpcms_area` VALUES ('320000', '江苏省', '0', '10');
INSERT INTO `xpcms_area` VALUES ('330000', '浙江省', '0', '11');
INSERT INTO `xpcms_area` VALUES ('340000', '安徽省', '0', '12');
INSERT INTO `xpcms_area` VALUES ('350000', '福建省', '0', '13');
INSERT INTO `xpcms_area` VALUES ('360000', '江西省', '0', '14');
INSERT INTO `xpcms_area` VALUES ('370000', '山东省', '0', '15');
INSERT INTO `xpcms_area` VALUES ('410000', '河南省', '0', '16');
INSERT INTO `xpcms_area` VALUES ('420000', '湖北省', '0', '17');
INSERT INTO `xpcms_area` VALUES ('430000', '湖南省', '0', '18');
INSERT INTO `xpcms_area` VALUES ('440000', '广东省', '0', '19');
INSERT INTO `xpcms_area` VALUES ('450000', '广西省', '0', '20');
INSERT INTO `xpcms_area` VALUES ('460000', '海南省', '0', '21');
INSERT INTO `xpcms_area` VALUES ('500000', '重庆市', '0', '22');
INSERT INTO `xpcms_area` VALUES ('510000', '四川省', '0', '23');
INSERT INTO `xpcms_area` VALUES ('520000', '贵州省', '0', '24');
INSERT INTO `xpcms_area` VALUES ('530000', '云南省', '0', '25');
INSERT INTO `xpcms_area` VALUES ('540000', '西　藏', '0', '26');
INSERT INTO `xpcms_area` VALUES ('610000', '陕西省', '0', '27');
INSERT INTO `xpcms_area` VALUES ('620000', '甘肃省', '0', '28');
INSERT INTO `xpcms_area` VALUES ('630000', '青海省', '0', '29');
INSERT INTO `xpcms_area` VALUES ('640000', '宁　夏', '0', '30');
INSERT INTO `xpcms_area` VALUES ('650000', '新　疆', '0', '31');
INSERT INTO `xpcms_area` VALUES ('710000', '台湾省', '0', '32');
INSERT INTO `xpcms_area` VALUES ('810000', '香　港', '0', '33');
INSERT INTO `xpcms_area` VALUES ('820000', '澳　门', '0', '34');
INSERT INTO `xpcms_area` VALUES ('110100', '北京市', '110000', '1');
INSERT INTO `xpcms_area` VALUES ('110200', '县', '110000', '2');
INSERT INTO `xpcms_area` VALUES ('120100', '市辖区', '120000', '1');
INSERT INTO `xpcms_area` VALUES ('120200', '县', '120000', '2');
INSERT INTO `xpcms_area` VALUES ('130100', '石家庄市', '130000', '1');
INSERT INTO `xpcms_area` VALUES ('130200', '唐山市', '130000', '2');
INSERT INTO `xpcms_area` VALUES ('130300', '秦皇岛市', '130000', '3');
INSERT INTO `xpcms_area` VALUES ('130400', '邯郸市', '130000', '4');
INSERT INTO `xpcms_area` VALUES ('130500', '邢台市', '130000', '5');
INSERT INTO `xpcms_area` VALUES ('130600', '保定市', '130000', '6');
INSERT INTO `xpcms_area` VALUES ('130700', '张家口市', '130000', '7');
INSERT INTO `xpcms_area` VALUES ('130800', '承德市', '130000', '8');
INSERT INTO `xpcms_area` VALUES ('130900', '沧州市', '130000', '9');
INSERT INTO `xpcms_area` VALUES ('131000', '廊坊市', '130000', '10');
INSERT INTO `xpcms_area` VALUES ('131100', '衡水市', '130000', '11');
INSERT INTO `xpcms_area` VALUES ('140100', '太原市', '140000', '1');
INSERT INTO `xpcms_area` VALUES ('140200', '大同市', '140000', '2');
INSERT INTO `xpcms_area` VALUES ('140300', '阳泉市', '140000', '3');
INSERT INTO `xpcms_area` VALUES ('140400', '长治市', '140000', '4');
INSERT INTO `xpcms_area` VALUES ('140500', '晋城市', '140000', '5');
INSERT INTO `xpcms_area` VALUES ('140600', '朔州市', '140000', '6');
INSERT INTO `xpcms_area` VALUES ('140700', '晋中市', '140000', '7');
INSERT INTO `xpcms_area` VALUES ('140800', '运城市', '140000', '8');
INSERT INTO `xpcms_area` VALUES ('140900', '忻州市', '140000', '9');
INSERT INTO `xpcms_area` VALUES ('141000', '临汾市', '140000', '10');
INSERT INTO `xpcms_area` VALUES ('141100', '吕梁市', '140000', '11');
INSERT INTO `xpcms_area` VALUES ('150100', '呼和浩特市', '150000', '1');
INSERT INTO `xpcms_area` VALUES ('150200', '包头市', '150000', '2');
INSERT INTO `xpcms_area` VALUES ('150300', '乌海市', '150000', '3');
INSERT INTO `xpcms_area` VALUES ('150400', '赤峰市', '150000', '4');
INSERT INTO `xpcms_area` VALUES ('150500', '通辽市', '150000', '5');
INSERT INTO `xpcms_area` VALUES ('150600', '鄂尔多斯市', '150000', '6');
INSERT INTO `xpcms_area` VALUES ('150700', '呼伦贝尔市', '150000', '7');
INSERT INTO `xpcms_area` VALUES ('150800', '巴彦淖尔市', '150000', '8');
INSERT INTO `xpcms_area` VALUES ('150900', '乌兰察布市', '150000', '9');
INSERT INTO `xpcms_area` VALUES ('152200', '兴安盟', '150000', '10');
INSERT INTO `xpcms_area` VALUES ('152500', '锡林郭勒盟', '150000', '11');
INSERT INTO `xpcms_area` VALUES ('152900', '阿拉善盟', '150000', '12');
INSERT INTO `xpcms_area` VALUES ('210100', '沈阳市', '210000', '1');
INSERT INTO `xpcms_area` VALUES ('210200', '大连市', '210000', '2');
INSERT INTO `xpcms_area` VALUES ('210300', '鞍山市', '210000', '3');
INSERT INTO `xpcms_area` VALUES ('210400', '抚顺市', '210000', '4');
INSERT INTO `xpcms_area` VALUES ('210500', '本溪市', '210000', '5');
INSERT INTO `xpcms_area` VALUES ('210600', '丹东市', '210000', '6');
INSERT INTO `xpcms_area` VALUES ('210700', '锦州市', '210000', '7');
INSERT INTO `xpcms_area` VALUES ('210800', '营口市', '210000', '8');
INSERT INTO `xpcms_area` VALUES ('210900', '阜新市', '210000', '9');
INSERT INTO `xpcms_area` VALUES ('211000', '辽阳市', '210000', '10');
INSERT INTO `xpcms_area` VALUES ('211100', '盘锦市', '210000', '11');
INSERT INTO `xpcms_area` VALUES ('211200', '铁岭市', '210000', '12');
INSERT INTO `xpcms_area` VALUES ('211300', '朝阳市', '210000', '13');
INSERT INTO `xpcms_area` VALUES ('211400', '葫芦岛市', '210000', '14');
INSERT INTO `xpcms_area` VALUES ('220100', '长春市', '220000', '1');
INSERT INTO `xpcms_area` VALUES ('220200', '吉林市', '220000', '2');
INSERT INTO `xpcms_area` VALUES ('220300', '四平市', '220000', '3');
INSERT INTO `xpcms_area` VALUES ('220400', '辽源市', '220000', '4');
INSERT INTO `xpcms_area` VALUES ('220500', '通化市', '220000', '5');
INSERT INTO `xpcms_area` VALUES ('220600', '白山市', '220000', '6');
INSERT INTO `xpcms_area` VALUES ('220700', '松原市', '220000', '7');
INSERT INTO `xpcms_area` VALUES ('220800', '白城市', '220000', '8');
INSERT INTO `xpcms_area` VALUES ('222400', '延边朝鲜族自治州', '220000', '9');
INSERT INTO `xpcms_area` VALUES ('230100', '哈尔滨市', '230000', '1');
INSERT INTO `xpcms_area` VALUES ('230200', '齐齐哈尔市', '230000', '2');
INSERT INTO `xpcms_area` VALUES ('230300', '鸡西市', '230000', '3');
INSERT INTO `xpcms_area` VALUES ('230400', '鹤岗市', '230000', '4');
INSERT INTO `xpcms_area` VALUES ('230500', '双鸭山市', '230000', '5');
INSERT INTO `xpcms_area` VALUES ('230600', '大庆市', '230000', '6');
INSERT INTO `xpcms_area` VALUES ('230700', '伊春市', '230000', '7');
INSERT INTO `xpcms_area` VALUES ('230800', '佳木斯市', '230000', '8');
INSERT INTO `xpcms_area` VALUES ('230900', '七台河市', '230000', '9');
INSERT INTO `xpcms_area` VALUES ('231000', '牡丹江市', '230000', '10');
INSERT INTO `xpcms_area` VALUES ('231100', '黑河市', '230000', '11');
INSERT INTO `xpcms_area` VALUES ('231200', '绥化市', '230000', '12');
INSERT INTO `xpcms_area` VALUES ('232700', '大兴安岭地区', '230000', '13');
INSERT INTO `xpcms_area` VALUES ('310100', '市辖区', '310000', '1');
INSERT INTO `xpcms_area` VALUES ('310200', '县', '310000', '2');
INSERT INTO `xpcms_area` VALUES ('320100', '南京市', '320000', '1');
INSERT INTO `xpcms_area` VALUES ('320200', '无锡市', '320000', '2');
INSERT INTO `xpcms_area` VALUES ('320300', '徐州市', '320000', '3');
INSERT INTO `xpcms_area` VALUES ('320400', '常州市', '320000', '4');
INSERT INTO `xpcms_area` VALUES ('320500', '苏州市', '320000', '5');
INSERT INTO `xpcms_area` VALUES ('320600', '南通市', '320000', '6');
INSERT INTO `xpcms_area` VALUES ('320700', '连云港市', '320000', '7');
INSERT INTO `xpcms_area` VALUES ('320800', '淮安市', '320000', '8');
INSERT INTO `xpcms_area` VALUES ('320900', '盐城市', '320000', '9');
INSERT INTO `xpcms_area` VALUES ('321000', '扬州市', '320000', '10');
INSERT INTO `xpcms_area` VALUES ('321100', '镇江市', '320000', '11');
INSERT INTO `xpcms_area` VALUES ('321200', '泰州市', '320000', '12');
INSERT INTO `xpcms_area` VALUES ('321300', '宿迁市', '320000', '13');
INSERT INTO `xpcms_area` VALUES ('330100', '杭州市', '330000', '1');
INSERT INTO `xpcms_area` VALUES ('330200', '宁波市', '330000', '2');
INSERT INTO `xpcms_area` VALUES ('330300', '温州市', '330000', '3');
INSERT INTO `xpcms_area` VALUES ('330400', '嘉兴市', '330000', '4');
INSERT INTO `xpcms_area` VALUES ('330500', '湖州市', '330000', '5');
INSERT INTO `xpcms_area` VALUES ('330600', '绍兴市', '330000', '6');
INSERT INTO `xpcms_area` VALUES ('330700', '金华市', '330000', '7');
INSERT INTO `xpcms_area` VALUES ('330800', '衢州市', '330000', '8');
INSERT INTO `xpcms_area` VALUES ('330900', '舟山市', '330000', '9');
INSERT INTO `xpcms_area` VALUES ('331000', '台州市', '330000', '10');
INSERT INTO `xpcms_area` VALUES ('331100', '丽水市', '330000', '11');
INSERT INTO `xpcms_area` VALUES ('340100', '合肥市', '340000', '1');
INSERT INTO `xpcms_area` VALUES ('340200', '芜湖市', '340000', '2');
INSERT INTO `xpcms_area` VALUES ('340300', '蚌埠市', '340000', '3');
INSERT INTO `xpcms_area` VALUES ('340400', '淮南市', '340000', '4');
INSERT INTO `xpcms_area` VALUES ('340500', '马鞍山市', '340000', '5');
INSERT INTO `xpcms_area` VALUES ('340600', '淮北市', '340000', '6');
INSERT INTO `xpcms_area` VALUES ('340700', '铜陵市', '340000', '7');
INSERT INTO `xpcms_area` VALUES ('340800', '安庆市', '340000', '8');
INSERT INTO `xpcms_area` VALUES ('341000', '黄山市', '340000', '9');
INSERT INTO `xpcms_area` VALUES ('341100', '滁州市', '340000', '10');
INSERT INTO `xpcms_area` VALUES ('341200', '阜阳市', '340000', '11');
INSERT INTO `xpcms_area` VALUES ('341300', '宿州市', '340000', '12');
INSERT INTO `xpcms_area` VALUES ('341500', '六安市', '340000', '13');
INSERT INTO `xpcms_area` VALUES ('341600', '亳州市', '340000', '14');
INSERT INTO `xpcms_area` VALUES ('341700', '池州市', '340000', '15');
INSERT INTO `xpcms_area` VALUES ('341800', '宣城市', '340000', '16');
INSERT INTO `xpcms_area` VALUES ('350100', '福州市', '350000', '1');
INSERT INTO `xpcms_area` VALUES ('350200', '厦门市', '350000', '2');
INSERT INTO `xpcms_area` VALUES ('350300', '莆田市', '350000', '3');
INSERT INTO `xpcms_area` VALUES ('350400', '三明市', '350000', '4');
INSERT INTO `xpcms_area` VALUES ('350500', '泉州市', '350000', '5');
INSERT INTO `xpcms_area` VALUES ('350600', '漳州市', '350000', '6');
INSERT INTO `xpcms_area` VALUES ('350700', '南平市', '350000', '7');
INSERT INTO `xpcms_area` VALUES ('350800', '龙岩市', '350000', '8');
INSERT INTO `xpcms_area` VALUES ('350900', '宁德市', '350000', '9');
INSERT INTO `xpcms_area` VALUES ('360100', '南昌市', '360000', '1');
INSERT INTO `xpcms_area` VALUES ('360200', '景德镇市', '360000', '2');
INSERT INTO `xpcms_area` VALUES ('360300', '萍乡市', '360000', '3');
INSERT INTO `xpcms_area` VALUES ('360400', '九江市', '360000', '4');
INSERT INTO `xpcms_area` VALUES ('360500', '新余市', '360000', '5');
INSERT INTO `xpcms_area` VALUES ('360600', '鹰潭市', '360000', '6');
INSERT INTO `xpcms_area` VALUES ('360700', '赣州市', '360000', '7');
INSERT INTO `xpcms_area` VALUES ('360800', '吉安市', '360000', '8');
INSERT INTO `xpcms_area` VALUES ('360900', '宜春市', '360000', '9');
INSERT INTO `xpcms_area` VALUES ('361000', '抚州市', '360000', '10');
INSERT INTO `xpcms_area` VALUES ('361100', '上饶市', '360000', '11');
INSERT INTO `xpcms_area` VALUES ('370100', '济南市', '370000', '1');
INSERT INTO `xpcms_area` VALUES ('370200', '青岛市', '370000', '2');
INSERT INTO `xpcms_area` VALUES ('370300', '淄博市', '370000', '3');
INSERT INTO `xpcms_area` VALUES ('370400', '枣庄市', '370000', '4');
INSERT INTO `xpcms_area` VALUES ('370500', '东营市', '370000', '5');
INSERT INTO `xpcms_area` VALUES ('370600', '烟台市', '370000', '6');
INSERT INTO `xpcms_area` VALUES ('370700', '潍坊市', '370000', '7');
INSERT INTO `xpcms_area` VALUES ('370800', '济宁市', '370000', '8');
INSERT INTO `xpcms_area` VALUES ('370900', '泰安市', '370000', '9');
INSERT INTO `xpcms_area` VALUES ('371000', '威海市', '370000', '10');
INSERT INTO `xpcms_area` VALUES ('371100', '日照市', '370000', '11');
INSERT INTO `xpcms_area` VALUES ('371200', '莱芜市', '370000', '12');
INSERT INTO `xpcms_area` VALUES ('371300', '临沂市', '370000', '13');
INSERT INTO `xpcms_area` VALUES ('371400', '德州市', '370000', '14');
INSERT INTO `xpcms_area` VALUES ('371500', '聊城市', '370000', '15');
INSERT INTO `xpcms_area` VALUES ('371600', '滨州市', '370000', '16');
INSERT INTO `xpcms_area` VALUES ('371700', '菏泽市', '370000', '17');
INSERT INTO `xpcms_area` VALUES ('410100', '郑州市', '410000', '1');
INSERT INTO `xpcms_area` VALUES ('410200', '开封市', '410000', '2');
INSERT INTO `xpcms_area` VALUES ('410300', '洛阳市', '410000', '3');
INSERT INTO `xpcms_area` VALUES ('410400', '平顶山市', '410000', '4');
INSERT INTO `xpcms_area` VALUES ('410500', '安阳市', '410000', '5');
INSERT INTO `xpcms_area` VALUES ('410600', '鹤壁市', '410000', '6');
INSERT INTO `xpcms_area` VALUES ('410700', '新乡市', '410000', '7');
INSERT INTO `xpcms_area` VALUES ('410800', '焦作市', '410000', '8');
INSERT INTO `xpcms_area` VALUES ('410900', '濮阳市', '410000', '9');
INSERT INTO `xpcms_area` VALUES ('411000', '许昌市', '410000', '10');
INSERT INTO `xpcms_area` VALUES ('411100', '漯河市', '410000', '11');
INSERT INTO `xpcms_area` VALUES ('411200', '三门峡市', '410000', '12');
INSERT INTO `xpcms_area` VALUES ('411300', '南阳市', '410000', '13');
INSERT INTO `xpcms_area` VALUES ('411400', '商丘市', '410000', '14');
INSERT INTO `xpcms_area` VALUES ('411500', '信阳市', '410000', '15');
INSERT INTO `xpcms_area` VALUES ('411600', '周口市', '410000', '16');
INSERT INTO `xpcms_area` VALUES ('411700', '驻马店市', '410000', '17');
INSERT INTO `xpcms_area` VALUES ('420100', '武汉市', '420000', '1');
INSERT INTO `xpcms_area` VALUES ('420200', '黄石市', '420000', '2');
INSERT INTO `xpcms_area` VALUES ('420300', '十堰市', '420000', '3');
INSERT INTO `xpcms_area` VALUES ('420500', '宜昌市', '420000', '4');
INSERT INTO `xpcms_area` VALUES ('420600', '襄樊市', '420000', '5');
INSERT INTO `xpcms_area` VALUES ('420700', '鄂州市', '420000', '6');
INSERT INTO `xpcms_area` VALUES ('420800', '荆门市', '420000', '7');
INSERT INTO `xpcms_area` VALUES ('420900', '孝感市', '420000', '8');
INSERT INTO `xpcms_area` VALUES ('421000', '荆州市', '420000', '9');
INSERT INTO `xpcms_area` VALUES ('421100', '黄冈市', '420000', '10');
INSERT INTO `xpcms_area` VALUES ('421200', '咸宁市', '420000', '11');
INSERT INTO `xpcms_area` VALUES ('421300', '随州市', '420000', '12');
INSERT INTO `xpcms_area` VALUES ('422800', '恩施土家族苗族自治州', '420000', '13');
INSERT INTO `xpcms_area` VALUES ('429000', '省直辖行政单位', '420000', '14');
INSERT INTO `xpcms_area` VALUES ('430100', '长沙市', '430000', '1');
INSERT INTO `xpcms_area` VALUES ('430200', '株洲市', '430000', '2');
INSERT INTO `xpcms_area` VALUES ('430300', '湘潭市', '430000', '3');
INSERT INTO `xpcms_area` VALUES ('430400', '衡阳市', '430000', '4');
INSERT INTO `xpcms_area` VALUES ('430500', '邵阳市', '430000', '5');
INSERT INTO `xpcms_area` VALUES ('430600', '岳阳市', '430000', '6');
INSERT INTO `xpcms_area` VALUES ('430700', '常德市', '430000', '7');
INSERT INTO `xpcms_area` VALUES ('430800', '张家界市', '430000', '8');
INSERT INTO `xpcms_area` VALUES ('430900', '益阳市', '430000', '9');
INSERT INTO `xpcms_area` VALUES ('431000', '郴州市', '430000', '10');
INSERT INTO `xpcms_area` VALUES ('431100', '永州市', '430000', '11');
INSERT INTO `xpcms_area` VALUES ('431200', '怀化市', '430000', '12');
INSERT INTO `xpcms_area` VALUES ('431300', '娄底市', '430000', '13');
INSERT INTO `xpcms_area` VALUES ('433100', '湘西土家族苗族自治州', '430000', '14');
INSERT INTO `xpcms_area` VALUES ('440100', '广州市', '440000', '1');
INSERT INTO `xpcms_area` VALUES ('440200', '韶关市', '440000', '2');
INSERT INTO `xpcms_area` VALUES ('440300', '深圳市', '440000', '3');
INSERT INTO `xpcms_area` VALUES ('440400', '珠海市', '440000', '4');
INSERT INTO `xpcms_area` VALUES ('440500', '汕头市', '440000', '5');
INSERT INTO `xpcms_area` VALUES ('440600', '佛山市', '440000', '6');
INSERT INTO `xpcms_area` VALUES ('440700', '江门市', '440000', '7');
INSERT INTO `xpcms_area` VALUES ('440800', '湛江市', '440000', '8');
INSERT INTO `xpcms_area` VALUES ('440900', '茂名市', '440000', '9');
INSERT INTO `xpcms_area` VALUES ('441200', '肇庆市', '440000', '10');
INSERT INTO `xpcms_area` VALUES ('441300', '惠州市', '440000', '11');
INSERT INTO `xpcms_area` VALUES ('441400', '梅州市', '440000', '12');
INSERT INTO `xpcms_area` VALUES ('441500', '汕尾市', '440000', '13');
INSERT INTO `xpcms_area` VALUES ('441600', '河源市', '440000', '14');
INSERT INTO `xpcms_area` VALUES ('441700', '阳江市', '440000', '15');
INSERT INTO `xpcms_area` VALUES ('441800', '清远市', '440000', '16');
INSERT INTO `xpcms_area` VALUES ('441900', '东莞市', '440000', '17');
INSERT INTO `xpcms_area` VALUES ('442000', '中山市', '440000', '18');
INSERT INTO `xpcms_area` VALUES ('445100', '潮州市', '440000', '19');
INSERT INTO `xpcms_area` VALUES ('445200', '揭阳市', '440000', '20');
INSERT INTO `xpcms_area` VALUES ('445300', '云浮市', '440000', '21');
INSERT INTO `xpcms_area` VALUES ('450100', '南宁市', '450000', '1');
INSERT INTO `xpcms_area` VALUES ('450200', '柳州市', '450000', '2');
INSERT INTO `xpcms_area` VALUES ('450300', '桂林市', '450000', '3');
INSERT INTO `xpcms_area` VALUES ('450400', '梧州市', '450000', '4');
INSERT INTO `xpcms_area` VALUES ('450500', '北海市', '450000', '5');
INSERT INTO `xpcms_area` VALUES ('450600', '防城港市', '450000', '6');
INSERT INTO `xpcms_area` VALUES ('450700', '钦州市', '450000', '7');
INSERT INTO `xpcms_area` VALUES ('450800', '贵港市', '450000', '8');
INSERT INTO `xpcms_area` VALUES ('450900', '玉林市', '450000', '9');
INSERT INTO `xpcms_area` VALUES ('451000', '百色市', '450000', '10');
INSERT INTO `xpcms_area` VALUES ('451100', '贺州市', '450000', '11');
INSERT INTO `xpcms_area` VALUES ('451200', '河池市', '450000', '12');
INSERT INTO `xpcms_area` VALUES ('451300', '来宾市', '450000', '13');
INSERT INTO `xpcms_area` VALUES ('451400', '崇左市', '450000', '14');
INSERT INTO `xpcms_area` VALUES ('460100', '海口市', '460000', '1');
INSERT INTO `xpcms_area` VALUES ('460200', '三亚市', '460000', '2');
INSERT INTO `xpcms_area` VALUES ('469000', '省直辖县级行政单位', '460000', '3');
INSERT INTO `xpcms_area` VALUES ('500100', '市辖区', '500000', '1');
INSERT INTO `xpcms_area` VALUES ('500200', '县', '500000', '2');
INSERT INTO `xpcms_area` VALUES ('500300', '市', '500000', '3');
INSERT INTO `xpcms_area` VALUES ('510100', '成都市', '510000', '1');
INSERT INTO `xpcms_area` VALUES ('510300', '自贡市', '510000', '2');
INSERT INTO `xpcms_area` VALUES ('510400', '攀枝花市', '510000', '3');
INSERT INTO `xpcms_area` VALUES ('510500', '泸州市', '510000', '4');
INSERT INTO `xpcms_area` VALUES ('510600', '德阳市', '510000', '5');
INSERT INTO `xpcms_area` VALUES ('510700', '绵阳市', '510000', '6');
INSERT INTO `xpcms_area` VALUES ('510800', '广元市', '510000', '7');
INSERT INTO `xpcms_area` VALUES ('510900', '遂宁市', '510000', '8');
INSERT INTO `xpcms_area` VALUES ('511000', '内江市', '510000', '9');
INSERT INTO `xpcms_area` VALUES ('511100', '乐山市', '510000', '10');
INSERT INTO `xpcms_area` VALUES ('511300', '南充市', '510000', '11');
INSERT INTO `xpcms_area` VALUES ('511400', '眉山市', '510000', '12');
INSERT INTO `xpcms_area` VALUES ('511500', '宜宾市', '510000', '13');
INSERT INTO `xpcms_area` VALUES ('511600', '广安市', '510000', '14');
INSERT INTO `xpcms_area` VALUES ('511700', '达州市', '510000', '15');
INSERT INTO `xpcms_area` VALUES ('511800', '雅安市', '510000', '16');
INSERT INTO `xpcms_area` VALUES ('511900', '巴中市', '510000', '17');
INSERT INTO `xpcms_area` VALUES ('512000', '资阳市', '510000', '18');
INSERT INTO `xpcms_area` VALUES ('513200', '阿坝藏族羌族自治州', '510000', '19');
INSERT INTO `xpcms_area` VALUES ('513300', '甘孜藏族自治州', '510000', '20');
INSERT INTO `xpcms_area` VALUES ('513400', '凉山彝族自治州', '510000', '21');
INSERT INTO `xpcms_area` VALUES ('520100', '贵阳市', '520000', '1');
INSERT INTO `xpcms_area` VALUES ('520200', '六盘水市', '520000', '2');
INSERT INTO `xpcms_area` VALUES ('520300', '遵义市', '520000', '3');
INSERT INTO `xpcms_area` VALUES ('520400', '安顺市', '520000', '4');
INSERT INTO `xpcms_area` VALUES ('522200', '铜仁地区', '520000', '5');
INSERT INTO `xpcms_area` VALUES ('522300', '黔西南布依族苗族自治州', '520000', '6');
INSERT INTO `xpcms_area` VALUES ('522400', '毕节地区', '520000', '7');
INSERT INTO `xpcms_area` VALUES ('522600', '黔东南苗族侗族自治州', '520000', '8');
INSERT INTO `xpcms_area` VALUES ('522700', '黔南布依族苗族自治州', '520000', '9');
INSERT INTO `xpcms_area` VALUES ('530100', '昆明市', '530000', '1');
INSERT INTO `xpcms_area` VALUES ('530300', '曲靖市', '530000', '2');
INSERT INTO `xpcms_area` VALUES ('530400', '玉溪市', '530000', '3');
INSERT INTO `xpcms_area` VALUES ('530500', '保山市', '530000', '4');
INSERT INTO `xpcms_area` VALUES ('530600', '昭通市', '530000', '5');
INSERT INTO `xpcms_area` VALUES ('530700', '丽江市', '530000', '6');
INSERT INTO `xpcms_area` VALUES ('530800', '思茅市', '530000', '7');
INSERT INTO `xpcms_area` VALUES ('530900', '临沧市', '530000', '8');
INSERT INTO `xpcms_area` VALUES ('532300', '楚雄彝族自治州', '530000', '9');
INSERT INTO `xpcms_area` VALUES ('532500', '红河哈尼族彝族自治州', '530000', '10');
INSERT INTO `xpcms_area` VALUES ('532600', '文山壮族苗族自治州', '530000', '11');
INSERT INTO `xpcms_area` VALUES ('532800', '西双版纳傣族自治州', '530000', '12');
INSERT INTO `xpcms_area` VALUES ('532900', '大理白族自治州', '530000', '13');
INSERT INTO `xpcms_area` VALUES ('533100', '德宏傣族景颇族自治州', '530000', '14');
INSERT INTO `xpcms_area` VALUES ('533300', '怒江傈僳族自治州', '530000', '15');
INSERT INTO `xpcms_area` VALUES ('533400', '迪庆藏族自治州', '530000', '16');
INSERT INTO `xpcms_area` VALUES ('540100', '拉萨市', '540000', '1');
INSERT INTO `xpcms_area` VALUES ('542100', '昌都地区', '540000', '2');
INSERT INTO `xpcms_area` VALUES ('542200', '山南地区', '540000', '3');
INSERT INTO `xpcms_area` VALUES ('542300', '日喀则地区', '540000', '4');
INSERT INTO `xpcms_area` VALUES ('542400', '那曲地区', '540000', '5');
INSERT INTO `xpcms_area` VALUES ('542500', '阿里地区', '540000', '6');
INSERT INTO `xpcms_area` VALUES ('542600', '林芝地区', '540000', '7');
INSERT INTO `xpcms_area` VALUES ('610100', '西安市', '610000', '1');
INSERT INTO `xpcms_area` VALUES ('610200', '铜川市', '610000', '2');
INSERT INTO `xpcms_area` VALUES ('610300', '宝鸡市', '610000', '3');
INSERT INTO `xpcms_area` VALUES ('610400', '咸阳市', '610000', '4');
INSERT INTO `xpcms_area` VALUES ('610500', '渭南市', '610000', '5');
INSERT INTO `xpcms_area` VALUES ('610600', '延安市', '610000', '6');
INSERT INTO `xpcms_area` VALUES ('610700', '汉中市', '610000', '7');
INSERT INTO `xpcms_area` VALUES ('610800', '榆林市', '610000', '8');
INSERT INTO `xpcms_area` VALUES ('610900', '安康市', '610000', '9');
INSERT INTO `xpcms_area` VALUES ('611000', '商洛市', '610000', '10');
INSERT INTO `xpcms_area` VALUES ('620100', '兰州市', '620000', '1');
INSERT INTO `xpcms_area` VALUES ('620200', '嘉峪关市', '620000', '2');
INSERT INTO `xpcms_area` VALUES ('620300', '金昌市', '620000', '3');
INSERT INTO `xpcms_area` VALUES ('620400', '白银市', '620000', '4');
INSERT INTO `xpcms_area` VALUES ('620500', '天水市', '620000', '5');
INSERT INTO `xpcms_area` VALUES ('620600', '武威市', '620000', '6');
INSERT INTO `xpcms_area` VALUES ('620700', '张掖市', '620000', '7');
INSERT INTO `xpcms_area` VALUES ('620800', '平凉市', '620000', '8');
INSERT INTO `xpcms_area` VALUES ('620900', '酒泉市', '620000', '9');
INSERT INTO `xpcms_area` VALUES ('621000', '庆阳市', '620000', '10');
INSERT INTO `xpcms_area` VALUES ('621100', '定西市', '620000', '11');
INSERT INTO `xpcms_area` VALUES ('621200', '陇南市', '620000', '12');
INSERT INTO `xpcms_area` VALUES ('622900', '临夏回族自治州', '620000', '13');
INSERT INTO `xpcms_area` VALUES ('623000', '甘南藏族自治州', '620000', '14');
INSERT INTO `xpcms_area` VALUES ('630100', '西宁市', '630000', '1');
INSERT INTO `xpcms_area` VALUES ('632100', '海东地区', '630000', '2');
INSERT INTO `xpcms_area` VALUES ('632200', '海北藏族自治州', '630000', '3');
INSERT INTO `xpcms_area` VALUES ('632300', '黄南藏族自治州', '630000', '4');
INSERT INTO `xpcms_area` VALUES ('632500', '海南藏族自治州', '630000', '5');
INSERT INTO `xpcms_area` VALUES ('632600', '果洛藏族自治州', '630000', '6');
INSERT INTO `xpcms_area` VALUES ('632700', '玉树藏族自治州', '630000', '7');
INSERT INTO `xpcms_area` VALUES ('632800', '海西蒙古族藏族自治州', '630000', '8');
INSERT INTO `xpcms_area` VALUES ('640100', '银川市', '640000', '1');
INSERT INTO `xpcms_area` VALUES ('640200', '石嘴山市', '640000', '2');
INSERT INTO `xpcms_area` VALUES ('640300', '吴忠市', '640000', '3');
INSERT INTO `xpcms_area` VALUES ('640400', '固原市', '640000', '4');
INSERT INTO `xpcms_area` VALUES ('640500', '中卫市', '640000', '5');
INSERT INTO `xpcms_area` VALUES ('650100', '乌鲁木齐市', '650000', '1');
INSERT INTO `xpcms_area` VALUES ('650200', '克拉玛依市', '650000', '2');
INSERT INTO `xpcms_area` VALUES ('652100', '吐鲁番地区', '650000', '3');
INSERT INTO `xpcms_area` VALUES ('652200', '哈密地区', '650000', '4');
INSERT INTO `xpcms_area` VALUES ('652300', '昌吉回族自治州', '650000', '5');
INSERT INTO `xpcms_area` VALUES ('652700', '博尔塔拉蒙古自治州', '650000', '6');
INSERT INTO `xpcms_area` VALUES ('652800', '巴音郭楞蒙古自治州', '650000', '7');
INSERT INTO `xpcms_area` VALUES ('652900', '阿克苏地区', '650000', '8');
INSERT INTO `xpcms_area` VALUES ('653000', '克孜勒苏柯尔克孜自治州', '650000', '9');
INSERT INTO `xpcms_area` VALUES ('653100', '喀什地区', '650000', '10');
INSERT INTO `xpcms_area` VALUES ('653200', '和田地区', '650000', '11');
INSERT INTO `xpcms_area` VALUES ('654000', '伊犁哈萨克自治州', '650000', '12');
INSERT INTO `xpcms_area` VALUES ('654200', '塔城地区', '650000', '13');
INSERT INTO `xpcms_area` VALUES ('654300', '阿勒泰地区', '650000', '14');
INSERT INTO `xpcms_area` VALUES ('659000', '省直辖行政单位', '650000', '15');
INSERT INTO `xpcms_area` VALUES ('110101', '东城区', '110100', '1');
INSERT INTO `xpcms_area` VALUES ('110102', '西城区', '110100', '2');
INSERT INTO `xpcms_area` VALUES ('110103', '崇文区', '110100', '3');
INSERT INTO `xpcms_area` VALUES ('110104', '宣武区', '110100', '4');
INSERT INTO `xpcms_area` VALUES ('110105', '朝阳区', '110100', '5');
INSERT INTO `xpcms_area` VALUES ('110106', '丰台区', '110100', '6');
INSERT INTO `xpcms_area` VALUES ('110107', '石景山区', '110100', '7');
INSERT INTO `xpcms_area` VALUES ('110108', '海淀区', '110100', '8');
INSERT INTO `xpcms_area` VALUES ('110109', '门头沟区', '110100', '9');
INSERT INTO `xpcms_area` VALUES ('110111', '房山区', '110100', '10');
INSERT INTO `xpcms_area` VALUES ('110112', '通州区', '110100', '11');
INSERT INTO `xpcms_area` VALUES ('110113', '顺义区', '110100', '12');
INSERT INTO `xpcms_area` VALUES ('110114', '昌平区', '110100', '13');
INSERT INTO `xpcms_area` VALUES ('110115', '大兴区', '110100', '14');
INSERT INTO `xpcms_area` VALUES ('110116', '怀柔区', '110100', '15');
INSERT INTO `xpcms_area` VALUES ('110117', '平谷区', '110100', '16');
INSERT INTO `xpcms_area` VALUES ('110228', '密云县', '110200', '1');
INSERT INTO `xpcms_area` VALUES ('110229', '延庆县', '110200', '2');
INSERT INTO `xpcms_area` VALUES ('120101', '和平区', '120100', '1');
INSERT INTO `xpcms_area` VALUES ('120102', '河东区', '120100', '2');
INSERT INTO `xpcms_area` VALUES ('120103', '河西区', '120100', '3');
INSERT INTO `xpcms_area` VALUES ('120104', '南开区', '120100', '4');
INSERT INTO `xpcms_area` VALUES ('120105', '河北区', '120100', '5');
INSERT INTO `xpcms_area` VALUES ('120106', '红桥区', '120100', '6');
INSERT INTO `xpcms_area` VALUES ('120107', '塘沽区', '120100', '7');
INSERT INTO `xpcms_area` VALUES ('120108', '汉沽区', '120100', '8');
INSERT INTO `xpcms_area` VALUES ('120109', '大港区', '120100', '9');
INSERT INTO `xpcms_area` VALUES ('120110', '东丽区', '120100', '10');
INSERT INTO `xpcms_area` VALUES ('120111', '西青区', '120100', '11');
INSERT INTO `xpcms_area` VALUES ('120112', '津南区', '120100', '12');
INSERT INTO `xpcms_area` VALUES ('120113', '北辰区', '120100', '13');
INSERT INTO `xpcms_area` VALUES ('120114', '武清区', '120100', '14');
INSERT INTO `xpcms_area` VALUES ('120115', '宝坻区', '120100', '15');
INSERT INTO `xpcms_area` VALUES ('120221', '宁河县', '120200', '1');
INSERT INTO `xpcms_area` VALUES ('120223', '静海县', '120200', '2');
INSERT INTO `xpcms_area` VALUES ('120225', '蓟　县', '120200', '3');
INSERT INTO `xpcms_area` VALUES ('130101', '市辖区', '130100', '1');
INSERT INTO `xpcms_area` VALUES ('130102', '长安区', '130100', '2');
INSERT INTO `xpcms_area` VALUES ('130103', '桥东区', '130100', '3');
INSERT INTO `xpcms_area` VALUES ('130104', '桥西区', '130100', '4');
INSERT INTO `xpcms_area` VALUES ('130105', '新华区', '130100', '5');
INSERT INTO `xpcms_area` VALUES ('130107', '井陉矿区', '130100', '6');
INSERT INTO `xpcms_area` VALUES ('130108', '裕华区', '130100', '7');
INSERT INTO `xpcms_area` VALUES ('130121', '井陉县', '130100', '8');
INSERT INTO `xpcms_area` VALUES ('130123', '正定县', '130100', '9');
INSERT INTO `xpcms_area` VALUES ('130124', '栾城县', '130100', '10');
INSERT INTO `xpcms_area` VALUES ('130125', '行唐县', '130100', '11');
INSERT INTO `xpcms_area` VALUES ('130126', '灵寿县', '130100', '12');
INSERT INTO `xpcms_area` VALUES ('130127', '高邑县', '130100', '13');
INSERT INTO `xpcms_area` VALUES ('130128', '深泽县', '130100', '14');
INSERT INTO `xpcms_area` VALUES ('130129', '赞皇县', '130100', '15');
INSERT INTO `xpcms_area` VALUES ('130130', '无极县', '130100', '16');
INSERT INTO `xpcms_area` VALUES ('130131', '平山县', '130100', '17');
INSERT INTO `xpcms_area` VALUES ('130132', '元氏县', '130100', '18');
INSERT INTO `xpcms_area` VALUES ('130133', '赵　县', '130100', '19');
INSERT INTO `xpcms_area` VALUES ('130181', '辛集市', '130100', '20');
INSERT INTO `xpcms_area` VALUES ('130182', '藁城市', '130100', '21');
INSERT INTO `xpcms_area` VALUES ('130183', '晋州市', '130100', '22');
INSERT INTO `xpcms_area` VALUES ('130184', '新乐市', '130100', '23');
INSERT INTO `xpcms_area` VALUES ('130185', '鹿泉市', '130100', '24');
INSERT INTO `xpcms_area` VALUES ('130201', '市辖区', '130200', '1');
INSERT INTO `xpcms_area` VALUES ('130202', '路南区', '130200', '2');
INSERT INTO `xpcms_area` VALUES ('130203', '路北区', '130200', '3');
INSERT INTO `xpcms_area` VALUES ('130204', '古冶区', '130200', '4');
INSERT INTO `xpcms_area` VALUES ('130205', '开平区', '130200', '5');
INSERT INTO `xpcms_area` VALUES ('130207', '丰南区', '130200', '6');
INSERT INTO `xpcms_area` VALUES ('130208', '丰润区', '130200', '7');
INSERT INTO `xpcms_area` VALUES ('130223', '滦　县', '130200', '8');
INSERT INTO `xpcms_area` VALUES ('130224', '滦南县', '130200', '9');
INSERT INTO `xpcms_area` VALUES ('130225', '乐亭县', '130200', '10');
INSERT INTO `xpcms_area` VALUES ('130227', '迁西县', '130200', '11');
INSERT INTO `xpcms_area` VALUES ('130229', '玉田县', '130200', '12');
INSERT INTO `xpcms_area` VALUES ('130230', '唐海县', '130200', '13');
INSERT INTO `xpcms_area` VALUES ('130281', '遵化市', '130200', '14');
INSERT INTO `xpcms_area` VALUES ('130283', '迁安市', '130200', '15');
INSERT INTO `xpcms_area` VALUES ('130301', '市辖区', '130300', '1');
INSERT INTO `xpcms_area` VALUES ('130302', '海港区', '130300', '2');
INSERT INTO `xpcms_area` VALUES ('130303', '山海关区', '130300', '3');
INSERT INTO `xpcms_area` VALUES ('130304', '北戴河区', '130300', '4');
INSERT INTO `xpcms_area` VALUES ('130321', '青龙满族自治县', '130300', '5');
INSERT INTO `xpcms_area` VALUES ('130322', '昌黎县', '130300', '6');
INSERT INTO `xpcms_area` VALUES ('130323', '抚宁县', '130300', '7');
INSERT INTO `xpcms_area` VALUES ('130324', '卢龙县', '130300', '8');
INSERT INTO `xpcms_area` VALUES ('130401', '市辖区', '130400', '1');
INSERT INTO `xpcms_area` VALUES ('130402', '邯山区', '130400', '2');
INSERT INTO `xpcms_area` VALUES ('130403', '丛台区', '130400', '3');
INSERT INTO `xpcms_area` VALUES ('130404', '复兴区', '130400', '4');
INSERT INTO `xpcms_area` VALUES ('130406', '峰峰矿区', '130400', '5');
INSERT INTO `xpcms_area` VALUES ('130421', '邯郸县', '130400', '6');
INSERT INTO `xpcms_area` VALUES ('130423', '临漳县', '130400', '7');
INSERT INTO `xpcms_area` VALUES ('130424', '成安县', '130400', '8');
INSERT INTO `xpcms_area` VALUES ('130425', '大名县', '130400', '9');
INSERT INTO `xpcms_area` VALUES ('130426', '涉　县', '130400', '10');
INSERT INTO `xpcms_area` VALUES ('130427', '磁　县', '130400', '11');
INSERT INTO `xpcms_area` VALUES ('130428', '肥乡县', '130400', '12');
INSERT INTO `xpcms_area` VALUES ('130429', '永年县', '130400', '13');
INSERT INTO `xpcms_area` VALUES ('130430', '邱　县', '130400', '14');
INSERT INTO `xpcms_area` VALUES ('130431', '鸡泽县', '130400', '15');
INSERT INTO `xpcms_area` VALUES ('130432', '广平县', '130400', '16');
INSERT INTO `xpcms_area` VALUES ('130433', '馆陶县', '130400', '17');
INSERT INTO `xpcms_area` VALUES ('130434', '魏　县', '130400', '18');
INSERT INTO `xpcms_area` VALUES ('130435', '曲周县', '130400', '19');
INSERT INTO `xpcms_area` VALUES ('130481', '武安市', '130400', '20');
INSERT INTO `xpcms_area` VALUES ('130501', '市辖区', '130500', '1');
INSERT INTO `xpcms_area` VALUES ('130502', '桥东区', '130500', '2');
INSERT INTO `xpcms_area` VALUES ('130503', '桥西区', '130500', '3');
INSERT INTO `xpcms_area` VALUES ('130521', '邢台县', '130500', '4');
INSERT INTO `xpcms_area` VALUES ('130522', '临城县', '130500', '5');
INSERT INTO `xpcms_area` VALUES ('130523', '内丘县', '130500', '6');
INSERT INTO `xpcms_area` VALUES ('130524', '柏乡县', '130500', '7');
INSERT INTO `xpcms_area` VALUES ('130525', '隆尧县', '130500', '8');
INSERT INTO `xpcms_area` VALUES ('130526', '任　县', '130500', '9');
INSERT INTO `xpcms_area` VALUES ('130527', '南和县', '130500', '10');
INSERT INTO `xpcms_area` VALUES ('130528', '宁晋县', '130500', '11');
INSERT INTO `xpcms_area` VALUES ('130529', '巨鹿县', '130500', '12');
INSERT INTO `xpcms_area` VALUES ('130530', '新河县', '130500', '13');
INSERT INTO `xpcms_area` VALUES ('130531', '广宗县', '130500', '14');
INSERT INTO `xpcms_area` VALUES ('130532', '平乡县', '130500', '15');
INSERT INTO `xpcms_area` VALUES ('130533', '威　县', '130500', '16');
INSERT INTO `xpcms_area` VALUES ('130534', '清河县', '130500', '17');
INSERT INTO `xpcms_area` VALUES ('130535', '临西县', '130500', '18');
INSERT INTO `xpcms_area` VALUES ('130581', '南宫市', '130500', '19');
INSERT INTO `xpcms_area` VALUES ('130582', '沙河市', '130500', '20');
INSERT INTO `xpcms_area` VALUES ('130601', '市辖区', '130600', '1');
INSERT INTO `xpcms_area` VALUES ('130602', '新市区', '130600', '2');
INSERT INTO `xpcms_area` VALUES ('130603', '北市区', '130600', '3');
INSERT INTO `xpcms_area` VALUES ('130604', '南市区', '130600', '4');
INSERT INTO `xpcms_area` VALUES ('130621', '满城县', '130600', '5');
INSERT INTO `xpcms_area` VALUES ('130622', '清苑县', '130600', '6');
INSERT INTO `xpcms_area` VALUES ('130623', '涞水县', '130600', '7');
INSERT INTO `xpcms_area` VALUES ('130624', '阜平县', '130600', '8');
INSERT INTO `xpcms_area` VALUES ('130625', '徐水县', '130600', '9');
INSERT INTO `xpcms_area` VALUES ('130626', '定兴县', '130600', '10');
INSERT INTO `xpcms_area` VALUES ('130627', '唐　县', '130600', '11');
INSERT INTO `xpcms_area` VALUES ('130628', '高阳县', '130600', '12');
INSERT INTO `xpcms_area` VALUES ('130629', '容城县', '130600', '13');
INSERT INTO `xpcms_area` VALUES ('130630', '涞源县', '130600', '14');
INSERT INTO `xpcms_area` VALUES ('130631', '望都县', '130600', '15');
INSERT INTO `xpcms_area` VALUES ('130632', '安新县', '130600', '16');
INSERT INTO `xpcms_area` VALUES ('130633', '易　县', '130600', '17');
INSERT INTO `xpcms_area` VALUES ('130634', '曲阳县', '130600', '18');
INSERT INTO `xpcms_area` VALUES ('130635', '蠡　县', '130600', '19');
INSERT INTO `xpcms_area` VALUES ('130636', '顺平县', '130600', '20');
INSERT INTO `xpcms_area` VALUES ('130637', '博野县', '130600', '21');
INSERT INTO `xpcms_area` VALUES ('130638', '雄　县', '130600', '22');
INSERT INTO `xpcms_area` VALUES ('130681', '涿州市', '130600', '23');
INSERT INTO `xpcms_area` VALUES ('130682', '定州市', '130600', '24');
INSERT INTO `xpcms_area` VALUES ('130683', '安国市', '130600', '25');
INSERT INTO `xpcms_area` VALUES ('130684', '高碑店市', '130600', '26');
INSERT INTO `xpcms_area` VALUES ('130701', '市辖区', '130700', '1');
INSERT INTO `xpcms_area` VALUES ('130702', '桥东区', '130700', '2');
INSERT INTO `xpcms_area` VALUES ('130703', '桥西区', '130700', '3');
INSERT INTO `xpcms_area` VALUES ('130705', '宣化区', '130700', '4');
INSERT INTO `xpcms_area` VALUES ('130706', '下花园区', '130700', '5');
INSERT INTO `xpcms_area` VALUES ('130721', '宣化县', '130700', '6');
INSERT INTO `xpcms_area` VALUES ('130722', '张北县', '130700', '7');
INSERT INTO `xpcms_area` VALUES ('130723', '康保县', '130700', '8');
INSERT INTO `xpcms_area` VALUES ('130724', '沽源县', '130700', '9');
INSERT INTO `xpcms_area` VALUES ('130725', '尚义县', '130700', '10');
INSERT INTO `xpcms_area` VALUES ('130726', '蔚　县', '130700', '11');
INSERT INTO `xpcms_area` VALUES ('130727', '阳原县', '130700', '12');
INSERT INTO `xpcms_area` VALUES ('130728', '怀安县', '130700', '13');
INSERT INTO `xpcms_area` VALUES ('130729', '万全县', '130700', '14');
INSERT INTO `xpcms_area` VALUES ('130730', '怀来县', '130700', '15');
INSERT INTO `xpcms_area` VALUES ('130731', '涿鹿县', '130700', '16');
INSERT INTO `xpcms_area` VALUES ('130732', '赤城县', '130700', '17');
INSERT INTO `xpcms_area` VALUES ('130733', '崇礼县', '130700', '18');
INSERT INTO `xpcms_area` VALUES ('130801', '市辖区', '130800', '1');
INSERT INTO `xpcms_area` VALUES ('130802', '双桥区', '130800', '2');
INSERT INTO `xpcms_area` VALUES ('130803', '双滦区', '130800', '3');
INSERT INTO `xpcms_area` VALUES ('130804', '鹰手营子矿区', '130800', '4');
INSERT INTO `xpcms_area` VALUES ('130821', '承德县', '130800', '5');
INSERT INTO `xpcms_area` VALUES ('130822', '兴隆县', '130800', '6');
INSERT INTO `xpcms_area` VALUES ('130823', '平泉县', '130800', '7');
INSERT INTO `xpcms_area` VALUES ('130824', '滦平县', '130800', '8');
INSERT INTO `xpcms_area` VALUES ('130825', '隆化县', '130800', '9');
INSERT INTO `xpcms_area` VALUES ('130826', '丰宁满族自治县', '130800', '10');
INSERT INTO `xpcms_area` VALUES ('130827', '宽城满族自治县', '130800', '11');
INSERT INTO `xpcms_area` VALUES ('130828', '围场满族蒙古族自治县', '130800', '12');
INSERT INTO `xpcms_area` VALUES ('130901', '市辖区', '130900', '1');
INSERT INTO `xpcms_area` VALUES ('130902', '新华区', '130900', '2');
INSERT INTO `xpcms_area` VALUES ('130903', '运河区', '130900', '3');
INSERT INTO `xpcms_area` VALUES ('130921', '沧　县', '130900', '4');
INSERT INTO `xpcms_area` VALUES ('130922', '青　县', '130900', '5');
INSERT INTO `xpcms_area` VALUES ('130923', '东光县', '130900', '6');
INSERT INTO `xpcms_area` VALUES ('130924', '海兴县', '130900', '7');
INSERT INTO `xpcms_area` VALUES ('130925', '盐山县', '130900', '8');
INSERT INTO `xpcms_area` VALUES ('130926', '肃宁县', '130900', '9');
INSERT INTO `xpcms_area` VALUES ('130927', '南皮县', '130900', '10');
INSERT INTO `xpcms_area` VALUES ('130928', '吴桥县', '130900', '11');
INSERT INTO `xpcms_area` VALUES ('130929', '献　县', '130900', '12');
INSERT INTO `xpcms_area` VALUES ('130930', '孟村回族自治县', '130900', '13');
INSERT INTO `xpcms_area` VALUES ('130981', '泊头市', '130900', '14');
INSERT INTO `xpcms_area` VALUES ('130982', '任丘市', '130900', '15');
INSERT INTO `xpcms_area` VALUES ('130983', '黄骅市', '130900', '16');
INSERT INTO `xpcms_area` VALUES ('130984', '河间市', '130900', '17');
INSERT INTO `xpcms_area` VALUES ('131001', '市辖区', '131000', '1');
INSERT INTO `xpcms_area` VALUES ('131002', '安次区', '131000', '2');
INSERT INTO `xpcms_area` VALUES ('131003', '广阳区', '131000', '3');
INSERT INTO `xpcms_area` VALUES ('131022', '固安县', '131000', '4');
INSERT INTO `xpcms_area` VALUES ('131023', '永清县', '131000', '5');
INSERT INTO `xpcms_area` VALUES ('131024', '香河县', '131000', '6');
INSERT INTO `xpcms_area` VALUES ('131025', '大城县', '131000', '7');
INSERT INTO `xpcms_area` VALUES ('131026', '文安县', '131000', '8');
INSERT INTO `xpcms_area` VALUES ('131028', '大厂回族自治县', '131000', '9');
INSERT INTO `xpcms_area` VALUES ('131081', '霸州市', '131000', '10');
INSERT INTO `xpcms_area` VALUES ('131082', '三河市', '131000', '11');
INSERT INTO `xpcms_area` VALUES ('131101', '市辖区', '131100', '1');
INSERT INTO `xpcms_area` VALUES ('131102', '桃城区', '131100', '2');
INSERT INTO `xpcms_area` VALUES ('131121', '枣强县', '131100', '3');
INSERT INTO `xpcms_area` VALUES ('131122', '武邑县', '131100', '4');
INSERT INTO `xpcms_area` VALUES ('131123', '武强县', '131100', '5');
INSERT INTO `xpcms_area` VALUES ('131124', '饶阳县', '131100', '6');
INSERT INTO `xpcms_area` VALUES ('131125', '安平县', '131100', '7');
INSERT INTO `xpcms_area` VALUES ('131126', '故城县', '131100', '8');
INSERT INTO `xpcms_area` VALUES ('131127', '景　县', '131100', '9');
INSERT INTO `xpcms_area` VALUES ('131128', '阜城县', '131100', '10');
INSERT INTO `xpcms_area` VALUES ('131181', '冀州市', '131100', '11');
INSERT INTO `xpcms_area` VALUES ('131182', '深州市', '131100', '12');
INSERT INTO `xpcms_area` VALUES ('140101', '市辖区', '140100', '1');
INSERT INTO `xpcms_area` VALUES ('140105', '小店区', '140100', '2');
INSERT INTO `xpcms_area` VALUES ('140106', '迎泽区', '140100', '3');
INSERT INTO `xpcms_area` VALUES ('140107', '杏花岭区', '140100', '4');
INSERT INTO `xpcms_area` VALUES ('140108', '尖草坪区', '140100', '5');
INSERT INTO `xpcms_area` VALUES ('140109', '万柏林区', '140100', '6');
INSERT INTO `xpcms_area` VALUES ('140110', '晋源区', '140100', '7');
INSERT INTO `xpcms_area` VALUES ('140121', '清徐县', '140100', '8');
INSERT INTO `xpcms_area` VALUES ('140122', '阳曲县', '140100', '9');
INSERT INTO `xpcms_area` VALUES ('140123', '娄烦县', '140100', '10');
INSERT INTO `xpcms_area` VALUES ('140181', '古交市', '140100', '11');
INSERT INTO `xpcms_area` VALUES ('140201', '市辖区', '140200', '1');
INSERT INTO `xpcms_area` VALUES ('140202', '城　区', '140200', '2');
INSERT INTO `xpcms_area` VALUES ('140203', '矿　区', '140200', '3');
INSERT INTO `xpcms_area` VALUES ('140211', '南郊区', '140200', '4');
INSERT INTO `xpcms_area` VALUES ('140212', '新荣区', '140200', '5');
INSERT INTO `xpcms_area` VALUES ('140221', '阳高县', '140200', '6');
INSERT INTO `xpcms_area` VALUES ('140222', '天镇县', '140200', '7');
INSERT INTO `xpcms_area` VALUES ('140223', '广灵县', '140200', '8');
INSERT INTO `xpcms_area` VALUES ('140224', '灵丘县', '140200', '9');
INSERT INTO `xpcms_area` VALUES ('140225', '浑源县', '140200', '10');
INSERT INTO `xpcms_area` VALUES ('140226', '左云县', '140200', '11');
INSERT INTO `xpcms_area` VALUES ('140227', '大同县', '140200', '12');
INSERT INTO `xpcms_area` VALUES ('140301', '市辖区', '140300', '1');
INSERT INTO `xpcms_area` VALUES ('140302', '城　区', '140300', '2');
INSERT INTO `xpcms_area` VALUES ('140303', '矿　区', '140300', '3');
INSERT INTO `xpcms_area` VALUES ('140311', '郊　区', '140300', '4');
INSERT INTO `xpcms_area` VALUES ('140321', '平定县', '140300', '5');
INSERT INTO `xpcms_area` VALUES ('140322', '盂　县', '140300', '6');
INSERT INTO `xpcms_area` VALUES ('140401', '市辖区', '140400', '1');
INSERT INTO `xpcms_area` VALUES ('140402', '城　区', '140400', '2');
INSERT INTO `xpcms_area` VALUES ('140411', '郊　区', '140400', '3');
INSERT INTO `xpcms_area` VALUES ('140421', '长治县', '140400', '4');
INSERT INTO `xpcms_area` VALUES ('140423', '襄垣县', '140400', '5');
INSERT INTO `xpcms_area` VALUES ('140424', '屯留县', '140400', '6');
INSERT INTO `xpcms_area` VALUES ('140425', '平顺县', '140400', '7');
INSERT INTO `xpcms_area` VALUES ('140426', '黎城县', '140400', '8');
INSERT INTO `xpcms_area` VALUES ('140427', '壶关县', '140400', '9');
INSERT INTO `xpcms_area` VALUES ('140428', '长子县', '140400', '10');
INSERT INTO `xpcms_area` VALUES ('140429', '武乡县', '140400', '11');
INSERT INTO `xpcms_area` VALUES ('140430', '沁　县', '140400', '12');
INSERT INTO `xpcms_area` VALUES ('140431', '沁源县', '140400', '13');
INSERT INTO `xpcms_area` VALUES ('140481', '潞城市', '140400', '14');
INSERT INTO `xpcms_area` VALUES ('140501', '市辖区', '140500', '1');
INSERT INTO `xpcms_area` VALUES ('140502', '城　区', '140500', '2');
INSERT INTO `xpcms_area` VALUES ('140521', '沁水县', '140500', '3');
INSERT INTO `xpcms_area` VALUES ('140522', '阳城县', '140500', '4');
INSERT INTO `xpcms_area` VALUES ('140524', '陵川县', '140500', '5');
INSERT INTO `xpcms_area` VALUES ('140525', '泽州县', '140500', '6');
INSERT INTO `xpcms_area` VALUES ('140581', '高平市', '140500', '7');
INSERT INTO `xpcms_area` VALUES ('140601', '市辖区', '140600', '1');
INSERT INTO `xpcms_area` VALUES ('140602', '朔城区', '140600', '2');
INSERT INTO `xpcms_area` VALUES ('140603', '平鲁区', '140600', '3');
INSERT INTO `xpcms_area` VALUES ('140621', '山阴县', '140600', '4');
INSERT INTO `xpcms_area` VALUES ('140622', '应　县', '140600', '5');
INSERT INTO `xpcms_area` VALUES ('140623', '右玉县', '140600', '6');
INSERT INTO `xpcms_area` VALUES ('140624', '怀仁县', '140600', '7');
INSERT INTO `xpcms_area` VALUES ('140701', '市辖区', '140700', '1');
INSERT INTO `xpcms_area` VALUES ('140702', '榆次区', '140700', '2');
INSERT INTO `xpcms_area` VALUES ('140721', '榆社县', '140700', '3');
INSERT INTO `xpcms_area` VALUES ('140722', '左权县', '140700', '4');
INSERT INTO `xpcms_area` VALUES ('140723', '和顺县', '140700', '5');
INSERT INTO `xpcms_area` VALUES ('140724', '昔阳县', '140700', '6');
INSERT INTO `xpcms_area` VALUES ('140725', '寿阳县', '140700', '7');
INSERT INTO `xpcms_area` VALUES ('140726', '太谷县', '140700', '8');
INSERT INTO `xpcms_area` VALUES ('140727', '祁　县', '140700', '9');
INSERT INTO `xpcms_area` VALUES ('140728', '平遥县', '140700', '10');
INSERT INTO `xpcms_area` VALUES ('140729', '灵石县', '140700', '11');
INSERT INTO `xpcms_area` VALUES ('140781', '介休市', '140700', '12');
INSERT INTO `xpcms_area` VALUES ('140801', '市辖区', '140800', '1');
INSERT INTO `xpcms_area` VALUES ('140802', '盐湖区', '140800', '2');
INSERT INTO `xpcms_area` VALUES ('140821', '临猗县', '140800', '3');
INSERT INTO `xpcms_area` VALUES ('140822', '万荣县', '140800', '4');
INSERT INTO `xpcms_area` VALUES ('140823', '闻喜县', '140800', '5');
INSERT INTO `xpcms_area` VALUES ('140824', '稷山县', '140800', '6');
INSERT INTO `xpcms_area` VALUES ('140825', '新绛县', '140800', '7');
INSERT INTO `xpcms_area` VALUES ('140826', '绛　县', '140800', '8');
INSERT INTO `xpcms_area` VALUES ('140827', '垣曲县', '140800', '9');
INSERT INTO `xpcms_area` VALUES ('140828', '夏　县', '140800', '10');
INSERT INTO `xpcms_area` VALUES ('140829', '平陆县', '140800', '11');
INSERT INTO `xpcms_area` VALUES ('140830', '芮城县', '140800', '12');
INSERT INTO `xpcms_area` VALUES ('140881', '永济市', '140800', '13');
INSERT INTO `xpcms_area` VALUES ('140882', '河津市', '140800', '14');
INSERT INTO `xpcms_area` VALUES ('140901', '市辖区', '140900', '1');
INSERT INTO `xpcms_area` VALUES ('140902', '忻府区', '140900', '2');
INSERT INTO `xpcms_area` VALUES ('140921', '定襄县', '140900', '3');
INSERT INTO `xpcms_area` VALUES ('140922', '五台县', '140900', '4');
INSERT INTO `xpcms_area` VALUES ('140923', '代　县', '140900', '5');
INSERT INTO `xpcms_area` VALUES ('140924', '繁峙县', '140900', '6');
INSERT INTO `xpcms_area` VALUES ('140925', '宁武县', '140900', '7');
INSERT INTO `xpcms_area` VALUES ('140926', '静乐县', '140900', '8');
INSERT INTO `xpcms_area` VALUES ('140927', '神池县', '140900', '9');
INSERT INTO `xpcms_area` VALUES ('140928', '五寨县', '140900', '10');
INSERT INTO `xpcms_area` VALUES ('140929', '岢岚县', '140900', '11');
INSERT INTO `xpcms_area` VALUES ('140930', '河曲县', '140900', '12');
INSERT INTO `xpcms_area` VALUES ('140931', '保德县', '140900', '13');
INSERT INTO `xpcms_area` VALUES ('140932', '偏关县', '140900', '14');
INSERT INTO `xpcms_area` VALUES ('140981', '原平市', '140900', '15');
INSERT INTO `xpcms_area` VALUES ('141001', '市辖区', '141000', '1');
INSERT INTO `xpcms_area` VALUES ('141002', '尧都区', '141000', '2');
INSERT INTO `xpcms_area` VALUES ('141021', '曲沃县', '141000', '3');
INSERT INTO `xpcms_area` VALUES ('141022', '翼城县', '141000', '4');
INSERT INTO `xpcms_area` VALUES ('141023', '襄汾县', '141000', '5');
INSERT INTO `xpcms_area` VALUES ('141024', '洪洞县', '141000', '6');
INSERT INTO `xpcms_area` VALUES ('141025', '古　县', '141000', '7');
INSERT INTO `xpcms_area` VALUES ('141026', '安泽县', '141000', '8');
INSERT INTO `xpcms_area` VALUES ('141027', '浮山县', '141000', '9');
INSERT INTO `xpcms_area` VALUES ('141028', '吉　县', '141000', '10');
INSERT INTO `xpcms_area` VALUES ('141029', '乡宁县', '141000', '11');
INSERT INTO `xpcms_area` VALUES ('141030', '大宁县', '141000', '12');
INSERT INTO `xpcms_area` VALUES ('141031', '隰　县', '141000', '13');
INSERT INTO `xpcms_area` VALUES ('141032', '永和县', '141000', '14');
INSERT INTO `xpcms_area` VALUES ('141033', '蒲　县', '141000', '15');
INSERT INTO `xpcms_area` VALUES ('141034', '汾西县', '141000', '16');
INSERT INTO `xpcms_area` VALUES ('141081', '侯马市', '141000', '17');
INSERT INTO `xpcms_area` VALUES ('141082', '霍州市', '141000', '18');
INSERT INTO `xpcms_area` VALUES ('141101', '市辖区', '141100', '1');
INSERT INTO `xpcms_area` VALUES ('141102', '离石区', '141100', '2');
INSERT INTO `xpcms_area` VALUES ('141121', '文水县', '141100', '3');
INSERT INTO `xpcms_area` VALUES ('141122', '交城县', '141100', '4');
INSERT INTO `xpcms_area` VALUES ('141123', '兴　县', '141100', '5');
INSERT INTO `xpcms_area` VALUES ('141124', '临　县', '141100', '6');
INSERT INTO `xpcms_area` VALUES ('141125', '柳林县', '141100', '7');
INSERT INTO `xpcms_area` VALUES ('141126', '石楼县', '141100', '8');
INSERT INTO `xpcms_area` VALUES ('141127', '岚　县', '141100', '9');
INSERT INTO `xpcms_area` VALUES ('141128', '方山县', '141100', '10');
INSERT INTO `xpcms_area` VALUES ('141129', '中阳县', '141100', '11');
INSERT INTO `xpcms_area` VALUES ('141130', '交口县', '141100', '12');
INSERT INTO `xpcms_area` VALUES ('141181', '孝义市', '141100', '13');
INSERT INTO `xpcms_area` VALUES ('141182', '汾阳市', '141100', '14');
INSERT INTO `xpcms_area` VALUES ('150101', '市辖区', '150100', '1');
INSERT INTO `xpcms_area` VALUES ('150102', '新城区', '150100', '2');
INSERT INTO `xpcms_area` VALUES ('150103', '回民区', '150100', '3');
INSERT INTO `xpcms_area` VALUES ('150104', '玉泉区', '150100', '4');
INSERT INTO `xpcms_area` VALUES ('150105', '赛罕区', '150100', '5');
INSERT INTO `xpcms_area` VALUES ('150121', '土默特左旗', '150100', '6');
INSERT INTO `xpcms_area` VALUES ('150122', '托克托县', '150100', '7');
INSERT INTO `xpcms_area` VALUES ('150123', '和林格尔县', '150100', '8');
INSERT INTO `xpcms_area` VALUES ('150124', '清水河县', '150100', '9');
INSERT INTO `xpcms_area` VALUES ('150125', '武川县', '150100', '10');
INSERT INTO `xpcms_area` VALUES ('150201', '市辖区', '150200', '1');
INSERT INTO `xpcms_area` VALUES ('150202', '东河区', '150200', '2');
INSERT INTO `xpcms_area` VALUES ('150203', '昆都仑区', '150200', '3');
INSERT INTO `xpcms_area` VALUES ('150204', '青山区', '150200', '4');
INSERT INTO `xpcms_area` VALUES ('150205', '石拐区', '150200', '5');
INSERT INTO `xpcms_area` VALUES ('150206', '白云矿区', '150200', '6');
INSERT INTO `xpcms_area` VALUES ('150207', '九原区', '150200', '7');
INSERT INTO `xpcms_area` VALUES ('150221', '土默特右旗', '150200', '8');
INSERT INTO `xpcms_area` VALUES ('150222', '固阳县', '150200', '9');
INSERT INTO `xpcms_area` VALUES ('150223', '达尔罕茂明安联合旗', '150200', '10');
INSERT INTO `xpcms_area` VALUES ('150301', '市辖区', '150300', '1');
INSERT INTO `xpcms_area` VALUES ('150302', '海勃湾区', '150300', '2');
INSERT INTO `xpcms_area` VALUES ('150303', '海南区', '150300', '3');
INSERT INTO `xpcms_area` VALUES ('150304', '乌达区', '150300', '4');
INSERT INTO `xpcms_area` VALUES ('150401', '市辖区', '150400', '1');
INSERT INTO `xpcms_area` VALUES ('150402', '红山区', '150400', '2');
INSERT INTO `xpcms_area` VALUES ('150403', '元宝山区', '150400', '3');
INSERT INTO `xpcms_area` VALUES ('150404', '松山区', '150400', '4');
INSERT INTO `xpcms_area` VALUES ('150421', '阿鲁科尔沁旗', '150400', '5');
INSERT INTO `xpcms_area` VALUES ('150422', '巴林左旗', '150400', '6');
INSERT INTO `xpcms_area` VALUES ('150423', '巴林右旗', '150400', '7');
INSERT INTO `xpcms_area` VALUES ('150424', '林西县', '150400', '8');
INSERT INTO `xpcms_area` VALUES ('150425', '克什克腾旗', '150400', '9');
INSERT INTO `xpcms_area` VALUES ('150426', '翁牛特旗', '150400', '10');
INSERT INTO `xpcms_area` VALUES ('150428', '喀喇沁旗', '150400', '11');
INSERT INTO `xpcms_area` VALUES ('150429', '宁城县', '150400', '12');
INSERT INTO `xpcms_area` VALUES ('150430', '敖汉旗', '150400', '13');
INSERT INTO `xpcms_area` VALUES ('150501', '市辖区', '150500', '1');
INSERT INTO `xpcms_area` VALUES ('150502', '科尔沁区', '150500', '2');
INSERT INTO `xpcms_area` VALUES ('150521', '科尔沁左翼中旗', '150500', '3');
INSERT INTO `xpcms_area` VALUES ('150522', '科尔沁左翼后旗', '150500', '4');
INSERT INTO `xpcms_area` VALUES ('150523', '开鲁县', '150500', '5');
INSERT INTO `xpcms_area` VALUES ('150524', '库伦旗', '150500', '6');
INSERT INTO `xpcms_area` VALUES ('150525', '奈曼旗', '150500', '7');
INSERT INTO `xpcms_area` VALUES ('150526', '扎鲁特旗', '150500', '8');
INSERT INTO `xpcms_area` VALUES ('150581', '霍林郭勒市', '150500', '9');
INSERT INTO `xpcms_area` VALUES ('150602', '东胜区', '150600', '1');
INSERT INTO `xpcms_area` VALUES ('150621', '达拉特旗', '150600', '2');
INSERT INTO `xpcms_area` VALUES ('150622', '准格尔旗', '150600', '3');
INSERT INTO `xpcms_area` VALUES ('150623', '鄂托克前旗', '150600', '4');
INSERT INTO `xpcms_area` VALUES ('150624', '鄂托克旗', '150600', '5');
INSERT INTO `xpcms_area` VALUES ('150625', '杭锦旗', '150600', '6');
INSERT INTO `xpcms_area` VALUES ('150626', '乌审旗', '150600', '7');
INSERT INTO `xpcms_area` VALUES ('150627', '伊金霍洛旗', '150600', '8');
INSERT INTO `xpcms_area` VALUES ('150701', '市辖区', '150700', '1');
INSERT INTO `xpcms_area` VALUES ('150702', '海拉尔区', '150700', '2');
INSERT INTO `xpcms_area` VALUES ('150721', '阿荣旗', '150700', '3');
INSERT INTO `xpcms_area` VALUES ('150722', '莫力达瓦达斡尔族自治旗', '150700', '4');
INSERT INTO `xpcms_area` VALUES ('150723', '鄂伦春自治旗', '150700', '5');
INSERT INTO `xpcms_area` VALUES ('150724', '鄂温克族自治旗', '150700', '6');
INSERT INTO `xpcms_area` VALUES ('150725', '陈巴尔虎旗', '150700', '7');
INSERT INTO `xpcms_area` VALUES ('150726', '新巴尔虎左旗', '150700', '8');
INSERT INTO `xpcms_area` VALUES ('150727', '新巴尔虎右旗', '150700', '9');
INSERT INTO `xpcms_area` VALUES ('150781', '满洲里市', '150700', '10');
INSERT INTO `xpcms_area` VALUES ('150782', '牙克石市', '150700', '11');
INSERT INTO `xpcms_area` VALUES ('150783', '扎兰屯市', '150700', '12');
INSERT INTO `xpcms_area` VALUES ('150784', '额尔古纳市', '150700', '13');
INSERT INTO `xpcms_area` VALUES ('150785', '根河市', '150700', '14');
INSERT INTO `xpcms_area` VALUES ('150801', '市辖区', '150800', '1');
INSERT INTO `xpcms_area` VALUES ('150802', '临河区', '150800', '2');
INSERT INTO `xpcms_area` VALUES ('150821', '五原县', '150800', '3');
INSERT INTO `xpcms_area` VALUES ('150822', '磴口县', '150800', '4');
INSERT INTO `xpcms_area` VALUES ('150823', '乌拉特前旗', '150800', '5');
INSERT INTO `xpcms_area` VALUES ('150824', '乌拉特中旗', '150800', '6');
INSERT INTO `xpcms_area` VALUES ('150825', '乌拉特后旗', '150800', '7');
INSERT INTO `xpcms_area` VALUES ('150826', '杭锦后旗', '150800', '8');
INSERT INTO `xpcms_area` VALUES ('150901', '市辖区', '150900', '1');
INSERT INTO `xpcms_area` VALUES ('150902', '集宁区', '150900', '2');
INSERT INTO `xpcms_area` VALUES ('150921', '卓资县', '150900', '3');
INSERT INTO `xpcms_area` VALUES ('150922', '化德县', '150900', '4');
INSERT INTO `xpcms_area` VALUES ('150923', '商都县', '150900', '5');
INSERT INTO `xpcms_area` VALUES ('150924', '兴和县', '150900', '6');
INSERT INTO `xpcms_area` VALUES ('150925', '凉城县', '150900', '7');
INSERT INTO `xpcms_area` VALUES ('150926', '察哈尔右翼前旗', '150900', '8');
INSERT INTO `xpcms_area` VALUES ('150927', '察哈尔右翼中旗', '150900', '9');
INSERT INTO `xpcms_area` VALUES ('150928', '察哈尔右翼后旗', '150900', '10');
INSERT INTO `xpcms_area` VALUES ('150929', '四子王旗', '150900', '11');
INSERT INTO `xpcms_area` VALUES ('150981', '丰镇市', '150900', '12');
INSERT INTO `xpcms_area` VALUES ('152201', '乌兰浩特市', '152200', '1');
INSERT INTO `xpcms_area` VALUES ('152202', '阿尔山市', '152200', '2');
INSERT INTO `xpcms_area` VALUES ('152221', '科尔沁右翼前旗', '152200', '3');
INSERT INTO `xpcms_area` VALUES ('152222', '科尔沁右翼中旗', '152200', '4');
INSERT INTO `xpcms_area` VALUES ('152223', '扎赉特旗', '152200', '5');
INSERT INTO `xpcms_area` VALUES ('152224', '突泉县', '152200', '6');
INSERT INTO `xpcms_area` VALUES ('152501', '二连浩特市', '152500', '1');
INSERT INTO `xpcms_area` VALUES ('152502', '锡林浩特市', '152500', '2');
INSERT INTO `xpcms_area` VALUES ('152522', '阿巴嘎旗', '152500', '3');
INSERT INTO `xpcms_area` VALUES ('152523', '苏尼特左旗', '152500', '4');
INSERT INTO `xpcms_area` VALUES ('152524', '苏尼特右旗', '152500', '5');
INSERT INTO `xpcms_area` VALUES ('152525', '东乌珠穆沁旗', '152500', '6');
INSERT INTO `xpcms_area` VALUES ('152526', '西乌珠穆沁旗', '152500', '7');
INSERT INTO `xpcms_area` VALUES ('152527', '太仆寺旗', '152500', '8');
INSERT INTO `xpcms_area` VALUES ('152528', '镶黄旗', '152500', '9');
INSERT INTO `xpcms_area` VALUES ('152529', '正镶白旗', '152500', '10');
INSERT INTO `xpcms_area` VALUES ('152530', '正蓝旗', '152500', '11');
INSERT INTO `xpcms_area` VALUES ('152531', '多伦县', '152500', '12');
INSERT INTO `xpcms_area` VALUES ('152921', '阿拉善左旗', '152900', '1');
INSERT INTO `xpcms_area` VALUES ('152922', '阿拉善右旗', '152900', '2');
INSERT INTO `xpcms_area` VALUES ('152923', '额济纳旗', '152900', '3');
INSERT INTO `xpcms_area` VALUES ('210101', '市辖区', '210100', '1');
INSERT INTO `xpcms_area` VALUES ('210102', '和平区', '210100', '2');
INSERT INTO `xpcms_area` VALUES ('210103', '沈河区', '210100', '3');
INSERT INTO `xpcms_area` VALUES ('210104', '大东区', '210100', '4');
INSERT INTO `xpcms_area` VALUES ('210105', '皇姑区', '210100', '5');
INSERT INTO `xpcms_area` VALUES ('210106', '铁西区', '210100', '6');
INSERT INTO `xpcms_area` VALUES ('210111', '苏家屯区', '210100', '7');
INSERT INTO `xpcms_area` VALUES ('210112', '东陵区', '210100', '8');
INSERT INTO `xpcms_area` VALUES ('210113', '新城子区', '210100', '9');
INSERT INTO `xpcms_area` VALUES ('210114', '于洪区', '210100', '10');
INSERT INTO `xpcms_area` VALUES ('210122', '辽中县', '210100', '11');
INSERT INTO `xpcms_area` VALUES ('210123', '康平县', '210100', '12');
INSERT INTO `xpcms_area` VALUES ('210124', '法库县', '210100', '13');
INSERT INTO `xpcms_area` VALUES ('210181', '新民市', '210100', '14');
INSERT INTO `xpcms_area` VALUES ('210201', '市辖区', '210200', '1');
INSERT INTO `xpcms_area` VALUES ('210202', '中山区', '210200', '2');
INSERT INTO `xpcms_area` VALUES ('210203', '西岗区', '210200', '3');
INSERT INTO `xpcms_area` VALUES ('210204', '沙河口区', '210200', '4');
INSERT INTO `xpcms_area` VALUES ('210211', '甘井子区', '210200', '5');
INSERT INTO `xpcms_area` VALUES ('210212', '旅顺口区', '210200', '6');
INSERT INTO `xpcms_area` VALUES ('210213', '金州区', '210200', '7');
INSERT INTO `xpcms_area` VALUES ('210224', '长海县', '210200', '8');
INSERT INTO `xpcms_area` VALUES ('210281', '瓦房店市', '210200', '9');
INSERT INTO `xpcms_area` VALUES ('210282', '普兰店市', '210200', '10');
INSERT INTO `xpcms_area` VALUES ('210283', '庄河市', '210200', '11');
INSERT INTO `xpcms_area` VALUES ('210301', '市辖区', '210300', '1');
INSERT INTO `xpcms_area` VALUES ('210302', '铁东区', '210300', '2');
INSERT INTO `xpcms_area` VALUES ('210303', '铁西区', '210300', '3');
INSERT INTO `xpcms_area` VALUES ('210304', '立山区', '210300', '4');
INSERT INTO `xpcms_area` VALUES ('210311', '千山区', '210300', '5');
INSERT INTO `xpcms_area` VALUES ('210321', '台安县', '210300', '6');
INSERT INTO `xpcms_area` VALUES ('210323', '岫岩满族自治县', '210300', '7');
INSERT INTO `xpcms_area` VALUES ('210381', '海城市', '210300', '8');
INSERT INTO `xpcms_area` VALUES ('210401', '市辖区', '210400', '1');
INSERT INTO `xpcms_area` VALUES ('210402', '新抚区', '210400', '2');
INSERT INTO `xpcms_area` VALUES ('210403', '东洲区', '210400', '3');
INSERT INTO `xpcms_area` VALUES ('210404', '望花区', '210400', '4');
INSERT INTO `xpcms_area` VALUES ('210411', '顺城区', '210400', '5');
INSERT INTO `xpcms_area` VALUES ('210421', '抚顺县', '210400', '6');
INSERT INTO `xpcms_area` VALUES ('210422', '新宾满族自治县', '210400', '7');
INSERT INTO `xpcms_area` VALUES ('210423', '清原满族自治县', '210400', '8');
INSERT INTO `xpcms_area` VALUES ('210501', '市辖区', '210500', '1');
INSERT INTO `xpcms_area` VALUES ('210502', '平山区', '210500', '2');
INSERT INTO `xpcms_area` VALUES ('210503', '溪湖区', '210500', '3');
INSERT INTO `xpcms_area` VALUES ('210504', '明山区', '210500', '4');
INSERT INTO `xpcms_area` VALUES ('210505', '南芬区', '210500', '5');
INSERT INTO `xpcms_area` VALUES ('210521', '本溪满族自治县', '210500', '6');
INSERT INTO `xpcms_area` VALUES ('210522', '桓仁满族自治县', '210500', '7');
INSERT INTO `xpcms_area` VALUES ('210601', '市辖区', '210600', '1');
INSERT INTO `xpcms_area` VALUES ('210602', '元宝区', '210600', '2');
INSERT INTO `xpcms_area` VALUES ('210603', '振兴区', '210600', '3');
INSERT INTO `xpcms_area` VALUES ('210604', '振安区', '210600', '4');
INSERT INTO `xpcms_area` VALUES ('210624', '宽甸满族自治县', '210600', '5');
INSERT INTO `xpcms_area` VALUES ('210681', '东港市', '210600', '6');
INSERT INTO `xpcms_area` VALUES ('210682', '凤城市', '210600', '7');
INSERT INTO `xpcms_area` VALUES ('210701', '市辖区', '210700', '1');
INSERT INTO `xpcms_area` VALUES ('210702', '古塔区', '210700', '2');
INSERT INTO `xpcms_area` VALUES ('210703', '凌河区', '210700', '3');
INSERT INTO `xpcms_area` VALUES ('210711', '太和区', '210700', '4');
INSERT INTO `xpcms_area` VALUES ('210726', '黑山县', '210700', '5');
INSERT INTO `xpcms_area` VALUES ('210727', '义　县', '210700', '6');
INSERT INTO `xpcms_area` VALUES ('210781', '凌海市', '210700', '7');
INSERT INTO `xpcms_area` VALUES ('210782', '北宁市', '210700', '8');
INSERT INTO `xpcms_area` VALUES ('210801', '市辖区', '210800', '1');
INSERT INTO `xpcms_area` VALUES ('210802', '站前区', '210800', '2');
INSERT INTO `xpcms_area` VALUES ('210803', '西市区', '210800', '3');
INSERT INTO `xpcms_area` VALUES ('210804', '鲅鱼圈区', '210800', '4');
INSERT INTO `xpcms_area` VALUES ('210811', '老边区', '210800', '5');
INSERT INTO `xpcms_area` VALUES ('210881', '盖州市', '210800', '6');
INSERT INTO `xpcms_area` VALUES ('210882', '大石桥市', '210800', '7');
INSERT INTO `xpcms_area` VALUES ('210901', '市辖区', '210900', '1');
INSERT INTO `xpcms_area` VALUES ('210902', '海州区', '210900', '2');
INSERT INTO `xpcms_area` VALUES ('210903', '新邱区', '210900', '3');
INSERT INTO `xpcms_area` VALUES ('210904', '太平区', '210900', '4');
INSERT INTO `xpcms_area` VALUES ('210905', '清河门区', '210900', '5');
INSERT INTO `xpcms_area` VALUES ('210911', '细河区', '210900', '6');
INSERT INTO `xpcms_area` VALUES ('210921', '阜新蒙古族自治县', '210900', '7');
INSERT INTO `xpcms_area` VALUES ('210922', '彰武县', '210900', '8');
INSERT INTO `xpcms_area` VALUES ('211001', '市辖区', '211000', '1');
INSERT INTO `xpcms_area` VALUES ('211002', '白塔区', '211000', '2');
INSERT INTO `xpcms_area` VALUES ('211003', '文圣区', '211000', '3');
INSERT INTO `xpcms_area` VALUES ('211004', '宏伟区', '211000', '4');
INSERT INTO `xpcms_area` VALUES ('211005', '弓长岭区', '211000', '5');
INSERT INTO `xpcms_area` VALUES ('211011', '太子河区', '211000', '6');
INSERT INTO `xpcms_area` VALUES ('211021', '辽阳县', '211000', '7');
INSERT INTO `xpcms_area` VALUES ('211081', '灯塔市', '211000', '8');
INSERT INTO `xpcms_area` VALUES ('211101', '市辖区', '211100', '1');
INSERT INTO `xpcms_area` VALUES ('211102', '双台子区', '211100', '2');
INSERT INTO `xpcms_area` VALUES ('211103', '兴隆台区', '211100', '3');
INSERT INTO `xpcms_area` VALUES ('211121', '大洼县', '211100', '4');
INSERT INTO `xpcms_area` VALUES ('211122', '盘山县', '211100', '5');
INSERT INTO `xpcms_area` VALUES ('211201', '市辖区', '211200', '1');
INSERT INTO `xpcms_area` VALUES ('211202', '银州区', '211200', '2');
INSERT INTO `xpcms_area` VALUES ('211204', '清河区', '211200', '3');
INSERT INTO `xpcms_area` VALUES ('211221', '铁岭县', '211200', '4');
INSERT INTO `xpcms_area` VALUES ('211223', '西丰县', '211200', '5');
INSERT INTO `xpcms_area` VALUES ('211224', '昌图县', '211200', '6');
INSERT INTO `xpcms_area` VALUES ('211281', '调兵山市', '211200', '7');
INSERT INTO `xpcms_area` VALUES ('211282', '开原市', '211200', '8');
INSERT INTO `xpcms_area` VALUES ('211301', '市辖区', '211300', '1');
INSERT INTO `xpcms_area` VALUES ('211302', '双塔区', '211300', '2');
INSERT INTO `xpcms_area` VALUES ('211303', '龙城区', '211300', '3');
INSERT INTO `xpcms_area` VALUES ('211321', '朝阳县', '211300', '4');
INSERT INTO `xpcms_area` VALUES ('211322', '建平县', '211300', '5');
INSERT INTO `xpcms_area` VALUES ('211324', '喀喇沁左翼蒙古族自治县', '211300', '6');
INSERT INTO `xpcms_area` VALUES ('211381', '北票市', '211300', '7');
INSERT INTO `xpcms_area` VALUES ('211382', '凌源市', '211300', '8');
INSERT INTO `xpcms_area` VALUES ('211401', '市辖区', '211400', '1');
INSERT INTO `xpcms_area` VALUES ('211402', '连山区', '211400', '2');
INSERT INTO `xpcms_area` VALUES ('211403', '龙港区', '211400', '3');
INSERT INTO `xpcms_area` VALUES ('211404', '南票区', '211400', '4');
INSERT INTO `xpcms_area` VALUES ('211421', '绥中县', '211400', '5');
INSERT INTO `xpcms_area` VALUES ('211422', '建昌县', '211400', '6');
INSERT INTO `xpcms_area` VALUES ('211481', '兴城市', '211400', '7');
INSERT INTO `xpcms_area` VALUES ('220101', '市辖区', '220100', '1');
INSERT INTO `xpcms_area` VALUES ('220102', '南关区', '220100', '2');
INSERT INTO `xpcms_area` VALUES ('220103', '宽城区', '220100', '3');
INSERT INTO `xpcms_area` VALUES ('220104', '朝阳区', '220100', '4');
INSERT INTO `xpcms_area` VALUES ('220105', '二道区', '220100', '5');
INSERT INTO `xpcms_area` VALUES ('220106', '绿园区', '220100', '6');
INSERT INTO `xpcms_area` VALUES ('220112', '双阳区', '220100', '7');
INSERT INTO `xpcms_area` VALUES ('220122', '农安县', '220100', '8');
INSERT INTO `xpcms_area` VALUES ('220181', '九台市', '220100', '9');
INSERT INTO `xpcms_area` VALUES ('220182', '榆树市', '220100', '10');
INSERT INTO `xpcms_area` VALUES ('220183', '德惠市', '220100', '11');
INSERT INTO `xpcms_area` VALUES ('220201', '市辖区', '220200', '1');
INSERT INTO `xpcms_area` VALUES ('220202', '昌邑区', '220200', '2');
INSERT INTO `xpcms_area` VALUES ('220203', '龙潭区', '220200', '3');
INSERT INTO `xpcms_area` VALUES ('220204', '船营区', '220200', '4');
INSERT INTO `xpcms_area` VALUES ('220211', '丰满区', '220200', '5');
INSERT INTO `xpcms_area` VALUES ('220221', '永吉县', '220200', '6');
INSERT INTO `xpcms_area` VALUES ('220281', '蛟河市', '220200', '7');
INSERT INTO `xpcms_area` VALUES ('220282', '桦甸市', '220200', '8');
INSERT INTO `xpcms_area` VALUES ('220283', '舒兰市', '220200', '9');
INSERT INTO `xpcms_area` VALUES ('220284', '磐石市', '220200', '10');
INSERT INTO `xpcms_area` VALUES ('220301', '市辖区', '220300', '1');
INSERT INTO `xpcms_area` VALUES ('220302', '铁西区', '220300', '2');
INSERT INTO `xpcms_area` VALUES ('220303', '铁东区', '220300', '3');
INSERT INTO `xpcms_area` VALUES ('220322', '梨树县', '220300', '4');
INSERT INTO `xpcms_area` VALUES ('220323', '伊通满族自治县', '220300', '5');
INSERT INTO `xpcms_area` VALUES ('220381', '公主岭市', '220300', '6');
INSERT INTO `xpcms_area` VALUES ('220382', '双辽市', '220300', '7');
INSERT INTO `xpcms_area` VALUES ('220401', '市辖区', '220400', '1');
INSERT INTO `xpcms_area` VALUES ('220402', '龙山区', '220400', '2');
INSERT INTO `xpcms_area` VALUES ('220403', '西安区', '220400', '3');
INSERT INTO `xpcms_area` VALUES ('220421', '东丰县', '220400', '4');
INSERT INTO `xpcms_area` VALUES ('220422', '东辽县', '220400', '5');
INSERT INTO `xpcms_area` VALUES ('220501', '市辖区', '220500', '1');
INSERT INTO `xpcms_area` VALUES ('220502', '东昌区', '220500', '2');
INSERT INTO `xpcms_area` VALUES ('220503', '二道江区', '220500', '3');
INSERT INTO `xpcms_area` VALUES ('220521', '通化县', '220500', '4');
INSERT INTO `xpcms_area` VALUES ('220523', '辉南县', '220500', '5');
INSERT INTO `xpcms_area` VALUES ('220524', '柳河县', '220500', '6');
INSERT INTO `xpcms_area` VALUES ('220581', '梅河口市', '220500', '7');
INSERT INTO `xpcms_area` VALUES ('220582', '集安市', '220500', '8');
INSERT INTO `xpcms_area` VALUES ('220601', '市辖区', '220600', '1');
INSERT INTO `xpcms_area` VALUES ('220602', '八道江区', '220600', '2');
INSERT INTO `xpcms_area` VALUES ('220621', '抚松县', '220600', '3');
INSERT INTO `xpcms_area` VALUES ('220622', '靖宇县', '220600', '4');
INSERT INTO `xpcms_area` VALUES ('220623', '长白朝鲜族自治县', '220600', '5');
INSERT INTO `xpcms_area` VALUES ('220625', '江源县', '220600', '6');
INSERT INTO `xpcms_area` VALUES ('220681', '临江市', '220600', '7');
INSERT INTO `xpcms_area` VALUES ('220701', '市辖区', '220700', '1');
INSERT INTO `xpcms_area` VALUES ('220702', '宁江区', '220700', '2');
INSERT INTO `xpcms_area` VALUES ('220721', '前郭尔罗斯蒙古族自治县', '220700', '3');
INSERT INTO `xpcms_area` VALUES ('220722', '长岭县', '220700', '4');
INSERT INTO `xpcms_area` VALUES ('220723', '乾安县', '220700', '5');
INSERT INTO `xpcms_area` VALUES ('220724', '扶余县', '220700', '6');
INSERT INTO `xpcms_area` VALUES ('220801', '市辖区', '220800', '1');
INSERT INTO `xpcms_area` VALUES ('220802', '洮北区', '220800', '2');
INSERT INTO `xpcms_area` VALUES ('220821', '镇赉县', '220800', '3');
INSERT INTO `xpcms_area` VALUES ('220822', '通榆县', '220800', '4');
INSERT INTO `xpcms_area` VALUES ('220881', '洮南市', '220800', '5');
INSERT INTO `xpcms_area` VALUES ('220882', '大安市', '220800', '6');
INSERT INTO `xpcms_area` VALUES ('222401', '延吉市', '222400', '1');
INSERT INTO `xpcms_area` VALUES ('222402', '图们市', '222400', '2');
INSERT INTO `xpcms_area` VALUES ('222403', '敦化市', '222400', '3');
INSERT INTO `xpcms_area` VALUES ('222404', '珲春市', '222400', '4');
INSERT INTO `xpcms_area` VALUES ('222405', '龙井市', '222400', '5');
INSERT INTO `xpcms_area` VALUES ('222406', '和龙市', '222400', '6');
INSERT INTO `xpcms_area` VALUES ('222424', '汪清县', '222400', '7');
INSERT INTO `xpcms_area` VALUES ('222426', '安图县', '222400', '8');
INSERT INTO `xpcms_area` VALUES ('230101', '市辖区', '230100', '1');
INSERT INTO `xpcms_area` VALUES ('230102', '道里区', '230100', '2');
INSERT INTO `xpcms_area` VALUES ('230103', '南岗区', '230100', '3');
INSERT INTO `xpcms_area` VALUES ('230104', '道外区', '230100', '4');
INSERT INTO `xpcms_area` VALUES ('230106', '香坊区', '230100', '5');
INSERT INTO `xpcms_area` VALUES ('230107', '动力区', '230100', '6');
INSERT INTO `xpcms_area` VALUES ('230108', '平房区', '230100', '7');
INSERT INTO `xpcms_area` VALUES ('230109', '松北区', '230100', '8');
INSERT INTO `xpcms_area` VALUES ('230111', '呼兰区', '230100', '9');
INSERT INTO `xpcms_area` VALUES ('230123', '依兰县', '230100', '10');
INSERT INTO `xpcms_area` VALUES ('230124', '方正县', '230100', '11');
INSERT INTO `xpcms_area` VALUES ('230125', '宾　县', '230100', '12');
INSERT INTO `xpcms_area` VALUES ('230126', '巴彦县', '230100', '13');
INSERT INTO `xpcms_area` VALUES ('230127', '木兰县', '230100', '14');
INSERT INTO `xpcms_area` VALUES ('230128', '通河县', '230100', '15');
INSERT INTO `xpcms_area` VALUES ('230129', '延寿县', '230100', '16');
INSERT INTO `xpcms_area` VALUES ('230181', '阿城市', '230100', '17');
INSERT INTO `xpcms_area` VALUES ('230182', '双城市', '230100', '18');
INSERT INTO `xpcms_area` VALUES ('230183', '尚志市', '230100', '19');
INSERT INTO `xpcms_area` VALUES ('230184', '五常市', '230100', '20');
INSERT INTO `xpcms_area` VALUES ('230201', '市辖区', '230200', '1');
INSERT INTO `xpcms_area` VALUES ('230202', '龙沙区', '230200', '2');
INSERT INTO `xpcms_area` VALUES ('230203', '建华区', '230200', '3');
INSERT INTO `xpcms_area` VALUES ('230204', '铁锋区', '230200', '4');
INSERT INTO `xpcms_area` VALUES ('230205', '昂昂溪区', '230200', '5');
INSERT INTO `xpcms_area` VALUES ('230206', '富拉尔基区', '230200', '6');
INSERT INTO `xpcms_area` VALUES ('230207', '碾子山区', '230200', '7');
INSERT INTO `xpcms_area` VALUES ('230208', '梅里斯达斡尔族区', '230200', '8');
INSERT INTO `xpcms_area` VALUES ('230221', '龙江县', '230200', '9');
INSERT INTO `xpcms_area` VALUES ('230223', '依安县', '230200', '10');
INSERT INTO `xpcms_area` VALUES ('230224', '泰来县', '230200', '11');
INSERT INTO `xpcms_area` VALUES ('230225', '甘南县', '230200', '12');
INSERT INTO `xpcms_area` VALUES ('230227', '富裕县', '230200', '13');
INSERT INTO `xpcms_area` VALUES ('230229', '克山县', '230200', '14');
INSERT INTO `xpcms_area` VALUES ('230230', '克东县', '230200', '15');
INSERT INTO `xpcms_area` VALUES ('230231', '拜泉县', '230200', '16');
INSERT INTO `xpcms_area` VALUES ('230281', '讷河市', '230200', '17');
INSERT INTO `xpcms_area` VALUES ('230301', '市辖区', '230300', '1');
INSERT INTO `xpcms_area` VALUES ('230302', '鸡冠区', '230300', '2');
INSERT INTO `xpcms_area` VALUES ('230303', '恒山区', '230300', '3');
INSERT INTO `xpcms_area` VALUES ('230304', '滴道区', '230300', '4');
INSERT INTO `xpcms_area` VALUES ('230305', '梨树区', '230300', '5');
INSERT INTO `xpcms_area` VALUES ('230306', '城子河区', '230300', '6');
INSERT INTO `xpcms_area` VALUES ('230307', '麻山区', '230300', '7');
INSERT INTO `xpcms_area` VALUES ('230321', '鸡东县', '230300', '8');
INSERT INTO `xpcms_area` VALUES ('230381', '虎林市', '230300', '9');
INSERT INTO `xpcms_area` VALUES ('230382', '密山市', '230300', '10');
INSERT INTO `xpcms_area` VALUES ('230401', '市辖区', '230400', '1');
INSERT INTO `xpcms_area` VALUES ('230402', '向阳区', '230400', '2');
INSERT INTO `xpcms_area` VALUES ('230403', '工农区', '230400', '3');
INSERT INTO `xpcms_area` VALUES ('230404', '南山区', '230400', '4');
INSERT INTO `xpcms_area` VALUES ('230405', '兴安区', '230400', '5');
INSERT INTO `xpcms_area` VALUES ('230406', '东山区', '230400', '6');
INSERT INTO `xpcms_area` VALUES ('230407', '兴山区', '230400', '7');
INSERT INTO `xpcms_area` VALUES ('230421', '萝北县', '230400', '8');
INSERT INTO `xpcms_area` VALUES ('230422', '绥滨县', '230400', '9');
INSERT INTO `xpcms_area` VALUES ('230501', '市辖区', '230500', '1');
INSERT INTO `xpcms_area` VALUES ('230502', '尖山区', '230500', '2');
INSERT INTO `xpcms_area` VALUES ('230503', '岭东区', '230500', '3');
INSERT INTO `xpcms_area` VALUES ('230505', '四方台区', '230500', '4');
INSERT INTO `xpcms_area` VALUES ('230506', '宝山区', '230500', '5');
INSERT INTO `xpcms_area` VALUES ('230521', '集贤县', '230500', '6');
INSERT INTO `xpcms_area` VALUES ('230522', '友谊县', '230500', '7');
INSERT INTO `xpcms_area` VALUES ('230523', '宝清县', '230500', '8');
INSERT INTO `xpcms_area` VALUES ('230524', '饶河县', '230500', '9');
INSERT INTO `xpcms_area` VALUES ('230601', '市辖区', '230600', '1');
INSERT INTO `xpcms_area` VALUES ('230602', '萨尔图区', '230600', '2');
INSERT INTO `xpcms_area` VALUES ('230603', '龙凤区', '230600', '3');
INSERT INTO `xpcms_area` VALUES ('230604', '让胡路区', '230600', '4');
INSERT INTO `xpcms_area` VALUES ('230605', '红岗区', '230600', '5');
INSERT INTO `xpcms_area` VALUES ('230606', '大同区', '230600', '6');
INSERT INTO `xpcms_area` VALUES ('230621', '肇州县', '230600', '7');
INSERT INTO `xpcms_area` VALUES ('230622', '肇源县', '230600', '8');
INSERT INTO `xpcms_area` VALUES ('230623', '林甸县', '230600', '9');
INSERT INTO `xpcms_area` VALUES ('230624', '杜尔伯特蒙古族自治县', '230600', '10');
INSERT INTO `xpcms_area` VALUES ('230701', '市辖区', '230700', '1');
INSERT INTO `xpcms_area` VALUES ('230702', '伊春区', '230700', '2');
INSERT INTO `xpcms_area` VALUES ('230703', '南岔区', '230700', '3');
INSERT INTO `xpcms_area` VALUES ('230704', '友好区', '230700', '4');
INSERT INTO `xpcms_area` VALUES ('230705', '西林区', '230700', '5');
INSERT INTO `xpcms_area` VALUES ('230706', '翠峦区', '230700', '6');
INSERT INTO `xpcms_area` VALUES ('230707', '新青区', '230700', '7');
INSERT INTO `xpcms_area` VALUES ('230708', '美溪区', '230700', '8');
INSERT INTO `xpcms_area` VALUES ('230709', '金山屯区', '230700', '9');
INSERT INTO `xpcms_area` VALUES ('230710', '五营区', '230700', '10');
INSERT INTO `xpcms_area` VALUES ('230711', '乌马河区', '230700', '11');
INSERT INTO `xpcms_area` VALUES ('230712', '汤旺河区', '230700', '12');
INSERT INTO `xpcms_area` VALUES ('230713', '带岭区', '230700', '13');
INSERT INTO `xpcms_area` VALUES ('230714', '乌伊岭区', '230700', '14');
INSERT INTO `xpcms_area` VALUES ('230715', '红星区', '230700', '15');
INSERT INTO `xpcms_area` VALUES ('230716', '上甘岭区', '230700', '16');
INSERT INTO `xpcms_area` VALUES ('230722', '嘉荫县', '230700', '17');
INSERT INTO `xpcms_area` VALUES ('230781', '铁力市', '230700', '18');
INSERT INTO `xpcms_area` VALUES ('230801', '市辖区', '230800', '1');
INSERT INTO `xpcms_area` VALUES ('230802', '永红区', '230800', '2');
INSERT INTO `xpcms_area` VALUES ('230803', '向阳区', '230800', '3');
INSERT INTO `xpcms_area` VALUES ('230804', '前进区', '230800', '4');
INSERT INTO `xpcms_area` VALUES ('230805', '东风区', '230800', '5');
INSERT INTO `xpcms_area` VALUES ('230811', '郊　区', '230800', '6');
INSERT INTO `xpcms_area` VALUES ('230822', '桦南县', '230800', '7');
INSERT INTO `xpcms_area` VALUES ('230826', '桦川县', '230800', '8');
INSERT INTO `xpcms_area` VALUES ('230828', '汤原县', '230800', '9');
INSERT INTO `xpcms_area` VALUES ('230833', '抚远县', '230800', '10');
INSERT INTO `xpcms_area` VALUES ('230881', '同江市', '230800', '11');
INSERT INTO `xpcms_area` VALUES ('230882', '富锦市', '230800', '12');
INSERT INTO `xpcms_area` VALUES ('230901', '市辖区', '230900', '1');
INSERT INTO `xpcms_area` VALUES ('230902', '新兴区', '230900', '2');
INSERT INTO `xpcms_area` VALUES ('230903', '桃山区', '230900', '3');
INSERT INTO `xpcms_area` VALUES ('230904', '茄子河区', '230900', '4');
INSERT INTO `xpcms_area` VALUES ('230921', '勃利县', '230900', '5');
INSERT INTO `xpcms_area` VALUES ('231001', '市辖区', '231000', '1');
INSERT INTO `xpcms_area` VALUES ('231002', '东安区', '231000', '2');
INSERT INTO `xpcms_area` VALUES ('231003', '阳明区', '231000', '3');
INSERT INTO `xpcms_area` VALUES ('231004', '爱民区', '231000', '4');
INSERT INTO `xpcms_area` VALUES ('231005', '西安区', '231000', '5');
INSERT INTO `xpcms_area` VALUES ('231024', '东宁县', '231000', '6');
INSERT INTO `xpcms_area` VALUES ('231025', '林口县', '231000', '7');
INSERT INTO `xpcms_area` VALUES ('231081', '绥芬河市', '231000', '8');
INSERT INTO `xpcms_area` VALUES ('231083', '海林市', '231000', '9');
INSERT INTO `xpcms_area` VALUES ('231084', '宁安市', '231000', '10');
INSERT INTO `xpcms_area` VALUES ('231085', '穆棱市', '231000', '11');
INSERT INTO `xpcms_area` VALUES ('231101', '市辖区', '231100', '1');
INSERT INTO `xpcms_area` VALUES ('231102', '爱辉区', '231100', '2');
INSERT INTO `xpcms_area` VALUES ('231121', '嫩江县', '231100', '3');
INSERT INTO `xpcms_area` VALUES ('231123', '逊克县', '231100', '4');
INSERT INTO `xpcms_area` VALUES ('231124', '孙吴县', '231100', '5');
INSERT INTO `xpcms_area` VALUES ('231181', '北安市', '231100', '6');
INSERT INTO `xpcms_area` VALUES ('231182', '五大连池市', '231100', '7');
INSERT INTO `xpcms_area` VALUES ('231201', '市辖区', '231200', '1');
INSERT INTO `xpcms_area` VALUES ('231202', '北林区', '231200', '2');
INSERT INTO `xpcms_area` VALUES ('231221', '望奎县', '231200', '3');
INSERT INTO `xpcms_area` VALUES ('231222', '兰西县', '231200', '4');
INSERT INTO `xpcms_area` VALUES ('231223', '青冈县', '231200', '5');
INSERT INTO `xpcms_area` VALUES ('231224', '庆安县', '231200', '6');
INSERT INTO `xpcms_area` VALUES ('231225', '明水县', '231200', '7');
INSERT INTO `xpcms_area` VALUES ('231226', '绥棱县', '231200', '8');
INSERT INTO `xpcms_area` VALUES ('231281', '安达市', '231200', '9');
INSERT INTO `xpcms_area` VALUES ('231282', '肇东市', '231200', '10');
INSERT INTO `xpcms_area` VALUES ('231283', '海伦市', '231200', '11');
INSERT INTO `xpcms_area` VALUES ('232721', '呼玛县', '232700', '1');
INSERT INTO `xpcms_area` VALUES ('232722', '塔河县', '232700', '2');
INSERT INTO `xpcms_area` VALUES ('232723', '漠河县', '232700', '3');
INSERT INTO `xpcms_area` VALUES ('310101', '黄浦区', '310100', '1');
INSERT INTO `xpcms_area` VALUES ('310103', '卢湾区', '310100', '2');
INSERT INTO `xpcms_area` VALUES ('310104', '徐汇区', '310100', '3');
INSERT INTO `xpcms_area` VALUES ('310105', '长宁区', '310100', '4');
INSERT INTO `xpcms_area` VALUES ('310106', '静安区', '310100', '5');
INSERT INTO `xpcms_area` VALUES ('310107', '普陀区', '310100', '6');
INSERT INTO `xpcms_area` VALUES ('310108', '闸北区', '310100', '7');
INSERT INTO `xpcms_area` VALUES ('310109', '虹口区', '310100', '8');
INSERT INTO `xpcms_area` VALUES ('310110', '杨浦区', '310100', '9');
INSERT INTO `xpcms_area` VALUES ('310112', '闵行区', '310100', '10');
INSERT INTO `xpcms_area` VALUES ('310113', '宝山区', '310100', '11');
INSERT INTO `xpcms_area` VALUES ('310114', '嘉定区', '310100', '12');
INSERT INTO `xpcms_area` VALUES ('310115', '浦东新区', '310100', '13');
INSERT INTO `xpcms_area` VALUES ('310116', '金山区', '310100', '14');
INSERT INTO `xpcms_area` VALUES ('310117', '松江区', '310100', '15');
INSERT INTO `xpcms_area` VALUES ('310118', '青浦区', '310100', '16');
INSERT INTO `xpcms_area` VALUES ('310119', '南汇区', '310100', '17');
INSERT INTO `xpcms_area` VALUES ('310120', '奉贤区', '310100', '18');
INSERT INTO `xpcms_area` VALUES ('310230', '崇明县', '310200', '1');
INSERT INTO `xpcms_area` VALUES ('320101', '市辖区', '320100', '1');
INSERT INTO `xpcms_area` VALUES ('320102', '玄武区', '320100', '2');
INSERT INTO `xpcms_area` VALUES ('320103', '白下区', '320100', '3');
INSERT INTO `xpcms_area` VALUES ('320104', '秦淮区', '320100', '4');
INSERT INTO `xpcms_area` VALUES ('320105', '建邺区', '320100', '5');
INSERT INTO `xpcms_area` VALUES ('320106', '鼓楼区', '320100', '6');
INSERT INTO `xpcms_area` VALUES ('320107', '下关区', '320100', '7');
INSERT INTO `xpcms_area` VALUES ('320111', '浦口区', '320100', '8');
INSERT INTO `xpcms_area` VALUES ('320113', '栖霞区', '320100', '9');
INSERT INTO `xpcms_area` VALUES ('320114', '雨花台区', '320100', '10');
INSERT INTO `xpcms_area` VALUES ('320115', '江宁区', '320100', '11');
INSERT INTO `xpcms_area` VALUES ('320116', '六合区', '320100', '12');
INSERT INTO `xpcms_area` VALUES ('320124', '溧水县', '320100', '13');
INSERT INTO `xpcms_area` VALUES ('320125', '高淳县', '320100', '14');
INSERT INTO `xpcms_area` VALUES ('320201', '市辖区', '320200', '1');
INSERT INTO `xpcms_area` VALUES ('320202', '崇安区', '320200', '2');
INSERT INTO `xpcms_area` VALUES ('320203', '南长区', '320200', '3');
INSERT INTO `xpcms_area` VALUES ('320204', '北塘区', '320200', '4');
INSERT INTO `xpcms_area` VALUES ('320205', '锡山区', '320200', '5');
INSERT INTO `xpcms_area` VALUES ('320206', '惠山区', '320200', '6');
INSERT INTO `xpcms_area` VALUES ('320211', '滨湖区', '320200', '7');
INSERT INTO `xpcms_area` VALUES ('320281', '江阴市', '320200', '8');
INSERT INTO `xpcms_area` VALUES ('320282', '宜兴市', '320200', '9');
INSERT INTO `xpcms_area` VALUES ('320301', '市辖区', '320300', '1');
INSERT INTO `xpcms_area` VALUES ('320302', '鼓楼区', '320300', '2');
INSERT INTO `xpcms_area` VALUES ('320303', '云龙区', '320300', '3');
INSERT INTO `xpcms_area` VALUES ('320304', '九里区', '320300', '4');
INSERT INTO `xpcms_area` VALUES ('320305', '贾汪区', '320300', '5');
INSERT INTO `xpcms_area` VALUES ('320311', '泉山区', '320300', '6');
INSERT INTO `xpcms_area` VALUES ('320321', '丰　县', '320300', '7');
INSERT INTO `xpcms_area` VALUES ('320322', '沛　县', '320300', '8');
INSERT INTO `xpcms_area` VALUES ('320323', '铜山县', '320300', '9');
INSERT INTO `xpcms_area` VALUES ('320324', '睢宁县', '320300', '10');
INSERT INTO `xpcms_area` VALUES ('320381', '新沂市', '320300', '11');
INSERT INTO `xpcms_area` VALUES ('320382', '邳州市', '320300', '12');
INSERT INTO `xpcms_area` VALUES ('320401', '市辖区', '320400', '1');
INSERT INTO `xpcms_area` VALUES ('320402', '天宁区', '320400', '2');
INSERT INTO `xpcms_area` VALUES ('320404', '钟楼区', '320400', '3');
INSERT INTO `xpcms_area` VALUES ('320405', '戚墅堰区', '320400', '4');
INSERT INTO `xpcms_area` VALUES ('320411', '新北区', '320400', '5');
INSERT INTO `xpcms_area` VALUES ('320412', '武进区', '320400', '6');
INSERT INTO `xpcms_area` VALUES ('320481', '溧阳市', '320400', '7');
INSERT INTO `xpcms_area` VALUES ('320482', '金坛市', '320400', '8');
INSERT INTO `xpcms_area` VALUES ('320501', '市辖区', '320500', '1');
INSERT INTO `xpcms_area` VALUES ('320502', '沧浪区', '320500', '2');
INSERT INTO `xpcms_area` VALUES ('320503', '平江区', '320500', '3');
INSERT INTO `xpcms_area` VALUES ('320504', '金阊区', '320500', '4');
INSERT INTO `xpcms_area` VALUES ('320505', '虎丘区', '320500', '5');
INSERT INTO `xpcms_area` VALUES ('320506', '吴中区', '320500', '6');
INSERT INTO `xpcms_area` VALUES ('320507', '相城区', '320500', '7');
INSERT INTO `xpcms_area` VALUES ('320581', '常熟市', '320500', '8');
INSERT INTO `xpcms_area` VALUES ('320582', '张家港市', '320500', '9');
INSERT INTO `xpcms_area` VALUES ('320583', '昆山市', '320500', '10');
INSERT INTO `xpcms_area` VALUES ('320584', '吴江市', '320500', '11');
INSERT INTO `xpcms_area` VALUES ('320585', '太仓市', '320500', '12');
INSERT INTO `xpcms_area` VALUES ('320601', '市辖区', '320600', '1');
INSERT INTO `xpcms_area` VALUES ('320602', '崇川区', '320600', '2');
INSERT INTO `xpcms_area` VALUES ('320611', '港闸区', '320600', '3');
INSERT INTO `xpcms_area` VALUES ('320621', '海安县', '320600', '4');
INSERT INTO `xpcms_area` VALUES ('320623', '如东县', '320600', '5');
INSERT INTO `xpcms_area` VALUES ('320681', '启东市', '320600', '6');
INSERT INTO `xpcms_area` VALUES ('320682', '如皋市', '320600', '7');
INSERT INTO `xpcms_area` VALUES ('320683', '通州市', '320600', '8');
INSERT INTO `xpcms_area` VALUES ('320684', '海门市', '320600', '9');
INSERT INTO `xpcms_area` VALUES ('320701', '市辖区', '320700', '1');
INSERT INTO `xpcms_area` VALUES ('320703', '连云区', '320700', '2');
INSERT INTO `xpcms_area` VALUES ('320705', '新浦区', '320700', '3');
INSERT INTO `xpcms_area` VALUES ('320706', '海州区', '320700', '4');
INSERT INTO `xpcms_area` VALUES ('320721', '赣榆县', '320700', '5');
INSERT INTO `xpcms_area` VALUES ('320722', '东海县', '320700', '6');
INSERT INTO `xpcms_area` VALUES ('320723', '灌云县', '320700', '7');
INSERT INTO `xpcms_area` VALUES ('320724', '灌南县', '320700', '8');
INSERT INTO `xpcms_area` VALUES ('320801', '市辖区', '320800', '1');
INSERT INTO `xpcms_area` VALUES ('320802', '清河区', '320800', '2');
INSERT INTO `xpcms_area` VALUES ('320803', '楚州区', '320800', '3');
INSERT INTO `xpcms_area` VALUES ('320804', '淮阴区', '320800', '4');
INSERT INTO `xpcms_area` VALUES ('320811', '清浦区', '320800', '5');
INSERT INTO `xpcms_area` VALUES ('320826', '涟水县', '320800', '6');
INSERT INTO `xpcms_area` VALUES ('320829', '洪泽县', '320800', '7');
INSERT INTO `xpcms_area` VALUES ('320830', '盱眙县', '320800', '8');
INSERT INTO `xpcms_area` VALUES ('320831', '金湖县', '320800', '9');
INSERT INTO `xpcms_area` VALUES ('320901', '市辖区', '320900', '1');
INSERT INTO `xpcms_area` VALUES ('320902', '亭湖区', '320900', '2');
INSERT INTO `xpcms_area` VALUES ('320903', '盐都区', '320900', '3');
INSERT INTO `xpcms_area` VALUES ('320921', '响水县', '320900', '4');
INSERT INTO `xpcms_area` VALUES ('320922', '滨海县', '320900', '5');
INSERT INTO `xpcms_area` VALUES ('320923', '阜宁县', '320900', '6');
INSERT INTO `xpcms_area` VALUES ('320924', '射阳县', '320900', '7');
INSERT INTO `xpcms_area` VALUES ('320925', '建湖县', '320900', '8');
INSERT INTO `xpcms_area` VALUES ('320981', '东台市', '320900', '9');
INSERT INTO `xpcms_area` VALUES ('320982', '大丰市', '320900', '10');
INSERT INTO `xpcms_area` VALUES ('321001', '市辖区', '321000', '1');
INSERT INTO `xpcms_area` VALUES ('321002', '广陵区', '321000', '2');
INSERT INTO `xpcms_area` VALUES ('321003', '邗江区', '321000', '3');
INSERT INTO `xpcms_area` VALUES ('321011', '郊　区', '321000', '4');
INSERT INTO `xpcms_area` VALUES ('321023', '宝应县', '321000', '5');
INSERT INTO `xpcms_area` VALUES ('321081', '仪征市', '321000', '6');
INSERT INTO `xpcms_area` VALUES ('321084', '高邮市', '321000', '7');
INSERT INTO `xpcms_area` VALUES ('321088', '江都市', '321000', '8');
INSERT INTO `xpcms_area` VALUES ('321101', '市辖区', '321100', '1');
INSERT INTO `xpcms_area` VALUES ('321102', '京口区', '321100', '2');
INSERT INTO `xpcms_area` VALUES ('321111', '润州区', '321100', '3');
INSERT INTO `xpcms_area` VALUES ('321112', '丹徒区', '321100', '4');
INSERT INTO `xpcms_area` VALUES ('321181', '丹阳市', '321100', '5');
INSERT INTO `xpcms_area` VALUES ('321182', '扬中市', '321100', '6');
INSERT INTO `xpcms_area` VALUES ('321183', '句容市', '321100', '7');
INSERT INTO `xpcms_area` VALUES ('321201', '市辖区', '321200', '1');
INSERT INTO `xpcms_area` VALUES ('321202', '海陵区', '321200', '2');
INSERT INTO `xpcms_area` VALUES ('321203', '高港区', '321200', '3');
INSERT INTO `xpcms_area` VALUES ('321281', '兴化市', '321200', '4');
INSERT INTO `xpcms_area` VALUES ('321282', '靖江市', '321200', '5');
INSERT INTO `xpcms_area` VALUES ('321283', '泰兴市', '321200', '6');
INSERT INTO `xpcms_area` VALUES ('321284', '姜堰市', '321200', '7');
INSERT INTO `xpcms_area` VALUES ('321301', '市辖区', '321300', '1');
INSERT INTO `xpcms_area` VALUES ('321302', '宿城区', '321300', '2');
INSERT INTO `xpcms_area` VALUES ('321311', '宿豫区', '321300', '3');
INSERT INTO `xpcms_area` VALUES ('321322', '沭阳县', '321300', '4');
INSERT INTO `xpcms_area` VALUES ('321323', '泗阳县', '321300', '5');
INSERT INTO `xpcms_area` VALUES ('321324', '泗洪县', '321300', '6');
INSERT INTO `xpcms_area` VALUES ('330101', '市辖区', '330100', '1');
INSERT INTO `xpcms_area` VALUES ('330102', '上城区', '330100', '2');
INSERT INTO `xpcms_area` VALUES ('330103', '下城区', '330100', '3');
INSERT INTO `xpcms_area` VALUES ('330104', '江干区', '330100', '4');
INSERT INTO `xpcms_area` VALUES ('330105', '拱墅区', '330100', '5');
INSERT INTO `xpcms_area` VALUES ('330106', '西湖区', '330100', '6');
INSERT INTO `xpcms_area` VALUES ('330108', '滨江区', '330100', '7');
INSERT INTO `xpcms_area` VALUES ('330109', '萧山区', '330100', '8');
INSERT INTO `xpcms_area` VALUES ('330110', '余杭区', '330100', '9');
INSERT INTO `xpcms_area` VALUES ('330122', '桐庐县', '330100', '10');
INSERT INTO `xpcms_area` VALUES ('330127', '淳安县', '330100', '11');
INSERT INTO `xpcms_area` VALUES ('330182', '建德市', '330100', '12');
INSERT INTO `xpcms_area` VALUES ('330183', '富阳市', '330100', '13');
INSERT INTO `xpcms_area` VALUES ('330185', '临安市', '330100', '14');
INSERT INTO `xpcms_area` VALUES ('330201', '市辖区', '330200', '1');
INSERT INTO `xpcms_area` VALUES ('330203', '海曙区', '330200', '2');
INSERT INTO `xpcms_area` VALUES ('330204', '江东区', '330200', '3');
INSERT INTO `xpcms_area` VALUES ('330205', '江北区', '330200', '4');
INSERT INTO `xpcms_area` VALUES ('330206', '北仑区', '330200', '5');
INSERT INTO `xpcms_area` VALUES ('330211', '镇海区', '330200', '6');
INSERT INTO `xpcms_area` VALUES ('330212', '鄞州区', '330200', '7');
INSERT INTO `xpcms_area` VALUES ('330225', '象山县', '330200', '8');
INSERT INTO `xpcms_area` VALUES ('330226', '宁海县', '330200', '9');
INSERT INTO `xpcms_area` VALUES ('330281', '余姚市', '330200', '10');
INSERT INTO `xpcms_area` VALUES ('330282', '慈溪市', '330200', '11');
INSERT INTO `xpcms_area` VALUES ('330283', '奉化市', '330200', '12');
INSERT INTO `xpcms_area` VALUES ('330301', '市辖区', '330300', '1');
INSERT INTO `xpcms_area` VALUES ('330302', '鹿城区', '330300', '2');
INSERT INTO `xpcms_area` VALUES ('330303', '龙湾区', '330300', '3');
INSERT INTO `xpcms_area` VALUES ('330304', '瓯海区', '330300', '4');
INSERT INTO `xpcms_area` VALUES ('330322', '洞头县', '330300', '5');
INSERT INTO `xpcms_area` VALUES ('330324', '永嘉县', '330300', '6');
INSERT INTO `xpcms_area` VALUES ('330326', '平阳县', '330300', '7');
INSERT INTO `xpcms_area` VALUES ('330327', '苍南县', '330300', '8');
INSERT INTO `xpcms_area` VALUES ('330328', '文成县', '330300', '9');
INSERT INTO `xpcms_area` VALUES ('330329', '泰顺县', '330300', '10');
INSERT INTO `xpcms_area` VALUES ('330381', '瑞安市', '330300', '11');
INSERT INTO `xpcms_area` VALUES ('330382', '乐清市', '330300', '12');
INSERT INTO `xpcms_area` VALUES ('330401', '市辖区', '330400', '1');
INSERT INTO `xpcms_area` VALUES ('330402', '秀城区', '330400', '2');
INSERT INTO `xpcms_area` VALUES ('330411', '秀洲区', '330400', '3');
INSERT INTO `xpcms_area` VALUES ('330421', '嘉善县', '330400', '4');
INSERT INTO `xpcms_area` VALUES ('330424', '海盐县', '330400', '5');
INSERT INTO `xpcms_area` VALUES ('330481', '海宁市', '330400', '6');
INSERT INTO `xpcms_area` VALUES ('330482', '平湖市', '330400', '7');
INSERT INTO `xpcms_area` VALUES ('330483', '桐乡市', '330400', '8');
INSERT INTO `xpcms_area` VALUES ('330501', '市辖区', '330500', '1');
INSERT INTO `xpcms_area` VALUES ('330502', '吴兴区', '330500', '2');
INSERT INTO `xpcms_area` VALUES ('330503', '南浔区', '330500', '3');
INSERT INTO `xpcms_area` VALUES ('330521', '德清县', '330500', '4');
INSERT INTO `xpcms_area` VALUES ('330522', '长兴县', '330500', '5');
INSERT INTO `xpcms_area` VALUES ('330523', '安吉县', '330500', '6');
INSERT INTO `xpcms_area` VALUES ('330601', '市辖区', '330600', '1');
INSERT INTO `xpcms_area` VALUES ('330602', '越城区', '330600', '2');
INSERT INTO `xpcms_area` VALUES ('330621', '绍兴县', '330600', '3');
INSERT INTO `xpcms_area` VALUES ('330624', '新昌县', '330600', '4');
INSERT INTO `xpcms_area` VALUES ('330681', '诸暨市', '330600', '5');
INSERT INTO `xpcms_area` VALUES ('330682', '上虞市', '330600', '6');
INSERT INTO `xpcms_area` VALUES ('330683', '嵊州市', '330600', '7');
INSERT INTO `xpcms_area` VALUES ('330701', '市辖区', '330700', '1');
INSERT INTO `xpcms_area` VALUES ('330702', '婺城区', '330700', '2');
INSERT INTO `xpcms_area` VALUES ('330703', '金东区', '330700', '3');
INSERT INTO `xpcms_area` VALUES ('330723', '武义县', '330700', '4');
INSERT INTO `xpcms_area` VALUES ('330726', '浦江县', '330700', '5');
INSERT INTO `xpcms_area` VALUES ('330727', '磐安县', '330700', '6');
INSERT INTO `xpcms_area` VALUES ('330781', '兰溪市', '330700', '7');
INSERT INTO `xpcms_area` VALUES ('330782', '义乌市', '330700', '8');
INSERT INTO `xpcms_area` VALUES ('330783', '东阳市', '330700', '9');
INSERT INTO `xpcms_area` VALUES ('330784', '永康市', '330700', '10');
INSERT INTO `xpcms_area` VALUES ('330801', '市辖区', '330800', '1');
INSERT INTO `xpcms_area` VALUES ('330802', '柯城区', '330800', '2');
INSERT INTO `xpcms_area` VALUES ('330803', '衢江区', '330800', '3');
INSERT INTO `xpcms_area` VALUES ('330822', '常山县', '330800', '4');
INSERT INTO `xpcms_area` VALUES ('330824', '开化县', '330800', '5');
INSERT INTO `xpcms_area` VALUES ('330825', '龙游县', '330800', '6');
INSERT INTO `xpcms_area` VALUES ('330881', '江山市', '330800', '7');
INSERT INTO `xpcms_area` VALUES ('330901', '市辖区', '330900', '1');
INSERT INTO `xpcms_area` VALUES ('330902', '定海区', '330900', '2');
INSERT INTO `xpcms_area` VALUES ('330903', '普陀区', '330900', '3');
INSERT INTO `xpcms_area` VALUES ('330921', '岱山县', '330900', '4');
INSERT INTO `xpcms_area` VALUES ('330922', '嵊泗县', '330900', '5');
INSERT INTO `xpcms_area` VALUES ('331001', '市辖区', '331000', '1');
INSERT INTO `xpcms_area` VALUES ('331002', '椒江区', '331000', '2');
INSERT INTO `xpcms_area` VALUES ('331003', '黄岩区', '331000', '3');
INSERT INTO `xpcms_area` VALUES ('331004', '路桥区', '331000', '4');
INSERT INTO `xpcms_area` VALUES ('331021', '玉环县', '331000', '5');
INSERT INTO `xpcms_area` VALUES ('331022', '三门县', '331000', '6');
INSERT INTO `xpcms_area` VALUES ('331023', '天台县', '331000', '7');
INSERT INTO `xpcms_area` VALUES ('331024', '仙居县', '331000', '8');
INSERT INTO `xpcms_area` VALUES ('331081', '温岭市', '331000', '9');
INSERT INTO `xpcms_area` VALUES ('331082', '临海市', '331000', '10');
INSERT INTO `xpcms_area` VALUES ('331101', '市辖区', '331100', '1');
INSERT INTO `xpcms_area` VALUES ('331102', '莲都区', '331100', '2');
INSERT INTO `xpcms_area` VALUES ('331121', '青田县', '331100', '3');
INSERT INTO `xpcms_area` VALUES ('331122', '缙云县', '331100', '4');
INSERT INTO `xpcms_area` VALUES ('331123', '遂昌县', '331100', '5');
INSERT INTO `xpcms_area` VALUES ('331124', '松阳县', '331100', '6');
INSERT INTO `xpcms_area` VALUES ('331125', '云和县', '331100', '7');
INSERT INTO `xpcms_area` VALUES ('331126', '庆元县', '331100', '8');
INSERT INTO `xpcms_area` VALUES ('331127', '景宁畲族自治县', '331100', '9');
INSERT INTO `xpcms_area` VALUES ('331181', '龙泉市', '331100', '10');
INSERT INTO `xpcms_area` VALUES ('340101', '市辖区', '340100', '1');
INSERT INTO `xpcms_area` VALUES ('340102', '瑶海区', '340100', '2');
INSERT INTO `xpcms_area` VALUES ('340103', '庐阳区', '340100', '3');
INSERT INTO `xpcms_area` VALUES ('340104', '蜀山区', '340100', '4');
INSERT INTO `xpcms_area` VALUES ('340111', '包河区', '340100', '5');
INSERT INTO `xpcms_area` VALUES ('340121', '长丰县', '340100', '6');
INSERT INTO `xpcms_area` VALUES ('340122', '肥东县', '340100', '7');
INSERT INTO `xpcms_area` VALUES ('340123', '肥西县', '340100', '8');
INSERT INTO `xpcms_area` VALUES ('340201', '市辖区', '340200', '1');
INSERT INTO `xpcms_area` VALUES ('340202', '镜湖区', '340200', '2');
INSERT INTO `xpcms_area` VALUES ('340203', '马塘区', '340200', '3');
INSERT INTO `xpcms_area` VALUES ('340204', '新芜区', '340200', '4');
INSERT INTO `xpcms_area` VALUES ('340207', '鸠江区', '340200', '5');
INSERT INTO `xpcms_area` VALUES ('340221', '芜湖县', '340200', '6');
INSERT INTO `xpcms_area` VALUES ('340222', '繁昌县', '340200', '7');
INSERT INTO `xpcms_area` VALUES ('340223', '南陵县', '340200', '8');
INSERT INTO `xpcms_area` VALUES ('340301', '市辖区', '340300', '1');
INSERT INTO `xpcms_area` VALUES ('340302', '龙子湖区', '340300', '2');
INSERT INTO `xpcms_area` VALUES ('340303', '蚌山区', '340300', '3');
INSERT INTO `xpcms_area` VALUES ('340304', '禹会区', '340300', '4');
INSERT INTO `xpcms_area` VALUES ('340311', '淮上区', '340300', '5');
INSERT INTO `xpcms_area` VALUES ('340321', '怀远县', '340300', '6');
INSERT INTO `xpcms_area` VALUES ('340322', '五河县', '340300', '7');
INSERT INTO `xpcms_area` VALUES ('340323', '固镇县', '340300', '8');
INSERT INTO `xpcms_area` VALUES ('340401', '市辖区', '340400', '1');
INSERT INTO `xpcms_area` VALUES ('340402', '大通区', '340400', '2');
INSERT INTO `xpcms_area` VALUES ('340403', '田家庵区', '340400', '3');
INSERT INTO `xpcms_area` VALUES ('340404', '谢家集区', '340400', '4');
INSERT INTO `xpcms_area` VALUES ('340405', '八公山区', '340400', '5');
INSERT INTO `xpcms_area` VALUES ('340406', '潘集区', '340400', '6');
INSERT INTO `xpcms_area` VALUES ('340421', '凤台县', '340400', '7');
INSERT INTO `xpcms_area` VALUES ('340501', '市辖区', '340500', '1');
INSERT INTO `xpcms_area` VALUES ('340502', '金家庄区', '340500', '2');
INSERT INTO `xpcms_area` VALUES ('340503', '花山区', '340500', '3');
INSERT INTO `xpcms_area` VALUES ('340504', '雨山区', '340500', '4');
INSERT INTO `xpcms_area` VALUES ('340521', '当涂县', '340500', '5');
INSERT INTO `xpcms_area` VALUES ('340601', '市辖区', '340600', '1');
INSERT INTO `xpcms_area` VALUES ('340602', '杜集区', '340600', '2');
INSERT INTO `xpcms_area` VALUES ('340603', '相山区', '340600', '3');
INSERT INTO `xpcms_area` VALUES ('340604', '烈山区', '340600', '4');
INSERT INTO `xpcms_area` VALUES ('340621', '濉溪县', '340600', '5');
INSERT INTO `xpcms_area` VALUES ('340701', '市辖区', '340700', '1');
INSERT INTO `xpcms_area` VALUES ('340702', '铜官山区', '340700', '2');
INSERT INTO `xpcms_area` VALUES ('340703', '狮子山区', '340700', '3');
INSERT INTO `xpcms_area` VALUES ('340711', '郊　区', '340700', '4');
INSERT INTO `xpcms_area` VALUES ('340721', '铜陵县', '340700', '5');
INSERT INTO `xpcms_area` VALUES ('340801', '市辖区', '340800', '1');
INSERT INTO `xpcms_area` VALUES ('340802', '迎江区', '340800', '2');
INSERT INTO `xpcms_area` VALUES ('340803', '大观区', '340800', '3');
INSERT INTO `xpcms_area` VALUES ('340811', '郊　区', '340800', '4');
INSERT INTO `xpcms_area` VALUES ('340822', '怀宁县', '340800', '5');
INSERT INTO `xpcms_area` VALUES ('340823', '枞阳县', '340800', '6');
INSERT INTO `xpcms_area` VALUES ('340824', '潜山县', '340800', '7');
INSERT INTO `xpcms_area` VALUES ('340825', '太湖县', '340800', '8');
INSERT INTO `xpcms_area` VALUES ('340826', '宿松县', '340800', '9');
INSERT INTO `xpcms_area` VALUES ('340827', '望江县', '340800', '10');
INSERT INTO `xpcms_area` VALUES ('340828', '岳西县', '340800', '11');
INSERT INTO `xpcms_area` VALUES ('340881', '桐城市', '340800', '12');
INSERT INTO `xpcms_area` VALUES ('341001', '市辖区', '341000', '1');
INSERT INTO `xpcms_area` VALUES ('341002', '屯溪区', '341000', '2');
INSERT INTO `xpcms_area` VALUES ('341003', '黄山区', '341000', '3');
INSERT INTO `xpcms_area` VALUES ('341004', '徽州区', '341000', '4');
INSERT INTO `xpcms_area` VALUES ('341021', '歙　县', '341000', '5');
INSERT INTO `xpcms_area` VALUES ('341022', '休宁县', '341000', '6');
INSERT INTO `xpcms_area` VALUES ('341023', '黟　县', '341000', '7');
INSERT INTO `xpcms_area` VALUES ('341024', '祁门县', '341000', '8');
INSERT INTO `xpcms_area` VALUES ('341101', '市辖区', '341100', '1');
INSERT INTO `xpcms_area` VALUES ('341102', '琅琊区', '341100', '2');
INSERT INTO `xpcms_area` VALUES ('341103', '南谯区', '341100', '3');
INSERT INTO `xpcms_area` VALUES ('341122', '来安县', '341100', '4');
INSERT INTO `xpcms_area` VALUES ('341124', '全椒县', '341100', '5');
INSERT INTO `xpcms_area` VALUES ('341125', '定远县', '341100', '6');
INSERT INTO `xpcms_area` VALUES ('341126', '凤阳县', '341100', '7');
INSERT INTO `xpcms_area` VALUES ('341181', '天长市', '341100', '8');
INSERT INTO `xpcms_area` VALUES ('341182', '明光市', '341100', '9');
INSERT INTO `xpcms_area` VALUES ('341201', '市辖区', '341200', '1');
INSERT INTO `xpcms_area` VALUES ('341202', '颍州区', '341200', '2');
INSERT INTO `xpcms_area` VALUES ('341203', '颍东区', '341200', '3');
INSERT INTO `xpcms_area` VALUES ('341204', '颍泉区', '341200', '4');
INSERT INTO `xpcms_area` VALUES ('341221', '临泉县', '341200', '5');
INSERT INTO `xpcms_area` VALUES ('341222', '太和县', '341200', '6');
INSERT INTO `xpcms_area` VALUES ('341225', '阜南县', '341200', '7');
INSERT INTO `xpcms_area` VALUES ('341226', '颍上县', '341200', '8');
INSERT INTO `xpcms_area` VALUES ('341282', '界首市', '341200', '9');
INSERT INTO `xpcms_area` VALUES ('341301', '市辖区', '341300', '1');
INSERT INTO `xpcms_area` VALUES ('341302', '墉桥区', '341300', '2');
INSERT INTO `xpcms_area` VALUES ('341321', '砀山县', '341300', '3');
INSERT INTO `xpcms_area` VALUES ('341322', '萧　县', '341300', '4');
INSERT INTO `xpcms_area` VALUES ('341323', '灵璧县', '341300', '5');
INSERT INTO `xpcms_area` VALUES ('341324', '泗　县', '341300', '6');
INSERT INTO `xpcms_area` VALUES ('341401', '庐江县', '340100', '9');
INSERT INTO `xpcms_area` VALUES ('341402', '巢湖市', '340100', '10');
INSERT INTO `xpcms_area` VALUES ('341422', '无为县', '340200', '9');
INSERT INTO `xpcms_area` VALUES ('341423', '含山县', '340500', '6');
INSERT INTO `xpcms_area` VALUES ('341424', '和　县', '340500', '7');
INSERT INTO `xpcms_area` VALUES ('341501', '市辖区', '341500', '1');
INSERT INTO `xpcms_area` VALUES ('341502', '金安区', '341500', '2');
INSERT INTO `xpcms_area` VALUES ('341503', '裕安区', '341500', '3');
INSERT INTO `xpcms_area` VALUES ('341521', '寿　县', '341500', '4');
INSERT INTO `xpcms_area` VALUES ('341522', '霍邱县', '341500', '5');
INSERT INTO `xpcms_area` VALUES ('341523', '舒城县', '341500', '6');
INSERT INTO `xpcms_area` VALUES ('341524', '金寨县', '341500', '7');
INSERT INTO `xpcms_area` VALUES ('341525', '霍山县', '341500', '8');
INSERT INTO `xpcms_area` VALUES ('341601', '市辖区', '341600', '1');
INSERT INTO `xpcms_area` VALUES ('341602', '谯城区', '341600', '2');
INSERT INTO `xpcms_area` VALUES ('341621', '涡阳县', '341600', '3');
INSERT INTO `xpcms_area` VALUES ('341622', '蒙城县', '341600', '4');
INSERT INTO `xpcms_area` VALUES ('341623', '利辛县', '341600', '5');
INSERT INTO `xpcms_area` VALUES ('341701', '市辖区', '341700', '1');
INSERT INTO `xpcms_area` VALUES ('341702', '贵池区', '341700', '2');
INSERT INTO `xpcms_area` VALUES ('341721', '东至县', '341700', '3');
INSERT INTO `xpcms_area` VALUES ('341722', '石台县', '341700', '4');
INSERT INTO `xpcms_area` VALUES ('341723', '青阳县', '341700', '5');
INSERT INTO `xpcms_area` VALUES ('341801', '市辖区', '341800', '1');
INSERT INTO `xpcms_area` VALUES ('341802', '宣州区', '341800', '2');
INSERT INTO `xpcms_area` VALUES ('341821', '郎溪县', '341800', '3');
INSERT INTO `xpcms_area` VALUES ('341822', '广德县', '341800', '4');
INSERT INTO `xpcms_area` VALUES ('341823', '泾　县', '341800', '5');
INSERT INTO `xpcms_area` VALUES ('341824', '绩溪县', '341800', '6');
INSERT INTO `xpcms_area` VALUES ('341825', '旌德县', '341800', '7');
INSERT INTO `xpcms_area` VALUES ('341881', '宁国市', '341800', '8');
INSERT INTO `xpcms_area` VALUES ('350101', '市辖区', '350100', '1');
INSERT INTO `xpcms_area` VALUES ('350102', '鼓楼区', '350100', '2');
INSERT INTO `xpcms_area` VALUES ('350103', '台江区', '350100', '3');
INSERT INTO `xpcms_area` VALUES ('350104', '仓山区', '350100', '4');
INSERT INTO `xpcms_area` VALUES ('350105', '马尾区', '350100', '5');
INSERT INTO `xpcms_area` VALUES ('350111', '晋安区', '350100', '6');
INSERT INTO `xpcms_area` VALUES ('350121', '闽侯县', '350100', '7');
INSERT INTO `xpcms_area` VALUES ('350122', '连江县', '350100', '8');
INSERT INTO `xpcms_area` VALUES ('350123', '罗源县', '350100', '9');
INSERT INTO `xpcms_area` VALUES ('350124', '闽清县', '350100', '10');
INSERT INTO `xpcms_area` VALUES ('350125', '永泰县', '350100', '11');
INSERT INTO `xpcms_area` VALUES ('350128', '平潭县', '350100', '12');
INSERT INTO `xpcms_area` VALUES ('350181', '福清市', '350100', '13');
INSERT INTO `xpcms_area` VALUES ('350182', '长乐市', '350100', '14');
INSERT INTO `xpcms_area` VALUES ('350201', '市辖区', '350200', '1');
INSERT INTO `xpcms_area` VALUES ('350203', '思明区', '350200', '2');
INSERT INTO `xpcms_area` VALUES ('350205', '海沧区', '350200', '3');
INSERT INTO `xpcms_area` VALUES ('350206', '湖里区', '350200', '4');
INSERT INTO `xpcms_area` VALUES ('350211', '集美区', '350200', '5');
INSERT INTO `xpcms_area` VALUES ('350212', '同安区', '350200', '6');
INSERT INTO `xpcms_area` VALUES ('350213', '翔安区', '350200', '7');
INSERT INTO `xpcms_area` VALUES ('350301', '市辖区', '350300', '1');
INSERT INTO `xpcms_area` VALUES ('350302', '城厢区', '350300', '2');
INSERT INTO `xpcms_area` VALUES ('350303', '涵江区', '350300', '3');
INSERT INTO `xpcms_area` VALUES ('350304', '荔城区', '350300', '4');
INSERT INTO `xpcms_area` VALUES ('350305', '秀屿区', '350300', '5');
INSERT INTO `xpcms_area` VALUES ('350322', '仙游县', '350300', '6');
INSERT INTO `xpcms_area` VALUES ('350401', '市辖区', '350400', '1');
INSERT INTO `xpcms_area` VALUES ('350402', '梅列区', '350400', '2');
INSERT INTO `xpcms_area` VALUES ('350403', '三元区', '350400', '3');
INSERT INTO `xpcms_area` VALUES ('350421', '明溪县', '350400', '4');
INSERT INTO `xpcms_area` VALUES ('350423', '清流县', '350400', '5');
INSERT INTO `xpcms_area` VALUES ('350424', '宁化县', '350400', '6');
INSERT INTO `xpcms_area` VALUES ('350425', '大田县', '350400', '7');
INSERT INTO `xpcms_area` VALUES ('350426', '尤溪县', '350400', '8');
INSERT INTO `xpcms_area` VALUES ('350427', '沙　县', '350400', '9');
INSERT INTO `xpcms_area` VALUES ('350428', '将乐县', '350400', '10');
INSERT INTO `xpcms_area` VALUES ('350429', '泰宁县', '350400', '11');
INSERT INTO `xpcms_area` VALUES ('350430', '建宁县', '350400', '12');
INSERT INTO `xpcms_area` VALUES ('350481', '永安市', '350400', '13');
INSERT INTO `xpcms_area` VALUES ('350501', '市辖区', '350500', '1');
INSERT INTO `xpcms_area` VALUES ('350502', '鲤城区', '350500', '2');
INSERT INTO `xpcms_area` VALUES ('350503', '丰泽区', '350500', '3');
INSERT INTO `xpcms_area` VALUES ('350504', '洛江区', '350500', '4');
INSERT INTO `xpcms_area` VALUES ('350505', '泉港区', '350500', '5');
INSERT INTO `xpcms_area` VALUES ('350521', '惠安县', '350500', '6');
INSERT INTO `xpcms_area` VALUES ('350524', '安溪县', '350500', '7');
INSERT INTO `xpcms_area` VALUES ('350525', '永春县', '350500', '8');
INSERT INTO `xpcms_area` VALUES ('350526', '德化县', '350500', '9');
INSERT INTO `xpcms_area` VALUES ('350527', '金门县', '350500', '10');
INSERT INTO `xpcms_area` VALUES ('350581', '石狮市', '350500', '11');
INSERT INTO `xpcms_area` VALUES ('350582', '晋江市', '350500', '12');
INSERT INTO `xpcms_area` VALUES ('350583', '南安市', '350500', '13');
INSERT INTO `xpcms_area` VALUES ('350601', '市辖区', '350600', '1');
INSERT INTO `xpcms_area` VALUES ('350602', '芗城区', '350600', '2');
INSERT INTO `xpcms_area` VALUES ('350603', '龙文区', '350600', '3');
INSERT INTO `xpcms_area` VALUES ('350622', '云霄县', '350600', '4');
INSERT INTO `xpcms_area` VALUES ('350623', '漳浦县', '350600', '5');
INSERT INTO `xpcms_area` VALUES ('350624', '诏安县', '350600', '6');
INSERT INTO `xpcms_area` VALUES ('350625', '长泰县', '350600', '7');
INSERT INTO `xpcms_area` VALUES ('350626', '东山县', '350600', '8');
INSERT INTO `xpcms_area` VALUES ('350627', '南靖县', '350600', '9');
INSERT INTO `xpcms_area` VALUES ('350628', '平和县', '350600', '10');
INSERT INTO `xpcms_area` VALUES ('350629', '华安县', '350600', '11');
INSERT INTO `xpcms_area` VALUES ('350681', '龙海市', '350600', '12');
INSERT INTO `xpcms_area` VALUES ('350701', '市辖区', '350700', '1');
INSERT INTO `xpcms_area` VALUES ('350702', '延平区', '350700', '2');
INSERT INTO `xpcms_area` VALUES ('350721', '顺昌县', '350700', '3');
INSERT INTO `xpcms_area` VALUES ('350722', '浦城县', '350700', '4');
INSERT INTO `xpcms_area` VALUES ('350723', '光泽县', '350700', '5');
INSERT INTO `xpcms_area` VALUES ('350724', '松溪县', '350700', '6');
INSERT INTO `xpcms_area` VALUES ('350725', '政和县', '350700', '7');
INSERT INTO `xpcms_area` VALUES ('350781', '邵武市', '350700', '8');
INSERT INTO `xpcms_area` VALUES ('350782', '武夷山市', '350700', '9');
INSERT INTO `xpcms_area` VALUES ('350783', '建瓯市', '350700', '10');
INSERT INTO `xpcms_area` VALUES ('350784', '建阳市', '350700', '11');
INSERT INTO `xpcms_area` VALUES ('350801', '市辖区', '350800', '1');
INSERT INTO `xpcms_area` VALUES ('350802', '新罗区', '350800', '2');
INSERT INTO `xpcms_area` VALUES ('350821', '长汀县', '350800', '3');
INSERT INTO `xpcms_area` VALUES ('350822', '永定县', '350800', '4');
INSERT INTO `xpcms_area` VALUES ('350823', '上杭县', '350800', '5');
INSERT INTO `xpcms_area` VALUES ('350824', '武平县', '350800', '6');
INSERT INTO `xpcms_area` VALUES ('350825', '连城县', '350800', '7');
INSERT INTO `xpcms_area` VALUES ('350881', '漳平市', '350800', '8');
INSERT INTO `xpcms_area` VALUES ('350901', '市辖区', '350900', '1');
INSERT INTO `xpcms_area` VALUES ('350902', '蕉城区', '350900', '2');
INSERT INTO `xpcms_area` VALUES ('350921', '霞浦县', '350900', '3');
INSERT INTO `xpcms_area` VALUES ('350922', '古田县', '350900', '4');
INSERT INTO `xpcms_area` VALUES ('350923', '屏南县', '350900', '5');
INSERT INTO `xpcms_area` VALUES ('350924', '寿宁县', '350900', '6');
INSERT INTO `xpcms_area` VALUES ('350925', '周宁县', '350900', '7');
INSERT INTO `xpcms_area` VALUES ('350926', '柘荣县', '350900', '8');
INSERT INTO `xpcms_area` VALUES ('350981', '福安市', '350900', '9');
INSERT INTO `xpcms_area` VALUES ('350982', '福鼎市', '350900', '10');
INSERT INTO `xpcms_area` VALUES ('360101', '市辖区', '360100', '1');
INSERT INTO `xpcms_area` VALUES ('360102', '东湖区', '360100', '2');
INSERT INTO `xpcms_area` VALUES ('360103', '西湖区', '360100', '3');
INSERT INTO `xpcms_area` VALUES ('360104', '青云谱区', '360100', '4');
INSERT INTO `xpcms_area` VALUES ('360105', '湾里区', '360100', '5');
INSERT INTO `xpcms_area` VALUES ('360111', '青山湖区', '360100', '6');
INSERT INTO `xpcms_area` VALUES ('360121', '南昌县', '360100', '7');
INSERT INTO `xpcms_area` VALUES ('360122', '新建县', '360100', '8');
INSERT INTO `xpcms_area` VALUES ('360123', '安义县', '360100', '9');
INSERT INTO `xpcms_area` VALUES ('360124', '进贤县', '360100', '10');
INSERT INTO `xpcms_area` VALUES ('360201', '市辖区', '360200', '1');
INSERT INTO `xpcms_area` VALUES ('360202', '昌江区', '360200', '2');
INSERT INTO `xpcms_area` VALUES ('360203', '珠山区', '360200', '3');
INSERT INTO `xpcms_area` VALUES ('360222', '浮梁县', '360200', '4');
INSERT INTO `xpcms_area` VALUES ('360281', '乐平市', '360200', '5');
INSERT INTO `xpcms_area` VALUES ('360301', '市辖区', '360300', '1');
INSERT INTO `xpcms_area` VALUES ('360302', '安源区', '360300', '2');
INSERT INTO `xpcms_area` VALUES ('360313', '湘东区', '360300', '3');
INSERT INTO `xpcms_area` VALUES ('360321', '莲花县', '360300', '4');
INSERT INTO `xpcms_area` VALUES ('360322', '上栗县', '360300', '5');
INSERT INTO `xpcms_area` VALUES ('360323', '芦溪县', '360300', '6');
INSERT INTO `xpcms_area` VALUES ('360401', '市辖区', '360400', '1');
INSERT INTO `xpcms_area` VALUES ('360402', '庐山区', '360400', '2');
INSERT INTO `xpcms_area` VALUES ('360403', '浔阳区', '360400', '3');
INSERT INTO `xpcms_area` VALUES ('360421', '九江县', '360400', '4');
INSERT INTO `xpcms_area` VALUES ('360423', '武宁县', '360400', '5');
INSERT INTO `xpcms_area` VALUES ('360424', '修水县', '360400', '6');
INSERT INTO `xpcms_area` VALUES ('360425', '永修县', '360400', '7');
INSERT INTO `xpcms_area` VALUES ('360426', '德安县', '360400', '8');
INSERT INTO `xpcms_area` VALUES ('360427', '星子县', '360400', '9');
INSERT INTO `xpcms_area` VALUES ('360428', '都昌县', '360400', '10');
INSERT INTO `xpcms_area` VALUES ('360429', '湖口县', '360400', '11');
INSERT INTO `xpcms_area` VALUES ('360430', '彭泽县', '360400', '12');
INSERT INTO `xpcms_area` VALUES ('360481', '瑞昌市', '360400', '13');
INSERT INTO `xpcms_area` VALUES ('360501', '市辖区', '360500', '1');
INSERT INTO `xpcms_area` VALUES ('360502', '渝水区', '360500', '2');
INSERT INTO `xpcms_area` VALUES ('360521', '分宜县', '360500', '3');
INSERT INTO `xpcms_area` VALUES ('360601', '市辖区', '360600', '1');
INSERT INTO `xpcms_area` VALUES ('360602', '月湖区', '360600', '2');
INSERT INTO `xpcms_area` VALUES ('360622', '余江县', '360600', '3');
INSERT INTO `xpcms_area` VALUES ('360681', '贵溪市', '360600', '4');
INSERT INTO `xpcms_area` VALUES ('360701', '市辖区', '360700', '1');
INSERT INTO `xpcms_area` VALUES ('360702', '章贡区', '360700', '2');
INSERT INTO `xpcms_area` VALUES ('360721', '赣　县', '360700', '3');
INSERT INTO `xpcms_area` VALUES ('360722', '信丰县', '360700', '4');
INSERT INTO `xpcms_area` VALUES ('360723', '大余县', '360700', '5');
INSERT INTO `xpcms_area` VALUES ('360724', '上犹县', '360700', '6');
INSERT INTO `xpcms_area` VALUES ('360725', '崇义县', '360700', '7');
INSERT INTO `xpcms_area` VALUES ('360726', '安远县', '360700', '8');
INSERT INTO `xpcms_area` VALUES ('360727', '龙南县', '360700', '9');
INSERT INTO `xpcms_area` VALUES ('360728', '定南县', '360700', '10');
INSERT INTO `xpcms_area` VALUES ('360729', '全南县', '360700', '11');
INSERT INTO `xpcms_area` VALUES ('360730', '宁都县', '360700', '12');
INSERT INTO `xpcms_area` VALUES ('360731', '于都县', '360700', '13');
INSERT INTO `xpcms_area` VALUES ('360732', '兴国县', '360700', '14');
INSERT INTO `xpcms_area` VALUES ('360733', '会昌县', '360700', '15');
INSERT INTO `xpcms_area` VALUES ('360734', '寻乌县', '360700', '16');
INSERT INTO `xpcms_area` VALUES ('360735', '石城县', '360700', '17');
INSERT INTO `xpcms_area` VALUES ('360781', '瑞金市', '360700', '18');
INSERT INTO `xpcms_area` VALUES ('360782', '南康市', '360700', '19');
INSERT INTO `xpcms_area` VALUES ('360801', '市辖区', '360800', '1');
INSERT INTO `xpcms_area` VALUES ('360802', '吉州区', '360800', '2');
INSERT INTO `xpcms_area` VALUES ('360803', '青原区', '360800', '3');
INSERT INTO `xpcms_area` VALUES ('360821', '吉安县', '360800', '4');
INSERT INTO `xpcms_area` VALUES ('360822', '吉水县', '360800', '5');
INSERT INTO `xpcms_area` VALUES ('360823', '峡江县', '360800', '6');
INSERT INTO `xpcms_area` VALUES ('360824', '新干县', '360800', '7');
INSERT INTO `xpcms_area` VALUES ('360825', '永丰县', '360800', '8');
INSERT INTO `xpcms_area` VALUES ('360826', '泰和县', '360800', '9');
INSERT INTO `xpcms_area` VALUES ('360827', '遂川县', '360800', '10');
INSERT INTO `xpcms_area` VALUES ('360828', '万安县', '360800', '11');
INSERT INTO `xpcms_area` VALUES ('360829', '安福县', '360800', '12');
INSERT INTO `xpcms_area` VALUES ('360830', '永新县', '360800', '13');
INSERT INTO `xpcms_area` VALUES ('360881', '井冈山市', '360800', '14');
INSERT INTO `xpcms_area` VALUES ('360901', '市辖区', '360900', '1');
INSERT INTO `xpcms_area` VALUES ('360902', '袁州区', '360900', '2');
INSERT INTO `xpcms_area` VALUES ('360921', '奉新县', '360900', '3');
INSERT INTO `xpcms_area` VALUES ('360922', '万载县', '360900', '4');
INSERT INTO `xpcms_area` VALUES ('360923', '上高县', '360900', '5');
INSERT INTO `xpcms_area` VALUES ('360924', '宜丰县', '360900', '6');
INSERT INTO `xpcms_area` VALUES ('360925', '靖安县', '360900', '7');
INSERT INTO `xpcms_area` VALUES ('360926', '铜鼓县', '360900', '8');
INSERT INTO `xpcms_area` VALUES ('360981', '丰城市', '360900', '9');
INSERT INTO `xpcms_area` VALUES ('360982', '樟树市', '360900', '10');
INSERT INTO `xpcms_area` VALUES ('360983', '高安市', '360900', '11');
INSERT INTO `xpcms_area` VALUES ('361001', '市辖区', '361000', '1');
INSERT INTO `xpcms_area` VALUES ('361002', '临川区', '361000', '2');
INSERT INTO `xpcms_area` VALUES ('361021', '南城县', '361000', '3');
INSERT INTO `xpcms_area` VALUES ('361022', '黎川县', '361000', '4');
INSERT INTO `xpcms_area` VALUES ('361023', '南丰县', '361000', '5');
INSERT INTO `xpcms_area` VALUES ('361024', '崇仁县', '361000', '6');
INSERT INTO `xpcms_area` VALUES ('361025', '乐安县', '361000', '7');
INSERT INTO `xpcms_area` VALUES ('361026', '宜黄县', '361000', '8');
INSERT INTO `xpcms_area` VALUES ('361027', '金溪县', '361000', '9');
INSERT INTO `xpcms_area` VALUES ('361028', '资溪县', '361000', '10');
INSERT INTO `xpcms_area` VALUES ('361029', '东乡县', '361000', '11');
INSERT INTO `xpcms_area` VALUES ('361030', '广昌县', '361000', '12');
INSERT INTO `xpcms_area` VALUES ('361101', '市辖区', '361100', '1');
INSERT INTO `xpcms_area` VALUES ('361102', '信州区', '361100', '2');
INSERT INTO `xpcms_area` VALUES ('361121', '上饶县', '361100', '3');
INSERT INTO `xpcms_area` VALUES ('361122', '广丰县', '361100', '4');
INSERT INTO `xpcms_area` VALUES ('361123', '玉山县', '361100', '5');
INSERT INTO `xpcms_area` VALUES ('361124', '铅山县', '361100', '6');
INSERT INTO `xpcms_area` VALUES ('361125', '横峰县', '361100', '7');
INSERT INTO `xpcms_area` VALUES ('361126', '弋阳县', '361100', '8');
INSERT INTO `xpcms_area` VALUES ('361127', '余干县', '361100', '9');
INSERT INTO `xpcms_area` VALUES ('361128', '鄱阳县', '361100', '10');
INSERT INTO `xpcms_area` VALUES ('361129', '万年县', '361100', '11');
INSERT INTO `xpcms_area` VALUES ('361130', '婺源县', '361100', '12');
INSERT INTO `xpcms_area` VALUES ('361181', '德兴市', '361100', '13');
INSERT INTO `xpcms_area` VALUES ('370101', '市辖区', '370100', '1');
INSERT INTO `xpcms_area` VALUES ('370102', '历下区', '370100', '2');
INSERT INTO `xpcms_area` VALUES ('370103', '市中区', '370100', '3');
INSERT INTO `xpcms_area` VALUES ('370104', '槐荫区', '370100', '4');
INSERT INTO `xpcms_area` VALUES ('370105', '天桥区', '370100', '5');
INSERT INTO `xpcms_area` VALUES ('370112', '历城区', '370100', '6');
INSERT INTO `xpcms_area` VALUES ('370113', '长清区', '370100', '7');
INSERT INTO `xpcms_area` VALUES ('370124', '平阴县', '370100', '8');
INSERT INTO `xpcms_area` VALUES ('370125', '济阳县', '370100', '9');
INSERT INTO `xpcms_area` VALUES ('370126', '商河县', '370100', '10');
INSERT INTO `xpcms_area` VALUES ('370181', '章丘市', '370100', '11');
INSERT INTO `xpcms_area` VALUES ('370201', '市辖区', '370200', '1');
INSERT INTO `xpcms_area` VALUES ('370202', '市南区', '370200', '2');
INSERT INTO `xpcms_area` VALUES ('370203', '市北区', '370200', '3');
INSERT INTO `xpcms_area` VALUES ('370205', '四方区', '370200', '4');
INSERT INTO `xpcms_area` VALUES ('370211', '黄岛区', '370200', '5');
INSERT INTO `xpcms_area` VALUES ('370212', '崂山区', '370200', '6');
INSERT INTO `xpcms_area` VALUES ('370213', '李沧区', '370200', '7');
INSERT INTO `xpcms_area` VALUES ('370214', '城阳区', '370200', '8');
INSERT INTO `xpcms_area` VALUES ('370281', '胶州市', '370200', '9');
INSERT INTO `xpcms_area` VALUES ('370282', '即墨市', '370200', '10');
INSERT INTO `xpcms_area` VALUES ('370283', '平度市', '370200', '11');
INSERT INTO `xpcms_area` VALUES ('370284', '胶南市', '370200', '12');
INSERT INTO `xpcms_area` VALUES ('370285', '莱西市', '370200', '13');
INSERT INTO `xpcms_area` VALUES ('370301', '市辖区', '370300', '1');
INSERT INTO `xpcms_area` VALUES ('370302', '淄川区', '370300', '2');
INSERT INTO `xpcms_area` VALUES ('370303', '张店区', '370300', '3');
INSERT INTO `xpcms_area` VALUES ('370304', '博山区', '370300', '4');
INSERT INTO `xpcms_area` VALUES ('370305', '临淄区', '370300', '5');
INSERT INTO `xpcms_area` VALUES ('370306', '周村区', '370300', '6');
INSERT INTO `xpcms_area` VALUES ('370321', '桓台县', '370300', '7');
INSERT INTO `xpcms_area` VALUES ('370322', '高青县', '370300', '8');
INSERT INTO `xpcms_area` VALUES ('370323', '沂源县', '370300', '9');
INSERT INTO `xpcms_area` VALUES ('370401', '市辖区', '370400', '1');
INSERT INTO `xpcms_area` VALUES ('370402', '市中区', '370400', '2');
INSERT INTO `xpcms_area` VALUES ('370403', '薛城区', '370400', '3');
INSERT INTO `xpcms_area` VALUES ('370404', '峄城区', '370400', '4');
INSERT INTO `xpcms_area` VALUES ('370405', '台儿庄区', '370400', '5');
INSERT INTO `xpcms_area` VALUES ('370406', '山亭区', '370400', '6');
INSERT INTO `xpcms_area` VALUES ('370481', '滕州市', '370400', '7');
INSERT INTO `xpcms_area` VALUES ('370501', '市辖区', '370500', '1');
INSERT INTO `xpcms_area` VALUES ('370502', '东营区', '370500', '2');
INSERT INTO `xpcms_area` VALUES ('370503', '河口区', '370500', '3');
INSERT INTO `xpcms_area` VALUES ('370521', '垦利县', '370500', '4');
INSERT INTO `xpcms_area` VALUES ('370522', '利津县', '370500', '5');
INSERT INTO `xpcms_area` VALUES ('370523', '广饶县', '370500', '6');
INSERT INTO `xpcms_area` VALUES ('370601', '市辖区', '370600', '1');
INSERT INTO `xpcms_area` VALUES ('370602', '芝罘区', '370600', '2');
INSERT INTO `xpcms_area` VALUES ('370611', '福山区', '370600', '3');
INSERT INTO `xpcms_area` VALUES ('370612', '牟平区', '370600', '4');
INSERT INTO `xpcms_area` VALUES ('370613', '莱山区', '370600', '5');
INSERT INTO `xpcms_area` VALUES ('370634', '长岛县', '370600', '6');
INSERT INTO `xpcms_area` VALUES ('370681', '龙口市', '370600', '7');
INSERT INTO `xpcms_area` VALUES ('370682', '莱阳市', '370600', '8');
INSERT INTO `xpcms_area` VALUES ('370683', '莱州市', '370600', '9');
INSERT INTO `xpcms_area` VALUES ('370684', '蓬莱市', '370600', '10');
INSERT INTO `xpcms_area` VALUES ('370685', '招远市', '370600', '11');
INSERT INTO `xpcms_area` VALUES ('370686', '栖霞市', '370600', '12');
INSERT INTO `xpcms_area` VALUES ('370687', '海阳市', '370600', '13');
INSERT INTO `xpcms_area` VALUES ('370701', '市辖区', '370700', '1');
INSERT INTO `xpcms_area` VALUES ('370702', '潍城区', '370700', '2');
INSERT INTO `xpcms_area` VALUES ('370703', '寒亭区', '370700', '3');
INSERT INTO `xpcms_area` VALUES ('370704', '坊子区', '370700', '4');
INSERT INTO `xpcms_area` VALUES ('370705', '奎文区', '370700', '5');
INSERT INTO `xpcms_area` VALUES ('370724', '临朐县', '370700', '6');
INSERT INTO `xpcms_area` VALUES ('370725', '昌乐县', '370700', '7');
INSERT INTO `xpcms_area` VALUES ('370781', '青州市', '370700', '8');
INSERT INTO `xpcms_area` VALUES ('370782', '诸城市', '370700', '9');
INSERT INTO `xpcms_area` VALUES ('370783', '寿光市', '370700', '10');
INSERT INTO `xpcms_area` VALUES ('370784', '安丘市', '370700', '11');
INSERT INTO `xpcms_area` VALUES ('370785', '高密市', '370700', '12');
INSERT INTO `xpcms_area` VALUES ('370786', '昌邑市', '370700', '13');
INSERT INTO `xpcms_area` VALUES ('370801', '市辖区', '370800', '1');
INSERT INTO `xpcms_area` VALUES ('370802', '市中区', '370800', '2');
INSERT INTO `xpcms_area` VALUES ('370811', '任城区', '370800', '3');
INSERT INTO `xpcms_area` VALUES ('370826', '微山县', '370800', '4');
INSERT INTO `xpcms_area` VALUES ('370827', '鱼台县', '370800', '5');
INSERT INTO `xpcms_area` VALUES ('370828', '金乡县', '370800', '6');
INSERT INTO `xpcms_area` VALUES ('370829', '嘉祥县', '370800', '7');
INSERT INTO `xpcms_area` VALUES ('370830', '汶上县', '370800', '8');
INSERT INTO `xpcms_area` VALUES ('370831', '泗水县', '370800', '9');
INSERT INTO `xpcms_area` VALUES ('370832', '梁山县', '370800', '10');
INSERT INTO `xpcms_area` VALUES ('370881', '曲阜市', '370800', '11');
INSERT INTO `xpcms_area` VALUES ('370882', '兖州市', '370800', '12');
INSERT INTO `xpcms_area` VALUES ('370883', '邹城市', '370800', '13');
INSERT INTO `xpcms_area` VALUES ('370901', '市辖区', '370900', '1');
INSERT INTO `xpcms_area` VALUES ('370902', '泰山区', '370900', '2');
INSERT INTO `xpcms_area` VALUES ('370903', '岱岳区', '370900', '3');
INSERT INTO `xpcms_area` VALUES ('370921', '宁阳县', '370900', '4');
INSERT INTO `xpcms_area` VALUES ('370923', '东平县', '370900', '5');
INSERT INTO `xpcms_area` VALUES ('370982', '新泰市', '370900', '6');
INSERT INTO `xpcms_area` VALUES ('370983', '肥城市', '370900', '7');
INSERT INTO `xpcms_area` VALUES ('371001', '市辖区', '371000', '1');
INSERT INTO `xpcms_area` VALUES ('371002', '环翠区', '371000', '2');
INSERT INTO `xpcms_area` VALUES ('371081', '文登市', '371000', '3');
INSERT INTO `xpcms_area` VALUES ('371082', '荣成市', '371000', '4');
INSERT INTO `xpcms_area` VALUES ('371083', '乳山市', '371000', '5');
INSERT INTO `xpcms_area` VALUES ('371101', '市辖区', '371100', '1');
INSERT INTO `xpcms_area` VALUES ('371102', '东港区', '371100', '2');
INSERT INTO `xpcms_area` VALUES ('371103', '岚山区', '371100', '3');
INSERT INTO `xpcms_area` VALUES ('371121', '五莲县', '371100', '4');
INSERT INTO `xpcms_area` VALUES ('371122', '莒　县', '371100', '5');
INSERT INTO `xpcms_area` VALUES ('371201', '市辖区', '371200', '1');
INSERT INTO `xpcms_area` VALUES ('371202', '莱城区', '371200', '2');
INSERT INTO `xpcms_area` VALUES ('371203', '钢城区', '371200', '3');
INSERT INTO `xpcms_area` VALUES ('371301', '市辖区', '371300', '1');
INSERT INTO `xpcms_area` VALUES ('371302', '兰山区', '371300', '2');
INSERT INTO `xpcms_area` VALUES ('371311', '罗庄区', '371300', '3');
INSERT INTO `xpcms_area` VALUES ('371312', '河东区', '371300', '4');
INSERT INTO `xpcms_area` VALUES ('371321', '沂南县', '371300', '5');
INSERT INTO `xpcms_area` VALUES ('371322', '郯城县', '371300', '6');
INSERT INTO `xpcms_area` VALUES ('371323', '沂水县', '371300', '7');
INSERT INTO `xpcms_area` VALUES ('371324', '苍山县', '371300', '8');
INSERT INTO `xpcms_area` VALUES ('371325', '费　县', '371300', '9');
INSERT INTO `xpcms_area` VALUES ('371326', '平邑县', '371300', '10');
INSERT INTO `xpcms_area` VALUES ('371327', '莒南县', '371300', '11');
INSERT INTO `xpcms_area` VALUES ('371328', '蒙阴县', '371300', '12');
INSERT INTO `xpcms_area` VALUES ('371329', '临沭县', '371300', '13');
INSERT INTO `xpcms_area` VALUES ('371401', '市辖区', '371400', '1');
INSERT INTO `xpcms_area` VALUES ('371402', '德城区', '371400', '2');
INSERT INTO `xpcms_area` VALUES ('371421', '陵　县', '371400', '3');
INSERT INTO `xpcms_area` VALUES ('371422', '宁津县', '371400', '4');
INSERT INTO `xpcms_area` VALUES ('371423', '庆云县', '371400', '5');
INSERT INTO `xpcms_area` VALUES ('371424', '临邑县', '371400', '6');
INSERT INTO `xpcms_area` VALUES ('371425', '齐河县', '371400', '7');
INSERT INTO `xpcms_area` VALUES ('371426', '平原县', '371400', '8');
INSERT INTO `xpcms_area` VALUES ('371427', '夏津县', '371400', '9');
INSERT INTO `xpcms_area` VALUES ('371428', '武城县', '371400', '10');
INSERT INTO `xpcms_area` VALUES ('371481', '乐陵市', '371400', '11');
INSERT INTO `xpcms_area` VALUES ('371482', '禹城市', '371400', '12');
INSERT INTO `xpcms_area` VALUES ('371501', '市辖区', '371500', '1');
INSERT INTO `xpcms_area` VALUES ('371502', '东昌府区', '371500', '2');
INSERT INTO `xpcms_area` VALUES ('371521', '阳谷县', '371500', '3');
INSERT INTO `xpcms_area` VALUES ('371522', '莘　县', '371500', '4');
INSERT INTO `xpcms_area` VALUES ('371523', '茌平县', '371500', '5');
INSERT INTO `xpcms_area` VALUES ('371524', '东阿县', '371500', '6');
INSERT INTO `xpcms_area` VALUES ('371525', '冠　县', '371500', '7');
INSERT INTO `xpcms_area` VALUES ('371526', '高唐县', '371500', '8');
INSERT INTO `xpcms_area` VALUES ('371581', '临清市', '371500', '9');
INSERT INTO `xpcms_area` VALUES ('371601', '市辖区', '371600', '1');
INSERT INTO `xpcms_area` VALUES ('371602', '滨城区', '371600', '2');
INSERT INTO `xpcms_area` VALUES ('371621', '惠民县', '371600', '3');
INSERT INTO `xpcms_area` VALUES ('371622', '阳信县', '371600', '4');
INSERT INTO `xpcms_area` VALUES ('371623', '无棣县', '371600', '5');
INSERT INTO `xpcms_area` VALUES ('371624', '沾化县', '371600', '6');
INSERT INTO `xpcms_area` VALUES ('371625', '博兴县', '371600', '7');
INSERT INTO `xpcms_area` VALUES ('371626', '邹平县', '371600', '8');
INSERT INTO `xpcms_area` VALUES ('371701', '市辖区', '371700', '1');
INSERT INTO `xpcms_area` VALUES ('371702', '牡丹区', '371700', '2');
INSERT INTO `xpcms_area` VALUES ('371721', '曹　县', '371700', '3');
INSERT INTO `xpcms_area` VALUES ('371722', '单　县', '371700', '4');
INSERT INTO `xpcms_area` VALUES ('371723', '成武县', '371700', '5');
INSERT INTO `xpcms_area` VALUES ('371724', '巨野县', '371700', '6');
INSERT INTO `xpcms_area` VALUES ('371725', '郓城县', '371700', '7');
INSERT INTO `xpcms_area` VALUES ('371726', '鄄城县', '371700', '8');
INSERT INTO `xpcms_area` VALUES ('371727', '定陶县', '371700', '9');
INSERT INTO `xpcms_area` VALUES ('371728', '东明县', '371700', '10');
INSERT INTO `xpcms_area` VALUES ('410101', '市辖区', '410100', '1');
INSERT INTO `xpcms_area` VALUES ('410102', '中原区', '410100', '2');
INSERT INTO `xpcms_area` VALUES ('410103', '二七区', '410100', '3');
INSERT INTO `xpcms_area` VALUES ('410104', '管城回族区', '410100', '4');
INSERT INTO `xpcms_area` VALUES ('410105', '金水区', '410100', '5');
INSERT INTO `xpcms_area` VALUES ('410106', '上街区', '410100', '6');
INSERT INTO `xpcms_area` VALUES ('410108', '邙山区', '410100', '7');
INSERT INTO `xpcms_area` VALUES ('410122', '中牟县', '410100', '8');
INSERT INTO `xpcms_area` VALUES ('410181', '巩义市', '410100', '9');
INSERT INTO `xpcms_area` VALUES ('410182', '荥阳市', '410100', '10');
INSERT INTO `xpcms_area` VALUES ('410183', '新密市', '410100', '11');
INSERT INTO `xpcms_area` VALUES ('410184', '新郑市', '410100', '12');
INSERT INTO `xpcms_area` VALUES ('410185', '登封市', '410100', '13');
INSERT INTO `xpcms_area` VALUES ('410201', '市辖区', '410200', '1');
INSERT INTO `xpcms_area` VALUES ('410202', '龙亭区', '410200', '2');
INSERT INTO `xpcms_area` VALUES ('410203', '顺河回族区', '410200', '3');
INSERT INTO `xpcms_area` VALUES ('410204', '鼓楼区', '410200', '4');
INSERT INTO `xpcms_area` VALUES ('410205', '南关区', '410200', '5');
INSERT INTO `xpcms_area` VALUES ('410211', '郊　区', '410200', '6');
INSERT INTO `xpcms_area` VALUES ('410221', '杞　县', '410200', '7');
INSERT INTO `xpcms_area` VALUES ('410222', '通许县', '410200', '8');
INSERT INTO `xpcms_area` VALUES ('410223', '尉氏县', '410200', '9');
INSERT INTO `xpcms_area` VALUES ('410224', '开封县', '410200', '10');
INSERT INTO `xpcms_area` VALUES ('410225', '兰考县', '410200', '11');
INSERT INTO `xpcms_area` VALUES ('410301', '市辖区', '410300', '1');
INSERT INTO `xpcms_area` VALUES ('410302', '老城区', '410300', '2');
INSERT INTO `xpcms_area` VALUES ('410303', '西工区', '410300', '3');
INSERT INTO `xpcms_area` VALUES ('410304', '廛河回族区', '410300', '4');
INSERT INTO `xpcms_area` VALUES ('410305', '涧西区', '410300', '5');
INSERT INTO `xpcms_area` VALUES ('410306', '吉利区', '410300', '6');
INSERT INTO `xpcms_area` VALUES ('410307', '洛龙区', '410300', '7');
INSERT INTO `xpcms_area` VALUES ('410322', '孟津县', '410300', '8');
INSERT INTO `xpcms_area` VALUES ('410323', '新安县', '410300', '9');
INSERT INTO `xpcms_area` VALUES ('410324', '栾川县', '410300', '10');
INSERT INTO `xpcms_area` VALUES ('410325', '嵩　县', '410300', '11');
INSERT INTO `xpcms_area` VALUES ('410326', '汝阳县', '410300', '12');
INSERT INTO `xpcms_area` VALUES ('410327', '宜阳县', '410300', '13');
INSERT INTO `xpcms_area` VALUES ('410328', '洛宁县', '410300', '14');
INSERT INTO `xpcms_area` VALUES ('410329', '伊川县', '410300', '15');
INSERT INTO `xpcms_area` VALUES ('410381', '偃师市', '410300', '16');
INSERT INTO `xpcms_area` VALUES ('410401', '市辖区', '410400', '1');
INSERT INTO `xpcms_area` VALUES ('410402', '新华区', '410400', '2');
INSERT INTO `xpcms_area` VALUES ('410403', '卫东区', '410400', '3');
INSERT INTO `xpcms_area` VALUES ('410404', '石龙区', '410400', '4');
INSERT INTO `xpcms_area` VALUES ('410411', '湛河区', '410400', '5');
INSERT INTO `xpcms_area` VALUES ('410421', '宝丰县', '410400', '6');
INSERT INTO `xpcms_area` VALUES ('410422', '叶　县', '410400', '7');
INSERT INTO `xpcms_area` VALUES ('410423', '鲁山县', '410400', '8');
INSERT INTO `xpcms_area` VALUES ('410425', '郏　县', '410400', '9');
INSERT INTO `xpcms_area` VALUES ('410481', '舞钢市', '410400', '10');
INSERT INTO `xpcms_area` VALUES ('410482', '汝州市', '410400', '11');
INSERT INTO `xpcms_area` VALUES ('410501', '市辖区', '410500', '1');
INSERT INTO `xpcms_area` VALUES ('410502', '文峰区', '410500', '2');
INSERT INTO `xpcms_area` VALUES ('410503', '北关区', '410500', '3');
INSERT INTO `xpcms_area` VALUES ('410505', '殷都区', '410500', '4');
INSERT INTO `xpcms_area` VALUES ('410506', '龙安区', '410500', '5');
INSERT INTO `xpcms_area` VALUES ('410522', '安阳县', '410500', '6');
INSERT INTO `xpcms_area` VALUES ('410523', '汤阴县', '410500', '7');
INSERT INTO `xpcms_area` VALUES ('410526', '滑　县', '410500', '8');
INSERT INTO `xpcms_area` VALUES ('410527', '内黄县', '410500', '9');
INSERT INTO `xpcms_area` VALUES ('410581', '林州市', '410500', '10');
INSERT INTO `xpcms_area` VALUES ('410601', '市辖区', '410600', '1');
INSERT INTO `xpcms_area` VALUES ('410602', '鹤山区', '410600', '2');
INSERT INTO `xpcms_area` VALUES ('410603', '山城区', '410600', '3');
INSERT INTO `xpcms_area` VALUES ('410611', '淇滨区', '410600', '4');
INSERT INTO `xpcms_area` VALUES ('410621', '浚　县', '410600', '5');
INSERT INTO `xpcms_area` VALUES ('410622', '淇　县', '410600', '6');
INSERT INTO `xpcms_area` VALUES ('410701', '市辖区', '410700', '1');
INSERT INTO `xpcms_area` VALUES ('410702', '红旗区', '410700', '2');
INSERT INTO `xpcms_area` VALUES ('410703', '卫滨区', '410700', '3');
INSERT INTO `xpcms_area` VALUES ('410704', '凤泉区', '410700', '4');
INSERT INTO `xpcms_area` VALUES ('410711', '牧野区', '410700', '5');
INSERT INTO `xpcms_area` VALUES ('410721', '新乡县', '410700', '6');
INSERT INTO `xpcms_area` VALUES ('410724', '获嘉县', '410700', '7');
INSERT INTO `xpcms_area` VALUES ('410725', '原阳县', '410700', '8');
INSERT INTO `xpcms_area` VALUES ('410726', '延津县', '410700', '9');
INSERT INTO `xpcms_area` VALUES ('410727', '封丘县', '410700', '10');
INSERT INTO `xpcms_area` VALUES ('410728', '长垣县', '410700', '11');
INSERT INTO `xpcms_area` VALUES ('410781', '卫辉市', '410700', '12');
INSERT INTO `xpcms_area` VALUES ('410782', '辉县市', '410700', '13');
INSERT INTO `xpcms_area` VALUES ('410801', '市辖区', '410800', '1');
INSERT INTO `xpcms_area` VALUES ('410802', '解放区', '410800', '2');
INSERT INTO `xpcms_area` VALUES ('410803', '中站区', '410800', '3');
INSERT INTO `xpcms_area` VALUES ('410804', '马村区', '410800', '4');
INSERT INTO `xpcms_area` VALUES ('410811', '山阳区', '410800', '5');
INSERT INTO `xpcms_area` VALUES ('410821', '修武县', '410800', '6');
INSERT INTO `xpcms_area` VALUES ('410822', '博爱县', '410800', '7');
INSERT INTO `xpcms_area` VALUES ('410823', '武陟县', '410800', '8');
INSERT INTO `xpcms_area` VALUES ('410825', '温　县', '410800', '9');
INSERT INTO `xpcms_area` VALUES ('410881', '济源市', '410800', '10');
INSERT INTO `xpcms_area` VALUES ('410882', '沁阳市', '410800', '11');
INSERT INTO `xpcms_area` VALUES ('410883', '孟州市', '410800', '12');
INSERT INTO `xpcms_area` VALUES ('410901', '市辖区', '410900', '1');
INSERT INTO `xpcms_area` VALUES ('410902', '华龙区', '410900', '2');
INSERT INTO `xpcms_area` VALUES ('410922', '清丰县', '410900', '3');
INSERT INTO `xpcms_area` VALUES ('410923', '南乐县', '410900', '4');
INSERT INTO `xpcms_area` VALUES ('410926', '范　县', '410900', '5');
INSERT INTO `xpcms_area` VALUES ('410927', '台前县', '410900', '6');
INSERT INTO `xpcms_area` VALUES ('410928', '濮阳县', '410900', '7');
INSERT INTO `xpcms_area` VALUES ('411001', '市辖区', '411000', '1');
INSERT INTO `xpcms_area` VALUES ('411002', '魏都区', '411000', '2');
INSERT INTO `xpcms_area` VALUES ('411023', '许昌县', '411000', '3');
INSERT INTO `xpcms_area` VALUES ('411024', '鄢陵县', '411000', '4');
INSERT INTO `xpcms_area` VALUES ('411025', '襄城县', '411000', '5');
INSERT INTO `xpcms_area` VALUES ('411081', '禹州市', '411000', '6');
INSERT INTO `xpcms_area` VALUES ('411082', '长葛市', '411000', '7');
INSERT INTO `xpcms_area` VALUES ('411101', '市辖区', '411100', '1');
INSERT INTO `xpcms_area` VALUES ('411102', '源汇区', '411100', '2');
INSERT INTO `xpcms_area` VALUES ('411103', '郾城区', '411100', '3');
INSERT INTO `xpcms_area` VALUES ('411104', '召陵区', '411100', '4');
INSERT INTO `xpcms_area` VALUES ('411121', '舞阳县', '411100', '5');
INSERT INTO `xpcms_area` VALUES ('411122', '临颍县', '411100', '6');
INSERT INTO `xpcms_area` VALUES ('411201', '市辖区', '411200', '1');
INSERT INTO `xpcms_area` VALUES ('411202', '湖滨区', '411200', '2');
INSERT INTO `xpcms_area` VALUES ('411221', '渑池县', '411200', '3');
INSERT INTO `xpcms_area` VALUES ('411222', '陕　县', '411200', '4');
INSERT INTO `xpcms_area` VALUES ('411224', '卢氏县', '411200', '5');
INSERT INTO `xpcms_area` VALUES ('411281', '义马市', '411200', '6');
INSERT INTO `xpcms_area` VALUES ('411282', '灵宝市', '411200', '7');
INSERT INTO `xpcms_area` VALUES ('411301', '市辖区', '411300', '1');
INSERT INTO `xpcms_area` VALUES ('411302', '宛城区', '411300', '2');
INSERT INTO `xpcms_area` VALUES ('411303', '卧龙区', '411300', '3');
INSERT INTO `xpcms_area` VALUES ('411321', '南召县', '411300', '4');
INSERT INTO `xpcms_area` VALUES ('411322', '方城县', '411300', '5');
INSERT INTO `xpcms_area` VALUES ('411323', '西峡县', '411300', '6');
INSERT INTO `xpcms_area` VALUES ('411324', '镇平县', '411300', '7');
INSERT INTO `xpcms_area` VALUES ('411325', '内乡县', '411300', '8');
INSERT INTO `xpcms_area` VALUES ('411326', '淅川县', '411300', '9');
INSERT INTO `xpcms_area` VALUES ('411327', '社旗县', '411300', '10');
INSERT INTO `xpcms_area` VALUES ('411328', '唐河县', '411300', '11');
INSERT INTO `xpcms_area` VALUES ('411329', '新野县', '411300', '12');
INSERT INTO `xpcms_area` VALUES ('411330', '桐柏县', '411300', '13');
INSERT INTO `xpcms_area` VALUES ('411381', '邓州市', '411300', '14');
INSERT INTO `xpcms_area` VALUES ('411401', '市辖区', '411400', '1');
INSERT INTO `xpcms_area` VALUES ('411402', '梁园区', '411400', '2');
INSERT INTO `xpcms_area` VALUES ('411403', '睢阳区', '411400', '3');
INSERT INTO `xpcms_area` VALUES ('411421', '民权县', '411400', '4');
INSERT INTO `xpcms_area` VALUES ('411422', '睢　县', '411400', '5');
INSERT INTO `xpcms_area` VALUES ('411423', '宁陵县', '411400', '6');
INSERT INTO `xpcms_area` VALUES ('411424', '柘城县', '411400', '7');
INSERT INTO `xpcms_area` VALUES ('411425', '虞城县', '411400', '8');
INSERT INTO `xpcms_area` VALUES ('411426', '夏邑县', '411400', '9');
INSERT INTO `xpcms_area` VALUES ('411481', '永城市', '411400', '10');
INSERT INTO `xpcms_area` VALUES ('411501', '市辖区', '411500', '1');
INSERT INTO `xpcms_area` VALUES ('411502', '师河区', '411500', '2');
INSERT INTO `xpcms_area` VALUES ('411503', '平桥区', '411500', '3');
INSERT INTO `xpcms_area` VALUES ('411521', '罗山县', '411500', '4');
INSERT INTO `xpcms_area` VALUES ('411522', '光山县', '411500', '5');
INSERT INTO `xpcms_area` VALUES ('411523', '新　县', '411500', '6');
INSERT INTO `xpcms_area` VALUES ('411524', '商城县', '411500', '7');
INSERT INTO `xpcms_area` VALUES ('411525', '固始县', '411500', '8');
INSERT INTO `xpcms_area` VALUES ('411526', '潢川县', '411500', '9');
INSERT INTO `xpcms_area` VALUES ('411527', '淮滨县', '411500', '10');
INSERT INTO `xpcms_area` VALUES ('411528', '息　县', '411500', '11');
INSERT INTO `xpcms_area` VALUES ('411601', '市辖区', '411600', '1');
INSERT INTO `xpcms_area` VALUES ('411602', '川汇区', '411600', '2');
INSERT INTO `xpcms_area` VALUES ('411621', '扶沟县', '411600', '3');
INSERT INTO `xpcms_area` VALUES ('411622', '西华县', '411600', '4');
INSERT INTO `xpcms_area` VALUES ('411623', '商水县', '411600', '5');
INSERT INTO `xpcms_area` VALUES ('411624', '沈丘县', '411600', '6');
INSERT INTO `xpcms_area` VALUES ('411625', '郸城县', '411600', '7');
INSERT INTO `xpcms_area` VALUES ('411626', '淮阳县', '411600', '8');
INSERT INTO `xpcms_area` VALUES ('411627', '太康县', '411600', '9');
INSERT INTO `xpcms_area` VALUES ('411628', '鹿邑县', '411600', '10');
INSERT INTO `xpcms_area` VALUES ('411681', '项城市', '411600', '11');
INSERT INTO `xpcms_area` VALUES ('411701', '市辖区', '411700', '1');
INSERT INTO `xpcms_area` VALUES ('411702', '驿城区', '411700', '2');
INSERT INTO `xpcms_area` VALUES ('411721', '西平县', '411700', '3');
INSERT INTO `xpcms_area` VALUES ('411722', '上蔡县', '411700', '4');
INSERT INTO `xpcms_area` VALUES ('411723', '平舆县', '411700', '5');
INSERT INTO `xpcms_area` VALUES ('411724', '正阳县', '411700', '6');
INSERT INTO `xpcms_area` VALUES ('411725', '确山县', '411700', '7');
INSERT INTO `xpcms_area` VALUES ('411726', '泌阳县', '411700', '8');
INSERT INTO `xpcms_area` VALUES ('411727', '汝南县', '411700', '9');
INSERT INTO `xpcms_area` VALUES ('411728', '遂平县', '411700', '10');
INSERT INTO `xpcms_area` VALUES ('411729', '新蔡县', '411700', '11');
INSERT INTO `xpcms_area` VALUES ('420101', '市辖区', '420100', '1');
INSERT INTO `xpcms_area` VALUES ('420102', '江岸区', '420100', '2');
INSERT INTO `xpcms_area` VALUES ('420103', '江汉区', '420100', '3');
INSERT INTO `xpcms_area` VALUES ('420104', '乔口区', '420100', '4');
INSERT INTO `xpcms_area` VALUES ('420105', '汉阳区', '420100', '5');
INSERT INTO `xpcms_area` VALUES ('420106', '武昌区', '420100', '6');
INSERT INTO `xpcms_area` VALUES ('420107', '青山区', '420100', '7');
INSERT INTO `xpcms_area` VALUES ('420111', '洪山区', '420100', '8');
INSERT INTO `xpcms_area` VALUES ('420112', '东西湖区', '420100', '9');
INSERT INTO `xpcms_area` VALUES ('420113', '汉南区', '420100', '10');
INSERT INTO `xpcms_area` VALUES ('420114', '蔡甸区', '420100', '11');
INSERT INTO `xpcms_area` VALUES ('420115', '江夏区', '420100', '12');
INSERT INTO `xpcms_area` VALUES ('420116', '黄陂区', '420100', '13');
INSERT INTO `xpcms_area` VALUES ('420117', '新洲区', '420100', '14');
INSERT INTO `xpcms_area` VALUES ('420201', '市辖区', '420200', '1');
INSERT INTO `xpcms_area` VALUES ('420202', '黄石港区', '420200', '2');
INSERT INTO `xpcms_area` VALUES ('420203', '西塞山区', '420200', '3');
INSERT INTO `xpcms_area` VALUES ('420204', '下陆区', '420200', '4');
INSERT INTO `xpcms_area` VALUES ('420205', '铁山区', '420200', '5');
INSERT INTO `xpcms_area` VALUES ('420222', '阳新县', '420200', '6');
INSERT INTO `xpcms_area` VALUES ('420281', '大冶市', '420200', '7');
INSERT INTO `xpcms_area` VALUES ('420301', '市辖区', '420300', '1');
INSERT INTO `xpcms_area` VALUES ('420302', '茅箭区', '420300', '2');
INSERT INTO `xpcms_area` VALUES ('420303', '张湾区', '420300', '3');
INSERT INTO `xpcms_area` VALUES ('420321', '郧　县', '420300', '4');
INSERT INTO `xpcms_area` VALUES ('420322', '郧西县', '420300', '5');
INSERT INTO `xpcms_area` VALUES ('420323', '竹山县', '420300', '6');
INSERT INTO `xpcms_area` VALUES ('420324', '竹溪县', '420300', '7');
INSERT INTO `xpcms_area` VALUES ('420325', '房　县', '420300', '8');
INSERT INTO `xpcms_area` VALUES ('420381', '丹江口市', '420300', '9');
INSERT INTO `xpcms_area` VALUES ('420501', '市辖区', '420500', '1');
INSERT INTO `xpcms_area` VALUES ('420502', '西陵区', '420500', '2');
INSERT INTO `xpcms_area` VALUES ('420503', '伍家岗区', '420500', '3');
INSERT INTO `xpcms_area` VALUES ('420504', '点军区', '420500', '4');
INSERT INTO `xpcms_area` VALUES ('420505', '猇亭区', '420500', '5');
INSERT INTO `xpcms_area` VALUES ('420506', '夷陵区', '420500', '6');
INSERT INTO `xpcms_area` VALUES ('420525', '远安县', '420500', '7');
INSERT INTO `xpcms_area` VALUES ('420526', '兴山县', '420500', '8');
INSERT INTO `xpcms_area` VALUES ('420527', '秭归县', '420500', '9');
INSERT INTO `xpcms_area` VALUES ('420528', '长阳土家族自治县', '420500', '10');
INSERT INTO `xpcms_area` VALUES ('420529', '五峰土家族自治县', '420500', '11');
INSERT INTO `xpcms_area` VALUES ('420581', '宜都市', '420500', '12');
INSERT INTO `xpcms_area` VALUES ('420582', '当阳市', '420500', '13');
INSERT INTO `xpcms_area` VALUES ('420583', '枝江市', '420500', '14');
INSERT INTO `xpcms_area` VALUES ('420601', '市辖区', '420600', '1');
INSERT INTO `xpcms_area` VALUES ('420602', '襄城区', '420600', '2');
INSERT INTO `xpcms_area` VALUES ('420606', '樊城区', '420600', '3');
INSERT INTO `xpcms_area` VALUES ('420607', '襄阳区', '420600', '4');
INSERT INTO `xpcms_area` VALUES ('420624', '南漳县', '420600', '5');
INSERT INTO `xpcms_area` VALUES ('420625', '谷城县', '420600', '6');
INSERT INTO `xpcms_area` VALUES ('420626', '保康县', '420600', '7');
INSERT INTO `xpcms_area` VALUES ('420682', '老河口市', '420600', '8');
INSERT INTO `xpcms_area` VALUES ('420683', '枣阳市', '420600', '9');
INSERT INTO `xpcms_area` VALUES ('420684', '宜城市', '420600', '10');
INSERT INTO `xpcms_area` VALUES ('420701', '市辖区', '420700', '1');
INSERT INTO `xpcms_area` VALUES ('420702', '梁子湖区', '420700', '2');
INSERT INTO `xpcms_area` VALUES ('420703', '华容区', '420700', '3');
INSERT INTO `xpcms_area` VALUES ('420704', '鄂城区', '420700', '4');
INSERT INTO `xpcms_area` VALUES ('420801', '市辖区', '420800', '1');
INSERT INTO `xpcms_area` VALUES ('420802', '东宝区', '420800', '2');
INSERT INTO `xpcms_area` VALUES ('420804', '掇刀区', '420800', '3');
INSERT INTO `xpcms_area` VALUES ('420821', '京山县', '420800', '4');
INSERT INTO `xpcms_area` VALUES ('420822', '沙洋县', '420800', '5');
INSERT INTO `xpcms_area` VALUES ('420881', '钟祥市', '420800', '6');
INSERT INTO `xpcms_area` VALUES ('420901', '市辖区', '420900', '1');
INSERT INTO `xpcms_area` VALUES ('420902', '孝南区', '420900', '2');
INSERT INTO `xpcms_area` VALUES ('420921', '孝昌县', '420900', '3');
INSERT INTO `xpcms_area` VALUES ('420922', '大悟县', '420900', '4');
INSERT INTO `xpcms_area` VALUES ('420923', '云梦县', '420900', '5');
INSERT INTO `xpcms_area` VALUES ('420981', '应城市', '420900', '6');
INSERT INTO `xpcms_area` VALUES ('420982', '安陆市', '420900', '7');
INSERT INTO `xpcms_area` VALUES ('420984', '汉川市', '420900', '8');
INSERT INTO `xpcms_area` VALUES ('421001', '市辖区', '421000', '1');
INSERT INTO `xpcms_area` VALUES ('421002', '沙市区', '421000', '2');
INSERT INTO `xpcms_area` VALUES ('421003', '荆州区', '421000', '3');
INSERT INTO `xpcms_area` VALUES ('421022', '公安县', '421000', '4');
INSERT INTO `xpcms_area` VALUES ('421023', '监利县', '421000', '5');
INSERT INTO `xpcms_area` VALUES ('421024', '江陵县', '421000', '6');
INSERT INTO `xpcms_area` VALUES ('421081', '石首市', '421000', '7');
INSERT INTO `xpcms_area` VALUES ('421083', '洪湖市', '421000', '8');
INSERT INTO `xpcms_area` VALUES ('421087', '松滋市', '421000', '9');
INSERT INTO `xpcms_area` VALUES ('421101', '市辖区', '421100', '1');
INSERT INTO `xpcms_area` VALUES ('421102', '黄州区', '421100', '2');
INSERT INTO `xpcms_area` VALUES ('421121', '团风县', '421100', '3');
INSERT INTO `xpcms_area` VALUES ('421122', '红安县', '421100', '4');
INSERT INTO `xpcms_area` VALUES ('421123', '罗田县', '421100', '5');
INSERT INTO `xpcms_area` VALUES ('421124', '英山县', '421100', '6');
INSERT INTO `xpcms_area` VALUES ('421125', '浠水县', '421100', '7');
INSERT INTO `xpcms_area` VALUES ('421126', '蕲春县', '421100', '8');
INSERT INTO `xpcms_area` VALUES ('421127', '黄梅县', '421100', '9');
INSERT INTO `xpcms_area` VALUES ('421181', '麻城市', '421100', '10');
INSERT INTO `xpcms_area` VALUES ('421182', '武穴市', '421100', '11');
INSERT INTO `xpcms_area` VALUES ('421201', '市辖区', '421200', '1');
INSERT INTO `xpcms_area` VALUES ('421202', '咸安区', '421200', '2');
INSERT INTO `xpcms_area` VALUES ('421221', '嘉鱼县', '421200', '3');
INSERT INTO `xpcms_area` VALUES ('421222', '通城县', '421200', '4');
INSERT INTO `xpcms_area` VALUES ('421223', '崇阳县', '421200', '5');
INSERT INTO `xpcms_area` VALUES ('421224', '通山县', '421200', '6');
INSERT INTO `xpcms_area` VALUES ('421281', '赤壁市', '421200', '7');
INSERT INTO `xpcms_area` VALUES ('421301', '市辖区', '421300', '1');
INSERT INTO `xpcms_area` VALUES ('421302', '曾都区', '421300', '2');
INSERT INTO `xpcms_area` VALUES ('421381', '广水市', '421300', '3');
INSERT INTO `xpcms_area` VALUES ('422801', '恩施市', '422800', '1');
INSERT INTO `xpcms_area` VALUES ('422802', '利川市', '422800', '2');
INSERT INTO `xpcms_area` VALUES ('422822', '建始县', '422800', '3');
INSERT INTO `xpcms_area` VALUES ('422823', '巴东县', '422800', '4');
INSERT INTO `xpcms_area` VALUES ('422825', '宣恩县', '422800', '5');
INSERT INTO `xpcms_area` VALUES ('422826', '咸丰县', '422800', '6');
INSERT INTO `xpcms_area` VALUES ('422827', '来凤县', '422800', '7');
INSERT INTO `xpcms_area` VALUES ('422828', '鹤峰县', '422800', '8');
INSERT INTO `xpcms_area` VALUES ('429004', '仙桃市', '429000', '1');
INSERT INTO `xpcms_area` VALUES ('429005', '潜江市', '429000', '2');
INSERT INTO `xpcms_area` VALUES ('429006', '天门市', '429000', '3');
INSERT INTO `xpcms_area` VALUES ('429021', '神农架林区', '429000', '4');
INSERT INTO `xpcms_area` VALUES ('430101', '市辖区', '430100', '1');
INSERT INTO `xpcms_area` VALUES ('430102', '芙蓉区', '430100', '2');
INSERT INTO `xpcms_area` VALUES ('430103', '天心区', '430100', '3');
INSERT INTO `xpcms_area` VALUES ('430104', '岳麓区', '430100', '4');
INSERT INTO `xpcms_area` VALUES ('430105', '开福区', '430100', '5');
INSERT INTO `xpcms_area` VALUES ('430111', '雨花区', '430100', '6');
INSERT INTO `xpcms_area` VALUES ('430121', '长沙县', '430100', '7');
INSERT INTO `xpcms_area` VALUES ('430122', '望城县', '430100', '8');
INSERT INTO `xpcms_area` VALUES ('430124', '宁乡县', '430100', '9');
INSERT INTO `xpcms_area` VALUES ('430181', '浏阳市', '430100', '10');
INSERT INTO `xpcms_area` VALUES ('430201', '市辖区', '430200', '1');
INSERT INTO `xpcms_area` VALUES ('430202', '荷塘区', '430200', '2');
INSERT INTO `xpcms_area` VALUES ('430203', '芦淞区', '430200', '3');
INSERT INTO `xpcms_area` VALUES ('430204', '石峰区', '430200', '4');
INSERT INTO `xpcms_area` VALUES ('430211', '天元区', '430200', '5');
INSERT INTO `xpcms_area` VALUES ('430221', '株洲县', '430200', '6');
INSERT INTO `xpcms_area` VALUES ('430223', '攸　县', '430200', '7');
INSERT INTO `xpcms_area` VALUES ('430224', '茶陵县', '430200', '8');
INSERT INTO `xpcms_area` VALUES ('430225', '炎陵县', '430200', '9');
INSERT INTO `xpcms_area` VALUES ('430281', '醴陵市', '430200', '10');
INSERT INTO `xpcms_area` VALUES ('430301', '市辖区', '430300', '1');
INSERT INTO `xpcms_area` VALUES ('430302', '雨湖区', '430300', '2');
INSERT INTO `xpcms_area` VALUES ('430304', '岳塘区', '430300', '3');
INSERT INTO `xpcms_area` VALUES ('430321', '湘潭县', '430300', '4');
INSERT INTO `xpcms_area` VALUES ('430381', '湘乡市', '430300', '5');
INSERT INTO `xpcms_area` VALUES ('430382', '韶山市', '430300', '6');
INSERT INTO `xpcms_area` VALUES ('430401', '市辖区', '430400', '1');
INSERT INTO `xpcms_area` VALUES ('430405', '珠晖区', '430400', '2');
INSERT INTO `xpcms_area` VALUES ('430406', '雁峰区', '430400', '3');
INSERT INTO `xpcms_area` VALUES ('430407', '石鼓区', '430400', '4');
INSERT INTO `xpcms_area` VALUES ('430408', '蒸湘区', '430400', '5');
INSERT INTO `xpcms_area` VALUES ('430412', '南岳区', '430400', '6');
INSERT INTO `xpcms_area` VALUES ('430421', '衡阳县', '430400', '7');
INSERT INTO `xpcms_area` VALUES ('430422', '衡南县', '430400', '8');
INSERT INTO `xpcms_area` VALUES ('430423', '衡山县', '430400', '9');
INSERT INTO `xpcms_area` VALUES ('430424', '衡东县', '430400', '10');
INSERT INTO `xpcms_area` VALUES ('430426', '祁东县', '430400', '11');
INSERT INTO `xpcms_area` VALUES ('430481', '耒阳市', '430400', '12');
INSERT INTO `xpcms_area` VALUES ('430482', '常宁市', '430400', '13');
INSERT INTO `xpcms_area` VALUES ('430501', '市辖区', '430500', '1');
INSERT INTO `xpcms_area` VALUES ('430502', '双清区', '430500', '2');
INSERT INTO `xpcms_area` VALUES ('430503', '大祥区', '430500', '3');
INSERT INTO `xpcms_area` VALUES ('430511', '北塔区', '430500', '4');
INSERT INTO `xpcms_area` VALUES ('430521', '邵东县', '430500', '5');
INSERT INTO `xpcms_area` VALUES ('430522', '新邵县', '430500', '6');
INSERT INTO `xpcms_area` VALUES ('430523', '邵阳县', '430500', '7');
INSERT INTO `xpcms_area` VALUES ('430524', '隆回县', '430500', '8');
INSERT INTO `xpcms_area` VALUES ('430525', '洞口县', '430500', '9');
INSERT INTO `xpcms_area` VALUES ('430527', '绥宁县', '430500', '10');
INSERT INTO `xpcms_area` VALUES ('430528', '新宁县', '430500', '11');
INSERT INTO `xpcms_area` VALUES ('430529', '城步苗族自治县', '430500', '12');
INSERT INTO `xpcms_area` VALUES ('430581', '武冈市', '430500', '13');
INSERT INTO `xpcms_area` VALUES ('430601', '市辖区', '430600', '1');
INSERT INTO `xpcms_area` VALUES ('430602', '岳阳楼区', '430600', '2');
INSERT INTO `xpcms_area` VALUES ('430603', '云溪区', '430600', '3');
INSERT INTO `xpcms_area` VALUES ('430611', '君山区', '430600', '4');
INSERT INTO `xpcms_area` VALUES ('430621', '岳阳县', '430600', '5');
INSERT INTO `xpcms_area` VALUES ('430623', '华容县', '430600', '6');
INSERT INTO `xpcms_area` VALUES ('430624', '湘阴县', '430600', '7');
INSERT INTO `xpcms_area` VALUES ('430626', '平江县', '430600', '8');
INSERT INTO `xpcms_area` VALUES ('430681', '汨罗市', '430600', '9');
INSERT INTO `xpcms_area` VALUES ('430682', '临湘市', '430600', '10');
INSERT INTO `xpcms_area` VALUES ('430701', '市辖区', '430700', '1');
INSERT INTO `xpcms_area` VALUES ('430702', '武陵区', '430700', '2');
INSERT INTO `xpcms_area` VALUES ('430703', '鼎城区', '430700', '3');
INSERT INTO `xpcms_area` VALUES ('430721', '安乡县', '430700', '4');
INSERT INTO `xpcms_area` VALUES ('430722', '汉寿县', '430700', '5');
INSERT INTO `xpcms_area` VALUES ('430723', '澧　县', '430700', '6');
INSERT INTO `xpcms_area` VALUES ('430724', '临澧县', '430700', '7');
INSERT INTO `xpcms_area` VALUES ('430725', '桃源县', '430700', '8');
INSERT INTO `xpcms_area` VALUES ('430726', '石门县', '430700', '9');
INSERT INTO `xpcms_area` VALUES ('430781', '津市市', '430700', '10');
INSERT INTO `xpcms_area` VALUES ('430801', '市辖区', '430800', '1');
INSERT INTO `xpcms_area` VALUES ('430802', '永定区', '430800', '2');
INSERT INTO `xpcms_area` VALUES ('430811', '武陵源区', '430800', '3');
INSERT INTO `xpcms_area` VALUES ('430821', '慈利县', '430800', '4');
INSERT INTO `xpcms_area` VALUES ('430822', '桑植县', '430800', '5');
INSERT INTO `xpcms_area` VALUES ('430901', '市辖区', '430900', '1');
INSERT INTO `xpcms_area` VALUES ('430902', '资阳区', '430900', '2');
INSERT INTO `xpcms_area` VALUES ('430903', '赫山区', '430900', '3');
INSERT INTO `xpcms_area` VALUES ('430921', '南　县', '430900', '4');
INSERT INTO `xpcms_area` VALUES ('430922', '桃江县', '430900', '5');
INSERT INTO `xpcms_area` VALUES ('430923', '安化县', '430900', '6');
INSERT INTO `xpcms_area` VALUES ('430981', '沅江市', '430900', '7');
INSERT INTO `xpcms_area` VALUES ('431001', '市辖区', '431000', '1');
INSERT INTO `xpcms_area` VALUES ('431002', '北湖区', '431000', '2');
INSERT INTO `xpcms_area` VALUES ('431003', '苏仙区', '431000', '3');
INSERT INTO `xpcms_area` VALUES ('431021', '桂阳县', '431000', '4');
INSERT INTO `xpcms_area` VALUES ('431022', '宜章县', '431000', '5');
INSERT INTO `xpcms_area` VALUES ('431023', '永兴县', '431000', '6');
INSERT INTO `xpcms_area` VALUES ('431024', '嘉禾县', '431000', '7');
INSERT INTO `xpcms_area` VALUES ('431025', '临武县', '431000', '8');
INSERT INTO `xpcms_area` VALUES ('431026', '汝城县', '431000', '9');
INSERT INTO `xpcms_area` VALUES ('431027', '桂东县', '431000', '10');
INSERT INTO `xpcms_area` VALUES ('431028', '安仁县', '431000', '11');
INSERT INTO `xpcms_area` VALUES ('431081', '资兴市', '431000', '12');
INSERT INTO `xpcms_area` VALUES ('431101', '市辖区', '431100', '1');
INSERT INTO `xpcms_area` VALUES ('431102', '芝山区', '431100', '2');
INSERT INTO `xpcms_area` VALUES ('431103', '冷水滩区', '431100', '3');
INSERT INTO `xpcms_area` VALUES ('431121', '祁阳县', '431100', '4');
INSERT INTO `xpcms_area` VALUES ('431122', '东安县', '431100', '5');
INSERT INTO `xpcms_area` VALUES ('431123', '双牌县', '431100', '6');
INSERT INTO `xpcms_area` VALUES ('431124', '道　县', '431100', '7');
INSERT INTO `xpcms_area` VALUES ('431125', '江永县', '431100', '8');
INSERT INTO `xpcms_area` VALUES ('431126', '宁远县', '431100', '9');
INSERT INTO `xpcms_area` VALUES ('431127', '蓝山县', '431100', '10');
INSERT INTO `xpcms_area` VALUES ('431128', '新田县', '431100', '11');
INSERT INTO `xpcms_area` VALUES ('431129', '江华瑶族自治县', '431100', '12');
INSERT INTO `xpcms_area` VALUES ('431201', '市辖区', '431200', '1');
INSERT INTO `xpcms_area` VALUES ('431202', '鹤城区', '431200', '2');
INSERT INTO `xpcms_area` VALUES ('431221', '中方县', '431200', '3');
INSERT INTO `xpcms_area` VALUES ('431222', '沅陵县', '431200', '4');
INSERT INTO `xpcms_area` VALUES ('431223', '辰溪县', '431200', '5');
INSERT INTO `xpcms_area` VALUES ('431224', '溆浦县', '431200', '6');
INSERT INTO `xpcms_area` VALUES ('431225', '会同县', '431200', '7');
INSERT INTO `xpcms_area` VALUES ('431226', '麻阳苗族自治县', '431200', '8');
INSERT INTO `xpcms_area` VALUES ('431227', '新晃侗族自治县', '431200', '9');
INSERT INTO `xpcms_area` VALUES ('431228', '芷江侗族自治县', '431200', '10');
INSERT INTO `xpcms_area` VALUES ('431229', '靖州苗族侗族自治县', '431200', '11');
INSERT INTO `xpcms_area` VALUES ('431230', '通道侗族自治县', '431200', '12');
INSERT INTO `xpcms_area` VALUES ('431281', '洪江市', '431200', '13');
INSERT INTO `xpcms_area` VALUES ('431301', '市辖区', '431300', '1');
INSERT INTO `xpcms_area` VALUES ('431302', '娄星区', '431300', '2');
INSERT INTO `xpcms_area` VALUES ('431321', '双峰县', '431300', '3');
INSERT INTO `xpcms_area` VALUES ('431322', '新化县', '431300', '4');
INSERT INTO `xpcms_area` VALUES ('431381', '冷水江市', '431300', '5');
INSERT INTO `xpcms_area` VALUES ('431382', '涟源市', '431300', '6');
INSERT INTO `xpcms_area` VALUES ('433101', '吉首市', '433100', '1');
INSERT INTO `xpcms_area` VALUES ('433122', '泸溪县', '433100', '2');
INSERT INTO `xpcms_area` VALUES ('433123', '凤凰县', '433100', '3');
INSERT INTO `xpcms_area` VALUES ('433124', '花垣县', '433100', '4');
INSERT INTO `xpcms_area` VALUES ('433125', '保靖县', '433100', '5');
INSERT INTO `xpcms_area` VALUES ('433126', '古丈县', '433100', '6');
INSERT INTO `xpcms_area` VALUES ('433127', '永顺县', '433100', '7');
INSERT INTO `xpcms_area` VALUES ('433130', '龙山县', '433100', '8');
INSERT INTO `xpcms_area` VALUES ('440101', '市辖区', '440100', '1');
INSERT INTO `xpcms_area` VALUES ('440102', '东山区', '440100', '2');
INSERT INTO `xpcms_area` VALUES ('440103', '荔湾区', '440100', '3');
INSERT INTO `xpcms_area` VALUES ('440104', '越秀区', '440100', '4');
INSERT INTO `xpcms_area` VALUES ('440105', '海珠区', '440100', '5');
INSERT INTO `xpcms_area` VALUES ('440106', '天河区', '440100', '6');
INSERT INTO `xpcms_area` VALUES ('440107', '芳村区', '440100', '7');
INSERT INTO `xpcms_area` VALUES ('440111', '白云区', '440100', '8');
INSERT INTO `xpcms_area` VALUES ('440112', '黄埔区', '440100', '9');
INSERT INTO `xpcms_area` VALUES ('440113', '番禺区', '440100', '10');
INSERT INTO `xpcms_area` VALUES ('440114', '花都区', '440100', '11');
INSERT INTO `xpcms_area` VALUES ('440183', '增城市', '440100', '12');
INSERT INTO `xpcms_area` VALUES ('440184', '从化市', '440100', '13');
INSERT INTO `xpcms_area` VALUES ('440201', '市辖区', '440200', '1');
INSERT INTO `xpcms_area` VALUES ('440203', '武江区', '440200', '2');
INSERT INTO `xpcms_area` VALUES ('440204', '浈江区', '440200', '3');
INSERT INTO `xpcms_area` VALUES ('440205', '曲江区', '440200', '4');
INSERT INTO `xpcms_area` VALUES ('440222', '始兴县', '440200', '5');
INSERT INTO `xpcms_area` VALUES ('440224', '仁化县', '440200', '6');
INSERT INTO `xpcms_area` VALUES ('440229', '翁源县', '440200', '7');
INSERT INTO `xpcms_area` VALUES ('440232', '乳源瑶族自治县', '440200', '8');
INSERT INTO `xpcms_area` VALUES ('440233', '新丰县', '440200', '9');
INSERT INTO `xpcms_area` VALUES ('440281', '乐昌市', '440200', '10');
INSERT INTO `xpcms_area` VALUES ('440282', '南雄市', '440200', '11');
INSERT INTO `xpcms_area` VALUES ('440301', '市辖区', '440300', '1');
INSERT INTO `xpcms_area` VALUES ('440303', '罗湖区', '440300', '2');
INSERT INTO `xpcms_area` VALUES ('440304', '福田区', '440300', '3');
INSERT INTO `xpcms_area` VALUES ('440305', '南山区', '440300', '4');
INSERT INTO `xpcms_area` VALUES ('440306', '宝安区', '440300', '5');
INSERT INTO `xpcms_area` VALUES ('440307', '龙岗区', '440300', '6');
INSERT INTO `xpcms_area` VALUES ('440308', '盐田区', '440300', '7');
INSERT INTO `xpcms_area` VALUES ('440401', '市辖区', '440400', '1');
INSERT INTO `xpcms_area` VALUES ('440402', '香洲区', '440400', '2');
INSERT INTO `xpcms_area` VALUES ('440403', '斗门区', '440400', '3');
INSERT INTO `xpcms_area` VALUES ('440404', '金湾区', '440400', '4');
INSERT INTO `xpcms_area` VALUES ('440501', '市辖区', '440500', '1');
INSERT INTO `xpcms_area` VALUES ('440507', '龙湖区', '440500', '2');
INSERT INTO `xpcms_area` VALUES ('440511', '金平区', '440500', '3');
INSERT INTO `xpcms_area` VALUES ('440512', '濠江区', '440500', '4');
INSERT INTO `xpcms_area` VALUES ('440513', '潮阳区', '440500', '5');
INSERT INTO `xpcms_area` VALUES ('440514', '潮南区', '440500', '6');
INSERT INTO `xpcms_area` VALUES ('440515', '澄海区', '440500', '7');
INSERT INTO `xpcms_area` VALUES ('440523', '南澳县', '440500', '8');
INSERT INTO `xpcms_area` VALUES ('440601', '市辖区', '440600', '1');
INSERT INTO `xpcms_area` VALUES ('440604', '禅城区', '440600', '2');
INSERT INTO `xpcms_area` VALUES ('440605', '南海区', '440600', '3');
INSERT INTO `xpcms_area` VALUES ('440606', '顺德区', '440600', '4');
INSERT INTO `xpcms_area` VALUES ('440607', '三水区', '440600', '5');
INSERT INTO `xpcms_area` VALUES ('440608', '高明区', '440600', '6');
INSERT INTO `xpcms_area` VALUES ('440701', '市辖区', '440700', '1');
INSERT INTO `xpcms_area` VALUES ('440703', '蓬江区', '440700', '2');
INSERT INTO `xpcms_area` VALUES ('440704', '江海区', '440700', '3');
INSERT INTO `xpcms_area` VALUES ('440705', '新会区', '440700', '4');
INSERT INTO `xpcms_area` VALUES ('440781', '台山市', '440700', '5');
INSERT INTO `xpcms_area` VALUES ('440783', '开平市', '440700', '6');
INSERT INTO `xpcms_area` VALUES ('440784', '鹤山市', '440700', '7');
INSERT INTO `xpcms_area` VALUES ('440785', '恩平市', '440700', '8');
INSERT INTO `xpcms_area` VALUES ('440801', '市辖区', '440800', '1');
INSERT INTO `xpcms_area` VALUES ('440802', '赤坎区', '440800', '2');
INSERT INTO `xpcms_area` VALUES ('440803', '霞山区', '440800', '3');
INSERT INTO `xpcms_area` VALUES ('440804', '坡头区', '440800', '4');
INSERT INTO `xpcms_area` VALUES ('440811', '麻章区', '440800', '5');
INSERT INTO `xpcms_area` VALUES ('440823', '遂溪县', '440800', '6');
INSERT INTO `xpcms_area` VALUES ('440825', '徐闻县', '440800', '7');
INSERT INTO `xpcms_area` VALUES ('440881', '廉江市', '440800', '8');
INSERT INTO `xpcms_area` VALUES ('440882', '雷州市', '440800', '9');
INSERT INTO `xpcms_area` VALUES ('440883', '吴川市', '440800', '10');
INSERT INTO `xpcms_area` VALUES ('440901', '市辖区', '440900', '1');
INSERT INTO `xpcms_area` VALUES ('440902', '茂南区', '440900', '2');
INSERT INTO `xpcms_area` VALUES ('440903', '茂港区', '440900', '3');
INSERT INTO `xpcms_area` VALUES ('440923', '电白县', '440900', '4');
INSERT INTO `xpcms_area` VALUES ('440981', '高州市', '440900', '5');
INSERT INTO `xpcms_area` VALUES ('440982', '化州市', '440900', '6');
INSERT INTO `xpcms_area` VALUES ('440983', '信宜市', '440900', '7');
INSERT INTO `xpcms_area` VALUES ('441201', '市辖区', '441200', '1');
INSERT INTO `xpcms_area` VALUES ('441202', '端州区', '441200', '2');
INSERT INTO `xpcms_area` VALUES ('441203', '鼎湖区', '441200', '3');
INSERT INTO `xpcms_area` VALUES ('441223', '广宁县', '441200', '4');
INSERT INTO `xpcms_area` VALUES ('441224', '怀集县', '441200', '5');
INSERT INTO `xpcms_area` VALUES ('441225', '封开县', '441200', '6');
INSERT INTO `xpcms_area` VALUES ('441226', '德庆县', '441200', '7');
INSERT INTO `xpcms_area` VALUES ('441283', '高要市', '441200', '8');
INSERT INTO `xpcms_area` VALUES ('441284', '四会市', '441200', '9');
INSERT INTO `xpcms_area` VALUES ('441301', '市辖区', '441300', '1');
INSERT INTO `xpcms_area` VALUES ('441302', '惠城区', '441300', '2');
INSERT INTO `xpcms_area` VALUES ('441303', '惠阳区', '441300', '3');
INSERT INTO `xpcms_area` VALUES ('441322', '博罗县', '441300', '4');
INSERT INTO `xpcms_area` VALUES ('441323', '惠东县', '441300', '5');
INSERT INTO `xpcms_area` VALUES ('441324', '龙门县', '441300', '6');
INSERT INTO `xpcms_area` VALUES ('441401', '市辖区', '441400', '1');
INSERT INTO `xpcms_area` VALUES ('441402', '梅江区', '441400', '2');
INSERT INTO `xpcms_area` VALUES ('441421', '梅　县', '441400', '3');
INSERT INTO `xpcms_area` VALUES ('441422', '大埔县', '441400', '4');
INSERT INTO `xpcms_area` VALUES ('441423', '丰顺县', '441400', '5');
INSERT INTO `xpcms_area` VALUES ('441424', '五华县', '441400', '6');
INSERT INTO `xpcms_area` VALUES ('441426', '平远县', '441400', '7');
INSERT INTO `xpcms_area` VALUES ('441427', '蕉岭县', '441400', '8');
INSERT INTO `xpcms_area` VALUES ('441481', '兴宁市', '441400', '9');
INSERT INTO `xpcms_area` VALUES ('441501', '市辖区', '441500', '1');
INSERT INTO `xpcms_area` VALUES ('441502', '城　区', '441500', '2');
INSERT INTO `xpcms_area` VALUES ('441521', '海丰县', '441500', '3');
INSERT INTO `xpcms_area` VALUES ('441523', '陆河县', '441500', '4');
INSERT INTO `xpcms_area` VALUES ('441581', '陆丰市', '441500', '5');
INSERT INTO `xpcms_area` VALUES ('441601', '市辖区', '441600', '1');
INSERT INTO `xpcms_area` VALUES ('441602', '源城区', '441600', '2');
INSERT INTO `xpcms_area` VALUES ('441621', '紫金县', '441600', '3');
INSERT INTO `xpcms_area` VALUES ('441622', '龙川县', '441600', '4');
INSERT INTO `xpcms_area` VALUES ('441623', '连平县', '441600', '5');
INSERT INTO `xpcms_area` VALUES ('441624', '和平县', '441600', '6');
INSERT INTO `xpcms_area` VALUES ('441625', '东源县', '441600', '7');
INSERT INTO `xpcms_area` VALUES ('441701', '市辖区', '441700', '1');
INSERT INTO `xpcms_area` VALUES ('441702', '江城区', '441700', '2');
INSERT INTO `xpcms_area` VALUES ('441721', '阳西县', '441700', '3');
INSERT INTO `xpcms_area` VALUES ('441723', '阳东县', '441700', '4');
INSERT INTO `xpcms_area` VALUES ('441781', '阳春市', '441700', '5');
INSERT INTO `xpcms_area` VALUES ('441801', '市辖区', '441800', '1');
INSERT INTO `xpcms_area` VALUES ('441802', '清城区', '441800', '2');
INSERT INTO `xpcms_area` VALUES ('441821', '佛冈县', '441800', '3');
INSERT INTO `xpcms_area` VALUES ('441823', '阳山县', '441800', '4');
INSERT INTO `xpcms_area` VALUES ('441825', '连山壮族瑶族自治县', '441800', '5');
INSERT INTO `xpcms_area` VALUES ('441826', '连南瑶族自治县', '441800', '6');
INSERT INTO `xpcms_area` VALUES ('441827', '清新县', '441800', '7');
INSERT INTO `xpcms_area` VALUES ('441881', '英德市', '441800', '8');
INSERT INTO `xpcms_area` VALUES ('441882', '连州市', '441800', '9');
INSERT INTO `xpcms_area` VALUES ('445101', '市辖区', '445100', '1');
INSERT INTO `xpcms_area` VALUES ('445102', '湘桥区', '445100', '2');
INSERT INTO `xpcms_area` VALUES ('445121', '潮安县', '445100', '3');
INSERT INTO `xpcms_area` VALUES ('445122', '饶平县', '445100', '4');
INSERT INTO `xpcms_area` VALUES ('445201', '市辖区', '445200', '1');
INSERT INTO `xpcms_area` VALUES ('445202', '榕城区', '445200', '2');
INSERT INTO `xpcms_area` VALUES ('445221', '揭东县', '445200', '3');
INSERT INTO `xpcms_area` VALUES ('445222', '揭西县', '445200', '4');
INSERT INTO `xpcms_area` VALUES ('445224', '惠来县', '445200', '5');
INSERT INTO `xpcms_area` VALUES ('445281', '普宁市', '445200', '6');
INSERT INTO `xpcms_area` VALUES ('445301', '市辖区', '445300', '1');
INSERT INTO `xpcms_area` VALUES ('445302', '云城区', '445300', '2');
INSERT INTO `xpcms_area` VALUES ('445321', '新兴县', '445300', '3');
INSERT INTO `xpcms_area` VALUES ('445322', '郁南县', '445300', '4');
INSERT INTO `xpcms_area` VALUES ('445323', '云安县', '445300', '5');
INSERT INTO `xpcms_area` VALUES ('445381', '罗定市', '445300', '6');
INSERT INTO `xpcms_area` VALUES ('450101', '市辖区', '450100', '1');
INSERT INTO `xpcms_area` VALUES ('450102', '兴宁区', '450100', '2');
INSERT INTO `xpcms_area` VALUES ('450103', '青秀区', '450100', '3');
INSERT INTO `xpcms_area` VALUES ('450105', '江南区', '450100', '4');
INSERT INTO `xpcms_area` VALUES ('450107', '西乡塘区', '450100', '5');
INSERT INTO `xpcms_area` VALUES ('450108', '良庆区', '450100', '6');
INSERT INTO `xpcms_area` VALUES ('450109', '邕宁区', '450100', '7');
INSERT INTO `xpcms_area` VALUES ('450122', '武鸣县', '450100', '8');
INSERT INTO `xpcms_area` VALUES ('450123', '隆安县', '450100', '9');
INSERT INTO `xpcms_area` VALUES ('450124', '马山县', '450100', '10');
INSERT INTO `xpcms_area` VALUES ('450125', '上林县', '450100', '11');
INSERT INTO `xpcms_area` VALUES ('450126', '宾阳县', '450100', '12');
INSERT INTO `xpcms_area` VALUES ('450127', '横　县', '450100', '13');
INSERT INTO `xpcms_area` VALUES ('450201', '市辖区', '450200', '1');
INSERT INTO `xpcms_area` VALUES ('450202', '城中区', '450200', '2');
INSERT INTO `xpcms_area` VALUES ('450203', '鱼峰区', '450200', '3');
INSERT INTO `xpcms_area` VALUES ('450204', '柳南区', '450200', '4');
INSERT INTO `xpcms_area` VALUES ('450205', '柳北区', '450200', '5');
INSERT INTO `xpcms_area` VALUES ('450221', '柳江县', '450200', '6');
INSERT INTO `xpcms_area` VALUES ('450222', '柳城县', '450200', '7');
INSERT INTO `xpcms_area` VALUES ('450223', '鹿寨县', '450200', '8');
INSERT INTO `xpcms_area` VALUES ('450224', '融安县', '450200', '9');
INSERT INTO `xpcms_area` VALUES ('450225', '融水苗族自治县', '450200', '10');
INSERT INTO `xpcms_area` VALUES ('450226', '三江侗族自治县', '450200', '11');
INSERT INTO `xpcms_area` VALUES ('450301', '市辖区', '450300', '1');
INSERT INTO `xpcms_area` VALUES ('450302', '秀峰区', '450300', '2');
INSERT INTO `xpcms_area` VALUES ('450303', '叠彩区', '450300', '3');
INSERT INTO `xpcms_area` VALUES ('450304', '象山区', '450300', '4');
INSERT INTO `xpcms_area` VALUES ('450305', '七星区', '450300', '5');
INSERT INTO `xpcms_area` VALUES ('450311', '雁山区', '450300', '6');
INSERT INTO `xpcms_area` VALUES ('450321', '阳朔县', '450300', '7');
INSERT INTO `xpcms_area` VALUES ('450322', '临桂县', '450300', '8');
INSERT INTO `xpcms_area` VALUES ('450323', '灵川县', '450300', '9');
INSERT INTO `xpcms_area` VALUES ('450324', '全州县', '450300', '10');
INSERT INTO `xpcms_area` VALUES ('450325', '兴安县', '450300', '11');
INSERT INTO `xpcms_area` VALUES ('450326', '永福县', '450300', '12');
INSERT INTO `xpcms_area` VALUES ('450327', '灌阳县', '450300', '13');
INSERT INTO `xpcms_area` VALUES ('450328', '龙胜各族自治县', '450300', '14');
INSERT INTO `xpcms_area` VALUES ('450329', '资源县', '450300', '15');
INSERT INTO `xpcms_area` VALUES ('450330', '平乐县', '450300', '16');
INSERT INTO `xpcms_area` VALUES ('450331', '荔蒲县', '450300', '17');
INSERT INTO `xpcms_area` VALUES ('450332', '恭城瑶族自治县', '450300', '18');
INSERT INTO `xpcms_area` VALUES ('450401', '市辖区', '450400', '1');
INSERT INTO `xpcms_area` VALUES ('450403', '万秀区', '450400', '2');
INSERT INTO `xpcms_area` VALUES ('450404', '蝶山区', '450400', '3');
INSERT INTO `xpcms_area` VALUES ('450405', '长洲区', '450400', '4');
INSERT INTO `xpcms_area` VALUES ('450421', '苍梧县', '450400', '5');
INSERT INTO `xpcms_area` VALUES ('450422', '藤　县', '450400', '6');
INSERT INTO `xpcms_area` VALUES ('450423', '蒙山县', '450400', '7');
INSERT INTO `xpcms_area` VALUES ('450481', '岑溪市', '450400', '8');
INSERT INTO `xpcms_area` VALUES ('450501', '市辖区', '450500', '1');
INSERT INTO `xpcms_area` VALUES ('450502', '海城区', '450500', '2');
INSERT INTO `xpcms_area` VALUES ('450503', '银海区', '450500', '3');
INSERT INTO `xpcms_area` VALUES ('450512', '铁山港区', '450500', '4');
INSERT INTO `xpcms_area` VALUES ('450521', '合浦县', '450500', '5');
INSERT INTO `xpcms_area` VALUES ('450601', '市辖区', '450600', '1');
INSERT INTO `xpcms_area` VALUES ('450602', '港口区', '450600', '2');
INSERT INTO `xpcms_area` VALUES ('450603', '防城区', '450600', '3');
INSERT INTO `xpcms_area` VALUES ('450621', '上思县', '450600', '4');
INSERT INTO `xpcms_area` VALUES ('450681', '东兴市', '450600', '5');
INSERT INTO `xpcms_area` VALUES ('450701', '市辖区', '450700', '1');
INSERT INTO `xpcms_area` VALUES ('450702', '钦南区', '450700', '2');
INSERT INTO `xpcms_area` VALUES ('450703', '钦北区', '450700', '3');
INSERT INTO `xpcms_area` VALUES ('450721', '灵山县', '450700', '4');
INSERT INTO `xpcms_area` VALUES ('450722', '浦北县', '450700', '5');
INSERT INTO `xpcms_area` VALUES ('450801', '市辖区', '450800', '1');
INSERT INTO `xpcms_area` VALUES ('450802', '港北区', '450800', '2');
INSERT INTO `xpcms_area` VALUES ('450803', '港南区', '450800', '3');
INSERT INTO `xpcms_area` VALUES ('450804', '覃塘区', '450800', '4');
INSERT INTO `xpcms_area` VALUES ('450821', '平南县', '450800', '5');
INSERT INTO `xpcms_area` VALUES ('450881', '桂平市', '450800', '6');
INSERT INTO `xpcms_area` VALUES ('450901', '市辖区', '450900', '1');
INSERT INTO `xpcms_area` VALUES ('450902', '玉州区', '450900', '2');
INSERT INTO `xpcms_area` VALUES ('450921', '容　县', '450900', '3');
INSERT INTO `xpcms_area` VALUES ('450922', '陆川县', '450900', '4');
INSERT INTO `xpcms_area` VALUES ('450923', '博白县', '450900', '5');
INSERT INTO `xpcms_area` VALUES ('450924', '兴业县', '450900', '6');
INSERT INTO `xpcms_area` VALUES ('450981', '北流市', '450900', '7');
INSERT INTO `xpcms_area` VALUES ('451001', '市辖区', '451000', '1');
INSERT INTO `xpcms_area` VALUES ('451002', '右江区', '451000', '2');
INSERT INTO `xpcms_area` VALUES ('451021', '田阳县', '451000', '3');
INSERT INTO `xpcms_area` VALUES ('451022', '田东县', '451000', '4');
INSERT INTO `xpcms_area` VALUES ('451023', '平果县', '451000', '5');
INSERT INTO `xpcms_area` VALUES ('451024', '德保县', '451000', '6');
INSERT INTO `xpcms_area` VALUES ('451025', '靖西县', '451000', '7');
INSERT INTO `xpcms_area` VALUES ('451026', '那坡县', '451000', '8');
INSERT INTO `xpcms_area` VALUES ('451027', '凌云县', '451000', '9');
INSERT INTO `xpcms_area` VALUES ('451028', '乐业县', '451000', '10');
INSERT INTO `xpcms_area` VALUES ('451029', '田林县', '451000', '11');
INSERT INTO `xpcms_area` VALUES ('451030', '西林县', '451000', '12');
INSERT INTO `xpcms_area` VALUES ('451031', '隆林各族自治县', '451000', '13');
INSERT INTO `xpcms_area` VALUES ('451101', '市辖区', '451100', '1');
INSERT INTO `xpcms_area` VALUES ('451102', '八步区', '451100', '2');
INSERT INTO `xpcms_area` VALUES ('451121', '昭平县', '451100', '3');
INSERT INTO `xpcms_area` VALUES ('451122', '钟山县', '451100', '4');
INSERT INTO `xpcms_area` VALUES ('451123', '富川瑶族自治县', '451100', '5');
INSERT INTO `xpcms_area` VALUES ('451201', '市辖区', '451200', '1');
INSERT INTO `xpcms_area` VALUES ('451202', '金城江区', '451200', '2');
INSERT INTO `xpcms_area` VALUES ('451221', '南丹县', '451200', '3');
INSERT INTO `xpcms_area` VALUES ('451222', '天峨县', '451200', '4');
INSERT INTO `xpcms_area` VALUES ('451223', '凤山县', '451200', '5');
INSERT INTO `xpcms_area` VALUES ('451224', '东兰县', '451200', '6');
INSERT INTO `xpcms_area` VALUES ('451225', '罗城仫佬族自治县', '451200', '7');
INSERT INTO `xpcms_area` VALUES ('451226', '环江毛南族自治县', '451200', '8');
INSERT INTO `xpcms_area` VALUES ('451227', '巴马瑶族自治县', '451200', '9');
INSERT INTO `xpcms_area` VALUES ('451228', '都安瑶族自治县', '451200', '10');
INSERT INTO `xpcms_area` VALUES ('451229', '大化瑶族自治县', '451200', '11');
INSERT INTO `xpcms_area` VALUES ('451281', '宜州市', '451200', '12');
INSERT INTO `xpcms_area` VALUES ('451301', '市辖区', '451300', '1');
INSERT INTO `xpcms_area` VALUES ('451302', '兴宾区', '451300', '2');
INSERT INTO `xpcms_area` VALUES ('451321', '忻城县', '451300', '3');
INSERT INTO `xpcms_area` VALUES ('451322', '象州县', '451300', '4');
INSERT INTO `xpcms_area` VALUES ('451323', '武宣县', '451300', '5');
INSERT INTO `xpcms_area` VALUES ('451324', '金秀瑶族自治县', '451300', '6');
INSERT INTO `xpcms_area` VALUES ('451381', '合山市', '451300', '7');
INSERT INTO `xpcms_area` VALUES ('451401', '市辖区', '451400', '1');
INSERT INTO `xpcms_area` VALUES ('451402', '江洲区', '451400', '2');
INSERT INTO `xpcms_area` VALUES ('451421', '扶绥县', '451400', '3');
INSERT INTO `xpcms_area` VALUES ('451422', '宁明县', '451400', '4');
INSERT INTO `xpcms_area` VALUES ('451423', '龙州县', '451400', '5');
INSERT INTO `xpcms_area` VALUES ('451424', '大新县', '451400', '6');
INSERT INTO `xpcms_area` VALUES ('451425', '天等县', '451400', '7');
INSERT INTO `xpcms_area` VALUES ('451481', '凭祥市', '451400', '8');
INSERT INTO `xpcms_area` VALUES ('460101', '市辖区', '460100', '1');
INSERT INTO `xpcms_area` VALUES ('460105', '秀英区', '460100', '2');
INSERT INTO `xpcms_area` VALUES ('460106', '龙华区', '460100', '3');
INSERT INTO `xpcms_area` VALUES ('460107', '琼山区', '460100', '4');
INSERT INTO `xpcms_area` VALUES ('460108', '美兰区', '460100', '5');
INSERT INTO `xpcms_area` VALUES ('460201', '市辖区', '460200', '1');
INSERT INTO `xpcms_area` VALUES ('469001', '五指山市', '469000', '1');
INSERT INTO `xpcms_area` VALUES ('469002', '琼海市', '469000', '2');
INSERT INTO `xpcms_area` VALUES ('469003', '儋州市', '469000', '3');
INSERT INTO `xpcms_area` VALUES ('469005', '文昌市', '469000', '4');
INSERT INTO `xpcms_area` VALUES ('469006', '万宁市', '469000', '5');
INSERT INTO `xpcms_area` VALUES ('469007', '东方市', '469000', '6');
INSERT INTO `xpcms_area` VALUES ('469025', '定安县', '469000', '7');
INSERT INTO `xpcms_area` VALUES ('469026', '屯昌县', '469000', '8');
INSERT INTO `xpcms_area` VALUES ('469027', '澄迈县', '469000', '9');
INSERT INTO `xpcms_area` VALUES ('469028', '临高县', '469000', '10');
INSERT INTO `xpcms_area` VALUES ('469030', '白沙黎族自治县', '469000', '11');
INSERT INTO `xpcms_area` VALUES ('469031', '昌江黎族自治县', '469000', '12');
INSERT INTO `xpcms_area` VALUES ('469033', '乐东黎族自治县', '469000', '13');
INSERT INTO `xpcms_area` VALUES ('469034', '陵水黎族自治县', '469000', '14');
INSERT INTO `xpcms_area` VALUES ('469035', '保亭黎族苗族自治县', '469000', '15');
INSERT INTO `xpcms_area` VALUES ('469036', '琼中黎族苗族自治县', '469000', '16');
INSERT INTO `xpcms_area` VALUES ('469037', '西沙群岛', '469000', '17');
INSERT INTO `xpcms_area` VALUES ('469038', '南沙群岛', '469000', '18');
INSERT INTO `xpcms_area` VALUES ('469039', '中沙群岛的岛礁及其海域', '469000', '19');
INSERT INTO `xpcms_area` VALUES ('500101', '万州区', '500100', '1');
INSERT INTO `xpcms_area` VALUES ('500102', '涪陵区', '500100', '2');
INSERT INTO `xpcms_area` VALUES ('500103', '渝中区', '500100', '3');
INSERT INTO `xpcms_area` VALUES ('500104', '大渡口区', '500100', '4');
INSERT INTO `xpcms_area` VALUES ('500105', '江北区', '500100', '5');
INSERT INTO `xpcms_area` VALUES ('500106', '沙坪坝区', '500100', '6');
INSERT INTO `xpcms_area` VALUES ('500107', '九龙坡区', '500100', '7');
INSERT INTO `xpcms_area` VALUES ('500108', '南岸区', '500100', '8');
INSERT INTO `xpcms_area` VALUES ('500109', '北碚区', '500100', '9');
INSERT INTO `xpcms_area` VALUES ('500110', '万盛区', '500100', '10');
INSERT INTO `xpcms_area` VALUES ('500111', '双桥区', '500100', '11');
INSERT INTO `xpcms_area` VALUES ('500112', '渝北区', '500100', '12');
INSERT INTO `xpcms_area` VALUES ('500113', '巴南区', '500100', '13');
INSERT INTO `xpcms_area` VALUES ('500114', '黔江区', '500100', '14');
INSERT INTO `xpcms_area` VALUES ('500115', '长寿区', '500100', '15');
INSERT INTO `xpcms_area` VALUES ('500222', '綦江县', '500200', '1');
INSERT INTO `xpcms_area` VALUES ('500223', '潼南县', '500200', '2');
INSERT INTO `xpcms_area` VALUES ('500224', '铜梁县', '500200', '3');
INSERT INTO `xpcms_area` VALUES ('500225', '大足县', '500200', '4');
INSERT INTO `xpcms_area` VALUES ('500226', '荣昌县', '500200', '5');
INSERT INTO `xpcms_area` VALUES ('500227', '璧山县', '500200', '6');
INSERT INTO `xpcms_area` VALUES ('500228', '梁平县', '500200', '7');
INSERT INTO `xpcms_area` VALUES ('500229', '城口县', '500200', '8');
INSERT INTO `xpcms_area` VALUES ('500230', '丰都县', '500200', '9');
INSERT INTO `xpcms_area` VALUES ('500231', '垫江县', '500200', '10');
INSERT INTO `xpcms_area` VALUES ('500232', '武隆县', '500200', '11');
INSERT INTO `xpcms_area` VALUES ('500233', '忠　县', '500200', '12');
INSERT INTO `xpcms_area` VALUES ('500234', '开　县', '500200', '13');
INSERT INTO `xpcms_area` VALUES ('500235', '云阳县', '500200', '14');
INSERT INTO `xpcms_area` VALUES ('500236', '奉节县', '500200', '15');
INSERT INTO `xpcms_area` VALUES ('500237', '巫山县', '500200', '16');
INSERT INTO `xpcms_area` VALUES ('500238', '巫溪县', '500200', '17');
INSERT INTO `xpcms_area` VALUES ('500240', '石柱土家族自治县', '500200', '18');
INSERT INTO `xpcms_area` VALUES ('500241', '秀山土家族苗族自治县', '500200', '19');
INSERT INTO `xpcms_area` VALUES ('500242', '酉阳土家族苗族自治县', '500200', '20');
INSERT INTO `xpcms_area` VALUES ('500243', '彭水苗族土家族自治县', '500200', '21');
INSERT INTO `xpcms_area` VALUES ('500381', '江津市', '500300', '1');
INSERT INTO `xpcms_area` VALUES ('500382', '合川市', '500300', '2');
INSERT INTO `xpcms_area` VALUES ('500383', '永川市', '500300', '3');
INSERT INTO `xpcms_area` VALUES ('500384', '南川市', '500300', '4');
INSERT INTO `xpcms_area` VALUES ('510101', '市辖区', '510100', '1');
INSERT INTO `xpcms_area` VALUES ('510104', '锦江区', '510100', '2');
INSERT INTO `xpcms_area` VALUES ('510105', '青羊区', '510100', '3');
INSERT INTO `xpcms_area` VALUES ('510106', '金牛区', '510100', '4');
INSERT INTO `xpcms_area` VALUES ('510107', '武侯区', '510100', '5');
INSERT INTO `xpcms_area` VALUES ('510108', '成华区', '510100', '6');
INSERT INTO `xpcms_area` VALUES ('510112', '龙泉驿区', '510100', '7');
INSERT INTO `xpcms_area` VALUES ('510113', '青白江区', '510100', '8');
INSERT INTO `xpcms_area` VALUES ('510114', '新都区', '510100', '9');
INSERT INTO `xpcms_area` VALUES ('510115', '温江区', '510100', '10');
INSERT INTO `xpcms_area` VALUES ('510121', '金堂县', '510100', '11');
INSERT INTO `xpcms_area` VALUES ('510122', '双流县', '510100', '12');
INSERT INTO `xpcms_area` VALUES ('510124', '郫　县', '510100', '13');
INSERT INTO `xpcms_area` VALUES ('510129', '大邑县', '510100', '14');
INSERT INTO `xpcms_area` VALUES ('510131', '蒲江县', '510100', '15');
INSERT INTO `xpcms_area` VALUES ('510132', '新津县', '510100', '16');
INSERT INTO `xpcms_area` VALUES ('510181', '都江堰市', '510100', '17');
INSERT INTO `xpcms_area` VALUES ('510182', '彭州市', '510100', '18');
INSERT INTO `xpcms_area` VALUES ('510183', '邛崃市', '510100', '19');
INSERT INTO `xpcms_area` VALUES ('510184', '崇州市', '510100', '20');
INSERT INTO `xpcms_area` VALUES ('510301', '市辖区', '510300', '1');
INSERT INTO `xpcms_area` VALUES ('510302', '自流井区', '510300', '2');
INSERT INTO `xpcms_area` VALUES ('510303', '贡井区', '510300', '3');
INSERT INTO `xpcms_area` VALUES ('510304', '大安区', '510300', '4');
INSERT INTO `xpcms_area` VALUES ('510311', '沿滩区', '510300', '5');
INSERT INTO `xpcms_area` VALUES ('510321', '荣　县', '510300', '6');
INSERT INTO `xpcms_area` VALUES ('510322', '富顺县', '510300', '7');
INSERT INTO `xpcms_area` VALUES ('510401', '市辖区', '510400', '1');
INSERT INTO `xpcms_area` VALUES ('510402', '东　区', '510400', '2');
INSERT INTO `xpcms_area` VALUES ('510403', '西　区', '510400', '3');
INSERT INTO `xpcms_area` VALUES ('510411', '仁和区', '510400', '4');
INSERT INTO `xpcms_area` VALUES ('510421', '米易县', '510400', '5');
INSERT INTO `xpcms_area` VALUES ('510422', '盐边县', '510400', '6');
INSERT INTO `xpcms_area` VALUES ('510501', '市辖区', '510500', '1');
INSERT INTO `xpcms_area` VALUES ('510502', '江阳区', '510500', '2');
INSERT INTO `xpcms_area` VALUES ('510503', '纳溪区', '510500', '3');
INSERT INTO `xpcms_area` VALUES ('510504', '龙马潭区', '510500', '4');
INSERT INTO `xpcms_area` VALUES ('510521', '泸　县', '510500', '5');
INSERT INTO `xpcms_area` VALUES ('510522', '合江县', '510500', '6');
INSERT INTO `xpcms_area` VALUES ('510524', '叙永县', '510500', '7');
INSERT INTO `xpcms_area` VALUES ('510525', '古蔺县', '510500', '8');
INSERT INTO `xpcms_area` VALUES ('510601', '市辖区', '510600', '1');
INSERT INTO `xpcms_area` VALUES ('510603', '旌阳区', '510600', '2');
INSERT INTO `xpcms_area` VALUES ('510623', '中江县', '510600', '3');
INSERT INTO `xpcms_area` VALUES ('510626', '罗江县', '510600', '4');
INSERT INTO `xpcms_area` VALUES ('510681', '广汉市', '510600', '5');
INSERT INTO `xpcms_area` VALUES ('510682', '什邡市', '510600', '6');
INSERT INTO `xpcms_area` VALUES ('510683', '绵竹市', '510600', '7');
INSERT INTO `xpcms_area` VALUES ('510701', '市辖区', '510700', '1');
INSERT INTO `xpcms_area` VALUES ('510703', '涪城区', '510700', '2');
INSERT INTO `xpcms_area` VALUES ('510704', '游仙区', '510700', '3');
INSERT INTO `xpcms_area` VALUES ('510722', '三台县', '510700', '4');
INSERT INTO `xpcms_area` VALUES ('510723', '盐亭县', '510700', '5');
INSERT INTO `xpcms_area` VALUES ('510724', '安　县', '510700', '6');
INSERT INTO `xpcms_area` VALUES ('510725', '梓潼县', '510700', '7');
INSERT INTO `xpcms_area` VALUES ('510726', '北川羌族自治县', '510700', '8');
INSERT INTO `xpcms_area` VALUES ('510727', '平武县', '510700', '9');
INSERT INTO `xpcms_area` VALUES ('510781', '江油市', '510700', '10');
INSERT INTO `xpcms_area` VALUES ('510801', '市辖区', '510800', '1');
INSERT INTO `xpcms_area` VALUES ('510802', '市中区', '510800', '2');
INSERT INTO `xpcms_area` VALUES ('510811', '元坝区', '510800', '3');
INSERT INTO `xpcms_area` VALUES ('510812', '朝天区', '510800', '4');
INSERT INTO `xpcms_area` VALUES ('510821', '旺苍县', '510800', '5');
INSERT INTO `xpcms_area` VALUES ('510822', '青川县', '510800', '6');
INSERT INTO `xpcms_area` VALUES ('510823', '剑阁县', '510800', '7');
INSERT INTO `xpcms_area` VALUES ('510824', '苍溪县', '510800', '8');
INSERT INTO `xpcms_area` VALUES ('510901', '市辖区', '510900', '1');
INSERT INTO `xpcms_area` VALUES ('510903', '船山区', '510900', '2');
INSERT INTO `xpcms_area` VALUES ('510904', '安居区', '510900', '3');
INSERT INTO `xpcms_area` VALUES ('510921', '蓬溪县', '510900', '4');
INSERT INTO `xpcms_area` VALUES ('510922', '射洪县', '510900', '5');
INSERT INTO `xpcms_area` VALUES ('510923', '大英县', '510900', '6');
INSERT INTO `xpcms_area` VALUES ('511001', '市辖区', '511000', '1');
INSERT INTO `xpcms_area` VALUES ('511002', '市中区', '511000', '2');
INSERT INTO `xpcms_area` VALUES ('511011', '东兴区', '511000', '3');
INSERT INTO `xpcms_area` VALUES ('511024', '威远县', '511000', '4');
INSERT INTO `xpcms_area` VALUES ('511025', '资中县', '511000', '5');
INSERT INTO `xpcms_area` VALUES ('511028', '隆昌县', '511000', '6');
INSERT INTO `xpcms_area` VALUES ('511101', '市辖区', '511100', '1');
INSERT INTO `xpcms_area` VALUES ('511102', '市中区', '511100', '2');
INSERT INTO `xpcms_area` VALUES ('511111', '沙湾区', '511100', '3');
INSERT INTO `xpcms_area` VALUES ('511112', '五通桥区', '511100', '4');
INSERT INTO `xpcms_area` VALUES ('511113', '金口河区', '511100', '5');
INSERT INTO `xpcms_area` VALUES ('511123', '犍为县', '511100', '6');
INSERT INTO `xpcms_area` VALUES ('511124', '井研县', '511100', '7');
INSERT INTO `xpcms_area` VALUES ('511126', '夹江县', '511100', '8');
INSERT INTO `xpcms_area` VALUES ('511129', '沐川县', '511100', '9');
INSERT INTO `xpcms_area` VALUES ('511132', '峨边彝族自治县', '511100', '10');
INSERT INTO `xpcms_area` VALUES ('511133', '马边彝族自治县', '511100', '11');
INSERT INTO `xpcms_area` VALUES ('511181', '峨眉山市', '511100', '12');
INSERT INTO `xpcms_area` VALUES ('511301', '市辖区', '511300', '1');
INSERT INTO `xpcms_area` VALUES ('511302', '顺庆区', '511300', '2');
INSERT INTO `xpcms_area` VALUES ('511303', '高坪区', '511300', '3');
INSERT INTO `xpcms_area` VALUES ('511304', '嘉陵区', '511300', '4');
INSERT INTO `xpcms_area` VALUES ('511321', '南部县', '511300', '5');
INSERT INTO `xpcms_area` VALUES ('511322', '营山县', '511300', '6');
INSERT INTO `xpcms_area` VALUES ('511323', '蓬安县', '511300', '7');
INSERT INTO `xpcms_area` VALUES ('511324', '仪陇县', '511300', '8');
INSERT INTO `xpcms_area` VALUES ('511325', '西充县', '511300', '9');
INSERT INTO `xpcms_area` VALUES ('511381', '阆中市', '511300', '10');
INSERT INTO `xpcms_area` VALUES ('511401', '市辖区', '511400', '1');
INSERT INTO `xpcms_area` VALUES ('511402', '东坡区', '511400', '2');
INSERT INTO `xpcms_area` VALUES ('511421', '仁寿县', '511400', '3');
INSERT INTO `xpcms_area` VALUES ('511422', '彭山县', '511400', '4');
INSERT INTO `xpcms_area` VALUES ('511423', '洪雅县', '511400', '5');
INSERT INTO `xpcms_area` VALUES ('511424', '丹棱县', '511400', '6');
INSERT INTO `xpcms_area` VALUES ('511425', '青神县', '511400', '7');
INSERT INTO `xpcms_area` VALUES ('511501', '市辖区', '511500', '1');
INSERT INTO `xpcms_area` VALUES ('511502', '翠屏区', '511500', '2');
INSERT INTO `xpcms_area` VALUES ('511521', '宜宾县', '511500', '3');
INSERT INTO `xpcms_area` VALUES ('511522', '南溪县', '511500', '4');
INSERT INTO `xpcms_area` VALUES ('511523', '江安县', '511500', '5');
INSERT INTO `xpcms_area` VALUES ('511524', '长宁县', '511500', '6');
INSERT INTO `xpcms_area` VALUES ('511525', '高　县', '511500', '7');
INSERT INTO `xpcms_area` VALUES ('511526', '珙　县', '511500', '8');
INSERT INTO `xpcms_area` VALUES ('511527', '筠连县', '511500', '9');
INSERT INTO `xpcms_area` VALUES ('511528', '兴文县', '511500', '10');
INSERT INTO `xpcms_area` VALUES ('511529', '屏山县', '511500', '11');
INSERT INTO `xpcms_area` VALUES ('511601', '市辖区', '511600', '1');
INSERT INTO `xpcms_area` VALUES ('511602', '广安区', '511600', '2');
INSERT INTO `xpcms_area` VALUES ('511621', '岳池县', '511600', '3');
INSERT INTO `xpcms_area` VALUES ('511622', '武胜县', '511600', '4');
INSERT INTO `xpcms_area` VALUES ('511623', '邻水县', '511600', '5');
INSERT INTO `xpcms_area` VALUES ('511681', '华莹市', '511600', '6');
INSERT INTO `xpcms_area` VALUES ('511701', '市辖区', '511700', '1');
INSERT INTO `xpcms_area` VALUES ('511702', '通川区', '511700', '2');
INSERT INTO `xpcms_area` VALUES ('511721', '达　县', '511700', '3');
INSERT INTO `xpcms_area` VALUES ('511722', '宣汉县', '511700', '4');
INSERT INTO `xpcms_area` VALUES ('511723', '开江县', '511700', '5');
INSERT INTO `xpcms_area` VALUES ('511724', '大竹县', '511700', '6');
INSERT INTO `xpcms_area` VALUES ('511725', '渠　县', '511700', '7');
INSERT INTO `xpcms_area` VALUES ('511781', '万源市', '511700', '8');
INSERT INTO `xpcms_area` VALUES ('511801', '市辖区', '511800', '1');
INSERT INTO `xpcms_area` VALUES ('511802', '雨城区', '511800', '2');
INSERT INTO `xpcms_area` VALUES ('511821', '名山县', '511800', '3');
INSERT INTO `xpcms_area` VALUES ('511822', '荥经县', '511800', '4');
INSERT INTO `xpcms_area` VALUES ('511823', '汉源县', '511800', '5');
INSERT INTO `xpcms_area` VALUES ('511824', '石棉县', '511800', '6');
INSERT INTO `xpcms_area` VALUES ('511825', '天全县', '511800', '7');
INSERT INTO `xpcms_area` VALUES ('511826', '芦山县', '511800', '8');
INSERT INTO `xpcms_area` VALUES ('511827', '宝兴县', '511800', '9');
INSERT INTO `xpcms_area` VALUES ('511901', '市辖区', '511900', '1');
INSERT INTO `xpcms_area` VALUES ('511902', '巴州区', '511900', '2');
INSERT INTO `xpcms_area` VALUES ('511921', '通江县', '511900', '3');
INSERT INTO `xpcms_area` VALUES ('511922', '南江县', '511900', '4');
INSERT INTO `xpcms_area` VALUES ('511923', '平昌县', '511900', '5');
INSERT INTO `xpcms_area` VALUES ('512001', '市辖区', '512000', '1');
INSERT INTO `xpcms_area` VALUES ('512002', '雁江区', '512000', '2');
INSERT INTO `xpcms_area` VALUES ('512021', '安岳县', '512000', '3');
INSERT INTO `xpcms_area` VALUES ('512022', '乐至县', '512000', '4');
INSERT INTO `xpcms_area` VALUES ('512081', '简阳市', '512000', '5');
INSERT INTO `xpcms_area` VALUES ('513221', '汶川县', '513200', '1');
INSERT INTO `xpcms_area` VALUES ('513222', '理　县', '513200', '2');
INSERT INTO `xpcms_area` VALUES ('513223', '茂　县', '513200', '3');
INSERT INTO `xpcms_area` VALUES ('513224', '松潘县', '513200', '4');
INSERT INTO `xpcms_area` VALUES ('513225', '九寨沟县', '513200', '5');
INSERT INTO `xpcms_area` VALUES ('513226', '金川县', '513200', '6');
INSERT INTO `xpcms_area` VALUES ('513227', '小金县', '513200', '7');
INSERT INTO `xpcms_area` VALUES ('513228', '黑水县', '513200', '8');
INSERT INTO `xpcms_area` VALUES ('513229', '马尔康县', '513200', '9');
INSERT INTO `xpcms_area` VALUES ('513230', '壤塘县', '513200', '10');
INSERT INTO `xpcms_area` VALUES ('513231', '阿坝县', '513200', '11');
INSERT INTO `xpcms_area` VALUES ('513232', '若尔盖县', '513200', '12');
INSERT INTO `xpcms_area` VALUES ('513233', '红原县', '513200', '13');
INSERT INTO `xpcms_area` VALUES ('513321', '康定县', '513300', '1');
INSERT INTO `xpcms_area` VALUES ('513322', '泸定县', '513300', '2');
INSERT INTO `xpcms_area` VALUES ('513323', '丹巴县', '513300', '3');
INSERT INTO `xpcms_area` VALUES ('513324', '九龙县', '513300', '4');
INSERT INTO `xpcms_area` VALUES ('513325', '雅江县', '513300', '5');
INSERT INTO `xpcms_area` VALUES ('513326', '道孚县', '513300', '6');
INSERT INTO `xpcms_area` VALUES ('513327', '炉霍县', '513300', '7');
INSERT INTO `xpcms_area` VALUES ('513328', '甘孜县', '513300', '8');
INSERT INTO `xpcms_area` VALUES ('513329', '新龙县', '513300', '9');
INSERT INTO `xpcms_area` VALUES ('513330', '德格县', '513300', '10');
INSERT INTO `xpcms_area` VALUES ('513331', '白玉县', '513300', '11');
INSERT INTO `xpcms_area` VALUES ('513332', '石渠县', '513300', '12');
INSERT INTO `xpcms_area` VALUES ('513333', '色达县', '513300', '13');
INSERT INTO `xpcms_area` VALUES ('513334', '理塘县', '513300', '14');
INSERT INTO `xpcms_area` VALUES ('513335', '巴塘县', '513300', '15');
INSERT INTO `xpcms_area` VALUES ('513336', '乡城县', '513300', '16');
INSERT INTO `xpcms_area` VALUES ('513337', '稻城县', '513300', '17');
INSERT INTO `xpcms_area` VALUES ('513338', '得荣县', '513300', '18');
INSERT INTO `xpcms_area` VALUES ('513401', '西昌市', '513400', '1');
INSERT INTO `xpcms_area` VALUES ('513422', '木里藏族自治县', '513400', '2');
INSERT INTO `xpcms_area` VALUES ('513423', '盐源县', '513400', '3');
INSERT INTO `xpcms_area` VALUES ('513424', '德昌县', '513400', '4');
INSERT INTO `xpcms_area` VALUES ('513425', '会理县', '513400', '5');
INSERT INTO `xpcms_area` VALUES ('513426', '会东县', '513400', '6');
INSERT INTO `xpcms_area` VALUES ('513427', '宁南县', '513400', '7');
INSERT INTO `xpcms_area` VALUES ('513428', '普格县', '513400', '8');
INSERT INTO `xpcms_area` VALUES ('513429', '布拖县', '513400', '9');
INSERT INTO `xpcms_area` VALUES ('513430', '金阳县', '513400', '10');
INSERT INTO `xpcms_area` VALUES ('513431', '昭觉县', '513400', '11');
INSERT INTO `xpcms_area` VALUES ('513432', '喜德县', '513400', '12');
INSERT INTO `xpcms_area` VALUES ('513433', '冕宁县', '513400', '13');
INSERT INTO `xpcms_area` VALUES ('513434', '越西县', '513400', '14');
INSERT INTO `xpcms_area` VALUES ('513435', '甘洛县', '513400', '15');
INSERT INTO `xpcms_area` VALUES ('513436', '美姑县', '513400', '16');
INSERT INTO `xpcms_area` VALUES ('513437', '雷波县', '513400', '17');
INSERT INTO `xpcms_area` VALUES ('520101', '市辖区', '520100', '1');
INSERT INTO `xpcms_area` VALUES ('520102', '南明区', '520100', '2');
INSERT INTO `xpcms_area` VALUES ('520103', '云岩区', '520100', '3');
INSERT INTO `xpcms_area` VALUES ('520111', '花溪区', '520100', '4');
INSERT INTO `xpcms_area` VALUES ('520112', '乌当区', '520100', '5');
INSERT INTO `xpcms_area` VALUES ('520113', '白云区', '520100', '6');
INSERT INTO `xpcms_area` VALUES ('520114', '小河区', '520100', '7');
INSERT INTO `xpcms_area` VALUES ('520121', '开阳县', '520100', '8');
INSERT INTO `xpcms_area` VALUES ('520122', '息烽县', '520100', '9');
INSERT INTO `xpcms_area` VALUES ('520123', '修文县', '520100', '10');
INSERT INTO `xpcms_area` VALUES ('520181', '清镇市', '520100', '11');
INSERT INTO `xpcms_area` VALUES ('520201', '钟山区', '520200', '1');
INSERT INTO `xpcms_area` VALUES ('520203', '六枝特区', '520200', '2');
INSERT INTO `xpcms_area` VALUES ('520221', '水城县', '520200', '3');
INSERT INTO `xpcms_area` VALUES ('520222', '盘　县', '520200', '4');
INSERT INTO `xpcms_area` VALUES ('520301', '市辖区', '520300', '1');
INSERT INTO `xpcms_area` VALUES ('520302', '红花岗区', '520300', '2');
INSERT INTO `xpcms_area` VALUES ('520303', '汇川区', '520300', '3');
INSERT INTO `xpcms_area` VALUES ('520321', '遵义县', '520300', '4');
INSERT INTO `xpcms_area` VALUES ('520322', '桐梓县', '520300', '5');
INSERT INTO `xpcms_area` VALUES ('520323', '绥阳县', '520300', '6');
INSERT INTO `xpcms_area` VALUES ('520324', '正安县', '520300', '7');
INSERT INTO `xpcms_area` VALUES ('520325', '道真仡佬族苗族自治县', '520300', '8');
INSERT INTO `xpcms_area` VALUES ('520326', '务川仡佬族苗族自治县', '520300', '9');
INSERT INTO `xpcms_area` VALUES ('520327', '凤冈县', '520300', '10');
INSERT INTO `xpcms_area` VALUES ('520328', '湄潭县', '520300', '11');
INSERT INTO `xpcms_area` VALUES ('520329', '余庆县', '520300', '12');
INSERT INTO `xpcms_area` VALUES ('520330', '习水县', '520300', '13');
INSERT INTO `xpcms_area` VALUES ('520381', '赤水市', '520300', '14');
INSERT INTO `xpcms_area` VALUES ('520382', '仁怀市', '520300', '15');
INSERT INTO `xpcms_area` VALUES ('520401', '市辖区', '520400', '1');
INSERT INTO `xpcms_area` VALUES ('520402', '西秀区', '520400', '2');
INSERT INTO `xpcms_area` VALUES ('520421', '平坝县', '520400', '3');
INSERT INTO `xpcms_area` VALUES ('520422', '普定县', '520400', '4');
INSERT INTO `xpcms_area` VALUES ('520423', '镇宁布依族苗族自治县', '520400', '5');
INSERT INTO `xpcms_area` VALUES ('520424', '关岭布依族苗族自治县', '520400', '6');
INSERT INTO `xpcms_area` VALUES ('520425', '紫云苗族布依族自治县', '520400', '7');
INSERT INTO `xpcms_area` VALUES ('522201', '铜仁市', '522200', '1');
INSERT INTO `xpcms_area` VALUES ('522222', '江口县', '522200', '2');
INSERT INTO `xpcms_area` VALUES ('522223', '玉屏侗族自治县', '522200', '3');
INSERT INTO `xpcms_area` VALUES ('522224', '石阡县', '522200', '4');
INSERT INTO `xpcms_area` VALUES ('522225', '思南县', '522200', '5');
INSERT INTO `xpcms_area` VALUES ('522226', '印江土家族苗族自治县', '522200', '6');
INSERT INTO `xpcms_area` VALUES ('522227', '德江县', '522200', '7');
INSERT INTO `xpcms_area` VALUES ('522228', '沿河土家族自治县', '522200', '8');
INSERT INTO `xpcms_area` VALUES ('522229', '松桃苗族自治县', '522200', '9');
INSERT INTO `xpcms_area` VALUES ('522230', '万山特区', '522200', '10');
INSERT INTO `xpcms_area` VALUES ('522301', '兴义市', '522300', '1');
INSERT INTO `xpcms_area` VALUES ('522322', '兴仁县', '522300', '2');
INSERT INTO `xpcms_area` VALUES ('522323', '普安县', '522300', '3');
INSERT INTO `xpcms_area` VALUES ('522324', '晴隆县', '522300', '4');
INSERT INTO `xpcms_area` VALUES ('522325', '贞丰县', '522300', '5');
INSERT INTO `xpcms_area` VALUES ('522326', '望谟县', '522300', '6');
INSERT INTO `xpcms_area` VALUES ('522327', '册亨县', '522300', '7');
INSERT INTO `xpcms_area` VALUES ('522328', '安龙县', '522300', '8');
INSERT INTO `xpcms_area` VALUES ('522401', '毕节市', '522400', '1');
INSERT INTO `xpcms_area` VALUES ('522422', '大方县', '522400', '2');
INSERT INTO `xpcms_area` VALUES ('522423', '黔西县', '522400', '3');
INSERT INTO `xpcms_area` VALUES ('522424', '金沙县', '522400', '4');
INSERT INTO `xpcms_area` VALUES ('522425', '织金县', '522400', '5');
INSERT INTO `xpcms_area` VALUES ('522426', '纳雍县', '522400', '6');
INSERT INTO `xpcms_area` VALUES ('522427', '威宁彝族回族苗族自治县', '522400', '7');
INSERT INTO `xpcms_area` VALUES ('522428', '赫章县', '522400', '8');
INSERT INTO `xpcms_area` VALUES ('522601', '凯里市', '522600', '1');
INSERT INTO `xpcms_area` VALUES ('522622', '黄平县', '522600', '2');
INSERT INTO `xpcms_area` VALUES ('522623', '施秉县', '522600', '3');
INSERT INTO `xpcms_area` VALUES ('522624', '三穗县', '522600', '4');
INSERT INTO `xpcms_area` VALUES ('522625', '镇远县', '522600', '5');
INSERT INTO `xpcms_area` VALUES ('522626', '岑巩县', '522600', '6');
INSERT INTO `xpcms_area` VALUES ('522627', '天柱县', '522600', '7');
INSERT INTO `xpcms_area` VALUES ('522628', '锦屏县', '522600', '8');
INSERT INTO `xpcms_area` VALUES ('522629', '剑河县', '522600', '9');
INSERT INTO `xpcms_area` VALUES ('522630', '台江县', '522600', '10');
INSERT INTO `xpcms_area` VALUES ('522631', '黎平县', '522600', '11');
INSERT INTO `xpcms_area` VALUES ('522632', '榕江县', '522600', '12');
INSERT INTO `xpcms_area` VALUES ('522633', '从江县', '522600', '13');
INSERT INTO `xpcms_area` VALUES ('522634', '雷山县', '522600', '14');
INSERT INTO `xpcms_area` VALUES ('522635', '麻江县', '522600', '15');
INSERT INTO `xpcms_area` VALUES ('522636', '丹寨县', '522600', '16');
INSERT INTO `xpcms_area` VALUES ('522701', '都匀市', '522700', '1');
INSERT INTO `xpcms_area` VALUES ('522702', '福泉市', '522700', '2');
INSERT INTO `xpcms_area` VALUES ('522722', '荔波县', '522700', '3');
INSERT INTO `xpcms_area` VALUES ('522723', '贵定县', '522700', '4');
INSERT INTO `xpcms_area` VALUES ('522725', '瓮安县', '522700', '5');
INSERT INTO `xpcms_area` VALUES ('522726', '独山县', '522700', '6');
INSERT INTO `xpcms_area` VALUES ('522727', '平塘县', '522700', '7');
INSERT INTO `xpcms_area` VALUES ('522728', '罗甸县', '522700', '8');
INSERT INTO `xpcms_area` VALUES ('522729', '长顺县', '522700', '9');
INSERT INTO `xpcms_area` VALUES ('522730', '龙里县', '522700', '10');
INSERT INTO `xpcms_area` VALUES ('522731', '惠水县', '522700', '11');
INSERT INTO `xpcms_area` VALUES ('522732', '三都水族自治县', '522700', '12');
INSERT INTO `xpcms_area` VALUES ('530101', '市辖区', '530100', '1');
INSERT INTO `xpcms_area` VALUES ('530102', '五华区', '530100', '2');
INSERT INTO `xpcms_area` VALUES ('530103', '盘龙区', '530100', '3');
INSERT INTO `xpcms_area` VALUES ('530111', '官渡区', '530100', '4');
INSERT INTO `xpcms_area` VALUES ('530112', '西山区', '530100', '5');
INSERT INTO `xpcms_area` VALUES ('530113', '东川区', '530100', '6');
INSERT INTO `xpcms_area` VALUES ('530121', '呈贡县', '530100', '7');
INSERT INTO `xpcms_area` VALUES ('530122', '晋宁县', '530100', '8');
INSERT INTO `xpcms_area` VALUES ('530124', '富民县', '530100', '9');
INSERT INTO `xpcms_area` VALUES ('530125', '宜良县', '530100', '10');
INSERT INTO `xpcms_area` VALUES ('530126', '石林彝族自治县', '530100', '11');
INSERT INTO `xpcms_area` VALUES ('530127', '嵩明县', '530100', '12');
INSERT INTO `xpcms_area` VALUES ('530128', '禄劝彝族苗族自治县', '530100', '13');
INSERT INTO `xpcms_area` VALUES ('530129', '寻甸回族彝族自治县', '530100', '14');
INSERT INTO `xpcms_area` VALUES ('530181', '安宁市', '530100', '15');
INSERT INTO `xpcms_area` VALUES ('530301', '市辖区', '530300', '1');
INSERT INTO `xpcms_area` VALUES ('530302', '麒麟区', '530300', '2');
INSERT INTO `xpcms_area` VALUES ('530321', '马龙县', '530300', '3');
INSERT INTO `xpcms_area` VALUES ('530322', '陆良县', '530300', '4');
INSERT INTO `xpcms_area` VALUES ('530323', '师宗县', '530300', '5');
INSERT INTO `xpcms_area` VALUES ('530324', '罗平县', '530300', '6');
INSERT INTO `xpcms_area` VALUES ('530325', '富源县', '530300', '7');
INSERT INTO `xpcms_area` VALUES ('530326', '会泽县', '530300', '8');
INSERT INTO `xpcms_area` VALUES ('530328', '沾益县', '530300', '9');
INSERT INTO `xpcms_area` VALUES ('530381', '宣威市', '530300', '10');
INSERT INTO `xpcms_area` VALUES ('530401', '市辖区', '530400', '1');
INSERT INTO `xpcms_area` VALUES ('530402', '红塔区', '530400', '2');
INSERT INTO `xpcms_area` VALUES ('530421', '江川县', '530400', '3');
INSERT INTO `xpcms_area` VALUES ('530422', '澄江县', '530400', '4');
INSERT INTO `xpcms_area` VALUES ('530423', '通海县', '530400', '5');
INSERT INTO `xpcms_area` VALUES ('530424', '华宁县', '530400', '6');
INSERT INTO `xpcms_area` VALUES ('530425', '易门县', '530400', '7');
INSERT INTO `xpcms_area` VALUES ('530426', '峨山彝族自治县', '530400', '8');
INSERT INTO `xpcms_area` VALUES ('530427', '新平彝族傣族自治县', '530400', '9');
INSERT INTO `xpcms_area` VALUES ('530428', '元江哈尼族彝族傣族自治县', '530400', '10');
INSERT INTO `xpcms_area` VALUES ('530501', '市辖区', '530500', '1');
INSERT INTO `xpcms_area` VALUES ('530502', '隆阳区', '530500', '2');
INSERT INTO `xpcms_area` VALUES ('530521', '施甸县', '530500', '3');
INSERT INTO `xpcms_area` VALUES ('530522', '腾冲县', '530500', '4');
INSERT INTO `xpcms_area` VALUES ('530523', '龙陵县', '530500', '5');
INSERT INTO `xpcms_area` VALUES ('530524', '昌宁县', '530500', '6');
INSERT INTO `xpcms_area` VALUES ('530601', '市辖区', '530600', '1');
INSERT INTO `xpcms_area` VALUES ('530602', '昭阳区', '530600', '2');
INSERT INTO `xpcms_area` VALUES ('530621', '鲁甸县', '530600', '3');
INSERT INTO `xpcms_area` VALUES ('530622', '巧家县', '530600', '4');
INSERT INTO `xpcms_area` VALUES ('530623', '盐津县', '530600', '5');
INSERT INTO `xpcms_area` VALUES ('530624', '大关县', '530600', '6');
INSERT INTO `xpcms_area` VALUES ('530625', '永善县', '530600', '7');
INSERT INTO `xpcms_area` VALUES ('530626', '绥江县', '530600', '8');
INSERT INTO `xpcms_area` VALUES ('530627', '镇雄县', '530600', '9');
INSERT INTO `xpcms_area` VALUES ('530628', '彝良县', '530600', '10');
INSERT INTO `xpcms_area` VALUES ('530629', '威信县', '530600', '11');
INSERT INTO `xpcms_area` VALUES ('530630', '水富县', '530600', '12');
INSERT INTO `xpcms_area` VALUES ('530701', '市辖区', '530700', '1');
INSERT INTO `xpcms_area` VALUES ('530702', '古城区', '530700', '2');
INSERT INTO `xpcms_area` VALUES ('530721', '玉龙纳西族自治县', '530700', '3');
INSERT INTO `xpcms_area` VALUES ('530722', '永胜县', '530700', '4');
INSERT INTO `xpcms_area` VALUES ('530723', '华坪县', '530700', '5');
INSERT INTO `xpcms_area` VALUES ('530724', '宁蒗彝族自治县', '530700', '6');
INSERT INTO `xpcms_area` VALUES ('530801', '市辖区', '530800', '1');
INSERT INTO `xpcms_area` VALUES ('530802', '翠云区', '530800', '2');
INSERT INTO `xpcms_area` VALUES ('530821', '普洱哈尼族彝族自治县', '530800', '3');
INSERT INTO `xpcms_area` VALUES ('530822', '墨江哈尼族自治县', '530800', '4');
INSERT INTO `xpcms_area` VALUES ('530823', '景东彝族自治县', '530800', '5');
INSERT INTO `xpcms_area` VALUES ('530824', '景谷傣族彝族自治县', '530800', '6');
INSERT INTO `xpcms_area` VALUES ('530825', '镇沅彝族哈尼族拉祜族自治县', '530800', '7');
INSERT INTO `xpcms_area` VALUES ('530826', '江城哈尼族彝族自治县', '530800', '8');
INSERT INTO `xpcms_area` VALUES ('530827', '孟连傣族拉祜族佤族自治县', '530800', '9');
INSERT INTO `xpcms_area` VALUES ('530828', '澜沧拉祜族自治县', '530800', '10');
INSERT INTO `xpcms_area` VALUES ('530829', '西盟佤族自治县', '530800', '11');
INSERT INTO `xpcms_area` VALUES ('530901', '市辖区', '530900', '1');
INSERT INTO `xpcms_area` VALUES ('530902', '临翔区', '530900', '2');
INSERT INTO `xpcms_area` VALUES ('530921', '凤庆县', '530900', '3');
INSERT INTO `xpcms_area` VALUES ('530922', '云　县', '530900', '4');
INSERT INTO `xpcms_area` VALUES ('530923', '永德县', '530900', '5');
INSERT INTO `xpcms_area` VALUES ('530924', '镇康县', '530900', '6');
INSERT INTO `xpcms_area` VALUES ('530925', '双江拉祜族佤族布朗族傣族自治县', '530900', '7');
INSERT INTO `xpcms_area` VALUES ('530926', '耿马傣族佤族自治县', '530900', '8');
INSERT INTO `xpcms_area` VALUES ('530927', '沧源佤族自治县', '530900', '9');
INSERT INTO `xpcms_area` VALUES ('532301', '楚雄市', '532300', '1');
INSERT INTO `xpcms_area` VALUES ('532322', '双柏县', '532300', '2');
INSERT INTO `xpcms_area` VALUES ('532323', '牟定县', '532300', '3');
INSERT INTO `xpcms_area` VALUES ('532324', '南华县', '532300', '4');
INSERT INTO `xpcms_area` VALUES ('532325', '姚安县', '532300', '5');
INSERT INTO `xpcms_area` VALUES ('532326', '大姚县', '532300', '6');
INSERT INTO `xpcms_area` VALUES ('532327', '永仁县', '532300', '7');
INSERT INTO `xpcms_area` VALUES ('532328', '元谋县', '532300', '8');
INSERT INTO `xpcms_area` VALUES ('532329', '武定县', '532300', '9');
INSERT INTO `xpcms_area` VALUES ('532331', '禄丰县', '532300', '10');
INSERT INTO `xpcms_area` VALUES ('532501', '个旧市', '532500', '1');
INSERT INTO `xpcms_area` VALUES ('532502', '开远市', '532500', '2');
INSERT INTO `xpcms_area` VALUES ('532522', '蒙自县', '532500', '3');
INSERT INTO `xpcms_area` VALUES ('532523', '屏边苗族自治县', '532500', '4');
INSERT INTO `xpcms_area` VALUES ('532524', '建水县', '532500', '5');
INSERT INTO `xpcms_area` VALUES ('532525', '石屏县', '532500', '6');
INSERT INTO `xpcms_area` VALUES ('532526', '弥勒县', '532500', '7');
INSERT INTO `xpcms_area` VALUES ('532527', '泸西县', '532500', '8');
INSERT INTO `xpcms_area` VALUES ('532528', '元阳县', '532500', '9');
INSERT INTO `xpcms_area` VALUES ('532529', '红河县', '532500', '10');
INSERT INTO `xpcms_area` VALUES ('532530', '金平苗族瑶族傣族自治县', '532500', '11');
INSERT INTO `xpcms_area` VALUES ('532531', '绿春县', '532500', '12');
INSERT INTO `xpcms_area` VALUES ('532532', '河口瑶族自治县', '532500', '13');
INSERT INTO `xpcms_area` VALUES ('532621', '文山县', '532600', '1');
INSERT INTO `xpcms_area` VALUES ('532622', '砚山县', '532600', '2');
INSERT INTO `xpcms_area` VALUES ('532623', '西畴县', '532600', '3');
INSERT INTO `xpcms_area` VALUES ('532624', '麻栗坡县', '532600', '4');
INSERT INTO `xpcms_area` VALUES ('532625', '马关县', '532600', '5');
INSERT INTO `xpcms_area` VALUES ('532626', '丘北县', '532600', '6');
INSERT INTO `xpcms_area` VALUES ('532627', '广南县', '532600', '7');
INSERT INTO `xpcms_area` VALUES ('532628', '富宁县', '532600', '8');
INSERT INTO `xpcms_area` VALUES ('532801', '景洪市', '532800', '1');
INSERT INTO `xpcms_area` VALUES ('532822', '勐海县', '532800', '2');
INSERT INTO `xpcms_area` VALUES ('532823', '勐腊县', '532800', '3');
INSERT INTO `xpcms_area` VALUES ('532901', '大理市', '532900', '1');
INSERT INTO `xpcms_area` VALUES ('532922', '漾濞彝族自治县', '532900', '2');
INSERT INTO `xpcms_area` VALUES ('532923', '祥云县', '532900', '3');
INSERT INTO `xpcms_area` VALUES ('532924', '宾川县', '532900', '4');
INSERT INTO `xpcms_area` VALUES ('532925', '弥渡县', '532900', '5');
INSERT INTO `xpcms_area` VALUES ('532926', '南涧彝族自治县', '532900', '6');
INSERT INTO `xpcms_area` VALUES ('532927', '巍山彝族回族自治县', '532900', '7');
INSERT INTO `xpcms_area` VALUES ('532928', '永平县', '532900', '8');
INSERT INTO `xpcms_area` VALUES ('532929', '云龙县', '532900', '9');
INSERT INTO `xpcms_area` VALUES ('532930', '洱源县', '532900', '10');
INSERT INTO `xpcms_area` VALUES ('532931', '剑川县', '532900', '11');
INSERT INTO `xpcms_area` VALUES ('532932', '鹤庆县', '532900', '12');
INSERT INTO `xpcms_area` VALUES ('533102', '瑞丽市', '533100', '1');
INSERT INTO `xpcms_area` VALUES ('533103', '潞西市', '533100', '2');
INSERT INTO `xpcms_area` VALUES ('533122', '梁河县', '533100', '3');
INSERT INTO `xpcms_area` VALUES ('533123', '盈江县', '533100', '4');
INSERT INTO `xpcms_area` VALUES ('533124', '陇川县', '533100', '5');
INSERT INTO `xpcms_area` VALUES ('533321', '泸水县', '533300', '1');
INSERT INTO `xpcms_area` VALUES ('533323', '福贡县', '533300', '2');
INSERT INTO `xpcms_area` VALUES ('533324', '贡山独龙族怒族自治县', '533300', '3');
INSERT INTO `xpcms_area` VALUES ('533325', '兰坪白族普米族自治县', '533300', '4');
INSERT INTO `xpcms_area` VALUES ('533421', '香格里拉县', '533400', '1');
INSERT INTO `xpcms_area` VALUES ('533422', '德钦县', '533400', '2');
INSERT INTO `xpcms_area` VALUES ('533423', '维西傈僳族自治县', '533400', '3');
INSERT INTO `xpcms_area` VALUES ('540101', '市辖区', '540100', '1');
INSERT INTO `xpcms_area` VALUES ('540102', '城关区', '540100', '2');
INSERT INTO `xpcms_area` VALUES ('540121', '林周县', '540100', '3');
INSERT INTO `xpcms_area` VALUES ('540122', '当雄县', '540100', '4');
INSERT INTO `xpcms_area` VALUES ('540123', '尼木县', '540100', '5');
INSERT INTO `xpcms_area` VALUES ('540124', '曲水县', '540100', '6');
INSERT INTO `xpcms_area` VALUES ('540125', '堆龙德庆县', '540100', '7');
INSERT INTO `xpcms_area` VALUES ('540126', '达孜县', '540100', '8');
INSERT INTO `xpcms_area` VALUES ('540127', '墨竹工卡县', '540100', '9');
INSERT INTO `xpcms_area` VALUES ('542121', '昌都县', '542100', '1');
INSERT INTO `xpcms_area` VALUES ('542122', '江达县', '542100', '2');
INSERT INTO `xpcms_area` VALUES ('542123', '贡觉县', '542100', '3');
INSERT INTO `xpcms_area` VALUES ('542124', '类乌齐县', '542100', '4');
INSERT INTO `xpcms_area` VALUES ('542125', '丁青县', '542100', '5');
INSERT INTO `xpcms_area` VALUES ('542126', '察雅县', '542100', '6');
INSERT INTO `xpcms_area` VALUES ('542127', '八宿县', '542100', '7');
INSERT INTO `xpcms_area` VALUES ('542128', '左贡县', '542100', '8');
INSERT INTO `xpcms_area` VALUES ('542129', '芒康县', '542100', '9');
INSERT INTO `xpcms_area` VALUES ('542132', '洛隆县', '542100', '10');
INSERT INTO `xpcms_area` VALUES ('542133', '边坝县', '542100', '11');
INSERT INTO `xpcms_area` VALUES ('542221', '乃东县', '542200', '1');
INSERT INTO `xpcms_area` VALUES ('542222', '扎囊县', '542200', '2');
INSERT INTO `xpcms_area` VALUES ('542223', '贡嘎县', '542200', '3');
INSERT INTO `xpcms_area` VALUES ('542224', '桑日县', '542200', '4');
INSERT INTO `xpcms_area` VALUES ('542225', '琼结县', '542200', '5');
INSERT INTO `xpcms_area` VALUES ('542226', '曲松县', '542200', '6');
INSERT INTO `xpcms_area` VALUES ('542227', '措美县', '542200', '7');
INSERT INTO `xpcms_area` VALUES ('542228', '洛扎县', '542200', '8');
INSERT INTO `xpcms_area` VALUES ('542229', '加查县', '542200', '9');
INSERT INTO `xpcms_area` VALUES ('542231', '隆子县', '542200', '10');
INSERT INTO `xpcms_area` VALUES ('542232', '错那县', '542200', '11');
INSERT INTO `xpcms_area` VALUES ('542233', '浪卡子县', '542200', '12');
INSERT INTO `xpcms_area` VALUES ('542301', '日喀则市', '542300', '1');
INSERT INTO `xpcms_area` VALUES ('542322', '南木林县', '542300', '2');
INSERT INTO `xpcms_area` VALUES ('542323', '江孜县', '542300', '3');
INSERT INTO `xpcms_area` VALUES ('542324', '定日县', '542300', '4');
INSERT INTO `xpcms_area` VALUES ('542325', '萨迦县', '542300', '5');
INSERT INTO `xpcms_area` VALUES ('542326', '拉孜县', '542300', '6');
INSERT INTO `xpcms_area` VALUES ('542327', '昂仁县', '542300', '7');
INSERT INTO `xpcms_area` VALUES ('542328', '谢通门县', '542300', '8');
INSERT INTO `xpcms_area` VALUES ('542329', '白朗县', '542300', '9');
INSERT INTO `xpcms_area` VALUES ('542330', '仁布县', '542300', '10');
INSERT INTO `xpcms_area` VALUES ('542331', '康马县', '542300', '11');
INSERT INTO `xpcms_area` VALUES ('542332', '定结县', '542300', '12');
INSERT INTO `xpcms_area` VALUES ('542333', '仲巴县', '542300', '13');
INSERT INTO `xpcms_area` VALUES ('542334', '亚东县', '542300', '14');
INSERT INTO `xpcms_area` VALUES ('542335', '吉隆县', '542300', '15');
INSERT INTO `xpcms_area` VALUES ('542336', '聂拉木县', '542300', '16');
INSERT INTO `xpcms_area` VALUES ('542337', '萨嘎县', '542300', '17');
INSERT INTO `xpcms_area` VALUES ('542338', '岗巴县', '542300', '18');
INSERT INTO `xpcms_area` VALUES ('542421', '那曲县', '542400', '1');
INSERT INTO `xpcms_area` VALUES ('542422', '嘉黎县', '542400', '2');
INSERT INTO `xpcms_area` VALUES ('542423', '比如县', '542400', '3');
INSERT INTO `xpcms_area` VALUES ('542424', '聂荣县', '542400', '4');
INSERT INTO `xpcms_area` VALUES ('542425', '安多县', '542400', '5');
INSERT INTO `xpcms_area` VALUES ('542426', '申扎县', '542400', '6');
INSERT INTO `xpcms_area` VALUES ('542427', '索　县', '542400', '7');
INSERT INTO `xpcms_area` VALUES ('542428', '班戈县', '542400', '8');
INSERT INTO `xpcms_area` VALUES ('542429', '巴青县', '542400', '9');
INSERT INTO `xpcms_area` VALUES ('542430', '尼玛县', '542400', '10');
INSERT INTO `xpcms_area` VALUES ('542521', '普兰县', '542500', '1');
INSERT INTO `xpcms_area` VALUES ('542522', '札达县', '542500', '2');
INSERT INTO `xpcms_area` VALUES ('542523', '噶尔县', '542500', '3');
INSERT INTO `xpcms_area` VALUES ('542524', '日土县', '542500', '4');
INSERT INTO `xpcms_area` VALUES ('542525', '革吉县', '542500', '5');
INSERT INTO `xpcms_area` VALUES ('542526', '改则县', '542500', '6');
INSERT INTO `xpcms_area` VALUES ('542527', '措勤县', '542500', '7');
INSERT INTO `xpcms_area` VALUES ('542621', '林芝县', '542600', '1');
INSERT INTO `xpcms_area` VALUES ('542622', '工布江达县', '542600', '2');
INSERT INTO `xpcms_area` VALUES ('542623', '米林县', '542600', '3');
INSERT INTO `xpcms_area` VALUES ('542624', '墨脱县', '542600', '4');
INSERT INTO `xpcms_area` VALUES ('542625', '波密县', '542600', '5');
INSERT INTO `xpcms_area` VALUES ('542626', '察隅县', '542600', '6');
INSERT INTO `xpcms_area` VALUES ('542627', '朗　县', '542600', '7');
INSERT INTO `xpcms_area` VALUES ('610101', '市辖区', '610100', '1');
INSERT INTO `xpcms_area` VALUES ('610102', '新城区', '610100', '2');
INSERT INTO `xpcms_area` VALUES ('610103', '碑林区', '610100', '3');
INSERT INTO `xpcms_area` VALUES ('610104', '莲湖区', '610100', '4');
INSERT INTO `xpcms_area` VALUES ('610111', '灞桥区', '610100', '5');
INSERT INTO `xpcms_area` VALUES ('610112', '未央区', '610100', '6');
INSERT INTO `xpcms_area` VALUES ('610113', '雁塔区', '610100', '7');
INSERT INTO `xpcms_area` VALUES ('610114', '阎良区', '610100', '8');
INSERT INTO `xpcms_area` VALUES ('610115', '临潼区', '610100', '9');
INSERT INTO `xpcms_area` VALUES ('610116', '长安区', '610100', '10');
INSERT INTO `xpcms_area` VALUES ('610122', '蓝田县', '610100', '11');
INSERT INTO `xpcms_area` VALUES ('610124', '周至县', '610100', '12');
INSERT INTO `xpcms_area` VALUES ('610125', '户　县', '610100', '13');
INSERT INTO `xpcms_area` VALUES ('610126', '高陵县', '610100', '14');
INSERT INTO `xpcms_area` VALUES ('610201', '市辖区', '610200', '1');
INSERT INTO `xpcms_area` VALUES ('610202', '王益区', '610200', '2');
INSERT INTO `xpcms_area` VALUES ('610203', '印台区', '610200', '3');
INSERT INTO `xpcms_area` VALUES ('610204', '耀州区', '610200', '4');
INSERT INTO `xpcms_area` VALUES ('610222', '宜君县', '610200', '5');
INSERT INTO `xpcms_area` VALUES ('610301', '市辖区', '610300', '1');
INSERT INTO `xpcms_area` VALUES ('610302', '渭滨区', '610300', '2');
INSERT INTO `xpcms_area` VALUES ('610303', '金台区', '610300', '3');
INSERT INTO `xpcms_area` VALUES ('610304', '陈仓区', '610300', '4');
INSERT INTO `xpcms_area` VALUES ('610322', '凤翔县', '610300', '5');
INSERT INTO `xpcms_area` VALUES ('610323', '岐山县', '610300', '6');
INSERT INTO `xpcms_area` VALUES ('610324', '扶风县', '610300', '7');
INSERT INTO `xpcms_area` VALUES ('610326', '眉　县', '610300', '8');
INSERT INTO `xpcms_area` VALUES ('610327', '陇　县', '610300', '9');
INSERT INTO `xpcms_area` VALUES ('610328', '千阳县', '610300', '10');
INSERT INTO `xpcms_area` VALUES ('610329', '麟游县', '610300', '11');
INSERT INTO `xpcms_area` VALUES ('610330', '凤　县', '610300', '12');
INSERT INTO `xpcms_area` VALUES ('610331', '太白县', '610300', '13');
INSERT INTO `xpcms_area` VALUES ('610401', '市辖区', '610400', '1');
INSERT INTO `xpcms_area` VALUES ('610402', '秦都区', '610400', '2');
INSERT INTO `xpcms_area` VALUES ('610403', '杨凌区', '610400', '3');
INSERT INTO `xpcms_area` VALUES ('610404', '渭城区', '610400', '4');
INSERT INTO `xpcms_area` VALUES ('610422', '三原县', '610400', '5');
INSERT INTO `xpcms_area` VALUES ('610423', '泾阳县', '610400', '6');
INSERT INTO `xpcms_area` VALUES ('610424', '乾　县', '610400', '7');
INSERT INTO `xpcms_area` VALUES ('610425', '礼泉县', '610400', '8');
INSERT INTO `xpcms_area` VALUES ('610426', '永寿县', '610400', '9');
INSERT INTO `xpcms_area` VALUES ('610427', '彬　县', '610400', '10');
INSERT INTO `xpcms_area` VALUES ('610428', '长武县', '610400', '11');
INSERT INTO `xpcms_area` VALUES ('610429', '旬邑县', '610400', '12');
INSERT INTO `xpcms_area` VALUES ('610430', '淳化县', '610400', '13');
INSERT INTO `xpcms_area` VALUES ('610431', '武功县', '610400', '14');
INSERT INTO `xpcms_area` VALUES ('610481', '兴平市', '610400', '15');
INSERT INTO `xpcms_area` VALUES ('610501', '市辖区', '610500', '1');
INSERT INTO `xpcms_area` VALUES ('610502', '临渭区', '610500', '2');
INSERT INTO `xpcms_area` VALUES ('610521', '华　县', '610500', '3');
INSERT INTO `xpcms_area` VALUES ('610522', '潼关县', '610500', '4');
INSERT INTO `xpcms_area` VALUES ('610523', '大荔县', '610500', '5');
INSERT INTO `xpcms_area` VALUES ('610524', '合阳县', '610500', '6');
INSERT INTO `xpcms_area` VALUES ('610525', '澄城县', '610500', '7');
INSERT INTO `xpcms_area` VALUES ('610526', '蒲城县', '610500', '8');
INSERT INTO `xpcms_area` VALUES ('610527', '白水县', '610500', '9');
INSERT INTO `xpcms_area` VALUES ('610528', '富平县', '610500', '10');
INSERT INTO `xpcms_area` VALUES ('610581', '韩城市', '610500', '11');
INSERT INTO `xpcms_area` VALUES ('610582', '华阴市', '610500', '12');
INSERT INTO `xpcms_area` VALUES ('610601', '市辖区', '610600', '1');
INSERT INTO `xpcms_area` VALUES ('610602', '宝塔区', '610600', '2');
INSERT INTO `xpcms_area` VALUES ('610621', '延长县', '610600', '3');
INSERT INTO `xpcms_area` VALUES ('610622', '延川县', '610600', '4');
INSERT INTO `xpcms_area` VALUES ('610623', '子长县', '610600', '5');
INSERT INTO `xpcms_area` VALUES ('610624', '安塞县', '610600', '6');
INSERT INTO `xpcms_area` VALUES ('610625', '志丹县', '610600', '7');
INSERT INTO `xpcms_area` VALUES ('610626', '吴旗县', '610600', '8');
INSERT INTO `xpcms_area` VALUES ('610627', '甘泉县', '610600', '9');
INSERT INTO `xpcms_area` VALUES ('610628', '富　县', '610600', '10');
INSERT INTO `xpcms_area` VALUES ('610629', '洛川县', '610600', '11');
INSERT INTO `xpcms_area` VALUES ('610630', '宜川县', '610600', '12');
INSERT INTO `xpcms_area` VALUES ('610631', '黄龙县', '610600', '13');
INSERT INTO `xpcms_area` VALUES ('610632', '黄陵县', '610600', '14');
INSERT INTO `xpcms_area` VALUES ('610701', '市辖区', '610700', '1');
INSERT INTO `xpcms_area` VALUES ('610702', '汉台区', '610700', '2');
INSERT INTO `xpcms_area` VALUES ('610721', '南郑县', '610700', '3');
INSERT INTO `xpcms_area` VALUES ('610722', '城固县', '610700', '4');
INSERT INTO `xpcms_area` VALUES ('610723', '洋　县', '610700', '5');
INSERT INTO `xpcms_area` VALUES ('610724', '西乡县', '610700', '6');
INSERT INTO `xpcms_area` VALUES ('610725', '勉　县', '610700', '7');
INSERT INTO `xpcms_area` VALUES ('610726', '宁强县', '610700', '8');
INSERT INTO `xpcms_area` VALUES ('610727', '略阳县', '610700', '9');
INSERT INTO `xpcms_area` VALUES ('610728', '镇巴县', '610700', '10');
INSERT INTO `xpcms_area` VALUES ('610729', '留坝县', '610700', '11');
INSERT INTO `xpcms_area` VALUES ('610730', '佛坪县', '610700', '12');
INSERT INTO `xpcms_area` VALUES ('610801', '市辖区', '610800', '1');
INSERT INTO `xpcms_area` VALUES ('610802', '榆阳区', '610800', '2');
INSERT INTO `xpcms_area` VALUES ('610821', '神木县', '610800', '3');
INSERT INTO `xpcms_area` VALUES ('610822', '府谷县', '610800', '4');
INSERT INTO `xpcms_area` VALUES ('610823', '横山县', '610800', '5');
INSERT INTO `xpcms_area` VALUES ('610824', '靖边县', '610800', '6');
INSERT INTO `xpcms_area` VALUES ('610825', '定边县', '610800', '7');
INSERT INTO `xpcms_area` VALUES ('610826', '绥德县', '610800', '8');
INSERT INTO `xpcms_area` VALUES ('610827', '米脂县', '610800', '9');
INSERT INTO `xpcms_area` VALUES ('610828', '佳　县', '610800', '10');
INSERT INTO `xpcms_area` VALUES ('610829', '吴堡县', '610800', '11');
INSERT INTO `xpcms_area` VALUES ('610830', '清涧县', '610800', '12');
INSERT INTO `xpcms_area` VALUES ('610831', '子洲县', '610800', '13');
INSERT INTO `xpcms_area` VALUES ('610901', '市辖区', '610900', '1');
INSERT INTO `xpcms_area` VALUES ('610902', '汉滨区', '610900', '2');
INSERT INTO `xpcms_area` VALUES ('610921', '汉阴县', '610900', '3');
INSERT INTO `xpcms_area` VALUES ('610922', '石泉县', '610900', '4');
INSERT INTO `xpcms_area` VALUES ('610923', '宁陕县', '610900', '5');
INSERT INTO `xpcms_area` VALUES ('610924', '紫阳县', '610900', '6');
INSERT INTO `xpcms_area` VALUES ('610925', '岚皋县', '610900', '7');
INSERT INTO `xpcms_area` VALUES ('610926', '平利县', '610900', '8');
INSERT INTO `xpcms_area` VALUES ('610927', '镇坪县', '610900', '9');
INSERT INTO `xpcms_area` VALUES ('610928', '旬阳县', '610900', '10');
INSERT INTO `xpcms_area` VALUES ('610929', '白河县', '610900', '11');
INSERT INTO `xpcms_area` VALUES ('611001', '市辖区', '611000', '1');
INSERT INTO `xpcms_area` VALUES ('611002', '商州区', '611000', '2');
INSERT INTO `xpcms_area` VALUES ('611021', '洛南县', '611000', '3');
INSERT INTO `xpcms_area` VALUES ('611022', '丹凤县', '611000', '4');
INSERT INTO `xpcms_area` VALUES ('611023', '商南县', '611000', '5');
INSERT INTO `xpcms_area` VALUES ('611024', '山阳县', '611000', '6');
INSERT INTO `xpcms_area` VALUES ('611025', '镇安县', '611000', '7');
INSERT INTO `xpcms_area` VALUES ('611026', '柞水县', '611000', '8');
INSERT INTO `xpcms_area` VALUES ('620101', '市辖区', '620100', '1');
INSERT INTO `xpcms_area` VALUES ('620102', '城关区', '620100', '2');
INSERT INTO `xpcms_area` VALUES ('620103', '七里河区', '620100', '3');
INSERT INTO `xpcms_area` VALUES ('620104', '西固区', '620100', '4');
INSERT INTO `xpcms_area` VALUES ('620105', '安宁区', '620100', '5');
INSERT INTO `xpcms_area` VALUES ('620111', '红古区', '620100', '6');
INSERT INTO `xpcms_area` VALUES ('620121', '永登县', '620100', '7');
INSERT INTO `xpcms_area` VALUES ('620122', '皋兰县', '620100', '8');
INSERT INTO `xpcms_area` VALUES ('620123', '榆中县', '620100', '9');
INSERT INTO `xpcms_area` VALUES ('620201', '市辖区', '620200', '1');
INSERT INTO `xpcms_area` VALUES ('620301', '市辖区', '620300', '1');
INSERT INTO `xpcms_area` VALUES ('620302', '金川区', '620300', '2');
INSERT INTO `xpcms_area` VALUES ('620321', '永昌县', '620300', '3');
INSERT INTO `xpcms_area` VALUES ('620401', '市辖区', '620400', '1');
INSERT INTO `xpcms_area` VALUES ('620402', '白银区', '620400', '2');
INSERT INTO `xpcms_area` VALUES ('620403', '平川区', '620400', '3');
INSERT INTO `xpcms_area` VALUES ('620421', '靖远县', '620400', '4');
INSERT INTO `xpcms_area` VALUES ('620422', '会宁县', '620400', '5');
INSERT INTO `xpcms_area` VALUES ('620423', '景泰县', '620400', '6');
INSERT INTO `xpcms_area` VALUES ('620501', '市辖区', '620500', '1');
INSERT INTO `xpcms_area` VALUES ('620502', '秦城区', '620500', '2');
INSERT INTO `xpcms_area` VALUES ('620503', '北道区', '620500', '3');
INSERT INTO `xpcms_area` VALUES ('620521', '清水县', '620500', '4');
INSERT INTO `xpcms_area` VALUES ('620522', '秦安县', '620500', '5');
INSERT INTO `xpcms_area` VALUES ('620523', '甘谷县', '620500', '6');
INSERT INTO `xpcms_area` VALUES ('620524', '武山县', '620500', '7');
INSERT INTO `xpcms_area` VALUES ('620525', '张家川回族自治县', '620500', '8');
INSERT INTO `xpcms_area` VALUES ('620601', '市辖区', '620600', '1');
INSERT INTO `xpcms_area` VALUES ('620602', '凉州区', '620600', '2');
INSERT INTO `xpcms_area` VALUES ('620621', '民勤县', '620600', '3');
INSERT INTO `xpcms_area` VALUES ('620622', '古浪县', '620600', '4');
INSERT INTO `xpcms_area` VALUES ('620623', '天祝藏族自治县', '620600', '5');
INSERT INTO `xpcms_area` VALUES ('620701', '市辖区', '620700', '1');
INSERT INTO `xpcms_area` VALUES ('620702', '甘州区', '620700', '2');
INSERT INTO `xpcms_area` VALUES ('620721', '肃南裕固族自治县', '620700', '3');
INSERT INTO `xpcms_area` VALUES ('620722', '民乐县', '620700', '4');
INSERT INTO `xpcms_area` VALUES ('620723', '临泽县', '620700', '5');
INSERT INTO `xpcms_area` VALUES ('620724', '高台县', '620700', '6');
INSERT INTO `xpcms_area` VALUES ('620725', '山丹县', '620700', '7');
INSERT INTO `xpcms_area` VALUES ('620801', '市辖区', '620800', '1');
INSERT INTO `xpcms_area` VALUES ('620802', '崆峒区', '620800', '2');
INSERT INTO `xpcms_area` VALUES ('620821', '泾川县', '620800', '3');
INSERT INTO `xpcms_area` VALUES ('620822', '灵台县', '620800', '4');
INSERT INTO `xpcms_area` VALUES ('620823', '崇信县', '620800', '5');
INSERT INTO `xpcms_area` VALUES ('620824', '华亭县', '620800', '6');
INSERT INTO `xpcms_area` VALUES ('620825', '庄浪县', '620800', '7');
INSERT INTO `xpcms_area` VALUES ('620826', '静宁县', '620800', '8');
INSERT INTO `xpcms_area` VALUES ('620901', '市辖区', '620900', '1');
INSERT INTO `xpcms_area` VALUES ('620902', '肃州区', '620900', '2');
INSERT INTO `xpcms_area` VALUES ('620921', '金塔县', '620900', '3');
INSERT INTO `xpcms_area` VALUES ('620922', '安西县', '620900', '4');
INSERT INTO `xpcms_area` VALUES ('620923', '肃北蒙古族自治县', '620900', '5');
INSERT INTO `xpcms_area` VALUES ('620924', '阿克塞哈萨克族自治县', '620900', '6');
INSERT INTO `xpcms_area` VALUES ('620981', '玉门市', '620900', '7');
INSERT INTO `xpcms_area` VALUES ('620982', '敦煌市', '620900', '8');
INSERT INTO `xpcms_area` VALUES ('621001', '市辖区', '621000', '1');
INSERT INTO `xpcms_area` VALUES ('621002', '西峰区', '621000', '2');
INSERT INTO `xpcms_area` VALUES ('621021', '庆城县', '621000', '3');
INSERT INTO `xpcms_area` VALUES ('621022', '环　县', '621000', '4');
INSERT INTO `xpcms_area` VALUES ('621023', '华池县', '621000', '5');
INSERT INTO `xpcms_area` VALUES ('621024', '合水县', '621000', '6');
INSERT INTO `xpcms_area` VALUES ('621025', '正宁县', '621000', '7');
INSERT INTO `xpcms_area` VALUES ('621026', '宁　县', '621000', '8');
INSERT INTO `xpcms_area` VALUES ('621027', '镇原县', '621000', '9');
INSERT INTO `xpcms_area` VALUES ('621101', '市辖区', '621100', '1');
INSERT INTO `xpcms_area` VALUES ('621102', '安定区', '621100', '2');
INSERT INTO `xpcms_area` VALUES ('621121', '通渭县', '621100', '3');
INSERT INTO `xpcms_area` VALUES ('621122', '陇西县', '621100', '4');
INSERT INTO `xpcms_area` VALUES ('621123', '渭源县', '621100', '5');
INSERT INTO `xpcms_area` VALUES ('621124', '临洮县', '621100', '6');
INSERT INTO `xpcms_area` VALUES ('621125', '漳　县', '621100', '7');
INSERT INTO `xpcms_area` VALUES ('621126', '岷　县', '621100', '8');
INSERT INTO `xpcms_area` VALUES ('621201', '市辖区', '621200', '1');
INSERT INTO `xpcms_area` VALUES ('621202', '武都区', '621200', '2');
INSERT INTO `xpcms_area` VALUES ('621221', '成　县', '621200', '3');
INSERT INTO `xpcms_area` VALUES ('621222', '文　县', '621200', '4');
INSERT INTO `xpcms_area` VALUES ('621223', '宕昌县', '621200', '5');
INSERT INTO `xpcms_area` VALUES ('621224', '康　县', '621200', '6');
INSERT INTO `xpcms_area` VALUES ('621225', '西和县', '621200', '7');
INSERT INTO `xpcms_area` VALUES ('621226', '礼　县', '621200', '8');
INSERT INTO `xpcms_area` VALUES ('621227', '徽　县', '621200', '9');
INSERT INTO `xpcms_area` VALUES ('621228', '两当县', '621200', '10');
INSERT INTO `xpcms_area` VALUES ('622901', '临夏市', '622900', '1');
INSERT INTO `xpcms_area` VALUES ('622921', '临夏县', '622900', '2');
INSERT INTO `xpcms_area` VALUES ('622922', '康乐县', '622900', '3');
INSERT INTO `xpcms_area` VALUES ('622923', '永靖县', '622900', '4');
INSERT INTO `xpcms_area` VALUES ('622924', '广河县', '622900', '5');
INSERT INTO `xpcms_area` VALUES ('622925', '和政县', '622900', '6');
INSERT INTO `xpcms_area` VALUES ('622926', '东乡族自治县', '622900', '7');
INSERT INTO `xpcms_area` VALUES ('622927', '积石山保安族东乡族撒拉族自治县', '622900', '8');
INSERT INTO `xpcms_area` VALUES ('623001', '合作市', '623000', '1');
INSERT INTO `xpcms_area` VALUES ('623021', '临潭县', '623000', '2');
INSERT INTO `xpcms_area` VALUES ('623022', '卓尼县', '623000', '3');
INSERT INTO `xpcms_area` VALUES ('623023', '舟曲县', '623000', '4');
INSERT INTO `xpcms_area` VALUES ('623024', '迭部县', '623000', '5');
INSERT INTO `xpcms_area` VALUES ('623025', '玛曲县', '623000', '6');
INSERT INTO `xpcms_area` VALUES ('623026', '碌曲县', '623000', '7');
INSERT INTO `xpcms_area` VALUES ('623027', '夏河县', '623000', '8');
INSERT INTO `xpcms_area` VALUES ('630101', '市辖区', '630100', '1');
INSERT INTO `xpcms_area` VALUES ('630102', '城东区', '630100', '2');
INSERT INTO `xpcms_area` VALUES ('630103', '城中区', '630100', '3');
INSERT INTO `xpcms_area` VALUES ('630104', '城西区', '630100', '4');
INSERT INTO `xpcms_area` VALUES ('630105', '城北区', '630100', '5');
INSERT INTO `xpcms_area` VALUES ('630121', '大通回族土族自治县', '630100', '6');
INSERT INTO `xpcms_area` VALUES ('630122', '湟中县', '630100', '7');
INSERT INTO `xpcms_area` VALUES ('630123', '湟源县', '630100', '8');
INSERT INTO `xpcms_area` VALUES ('632121', '平安县', '632100', '1');
INSERT INTO `xpcms_area` VALUES ('632122', '民和回族土族自治县', '632100', '2');
INSERT INTO `xpcms_area` VALUES ('632123', '乐都县', '632100', '3');
INSERT INTO `xpcms_area` VALUES ('632126', '互助土族自治县', '632100', '4');
INSERT INTO `xpcms_area` VALUES ('632127', '化隆回族自治县', '632100', '5');
INSERT INTO `xpcms_area` VALUES ('632128', '循化撒拉族自治县', '632100', '6');
INSERT INTO `xpcms_area` VALUES ('632221', '门源回族自治县', '632200', '1');
INSERT INTO `xpcms_area` VALUES ('632222', '祁连县', '632200', '2');
INSERT INTO `xpcms_area` VALUES ('632223', '海晏县', '632200', '3');
INSERT INTO `xpcms_area` VALUES ('632224', '刚察县', '632200', '4');
INSERT INTO `xpcms_area` VALUES ('632321', '同仁县', '632300', '1');
INSERT INTO `xpcms_area` VALUES ('632322', '尖扎县', '632300', '2');
INSERT INTO `xpcms_area` VALUES ('632323', '泽库县', '632300', '3');
INSERT INTO `xpcms_area` VALUES ('632324', '河南蒙古族自治县', '632300', '4');
INSERT INTO `xpcms_area` VALUES ('632521', '共和县', '632500', '1');
INSERT INTO `xpcms_area` VALUES ('632522', '同德县', '632500', '2');
INSERT INTO `xpcms_area` VALUES ('632523', '贵德县', '632500', '3');
INSERT INTO `xpcms_area` VALUES ('632524', '兴海县', '632500', '4');
INSERT INTO `xpcms_area` VALUES ('632525', '贵南县', '632500', '5');
INSERT INTO `xpcms_area` VALUES ('632621', '玛沁县', '632600', '1');
INSERT INTO `xpcms_area` VALUES ('632622', '班玛县', '632600', '2');
INSERT INTO `xpcms_area` VALUES ('632623', '甘德县', '632600', '3');
INSERT INTO `xpcms_area` VALUES ('632624', '达日县', '632600', '4');
INSERT INTO `xpcms_area` VALUES ('632625', '久治县', '632600', '5');
INSERT INTO `xpcms_area` VALUES ('632626', '玛多县', '632600', '6');
INSERT INTO `xpcms_area` VALUES ('632721', '玉树县', '632700', '1');
INSERT INTO `xpcms_area` VALUES ('632722', '杂多县', '632700', '2');
INSERT INTO `xpcms_area` VALUES ('632723', '称多县', '632700', '3');
INSERT INTO `xpcms_area` VALUES ('632724', '治多县', '632700', '4');
INSERT INTO `xpcms_area` VALUES ('632725', '囊谦县', '632700', '5');
INSERT INTO `xpcms_area` VALUES ('632726', '曲麻莱县', '632700', '6');
INSERT INTO `xpcms_area` VALUES ('632801', '格尔木市', '632800', '1');
INSERT INTO `xpcms_area` VALUES ('632802', '德令哈市', '632800', '2');
INSERT INTO `xpcms_area` VALUES ('632821', '乌兰县', '632800', '3');
INSERT INTO `xpcms_area` VALUES ('632822', '都兰县', '632800', '4');
INSERT INTO `xpcms_area` VALUES ('632823', '天峻县', '632800', '5');
INSERT INTO `xpcms_area` VALUES ('640101', '市辖区', '640100', '1');
INSERT INTO `xpcms_area` VALUES ('640104', '兴庆区', '640100', '2');
INSERT INTO `xpcms_area` VALUES ('640105', '西夏区', '640100', '3');
INSERT INTO `xpcms_area` VALUES ('640106', '金凤区', '640100', '4');
INSERT INTO `xpcms_area` VALUES ('640121', '永宁县', '640100', '5');
INSERT INTO `xpcms_area` VALUES ('640122', '贺兰县', '640100', '6');
INSERT INTO `xpcms_area` VALUES ('640181', '灵武市', '640100', '7');
INSERT INTO `xpcms_area` VALUES ('640201', '市辖区', '640200', '1');
INSERT INTO `xpcms_area` VALUES ('640202', '大武口区', '640200', '2');
INSERT INTO `xpcms_area` VALUES ('640205', '惠农区', '640200', '3');
INSERT INTO `xpcms_area` VALUES ('640221', '平罗县', '640200', '4');
INSERT INTO `xpcms_area` VALUES ('640301', '市辖区', '640300', '1');
INSERT INTO `xpcms_area` VALUES ('640302', '利通区', '640300', '2');
INSERT INTO `xpcms_area` VALUES ('640323', '盐池县', '640300', '3');
INSERT INTO `xpcms_area` VALUES ('640324', '同心县', '640300', '4');
INSERT INTO `xpcms_area` VALUES ('640381', '青铜峡市', '640300', '5');
INSERT INTO `xpcms_area` VALUES ('640401', '市辖区', '640400', '1');
INSERT INTO `xpcms_area` VALUES ('640402', '原州区', '640400', '2');
INSERT INTO `xpcms_area` VALUES ('640422', '西吉县', '640400', '3');
INSERT INTO `xpcms_area` VALUES ('640423', '隆德县', '640400', '4');
INSERT INTO `xpcms_area` VALUES ('640424', '泾源县', '640400', '5');
INSERT INTO `xpcms_area` VALUES ('640425', '彭阳县', '640400', '6');
INSERT INTO `xpcms_area` VALUES ('640501', '市辖区', '640500', '1');
INSERT INTO `xpcms_area` VALUES ('640502', '沙坡头区', '640500', '2');
INSERT INTO `xpcms_area` VALUES ('640521', '中宁县', '640500', '3');
INSERT INTO `xpcms_area` VALUES ('640522', '海原县', '640500', '4');
INSERT INTO `xpcms_area` VALUES ('650101', '市辖区', '650100', '1');
INSERT INTO `xpcms_area` VALUES ('650102', '天山区', '650100', '2');
INSERT INTO `xpcms_area` VALUES ('650103', '沙依巴克区', '650100', '3');
INSERT INTO `xpcms_area` VALUES ('650104', '新市区', '650100', '4');
INSERT INTO `xpcms_area` VALUES ('650105', '水磨沟区', '650100', '5');
INSERT INTO `xpcms_area` VALUES ('650106', '头屯河区', '650100', '6');
INSERT INTO `xpcms_area` VALUES ('650107', '达坂城区', '650100', '7');
INSERT INTO `xpcms_area` VALUES ('650108', '东山区', '650100', '8');
INSERT INTO `xpcms_area` VALUES ('650121', '乌鲁木齐县', '650100', '9');
INSERT INTO `xpcms_area` VALUES ('650201', '市辖区', '650200', '1');
INSERT INTO `xpcms_area` VALUES ('650202', '独山子区', '650200', '2');
INSERT INTO `xpcms_area` VALUES ('650203', '克拉玛依区', '650200', '3');
INSERT INTO `xpcms_area` VALUES ('650204', '白碱滩区', '650200', '4');
INSERT INTO `xpcms_area` VALUES ('650205', '乌尔禾区', '650200', '5');
INSERT INTO `xpcms_area` VALUES ('652101', '吐鲁番市', '652100', '1');
INSERT INTO `xpcms_area` VALUES ('652122', '鄯善县', '652100', '2');
INSERT INTO `xpcms_area` VALUES ('652123', '托克逊县', '652100', '3');
INSERT INTO `xpcms_area` VALUES ('652201', '哈密市', '652200', '1');
INSERT INTO `xpcms_area` VALUES ('652222', '巴里坤哈萨克自治县', '652200', '2');
INSERT INTO `xpcms_area` VALUES ('652223', '伊吾县', '652200', '3');
INSERT INTO `xpcms_area` VALUES ('652301', '昌吉市', '652300', '1');
INSERT INTO `xpcms_area` VALUES ('652302', '阜康市', '652300', '2');
INSERT INTO `xpcms_area` VALUES ('652303', '米泉市', '652300', '3');
INSERT INTO `xpcms_area` VALUES ('652323', '呼图壁县', '652300', '4');
INSERT INTO `xpcms_area` VALUES ('652324', '玛纳斯县', '652300', '5');
INSERT INTO `xpcms_area` VALUES ('652325', '奇台县', '652300', '6');
INSERT INTO `xpcms_area` VALUES ('652327', '吉木萨尔县', '652300', '7');
INSERT INTO `xpcms_area` VALUES ('652328', '木垒哈萨克自治县', '652300', '8');
INSERT INTO `xpcms_area` VALUES ('652701', '博乐市', '652700', '1');
INSERT INTO `xpcms_area` VALUES ('652722', '精河县', '652700', '2');
INSERT INTO `xpcms_area` VALUES ('652723', '温泉县', '652700', '3');
INSERT INTO `xpcms_area` VALUES ('652801', '库尔勒市', '652800', '1');
INSERT INTO `xpcms_area` VALUES ('652822', '轮台县', '652800', '2');
INSERT INTO `xpcms_area` VALUES ('652823', '尉犁县', '652800', '3');
INSERT INTO `xpcms_area` VALUES ('652824', '若羌县', '652800', '4');
INSERT INTO `xpcms_area` VALUES ('652825', '且末县', '652800', '5');
INSERT INTO `xpcms_area` VALUES ('652826', '焉耆回族自治县', '652800', '6');
INSERT INTO `xpcms_area` VALUES ('652827', '和静县', '652800', '7');
INSERT INTO `xpcms_area` VALUES ('652828', '和硕县', '652800', '8');
INSERT INTO `xpcms_area` VALUES ('652829', '博湖县', '652800', '9');
INSERT INTO `xpcms_area` VALUES ('652901', '阿克苏市', '652900', '1');
INSERT INTO `xpcms_area` VALUES ('652922', '温宿县', '652900', '2');
INSERT INTO `xpcms_area` VALUES ('652923', '库车县', '652900', '3');
INSERT INTO `xpcms_area` VALUES ('652924', '沙雅县', '652900', '4');
INSERT INTO `xpcms_area` VALUES ('652925', '新和县', '652900', '5');
INSERT INTO `xpcms_area` VALUES ('652926', '拜城县', '652900', '6');
INSERT INTO `xpcms_area` VALUES ('652927', '乌什县', '652900', '7');
INSERT INTO `xpcms_area` VALUES ('652928', '阿瓦提县', '652900', '8');
INSERT INTO `xpcms_area` VALUES ('652929', '柯坪县', '652900', '9');
INSERT INTO `xpcms_area` VALUES ('653001', '阿图什市', '653000', '1');
INSERT INTO `xpcms_area` VALUES ('653022', '阿克陶县', '653000', '2');
INSERT INTO `xpcms_area` VALUES ('653023', '阿合奇县', '653000', '3');
INSERT INTO `xpcms_area` VALUES ('653024', '乌恰县', '653000', '4');
INSERT INTO `xpcms_area` VALUES ('653101', '喀什市', '653100', '1');
INSERT INTO `xpcms_area` VALUES ('653121', '疏附县', '653100', '2');
INSERT INTO `xpcms_area` VALUES ('653122', '疏勒县', '653100', '3');
INSERT INTO `xpcms_area` VALUES ('653123', '英吉沙县', '653100', '4');
INSERT INTO `xpcms_area` VALUES ('653124', '泽普县', '653100', '5');
INSERT INTO `xpcms_area` VALUES ('653125', '莎车县', '653100', '6');
INSERT INTO `xpcms_area` VALUES ('653126', '叶城县', '653100', '7');
INSERT INTO `xpcms_area` VALUES ('653127', '麦盖提县', '653100', '8');
INSERT INTO `xpcms_area` VALUES ('653128', '岳普湖县', '653100', '9');
INSERT INTO `xpcms_area` VALUES ('653129', '伽师县', '653100', '10');
INSERT INTO `xpcms_area` VALUES ('653130', '巴楚县', '653100', '11');
INSERT INTO `xpcms_area` VALUES ('653131', '塔什库尔干塔吉克自治县', '653100', '12');
INSERT INTO `xpcms_area` VALUES ('653201', '和田市', '653200', '1');
INSERT INTO `xpcms_area` VALUES ('653221', '和田县', '653200', '2');
INSERT INTO `xpcms_area` VALUES ('653222', '墨玉县', '653200', '3');
INSERT INTO `xpcms_area` VALUES ('653223', '皮山县', '653200', '4');
INSERT INTO `xpcms_area` VALUES ('653224', '洛浦县', '653200', '5');
INSERT INTO `xpcms_area` VALUES ('653225', '策勒县', '653200', '6');
INSERT INTO `xpcms_area` VALUES ('653226', '于田县', '653200', '7');
INSERT INTO `xpcms_area` VALUES ('653227', '民丰县', '653200', '8');
INSERT INTO `xpcms_area` VALUES ('654002', '伊宁市', '654000', '1');
INSERT INTO `xpcms_area` VALUES ('654003', '奎屯市', '654000', '2');
INSERT INTO `xpcms_area` VALUES ('654021', '伊宁县', '654000', '3');
INSERT INTO `xpcms_area` VALUES ('654022', '察布查尔锡伯自治县', '654000', '4');
INSERT INTO `xpcms_area` VALUES ('654023', '霍城县', '654000', '5');
INSERT INTO `xpcms_area` VALUES ('654024', '巩留县', '654000', '6');
INSERT INTO `xpcms_area` VALUES ('654025', '新源县', '654000', '7');
INSERT INTO `xpcms_area` VALUES ('654026', '昭苏县', '654000', '8');
INSERT INTO `xpcms_area` VALUES ('654027', '特克斯县', '654000', '9');
INSERT INTO `xpcms_area` VALUES ('654028', '尼勒克县', '654000', '10');
INSERT INTO `xpcms_area` VALUES ('654201', '塔城市', '654200', '1');
INSERT INTO `xpcms_area` VALUES ('654202', '乌苏市', '654200', '2');
INSERT INTO `xpcms_area` VALUES ('654221', '额敏县', '654200', '3');
INSERT INTO `xpcms_area` VALUES ('654223', '沙湾县', '654200', '4');
INSERT INTO `xpcms_area` VALUES ('654224', '托里县', '654200', '5');
INSERT INTO `xpcms_area` VALUES ('654225', '裕民县', '654200', '6');
INSERT INTO `xpcms_area` VALUES ('654226', '和布克赛尔蒙古自治县', '654200', '7');
INSERT INTO `xpcms_area` VALUES ('654301', '阿勒泰市', '654300', '1');
INSERT INTO `xpcms_area` VALUES ('654321', '布尔津县', '654300', '2');
INSERT INTO `xpcms_area` VALUES ('654322', '富蕴县', '654300', '3');
INSERT INTO `xpcms_area` VALUES ('654323', '福海县', '654300', '4');
INSERT INTO `xpcms_area` VALUES ('654324', '哈巴河县', '654300', '5');
INSERT INTO `xpcms_area` VALUES ('654325', '青河县', '654300', '6');
INSERT INTO `xpcms_area` VALUES ('654326', '吉木乃县', '654300', '7');
INSERT INTO `xpcms_area` VALUES ('659001', '石河子市', '659000', '1');
INSERT INTO `xpcms_area` VALUES ('659002', '阿拉尔市', '659000', '2');
INSERT INTO `xpcms_area` VALUES ('659003', '图木舒克市', '659000', '3');
INSERT INTO `xpcms_area` VALUES ('659004', '五家渠市', '659000', '4');
INSERT INTO `xpcms_area` VALUES ('810001', '香港', '810000', '1');
INSERT INTO `xpcms_area` VALUES ('810002', '中西区', '810001', '1');
INSERT INTO `xpcms_area` VALUES ('810003', '九龙城区', '810001', '2');
INSERT INTO `xpcms_area` VALUES ('810004', '南区', '810001', '3');
INSERT INTO `xpcms_area` VALUES ('810005', '黄大仙区', '810001', '4');
INSERT INTO `xpcms_area` VALUES ('810006', '油尖旺区', '810001', '5');
INSERT INTO `xpcms_area` VALUES ('810007', '葵青区', '810001', '6');
INSERT INTO `xpcms_area` VALUES ('810008', '西贡区', '810001', '7');
INSERT INTO `xpcms_area` VALUES ('810009', '屯门区', '810001', '8');
INSERT INTO `xpcms_area` VALUES ('810010', '荃湾区', '810001', '9');
INSERT INTO `xpcms_area` VALUES ('810011', '东区', '810001', '10');
INSERT INTO `xpcms_area` VALUES ('810012', '观塘区', '810001', '11');
INSERT INTO `xpcms_area` VALUES ('810013', '深水步区', '810001', '12');
INSERT INTO `xpcms_area` VALUES ('810014', '湾仔区', '810001', '13');
INSERT INTO `xpcms_area` VALUES ('810015', '离岛区', '810001', '14');
INSERT INTO `xpcms_area` VALUES ('810016', '北区', '810001', '15');
INSERT INTO `xpcms_area` VALUES ('810017', '沙田区', '810001', '16');
INSERT INTO `xpcms_area` VALUES ('810018', '大埔区', '810001', '17');
INSERT INTO `xpcms_area` VALUES ('810019', '元朗区', '810001', '18');
INSERT INTO `xpcms_area` VALUES ('820001', '澳门', '820000', '1');
INSERT INTO `xpcms_area` VALUES ('820002', '澳门', '820001', '1');
INSERT INTO `xpcms_area` VALUES ('710001', '台北市', '710000', '1');
INSERT INTO `xpcms_area` VALUES ('710002', '台北县', '710001', '1');
INSERT INTO `xpcms_area` VALUES ('710003', '基隆市', '710000', '2');
INSERT INTO `xpcms_area` VALUES ('910005', '中山市', '442000', '1');
INSERT INTO `xpcms_area` VALUES ('710004', '花莲县', '710003', '1');
INSERT INTO `xpcms_area` VALUES ('910006', '东莞市', '441900', '1');
INSERT INTO `xpcms_area` VALUES ('910010', '1111', '910007', '1');

-- ----------------------------
-- Table structure for xpcms_article
-- ----------------------------
DROP TABLE IF EXISTS `xpcms_article`;
CREATE TABLE `xpcms_article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '内容ID',
  `title` char(64) NOT NULL COMMENT '内容标题',
  `subtitle` char(64) NOT NULL DEFAULT '' COMMENT '内容副标题',
  `model_id` smallint(5) NOT NULL DEFAULT '0',
  `cate_id` smallint(5) NOT NULL DEFAULT '0' COMMENT '分类ID',
  `cover_img` varchar(255) NOT NULL DEFAULT '' COMMENT '文章封面图',
  `seo_title` varchar(255) NOT NULL DEFAULT '' COMMENT 'seo标题',
  `keyword` varchar(255) NOT NULL DEFAULT '' COMMENT 'seo key',
  `descs` varchar(255) NOT NULL DEFAULT '' COMMENT '文章摘要',
  `author` char(32) NOT NULL DEFAULT '' COMMENT '文章原创作者',
  `author_editor` varchar(32) NOT NULL DEFAULT '' COMMENT '文章编辑作者（转载）',
  `from_site` varchar(255) NOT NULL DEFAULT '' COMMENT '文章转载来源',
  `from_url` varchar(255) NOT NULL DEFAULT '' COMMENT '来源URL',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章记录创建时间',
  `edit_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章记录修改时间',
  `is_jump` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 跳转 0 不跳转',
  `jump_url` varchar(255) NOT NULL DEFAULT '' COMMENT '跳转地址',
  `hits` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击量',
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '操作管理员名称',
  `is_page` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '文章是否分页  0默认不分页，>1 具体页数',
  `is_comment` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否开启评论 0 不开启 1开启',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '文章状态 0 待发布（审核） 1已发布 2 逻辑删除 ',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COMMENT='新闻文章列表';

-- ----------------------------
-- Records of xpcms_article
-- ----------------------------
INSERT INTO `xpcms_article` VALUES ('3', 'Android Auto负责人解读谷歌战略 改变人车交互体验', 'Android Auto负责人解读谷歌战略 改变人车交互体验', '0', '20', '/storage/static/images/QmWRjZMI1PpbE9xzwKCDuPyDeMSAscP6sSr6R79X.png', 'Android Auto负责人解读谷歌战略 改变人车交互体验', '安卓,负责人', '腾讯科技讯 1月26日消息，据外媒报道，在过去的几年里，谷歌一直在悄无声息地为不需要使用智能手机的汽车开发基于安卓(Android)的操作系统。这套系统建立在Android P的基础上，比Android Auto现有版本要先进得多，后者只是将手机界面投射到汽车的车载信息娱乐设备屏幕上。与过去许多统建立在旧有安卓基础之上的信息娱乐系相比，谷歌的新系统也被认为是更强大的解决方案', '张灵通', '', '腾讯新闻', 'https://new.qq.com', '1548580183', '1566809314', '0', '', '62345', '0', '1', '1', '1');
INSERT INTO `xpcms_article` VALUES ('4', '安吉丽娜朱莉 | 招牌微笑依旧惊艳，44岁重回颜值巅峰', '安吉丽娜朱莉 | 招牌微笑依旧惊艳，44岁重回颜值巅峰', '0', '25', '/storage/static/images/rzHygVlYbHNbl5inerL0w2wfxO68YHVKajYp9tDM.png', '冷！零下52安吉丽娜朱莉 | 招牌微笑依旧惊艳，44岁重回颜值巅峰度极寒席卷美国 芝加哥“火烧铁轨”确保火车运行', '安吉丽娜朱莉 | 招牌微笑依旧惊艳，44岁重回颜值巅峰', '安吉丽娜朱莉 | 招牌微笑依旧惊艳，44岁重回颜值巅峰', '张灵通', '', '腾讯新闻', 'https://new.qq.com', '1548580183', '1582705159', '0', '', '12345', '0', '1', '1', '1');
INSERT INTO `xpcms_article` VALUES ('5', '王菲 | 50岁，依然是这个时代无法复制的孤本', '科技美学直播 全球首款2080显卡游戏本价值4万ROG超神2S开箱', '0', '35', '', '科技美学直播 全球首款2080显卡游戏本价值4万ROG超神2S开箱', '', '科技美学直播 全球首款2080显卡游戏本价值4万ROG超神2S开箱', '李灵通', '', '腾讯新闻', 'https://new.qq.com', '1548580183', '1566809279', '0', '', '23456', '0', '1', '0', '1');
INSERT INTO `xpcms_article` VALUES ('6', '顶着比伯师妹身份出道 20岁还是新一代带货小天后', '顶着比伯师妹身份出道 20岁还是新一代带货小天后', '0', '22', '', '顶着比伯师妹身份出道 20岁还是新一代带货小天后', '顶着比伯师妹身份出道 20岁还是新一代带货小天后', '顶着比伯师妹身份出道 20岁还是新一代带货小天后', 'php.cn', '', 'php中文网', 'https://www.php.cn', '1548580183', '1566808443', '0', '', '67890', '0', '1', '0', '1');
INSERT INTO `xpcms_article` VALUES ('7', '成龙上榜《福布斯》2019全球收入最高男演员', '成龙上榜《福布斯》2019全球收入最高男演员', '0', '46', '/storage/static/images/rkMDOLmsjLch75YfOycyqjp8XgAEfQb2NMXCSYNL.jpeg', '成龙上榜《福布斯》2019全球收入最高男演员', '成龙上榜《福布斯》2019全球收入最高男演员', '成龙上榜《福布斯》2019全球收入最高男演员', '新浪时尚', '', 'sina', 'http://fashion.sina.com.cn/l/fa/2019-08-22/1745/doc-ihytcern2771863.shtml', '1563875463', '1566977409', '0', '', '0', '0', '0', '1', '1');
INSERT INTO `xpcms_article` VALUES ('8', 'Kendall Jenner成社交媒体上最受欢迎的超模', 'Kendall Jenner成社交媒体上最受欢迎的超模', '0', '26', '', 'Kendall Jenner成社交媒体上最受欢迎的超模', '444Kendall Jenner成社交媒体上最受欢迎的超模', '555Kendall Jenner成社交媒体上最受欢迎的超模Kendall Jenner成社交媒体上最受欢迎的超模', '新浪时尚', '', '新浪', 'http://fashion.sina.com.cn/l/fa/2019-08-15/1555/doc-ihytcern1041514.shtml', '1563875514', '1566808844', '0', '', '0', '0', '0', '1', '1');
INSERT INTO `xpcms_article` VALUES ('9', 'Jason Morgan|体育老师出身 连续十年拥有大牌合约的神话', 'Jason Morgan|体育老师出身 连续十年拥有大牌合约的神话', '0', '46', '/storage/static/images/AFEaSChgLLustcv2zNE5J7k2GXFJ4TBD4GwT2TzO.jpeg', 'Jason Morgan|体育老师出身 连续十年拥有大牌合约的神话', 'Jason Morgan|体育老师出身 连续十年拥有大牌合约的神话', 'Jason Morgan|体育老师出身 连续十年拥有大牌合约的神话', '新浪时尚', '', '腾讯新闻', 'http://fashion.sina.com.cn/l/fa/2019-08-14/1144/doc-ihytcern0725059.shtml', '1563875586', '1566977465', '0', '', '0', '0', '0', '0', '1');
INSERT INTO `xpcms_article` VALUES ('10', 'Kristina ｜三岁拍平面四岁走秀 长得美的13岁是什么样子', 'Kristina ｜三岁拍平面四岁走秀 长得美的13岁是什么样子', '0', '43', '', 'Kristina ｜三岁拍平面四岁走秀 长得美的13岁是什么样子', 'Kristina ｜三岁拍平面四岁走秀 长得美的13岁是什么样子', 'Kristina ｜三岁拍平面四岁走秀 长得美的13岁是什么样子', '新浪时尚', '', 'php中文网', 'http://fashion.sina.com.cn/l/fa/2019-08-13/0033/doc-ihytcern0378835.shtml', '1563876169', '1566808959', '0', '', '0', '0', '0', '1', '1');
INSERT INTO `xpcms_article` VALUES ('15', '林忆莲林俊杰等群星云集“突破想象 凯迪拉克品牌之夜” 全新一代凯迪拉克CT6上市', '林忆莲林俊杰等群星云集“突破想象 凯迪拉克品牌之夜” 全新一代凯迪拉克CT6上市', '0', '43', '', '林忆莲林俊杰等群星云集“突破想象 凯迪拉克品牌之夜” 全新一代凯迪拉克CT6上市', '林忆莲林俊杰等群星云集“突破想象 凯迪拉克品牌之夜” 全新一代凯迪拉克CT6上市', '林忆莲林俊杰等群星云集“突破想象 凯迪拉克品牌之夜” 全新一代凯迪拉克CT6上市', '新浪时尚', '', 'php中文网', 'http://fashion.sina.com.cn/2018-12-03/1203/doc-ihprknvs7714700.shtml', '1566810847', '1566810896', '0', '', '0', '0', '0', '0', '1');
INSERT INTO `xpcms_article` VALUES ('16', '凯迪拉克荣誉呈现 “北京当代•艺术展” 2018', '凯迪拉克荣誉呈现 “北京当代•艺术展” 2018', '0', '43', '', '凯迪拉克荣誉呈现 “北京当代•艺术展” 2018', '凯迪拉克荣誉呈现 “北京当代•艺术展” 2018', '凯迪拉克荣誉呈现 “北京当代•艺术展” 2018', '新浪时尚', '', '腾讯新闻', 'http://fashion.sina.com.cn/l/fa/2019-08-15/1555/doc-ihytcern1041514.shtml', '1566810994', '1566810994', '0', '', '0', '0', '0', '0', '1');
INSERT INTO `xpcms_article` VALUES ('17', '路虎卫士上市时间曝光！将于下月正式首发', '路虎卫士上市时间曝光！将于下月正式首发', '0', '22', '', '路虎卫士上市时间曝光！将于下月正式首发', '路虎卫士上市时间曝光！将于下月正式首发', '路虎卫士上市时间曝光！将于下月正式首发', '新浪汽车', '', '新浪汽车', 'http://auto.sina.com.cn/newcar/h/2019-08-28/detail-ihytcitn2531205.shtml', '1566974106', '1566974106', '0', '', '0', '0', '0', '0', '1');
INSERT INTO `xpcms_article` VALUES ('18', '选配也有折扣 保时捷Macan限时巨幅优惠', '选配也有折扣 保时捷Macan限时巨幅优惠', '0', '22', '', '选配也有折扣 保时捷Macan限时巨幅优惠', '选配也有折扣 保时捷Macan限时巨幅优惠', '选配也有折扣 保时捷Macan限时巨幅优惠', '新浪汽车', '', '新浪汽车', 'http://auto.sina.com.cn/info/cx/2019-08-09/detail-ihytcitm7987767.shtml?hqid=11004', '1566974180', '1566974180', '0', '', '0', '0', '0', '0', '1');
INSERT INTO `xpcms_article` VALUES ('19', '起售价约合人民币22万 标致e-208公布英国市场售价', '起售价约合人民币22万 标致e-208公布英国市场售价', '0', '22', '', '起售价约合人民币22万 标致e-208公布英国市场售价', '起售价约合人民币22万 标致e-208公布英国市场售价', '起售价约合人民币22万 标致e-208公布英国市场售价', '新浪汽车', '', '新浪汽车', 'http://auto.sina.com.cn/newcar/h/2019-08-28/detail-ihytcitn2510669.shtml', '1566974229', '1566974229', '0', '', '0', '0', '0', '0', '1');
INSERT INTO `xpcms_article` VALUES ('20', '首款国产AMG 北京奔驰AMG A 35 L成都车展开启预售', '首款国产AMG 北京奔驰AMG A 35 L成都车展开启预售', '0', '22', '', '首款国产AMG 北京奔驰AMG A 35 L成都车展开启预售', '首款国产AMG 北京奔驰AMG A 35 L成都车展开启预售', '首款国产AMG 北京奔驰AMG A 35 L成都车展开启预售', '新浪汽车', '', '新浪汽车', 'http://auto.sina.com.cn/newcar/x/2019-08-28/detail-ihytcern4155827.shtml', '1566974266', '1566974266', '0', '', '0', '0', '0', '0', '1');
INSERT INTO `xpcms_article` VALUES ('21', '法兰克福车展亮相 宝马X6纯黑色特别版官图曝光', '法兰克福车展亮相 宝马X6纯黑色特别版官图曝光', '0', '22', '', '法兰克福车展亮相 宝马X6纯黑色特别版官图曝光', '法兰克福车展亮相 宝马X6纯黑色特别版官图曝光', '法兰克福车展亮相 宝马X6纯黑色特别版官图曝光', '新浪汽车', '', '新浪汽车', 'http://auto.sina.com.cn/newcar/h/2019-08-28/detail-ihytcern4153609.shtml', '1566974308', '1566974308', '0', '', '0', '0', '0', '0', '1');
INSERT INTO `xpcms_article` VALUES ('22', '荣威RX5 MAX今晚上市 预售14.98万元起', '荣威RX5 MAX今晚上市 预售14.98万元起', '0', '22', '', '荣威RX5 MAX今晚上市 预售14.98万元起', '荣威RX5 MAX今晚上市 预售14.98万元起', '荣威RX5 MAX今晚上市 预售14.98万元起', '新浪汽车', '', '新浪汽车', 'http://auto.sina.com.cn/newcar/x/2019-08-28/detail-ihytcern4130126.shtml', '1566974434', '1566974434', '0', '', '0', '0', '0', '0', '1');
INSERT INTO `xpcms_article` VALUES ('23', '换家族新设计 奔驰GLE Coupe/GLE53发布', '换家族新设计 奔驰GLE Coupe/GLE53发布', '0', '22', '', '换家族新设计 奔驰GLE Coupe/GLE53发布', '换家族新设计 奔驰GLE Coupe/GLE53发布', '换家族新设计 奔驰GLE Coupe/GLE53发布', '新浪汽车', '', '新浪汽车', 'http://auto.sina.com.cn/newcar/h/2019-08-28/detail-ihytcitn2465319.shtml', '1566974477', '1566974477', '0', '', '0', '0', '0', '0', '1');
INSERT INTO `xpcms_article` VALUES ('24', '宝马X3 M/X4 M领衔多款新车上市 售价83.99万起', '宝马X3 M/X4 M领衔多款新车上市 售价83.99万起', '0', '22', '', '宝马X3 M/X4 M领衔多款新车上市 售价83.99万起', '宝马X3 M/X4 M领衔多款新车上市 售价83.99万起', '宝马X3 M/X4 M领衔多款新车上市 售价83.99万起', '新浪汽车', '', '新浪汽车', 'http://auto.sina.com.cn/newcar/j/2019-08-27/detail-ihytcern3996744.shtml', '1566974522', '1566974522', '0', '', '0', '0', '0', '0', '1');
INSERT INTO `xpcms_article` VALUES ('25', '华为P30全新配色曝光 撞色设计带来不一样的高颜值', '华为P30全新配色曝光 撞色设计带来不一样的高颜值', '0', '24', '', '华为P30全新配色曝光 撞色设计带来不一样的高颜值', '华为P30全新配色曝光 撞色设计带来不一样的高颜值', '华为P30全新配色曝光 撞色设计带来不一样的高颜值', '小米原创', '', '小米原创', 'https://www.mi.com', '1566974784', '1566974784', '0', '', '0', '0', '0', '0', '1');
INSERT INTO `xpcms_article` VALUES ('26', '董明珠雷军开启新赌约：这次不要10个亿 再赌5年！', '董明珠雷军开启新赌约：这次不要10个亿 再赌5年！', '0', '24', '', '董明珠雷军开启新赌约：这次不要10个亿 再赌5年！', '董明珠雷军开启新赌约：这次不要10个亿 再赌5年！', '董明珠雷军开启新赌约：这次不要10个亿 再赌5年！', '小米原创', '', '小米原创', 'https://www.php.cn', '1566974828', '1566974828', '0', '', '0', '0', '0', '0', '1');
INSERT INTO `xpcms_article` VALUES ('27', '你眼里的星海', '你眼里的星海', '0', '40', '/storage/static/images/x45to8flMZJgvBsjIqI4zC5MjrAw1EZeFC1erSsu.jpeg', '你眼里的星海', '你眼里的星海', '你眼里的星海', 'php.cn', '', '777', 'https://www.php.cn', '1566976984', '1566976984', '0', '', '0', '0', '0', '0', '1');
INSERT INTO `xpcms_article` VALUES ('28', '复古房间中的柔美少女 轻奢自在的随心生活', '复古房间中的柔美少女 轻奢自在的随心生活', '0', '40', '/storage/static/images/oDb7UqJYUi5nO91HKS0Nr2TsXmVencwvFfrFgWlk.jpeg', '复古房间中的柔美少女 轻奢自在的随心生活', '复古房间中的柔美少女 轻奢自在的随心生活', '复古房间中的柔美少女 轻奢自在的随心生活', 'php.cn', '', '777', 'https://www.php.cn', '1566977102', '1566977102', '0', '', '0', '0', '0', '0', '1');
INSERT INTO `xpcms_article` VALUES ('29', '丽人行', '丽人行', '0', '40', '/storage/static/images/pX8GF26GEXXwkDaHGNPIFmlcE2sQsc0UBr7zuzWn.jpeg', '丽人行', '丽人行', '丽人行', 'php.cn', '', '腾讯新闻', 'https://www.php.cn', '1566977158', '1566977158', '0', '', '0', '0', '0', '0', '1');
INSERT INTO `xpcms_article` VALUES ('30', '南湖人像外拍', '南湖人像外拍', '0', '40', '/storage/static/images/vw196dClq3YbQFIurpoZgmAlUGM2IqTCknW4LrtU.jpeg', '南湖人像外拍', '南湖人像外拍', '南湖人像外拍', 'php.cn', '', 'php中文网', 'https://www.php.cn', '1566977263', '1566977263', '0', '', '0', '0', '0', '0', '1');
INSERT INTO `xpcms_article` VALUES ('31', '校园少年', '校园少年', '0', '47', '/storage/static/images/X6FQ30RiLdOfpunMJMli16sA56lsc1nbli6eKMqw.jpeg', '校园少年', '校园少年', '校园少年', 'php.cn', '', 'php中文网', 'https://www.php.cn', '1566977592', '1566977614', '0', '', '0', '0', '0', '0', '1');
INSERT INTO `xpcms_article` VALUES ('32', '卡通丧尸', '卡通丧尸', '0', '47', '/storage/static/images/E5t5O0X1VwZUudMP8HrMYLIRXcyGgYOKUGkxvinw.jpeg', '卡通丧尸', '卡通丧尸', '卡通丧尸', 'php.cn', '', 'php中文网', 'https://www.php.cn', '1566977658', '1566977658', '0', '', '0', '0', '0', '0', '1');
INSERT INTO `xpcms_article` VALUES ('33', '俄罗斯卡通人物', '俄罗斯卡通人物', '0', '47', '/storage/static/images/NxZ9Dx36V4qq2yfW0w7bXXCI1QpDxZODY2wr9MPw.jpeg', '俄罗斯卡通人物', '俄罗斯卡通人物', '俄罗斯卡通人物', 'php.cn', '', 'php中文网', 'https://www.php.cn', '1566977715', '1566977715', '0', '', '0', '0', '0', '0', '1');
INSERT INTO `xpcms_article` VALUES ('34', '粉色系小仙女', '粉色系小仙女', '0', '47', '/storage/static/images/N6Emm72xNxWTdgI0dqM5iykfxA1yzLFl9hzBbm2P.jpeg', '粉色系小仙女', '粉色系小仙女', '粉色系小仙女', 'php.cn', '', 'php中文网', 'https://www.php.cn', '1566977860', '1566977860', '0', '', '0', '0', '0', '0', '1');
INSERT INTO `xpcms_article` VALUES ('35', '吴彦祖微博发文斥责被造谣支持“港独”', '香港第一帅哥', '0', '46', '/storage/static/images/8AhUWr0BlsBZ7ugmSNGfMeqX9lunzRcxKRRXQfe2.jpeg', '香港第一帅哥', '香港第一帅哥', '香港第一帅哥', 'php.cn', '', 'php中文网', 'https://www.php.cn', '1566978357', '1566978628', '0', '', '0', '0', '0', '0', '1');
INSERT INTO `xpcms_article` VALUES ('36', '仅一首歌,红了一辈子的8位明星,不信你不会这些歌', '仅一首歌,红了一辈子的8位明星,不信你不会这些歌', '0', '46', '/storage/static/images/I5RDVHs5eZ1siLuDw3G1PYVblGjMapeBeIizQwQL.jpeg', '仅一首歌,红了一辈子的8位明星,不信你不会这些歌', '仅一首歌,红了一辈子的8位明星,不信你不会这些歌', '仅一首歌,红了一辈子的8位明星,不信你不会这些歌', 'php.cn', '', 'php中文网', 'https://www.php.cn', '1566978437', '1566978437', '0', '', '0', '0', '0', '0', '1');
INSERT INTO `xpcms_article` VALUES ('44', '测试', '测试', '0', '20', '', '', '', '', '', '', '', '', '1582717530', '1582717530', '0', '', '0', '0', '0', '1', '1');
INSERT INTO `xpcms_article` VALUES ('45', '测试3', '测试3', '0', '22', '', '', '', '', '', '', '', '', '1582717560', '1582717576', '0', '', '0', '0', '0', '1', '1');
INSERT INTO `xpcms_article` VALUES ('40', '测试标题测试标题测试标题测试标', '测试标题2', '0', '20', '/storage/static/images/6VZiwGa3Ei6oKe5pVEBShi2aE0YwI8ZtEsmYvVL6.jpeg', '测试标题3', '测试标题4', '测试标题5', '测试标题6', '', '', '测试标题7', '1582638747', '1582717281', '0', '', '0', '0', '0', '1', '1');
INSERT INTO `xpcms_article` VALUES ('42', '测试', '测试', '0', '20', '', '测试', '测试', '测试', '测试', '', '', '测试', '1582717407', '1582717407', '0', '', '0', '0', '0', '1', '1');
INSERT INTO `xpcms_article` VALUES ('47', '第二期 停学不停课|2月15日亲子小任务课程表', '', '0', '20', '', '', '', '', '', '', '', '', '1583069598', '1583069618', '0', '', '0', '0', '0', '1', '1');

-- ----------------------------
-- Table structure for xpcms_article_category
-- ----------------------------
DROP TABLE IF EXISTS `xpcms_article_category`;
CREATE TABLE `xpcms_article_category` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT COMMENT '文章分类ID',
  `model_id` tinyint(5) NOT NULL DEFAULT '0',
  `pid` int(5) unsigned NOT NULL DEFAULT '0' COMMENT '分类父ID',
  `title` varchar(32) NOT NULL COMMENT '文章分类名称',
  `code` varchar(32) NOT NULL DEFAULT '' COMMENT '英文别名',
  `seo_title` varchar(255) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  `descs` varchar(255) NOT NULL DEFAULT '',
  `index_url` varchar(150) NOT NULL DEFAULT '' COMMENT '首页自定义url',
  `list_url` varchar(150) NOT NULL DEFAULT '' COMMENT '列表页自定义url',
  `detail_url` varchar(150) NOT NULL DEFAULT '' COMMENT '列表页自定义url',
  `cover_img` varchar(255) NOT NULL DEFAULT '' COMMENT '频道封面图',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类创建时间',
  `edit_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类修改时间',
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '操作管理员ID',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '分类状态 0启用，1禁用',
  `index_tpl` varchar(150) NOT NULL DEFAULT '' COMMENT '首页模板',
  `list_tpl` varchar(150) NOT NULL DEFAULT '' COMMENT '列表页模板',
  `detail_tpl` varchar(150) NOT NULL DEFAULT '' COMMENT '内容页模板',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COMMENT='文章分类表';

-- ----------------------------
-- Records of xpcms_article_category
-- ----------------------------
INSERT INTO `xpcms_article_category` VALUES ('20', '2', '27', '器材', '', '器材seo标题', '器材keywords', '器材描述内容', '/{modelName}-{cid}.html', '/{modelName}-{cid}.html', '/{modelName}-{cid}-{aid}.html', '', '1566615868', '1566615868', '1', '0', 'index1', 'list1', 'detail1');
INSERT INTO `xpcms_article_category` VALUES ('21', '2', '28', '大师', '', '大师seo标题', '大师seo关键词', '大师seo描述', '/{modelName}-{cid}.html', '/{modelName}-{cid}.html', '/{modelName}-{cid}-{aid}.html', '', '1566625312', '1566625312', '1', '0', 'index1', 'list1', 'detail1');
INSERT INTO `xpcms_article_category` VALUES ('22', '2', '28', '汽车', '', '汽车seo标题', '汽车seo关键词', '汽车seo描述', '/{modelName}-{cid}.html', '/{modelName}-{cid}.html', '/{modelName}-{cid}-{aid}.html', '', '1566625312', '1566625312', '1', '0', 'index1', 'list1', 'detail1');
INSERT INTO `xpcms_article_category` VALUES ('23', '2', '28', '影赛', '', '影赛seo标题', '影赛seo关键词', '影赛seo描述', '/{modelName}-{cid}.html', '/{modelName}-{cid}.html', '/{modelName}-{cid}-{aid}.html', '', '1566625312', '1566625312', '1', '0', 'index1', 'list1', 'detail1');
INSERT INTO `xpcms_article_category` VALUES ('24', '2', '28', '手机', '', '手机seo标题', '手机seo关键词', '手机seo描述', '/{modelName}-{cid}.html', '/{modelName}-{cid}.html', '/{modelName}-{cid}-{aid}.html', '', '1566625312', '1566625312', '1', '0', 'index1', 'list1', 'detail1');
INSERT INTO `xpcms_article_category` VALUES ('25', '2', '28', '学院', '', '学院seo标题', '学院seo关键词', '学院seo描述', '/{modelName}-{cid}.html', '/{modelName}-{cid}.html', '/{modelName}-{cid}-{aid}.html', '', '1566625312', '1566625312', '1', '0', 'index1', 'list1', 'detail1');
INSERT INTO `xpcms_article_category` VALUES ('26', '2', '28', '行摄', '', '行摄seo标题', '行摄seo关键词', '行摄seo描述', '/{modelName}-{cid}.html', '/{modelName}-{cid}.html', '/{modelName}-{cid}-{aid}.html', '', '1566625312', '1566625312', '1', '0', 'index1', 'list1', 'detail1');
INSERT INTO `xpcms_article_category` VALUES ('27', '2', '28', '活动', '', '活动seo标题', '活动seo关键词', '活动seo描述', '/{modelName}-{cid}.html', '/{modelName}-{cid}.html', '/{modelName}-{cid}-{aid}.html', '', '1566625312', '1566625312', '1', '0', 'index1', 'list1', 'detail1');
INSERT INTO `xpcms_article_category` VALUES ('28', '2', '0', '资讯看学', 'article', '资讯看学seo标题', '资讯看学seo关键词', '资讯看学seo描述', '/{modelName}-{cid}.html', '/{modelName}-{cid}.html', '/{modelName}-{cid}-{aid}.html', '', '1566625312', '1566804067', '1', '0', 'index1', 'list1', 'detail1');
INSERT INTO `xpcms_article_category` VALUES ('29', '2', '0', '小皮头条', 'toutiao', '小皮头条seo标题', '小皮头条seo关键词', '小皮头条eo描述', '/{modelName}-{cid}.html', '/{modelName}-{cid}.html', '/{modelName}-{cid}-{aid}.html', '', '1566625312', '1566804079', '1', '0', 'index1', 'list1', 'detail1');
INSERT INTO `xpcms_article_category` VALUES ('30', '2', '0', '今日资讯', 'today', '今日资讯seo标题', '今日资讯seo关键词', '今日资讯eo描述', '/{modelName}-{cid}.html', '/{modelName}-{cid}.html', '/{modelName}-{cid}-{aid}.html', '', '1566625312', '1566804087', '1', '0', 'index1', 'list1', 'detail1');
INSERT INTO `xpcms_article_category` VALUES ('31', '2', '29', '基础', '', '活动seo标题', '活动seo关键词', '活动seo描述', '/{modelName}-{cid}.html', '/{modelName}-{cid}.html', '/{modelName}-{cid}-{aid}.html', '', '1566625312', '1566625312', '1', '0', 'index1', 'list1', 'detail1');
INSERT INTO `xpcms_article_category` VALUES ('32', '2', '29', '人像', '', '人像seo标题', '人像seo关键词', '人像seo描述', '/{modelName}-{cid}.html', '/{modelName}-{cid}.html', '/{modelName}-{cid}-{aid}.html', '', '1566625312', '1566625312', '1', '0', 'index1', 'list1', 'detail1');
INSERT INTO `xpcms_article_category` VALUES ('33', '2', '29', '后期', '', '后期seo标题', '后期seo关键词', '后期seo描述', '/{modelName}-{cid}.html', '/{modelName}-{cid}.html', '/{modelName}-{cid}-{aid}.html', '', '1566625312', '1566625312', '1', '0', 'index1', 'list1', 'detail1');
INSERT INTO `xpcms_article_category` VALUES ('34', '2', '29', '器材', '', '器材seo标题', '器材seo关键词', '器材seo描述', '/{modelName}-{cid}.html', '/{modelName}-{cid}.html', '/{modelName}-{cid}-{aid}.html', '', '1566625312', '1566625312', '1', '0', 'index1', 'list1', 'detail1');
INSERT INTO `xpcms_article_category` VALUES ('35', '2', '0', '图集大全', 'image', '图集大全seo标题', '图集大全seo关键词', '图集大全eo描述', '/{modelName}-{cid}.html', '/{modelName}-{cid}.html', '/{modelName}-{cid}-{aid}.html', '', '1566625312', '1566804094', '1', '0', 'index1', 'list1', 'detail1');
INSERT INTO `xpcms_article_category` VALUES ('36', '2', '30', '经济', '', '经济seo标题', '经济seo关键词', '经济seo描述', '/{modelName}-{cid}.html', '/{modelName}-{cid}.html', '/{modelName}-{cid}-{aid}.html', '', '1566625312', '1566625312', '1', '0', 'index1', 'list1', 'detail1');
INSERT INTO `xpcms_article_category` VALUES ('37', '2', '30', '本地', '', '本地seo标题', '本地seo关键词', '本地seo描述', '/{modelName}-{cid}.html', '/{modelName}-{cid}.html', '/{modelName}-{cid}-{aid}.html', '', '1566625312', '1566625312', '1', '0', 'index1', 'list1', 'detail1');
INSERT INTO `xpcms_article_category` VALUES ('38', '2', '30', '娱乐', '', '娱乐seo标题', '娱乐seo关键词', '娱乐seo描述', '/{modelName}-{cid}.html', '/{modelName}-{cid}.html', '/{modelName}-{cid}-{aid}.html', '', '1566625312', '1566625312', '1', '0', 'index1', 'list1', 'detail1');
INSERT INTO `xpcms_article_category` VALUES ('39', '2', '30', '体育', '', '体育seo标题', '体育seo关键词', '体育seo描述', '/{modelName}-{cid}.html', '/{modelName}-{cid}.html', '/{modelName}-{cid}-{aid}.html', '', '1566625312', '1566625312', '1', '0', 'index1', 'list1', 'detail1');
INSERT INTO `xpcms_article_category` VALUES ('40', '2', '35', '美女', '', '美女seo标题', '美女seo关键词', '美女seo描述', '/{modelName}-{cid}.html', '/{modelName}-{cid}.html', '/{modelName}-{cid}-{aid}.html', '', '1566625312', '1566625312', '1', '0', 'index1', 'list1', 'detail1');
INSERT INTO `xpcms_article_category` VALUES ('41', '2', '35', '风景', '', '风景seo标题', '风景seo关键词', '风景seo描述', '/{modelName}-{cid}.html', '/{modelName}-{cid}.html', '/{modelName}-{cid}-{aid}.html', '', '1566625312', '1566625312', '1', '0', 'index1', 'list1', 'detail1');
INSERT INTO `xpcms_article_category` VALUES ('42', '2', '35', '卡通', '', '卡通seo标题', '卡通seo关键词', '卡通seo描述', '/{modelName}-{cid}.html', '/{modelName}-{cid}.html', '/{modelName}-{cid}-{aid}.html', '', '1566625312', '1566625312', '1', '0', 'index1', 'list1', 'detail1');
INSERT INTO `xpcms_article_category` VALUES ('43', '2', '35', '人像', '', '人像seo标题', '人像seo关键词', '人像seo描述', '/{modelName}-{cid}.html', '/{modelName}-{cid}.html', '/{modelName}-{cid}-{aid}.html', '', '1566625312', '1566625312', '1', '0', 'index1', 'list1', 'detail1');
INSERT INTO `xpcms_article_category` VALUES ('44', '2', '35', '生态', '', '生态seo标题', '生态seo关键词', '生态seo描述', '/{modelName}-{cid}.html', '/{modelName}-{cid}.html', '/{modelName}-{cid}-{aid}.html', '', '1566625312', '1566625312', '1', '0', 'index1', 'list1', 'detail1');
INSERT INTO `xpcms_article_category` VALUES ('45', '2', '35', '地方', '', '地方seo标题', '地方seo关键词', '地方seo描述', '/{modelName}-{cid}.html', '/{modelName}-{cid}.html', '/{modelName}-{cid}-{aid}.html', '', '1566625312', '1566625312', '1', '0', 'index1', 'list1', 'detail1');
INSERT INTO `xpcms_article_category` VALUES ('46', '2', '35', '帅哥', '', '帅哥seo标题', '帅哥seo关键词', '帅哥seo描述', '/{modelName}-{cid}.html', '/{modelName}-{cid}.html', '/{modelName}-{cid}-{aid}.html', '', '1566625312', '1566625312', '1', '0', 'index1', 'list1', 'detail1');
INSERT INTO `xpcms_article_category` VALUES ('47', '2', '35', '卡通', '', '卡通seo标题', '卡通seo关键词', '卡通seo描述', '/{modelName}-{cid}.html', '/{modelName}-{cid}.html', '/{modelName}-{cid}-{aid}.html', '', '1566625312', '1566625312', '1', '0', 'index1', 'list1', 'detail1');
INSERT INTO `xpcms_article_category` VALUES ('48', '2', '35', '花草', '', '花草seo标题', '花草seo关键词', '花草seo描述', '/{modelName}-{cid}.html', '/{modelName}-{cid}.html', '/{modelName}-{cid}-{aid}.html', '', '1566625312', '1566625312', '1', '0', 'index1', 'list1', 'detail1');
INSERT INTO `xpcms_article_category` VALUES ('49', '2', '35', '特写', '', '特写seo标题', '特写seo关键词', '特写seo描述', '/{modelName}-{cid}.html', '/{modelName}-{cid}.html', '/{modelName}-{cid}-{aid}.html', '', '1566625312', '1566625312', '1', '0', 'index1', 'list1', 'detail1');
INSERT INTO `xpcms_article_category` VALUES ('50', '0', '0', '测试标题', '', '测试标题', '测试标题', '测试内容', '', '', '', '', '0', '1582895280', '0', '0', '', '', '');
INSERT INTO `xpcms_article_category` VALUES ('51', '0', '50', '测试标题1', '测试标题1', '测试标题1', '测试标题1', '0000', '', '', '', '', '1582893925', '1582895139', '0', '0', '', '', '');
INSERT INTO `xpcms_article_category` VALUES ('52', '0', '50', '测试标题2', '测试标题2', '测试标题2', '测试标题2', '测试标题2', '', '', '', '', '1582893998', '1582893998', '0', '0', '', '', '');

-- ----------------------------
-- Table structure for xpcms_article_category_content
-- ----------------------------
DROP TABLE IF EXISTS `xpcms_article_category_content`;
CREATE TABLE `xpcms_article_category_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cat_id` int(8) NOT NULL DEFAULT '0' COMMENT '分类ID',
  `content` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xpcms_article_category_content
-- ----------------------------
INSERT INTO `xpcms_article_category_content` VALUES ('1', '18', '&lt;p&gt;工工工工工工工工工工工工工工工工工工工工工&lt;/p&gt;');
INSERT INTO `xpcms_article_category_content` VALUES ('2', '19', '&lt;p&gt;工工工工工工工工工工工工工工工工工工工工工&lt;/p&gt;');
INSERT INTO `xpcms_article_category_content` VALUES ('3', '1', '&lt;p&gt;					&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;塔顶栽植塔顶塔式恭恭敬敬恭恭敬敬恭恭敬敬恭恭敬敬恭恭敬敬恭恭敬敬恭恭敬敬恭恭敬敬恭恭敬敬恭恭敬敬恭恭敬敬恭恭敬敬恭恭敬敬恭恭敬敬恭恭敬敬恭恭敬敬恭恭敬敬恭恭敬敬恭恭敬敬恭恭敬敬恭恭敬敬恭恭敬敬恭恭敬敬恭恭敬敬恭恭敬敬恭恭敬敬恭恭敬敬恭恭敬敬恭恭敬敬恭恭敬敬恭恭敬敬恭恭敬敬恭恭敬敬恭恭敬敬恭恭敬敬恭恭敬敬恭恭敬敬恭恭敬敬恭恭敬敬恭恭敬敬恭恭敬敬恭恭敬敬恭恭敬敬恭恭敬敬恭恭敬敬恭恭敬敬工&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;\n				&lt;/p&gt;');

-- ----------------------------
-- Table structure for xpcms_article_cid
-- ----------------------------
DROP TABLE IF EXISTS `xpcms_article_cid`;
CREATE TABLE `xpcms_article_cid` (
  `article_cid` int(10) NOT NULL AUTO_INCREMENT COMMENT '所有内容ID',
  PRIMARY KEY (`article_cid`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='新闻文章列表';

-- ----------------------------
-- Records of xpcms_article_cid
-- ----------------------------
INSERT INTO `xpcms_article_cid` VALUES ('1');
INSERT INTO `xpcms_article_cid` VALUES ('2');
INSERT INTO `xpcms_article_cid` VALUES ('3');
INSERT INTO `xpcms_article_cid` VALUES ('4');
INSERT INTO `xpcms_article_cid` VALUES ('5');
INSERT INTO `xpcms_article_cid` VALUES ('6');
INSERT INTO `xpcms_article_cid` VALUES ('7');
INSERT INTO `xpcms_article_cid` VALUES ('8');
INSERT INTO `xpcms_article_cid` VALUES ('9');

-- ----------------------------
-- Table structure for xpcms_article_content
-- ----------------------------
DROP TABLE IF EXISTS `xpcms_article_content`;
CREATE TABLE `xpcms_article_content` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `aid` int(11) NOT NULL COMMENT '文章ID',
  `contents` text NOT NULL COMMENT '文章内容',
  `page_id` smallint(5) NOT NULL DEFAULT '1' COMMENT '文章内容分页ID 默认第一页',
  PRIMARY KEY (`id`),
  KEY `article_id` (`aid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xpcms_article_content
-- ----------------------------
INSERT INTO `xpcms_article_content` VALUES ('3', '3', '<p class=\"one-p\"><img src=\"//inews.gtimg.com/newsapp_bt/0/7463916893/1000\" class=\"content-picture\"/></p><p class=\"one-p\">腾讯科技讯 1月26日消息，据外媒报道，在过去的几年里，谷歌一直在悄无声息地为不需要使用智能手机的汽车开发基于安卓(Android)的操作系统。这套系统建立在Android P的基础上，比Android Auto现有版本要先进得多，后者只是将手机界面投射到汽车的车载信息娱乐设备屏幕上。与过去许多统建立在旧有安卓基础之上的信息娱乐系相比，谷歌的新系统也被认为是更强大的解决方案。</p><p class=\"one-p\">不过，我们即将更熟悉这款新的车载安卓系统体验。谷歌已经与沃尔沃(Volvo)和奥迪(Audi)达成协议，将在2020年开始推出这些系统。而在过去的一年里，我们已经看到了它们的许多细节。这套基于安卓的新系统将提供现代Android Auto带来的好处，比如在Google Play在线商店上访问汽车认证应用生态系统。</p><p class=\"one-p\">谷歌的新系统将进入汽车的系统级操作中，这意味着你可以命令Google Assistant打开暖风，关闭座椅暖气，甚至预订维修预约服务。该系统还可定制，以适应汽车制造商的不同风格，使他们比计划中的Android Auto(或苹果CarPlay)拥有更多的控制权。这就为车载信息娱乐系统未来开启了各种有趣的新问题。谷歌过去就曾参与过平台之战，这是那场战争的延续吗？我们要承受多少巨变之痛？谷歌是如何看待汽车上这些不同版本安卓系统的呢？</p><p class=\"one-p\">本月早些时候，在2019年CES上，谷歌Android Auto负责人帕特里克·布拉迪(Patrick Brady)接受科技记者肖恩·奥凯恩（Sean O&#39;Kane）的专访，他们首先讨论了Android Auto，但最终谈到了将这项技术引入摩托车、使用原生安卓系统开发售后系统等话题。另外，谷歌表示，该公司将其新平台称为“嵌入式”（或“原生”）安卓系统，以及“嵌入式”（或“原生”）Android Auto，尽管它更喜欢前者，或者更简单地说，“由安卓驱动的系统”。</p><p class=\"one-p\"><strong>以下为采访摘要：</strong></p><p class=\"one-p\">布拉迪：对于Android Auto，也就是我们所谓的“投影解决方案”，它正在你的手机上运行，并连接到能够兼容的汽车上。我认为，当前采用不是真正的问题。现在，我们已经与50多个不同的汽车品牌合作，并让它在任何地方推出。我们扩大了地理覆盖范围。就在不久前，我们在韩国、中国台湾、南非和其他几个国家推出了该系统，我们将继续这样做，使它更容易使用。现在最大的焦点将是改善核心体验。</p><p class=\"one-p\">我们推出了改进媒体体验的更新。传统上，我们有两种模式来播放媒体。你可以和智能助手谈谈，让它为你播放内容。当你知道自己想听什么的时候，这是很好的选择。但有时你会想：“哦，我想播放酷玩乐队（Coldplay）的曲目，但我记不起专辑的名字了。”然后我们进行了浏览，但在汽车里，这显然不是访问完整目录的理想选择，因为你不能在开车时浏览如此深度的内容。</p><p class=\"one-p\">所以在去年11月份，我们推出了新的功能。当你搜索某个东西的时候，比如说“播放Coldplay的曲目”，或者甚至说“播放爵士乐”，我们就会开始播放这类内容，但我们也让你具备更大能力，能够改变这款应用程序提供的其他分类内容。</p><p class=\"one-p\">因此，如果你想在Spotify上播放音乐，只需说“播放Coldplay的曲目”，它就会开始播放，但随后会向你展示“这是他们的专辑列表，这是他们最流行的曲目。”我们发现这实际上减少了用户在车内的浏览量，这是一件好事，它帮助他们以一种更安全和无缝的方式访问他们想要的内容。</p><p class=\"one-p\">还有其他几件类似的事情。无线网络让我们感到非常兴奋。很明显，它今天已经在售后市场推出了，但我们很高兴能在不久的将来将这一技术应用到汽车制造商的嵌入式系统中。然后我们将进行更大范围的UI更新，我们在去年的谷歌I/O开发者大会上曾展示过，它利用了我们今天在汽车上看到的更大屏幕。</p><p class=\"one-p\">去年，我们在配有超宽屏幕的揽胜Velar上展示了它，所以现在我们可以让你在谷歌地图上看到完整的视图，然后依次转弯。此外，它还会显示YouTube音乐或Spotify上正在播放的任何内容，并允许你控制这些内容，你不需要在两者之间切换。还有些其他的事情，我们正在对系统UI进行改进，以真正使它更好地融入车内环境中，并再次利用不同的形式因素和屏幕。</p><p class=\"one-p\">奥凯恩：这是否存在任何挑战？因为对于热衷于科技的人来说，看到这些汽车制造商推出更大的屏幕是件好事，而我们现在已经不再做电阻式触摸屏。技术在迎头赶上。用户是否真的喜欢在车里有个巨大屏幕还有待观察。但这是否对所有这些形式因素都提出了挑战，或者你现在已经很好地解决了这个问题？</p><p class=\"one-p\">布拉迪：屏幕大小、方向以及形状是个复杂的问题。但这是相对的，你绝对用过触摸板、旋转控制器，有这么多不同的输入方式，所以这绝对是个挑战。你知道，我们有摩托车制造商想要搭载Android Auto，他们将只用D-Pad驱动。我们也在和本田公司谈判，并致力于达成协议。</p><p class=\"one-p\">所以这套系统是复杂的。我认为好消息是，它促使我们创建更简单的系统。因此，在2019年前6个月中，我们将推出些简化的系统，我认为这将帮助它适应不同的屏幕形状和大小，适应不同的输入方法。但是最终，我认为这将使它对用户更直观和有用。所以我们真的很兴奋。</p><p class=\"one-p\">Android Auto提供的投影解决方案是个经典项目。我们看到的另一件事是所有的汽车制造商，比如沃尔沃、雷诺-日产(Renault-Nissan)以及许多其他的公司，我们正在讨论在他们的汽车中安装安卓系统作为他们的内置信息娱乐系统。由于他们都在努力以数字界面取代所有的机械旋钮和表盘，软件显然变得更加重要。</p><p class=\"one-p\">我们看到的屏幕越来越大。我们看到你的暖通空调控制、调频收音机控制以及其他所有东西都移动到软件控制的屏幕上，而这些都需要一个平台来实现。他们还看到了消费者对CarPlay和Android Auto等产品的需求，汽车制造商希望在他们的嵌入式产品中，在他们的信息娱乐系统中启用这一数字生态系统。</p><p class=\"one-p\">CarPlay和Android Auto都很棒，因为它们可以让你把你的数字生态系统带进车里。作为一个消费者，它确实向你展示了两个世界，你需要同时处理原生系统和智能手机。这不一定是消费者所要求的，但这是实现上述目标的一种方式。我们真正兴奋的是，有了车载安卓嵌入式产品，现在我们可以创建独立的混合系统，里面有Spotify、HVAC控制、备份摄像头、谷歌地图或Waze等，这些都被集成为一个系统。它利用了汽车中的整个数字表面。我们认为，我们将能够找到平衡，让人感觉它被自然融入车中。</p><p class=\"one-p\">虽然这可能很难实现，但这会鼓励人们一直把手机放在口袋里。这也是我们的目标之一。从字面上说，我们内部有个远景，它描述了一大堆我们将来想要实现的驾驶体验，最后一句话是“我从来没有感觉到需要拿起手机。”我认为，这真的是一件关键的事情。所以我们对此非常兴奋。我们刚刚大量采用了安卓作为汽车的嵌入式系统，现在我们有占全年汽车销量50%以上的汽车制造商采用安卓作为内置系统。</p><p class=\"one-p\">奥凯恩：全部？不只是原生Android Auto？</p><p class=\"one-p\">布拉迪：安卓是个完整的系统。我们有合作伙伴，比如本田和通用汽车公司，他们的汽车过去都采用了安卓系统。但他们不得不对该系统进行调整，以便其使用他们自己的汽车。我们花了大量的时间和投资，将安卓打造成汽车的统包解决方案，这样它就拥有了我们客户</p><p class=\"one-p\">所需要的所有东西，比如车辆子系统控制和诸如此类的东西。同时，我们也提供Android Auto的支持应用。我们今天在Android Auto中拥有的数千个应用，包括媒体、消息等，他们将在这些原生系统上无缝运行。我们现在有汽车制造商采用这种方法。</p><p class=\"one-p\">奥凯恩：我只想确定下，与基于安卓分叉版本开发的车载系统相比，沃尔沃采用的原生、嵌入式Android Auto系统有什么不同之处。</p><p class=\"one-p\">布拉迪：你知道，最主要的区别就是你会拥有应用程序生态系统。这是件大事。而且，我想你会看到一个更现代化的系统，因为就像我说的，我们在安卓中增加了功能，使其更适合汽车运行。而且，你知道，当Android Auto Projected在你的智能手机上运行的时候，与在车里运行的原生系统进行对比，你会发现现在我们可以开始把ADAS(高级驾驶辅助系统)和谷歌地图结合起来，这样他们就有了共享的视野。你可以更好地支持多个不同的屏幕和现代汽车、集群支持等。我对此很兴奋，我想这将是个很大的飞跃。</p><p class=\"one-p\">奥凯恩：你认为，随着你们不断取得进步，那些以安卓分叉版本为基础的信息娱乐系统会消亡吗？还是你认为它们还会存在一段时间？</p><p class=\"one-p\">布拉迪：我认为他们会改变某种基线，那不一定是他们当时的选择。四、五年前，当他们做出选择时，比如通用汽车或本田选择安卓系统时，谷歌并没有把安卓打造为嵌入式系统。所以他们必须自己去做所有的改变，他们唯一真正的选择就是开发分叉版本。现在，我认为这是个非常明确的选择，它们现在变成可用的、开源的、免费的、功能丰富的系统。</p><p class=\"one-p\">奥凯恩：特别是围绕特斯拉Model 3，人们一直在猜测，相对于物理控制，我们想要在触摸屏后面放置多少控制方案来实现汽车的功能。</p><p class=\"one-p\">布拉迪：可以说，在某些情况下，他们有点儿过火了！</p><p class=\"one-p\">奥凯恩：我也这么想，我还没有花足够的时间来确定。但这就是我的直觉，当你打开雨刷的时候，就会觉得有点儿奇怪的感觉。但谷歌对此有偏好吗？我认为很明显，你有必要构建能够利用所有这些功能的能力。但你在乎这两种方式吗?</p><p class=\"one-p\">布拉迪：不，我们不是真的很在乎。我想，我们当然希望所有的共同功能都能随时可用。我们当然希望它们可以通过软件访问，因为你现在可以利用Google Assistant做许多事情，而许多汽车都已经集成了这个功能，你可以直接下令“打开雨刷”，对吗？所以，你不想要物理开关，因为你实际上必须通过软件来驱动它。</p><p class=\"one-p\">奥凯恩：或者你在激活它的时候遇到了问题，这就像是双灯开关的问题。</p><p class=\"one-p\">布拉迪：一点儿没错。“开关开了吗？关了吗？”是的，所以你遇到了这个问题，你需要意识到这一点。但你想让这些东西容易使用。随着屏幕变得更大，汽车制造商更容易为主要功能设置更大、更容易访问的目标。</p><p class=\"one-p\">奥凯恩：你是否有个规格基准或其他东西显示给汽车制造商，并说：“如果你想做这件事，这至少是你必须能够处理的？”</p><p class=\"one-p\">布拉迪：与手机类似，我们有个兼容性规范，上面写着：“你可以使用安卓，你可以将其作为一个汽车平台发布，但你需要满足这些要求。”但就像在手机上一样，我认为很多人认为这是非常严格的，我们说“你必须有个主屏幕，且在网格中显示有应用程序”或类似的东西。事实并非如此。我们希望给汽车制造商或移动制造商留下更大的创新空间，只要它不会打破适用于消费者和开发商的某些平台核心原则。所以这就是我们努力划出一条底线的地方。</p><p class=\"one-p\">奥凯恩：随着沃尔沃在过去一年里的演示，我想我们终于看到了你所谈论的东西。但它看起来仍然很像Sensus（沃尔沃子品牌），任何使用过沃尔沃信息娱乐系统的人都会有非常熟悉的感觉。然而，你拥有的这些额外能力，它会让你知道其是如何协调工作的吗？</p><p class=\"one-p\">布拉迪：没错。老实说，我们也展示了运行安卓的奥迪Q8概念车。对我们来说，最酷的是Spotify根本不用改变他们的应用程序，他们可以把它直接安装在车上。它出现在奥迪上，看起来就像奥迪特有的风格。它出现在沃尔沃上，看起来很像是专门为Sensus设计的。我们</p><p class=\"one-p\">希望向业界和消费者展示，你可以创造出这种真正的差异化。我们认为，这不仅是汽车制造商想要的，也是消费者想要的。就像我说的，在那种环境中感觉很自然。但它仍然保持了熟悉的东西，特别是对于开发人员，所以这是一种全面的体验。你控制着所有的应用程序。</p><p class=\"one-p\">奥凯恩：你简要地提到了这个想法，在这个系统中，了解司机如何使用它，并可能对此作出响应。这就是你想推动的吗？</p><p class=\"one-p\">布拉迪：是的，我想这并不是我们在汽车方面所做的努力所独有的。有了Google Assistant和我们正在从事的努力，我们正在创造一种更加个性化的体验，这将对我们更有帮助。所以，同样的，在车里，我们也想做同样的事情。我们今天在Android Auto中已经做的事情是，如果你经常周五开车送女儿去学校，它应该了解到这一点，对吧？</p><p class=\"one-p\">所以在我上车的时候，它会自动提示路线。但你需要以一种对隐私敏感的方式来做，对吗？如果我把车借给别人，我不一定想让他们看到这些东西。尤其是在与手机和其他设备有很大不同的汽车中，汽车从根本上说是共享的设备。所以我们真的在考虑这种体验，以及你如何在高度个性化的体验和用户隐私之间进行权衡，以确保这些私人信息是受到保护的。</p><p class=\"one-p\">奥凯恩：就我个人而言，我在贴文推送方面有些顾虑，因为我不想弄乱算法，使其他的东西更难找到。我已经和其他许多汽车初创公司和汽车制造商谈过了，他们正在考虑如何彻底改变汽车的内饰。这是他们一直在谈论的事情之一，听起来他们想把事情推得更进一步，比如，“我们总是想知道你要点击什么。”我总是担心这一点。我希望它能提供些建议，但我不希望它是变幻莫测的，因为那样我就不知道该相信什么，也不知道会出现什么。</p><p class=\"one-p\">布拉迪：你没有肌肉记忆，对吧？是啊，所以这是一种平衡。我们尝试在平台上为它创建位置。例如，在今天的安卓中，你可以定制自己的主屏幕，这已经是可以预见的。我点击些东西，我知道这些应用程序的确切位置。当我向上滑动的时候，它试图预测我要点击的东西，并且为此提出了行动建议。</p><p class=\"one-p\">我们试图在UI中找到可以引入预测而不需要将整个UI转换为基于预测的地方，因为这样会完全损害肌肉记忆等诸如此类的东西。所以这是一种平衡。在汽车行业，我认为我们所做的与我们在手机上所做的没有什么不同，因为这是个普遍存在的相同问题。</p><p class=\"one-p\">奥凯恩：当你在汽车中使用嵌入式安卓系统时，我们是否也可以期待第三方/售后市场制造商也能看到这一点呢？最终能够把一个系统放在你的车里，不只是Android Auto兼容，还能运行原生的Android Auto？</p><p class=\"one-p\">布拉迪：是的，绝对如此。</p><p class=\"one-p\">奥凯恩：这是你已经开始研究的东西吗？还是你坚持从制造商开始？</p><p class=\"one-p\">布拉迪：大多数情况下，我们都是从制造商开始的，原因有很多。将其构建到汽车中的主要好处之一是，你可以与新汽车中的所有先进系统进行深度集成。而那些售后市场系统，只有固定的东西可以被整合到系统中。因此，要真正扩展平台并利用所有深度集成的优势，你需要与汽车制造商合作。</p><p class=\"one-p\">奥凯恩：几年前，我们开始看到Android Auto和CarPlay进入汽车平台。当时人们对此存在很多担忧，比如汽车制造商会愿意接受吗？有些制造商非常保守，但大多数制造商的问题已经解决了。现在我们讨论的是原生系统，我们是否准备好进行另一种类型的平台战争？我们不知道苹果是否想要做同样的事情，但我们有Automotive Grade Linux，LG正在测试webOS系统。这些给人的感觉是，同样的竞争大战是否会在车里开始呢？</p><p class=\"one-p\">布拉迪：这很难说。我们发现很难创建平台。任何人都可以创建操作系统，但是很难创建一个与开发人员相关并得到开发人员关注的平台。因此，如果你想构建具有连接服务的东西，你需要开发人员的支持。而开发人员往往青睐于拥有最高数量的平台，因为这就是他们获得用户的地方，对吧！我们发现了这个，即使我们正在推出安卓系统，它是Android Automotive，我们需要让开发者考虑开发汽车应用程序，而不仅仅是开发智能手机应用。</p><p class=\"one-p\">汽车比手机市场要小得多，我们知道启动全新的生态系统有多难。所以，我不知道我们会不会看到大量的平台出现并展开竞争。但可以肯定的是，用户会有多种选择。你提到了Automotive Grade Linux。我想你会看到这个行业走向开源、更现代的平台，因为汽车制造商想要带来更多的内部软件，并获得更多的软件所有权，我认为这是一件好事，他们正在对软件进行更多的投资，因为在未来的汽车中，软件将变得更加重要。</p><p class=\"one-p\">另一件很酷的事情是，当我们开发CarPlay或Android Auto时，它是互相集成的系统。现在，我们正在与汽车制造商就同样的系统进行合作。因此，当我们与沃尔沃和Polestar合作时，我们将与他们共同努力，创造尽可能好的体验。我们在一定程度上使用了Android Auto，就像苹果对CarPlay所做的那样，但它并不完全相同，毕竟你们不是共同建立相同系统的团队。</p><p class=\"one-p\">奥凯恩：当你开始与这些汽车制造商交谈时，当你们接近于达成共识但却还没有达到最终目标时，你是如何说服他们的？</p><p class=\"one-p\">布拉迪：这相当有趣。很多时候，我们和汽车制造商坐下来，他们向我们展示他们对未来互联汽车的愿景，我们也向他们推销我们的汽车远景。这完全是一回事。我认为人们想要的是，你永远不会觉得有必要去拿起手机。但是你想要能够进入一辆车，它让你的数字生活无缝地流动，并利用汽车中的所有数字技术，感觉它是自然整合的，所有的东西都在那里，已经为你准备就绪。你无需插电，也不需要登陆。它就在那儿。当你离开的时候，它就会跟着你。当你使用它时，它会变得更好。这在很大程度上是一个共同的愿景。</p><p class=\"one-p\">所以我们从那里开始，然后是如何实现它的问题？有了安卓，我们的定位方式就是，我们正在构建这个平台并免费赠送，因为我们想要创造，就像我们在手机上所做的那样，我们希望加快这个领域的创新，使每个人都能更容易地通过互联服务专注于创新，而不是专注于集成。当时，在智能手机上，针对不同的手机平台，我们有数百个不同版本的谷歌地图。正如你所能想象的那样，在那里进行创新是相当困难的。</p><p class=\"one-p\">你可以在手机上创建一个公共平台，比如Web或安卓，现在所有的设备制造商都可以采用它，并立即访问所有不同的应用程序，而所有的应用程序提供商或连接服务提供商只需构建一次，就可以访问所有这些设备。因此，我们在汽车行业也在做同样的事情，我们真的致力于让它成为汽车制造商最好的解决方案。所以我们告诉他们：“听着，如果你选择不使用安卓，我们想知道为什么，因为这意味着我们的工作还没有做到位，我们需要投资，填补这些空白。”</p><p class=\"one-p\">奥凯恩：这些是独家合作吗？</p><p class=\"one-p\">布拉迪：并非如此。</p><p class=\"one-p\">奥凯恩：因此，如果沃尔沃觉得其他解决方案可能更适合其特定车型，他们可以这样做，而其他的仍然使用Android Auto？</p><p class=\"one-p\">布拉迪：是的。不过，总的来说，汽车不像智能手机，你可能买得起智能手机，作为一个设备制造商，有不同的手机运行不同的系统。我认为所有的方式就像回到早期的HTC。他们有HTC Touch或其他运行Windows的产品，他们有大堆这样的产品，而且他们有自己的安卓产品线。汽车制造商通常不会这么做，因为在这些信息娱乐平台的投资是如此之高，以至于做多个不同版本的平台只会增加他们的成本、研发、上市时间、维护费用，所以他们倾向于把所有的东西都放在相同的平台上。但是，简而言之，这些合同不是排他性的。</p><p class=\"one-p\">奥凯恩：当你在以前的谷歌I/O开发者大会上开始透露更多有关这类努力的信息时，我们提出并得到了答案的一个问题是，这是否阻止了CarPlay的工作。答案是“当然，CarPlay将会成功。”</p><p class=\"one-p\">布拉迪：是这样。</p><p class=\"one-p\">奥凯恩：对于其他竞争对手的服务，无论是像Amazon Alexa还是其他类似的东西，都会有这样的开放性吗？你是否致力于在平台上保持开放？</p><p class=\"one-p\">布拉迪：是的，当然。因为当有人去买沃尔沃时，我们不知道他们家里有什么服务。再强调一遍，他们的愿景不是把谷歌的数字生活带进车里，而是把你的数字生活带进车里。因此，就像今天的安卓手机、Facebook等，无论有什么其他服务，它们都是至关重要的，作为你平台体验的重要组成部分。我认为，在汽车上，主要的挑战是如何确保这些应用程序是专为汽车设计的，并且在汽车中使用是安全的。因此，我不认为它会像我们在智能手机上所坚持的那样开放，因为它只会有更高的标准。但我们想让它尽可能保持开放。</p><p class=\"one-p\">奥凯恩：是的，因为这样你就会开始考虑安全问题，不仅仅是黑客攻击的安全问题，而是汽车的稳定性和汽车的安全问题。</p><p class=\"one-p\">布拉迪：完全正确。</p><p class=\"one-p\">奥凯恩：在很高的层次上，当你和像沃尔沃这样的制造商谈到这些东西的时候，你们会讨论些什么呢？关于确保你所拥有的东西，将提供汽车的稳定性以及安全性功能。</p><p class=\"one-p\">布拉迪：我们与汽车制造商就如何确保平台和生态系统的安全进行了大量讨论。所有已经上传到Play Store for Automotive的应用程序都经过了广泛的审查，以确保我们不会引入任何可能有害的东西。所以我们已经提前将这些都说清楚了。但这在很大程度上也取决于我们如何设计体验。所以，你知道，在今天的汽车里，媒体应用程序并不能控制屏幕上的每个像素。他们填写了我们提供的模板。我们给他们尽可能多的控制权。</p><p class=\"one-p\">但你可以或多或少地重建他们的应用程序，你可以用一种适应屏幕大小和输入控件之类的方式来实现它。这降低了他们的开发复杂性，同时也能管理司机的分心和安全性，以及诸如此类的事情，因为我们正在细长的盒子上运行它。所以我要说的是，我们有意地从头开始设计这个系统来管理它。</p><p class=\"one-p\">奥凯恩：在这样的系统中，无线更新是什么样的？如果有的汽车制造商打算使用你的平台，但想成为提供“空中更新”的汽车制造商，他们有没有做自己的事情来更新他们的UI或类似东西的余地？</p><p class=\"one-p\">布拉迪：可以。我的意思是，我们希望他们那样做，我想所有的汽车制造商都如此行事。这甚至都不是讨论的重点。所有的汽车制造商都在转向建立连接，他们也在转向软件的无线更新。这是消费者想要的，我想这也是汽车制造商想要的。他们现在可以推动对问题的修复，而不是让每个人都去求助于经销商。所以这就是趋势，这就是事情的发展方向。我们喜欢它，因为这意味着，我们想加快创新的步伐。因此，它不仅仅是修复错误和诸如此类的东西，或安全问题，而且还提供新的功能。</p><p class=\"one-p\">我们正在与沃尔沃和雷诺-日产等最亲密的合作伙伴合作，确保他们即使将最初的系统安装在Android P上，也能非常迅速地升级到Android Q和Android R，保持最新，并通过空中向用户推送更新。</p><p class=\"one-p\">奥凯恩：你希望这些更新如何进行？如果有人买了带有原生安卓系统的汽车，而这家汽车制造商想要推送更新，这是不是会通过谷歌提供的方式来实现呢？</p><p class=\"one-p\">布拉迪：那得看情况。就像在手机上一样，我们有自己的空中更新服务，通过谷歌的全球数据中心网络部署更新。有些合作伙伴使用它，其他合作伙伴则使用他们自己的服务。即使是在移动行业，人们也有各种不同的选择。</p><p class=\"one-p\">奥凯恩：随着汽车数字化和信息娱乐系统的出现，我们开始听说服务是这些汽车制造商潜在的新收入模式。你和这些汽车公司谈过这个问题吗？</p><p class=\"one-p\">布拉迪：哦，当然，是的。你看到他们在尝试各种不同的东西。我认为，一般来说，拥有联网汽车对他们来说是个巨大的机会，可以做各种不同的事情。你看到汽车制造商进入保险、车队管理、车内配送等领域，亚马逊可以向你的车运送包裹，因为它可以远程解锁，诸如此类的事情。所以这肯定很有趣。你知道我们在哪里可以做到，我们试着让他们做这些事情，但是我们会看到什么能让消费者满意，什么能真正取得成功。</p><p class=\"one-p\">奥凯恩：你们会从事收入分配的事吗，亦或因为你是平台而不会去做这样的事情？</p><p class=\"one-p\">布拉迪：我们现在专注于平台和谷歌服务，诸如此类的事情。其中很多，特别是在共享移动方面，我认为这是汽车制造商的最佳定位。</p><p class=\"one-p\">奥凯恩：在平台竞争方面，我觉得我在今年的车展上看到的唯一趋势就是，大型媒体公司试图找到在汽车领域做有趣事情的方法。我想我们都在梦想着在全自动驾驶汽车里会有什么样的娱乐，但现在我们开始看到更多近期的东西。例如，奥迪与迪士尼正联手进行类似努力，他们试图想象在叫车环境下，在汽车后座上进行虚拟现实体验。英特尔向华纳兄弟展示了类似的东西。你们在游戏中有没有想把媒体体验带到汽车上，甚至是更小的屏幕上？</p><p class=\"one-p\">布拉迪：我们没有把注意力放在较小的屏幕上。我认为，当你转向无人驾驶，或者你转向更大容量的汽车，比如小型货车和后座娱乐的东西时，这绝对是非常有趣的。但我想说，这不是我们现在的主要关注点。现在还不清楚这个领域的发展方向。你可能知道，所有的航空公司都在每个座位的后座上安装屏幕，现在你可以在过道上来回走动，每个人都在自己的个人设备上观看些东西。所以我并不清楚它的发展方向，但是现在看到实验和创新正在进行真的很酷。</p><p class=\"one-p\">奥凯恩：回到我们开始的地方。你是如何看待Android Auto的新项目与投影方案并驾齐驱呢？你认为它们能平行运行一段时间吗？</p><p class=\"one-p\">布拉迪：投影方案不会消失。我是说现在路上的很多车都在运行它。所以这是件大事。现在，消费者正在做出购买决定，而且他们希望能够做到这一点。如果你还记得蓝牙最初出现在汽车上的时候，现在就好像那个时刻，你可能永远不会买一辆没有蓝牙的汽车。</p><p class=\"one-p\">奥凯恩：甚至租车也是如此。我意识到，当我租到的每辆车上都与CarPlay或Android Auto兼容时，我们已经达到了饱和点。</p><p class=\"one-p\">布拉迪：这实际上是个很好的用例，对吗？因为你上车，插上电源，把你的东西放在一辆你甚至不熟悉的车里，而你只会用一两天，或者任何时候使用。</p><p class=\"one-p\">奥凯恩：除了它想要我的联系人名单的那部分。</p><p class=\"one-p\">布拉迪：嗯。所以投影方案是绝对会继续存在的。我还认为，我们未来两者将会共存。如果我有安卓手机，其应用能与Android Auto功能兼容，Spotify、WhatsApp以及Waze等所有的Android Auto功能都内置在智能手机应用程序中。想象一下，我坐在一辆租来的车里，它把安卓作为嵌入式系统运行。我们可以创造一种更加无缝的体验，你不必像今天使用Android Auto和CarPlay那样在两个不同的系统之间切换。它们会成为一个系统，但应用程序会出现。</p><p class=\"one-p\">而你作为一个消费者，你不知道或者不关心他们是在车里运行还是在我的手机上运行。你永远不需要把它们安装在车里。你不能在车里登录它们，它们实际上是在你的手机上运行的，但它们却出现在那里。我们对此非常兴奋。再说一遍，我认为这真的是两全其美的事情。嵌入式系统中内置的无缝体验，以及手机的高度个性化和连续性，无论你走到哪里，它都比任何其他设备都更了解你。</p><p class=\"one-p\">奥凯恩：这就像是最终的平台移动，让应用程序出现在用户面前为自己说话，而它们来自何处并不重要。</p><p class=\"one-p\">布拉迪：我不认为这是汽车所特有的。我曾入驻永利酒店，当我走进房间时想：“哦，我想继续看之前正在看的那部电影，然后发现，我可以在这里继续观看，那里有很棒的电视。”像Googlecast和其他技术一样的东西，已经开始使这种技术变得可用了。但我希望我能直接走进房间，打开电视，打开我智能手机上的应用程序，我的内容马上就在电视上显现，它知道我在Netflix观看的节目，并将其投射到屏幕上。</p><p class=\"one-p\">奥凯恩：而且你不必随身携带Chromecast，也不必担心登录到他们的智能电视或其他什么。如果他们有的话。</p><p class=\"one-p\">布拉迪：是啊，然后你就登录了。我记得入住Airbnb的场景，入住说明上写着：“如果你有苹果账户，请登录Apple TV”，而结账指示用大写字母写着“不要伪造签名”。因此，在你进入的地方有个更加无缝的体验，你的身份将保留在你的手机上，但它与你周围的所有设备无缝地结合起来，我认为这将是物联网真正强大地方。</p><p class=\"one-p\">奥凯恩：明年你们要做什么？</p><p class=\"one-p\">布拉迪：在Android Auto方面，在投影方案方面，我们有很多新的东西要发布，包括UI的改进。就像我说的，利用更大、更高的屏幕，诸如此类的东西。我们对此非常兴奋。在嵌入方面，与沃尔沃、Polestar、雷诺-日产和其他几家尚未宣布生产汽车的公司合作，将首批汽车投入生产。我们还有很多工作要做，但我们对此很兴奋。我们希望能展示更多的预览，并偷偷窥视五月份举行的I/O开发者大会，然后我们将为年终发布做好准备。</p><p class=\"one-p\"><span style=\"color: rgb(194, 79, 74);\">奥凯恩：你预计发布后的几周或几个月会是什么样子？</span></p><p class=\"one-p\"><span style=\"font-weight: bold; background-color: rgb(238, 236, 224);\">布拉迪：我希望能去度假。这真的是发布的前期准备，这对我们来说将是很庞大的工作，也很有趣。我在手机公司工作过，也帮助研发过安卓系统。你完成了Pixel 3，或任何手机，然后投入市场，你卖出了大量手机。而对于汽车，很明显你不会在第一天就卖出数百万辆车。因此，我们这个行业将进入缓慢的发展坡道，但是我们对用户体验和我们将为这些初始汽车设定的基准感到非常兴奋。我们知道希望能让它成为展示现代汽车数字化体验的窗口。（腾讯科技审校/金鹿）</span></p>', '1');
INSERT INTO `xpcms_article_content` VALUES ('8', '4', '<div class=\"article\"><div></div><p style=\"text-align: left;\">　　<span style=\"font-family: KaiTi_GB2312, KaiTi;\">导语：近日，许久没出现在大众眼前的安吉丽娜·朱莉（Angelina Jolie），居然在9月的美版《ELLE》的封面大片中亮相，还露出招牌微笑，整个人的状态不要太好了吧！44岁重回颜值巅峰！</span></p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/442/w550h692/20190819/8c96-icmpfwz9789788.jpg\" alt=\"\"><span class=\"img_descr\"></span></div><p style=\"text-align: left;\">　　毕竟不是谁都能登上时尚杂志九月封面的，能登上的也不是普通人，更别说《ELLE》这样重量级的杂志了，从封面可以看出安吉丽娜·朱莉美起来真高调，御姐风完美驾驭，加上招牌性感笑容，从头到脚都完美到发光。</p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/429/w550h679/20190819/ba40-icmpfwz9789910.jpg\" alt=\"\"><span class=\"img_descr\"></span></div><p style=\"text-align: left;\">　　虽然从大片中可以看出眼角爬上了几丝皱纹，但依然挡不住她强大的气场，身穿双排扣长款外套，又酷又霸气，完全不像6个孩子的母亲，完美诠释美人在骨不在皮。</p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/362/w550h612/20190819/4b3e-icmpfwz9789973.jpg\" alt=\"\"><span class=\"img_descr\"></span></div><p style=\"text-align: left;\">　　这身工装女飞行员造型仿佛就是为安吉丽娜·朱莉量身订造的，气场十足又美又飒，岁月似乎没有给她带来太大的改变，状态保持的非常不错，依然是大家心目中的那个女神。</p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/426/w550h676/20190819/3410-icmpfwz9790029.jpg\" alt=\"\"><span class=\"img_descr\"></span></div><p style=\"text-align: left;\">　　坐在沙发上的这条黑色长裙，尽显女王气质，配上复古腰封显得身材比例更好了，这款连衣裙版型设计很简约大气，是很耐看的那种，很符合她的气场。</p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/102/w550h352/20190819/de7e-icmpfwz9790097.jpg\" alt=\"\"><span class=\"img_descr\"></span></div><p style=\"text-align: left;\">　　丝质睡袍，清新自然的颜色和质感，呈现出一个轻松的慵懒居家范，不管是从颜值身材还是气质上来讲，这个状态都相当令人羡慕，据悉她加入漫威宇宙的首部电影《永恒族》即将开拍，期待女神的演技！</p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/89/w550h339/20190819/1a63-icmpfwz9790145.jpg\" alt=\"\"><span class=\"img_descr\"></span></div><p style=\"text-align: left;\">　　安吉丽娜·朱莉曾经是好莱坞片酬最高的女星之一，每部电影的片酬高达1500万至2000万美元，而她却将收入的三分之一都捐给了慈善机构。除了片酬，几乎将所有的广告收入也捐给了需要帮助的人。</p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/410/w550h660/20190819/e87e-icmpfwz9790191.jpg\" alt=\"\"><span class=\"img_descr\"></span></div><p style=\"text-align: left;\">　　她是优秀的好莱坞女星，同时她还是联合国难民署亲善大使。她做慈善，开始了就没有停下。低调做人、高调做事，在全球范围内圈了一大票粉丝。</p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/532/w550h782/20190819/1f5c-icmpfwz9790241.jpg\" alt=\"\"><span class=\"img_descr\"></span></div><p style=\"text-align: left;\">　　在全世界还在八卦她的婚姻和私生活时，她早已潇洒地走出来，把生活的各方面都经营得风生水起。带六个孩子出街，笑脸如沐春光，岁月为她增添了更多的温柔与平和。</p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/537/w531h806/20190819/2fa1-icmpfwz9790333.jpg\" alt=\"\"><span class=\"img_descr\"></span></div><div class=\"otherContent_01\" style=\"display: block; margin: 10px 20px 10px 0px; float: left; overflow: hidden; clear: both; padding: 4px; width: 336px; height: 280px;\"></div><p style=\"text-align: left;\">　　女神不仅人美心善，任达华在出席慈善活动时透露，受伤修养期间，自己曾收到了安吉丽娜·朱莉发来的问候信息，对此他坦言非常开心：“她是我的女神，我也有回复说谢谢关心。</p><div style=\"font-size: 0px; height: 0px; clear: both;\"></div><div style=\"margin-top: 30px; text-align: center;\"></div><div></div></div>', '1');
INSERT INTO `xpcms_article_content` VALUES ('13', '15', '<div class=\"article\"><div></div><p>　　<span style=\"font-family: KaiTi_GB2312, KaiTi;\">导语：2018年11月30日晚，全新一代凯迪拉克CT6于 “凯迪拉克中心 CADILLAC ARENA”上市。华语乐坛流行天后林忆莲、亚洲唱作天王林俊杰、超人气实力歌手Hebe田馥甄以及摇滚巨星黄贯中联袂奉上倾情演出，助力“科技 突破想象”凯迪拉克品牌之夜荣耀开启。作为锐意突破、勇敢行动的舞台，北京凯迪拉克中心CADILLAC ARENA以一场突破感官享受的视听饕餮盛宴，让全场逾八千位观众全方位领略了凯迪拉克新豪华风范世界的非凡魅力。</span></p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/transform/116/w550h366/20181203/MnmE-hpfycet1480696.jpg\" alt=\"突破想象 凯迪拉克品牌之夜\"/><span class=\"img_descr\">突破想象 凯迪拉克品牌之夜</span></div><p>　<strong>　勇敢，突破想象</strong></p><p>　　摇滚巨星黄贯中率先登台激情开唱，献上Beyond经典曲目《大地》引燃全场。出道至今逾三十年，黄贯中用一把吉他、一份勇气在音乐上敢为先行，续写着摇滚精神的传奇风范，实力演绎 “突破想象”。而后的一曲《海阔天空》更引发现场千人大合唱，全场观众仿佛被带回了那段属于BEYOND的光辉岁月。</p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/transform/116/w550h366/20181203/mHTy-hpinryc1611488.jpg\" alt=\"黄贯中助阵凯迪拉克品牌之夜\"/><span class=\"img_descr\">黄贯中助阵凯迪拉克品牌之夜</span></div><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/transform/116/w550h366/20181203/Kv_W-hprknvs8009259.jpg\" alt=\"黄贯中助阵凯迪拉克品牌之夜\"/><span class=\"img_descr\">黄贯中助阵凯迪拉克品牌之夜</span></div><p><strong>　　个性，突破想象</strong></p><p>　　自2010年单飞后，田馥甄选择尊崇内心，用成熟的声线和歌声释放出自己独特的个性，成长为歌迷心中独一无二的实力歌者Hebe田馥甄。对音乐梦想的始终坚持，造就了她如今的超强实力与超高人气。昨晚凯迪拉克品牌之夜，田馥甄一袭米色长裙知性登场，温婉的歌声中唱出突破想象的勇气，一连为观众带来了《魔鬼中的天使》，《小幸运》等多首传唱度极高的流行曲目。</p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/transform/116/w550h366/20181203/B5v_-hpinryc1611052.jpg\" alt=\"田馥甄助阵凯迪拉克品牌之夜\"/><span class=\"img_descr\">田馥甄助阵凯迪拉克品牌之夜</span></div><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/transform/116/w550h366/20181203/mMZN-hpinryc1611078.jpg\" alt=\"田馥甄助阵凯迪拉克品牌之夜\"/><span class=\"img_descr\">田馥甄助阵凯迪拉克品牌之夜</span></div><p><strong>　　燃情，突破想象</strong></p><p>　　确认过眼神，他就是行走的CD。亚洲唱作天王林俊杰以全方位的创作、演唱实力圈粉无数，一登场便将现场气氛瞬间点燃。当《一千年以后》《醉赤壁》《不为谁而作的歌》这些突破想象的旋律唱响凯迪拉克中心，林俊杰全情释放光芒，勇敢突破音乐边界。</p><p>　　他让人无法抗拒的魅力来源于对音乐事业的百分百燃情投入，不仅感染了无数粉丝，更为华语乐坛创造了了无数杰作。他的这份真实也正契合了他现场所说的：“我发现生活中很多伟大其实就是来源于一次勇敢的冲动，我希望大家都能够为了自己的梦想勇敢出发。”</p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/transform/116/w550h366/20181203/wQcc-hphsupx9342668.jpg\" alt=\"林俊杰助阵凯迪拉克品牌之夜\"/><span class=\"img_descr\">林俊杰助阵凯迪拉克品牌之夜</span></div><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/transform/116/w550h366/20181203/tHFK-hpinryc1611003.jpg\" alt=\"林俊杰助阵凯迪拉克品牌之夜\"/><span class=\"img_descr\">林俊杰助阵凯迪拉克品牌之夜</span></div><p><strong>　　风范，突破想象</strong></p><p>　　本次品牌之夜压轴出场的林忆莲，一出场就将气氛推向高潮，暌违一年后的再度亮相风范依旧、惊艳全场。</p><p>　　随着《歌手》的播出，乐坛“常青树”的林忆莲再度走入大众视野。她自由的灵魂，敢于突破陈规的态度，让所有人为之沉迷陶醉，助其成为华语乐坛最特别的存在。正如《至少还有你》中唱到的，“至少还有你值得我去珍惜”，这份历经岁月打磨而从容不迫的风范将永远烙印在现场观众的心中。</p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/transform/116/w550h366/20181203/oqVe-hphsupx9343216.jpg\" alt=\"林忆莲助阵凯迪拉克品牌之夜\"/><span class=\"img_descr\">林忆莲助阵凯迪拉克品牌之夜</span></div><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/transform/116/w550h366/20181203/Vz9w-hprknvs8010637.jpg\" alt=\"林忆莲助阵凯迪拉克品牌之夜\"/><span class=\"img_descr\">林忆莲助阵凯迪拉克品牌之夜</span></div><div class=\"otherContent_01\" style=\"display: block; margin: 10px 20px 10px 0px; float: left; overflow: hidden; clear: both; padding: 4px; width: 336px; height: 280px;\"><ins><ins></ins></ins></div><p>　　“勇敢”“个性”“燃情”“风范”——这四个关键词串联起了今晚凯迪拉克品牌之夜的主旋律。伴随着新豪华科技旗舰——全新一代凯迪拉克CT6的上市，凯迪拉克将为这个时代不守成规的创变者们带来全面革新的凯迪拉克新豪华体验。</p><div style=\"font-size: 0px; height: 0px; clear: both;\"></div><div style=\"margin-top: 30px; text-align: center;\"></div><div></div></div>', '1');
INSERT INTO `xpcms_article_content` VALUES ('1', '6', '<div class=\"article\"><div></div><p style=\"text-align: left;\">　　<span style=\"font-family: KaiTi_GB2312, KaiTi;\">导语：美国歌手Madison Beer，虽然刚满20岁，但已经是出道8年的“老前辈”了，4岁开始唱歌，10岁学习钢琴，12岁时就因为YouTube上传的翻唱视频圈了不少粉丝。</span></p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/284/w550h534/20190823/7072-icqznha0149709.jpg\" alt=\"\" width=\"634\" height=\"616\"/><span class=\"img_descr\"></span></div><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/279/w550h529/20190823/83e4-icqznha0149753.jpg\" alt=\"\" width=\"630\" height=\"606\"/><span class=\"img_descr\"></span></div><p style=\"text-align: left;\">　　Madison Beer出生在美国纽约的一个普通家庭，父母都是从事有关建筑类的工作，但她从小就对音乐非常感兴趣，小小年纪拿着麦克风就有模有样。</p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/443/w550h693/20190823/213c-icqznha0149800.jpg\" alt=\"\" width=\"628\" height=\"791\"/><span class=\"img_descr\"></span></div><p style=\"text-align: left;\">　　12岁的时候就开始自己录制翻唱视频在油管上分享给大家，没想到赢得了比伯的关注，并且转发了她发布的内容，让她瞬间变成了一名小网红。之后还签约在了比伯的经纪公司，以比伯小师妹的身份出道。</p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/117/w550h367/20190823/90e1-icqznha0149840.jpg\" alt=\"\" width=\"629\" height=\"420\"/><span class=\"img_descr\"></span></div><p style=\"text-align: left;\">　　她的第一支个人单曲MV《Melodies》比伯也出镜支持，14岁时还与精灵高中合作并录制了主题曲《We Are Monster High》。如今20岁的她已经红遍世界，坐拥300万美金（2000多万人民币）资产，让多少人都心身羡慕。</p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/391/w550h641/20190823/fd5e-icqznha0149884.jpg\" alt=\"\" width=\"632\" height=\"737\"/><span class=\"img_descr\"></span></div><p style=\"text-align: left;\">　　除了歌喉，她与生俱来的身材和美貌更令人羡慕，166cm的身高还拥有一双逆天的大长腿，是一位名副其实的“腿精”少女，虽然不是专业模特，但她对镜头却有极强的表现力，随便一拍就是大片。</p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/362/w550h612/20190823/f7f8-icqznha0149940.jpg\" alt=\"\" width=\"626\" height=\"697\"/><span class=\"img_descr\"></span></div><p style=\"text-align: left;\">　　她的日常穿搭可圈可点，简单个性中又带些小性感，特别受年轻女孩追捧，作为新一代带货小天后，她穿过的球鞋和卫衣都会成为爆款。</p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/413/w550h663/20190823/6fcf-icqznha0150009.jpg\" alt=\"\" width=\"630\" height=\"759\"/><span class=\"img_descr\"></span></div><p style=\"text-align: left;\">　　一头有辨识度的自来卷，微微上翘的厚嘴唇，加上一双标志性的长腿，瘦而不柴，纤长笔直。身穿黑色短款上衣，秀出清晰可见的腹肌和马甲线，搭配一条高腰短裤，显得她整个身材比例更好了。</p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/493/w550h743/20190823/f07d-icqznha0150129.jpg\" alt=\"\" width=\"628\" height=\"848\"/><span class=\"img_descr\"></span></div><p style=\"text-align: left;\">　　她的私服穿搭透着显高的小心机！让只有163cm的她，看起来有种170cm的既视感！像下面的牛仔外套穿搭出的不同风格，时而性感时而化为休息风的少女！</p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/547/w550h797/20190823/829a-icqznha0150203.jpg\" alt=\"\" width=\"633\" height=\"917\"/><span class=\"img_descr\"></span></div><p style=\"text-align: left;\">　　身穿一条黑色细吊带连衣裙，秀出性感的锁骨和让人羡慕的天鹅颈，让她看上去成熟妩媚又性感，在黑夜的灯光照耀下显得五官非常立体，眼神也是非常动人。</p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/519/w550h769/20190823/70f0-icqznha0150270.jpg\" alt=\"\" width=\"632\" height=\"884\"/><span class=\"img_descr\"></span></div><div class=\"otherContent_01\" style=\"display: block; margin: 10px 20px 10px 0px; float: left; overflow: hidden; clear: both; padding: 4px; width: 336px; height: 280px;\"></div><p style=\"text-align: left;\">　　现在的她换了新公司，还在去年2月份发布了自己的原创专辑，并进行了巡演，用自己的努力和实力，摆脱比伯小师妹的光环，真的是将颜值和才华融为了一体。</p><div style=\"font-size: 0px; height: 0px; clear: both;\"></div><div style=\"margin-top: 30px; text-align: center;\"></div><div></div></div>', '1');
INSERT INTO `xpcms_article_content` VALUES ('7', '7', '<div class=\"article\"><div></div><p>　　<span style=\"font-family: KaiTi_GB2312, KaiTi;\">导语：又到了一年一度讨论演员们能赚多少钱的时间了。日前《福布斯》公布了 2019 年全球收入最高的男演员 Top 10 榜单。中国演员成龙以年收入5800万美元位于榜单第五名。（来源：福布斯中文网）</span></p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/ent/transform/20160902/Jwdr-fxvqqsk4575828.jpg\" alt=\"\" width=\"628\" height=\"354\"/><span class=\"img_descr\"></span></div><div class=\"otherContent_01\" style=\"display: block; margin: 10px 20px 10px 0px; float: left; overflow: hidden; clear: both; padding: 4px; width: 336px; height: 280px;\"></div><p>　　统计时间从 2018 年 6 月 1 日至 2019 年 6 月 1 日。<strong>“巨石” 强森</strong>以 8，940 万美元的数字登顶，“锤哥” Chris Hemsworth 收获 7，640&nbsp; 万美元位居第二，Robert Downey Jr。 则以 6，600 万美元获得季军，漫威系演员占了 10 人中的一半；华人中，成龙入榜夺得第五。完整榜单请参照下方。</p><p>　　10、 Will Smith：3，500 万美元</p><p>　　9、 Paul Rudd：4，100 万美元</p><p>　　8、 Chris Evans：4，350 万美元</p><p>　　6、 Adam Sandler：5，700 万美元</p><p>　　6、 Bradley Cooper：5，700 万美元</p><p>　　5、 Jackie Chan：5，800 万美元</p><p>　　4、 Akshay Kumar：6，500 万美元</p><p>　　3、Robert Downey Jr。：6，600 万美元</p><p>　　2、 Chris Hemsworth：7，640 万美元</p><p>　　1、Dwayne Johnson：8，940 万美元</p><div style=\"font-size: 0px; height: 0px; clear: both;\"></div><div style=\"margin-top: 30px; text-align: center;\"></div><div></div></div>', '1');
INSERT INTO `xpcms_article_content` VALUES ('9', '8', '<div class=\"article\"><div></div><p>　<span style=\"font-family: KaiTi_GB2312, KaiTi;\">　导语：没有人会否认Kendall Jenner是当今最有人气的超模之一，但是当看到她的粉丝的具体数字的时候你还是会感到震惊。Kendall Jenner在Instagram上拥有1亿粉丝，推特和Facebook上共400多万粉丝。这样庞大的粉丝数量全世界也就卡戴珊家族、Selena Gomez、Taylor Swift这样的顶级巨星才会有。所以不要再说Kendall Jenner凭什么成为最赚钱超模，因为她有1亿粉丝啊！！！</span></p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/transform/116/w550h366/20190815/c3f0-ichcymv5054844.jpg\" alt=\"\"/><span class=\"img_descr\"></span></div><p>　　据Model.com数据，美国真人秀明星兼超模Kendall Jenner成为Facebook、Twitter和Instagram三大社交媒体上最受欢迎的模特，其粉丝数已达1.59亿。</p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/transform/116/w366h550/20190815/92bc-ichcymv5074664.jpg\" alt=\"\"/><span class=\"img_descr\"></span></div><p>　　排名第二的是另一90后超模Gigi Hadid，粉丝数为6200万不及Kendall Jenner的一半。</p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/transform/163/w413h550/20190815/0e89-ichcymv5079593.jpg\" alt=\"\"/><span class=\"img_descr\"></span></div><div class=\"otherContent_01\" style=\"display: block; margin: 10px 20px 10px 0px; float: left; overflow: hidden; clear: both; padding: 4px; width: 336px; height: 280px;\"><ins><ins></ins></ins></div><p>　　Cara Delevingne则位列第三。</p><p>　　入选前十的模特还有Chrissy Teigen、Emily Ratajkowski、Tyra Banks、Bella Hadid、Gisele Bündchen、Miranda Kerr和Hailey Bieber。</p><div style=\"font-size: 0px; height: 0px; clear: both;\"></div><div style=\"margin-top: 30px; text-align: center;\"></div><div></div></div>', '1');
INSERT INTO `xpcms_article_content` VALUES ('10', '9', '<div class=\"article\"><div></div><p style=\"text-align: left;\">　　<span style=\"font-family: KaiTi_GB2312, KaiTi;\">导语：最近，美国乡村牛仔男孩Jason Morgan 又拿下了一份来自Polo Ralph Lauren的合约，实现了连续十年拥有大牌合约的商业神话。</span></p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/575/w550h825/20190814/a659-icapxpi4240071.jpg\" alt=\"\"/><span class=\"img_descr\"></span></div><p style=\"text-align: left;\">　　Jason Morgan是Giorgio Armani的经典香水 ACQUA DI GIO的长期代言人，自2015年起，他便代言这款香水并且在时尚圈站稳了脚步。</p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/555/w550h805/20190814/e520-icapxpi4240150.jpg\" alt=\"\"/><span class=\"img_descr\"></span></div><p style=\"text-align: left;\">　　为一个顶级品牌拍摄香水广告对模特来说是一件很大的肯定，它基本上被视为成为顶级模特标配。</p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/573/w550h823/20190814/9871-icapxpi4240227.jpg\" alt=\"\"/><span class=\"img_descr\"></span></div><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/478/w550h728/20190814/73db-icapxpi4240312.jpg\" alt=\"\"/><span class=\"img_descr\"></span></div><p style=\"text-align: left;\">　　出生于美国的Jason Morgan大概是继Sean O‘Pry之后能拿到超级大牌香水合约的美国男模，在美国男模Flop的今天，他成为了全村的希望。</p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/300/w550h550/20190814/6611-icapxpi4240464.jpg\" alt=\"\"/><span class=\"img_descr\"></span></div><p style=\"text-align: left;\">　　作为设计师Armani先生眼中最性感的男模之一，他还是Armani 多季度内裤代言人。</p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/485/w550h735/20190814/3de8-icapxpi4240528.jpg\" alt=\"\"/><span class=\"img_descr\"></span></div><p style=\"text-align: left;\">　　Armani先生对Jason Morgan做出了很高的评价，钦点他做Giorgio Armani的广告男模。</p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/463/w550h713/20190814/b89c-icapxpi4240614.jpg\" alt=\"\"/><span class=\"img_descr\"></span></div><p style=\"text-align: left;\">　　品牌也多次邀请他参与Armani的大秀，不过Jason Morgan当模特一直坚持着一个原则就是“不走秀”，即便是Armani先生的亲自邀请，他也保持自我婉转地拒绝掉。</p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/483/w550h733/20190814/3a3c-icapxpi4240746.jpg\" alt=\"\"/><span class=\"img_descr\"></span></div><p style=\"text-align: left;\">　　Jason Morgan从不走秀是因为他有“舞台恐惧症”，当他被很多人注视的时候，总会感到不自在，心跳加速甚至紧张到透不过气。</p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/gif_image/490/w245h245/20190814/f28c-icapxpi4240834.gif\" alt=\"\"/><span class=\"img_descr\"></span></div><p style=\"text-align: left;\">　　这也不是戏太多，而是从一开始Jason Morgan并不打算做模特。</p><p style=\"text-align: left;\">　　在十年前，他在亚利桑那大学教体育，因为他的大学专业是体育教学，所以把体育事业当成了自己一辈子的人生。</p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/300/w550h550/20190814/0036-icapxpi4240981.jpg\" alt=\"\"/><span class=\"img_descr\"></span></div><p style=\"text-align: left;\">　　他的外貌跟<strong>Call Me By Your Name</strong>中的Oliver有几分相似，被称为All-American Boy，是欧洲人最喜欢的美国男人的类型。</p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/300/w550h550/20190814/2e8f-icapxpi4241076.jpg\" alt=\"\"/><span class=\"img_descr\"></span></div><p style=\"text-align: left;\">　　虽然他热爱教学，但后来他遇到了当模特的机遇还是选择了当模特，因为比较赚钱。</p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/545/w550h795/20190814/1a4e-icapxpi4241160.jpg\" alt=\"\"/><span class=\"img_descr\"></span></div><p style=\"text-align: left;\">　　虽然有人会指责他为了赚钱放弃曾经的初心，非常没有原则，但我觉得我可以接受，毕竟梦想很重要，但是有时候还是应该去把握机会。</p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/388/w550h638/20190814/b319-icapxpi4241229.jpg\" alt=\"\"/><span class=\"img_descr\"></span></div><p style=\"text-align: left;\">　　Jason Morgan给自己的定位是平面模特，他只拍照不走秀。</p><p style=\"text-align: left;\">　　其实美国模特都不太爱走秀，无论是Sean O‘Pry还是Lucky Blue Smith基本在走红后就不再走秀，可能是因为主要的时装周都在欧洲的缘故。</p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/362/w550h612/20190814/a23d-icapxpi4241299.jpg\" alt=\"\"/><span class=\"img_descr\"></span></div><p style=\"text-align: left;\">　　据说，Jason Morgan会给自己安排很多的旅游计划和坚持自己的健康生活，有大型品牌请他工作后，他才飞去米兰巴黎北京纽约伦敦这样的大城市，然后拍完照就回家。</p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/475/w550h725/20190814/75c9-icapxpi4241399.jpg\" alt=\"\"/><span class=\"img_descr\"></span></div><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/539/w550h789/20190814/6514-icapxpi4241488.jpg\" alt=\"\"/><span class=\"img_descr\"></span></div><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/483/w550h733/20190814/4053-icapxpi4241578.jpg\" alt=\"\"/><span class=\"img_descr\"></span></div><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/484/w550h734/20190814/4af4-icapxpi4241682.jpg\" alt=\"\"/><span class=\"img_descr\"></span></div><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/502/w550h752/20190814/3872-icapxpi4241748.jpg\" alt=\"\"/><span class=\"img_descr\"></span></div><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/471/w550h721/20190814/1426-icapxpi4241806.jpg\" alt=\"\"/><span class=\"img_descr\"></span></div><p style=\"text-align: left;\">　　而如今的Jason Morgan成为了超模，正在打算重新做体育慈善事业，要让美国的孩子们放下手机重新走回运动场，他认为运动是全民健康的基础，而孩子是祖国的花朵。</p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/300/w550h550/20190814/5df1-icapxpi4240080.jpg\" alt=\"\"/><span class=\"img_descr\"></span></div><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/300/w550h550/20190814/9b95-icapxpi4240157.jpg\" alt=\"\"/><span class=\"img_descr\"></span></div><p style=\"text-align: left;\">　　我举得他的脸单真的很方正，看起来就是正义凛然的超级英雄脸，一身正气，让然看起来非常有安全感。</p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/308/w550h558/20190814/661d-icapxpi4240233.jpg\" alt=\"\"/><span class=\"img_descr\"></span></div><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/437/w550h687/20190814/fbdd-icapxpi4240337.jpg\" alt=\"\"/><span class=\"img_descr\"></span></div><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/300/w550h550/20190814/f039-icapxpi4240461.jpg\" alt=\"\"/><span class=\"img_descr\"></span></div><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/316/w550h566/20190814/df11-icapxpi4240687.jpg\" alt=\"\"/><span class=\"img_descr\"></span></div><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/353/w550h603/20190814/ed28-icapxpi4240791.jpg\" alt=\"\"/><span class=\"img_descr\"></span></div><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/300/w550h550/20190814/a664-icapxpi4240880.jpg\" alt=\"\"/><span class=\"img_descr\"></span></div><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/338/w550h588/20190814/b52a-icapxpi4241022.jpg\" alt=\"\"/><span class=\"img_descr\"></span></div><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/300/w550h550/20190814/098c-icapxpi4241115.jpg\" alt=\"\"/><span class=\"img_descr\"></span></div><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/300/w550h550/20190814/0d5a-icapxpi4241191.jpg\" alt=\"\"/><span class=\"img_descr\"></span></div><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/437/w550h687/20190814/4ac9-icapxpi4241265.jpg\" alt=\"\"/><span class=\"img_descr\"></span></div><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/434/w550h684/20190814/80b6-icapxpi4241342.jpg\" alt=\"\"/><span class=\"img_descr\"></span></div><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/342/w550h592/20190814/1188-icapxpi4241403.jpg\" alt=\"\"/><span class=\"img_descr\"></span></div><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/300/w550h550/20190814/aadd-icapxpi4241504.jpg\" alt=\"\"/><span class=\"img_descr\"></span></div><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/300/w550h550/20190814/343c-icapxpi4241600.jpg\" alt=\"\"/><span class=\"img_descr\"></span></div><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/353/w550h603/20190814/7553-icapxpi4241668.jpg\" alt=\"\"/><span class=\"img_descr\"></span></div><div class=\"otherContent_01\" style=\"display: block; margin: 10px 20px 10px 0px; float: left; overflow: hidden; clear: both; padding: 4px; width: 336px; height: 280px;\"></div><div style=\"font-size: 0px; height: 0px; clear: both;\"></div><div style=\"margin-top: 30px; text-align: center;\"></div><div></div></div>', '1');
INSERT INTO `xpcms_article_content` VALUES ('11', '10', '<div class=\"article\"><div></div><p style=\"text-align: left;\">　　<span style=\"font-family: KaiTi_GB2312,KaiTi;\">导语：还记得5年前惊艳全世界被《Women Daily》杂志誉为“世界第一美少女”的俄罗斯女孩Kristina Pimenova吗？</span></p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/421/w550h671/20190813/2826-icapxph7742270.jpg\" alt=\"\"/><span class=\"img_descr\"></span></div><p style=\"text-align: center;\">洋娃娃一样精致的脸蛋</p><p style=\"text-align: center;\">　　一头海藻般的棕色长卷发</p><p style=\"text-align: center;\">　　简直是真人版芭比</p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/265/w550h515/20190813/4706-icapxph7742312.jpg\" alt=\"\"/><span class=\"img_descr\"></span></div><p style=\"text-align: center;\">当网友惊艳于她的神颜时</p><p style=\"text-align: center;\">　　也不禁担心一个悲剧：长残</p><p style=\"text-align: center;\">　　毕竟童星长残先例已经多到数不过来</p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/151/w550h401/20190813/94a3-icapxph7742366.jpg\" alt=\"\"/><span class=\"img_descr\"></span></div><p style=\"text-align: center;\">如今4年过去</p><p style=\"text-align: center;\">　　Kristina从8岁长成12岁</p><p style=\"text-align: center;\">　　变得。。。。。。</p><p style=\"text-align: center;\">　　更更更更美了！</p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/265/w550h515/20190813/0295-icapxph7742406.jpg\" alt=\"\"/><span class=\"img_descr\"></span></div><p style=\"text-align: center;\">褪去了娃娃脸的她</p><p style=\"text-align: center;\">　　正处于既天真又成熟的年龄</p><p style=\"text-align: center;\">　　眉眼间还有孩童的稚嫩</p><p style=\"text-align: center;\">　　但隐约已有天仙级的美颜</p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/288/w550h538/20190813/de65-icapxph7742476.jpg\" alt=\"\"/><span class=\"img_descr\"></span></div><p style=\"text-align: center;\">网友们纷纷窒息：</p><p style=\"text-align: center;\">　　“这不就是我梦中的初恋脸吗？”</p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/438/w550h688/20190813/421d-icapxph7742529.jpg\" alt=\"\"/><span class=\"img_descr\"></span></div><p style=\"text-align: center;\">都说美人在骨不在皮</p><p style=\"text-align: center;\">　　Kristina却鱼与熊掌兼得</p><p style=\"text-align: center;\">　　西方的立体骨架上</p><p style=\"text-align: center;\">　　又有东方的精致皮相</p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/36/w550h286/20190813/559b-icapxph7742563.jpg\" alt=\"\"/><span class=\"img_descr\"></span></div><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/37/w550h287/20190813/4acc-icapxph7742619.jpg\" alt=\"\"/><span class=\"img_descr\"></span></div><p style=\"text-align: center;\">湛蓝色的宝石眼睛</p><p style=\"text-align: center;\">　　盯多几秒就要勾人魂魄</p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/269/w550h519/20190813/c123-icapxph7742667.jpg\" alt=\"\"/><span class=\"img_descr\"></span></div><p style=\"text-align: center;\">侧颜也是无敌</p><p style=\"text-align: center;\">　　纯净得好像天使</p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/428/w550h678/20190813/8be4-icapxph7742717.jpg\" alt=\"\"/><span class=\"img_descr\"></span></div><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/436/w550h686/20190813/90d5-icapxph7742778.jpg\" alt=\"\"/><span class=\"img_descr\"></span></div><p style=\"text-align: center;\">不仅如此</p><p style=\"text-align: center;\">　　身材比例更是好得爆炸</p><p style=\"text-align: center;\">　　小小年纪就有逆天的大长腿</p><p style=\"text-align: center;\">　　纤细修长的四肢</p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/417/w550h667/20190813/5f3e-icapxph7742847.jpg\" alt=\"\"/><span class=\"img_descr\"></span></div><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/347/w550h597/20190813/c8b2-icapxph7742904.jpg\" alt=\"\"/><span class=\"img_descr\"></span></div><p style=\"text-align: center;\">镜头前一站</p><p style=\"text-align: center;\">　　妥妥的国际范</p><p style=\"text-align: center;\">　　注定是未来超模界的冉冉新星</p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/312/w550h562/20190813/e8df-icapxph7742942.jpg\" alt=\"\"/><span class=\"img_descr\"></span></div><p style=\"text-align: center;\">这些令人嫉妒的优点</p><p style=\"text-align: center;\">　　都继承于她的父母</p><p style=\"text-align: center;\">　　Kristina的母亲是一名模特</p><p style=\"text-align: center;\">　　从小就教她走猫步</p><p style=\"text-align: center;\">　　如何在镜头前展现最令人惊艳的自己</p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/300/w550h550/20190813/fc2c-icapxph7742973.jpg\" alt=\"\"/><span class=\"img_descr\"></span></div><p style=\"text-align: center;\">父亲是前俄罗斯足球国脚Ruslan Pimenov</p><p style=\"text-align: center;\">　　在名人圈混得如鱼得水</p><p style=\"text-align: center;\">　　在却是个十足的女儿奴</p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/297/w550h547/20190813/8cbd-icapxph7743008.jpg\" alt=\"\"/><span class=\"img_descr\"></span></div><p style=\"text-align: center;\">天生的基因优势</p><p style=\"text-align: center;\">　　+</p><p style=\"text-align: center;\">　　人生赢家的起跑线</p><p style=\"text-align: center;\">　　=</p><p style=\"text-align: center;\">　　一个盛世名模的诞生？</p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/292/w550h542/20190813/8a3d-icapxph7743058.jpg\" alt=\"\"/><span class=\"img_descr\"></span></div><p style=\"text-align: center;\">当然也少不了Kristina异常的努力</p><p style=\"text-align: center;\">　　其他小屁孩玩泥巴的时候</p><p style=\"text-align: center;\">　　她却为了养成模特的挺拔体态</p><p style=\"text-align: center;\">　　在大汗淋漓地练自由体操</p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/241/w550h491/20190813/0486-icapxph7743112.jpg\" alt=\"\"/><span class=\"img_descr\"></span></div><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/423/w550h673/20190813/530b-icapxph7743175.jpg\" alt=\"\"/><span class=\"img_descr\"></span></div><p style=\"text-align: center;\">为了将来能走上国际道路</p><p style=\"text-align: center;\">　　工作回家后</p><p style=\"text-align: center;\">　　还得关紧房门苦练英语</p><p style=\"text-align: center;\">　　不能和隔壁家小朋友一起玩</p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/364/w550h614/20190813/650e-icapxph7743209.jpg\" alt=\"\"/><span class=\"img_descr\"></span></div><p style=\"text-align: center;\">她三岁开始拍平面</p><p style=\"text-align: center;\">　　四岁就在T台走秀</p><p style=\"text-align: center;\">　　小小年纪已经积累无数经验</p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/265/w550h515/20190813/688a-icapxph7742276.jpg\" alt=\"\"/><span class=\"img_descr\"></span></div><p style=\"text-align: center;\">到如今轻松驾驭各种风格</p><p style=\"text-align: center;\">　　展现出超强的可塑性</p><p style=\"text-align: center;\">　　田园甜美风</p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/487/w550h737/20190813/25e2-icapxph7742306.jpg\" alt=\"\"/><span class=\"img_descr\"></span></div><p style=\"text-align: center;\">朋克少女风</p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/296/w550h546/20190813/1735-icapxph7742363.jpg\" alt=\"\"/><span class=\"img_descr\"></span></div><p style=\"text-align: center;\">可以是班上最酷的女孩</p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/338/w550h588/20190813/7004-icapxph7742415.jpg\" alt=\"\"/><span class=\"img_descr\"></span></div><p style=\"text-align: center;\">也可以一个投足</p><p style=\"text-align: center;\">　　慵懒随性</p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/116/w550h366/20190813/4577-icapxph7742470.jpg\" alt=\"\"/><span class=\"img_descr\"></span></div><p style=\"text-align: center;\">天时地利人和</p><p style=\"text-align: center;\">　　没道理还不火</p><p style=\"text-align: center;\">　　无数杂志报纸开始刊登她</p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/292/w550h542/20190813/3884-icapxph7742520.jpg\" alt=\"\"/><span class=\"img_descr\"></span></div><p style=\"text-align: center;\">Vogue、RALPH LAUREN、ARMANI</p><p style=\"text-align: center;\">　　时尚杂志与大牌们纷纷找她合作</p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/259/w550h509/20190813/3386-icapxph7742558.jpg\" alt=\"\"/><span class=\"img_descr\"></span></div><p style=\"text-align: center;\">还可以和同学们都见不上的爱豆</p><p style=\"text-align: center;\">　　水果姐做朋友</p><p style=\"text-align: center;\">　　简直是福利满满！</p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/301/w550h551/20190813/8a7d-icapxph7742626.jpg\" alt=\"\"/><span class=\"img_descr\"></span></div><p style=\"text-align: center;\">年仅12岁的Kristina</p><p style=\"text-align: center;\">　　在坚持着模特梦想之余</p><p style=\"text-align: center;\">　　也活得特别充实</p><p style=\"text-align: center;\">　　喜欢美食就吃</p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/296/w550h546/20190813/17cb-icapxph7742674.jpg\" alt=\"\"/><span class=\"img_descr\"></span></div><p style=\"text-align: center;\">拍完照片回来了</p><p style=\"text-align: center;\">　　就与闺蜜喝个下午茶</p><p style=\"text-align: center;\">　　聊聊少女小心事</p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/263/w550h513/20190813/3abd-icapxph7742723.jpg\" alt=\"\"/><span class=\"img_descr\"></span></div><p style=\"text-align: center;\">也会和父母一起去世界各地旅行</p><p style=\"text-align: center;\">　　见识迥异的风景</p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/291/w550h541/20190813/0f0d-icapxph7742787.jpg\" alt=\"\"/><span class=\"img_descr\"></span></div><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/300/w550h550/20190813/c177-icapxph7742856.jpg\" alt=\"\"/><span class=\"img_descr\"></span></div><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/436/w550h686/20190813/3c3a-icapxph7742902.jpg\" alt=\"\"/><span class=\"img_descr\"></span></div><p style=\"text-align: center;\">总而言之</p><p style=\"text-align: center;\">　　Kristina这4年都过着这样的生活——</p><p style=\"text-align: center;\">　　每一天醒来</p><p style=\"text-align: center;\">　　都发现自己比前一天更好看</p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/297/w550h547/20190813/9eb7-icapxph7742939.jpg\" alt=\"\"/><span class=\"img_descr\"></span></div><p style=\"text-align: center;\">Kristina用13年</p><p style=\"text-align: center;\">　　向全世界证明了一个真理</p><p style=\"text-align: center;\">　　长得美的人生</p><p style=\"text-align: center;\">　　真的好棒棒啊。。。。。。</p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/302/w550h552/20190813/6ed7-icapxph7742971.jpg\" alt=\"\"/></div><div style=\"font-size: 0px; height: 0px; clear: both;\"></div><div style=\"margin-top: 30px; text-align: center;\"></div><div></div></div>', '1');
INSERT INTO `xpcms_article_content` VALUES ('12', '5', '<div class=\"article\"><div></div><p>　　<span style=\"font-family: KaiTi_GB2312, KaiTi;\">导语：敢说敢作，没有顾忌也没有框架，王菲之所以能成为一个时代流行女星的印记，除了音乐风格、演绎事业，更多的还有她强烈的个人风格。8月8日是王菲50岁生日，如果有人要问她的影响力有多大，答案是比50年的岁月要长。</span></p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/transform/709/w1871h1238/20190808/1ad6-iaxiufn9775598.jpg\" alt=\"\" width=\"626\" height=\"414\"/><span class=\"img_descr\"></span></div><p>　　年轻的时候，她曾玩笑说最大的烦恼是“太红”，而这个“烦恼”几乎伴随了她出道后三十年。</p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/483/w550h733/20190808/1409-iaxiufn9819073.jpg\" alt=\"\" width=\"630\" height=\"840\"/><span class=\"img_descr\"></span></div><p>　　1969年8月8日出生于北京，并且在17岁前她一直都在这个城市度过。</p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/60/w550h1110/20190808/e09a-iaxiufn9923638.jpg\" alt=\"\" width=\"626\" height=\"1264\"/><span class=\"img_descr\"></span></div><p>　　父亲是工程师，母亲是文工团工作的女高音，可能因为家庭关系，王菲从小就爱唱歌，15岁时，就出版了第一张专辑《风从哪里来》。</p><p>　　1987年，17岁的王菲考上了厦大生物系，她却自愿放弃学业和父亲移民香港，并拜香港乐坛教父戴思聪为师。</p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/67/w485h382/20190808/7674-iaxiufn9819224.jpg\" alt=\"\" width=\"609\" height=\"480\"/><span class=\"img_descr\"></span></div><p>　　可是，王菲头几年的“港漂”生活并不顺利，以王靖雯为名推出的专辑几乎没有反响。直到1992年，王菲第四张专辑《Coming Home》中的《容易受伤的女人》大火，王菲成名了。</p><p>　　出名后的王菲给大众的印象大概就是说话直接、不避讳；奋不顾身，敢爱敢恨。</p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/gif_image/662/w400h262/20190808/2632-iaxiufn9855034.gif\" alt=\"\" width=\"631\" height=\"413\"/><span class=\"img_descr\"></span></div><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/gif_image/677/w400h277/20190808/0e85-iaxiufn9855355.gif\" alt=\"\" width=\"628\" height=\"435\"/><span class=\"img_descr\"></span></div><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/19/w550h269/20190808/0e0a-iaxiufn9855403.jpg\" alt=\"\" width=\"632\" height=\"310\"/><span class=\"img_descr\"></span></div><p>　　甚至还有网友还把她的语录做成了教科书。。。。。。</p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/217/w550h467/20190808/21fa-iaxiufn9855452.jpg\" alt=\"\" width=\"634\" height=\"538\"/><span class=\"img_descr\"></span></div><p>　　这份直源于她的简单，王菲曾经的演唱会音乐总监就说过，她很简单一点也不复杂，认识十几年了她依旧如此。她喜欢唱歌，她就唱歌，她虽然成了天后，但心态并没有变成天后，对外界的反应还是很原始直接。</p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/262/w1600h1062/20190808/2675-iaxiufn9855195.jpg\" alt=\"\" width=\"630\" height=\"418\"/><span class=\"img_descr\"></span></div><p>　　而王菲的音乐实力，也多次得到过圈内好友的赞美。</p><p>　　歌手孙燕姿曾发微博称，‘王菲是我永远的偶像’。郑秀文多年前曾评价，‘王菲是diva，是艺术家，而我们是艺人’。</p><p>　　在2018年一期综艺节目里，作为嘉宾与王菲同台的周迅说，‘王菲是我的偶像，我们终于同框了。’此外，岳云鹏，范晓萱，SHE，大小s，蔡依林，李维嘉，马天宇，张惠妹，姚晨，马云等都曾公开表示是王菲的歌迷或粉丝。</p><p style=\"text-align: left;\">　　正因为如此的音乐造诣，也让王菲成为首位登上时代周刊封面的华人歌手，毕竟她，就是时代的象征。</p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/496/w550h746/20190808/4fb1-iaxiufn9923828.png\" alt=\"\" width=\"632\" height=\"858\"/><span class=\"img_descr\"></span></div><p>　　在影视剧中，王菲同样给观众、以及荧幕留下了深刻的印象。</p><p>　　二十出头、处于颜值巅峰时期的王菲，拍过几部相当出色的港剧，包括《千岁情人》、《原振侠》、《壹号皇庭II》，不过在歌后地位确立之后，她就暂别了小荧幕。 &nbsp;</p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/173/w550h423/20190808/5eec-iaxiufn9923872.jpg\" alt=\"\" width=\"630\" height=\"485\"/><span class=\"img_descr\"></span></div><p>　　在《莫欺少年穷》中，王菲搭档的是Beyond乐队成员黄家驹、黄贯中、阿强和叶世荣，王菲扮演叶世荣的女友，虽戏份不多，却被黄家驹盛赞：“王靖雯日后一定会红。” &nbsp; &nbsp; &nbsp;</p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/45/w550h295/20190808/1cb6-iaxiufn9923913.jpg\" alt=\"\" width=\"629\" height=\"338\"/><span class=\"img_descr\"></span></div><p>　　1994年，《重庆森林》上映。成天像在梦游一般的速食店女孩阿菲和那首《梦中人》，至今还是文艺青年的“影像圣经”。 &nbsp; &nbsp; &nbsp;</p><p>　　王菲说：“拍《重庆森林》时，我都不知自己做什么，糊里糊涂，之后又糊里糊涂得奖。” &nbsp; &nbsp; &nbsp;</p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/506/w550h756/20190808/b0d7-iaxiufn9923974.jpg\" alt=\"\" width=\"638\" height=\"877\"/><span class=\"img_descr\"></span></div><p>　　王家卫说：“她是我拍所有女演员里最特别的一个，因为她不用力的，演戏不需要用力。她有办法让这个角色成为她自己的一部分。她是很无所谓就做到了。 这种东西别人模仿不来，只要有人模仿，一看就知道是在学王菲。” &nbsp; &nbsp; &nbsp;&nbsp;</p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/gif_image/640/w400h240/20190808/eedd-iaxiufn9924031.gif\" alt=\"\" width=\"628\" height=\"377\"/><span class=\"img_descr\"></span></div><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/gif_image/640/w400h240/20190808/0ea2-iaxiufn9924093.gif\" alt=\"\" width=\"630\" height=\"378\"/><span class=\"img_descr\"></span></div><p>　　大导演Quentin Tarantino回忆起看《重庆森林》的感受时，手舞足蹈地模仿王菲在片中的摆手动作，“她是华语乐坛的麦当娜，如果以后看不到她雀跃的舞姿，我是无法欣赏《加州梦想》这首歌的。但凡看过这部电影的人，都会为她心动。”</p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/gif_image/560/w320h240/20190808/9466-iaxiufn9924155.gif\" alt=\"\" width=\"629\" height=\"472\"/><span class=\"img_descr\"></span></div><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/gif_image/548/w320h228/20190808/758a-iaxiufn9924194.gif\" alt=\"\" width=\"630\" height=\"449\"/><span class=\"img_descr\"></span></div><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/gif_image/548/w320h228/20190808/2512-iaxiufn9924234.gif\" alt=\"\" width=\"632\" height=\"450\"/><span class=\"img_descr\"></span></div><p>　　如果说音乐是王菲表达自己的载体，因为她的特立独行，开拓了华语流行乐坛的无限可能。那么，时尚，大概就是对于这样的别具一格而言，最为直截了当的表现形式了。</p><p>　　174cm的身高，清秀的眉目，这样得天独厚的硬件配置早已为她日后的人形时尚教科书打下了基础。而她独到精准的衣品和大胆创新的妆发尝试，更是让她的个性得以放大。</p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/299/w550h549/20190808/674d-iaxiufn9924283.jpg\" alt=\"\" width=\"627\" height=\"626\"/><span class=\"img_descr\"></span></div><p>　　穿上宽松版型的格纹西装裤，任凭裤脚层层搭落在脚背上，这不就是如今正热的西装裤VS老爹鞋。</p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/161/w550h411/20190808/b65a-iaxiufn9924353.jpg\" alt=\"\" width=\"633\" height=\"474\"/><span class=\"img_descr\"></span></div><p>　　PVC、透视装，王菲带给人的感觉却不仅仅是脱口而出的性感而已。</p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/568/w550h818/20190808/7022-iaxiufn9924399.jpg\" alt=\"\" width=\"630\" height=\"937\"/><span class=\"img_descr\"></span></div><p>　　香港一代时装教母黎坚惠，在《时装时刻》一书里写道，当年王菲在演唱会上穿着先锋品牌Jurgi Persoons的瞬间，就是安特卫普神话开始唤醒亚洲时尚的时候。 &nbsp; &nbsp; &nbsp;</p><p>　　每次的演唱会造型也是可圈可点，高跟鞋当头饰，吊灯造型，泳帽等等，各种个性的穿搭都敢尝试。</p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/transform/300/w550h550/20180807/hlqG-hhkuskt2015242.jpg\" alt=\"一盏灯和泳帽造型\" width=\"628\" height=\"628\"/><span class=\"img_descr\">一盏灯和泳帽造型</span></div><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/transform/192/w550h442/20180807/79UE-hhkuskt2013132.jpg\" alt=\"夸张的头饰和眼妆\" width=\"632\" height=\"508\"/><span class=\"img_descr\">夸张的头饰和眼妆</span></div><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/transform/300/w550h550/20180807/hESG-hhkuskt2013534.jpg\" alt=\"\" width=\"633\" height=\"633\"/><span class=\"img_descr\"></span></div><p>　　从专辑写真到演唱会现场，王菲那些又荒诞又充满灵性的妆容，泪痕装、晒伤妆、泡面头，不同的妆发造型似乎隐约让人觉得“天后好忙”。。。。。。</p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/253/w550h503/20190808/e898-iaxiufn9955720.jpg\" alt=\"\" width=\"633\" height=\"580\"/><span class=\"img_descr\"></span></div><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/451/w550h701/20190808/7bf5-iaxiufn9955824.png\" alt=\"\" width=\"626\" height=\"799\"/><span class=\"img_descr\"></span></div><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/194/w489h505/20190808/dab3-iaxiufn9955869.jpg\" alt=\"\" width=\"628\" height=\"649\"/><span class=\"img_descr\"></span></div><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/482/w550h732/20190808/8d19-iaxiufn9955936.jpg\" alt=\"\" width=\"629\" height=\"838\"/><span class=\"img_descr\"></span></div><p>　　50岁生日，对于王菲来说或许就是一场老友聚会，正如她多变的外貌，王菲或许本来就是一个很难被定义的存在，何况年龄这个数字。</p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/crawl/236/w550h486/20190808/b450-iaxiufn9985947.jpg\" alt=\"\" width=\"630\" height=\"557\"/><span class=\"img_descr\"></span></div><div class=\"otherContent_01\" style=\"display: block; margin: 10px 20px 10px 0px; float: left; overflow: hidden; clear: both; padding: 4px; width: 336px; height: 280px;\"><ins><ins></ins></ins></div><p>　　王菲也因此成为一种孤本，一个不可复制的时代偶像。她随时可以再次开始，再次创造更多可能性。</p><div style=\"font-size: 0px; height: 0px; clear: both;\"></div><div style=\"margin-top: 30px; text-align: center;\"></div><div></div></div>', '1');
INSERT INTO `xpcms_article_content` VALUES ('14', '16', '<div class=\"article\"><div></div><p>　　<span style=\"font-family: KaiTi_GB2312, KaiTi;\">导语：2018年8月31日，由凯迪拉克荣誉呈现的“北京当代•艺术展”2018在北京全国农业展览馆盛大揭幕。“北京当代•艺术展” 将从8月30日持续到9月2日，是国内“策展式艺术博览会”的全新尝试，旨在共融、合作的精神下，融汇艺术、时尚、品牌和流行文化，以创新形式构建一个多元的艺术交流平台，推动当代中国艺术的发展。（来源：新浪时尚）</span></p><p>　　作为“北京当代•艺术展”2018首席合作伙伴，与艺术风范结缘百年的凯迪拉克品牌将风范呈现“凯迪拉克众望”单元。此外，新晋燃情上市的新豪华运动SUV——凯迪拉克XT4也将首次亮相，助燃现场。</p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/transform/116/w550h366/20180831/YV1u-hinpmnq6673455.jpg\" alt=\"与艺术风范结缘百年的凯迪拉克品牌正式成为 “北京当代·艺术展”2018首席合作伙伴\"/><span class=\"img_descr\">与艺术风范结缘百年的凯迪拉克品牌正式成为 “北京当代·艺术展”2018首席合作伙伴</span></div><p>　　作为展览的重要组成部分，“凯迪拉克众望”单元把当代艺术中最具有标志性、传播性、参与性的艺术作品在核心空间展现给公众。单元联合中国知名艺术家周力、王郁洋与凯迪拉克XT4精心创作大型装置作品，构建了一场品牌与艺术的对话。当艺术风范与“新豪华”运动型格相遇，凯迪拉克XT4为“众望”注入了新的能量，从而诞生了独具一格的新艺术空间，而两位艺术家的作品也为XT4“此刻，正当燃”的产品主张赋予了全新的艺术性表达。</p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/transform/116/w550h366/20180831/2M0m-hinpmnq6673239.jpg\" alt=\"当艺术风范与“新豪华”运动型格相遇，凯迪拉克XT4为“众望”注入了新的能量\"/><span class=\"img_descr\">当艺术风范与“新豪华”运动型格相遇，凯迪拉克XT4为“众望”注入了新的能量</span></div><p>　　“众望”空间中，由周力带来的作品“环之二”以自由流畅的线条展现了无处不在的运动与能量，与新豪华运动SUV凯迪拉克XT4形成了巧妙的呼应。作为一款极富表现力且彰显个性的车型，凯迪拉克XT4首次采用风尚、运动双外观车身设计策略，以大胆前瞻的设计语言、勇于挑战自我的科技创新，展现出凯迪拉克的非凡个性与瞩目风范。而这两件极具张力的“艺术品”也在不断迸发的力量感中演绎出了独特的艺术表达——每一刻都将成为“当燃”一刻。</p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/transform/116/w550h366/20180831/48yR-hinpmnq6673392.jpg\" alt=\"周力的作品“环之二”与凯迪拉克XT4共同演绎出了独特的艺术表达——每一刻都将成为“当燃”一刻\"/><span class=\"img_descr\">周力的作品“环之二”与凯迪拉克XT4共同演绎出了独特的艺术表达——每一刻都将成为“当燃”一刻</span></div><p>　　“凯迪拉克众望”单元的另一位合作艺术家王郁洋带来的作品“海拔 49.55”则更像是一场超级工业时代背景下的美学实验——材料、技术、空间、思想、感性在其中交相辉映，裂变出无限可能。正如凯迪拉克XT4活力尽“燃”的内饰空间，凭借前卫科技与全新配色的精妙搭配，加之以黑纹理铝、碳纤维饰面等多种材质的全新组合，将汽车设计升至新的“海拔”，带来更具质感与豪华感的全新座舱驾乘体验。</p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/fashion/transform/115/w550h365/20180831/xFz2-hinpmnq6683320.jpg\" alt=\"凯迪拉克始终追求创新突破，将汽车设计升至新的“海拔”，不断创造出引领时代的汽车产品\"/><span class=\"img_descr\">凯迪拉克始终追求创新突破，将汽车设计升至新的“海拔”，不断创造出引领时代的汽车产品</span></div><div class=\"otherContent_01\" style=\"display: block; margin: 10px 20px 10px 0px; float: left; overflow: hidden; clear: both; padding: 4px; width: 336px; height: 280px;\"><ins><ins></ins></ins></div><p>　　上汽通用汽车凯迪拉克品牌总监刘震先生在启幕仪式上表示：“对凯迪拉克而言，胆识、格调、创新的“风范”正是品牌的内核。在近116年的品牌发展历程中，凯迪拉克不断地从艺术中汲取创新的力量，创造出极具代表性并引领时代潮流的经典车型。它们不仅仅是当时汽车工业文明的杰出代表，更映射着不同时代的风范。新晋上市的凯迪拉克XT4就是这样一款专为新生代年轻人群量身打造的风范座驾，满足不同年轻消费群体对个性与审美的独到理解与追求。此次凯迪拉克与‘北京当代’以及两位年轻艺术家的合作，就是希望通过展览将中国当下最前沿的艺术、最新锐的艺术精神以一种全新的面貌展现给大家，让艺术的表现力更加‘燃’情释放。”</p><p>　　在当下，风范是以个性闪烁光芒，用格调成就论调；是拒绝平庸，更是勇敢开始。这个夏天，凯迪拉克邀你一起点“燃”风范，与艺术同行。</p><div style=\"font-size: 0px; height: 0px; clear: both;\"></div><div style=\"margin-top: 30px; text-align: center;\"></div><div></div></div>', '1');
INSERT INTO `xpcms_article_content` VALUES ('15', '17', '<div class=\"article-content-left fL\"><div class=\"ad top-ad\">\r\n					\r\n					<!--640*90通栏    2017/11 wenjing begin--><ins><ins></ins></ins><div></div>\r\n					<!--640*90通栏    end--></div>\r\n								<!-- 引文 start --><div class=\"quotation\"><span class=\"icon quotation-right\"></span><p>新车将于下月法兰克福车展上正式亮相；其中110车型计划将于2020年3月正式开售，而130车型将于2020年8月正式开售。</p><span class=\"icon quotation-left\"></span></div><!-- 引文 end --><div class=\"article clearfix\"><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/auto/transform/490/w640h650/20190828/1a18-icuacsa6056380.jpg\" alt=\"路虎卫士上市时间曝光！将于下月正式首发\"/><span class=\"img_descr\"></span></div><p>　　新浪汽车讯 目前新路虎全新卫士（Defender 110车型）实拍图现已曝光，新车将于下月法兰克福车展上正式亮相；<strong>其中110车型计划将于2020年3月正式开售，而130车型将于2020年8月正式开售。</strong>路虎汽车品牌自诞生以来，凭借旗下产品的出色性能以及车型定位，让其在消费者心中留下了深刻的印象；同时也被诸多越野爱好者们称之为“越野世家”。</p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/auto/transform/200/w640h360/20190828/fb16-icuacsa6057472.jpg\" alt=\"路虎卫士上市时间曝光！将于下月正式首发\"/><span class=\"img_descr\"></span></div><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/auto/transform/480/w640h640/20190828/2ac9-icuacsa6058199.jpg\" alt=\"路虎卫士上市时间曝光！将于下月正式首发\"/><span class=\"img_descr\"></span></div><div class=\"otherContent_01\" style=\"display: block; margin: 10px 20px 10px 0px; float: left; overflow: hidden; clear: both; padding: 4px; width: 336px; height: 280px;\"><ins><ins></ins></ins></div><p>　　动力方面，新车将搭载2.0T及3.0T V6（混动）涡轮增压发动机，最大功率分别为221kW、293kW，峰值扭矩分别为400N.m、640N.m，传动系统均匹配8速手自一体变速箱，并配备四驱系统。尺寸方面，以路虎全新卫士130车型为例，新车长宽高分别为5100×1999×1915mm，轴距3022mm，其车身长度、高度以及轴距已超越奔驰GLE。</p><div style=\"font-size: 0px; height: 0px; clear: both;\"></div><div class=\"show_author\">(责编：林利园)</div></div><!-- 首屏以下css start -->\r\n				<!-- 首屏以下css end --></div>', '1');
INSERT INTO `xpcms_article_content` VALUES ('16', '18', '<div class=\"article clearfix\">\r\n					<!--图集 -->\r\n\r\n						<!-- automove start --><div class=\"movecont\"><ul class=\"clearfix list-paddingleft-2\"><li><p><a href=\"http://db.auto.sina.com.cn/photo/c127806-99-2.html\" target=\"_blank\"><img src=\"//www.sinaimg.cn/qc/autoimg/car/69/49/130864969_950.JPG\" alt=\"选配也有折扣 保时捷Macan限时巨幅优惠\"/></a></p></li><li><p><a href=\"http://db.auto.sina.com.cn/photo/c127806-99-2.html\" target=\"_blank\"><img src=\"//www.sinaimg.cn/qc/autoimg/car/70/49/130864970_950.JPG\" alt=\"选配也有折扣 保时捷Macan限时巨幅优惠\"/></a></p></li><li><p><a href=\"http://db.auto.sina.com.cn/photo/c127806-99-2.html\" target=\"_blank\"><img src=\"//www.sinaimg.cn/qc/autoimg/car/71/49/130864971_950.JPG\" alt=\"选配也有折扣 保时捷Macan限时巨幅优惠\"/></a></p></li><li><p><a href=\"http://db.auto.sina.com.cn/photo/c127806-99-2.html\" target=\"_blank\"><img src=\"//www.sinaimg.cn/qc/autoimg/car/72/49/130864972_950.JPG\" alt=\"选配也有折扣 保时捷Macan限时巨幅优惠\"/></a></p></li><li><p><a href=\"http://db.auto.sina.com.cn/photo/c127806-99-2.html\" target=\"_blank\"><img src=\"//www.sinaimg.cn/qc/autoimg/car/73/49/130864973_950.JPG\" alt=\"选配也有折扣 保时捷Macan限时巨幅优惠\"/></a></p></li><li><p><a href=\"http://db.auto.sina.com.cn/photo/c127806-99-2.html\" target=\"_blank\"><img src=\"//www.sinaimg.cn/qc/autoimg/car/74/49/130864974_950.JPG\" alt=\"选配也有折扣 保时捷Macan限时巨幅优惠\"/></a></p></li><li><p><a href=\"http://db.auto.sina.com.cn/photo/c127806-99-2.html\" target=\"_blank\"><img src=\"//www.sinaimg.cn/qc/autoimg/car/75/49/130864975_950.JPG\" alt=\"选配也有折扣 保时捷Macan限时巨幅优惠\"/></a></p></li></ul><div><div class=\"clearfix\"><img class=\"on\" src=\"//k.sinaimg.cn/www/qc/autoimg/car/69/49/130864969_950.JPG/w180h120t0a06.jpg\" alt=\"选配也有折扣 保时捷Macan限时巨幅优惠\"/><img class=\"\" src=\"//k.sinaimg.cn/www/qc/autoimg/car/70/49/130864970_950.JPG/w180h120t0513.jpg\" alt=\"选配也有折扣 保时捷Macan限时巨幅优惠\"/><img class=\"\" src=\"//k.sinaimg.cn/www/qc/autoimg/car/71/49/130864971_950.JPG/w180h120t0c43.jpg\" alt=\"选配也有折扣 保时捷Macan限时巨幅优惠\"/><img class=\"\" src=\"//k.sinaimg.cn/www/qc/autoimg/car/72/49/130864972_950.JPG/w180h120t0fd2.jpg\" alt=\"选配也有折扣 保时捷Macan限时巨幅优惠\"/><img class=\"\" src=\"//k.sinaimg.cn/www/qc/autoimg/car/73/49/130864973_950.JPG/w180h120t0ac4.jpg\" alt=\"选配也有折扣 保时捷Macan限时巨幅优惠\"/><img class=\"\" src=\"//k.sinaimg.cn/www/qc/autoimg/car/74/49/130864974_950.JPG/w180h120t0e5d.jpg\" alt=\"选配也有折扣 保时捷Macan限时巨幅优惠\"/><img class=\"\" src=\"//k.sinaimg.cn/www/qc/autoimg/car/75/49/130864975_950.JPG/w180h120t03dc.jpg\" alt=\"选配也有折扣 保时捷Macan限时巨幅优惠\"/><img class=\"\" src=\"//k.sinaimg.cn/www/qc/autoimg/car/76/49/130864976_950.JPG/w180h120t0016.jpg\" alt=\"选配也有折扣 保时捷Macan限时巨幅优惠\"/><img class=\"\" src=\"//k.sinaimg.cn/www/qc/autoimg/car/77/49/130864977_950.JPG/w180h120t08b0.jpg\" alt=\"选配也有折扣 保时捷Macan限时巨幅优惠\"/><img class=\"\" src=\"//k.sinaimg.cn/www/qc/autoimg/car/78/49/130864978_950.JPG/w180h120t0627.jpg\" alt=\"选配也有折扣 保时捷Macan限时巨幅优惠\"/></div></div><div></div><div></div></div>\r\n						<!-- automove end -->\r\n						\r\n\r\n<!--文章开头-->\r\n\r\n<!--价格表--><img src=\"http://n.sinaimg.cn/sinacn20190809ac/567/w340h227/20190809/180b-iaxiufp2995496.jpg\" class=\"WX_shareimg\"/><p>作为保时捷中型SUV车型，Macan在去年的销量几乎超过了保时捷旗下的其他所有车型，不仅外观受到大家一致追捧，在性能方面也被称之为是操控最好的SUV之一。而在纯电动车大热的当下，保时捷也决定在这款热销SUV车型上加码，打造纯电动Macan。这也就意味着现有2.0T版本将会成为它的燃油终结版本。</p><p>目前，北京经销商已开始针对Macan清仓，从我们了解到的消息来看，Macan提供了不同配置的选装配置，包括各种外观组件、18寸 Macan S 轮毂、SportDesign 车外后视镜、全景影像、18英寸全天候轮胎、仪表板上的罗盘显示屏、BOSE音响、全景天窗等等，而根据选装的配置不同，选装后的售价也会有所不同。从新浪汽车报名的网友，有机会享受8.8折优惠。具体选装后的价格如下：</p><div class=\"carMarketList-box\"><div class=\"changecity-box\">切换报价城市：</div><table class=\"carMarketList\"><tbody><tr class=\"firstRow\"><td colspan=\"6\" class=\"clearfix\"><span class=\"name\"><a href=\"http://db.auto.sina.com.cn/917/\" title=\"\">Macan</a> </span></td></tr><tr><th>车型名称</th><th>指导价</th><th>优惠幅度</th><th>折扣</th><th>成交价</th><th>优惠购车</th></tr><tr><td><a href=\"http://db.auto.sina.com.cn/car/35557\" title=\"\">Macan</a></td><td>63.38万</td><td><span class=\"price-down\"><em>↓</em>7.61万</span></td><td>8.80折</td><td>55.77万</td><td><span class=\"enlistBtn\">优惠购车</span></td></tr><tr><td><a href=\"http://db.auto.sina.com.cn/car/35557\" title=\"\">Macan</a></td><td>60.71万</td><td><span class=\"price-down\"><em>↓</em>7.29万</span></td><td>8.80折</td><td>53.42万</td><td><span class=\"enlistBtn\">优惠购车</span></td></tr><tr><td><a href=\"http://db.auto.sina.com.cn/car/35557\" title=\"\">Macan</a></td><td>61.60万</td><td><span class=\"price-down\"><em>↓</em>7.39万</span></td><td>8.80折</td><td>54.21万</td><td><span class=\"enlistBtn\">优惠购车</span></td></tr><tr><td><a href=\"http://db.auto.sina.com.cn/car/35557\" title=\"\">Macan</a></td><td>61.88万</td><td><span class=\"price-down\"><em>↓</em>7.43万</span></td><td>8.80折</td><td>54.45万</td><td><span class=\"enlistBtn\">优惠购车</span></td></tr><tr><td><a href=\"http://db.auto.sina.com.cn/car/35557\" title=\"\">Macan</a></td><td>57.57万</td><td><span class=\"price-down\"><em>↓</em>6.91万</span></td><td>8.80折</td><td>50.66万</td><td><span class=\"enlistBtn\">优惠购车</span></td></tr><tr><td><a href=\"http://db.auto.sina.com.cn/car/35557\" title=\"\">Macan</a></td><td>62.18万</td><td><span class=\"price-down\"><em>↓</em>7.46万</span></td><td>8.80折</td><td>54.72万</td><td><span class=\"enlistBtn\">优惠购车</span></td></tr><tr><td><a href=\"http://db.auto.sina.com.cn/car/35557\" title=\"\">Macan</a></td><td>64.16万</td><td><span class=\"price-down\"><em>↓</em>7.70万</span></td><td>8.80折</td><td>56.46万</td><td><span class=\"enlistBtn\">优惠购车</span></td></tr><tr><td><a href=\"http://db.auto.sina.com.cn/car/35557\" title=\"\">Macan</a></td><td>62.98万</td><td><span class=\"price-down\"><em>↓</em>7.56万</span></td><td>8.80折</td><td>55.42万</td><td><span class=\"enlistBtn\">优惠购车</span></td></tr><tr><td><a href=\"http://db.auto.sina.com.cn/car/35557\" title=\"\">Macan</a></td><td>60.87万</td><td><span class=\"price-down\"><em>↓</em>7.30万</span></td><td>8.80折</td><td>53.57万</td><td><span class=\"enlistBtn\">优惠购车</span></td></tr><tr><td><a href=\"http://db.auto.sina.com.cn/car/35557\" title=\"\">Macan</a></td><td>64.65万</td><td><span class=\"price-down\"><em>↓</em>7.76万</span></td><td>8.80折</td><td>56.89万</td><td><span class=\"enlistBtn\">优惠购车</span></td></tr><tr><td><a href=\"http://db.auto.sina.com.cn/car/35557\" title=\"\">Macan</a></td><td>64.24万</td><td><span class=\"price-down\"><em>↓</em>7.71万</span></td><td>8.80折</td><td>56.53万</td><td><span class=\"enlistBtn\">优惠购车</span></td></tr><tr><td><a href=\"http://db.auto.sina.com.cn/car/35557\" title=\"\">Macan</a></td><td>63.50万</td><td><span class=\"price-down\"><em>↓</em>7.62万</span></td><td>8.80折</td><td>55.88万</td><td><span class=\"enlistBtn\">优惠购车</span></td></tr><tr><td><a href=\"http://db.auto.sina.com.cn/car/35557\" title=\"\">Macan</a></td><td>62.50万</td><td><span class=\"price-down\"><em>↓</em>7.50万</span></td><td>8.80折</td><td>55万</td><td><span class=\"enlistBtn\">优惠购车</span></td></tr><tr><td><a href=\"http://db.auto.sina.com.cn/car/35557\" title=\"\">Macan</a></td><td>62.31万</td><td><span class=\"price-down\"><em>↓</em>7.48万</span></td><td>8.80折</td><td>54.83万</td><td><span class=\"enlistBtn\">优惠购车</span></td></tr><tr><td><a href=\"http://db.auto.sina.com.cn/car/35557\" title=\"\">Macan</a></td><td>62.50万</td><td><span class=\"price-down\"><em>↓</em>7.50万</span></td><td>8.80折</td><td>55万</td><td><span class=\"enlistBtn\">优惠购车</span></td></tr><tr><td><a href=\"http://db.auto.sina.com.cn/car/35557\" title=\"\">Macan</a></td><td>63.34万</td><td><span class=\"price-down\"><em>↓</em>7.60万</span></td><td>8.80折</td><td>55.74万</td><td><span class=\"enlistBtn\">优惠购车</span></td></tr><tr><td><a href=\"http://db.auto.sina.com.cn/car/35557\" title=\"\">Macan</a></td><td>60.61万</td><td><span class=\"price-down\"><em>↓</em>7.27万</span></td><td>8.80折</td><td>53.34万</td><td><span class=\"enlistBtn\">优惠购车</span></td></tr><tr><td><a href=\"http://db.auto.sina.com.cn/car/35557\" title=\"\">Macan</a></td><td>60.84万</td><td><span class=\"price-down\"><em>↓</em>7.30万</span></td><td>8.80折</td><td>53.54万</td><td><span class=\"enlistBtn\">优惠购车</span></td></tr><tr><td><a href=\"http://db.auto.sina.com.cn/car/35557\" title=\"\">Macan</a></td><td>61.84万</td><td><span class=\"price-down\"><em>↓</em>7.42万</span></td><td>8.80折</td><td>54.42万</td><td><span class=\"enlistBtn\">优惠购车</span></td></tr><tr><td><a href=\"http://db.auto.sina.com.cn/car/35557\" title=\"\">Macan</a></td><td>60.65万</td><td><span class=\"price-down\"><em>↓</em>7.28万</span></td><td>8.80折</td><td>53.37万</td><td><span class=\"enlistBtn\">优惠购车</span></td></tr><tr><td><a href=\"http://db.auto.sina.com.cn/car/35557\" title=\"\">Macan</a></td><td>61.04万</td><td><span class=\"price-down\"><em>↓</em>7.32万</span></td><td>8.80折</td><td>53.72万</td><td><span class=\"enlistBtn\">优惠购车</span></td></tr><tr><td><a href=\"http://db.auto.sina.com.cn/car/35557\" title=\"\">Macan</a></td><td>59.93万</td><td><span class=\"price-down\"><em>↓</em>7.19万</span></td><td>8.80折</td><td>52.74万</td><td><span class=\"enlistBtn\">优惠购车</span></td></tr><tr><td><a href=\"http://db.auto.sina.com.cn/car/35557\" title=\"\">Macan</a></td><td>60.89万</td><td><span class=\"price-down\"><em>↓</em>7.31万</span></td><td>8.80折</td><td>53.58万</td><td><span class=\"enlistBtn\">优惠购车</span></td></tr><tr><td><a href=\"http://db.auto.sina.com.cn/car/35557\" title=\"\">Macan</a></td><td>61.50万</td><td><span class=\"price-down\"><em>↓</em>7.38万</span></td><td>8.80折</td><td>54.12万</td><td><span class=\"enlistBtn\">优惠购车</span></td></tr><tr><td><a href=\"http://db.auto.sina.com.cn/car/35557\" title=\"\">Macan</a></td><td>61.78万</td><td><span class=\"price-down\"><em>↓</em>7.41万</span></td><td>8.80折</td><td>54.37万</td><td><span class=\"enlistBtn\">优惠购车</span></td></tr><tr><td><a href=\"http://db.auto.sina.com.cn/car/35557\" title=\"\">Macan</a></td><td>62.57万</td><td><span class=\"price-down\"><em>↓</em>7.51万</span></td><td>8.80折</td><td>55.06万</td><td><span class=\"enlistBtn\">优惠购车</span></td></tr><tr><td colspan=\"6\">车市信息变化频繁，具体售价请与当地经销商商谈</td></tr></tbody></table></div><div class=\"fix-bm-bg hide\"><div class=\"bm-content\"><div><h3 class=\"yjian\">填写以下信息，轻松获取<em>优惠价格</em></h3><h4 class=\"bucho\">（您的个人信息我们将严格保密）</h4><div class=\"bm_car\">&nbsp;<em>&nbsp;</em><em>&nbsp;</em></div><div class=\"agreestatement\"><a href=\"http://auto.sina.com.cn/zt_d/hqshengming\" target=\"_blank\">法律声明*</a></div><div class=\"close\">关闭</div></div><div><div class=\"goback\"></div><div class=\"carlist\"><ul class=\" list-paddingleft-2\"><li><div>2016款奥迪A3 1.4T自动Sportback 35TFSI进取型</div><p>指导价：<em>18.49万</em></p></li></ul></div></div><div><div class=\"msg\">提交成功，请注意查收短信</div><div class=\"content\"><div class=\"lab\">查看该车系的用户还看了：</div><ul class=\"car_list list-paddingleft-2\"></ul></div><div class=\"close\">关闭</div></div></div></div><!-- 走势图 -->\r\n<!--价格表——走势图 中间的文案--><p>新浪汽车调研收集了保时捷Macan的近一年的真实成交价，Macan近一个月全国最低成交价为50.51万，新车最高现金优惠4.05万元，新车最大折扣达到9.26折！其中，北京地区保时捷Macan的最低成交价是51.16万，价格仅供参考，实际成交价以当地经销商为准。</p><p>选车买车用车？选辆好车的困难度，都快赶上高考填志愿了！但其实选车并不难，实在就纠结就看销量吧，大家都喜欢的，不会差到哪里去。保时捷Macan近一个月售出3615辆，可以从下方销量走势图看出新车在市场上消费者的认可度。</p><!-- 走势图 start --><div><div class=\"art_t\"><div class=\"art_tit3\">Macan走势图</div></div><div class=\"trendchartbox\"><div class=\"trendlegend clearfix\"><div class=\"fR\"><span class=\"unit1\">成交价&nbsp;&nbsp;单位：万</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<span class=\"unit2\">销量&nbsp;&nbsp;单位：辆</span></div></div><div style=\"-webkit-tap-highlight-color: transparent; user-select: none; position: relative; background: transparent;\"><div style=\"position: relative; overflow: hidden; width: 800px; height: 300px; padding: 0px; margin: 0px; border-width: 0px;\"></div><div></div><div style=\"position:absolute;top:30%;left:676px;width:40px;height:30px;text-align: center;\"><em style=\"display:block;width:8px;height:8px;border: 3px solid #3cbdf7;border-radius: 50%;margin: 0 auto;\"></em><span style=\"font-size:12px;text-align:center\">待更新</span></div></div><div style=\"-webkit-tap-highlight-color: transparent; user-select: none; position: relative; background: transparent;\"><div style=\"position: relative; overflow: hidden; width: 800px; height: 300px; padding: 0px; margin: 0px; border-width: 0px;\"></div><div></div><div style=\"position:absolute;bottom:60px;left:676px;width:40px;height:80px;text-align: center;\"><em style=\"position:absolute;bottom:0px;left:8px;width:13px;height:55px;border: 3px dashed #9bce4a;\"></em><span style=\"position:absolute;top:0px;left:0px;font-size:12px;text-align:center\">待更新</span></div></div></div></div><!-- 走势图 end -->\r\n<!-- 保值率 -->\r\n<!-- 保值率 start --><p>在经历了进口关税的反复调整后，各大厂商纷纷发布了旗下各车型的价格调整幅度，也稳定了二手车车市的行情，但各级别城市保值率环比均有所下降，因此买车的时候绝对不能忽略保值率这块。今年进入6月以后，虽然二手车交易量逐步回暖，但二手车价格却难以抬头，对于消费者而言，倒也是购买二手车不错的机会呢！下图是保时捷Macan的保值率，是否在你可接受的范围内呢？</p><div class=\"premiumRate\"><div class=\"art_t\"><div class=\"art_tit3\">Macan保值率</div></div><div class=\"trendchartbox\"><div style=\"-webkit-tap-highlight-color: transparent; user-select: none; position: relative; background: transparent;\"><div style=\"position: relative; overflow: hidden; width: 680px; height: 400px; padding: 0px; margin: 0px; border-width: 0px;\"></div><div></div></div></div></div><!-- 保值率 end -->\r\n\r\n<!-- 估价 start --><p>而此时如果你正打算换一辆新车，可以通过我们的平台进行二手车估值，看看手上的爱车能卖多少钱？</p><!-- 估价 start --><div class=\"evaluationbox\"><img src=\"http://n.sinaimg.cn/sinacn20190809ac/170/w750h220/20190809/3915-iaxiufp1307157.png\" class=\"seemorebtn\"/><div class=\"art_t\"><div class=\"art_tit3\">估价<span class=\"txt\">旧车想换Macan？算算多少钱？</span></div></div><div class=\"oldcarbox inputmodule\"><div class=\"title\">旧车</div><ul class=\" list-paddingleft-2\"><li><div class=\"carSellCity\"><span class=\"dt\">卖车城市</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<span class=\"selectbtn defaultselectbtn\">请选择</span><div class=\"selectwrap\"></div><div class=\"selectwrap\"></div></div></li><li><div class=\"carBrand\"><span class=\"dt\">品牌车型</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<span class=\"selectbtn defaultselectbtn\">请选择</span><div class=\"selectwrap\"></div><div class=\"selectwrap\"></div><div class=\"selectwrap selectwrap_car\"></div></div></li><li><div class=\"licensingtime\"><span class=\"dt\">上牌时间</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<span class=\"selectbtn defaultselectbtn\">请选择</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<div class=\"selectwrap\"></div><div class=\"selectwrap\"></div></div></li><li><div class=\"mileage\"><span class=\"dt\">行驶里程</span><div class=\"inputwrap\">万公里</div></div></li></ul></div><div class=\"newcarbox inputmodule\"><div class=\"title\">新车</div><ul class=\" list-paddingleft-2\"><li><div class=\"carSellCity\"><span class=\"dt\">购车城市</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<span class=\"selectbtn defaultselectbtn\">请选择</span><div class=\"selectwrap\"></div><div class=\"selectwrap\"></div></div></li><li><div class=\"carBrand\"><span class=\"dt\">品牌车型</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<span class=\"selectbtn defaultselectbtn\">请选择</span><div class=\"selectwrap\"></div><div class=\"selectwrap\"></div><div class=\"selectwrap selectwrap_car\"></div></div></li></ul></div><div class=\"calculationwrap clearfix\"><div class=\"inputwrap\"></div><div class=\"calculationBtn\">开始计算</div><div class=\"warn\">数据由精真估提供。未经您的同意，我们不会将您的个人信息提供给第三方供其向您推广他们的产品或服务。</div></div><div class=\"result_layer\"><div class=\"hd\">估值结果<em class=\"clostbtn\"></em></div><div class=\"bd\"><div class=\"txt\">您想购买的车款名称<span class=\"carname\">2018款Macan S 3.0T自动</span></div><div class=\"baojia\"><span class=\"city\">合肥</span>最低报价为：<span class=\"num nodata\">暂无报价</span><span class=\"num hasdata\"></span></div></div><div class=\"nodatabox hide\"><img src=\"http://n.sinaimg.cn/sinacn20190809ac/172/w698h274/20190809/c8a1-iaxiufp1307170.jpg\"/><div>很抱歉，暂时没有爱车估值信息</div></div><div class=\"hasdatabox\"><ul class=\"tags clearfix list-paddingleft-2\"><li><p>车况较差<em class=\"arrow arrow1\"></em></p></li><li><p>车况一般<em class=\"arrow arrow2\"></em></p></li><li><p>车况较好<em class=\"arrow arrow3\"></em></p></li></ul><div class=\"desc\" style=\"display:block;\"><div>您的爱车车况较差，估值为<span class=\"guzhijia\"></span></div><div class=\"jijinjiabox\">购买新车还能剩下<span class=\"jijinjia\"></span>作为自驾游基金</div></div><div class=\"desc\"><div>您的爱车车况一般，估值为<span class=\"guzhijia\"></span></div><div class=\"jijinjiabox\">购买新车还能剩下<span class=\"jijinjia\"></span>作为自驾游基金</div></div><div class=\"desc\"><div>您的爱车车况较好，估值为<span class=\"guzhijia\"></span></div><div class=\"jijinjiabox\">购买新车还能剩下<span class=\"jijinjia\"></span>作为自驾游基金</div></div><div class=\"warn\">*精真估技术支持。由于政策、市场和车况等因素，价格会有所波动，根据实际车况，价格略有差异。请以实际成交价为准。</div></div></div></div><!-- 估价 end -->\r\n<!-- 口碑 --><p>接下来看看消费者们对保时捷Macan的评价吧，如果综合得分满分是5分，那么保时捷Macan的得分就是4.33分，成绩还算可以。\r\n &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;其中保时捷Macan在外观和动力方面的表现最为突出，所以消费者对外观和动力这块比较看重的，\r\n &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;那么保时捷Macan可以重点考虑哦。\r\n &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;因为每一位用户对车的需求不同，用途不同，感受也不同，所以评价仅仅作为参考，最靠谱的还是要多去店里亲身试车，即使无法上路试驾，也要在车里多坐坐，好好感受下。</p><!-- 口碑 start --><div><div class=\"art_t\"><div class=\"art_tit3\">Macan口碑</div></div><div class=\"koubeibox clearfix\"><div class=\"fL reputationcircle_V2\"><div class=\"circle\"><div class=\"zhpf\">综合评分</div><div class=\"t\"><span class=\"num\">4.33</span>分</div><div class=\"b\">来自<span class=\"num\">700</span>个用户</div></div></div><div class=\"trendchart4_V2\" style=\"-webkit-tap-highlight-color: transparent; user-select: none; position: relative; background: transparent;\"><div style=\"position: relative; overflow: hidden; width: 550px; height: 250px; padding: 0px; margin: 0px; border-width: 0px; cursor: default;\"></div><div></div></div></div><ul class=\"kbpinglunlist kb list-paddingleft-2\"><li><div class=\"username\">小*男<div class=\"star\"><div class=\"star_in\"><span class=\"i \"> </span><span class=\"i \"> </span><span class=\"i \"> </span><span class=\"i \"> </span><span class=\"i \"> </span></div></div></div><div class=\"hd\">评论车型：2.0T 双离合 四驱 Macan</div><div class=\"bd\"><!--<div class=\"t1\">空间：</div>--><div class=\"t2\">我186，媳妇155。空间看怎么分配，如果媳妇开车带宝宝，配合超大的储物后备箱空间，我认为满分，我在前排无压力很宽敞，后排就是腿部空间局促，顶到膝盖而已，横向空间很好。</div></div></li><li><div class=\"username\">起个名字叫我<div class=\"star\"><div class=\"star_in\"><span class=\"i \"> </span><span class=\"i \"> </span><span class=\"i \"> </span><span class=\"i \"> </span><span class=\"i \"> </span></div></div></div><div class=\"hd\">评论车型：2.0T 双离合 四驱 Macan</div><div class=\"bd\"><!--<div class=\"t1\">外观：</div>--><div class=\"t2\">外观必须满分，不论车头还是车尾都满分车头车尾</div></div></li><li><div class=\"username\">terryxi<div class=\"star\"><div class=\"star_in\"><span class=\"i \"> </span><span class=\"i \"> </span><span class=\"i \"> </span><span class=\"i g\"> </span><span class=\"i g\"> </span></div></div></div><div class=\"hd\">评论车型：2.0T 双离合 四驱 Macan</div><div class=\"bd\"><!--<div class=\"t1\">空间：</div>--><div class=\"t2\">前排还行，后排实在太小。以后还是给老婆用。</div></div></li></ul></div><!-- 口碑 end -->\r\n\r\n<!-- 竞品销量 --><p>如果看了以上这些，您对保时捷Macan是否值得买还存有疑惑，那么还可以看看保时捷Macan竞品们的表现，在以下这些竞品当中，上个月销量最大的是奔驰GLC级（进口），为1571辆，这么多车总有一款适合你。</p><div class=\"car_zoushi car_zoushi_V2\"><div class=\"xlang\"><div class=\"item\"><div class=\"art_t\">6月销量：3615辆</div></div><div class=\"item\"><div class=\"art_t\">6月成交价：56.84万</div></div></div></div><!-- 竞品销量 start --><div><div class=\"art_t\"><div class=\"art_tit3\">竞品车型月销量<span class=\"txt\">(单位：辆)</span></div></div><div class=\"jingpinsaleslistbox\"><ul class=\" list-paddingleft-2\"><li><p><a href=\"//db.auto.sina.com.cn/1798/\" class=\"img\"> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<img src=\"http://n.sinaimg.cn/auto-article/hq/567/w340h227/20190312/auto-hufnxfm4425088.png\" alt=\"选配也有折扣 保时捷Macan限时巨幅优惠\"/> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<span class=\"tag\">7.3折起</span></a></p><div class=\"carname\"><a href=\"//db.auto.sina.com.cn/1798/\" class=\"img\">捷豹F-PACE</a></div><p></p><div class=\"jingpin_charslist\"><div class=\"title\"><div class=\"tit\">2019年总销量<span class=\"highlight\">3417</span></div></div><div class=\"trendchartbox\"><div class=\"trendchart_jingpin\" style=\"-webkit-tap-highlight-color: transparent; user-select: none; background: transparent;\"><div style=\"position: relative; overflow: hidden; width: 490px; height: 225px; padding: 0px; margin: 0px; border-width: 0px; cursor: default;\"></div></div></div></div></li><ul class=\"xiaoliangnum list-paddingleft-2\" style=\"list-style-type: square;\"><li><p>855</p></li><li><p>580</p></li><li><p>524</p></li><li><p>19-06</p></li><li><p>19-05</p></li><li><p>19-04</p></li></ul><li><p><a href=\"//db.auto.sina.com.cn/889/\" class=\"img\"> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<img src=\"http://n.sinaimg.cn/auto-article/hq/567/w340h227/20180918/auto-hkhfqns4148926.png\" alt=\"选配也有折扣 保时捷Macan限时巨幅优惠\"/> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<span class=\"tag\">7.7折起</span></a></p><div class=\"carname\"><a href=\"//db.auto.sina.com.cn/889/\" class=\"img\">揽胜极光（进口）</a></div><p></p><div class=\"jingpin_charslist\"><div class=\"title\"><div class=\"tit\">2019年总销量<span class=\"highlight\">317</span></div></div><div class=\"trendchartbox\"><div class=\"trendchart_jingpin\" style=\"-webkit-tap-highlight-color: transparent; user-select: none; background: transparent;\"><div style=\"position: relative; overflow: hidden; width: 490px; height: 225px; padding: 0px; margin: 0px; border-width: 0px; cursor: default;\"></div></div></div></div></li><ul class=\"xiaoliangnum list-paddingleft-2\" style=\"list-style-type: square;\"><li><p>190</p></li><li><p>36</p></li><li><p>33</p></li><li><p>19-06</p></li><li><p>19-05</p></li><li><p>19-04</p></li></ul><li><p><a href=\"//db.auto.sina.com.cn/1613/\" class=\"img\"> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<img src=\"http://n.sinaimg.cn/auto-article/hq/567/w340h227/20190806/auto-iatixpm8915405.png\" alt=\"选配也有折扣 保时捷Macan限时巨幅优惠\"/> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<span class=\"tag\">9.1折起</span></a></p><div class=\"carname\"><a href=\"//db.auto.sina.com.cn/1613/\" class=\"img\">宝马X4</a></div><p></p><div class=\"jingpin_charslist\"><div class=\"title\"><div class=\"tit\">2019年总销量<span class=\"highlight\">5497</span></div></div><div class=\"trendchartbox\"><div class=\"trendchart_jingpin\" style=\"-webkit-tap-highlight-color: transparent; user-select: none; background: transparent;\"><div style=\"position: relative; overflow: hidden; width: 490px; height: 225px; padding: 0px; margin: 0px; border-width: 0px; cursor: default;\"></div></div></div></div></li><ul class=\"xiaoliangnum list-paddingleft-2\" style=\"list-style-type: square;\"><li><p>1057</p></li><li><p>1060</p></li><li><p>1097</p></li><li><p>19-06</p></li><li><p>19-05</p></li><li><p>19-04</p></li></ul><li><p><a href=\"//db.auto.sina.com.cn/2178/\" class=\"img\"> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<img src=\"http://n.sinaimg.cn/auto-article/hq/566/w340h226/20180913/auto-fzrwica4377376.png\" alt=\"选配也有折扣 保时捷Macan限时巨幅优惠\"/> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<span class=\"tag\">9.3折起</span></a></p><div class=\"carname\"><a href=\"//db.auto.sina.com.cn/2178/\" class=\"img\">奔驰GLC级（进口）</a></div><p></p><div class=\"jingpin_charslist\"><div class=\"title\"><div class=\"tit\">2019年总销量<span class=\"highlight\">7393</span></div></div><div class=\"trendchartbox\"><div class=\"trendchart_jingpin\" style=\"-webkit-tap-highlight-color: transparent; user-select: none; background: transparent;\"><div style=\"position: relative; overflow: hidden; width: 490px; height: 225px; padding: 0px; margin: 0px; border-width: 0px; cursor: default;\"></div></div></div></div></li><ul class=\"xiaoliangnum list-paddingleft-2\" style=\"list-style-type: square;\"><li><p>1217</p></li><li><p>1223</p></li><li><p>1238</p></li><li><p>19-06</p></li><li><p>19-05</p></li><li><p>19-04</p></li></ul><li><p><a href=\"//db.auto.sina.com.cn/2486/\" class=\"img\"> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<img src=\"http://n.sinaimg.cn/auto-article/hq/567/w340h227/20181118/auto-hnyuqhh7697920.png\" alt=\"选配也有折扣 保时捷Macan限时巨幅优惠\"/> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<span class=\"tag\">8.6折起</span></a></p><div class=\"carname\"><a href=\"//db.auto.sina.com.cn/2486/\" class=\"img\">AMG GLC</a></div><p></p><div class=\"jingpin_charslist\"><div class=\"title\"><div class=\"tit\">2019年总销量<span class=\"highlight\">1803</span></div></div><div class=\"trendchartbox\"><div class=\"trendchart_jingpin\" style=\"-webkit-tap-highlight-color: transparent; user-select: none; background: transparent;\"><div style=\"position: relative; overflow: hidden; width: 490px; height: 225px; padding: 0px; margin: 0px; border-width: 0px; cursor: default;\"></div></div></div></div></li><ul class=\"xiaoliangnum list-paddingleft-2\" style=\"list-style-type: square;\"><li><p>361</p></li><li><p>323</p></li><li><p>358</p></li><li><p>19-06</p></li><li><p>19-05</p></li><li><p>19-04</p></li></ul><li><p><a href=\"//db.auto.sina.com.cn/502/\" class=\"img\"> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<img src=\"http://n.sinaimg.cn/auto-article/hq/566/w340h226/20180913/auto-fzrwica4377405.png\" alt=\"选配也有折扣 保时捷Macan限时巨幅优惠\"/> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<span class=\"tag\">9.9折起</span></a></p><div class=\"carname\"><a href=\"//db.auto.sina.com.cn/502/\" class=\"img\">牧马人</a></div><p></p><div class=\"jingpin_charslist\"><div class=\"title\"><div class=\"tit\">2019年总销量<span class=\"highlight\">3160</span></div></div><div class=\"trendchartbox\"><div class=\"trendchart_jingpin\" style=\"-webkit-tap-highlight-color: transparent; user-select: none; background: transparent;\"><div style=\"position: relative; overflow: hidden; width: 490px; height: 225px; padding: 0px; margin: 0px; border-width: 0px; cursor: default;\"></div></div></div></div></li><ul class=\"xiaoliangnum list-paddingleft-2\" style=\"list-style-type: square;\"><li><p>631</p></li><li><p>401</p></li><li><p>717</p></li><li><p>19-06</p></li><li><p>19-05</p></li><li><p>19-04</p></li></ul></ul></div></div><div class=\"otherContent_01\" style=\"display: block; margin: 10px 20px 10px 0px; float: left; overflow: hidden; clear: both; padding: 4px; width: 336px; height: 280px;\"><ins><ins></ins></ins></div><p>如果近期Macan的价格合适，那么小伙伴们就赶紧出手吧！全国38个城市联动促销，更有低至7折优惠车型，<a href=\"http://auto.sina.com.cn/info/?c=spr_auto_trackid_33c52fce4c01428f\">猛戳：</a></p><div style=\"font-size: 0px; height: 0px; clear: both;\"></div><div></div><div style=\"margin-top: 30px; text-align: center;\"></div><div></div></div>', '1');
INSERT INTO `xpcms_article_content` VALUES ('17', '19', '<div class=\"article clearfix\"><p>　　近日，标致汽车正式公布了旗下小型电动车标致e-208在英国市场的售价，新车共提供四款配置车型，其中入门版车型的起售价格高达25050英镑（约合22万元人民币）。</p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/auto/transform/318/w660h458/20190828/baad-icuacsa5590053.png\" alt=\"起售价约合人民币22万 标致e-208公布英国市场售价\"/><span class=\"img_descr\"></span></div><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/auto/transform/290/w660h430/20190828/ee3d-icuacsa5590649.png\" alt=\"起售价约合人民币22万 标致e-208公布英国市场售价\"/><span class=\"img_descr\"></span></div><p>　　Active车型作为入门款，配置水准比较高，提供i-Cockpit仪表、7英寸触控屏、定速巡航、车道保持辅助系统、主动制动、CarPlay、自动空调等配置。另外三款中高配车型则根据配置不同售价分别为26250英镑（约合23万元人民币）、28100英镑（24.6万元人民币）和29650英镑（26万元人民币）。以上所有价格都已包含了英国政府提供的3500英镑新能源购车补贴。</p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/auto/transform/329/w660h469/20190828/7bda-icuacsa5592169.png\" alt=\"起售价约合人民币22万 标致e-208公布英国市场售价\"/><span class=\"img_descr\"></span></div><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/auto/transform/311/w660h451/20190828/a2e3-icuacsa5591248.png\" alt=\"起售价约合人民币22万 标致e-208公布英国市场售价\"/><span class=\"img_descr\"></span></div><div class=\"otherContent_01\" style=\"display: block; margin: 10px 20px 10px 0px; float: left; overflow: hidden; clear: both; padding: 4px; width: 336px; height: 280px;\"><ins><ins></ins></ins></div><p>　　标致e-208搭载电量为50kWh的动力电池，WLTP工况下续航里程为340km（NEDC工况下续航里程为450km）。驱动电机最大功率为100kW（154Ps），最大扭矩为260N·m，0-50km/h加速时间为2.8秒，0-100km/h的加速时间为8.1秒。（消息来源：drivingelectric）</p><div style=\"font-size: 0px; height: 0px; clear: both;\"></div><div class=\"show_author\">(责编：刘明亮)</div><div style=\"margin-top: 30px; text-align: center;\"></div><div></div></div>', '1');
INSERT INTO `xpcms_article_content` VALUES ('18', '20', '<div class=\"article clearfix\"><p>　　日前，奔驰官方消息，北京奔驰AMG A 35 L车型将于9月5日开幕的成都车展上正式开启预售。新车于2019年上海车展正式首发，作为首款国产的AMG，新车将进一步拉低AMG车型的门槛。新车基于国产奔驰A级三厢车型打造而来，加入更多空气动力学套件，与海外版A 35车型样貌基本保持一致。</p><div class=\"img_wrapper\"><a href=\"http://n2.sinaimg.cn/auto/transform/322/w660h462/20190406/s3ti-hvhrcxm3836215.jpg\" target=\"_blank\"><img src=\"http://n.sinaimg.cn/auto/transform/322/w660h462/20190406/s3ti-hvhrcxm3836215.jpg\" alt=\"首款国产AMG 北京奔驰AMG A 35 L成都车展开启预售\"/></a><span class=\"img_descr\"></span></div><div class=\"img_wrapper\"><a href=\"http://n0.sinaimg.cn/auto/transform/231/w660h371/20190406/omDl-hvhrcxm3847294.jpg\" target=\"_blank\"><img src=\"http://n.sinaimg.cn/auto/transform/231/w660h371/20190406/omDl-hvhrcxm3847294.jpg\" alt=\"海外版AMG A35\"/></a><span class=\"img_descr\">海外版AMG A35</span></div><p>　　国产AMG A 35 L车型的外观与海外版车型保持高度一致，在A级三厢车的基础上加入性能套件以提升运动性能。轮毂造型与海外版不同，与现款国产A级的轮毂保持一致。由于国产A级为经过了加长，轴距2789mm，谍照中这台车的侧面很显修长，预计其轴距将与国产A级三厢保持一致。</p><div class=\"img_wrapper\"><a href=\"http://n1.sinaimg.cn/auto/transform/323/w660h463/20190406/C4Pp-hvhrcxm3836222.jpg\" target=\"_blank\"><img src=\"http://n.sinaimg.cn/auto/transform/323/w660h463/20190406/C4Pp-hvhrcxm3836222.jpg\" alt=\"首款国产AMG 北京奔驰AMG A 35 L成都车展开启预售\"/></a><span class=\"img_descr\"></span></div><div class=\"img_wrapper\"><a href=\"http://n0.sinaimg.cn/auto/transform/231/w660h371/20190406/PWJZ-hvhrcxm3847271.jpg\" target=\"_blank\"><img src=\"http://n.sinaimg.cn/auto/transform/231/w660h371/20190406/PWJZ-hvhrcxm3847271.jpg\" alt=\"海外版AMG A35\"/></a><span class=\"img_descr\">海外版AMG A35</span></div><div class=\"otherContent_01\" style=\"display: block; margin: 10px 20px 10px 0px; float: left; overflow: hidden; clear: both; padding: 4px; width: 336px; height: 280px;\"><ins><ins></ins></ins></div><p>　　车尾造型同样与海外版A35车型基本一致，采用双边共双出排气布局，装备黑色下扰流板，车尾AMG、A 35 L位置与海外版不同，被设置在尾灯上方，表明其身份的北京奔驰标识则放置在尾灯下方。</p><p>　　动力方面，国产车型的信息还未透露，但有望保持海外版车型动力，搭载一台全新2.0T四缸涡轮增压发动机，最大功率306马力，最大扭矩400N·m，匹配AMG SPEEDSHIFT DCT 7G横置湿式双离合变速箱，以及AMG Performance 4MATIC四驱系统。</p><div style=\"font-size: 0px; height: 0px; clear: both;\"></div><div class=\"show_author\">(责编：刘明亮)</div><div style=\"margin-top: 30px; text-align: center;\"></div><div></div></div>', '1');
INSERT INTO `xpcms_article_content` VALUES ('19', '21', '<div class=\"article clearfix\"><p>　　日前，有海外媒体报关了一组宝马X6纯黑色特别版图片，其将于9月10日开幕的法兰克福车展上正式亮相。新车外观采用Vantablack VBx2涂层，这一材质可吸收超过99%的可见光。从图片上看，全新宝马X6的设计细节已经无法清晰辨别。</p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/auto/transform/231/w660h371/20190828/fa91-icuacsa5495464.jpg\" alt=\"法兰克福车展亮相 宝马X6纯黑色特别版官图曝光\"/><span class=\"img_descr\"></span></div><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/auto/transform/231/w660h371/20190828/5c04-icuacsa5496324.jpg\" alt=\"法兰克福车展亮相 宝马X6纯黑色特别版官图曝光\"/><span class=\"img_descr\"></span></div><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/auto/transform/231/w660h371/20190828/68cb-icuacsa5497042.jpg\" alt=\"法兰克福车展亮相 宝马X6纯黑色特别版官图曝光\"/><span class=\"img_descr\"></span></div><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/auto/transform/231/w660h371/20190828/e34f-icuacsa5498972.jpg\" alt=\"法兰克福车展亮相 宝马X6纯黑色特别版官图曝光\"/><span class=\"img_descr\"></span></div><p>　　据悉，这一设计是宝马与Vantablack制造商以及创意机构一起合作而来。其目的是为了隐藏全新一代宝马X6的创新设计。根据宝马的说法，非反光颜色可以使物体看起来像二维的，搭配酷黑的涂装，使得全新宝马X6看起来更具威慑力。</p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/auto/transform/240/w640h400/20190821/5bfc-icmpfxc1723394.png\" alt=\"法兰克福车展亮相 宝马X6纯黑色特别版官图曝光\"/><span class=\"img_descr\"></span></div><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/auto/transform/160/w640h320/20190821/c8ec-icmpfxc1725267.png\" alt=\"法兰克福车展亮相 宝马X6纯黑色特别版官图曝光\"/><span class=\"img_descr\"></span></div><p>　　宝马官方已经发布了新款X6的官图，全新宝马X6在延续动感设计的同时也将采用更大的双肾进气格栅，雾灯区设计也将进行同步更改，而在部分车型上预计也将会配备全新的激光头灯。</p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/auto/transform/266/w640h426/20190821/5955-icmpfxc1726703.png\" alt=\"法兰克福车展亮相 宝马X6纯黑色特别版官图曝光\"/><span class=\"img_descr\"></span></div><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/auto/transform/160/w640h320/20190821/dcf1-icmpfxc1727188.png\" alt=\"法兰克福车展亮相 宝马X6纯黑色特别版官图曝光\"/><span class=\"img_descr\"></span></div><p>　　而在车尾设计上，X6则配合动感的溜背设计进一步强化了运动化的视觉型格，全新的立体悬浮尾灯并没有直接沿用X5的设计，更加狭长的尾灯配合押尾尾翼、双边共双出排气装饰（内部为双边共四出）以及运动化的导流口，宣示着不同于X5的运动属性。</p><div class=\"img_wrapper\"><a href=\"http://n3.sinaimg.cn/auto/transform/184/w630h354/20190821/312f-icmpfxc1731816.png\" target=\"_blank\"><img src=\"http://n.sinaimg.cn/auto/transform/160/w640h320/20190821/9b13-icmpfxc1732893.png\" alt=\"法兰克福车展亮相 宝马X6纯黑色特别版官图曝光\"/></a><span class=\"img_descr\"></span></div><div class=\"img_wrapper\"><a href=\"http://n2.sinaimg.cn/auto/transform/184/w630h354/20190821/3587-icmpfxc1731826.png\" target=\"_blank\"><img src=\"http://n.sinaimg.cn/auto/transform/266/w640h426/20190821/3c65-icmpfxc1733544.png\" alt=\"法兰克福车展亮相 宝马X6纯黑色特别版官图曝光\"/></a><span class=\"img_descr\"></span></div><p>　　内饰方面，X6采用与全新宝马X5保持一致的设计风格，包括全液晶仪表盘、12.3英寸的中控屏以及全新造型的空调设计区域，此外全新设计的鸡腿挡把造型和iDrive 7系统也有所应用。配置方面，新车将配备环境氛围灯、带加热/冷却的杯架、20个扬声器的Bowers&amp;Wilkins钻石环绕声音响以及主动安全配置。</p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/auto/transform/266/w640h426/20190821/9c0a-icmpfxc1728299.png\" alt=\"法兰克福车展亮相 宝马X6纯黑色特别版官图曝光\"/><span class=\"img_descr\"></span></div><div class=\"otherContent_01\" style=\"display: block; margin: 10px 20px 10px 0px; float: left; overflow: hidden; clear: both; padding: 4px; width: 336px; height: 280px;\"><ins><ins></ins></ins></div><p>　　动力方面，40i车型将搭载3.0T&nbsp;直列6缸发动机，最大功率249kW，最大扭矩447Nm，sDrive车型0-96km/h的加速时间为5.2秒，xDrive车型的加速时间为5.3秒。此外，宝马X6还提供搭载4.4T V8双涡轮增压发动机的M50i车型，其最大功率可达390kW，最大扭矩750Nm，0-96km/h的加速时间为4.1秒。</p><div style=\"font-size: 0px; height: 0px; clear: both;\"></div><div class=\"show_author\">(责编：刘明亮)</div><div style=\"margin-top: 30px; text-align: center;\"></div><div></div></div>', '1');
INSERT INTO `xpcms_article_content` VALUES ('20', '22', '<div class=\"article clearfix\"><p>　　日前，我们从上汽荣威官方获悉，荣威RX5 MAX将于今晚正式上市，预售价区间为14.98万-17.98万元。荣威RX5 MAX采用家族最新的设计语言，轴距达到2760mm，内饰配备了12.3英寸全液晶仪表+14.3英寸2.5D四曲面大屏，动力方面搭载1.5T、2.0T、1.5T插电混动三种供选择。</p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/auto/transform/299/w660h439/20190828/bbad-icuacsa5049572.jpg\" alt=\"荣威RX5 MAX今晚上市 预售14.98万元起\"/><span class=\"img_descr\"></span></div><p>　　荣威RX5 MAX采用了荣威最新的家族式设计，整体设计风格方正，与现款荣威RX5和RX8等车型同风格，显得较有整体感。同时，荣威RX5 MAX采用了全新造型的头灯，带有折线设计的外圈LED灯带与格栅相连，而内部则采用了点阵式LED光源，具有不错的视觉效果。此外，新车主打的“5G蓝”车漆，未来还将提供聚变红、暗质黑、纳米白、引力棕和超星金颜色。</p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/auto/transform/299/w660h439/20190828/f441-icuacsa5050557.jpg\" alt=\"荣威RX5 MAX今晚上市 预售14.98万元起\"/><span class=\"img_descr\"></span></div><p>　　车身侧面，荣威RX5 MAX同样采用了较为硬朗的设计风格，车尾部分，荣威RX5 MAX尾灯采用了环装LED灯带的设计，其造型与头灯形成呼应。车身尺寸方面，荣威RX5 MAX长宽高分别为4647/1891/1725mm，轴距为2760mm。</p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/auto/transform/299/w660h439/20190828/a1f9-icuacsa5053379.jpg\" alt=\"荣威RX5 MAX今晚上市 预售14.98万元起\"/><span class=\"img_descr\"></span></div><p>　　内饰方面，荣威RX5 MAX内饰整体采用了黑色设计，采用浅灰色进行细节点缀，使内饰看上去档次感十足。中控台、方向盘等处采用了镀铬元素进行细节点缀，增强了该车的豪华感。配置方面，荣威RX5 MAX搭载12.3英寸全景AR模式虚拟仪表、14.3英寸2.5D四曲面中控大屏，并且内部集成了智行3.0系统，科技感进一步提升。据官方的资料显示，荣威RX5 MAX在车内设置了30处储物空间，实现每个角落的最大化合理应用，其中门板槽能放下13英寸的笔记本电脑，更好的满足消费者的储物需求。</p><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/auto/transform/299/w660h439/20190828/54f6-icuacsa5054070.jpg\" alt=\"荣威RX5 MAX今晚上市 预售14.98万元起\"/><span class=\"img_descr\"></span></div><div class=\"otherContent_01\" style=\"display: block; margin: 10px 20px 10px 0px; float: left; overflow: hidden; clear: both; padding: 4px; width: 336px; height: 280px;\"><ins><ins></ins></ins></div><p>　　动力方面，荣威RX5 MAX搭载1.5T和2.0T发动机，最大功率分别为127kW（173Ps）和170kW（231Ps）。传动方面匹配6AT变速箱和6速湿式双离合变速箱。此外，据悉荣威RX5 MAX还将提供1.5T插电混动版车型供选择。</p><div style=\"font-size: 0px; height: 0px; clear: both;\"></div><div class=\"show_author\">(责编：刘腾)</div><div style=\"margin-top: 30px; text-align: center;\"></div><div></div></div>', '1');
INSERT INTO `xpcms_article_content` VALUES ('21', '23', '<div class=\"article clearfix\"><p>　　日前，奔驰官方正式发布了全新GLE COUPE和AMG GLE53两款车型的官图照片，新车外观采用去全新GEL相同的家族化设计，内饰也同样得到升级，GLE COUPE更具豪华运动感，相比GLE Coupe，AMG GLE53的外观和内饰更具有性能感，并搭载3.0T双涡轮发动机。</p><div class=\"art_t\"><div class=\"art_tit3\">Mercedes-Benz GLE COUPE</div></div><div class=\"img_wrapper\"><a href=\"http://n1.sinaimg.cn/auto/transform/355/w660h495/20190828/a069-icuacsa4645499.jpg\" target=\"_blank\"><img src=\"http://n.sinaimg.cn/auto/transform/266/w640h426/20190828/fe59-icuacsa4708804.jpg\" alt=\"换家族新设计 奔驰GLE Coupe/GLE53发布\"/></a><span class=\"img_descr\"></span></div><div class=\"img_wrapper\"><a href=\"http://n0.sinaimg.cn/auto/transform/355/w660h495/20190828/45ec-icuacsa4645598.jpg\" target=\"_blank\"><img src=\"http://n.sinaimg.cn/auto/transform/266/w640h426/20190828/ae48-icuacsa4709656.jpg\" alt=\"换家族新设计 奔驰GLE Coupe/GLE53发布\"/></a><span class=\"img_descr\"></span></div><p>　　外观方面，全新GLE Coupe与全新GLE采用相同的设计，前脸换装奔驰家族的最新设计语言，标志性的三叉星辉LOGO贯穿前中网，分体式的远近光全LED大灯，并且内部采用 “双L”形日间行车灯。</p><div class=\"img_wrapper\"><a href=\"http://n2.sinaimg.cn/auto/transform/355/w660h495/20190828/0f0a-icuacsa4645538.jpg\" target=\"_blank\"><img src=\"http://n.sinaimg.cn/auto/transform/266/w640h426/20190828/003c-icuacsa4710328.jpg\" alt=\"换家族新设计 奔驰GLE Coupe/GLE53发布\"/></a><span class=\"img_descr\"></span></div><p>　　车身侧面，新车将继续保留标志性的溜背设计，营造运动感。同时，新车尾灯灯组同样为双环状LED灯带，这也是奔驰目前最新的家族式造型。</p><div class=\"img_wrapper\"><a href=\"http://n3.sinaimg.cn/auto/transform/355/w660h495/20190828/36b2-icuacsa4645553.jpg\" target=\"_blank\"><img src=\"http://n.sinaimg.cn/auto/transform/266/w640h426/20190828/ded7-icuacsa4710771.jpg\" alt=\"换家族新设计 奔驰GLE Coupe/GLE53发布\"/></a><span class=\"img_descr\"></span></div><p>　　内饰部分，全新GLE Coupe也将采用与GLE相同的内饰设计，配备12.3英寸双液晶屏，触控流畅并支持智能语音操控，匹配MBUX人机交互系统。三幅式方向盘集成多种功能按钮，整车内饰的豪华与科技感很足。</p><div class=\"img_wrapper\"><a href=\"http://n3.sinaimg.cn/auto/transform/355/w660h495/20190828/128d-icuacsa4645576.jpg\" target=\"_blank\"><img src=\"http://n.sinaimg.cn/auto/transform/266/w640h426/20190828/e5a7-icuacsa4711171.jpg\" alt=\"换家族新设计 奔驰GLE Coupe/GLE53发布\"/></a><span class=\"img_descr\"></span></div><p>　　全新GLE Coupe将与GLE共享动力和底盘系统。作为参考，海外版全新GLE先期将提供了GLE 450 4MATIC型号，搭载3.0T直列六缸汽油发动机，并采用48V微混系统，最大功率367马力，峰值扭矩500牛·米。传动方面，该车搭载9G-TRONIC自动变速箱，并配备全新全时四驱系统 （4MATIC），能实现0：100的前后轴扭矩分配。而未来新车也将推出动力更强的AMG车型和更环保的插电式混动车型。</p><div class=\"art_t\"><div class=\"art_tit3\">Mercedes-Benz GLE53 AMG 4Matic Coupe</div></div><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/auto/transform/266/w640h426/20190828/5af7-icuacsa4711927.jpg\" alt=\"换家族新设计 奔驰GLE Coupe/GLE53发布\"/><span class=\"img_descr\"></span></div><p>　　而在全新奔驰AMG GLE53 Coupe方面，新车采用AMG家族化直瀑样式中网，配备了AMG风格的夸张包围，整体运动感更像，轮毂采用双片式多辐条设计，熏黑处理更突出红色性能刹车卡钳。</p><div class=\"img_wrapper\"><a href=\"http://n3.sinaimg.cn/auto/transform/355/w660h495/20190828/b74f-icuacsa4672135.jpg\" target=\"_blank\"><img src=\"http://n.sinaimg.cn/auto/transform/266/w640h426/20190828/8152-icuacsa4712708.jpg\" alt=\"换家族新设计 奔驰GLE Coupe/GLE53发布\"/></a><span class=\"img_descr\"></span></div><p>　　全新奔驰AMG GLE53 Coupe采用了规格为285/40/R22的米其林轮胎，红色的6活塞AMG刹车卡钳都表现出了很强的性能感。全新奔驰AMG GLE53 Coupe的侧面看上去非常动感，它采用了很动感的圆润的溜背设计，车尾部还设计了小鸭尾。</p><div class=\"img_wrapper\"><a href=\"http://n0.sinaimg.cn/auto/transform/355/w660h495/20190828/832f-icuacsa4672128.jpg\" target=\"_blank\"><img src=\"http://n.sinaimg.cn/auto/transform/266/w640h426/20190828/efc0-icuacsa4713549.jpg\" alt=\"换家族新设计 奔驰GLE Coupe/GLE53发布\"/></a><span class=\"img_descr\"></span></div><p>　　来到车位，与普通版车型最大的区别在于后包围的样式，并且GLE53采用了双边共四出的圆口性能排气系统。</p><div class=\"img_wrapper\"><a href=\"http://n2.sinaimg.cn/auto/transform/355/w660h495/20190828/d50c-icuacsa4672081.jpg\" target=\"_blank\"><img src=\"http://n.sinaimg.cn/auto/transform/266/w640h426/20190828/677a-icuacsa4714224.jpg\" alt=\"换家族新设计 奔驰GLE Coupe/GLE53发布\"/></a><span class=\"img_descr\"></span></div><p>　　内饰方面，方向盘换装了AMG风格的平底设计。另外它的中控面板和地台面板的材质和普通版本的车型也不相同，车的门把手、地台扶手和座椅采用了红色皮质包裹，座椅采用了皮质和翻毛皮结合的材质，看上去很具有运动效果。全新奔驰AMG GLE53 Coupe共有5种驾驶模式选择，包括雪地、舒适、运动、运动+和Individual个性化定制模式。</p><div class=\"img_wrapper\"><a href=\"http://n3.sinaimg.cn/auto/transform/355/w660h495/20190828/71e9-icuacsa4672089.jpg\" target=\"_blank\"><img src=\"http://n.sinaimg.cn/auto/transform/266/w640h426/20190828/a2e5-icuacsa4714807.jpg\" alt=\"换家族新设计 奔驰GLE Coupe/GLE53发布\"/></a><span class=\"img_descr\"></span></div><div class=\"img_wrapper\"><a href=\"http://n2.sinaimg.cn/auto/transform/355/w660h495/20190828/c69d-icuacsa4672157.jpg\" target=\"_blank\"><img src=\"http://n.sinaimg.cn/auto/transform/266/w640h426/20190828/997d-icuacsa4715352.jpg\" alt=\"换家族新设计 奔驰GLE Coupe/GLE53发布\"/></a><span class=\"img_descr\"></span></div><div class=\"otherContent_01\" style=\"display: block; margin: 10px 20px 10px 0px; float: left; overflow: hidden; clear: both; padding: 4px; width: 336px; height: 280px;\"><ins><ins></ins></ins></div><p>　　动力方面，全新奔驰AMG GLE53 Coupe搭载了3.0T的双涡轮增压发动机，并配备一套轻混系统，最大综合输出功率达到了435马力。全新奔驰AMG GLE Coupe未来还将会推出更高性能的AMG GLE63 Coupe版本，它可能会搭载4.0T的双涡轮增压发动机，最大输出功率可能在600马力以上。</p><div style=\"font-size: 0px; height: 0px; clear: both;\"></div><div class=\"show_author\">(责编：王乐)</div><div style=\"margin-top: 30px; text-align: center;\"></div><div></div></div>', '1');
INSERT INTO `xpcms_article_content` VALUES ('22', '24', '<div class=\"article clearfix\"><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/auto/transform/440/w640h600/20190827/c249-icuacsa2569470.jpg\" alt=\"宝马X3 M/X4 M领衔多款新车上市 售价83.99万起\"/></div><p>　　新浪汽车讯 2019年8月27日晚，宝马M品牌战略沟通会在宁波举行，同时X3 M/X4 M及M4/M5新增车型正式上市。作为高性能车型，X3 M、X4 M两款新车搭载全新的S58系列3.0升双涡轮增压直列六缸发动机，雷霆版的最大功率高达510马力。其中，<strong>宝马X3 M共推出2款车型，售价区间为83.99-89.99万元；</strong><strong>宝马X4 M共推出2款车型，售价区间为86.99-92.99万元</strong><strong>。</strong></p><table style=\"height: 153px; width: 464px;\" border=\"1\"><tbody><tr style=\"height: 22px;\" class=\"firstRow\"><td style=\"text-align: center; height: 22px; width: 440px;\" colspan=\"2\">宝马X3 M 厂家指导价</td></tr><tr style=\"height: 22px;\"><td style=\"text-align: center; height: 22px; width: 223px;\">车型</td><td style=\"text-align: center; height: 22px; width: 217px;\">售价（万元）</td></tr><tr style=\"height: 22px;\"><td style=\"text-align: center; height: 22px; width: 223px;\">X3 M</td><td style=\"text-align: center; height: 22px; width: 217px;\">83.99</td></tr><tr style=\"height: 22px;\"><td style=\"text-align: center; height: 22px; width: 223px;\">X3 M 雷霆版</td><td style=\"text-align: center; height: 22px; width: 217px;\">89.99</td></tr></tbody></table><table style=\"height: 169px; width: 463px;\" border=\"1\"><tbody><tr class=\"firstRow\"><td style=\"text-align: center; width: 439px;\" colspan=\"2\">宝马X4 M 厂家指导价</td></tr><tr><td style=\"text-align: center; width: 221px;\">车型</td><td style=\"text-align: center; width: 218px;\">售价（万元）</td></tr><tr><td style=\"text-align: center; width: 221px;\">X4 M</td><td style=\"text-align: center; width: 218px;\">86.99</td></tr><tr><td style=\"text-align: center; width: 221px;\">X4 M 雷霆版</td><td style=\"text-align: center; width: 218px;\">92.99</td></tr></tbody></table><table style=\"height: 202px;\" border=\"1\" width=\"463\"><tbody><tr style=\"height: 22px;\" class=\"firstRow\"><td style=\"width: 449px; text-align: center; height: 22px;\" colspan=\"2\">宝马M4新增车型 厂商指导价</td></tr><tr style=\"height: 22px;\"><td style=\"width: 216px; text-align: center; height: 22px;\">车型</td><td style=\"width: 221px; text-align: center; height: 22px;\">售价（万元）</td></tr><tr style=\"height: 22px;\"><td style=\"width: 216px; text-align: center; height: 22px;\">M4双门轿跑车猎影版</td><td style=\"width: 221px; text-align: center; height: 22px;\">86.99</td></tr><tr style=\"height: 22px;\"><td style=\"width: 216px; text-align: center; height: 22px;\">M4双门轿跑车竞速版</td><td style=\"width: 221px; text-align: center; height: 22px;\">89.99</td></tr><tr style=\"height: 22px;\"><td style=\"width: 216px; text-align: center; height: 22px;\">M4敞篷轿跑车猎影版</td><td style=\"width: 221px; text-align: center; height: 22px;\">94.99</td></tr><tr style=\"height: 22px;\"><td style=\"width: 216px; text-align: center; height: 22px;\">M4敞篷轿跑车竞速版</td><td style=\"width: 221px; text-align: center; height: 22px;\">97.99</td></tr></tbody></table><table style=\"height: 107px; width: 464px;\" border=\"1\"><tbody><tr class=\"firstRow\"><td style=\"width: 450px; text-align: center;\" colspan=\"2\">宝马M5新增车型 厂商指导价</td></tr><tr><td style=\"width: 219px; text-align: center;\">车型</td><td style=\"width: 219px; text-align: center;\">售价（万元）</td></tr><tr><td style=\"width: 219px; text-align: center;\">M5雷霆版</td><td style=\"width: 219px; text-align: center;\">146.89</td></tr></tbody></table><div class=\"art_t\"><div class=\"art_tit3\">2019年宝马M品牌战略</div></div><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/auto/transform/299/w660h439/20190827/181b-icuacsa3020423.jpg\" alt=\"宝马X3 M/X4 M领衔多款新车上市 售价83.99万起\"/><span class=\"img_descr\"></span></div><p>　　1、X3 M和X4 M挺进全新细分市场</p><p>　　2、M8将在成都车展中国首发</p><p>　　3、今年将由9款车型增加至14款车型</p><p>　　4、更多特别版车型（雷霆等限量版车型）</p><p>　　5、打造BMW M专属经销商网络，覆盖1-4级城市，由27家提升至80家</p><div class=\"art_t\"><div class=\"art_tit3\">新车亮点</div></div><p>　　1、M运动风格外观和内饰，采用M运动座椅；</p><p>　　2、全新S58系列3.0升双涡轮增压直列六缸发动机，480Ps和510Ps两种调校；</p><p>　　3、配备8速M Steptronic变速箱和M xDrive智能全轮驱动系统。</p><div class=\"art_t\"><div class=\"art_tit3\">新车简介</div></div><div class=\"img_wrapper\"><a href=\"http://n1.sinaimg.cn/auto/transform/300/w660h440/20190822/902c-icqznfz6722076.jpg\" target=\"_blank\"><img src=\"http://n.sinaimg.cn/auto/transform/300/w660h440/20190822/902c-icqznfz6722076.jpg\" alt=\"宝马X3 M\"/></a><span class=\"img_descr\">宝马X3 M</span></div><div class=\"img_wrapper\"><a href=\"http://n0.sinaimg.cn/auto/transform/300/w660h440/20190822/4bab-icqznfz6721942.jpg\" target=\"_blank\"><img src=\"http://n.sinaimg.cn/auto/transform/300/w660h440/20190822/4bab-icqznfz6721942.jpg\" alt=\"宝马X3 M\"/></a><span class=\"img_descr\">宝马X3 M</span></div><div class=\"img_wrapper\"><a href=\"http://n3.sinaimg.cn/auto/transform/300/w660h440/20190822/4339-icqznfz6721941.jpg\" target=\"_blank\"><img src=\"http://n.sinaimg.cn/auto/transform/300/w660h440/20190822/4339-icqznfz6721941.jpg\" alt=\"宝马X4 M\"/></a><span class=\"img_descr\">宝马X4 M</span></div><div class=\"img_wrapper\"><a href=\"http://n3.sinaimg.cn/auto/transform/300/w660h440/20190822/a275-icqznfz6721969.jpg\" target=\"_blank\"><img src=\"http://n.sinaimg.cn/auto/transform/300/w660h440/20190822/a275-icqznfz6721969.jpg\" alt=\"宝马X4 M\"/></a><span class=\"img_descr\">宝马X4 M</span></div><p>　　外观方面，宝马X3 M/X4 M在X3/X4基础上针对外观进行了“凶狠化”处理，其换装了带有大量空气动力学设计的运动包围，同时提供M碳纤维选装包，用于双肾格栅、翼子板开孔叶片、后扩散器和外后视镜外壳等部位，进一步增加运动质感。此外，大尺寸M运动轮圈、双边共四出式排气等也是两款新车非常显著的特点。</p><div class=\"img_wrapper\"><a href=\"http://n0.sinaimg.cn/auto/transform/300/w660h440/20190822/d34b-icqznfz6721766.jpg\" target=\"_blank\"><img src=\"http://n.sinaimg.cn/auto/transform/300/w660h440/20190822/d34b-icqznfz6721766.jpg\" alt=\"宝马X3 M\"/></a><span class=\"img_descr\">宝马X3 M</span></div><div class=\"img_wrapper\"><a href=\"http://n3.sinaimg.cn/auto/transform/300/w660h440/20190822/90b8-icqznfz6721829.jpg\" target=\"_blank\"><img src=\"http://n.sinaimg.cn/auto/transform/300/w660h440/20190822/90b8-icqznfz6721829.jpg\" alt=\"宝马X3 M\"/></a><span class=\"img_descr\">宝马X3 M</span></div><div class=\"img_wrapper\"><a href=\"http://n0.sinaimg.cn/auto/transform/300/w660h440/20190822/9358-icqznfz6721786.jpg\" target=\"_blank\"><img src=\"http://n.sinaimg.cn/auto/transform/300/w660h440/20190822/9358-icqznfz6721786.jpg\" alt=\"宝马X4 M\"/></a><span class=\"img_descr\">宝马X4 M</span></div><div class=\"img_wrapper\"><a href=\"http://n1.sinaimg.cn/auto/transform/300/w660h440/20190822/4252-icqznfz6722030.jpg\" target=\"_blank\"><img src=\"http://n.sinaimg.cn/auto/transform/300/w660h440/20190822/4252-icqznfz6722030.jpg\" alt=\"宝马X4 M\"/></a><span class=\"img_descr\">宝马X4 M</span></div><p>　　内饰方面，宝马X3 M/X4 M拥有大量M系车型的专属装备，包括M仪表、M真皮方向盘（带换挡拨片和M按钮）、M挡把、红色启动按钮及碳纤维饰条等等。可电动调节的Vernasca真皮M运动座椅和多种内饰配色选择让车内兼具运动感和高档质感，用户还可选装带有Merino真皮、电动头枕调节和可发光M标志的M运动座椅。</p><div class=\"img_wrapper\"><a href=\"http://n2.sinaimg.cn/auto/transform/300/w660h440/20190822/f18d-icqznfz6721931.jpg\" target=\"_blank\"><img src=\"http://n.sinaimg.cn/auto/transform/300/w660h440/20190822/f18d-icqznfz6721931.jpg\" alt=\"宝马X3 M/X4 M领衔多款新车上市 售价83.99万起\"/></a><span class=\"img_descr\"></span></div><div class=\"img_wrapper\"><a href=\"http://n0.sinaimg.cn/auto/transform/300/w660h440/20190822/9f58-icqznfz6721977.jpg\" target=\"_blank\"><img src=\"http://n.sinaimg.cn/auto/transform/300/w660h440/20190822/9f58-icqznfz6721977.jpg\" alt=\"宝马X3 M/X4 M领衔多款新车上市 售价83.99万起\"/></a><span class=\"img_descr\"></span></div><p>　　动力方面，两款新车搭载的是全新S58系列3.0升双涡轮增压直列六缸发动机，标准版车型最大功率480马力，雷霆版可达510马力，峰值扭矩同为600牛·米。其中，X3 M/X4 M标准版0-100km/h加速时间为4.2秒，极速可达249km/h；X3 M/X4 M雷霆版0-100km/h加速时间缩短至4.1秒，极速可达285km/h。传动方面，两款车型均配备8速M Steptronic变速箱和M xDrive智能全轮驱动系统，具有舒适/运动/运动+三种驾驶模式。M xDrive与主动式M后桥差速器、全新开发的M电子阻尼减振器相互配合，也将保证车辆的转弯动态、灵活性和精准性。</p><div class=\"art_t\"><div class=\"art_tit3\">竞品车型</div></div><div class=\"img_wrapper\"><img src=\"http://n.sinaimg.cn/auto/transform/299/w660h439/20190826/a26d-icuacrz8406670.jpg\" alt=\"宝马X3 M/X4 M领衔多款新车上市 售价83.99万起\"/><span class=\"img_descr\"></span></div><div class=\"otherContent_01\" style=\"display: block; margin: 10px 20px 10px 0px; float: left; overflow: hidden; clear: both; padding: 4px; width: 336px; height: 280px;\"><ins><ins></ins></ins></div><p>　　在高性能中型SUV这一级别中，宝马X3 M/X4 M最直接的竞品就是AMG GLC，因为它们都拥有轿跑风格造型，AMG GLC 63在性能上也十分接近，而值得一提的是AMG GLC除了63和63 S车型外，还拥有入门的43车型，产品线更加丰富；保时捷Macan也是这个级别的宠儿，不过加速性能上和竞品有明显差距；BBA另一竞品SQ5年事已高，目前国内在售的还是上一代产品，且仅有一款车型，竞争力较低；阿尔法·罗密欧Stelvio相比其它几款车型有些小众，但凭借十足的个性也不乏拥趸，不过高性能的510HP版本售价都超过了96万元。</p><div class=\"art_t\"><div class=\"art_tit3\">总结</div></div><p>　　宝马X3 M和X4 M的引入为中国消费者提供了更丰富的宝马高性能SUV产品，对比竞品不难发现，宝马X3 M和X4 M在性价比方面是具有一定优势的。加速4.1s与AMG GLC 63（4s）和阿尔法·罗密欧Stelvio四叶草版（3.8s）相差不多，远高于保时捷Macan（5.1s）和奥迪SQ5（5.3s），而AMG GLC 63和阿尔法·罗密欧Stelvio四叶草版售价都超过了96万元。同时，我们也希望X3和X4的M40 i也可以早日到来，迎战AMG GLC的43车型，让更多人感受到M Power带来的乐趣。</p><div style=\"font-size: 0px; height: 0px; clear: both;\"></div><div class=\"show_author\">(责编：朱玉翔)</div><div style=\"margin-top: 30px; text-align: center;\"></div><div></div></div>', '1');
INSERT INTO `xpcms_article_content` VALUES ('23', '25', '<div class=\"ctext\"><div class=\"money_text\"><div class=\"guanggao\"><div></div></div></div><p>　　【<a href=\"//phone.cnmo.com/\" class=\"key_word\">手机</a>中国新闻】<a href=\"//product.cnmo.com/cell_phone/index1624361.shtml\" class=\"key_word\">华为P30</a>凭借出色的外观设计和小巧机身赢得不少消费者，尤其是女性消费者的喜爱，如今这款手机可能又要迎来一波新配色。日前，<a href=\"//product.cnmo.com/pro_sub_manu/sub_57_manu_613_1.shtml\" class=\"key_word\">华为</a>向欧盟知识产权局提交了两项新设计专利，采用经典撞色设计。</p><p style=\"text-align:center;\"><a href=\"//product.cnmo.com/article/1663321.html\" class=\"ctext_img c_img\"><img alt=\"华为P30全新配色曝光 撞色设计带来不一样的高颜值\" title=\"华为P30全新配色曝光 撞色设计带来不一样的高颜值\" src=\"//img.cnmo-img.com.cn/1664_600x1000/1663321.jpg\"/></a><br/></p><p style=\"text-align:center;\"><a href=\"//product.cnmo.com/article/1663322.html\" class=\"ctext_img c_img\"><img alt=\"华为P30（图取自letsgodigital）\" title=\"华为P30（图取自letsgodigital）\" src=\"//img.cnmo-img.com.cn/1664_600x1000/1663322.jpg\"/></a><br/>华为<a href=\"//product.cnmo.com/cell_phone/index1624361.shtml\" class=\"key_word\">P30</a>（图取自letsgodigital）</p><p>　　第一项是非常经典“熊猫”配色，即手机背面上半部分为黑色，下半部分为白色，华为P30中框配色也与背面的黑白撞色对应，设计一体感非常强；第二项设计更像是将经典的天空之境修改成撞色设计，湖天一线，颇有意境。</p><p style=\"text-align:center;\"><a href=\"//product.cnmo.com/article/1663323.html\" class=\"ctext_img c_img\"><img alt=\"华为Y9 Prime 2019\" title=\"华为Y9 Prime 2019\" src=\"//img.cnmo-img.com.cn/1664_600x1000/1663323.jpg\"/></a><br/>华为<a href=\"//product.cnmo.com/cell_phone/index1623730.shtml\" class=\"key_word\">Y9</a> Prime 2019</p><p>　　不过，华为并不是第一次采用这样的设计，此前在海外发布的华为Y9 Prime 2019便是采用撞色设计。据悉，华为P30两款新配色将于9月6日开始的IFA 2019上亮相，预计<a href=\"//product.cnmo.com/cell_phone/index1624362.shtml\" class=\"key_word\">华为P30 Pro</a>可能也会有对应的撞色机型出场。</p><p class=\"copyright\">版权所有，未经许可不得转载</p><div></div></div>', '1');
INSERT INTO `xpcms_article_content` VALUES ('24', '26', '<div class=\"ctext\"><div class=\"money_text\"><div class=\"guanggao\"><div></div></div></div><p>　　【<a href=\"//www.cnmo.com\" class=\"key_word\">CNMO</a>新闻】2013年，董明珠和雷军的10亿赌约成为了业内的一段佳话，在这5年里，<a href=\"//product.cnmo.com/pro_sub_manu/sub_57_manu_32827_1.shtml\" class=\"key_word\">小米</a>和格力都在暗自发力，虽然格力的营业额一直领先小米，不过由于赌约的存在，小米也一直在奋起直追，虽然最终结果未能取胜，但是却也取得了不小的发展。某种意义上来说，赌约的结果已经没有那么重要了，赌约生效期间各自奋力发展的这个劲头才是最可贵的。</p><p style=\"text-align:center;\"><a href=\"//product.cnmo.com/article/1663313.html\" class=\"ctext_img c_img\"><img alt=\"董明珠雷军\" title=\"董明珠雷军\" src=\"//img.cnmo-img.com.cn/1664_600x1000/1663313.jpg\"/></a><br/>董明珠雷军</p><p>　　8月28日消息，董明珠和雷军再次设立新赌约，这次不要10个亿。董明珠表示，和雷军的10亿赌约已经结束了，结果也一目了然，格力也并不打算和小米要这10个亿。不过接下来自己还是想和雷军再赌5年，再用一个5年赌约来见证双方的发展。雷军对此表示：“我觉得可以试一下”。看来，董明珠和雷军的新赌约将成为未来5年的一大焦点。</p><p style=\"text-align:center;\"><a href=\"//product.cnmo.com/article/1663311.html\" class=\"ctext_img c_img\"><img alt=\"雷军\" title=\"雷军\" src=\"//img.cnmo-img.com.cn/1664_600x1000/1663311.jpg\"/></a><br/>雷军</p><p>　　此前董明珠谈及两人的赌约，自己设立10亿赌约的初衷是想用10个亿刺激雷军拼命干，希望他能超过自己。虽然第一个5年雷军失败了，不过从整个过程来看，下一个5年或许雷军掌舵下的小米真能完成这次翻盘。</p><p class=\"copyright\">版权所有，未经许可不得转载</p><div></div></div>', '1');
INSERT INTO `xpcms_article_content` VALUES ('25', '27', '<div class=\"cont\"><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;你眼里的星海<br/>你眼里有星有海，有所有美好的存在……<br/>&nbsp; &nbsp; &nbsp; &nbsp; 摄影/文案：若寒<br/>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;出镜：初七<br/>&nbsp;</p><div class=\"img\"><a href=\"/forum/pic/slide_101_10852071_95497205.html\" target=\"_blank\"><img src=\"https://bbs.qn.img-space.com/201908/27/d33ac24e9c095cd88855dcfe7f6dfe12.jpg?imageView2/2/w/1024/q/100/ignore-error/1/\"/></a></div><ul class=\"exifBox list-paddingleft-2\"><li><p>相机品牌: <a target=\"_blank\" href=\"http://product.fengniao.com/camera/232.html\">佳能(Canon)</a> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;相机型号: <a target=\"_blank\" href=\"http://product.fengniao.com/1049_332981/index.html\">佳能 6D(单机)</a> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;光圈：f/2.2 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;曝光时间：1/160 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ISO：200 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;焦距：85.0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;拍摄时间: 2019-08-05 17:05:44</p></li><!--<dd class=\"equipment\"><span class=\"tit\">推荐器材</span>                                <a href=\"javascript:void(0)\">蜂鸟租赁：<div class=\"erweimaBox\"><img src=\"\"></div></a></dd>--></ul><div class=\"img\"><a href=\"/forum/pic/slide_101_10852071_95497206.html\" target=\"_blank\"><img src=\"https://bbs.qn.img-space.com/201908/27/de634bf3de5231d454554e9564de3189.jpg?imageView2/2/w/1024/q/100/ignore-error/1/\"/></a></div><ul class=\"exifBox list-paddingleft-2\"><li><p>相机品牌: <a target=\"_blank\" href=\"http://product.fengniao.com/camera/232.html\">佳能(Canon)</a> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;相机型号: <a target=\"_blank\" href=\"http://product.fengniao.com/1049_332981/index.html\">佳能 6D(单机)</a> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;光圈：f/2.0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;曝光时间：1/200 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ISO：200 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;焦距：85.0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;拍摄时间: 2019-08-05 16:56:05</p></li><!--<dd class=\"equipment\"><span class=\"tit\">推荐器材</span>                                <a href=\"javascript:void(0)\">蜂鸟租赁：<div class=\"erweimaBox\"><img src=\"\"></div></a></dd>--></ul><div class=\"img\"><a href=\"/forum/pic/slide_101_10852071_95497207.html\" target=\"_blank\"><img src=\"https://bbs.qn.img-space.com/201908/27/698dbcbd998273904973387917b64fcb.jpg?imageView2/2/w/1024/q/100/ignore-error/1/\"/></a></div><ul class=\"exifBox list-paddingleft-2\"><li><p>相机品牌: <a target=\"_blank\" href=\"http://product.fengniao.com/camera/232.html\">佳能(Canon)</a> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;相机型号: <a target=\"_blank\" href=\"http://product.fengniao.com/1049_332981/index.html\">佳能 6D(单机)</a> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;光圈：f/1.8 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;曝光时间：1/125 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ISO：200 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;焦距：85.0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;拍摄时间: 2019-08-05 17:03:23</p></li><!--<dd class=\"equipment\"><span class=\"tit\">推荐器材</span>                                <a href=\"javascript:void(0)\">蜂鸟租赁：<div class=\"erweimaBox\"><img src=\"\"></div></a></dd>--></ul><div class=\"img\"><a href=\"/forum/pic/slide_101_10852071_95497208.html\" target=\"_blank\"><img src=\"https://bbs.qn.img-space.com/201908/27/f908d95a654335c2364e14a8c37763b0.jpg?imageView2/2/w/1024/q/100/ignore-error/1/\"/></a></div><ul class=\"exifBox list-paddingleft-2\"><li><p>相机品牌: <a target=\"_blank\" href=\"http://product.fengniao.com/camera/232.html\">佳能(Canon)</a> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;相机型号: <a target=\"_blank\" href=\"http://product.fengniao.com/1049_332981/index.html\">佳能 6D(单机)</a> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;光圈：f/2.2 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;曝光时间：1/100 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ISO：200 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;焦距：85.0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;拍摄时间: 2019-08-05 17:06:56</p></li><!--<dd class=\"equipment\"><span class=\"tit\">推荐器材</span>                                <a href=\"javascript:void(0)\">蜂鸟租赁：<div class=\"erweimaBox\"><img src=\"\"></div></a></dd>--></ul><div class=\"img\"><a href=\"/forum/pic/slide_101_10852071_95497209.html\" target=\"_blank\"><img src=\"https://bbs.qn.img-space.com/201908/27/170482f0f75563663b77e6fafa90f4e0.jpg?imageView2/2/w/1024/q/100/ignore-error/1/\"/></a></div><ul class=\"exifBox list-paddingleft-2\"><li><p>相机品牌: <a target=\"_blank\" href=\"http://product.fengniao.com/camera/232.html\">佳能(Canon)</a> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;相机型号: <a target=\"_blank\" href=\"http://product.fengniao.com/1049_332981/index.html\">佳能 6D(单机)</a> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;光圈：f/2.0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;曝光时间：1/100 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ISO：200 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;焦距：85.0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;拍摄时间: 2019-08-05 16:53:58</p></li><!--<dd class=\"equipment\"><span class=\"tit\">推荐器材</span>                                <a href=\"javascript:void(0)\">蜂鸟租赁：<div class=\"erweimaBox\"><img src=\"\"></div></a></dd>--></ul><div class=\"img\"><a href=\"/forum/pic/slide_101_10852071_95497211.html\" target=\"_blank\"><img src=\"https://bbs.qn.img-space.com/201908/27/1f88d16f9b26fad013bc1acc46704247.jpg?imageView2/2/w/1024/q/100/ignore-error/1/\"/></a></div><ul class=\"exifBox list-paddingleft-2\"><li><p>相机品牌: <a target=\"_blank\" href=\"http://product.fengniao.com/camera/232.html\">佳能(Canon)</a> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;相机型号: <a target=\"_blank\" href=\"http://product.fengniao.com/1049_332981/index.html\">佳能 6D(单机)</a> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;光圈：f/2.2 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;曝光时间：1/100 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ISO：100 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;焦距：50.0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;拍摄时间: 2019-08-05 16:46:00</p></li><!--<dd class=\"equipment\"><span class=\"tit\">推荐器材</span>                                <a href=\"javascript:void(0)\">蜂鸟租赁：<div class=\"erweimaBox\"><img src=\"\"></div></a></dd>--></ul><div class=\"img\"><a href=\"/forum/pic/slide_101_10852071_95497212.html\" target=\"_blank\"><img src=\"https://bbs.qn.img-space.com/201908/27/3e303abbbc0593cdc364d1d16f71cd46.jpg?imageView2/2/w/1024/q/100/ignore-error/1/\"/></a></div><ul class=\"exifBox list-paddingleft-2\"><li><p>相机品牌: <a target=\"_blank\" href=\"http://product.fengniao.com/camera/232.html\">佳能(Canon)</a> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;相机型号: <a target=\"_blank\" href=\"http://product.fengniao.com/1049_332981/index.html\">佳能 6D(单机)</a> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;光圈：f/2.2 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;曝光时间：1/100 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ISO：200 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;焦距：85.0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;拍摄时间: 2019-08-05 17:13:05</p></li><!--<dd class=\"equipment\"><span class=\"tit\">推荐器材</span>                                <a href=\"javascript:void(0)\">蜂鸟租赁：<div class=\"erweimaBox\"><img src=\"\"></div></a></dd>--></ul><div class=\"img\"><a href=\"/forum/pic/slide_101_10852071_95497213.html\" target=\"_blank\"><img src=\"https://bbs.qn.img-space.com/201908/27/49bd5685183a13d3617da85204a86844.jpg?imageView2/2/w/1024/q/100/ignore-error/1/\"/></a></div><ul class=\"exifBox list-paddingleft-2\"><li><p>相机品牌: <a target=\"_blank\" href=\"http://product.fengniao.com/camera/232.html\">佳能(Canon)</a> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;相机型号: <a target=\"_blank\" href=\"http://product.fengniao.com/1049_332981/index.html\">佳能 6D(单机)</a> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;光圈：f/2.2 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;曝光时间：1/100 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ISO：100 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;焦距：50.0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;拍摄时间: 2019-08-05 16:43:22</p></li><!--<dd class=\"equipment\"><span class=\"tit\">推荐器材</span>                                <a href=\"javascript:void(0)\">蜂鸟租赁：<div class=\"erweimaBox\"><img src=\"\"></div></a></dd>--></ul><div class=\"img\"><a href=\"/forum/pic/slide_101_10852071_95497214.html\" target=\"_blank\"><img src=\"https://bbs.qn.img-space.com/201908/27/d6473300886d3b9b00dee84b70f80339.jpg?imageView2/2/w/1024/q/100/ignore-error/1/\"/></a></div><ul class=\"exifBox list-paddingleft-2\"><li><p>相机品牌: <a target=\"_blank\" href=\"http://product.fengniao.com/camera/232.html\">佳能(Canon)</a> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;相机型号: <a target=\"_blank\" href=\"http://product.fengniao.com/1049_332981/index.html\">佳能 6D(单机)</a> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;光圈：f/2.2 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;曝光时间：1/320 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ISO：200 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;焦距：85.0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;拍摄时间: 2019-08-05 17:09:18</p></li><!--<dd class=\"equipment\"><span class=\"tit\">推荐器材</span>                                <a href=\"javascript:void(0)\">蜂鸟租赁：<div class=\"erweimaBox\"><img src=\"\"></div></a></dd>--></ul><div class=\"img\"><a href=\"/forum/pic/slide_101_10852071_95497215.html\" target=\"_blank\"><img src=\"https://bbs.qn.img-space.com/201908/27/f956deb22de6c359165a161a4d237f13.jpg?imageView2/2/w/1024/q/100/ignore-error/1/\"/></a></div><ul class=\"exifBox list-paddingleft-2\"><li><p>相机品牌: <a target=\"_blank\" href=\"http://product.fengniao.com/camera/232.html\">佳能(Canon)</a> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;相机型号: <a target=\"_blank\" href=\"http://product.fengniao.com/1049_332981/index.html\">佳能 6D(单机)</a> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;光圈：f/1.8 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;曝光时间：1/250 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ISO：200 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;焦距：85.0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;拍摄时间: 2019-08-05 16:59:06</p></li><!--<dd class=\"equipment\"><span class=\"tit\">推荐器材</span>                                <a href=\"javascript:void(0)\">蜂鸟租赁：<div class=\"erweimaBox\"><img src=\"\"></div></a></dd>--></ul><div class=\"img\"><a href=\"/forum/pic/slide_101_10852071_95497216.html\" target=\"_blank\"><img src=\"https://bbs.qn.img-space.com/201908/27/d8d2d5cc24a3efa87f228cff76e93aff.jpg?imageView2/2/w/1024/q/100/ignore-error/1/\"/></a></div><ul class=\"exifBox list-paddingleft-2\"><li><p>相机品牌: <a target=\"_blank\" href=\"http://product.fengniao.com/camera/232.html\">佳能(Canon)</a> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;相机型号: <a target=\"_blank\" href=\"http://product.fengniao.com/1049_332981/index.html\">佳能 6D(单机)</a> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;光圈：f/2.2 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;曝光时间：1/100 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ISO：100 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;焦距：50.0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;拍摄时间: 2019-08-05 16:41:47</p></li><!--<dd class=\"equipment\"><span class=\"tit\">推荐器材</span>                                <a href=\"javascript:void(0)\">蜂鸟租赁：<div class=\"erweimaBox\"><img src=\"\"></div></a></dd>--></ul><div class=\"img\"><a href=\"/forum/pic/slide_101_10852071_95497217.html\" target=\"_blank\"><img src=\"https://bbs.qn.img-space.com/201908/27/b3ac7806fc1553a4c6e27b4f65170310.jpg?imageView2/2/w/1024/q/100/ignore-error/1/\"/></a></div><ul class=\"exifBox list-paddingleft-2\"><li><p>相机品牌: <a target=\"_blank\" href=\"http://product.fengniao.com/camera/232.html\">佳能(Canon)</a> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;相机型号: <a target=\"_blank\" href=\"http://product.fengniao.com/1049_332981/index.html\">佳能 6D(单机)</a> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;光圈：f/2.2 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;曝光时间：1/100 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ISO：100 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;焦距：50.0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;拍摄时间: 2019-08-05 16:42:09</p></li><!--<dd class=\"equipment\"><span class=\"tit\">推荐器材</span>                                <a href=\"javascript:void(0)\">蜂鸟租赁：<div class=\"erweimaBox\"><img src=\"\"></div></a></dd>--></ul><div class=\"img\"><a href=\"/forum/pic/slide_101_10852071_95497218.html\" target=\"_blank\"><img src=\"https://bbs.qn.img-space.com/201908/27/ce1ccc0fc354e82ca479bc6ac555c63c.jpg?imageView2/2/w/1024/q/100/ignore-error/1/\"/></a></div><ul class=\"exifBox list-paddingleft-2\"><li><p>相机品牌: <a target=\"_blank\" href=\"http://product.fengniao.com/camera/232.html\">佳能(Canon)</a> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;相机型号: <a target=\"_blank\" href=\"http://product.fengniao.com/1049_332981/index.html\">佳能 6D(单机)</a> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;光圈：f/2.2 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;曝光时间：1/100 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ISO：100 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;焦距：50.0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;拍摄时间: 2019-08-05 16:39:09</p></li><!--<dd class=\"equipment\"><span class=\"tit\">推荐器材</span>                                <a href=\"javascript:void(0)\">蜂鸟租赁：<div class=\"erweimaBox\"><img src=\"\"></div></a></dd>--></ul><div class=\"img\"><a href=\"/forum/pic/slide_101_10852071_95497219.html\" target=\"_blank\"><img src=\"https://bbs.qn.img-space.com/201908/27/231bb0bcd789c1f62679f370a16d6182.jpg?imageView2/2/w/1024/q/100/ignore-error/1/\"/></a></div><ul class=\"exifBox list-paddingleft-2\"><li><p>相机品牌: <a target=\"_blank\" href=\"http://product.fengniao.com/camera/232.html\">佳能(Canon)</a> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;相机型号: <a target=\"_blank\" href=\"http://product.fengniao.com/1049_332981/index.html\">佳能 6D(单机)</a> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;光圈：f/2.2 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;曝光时间：1/100 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ISO：200 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;焦距：85.0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;拍摄时间: 2019-08-05 17:06:47</p></li><!--<dd class=\"equipment\"><span class=\"tit\">推荐器材</span>                                <a href=\"javascript:void(0)\">蜂鸟租赁：<div class=\"erweimaBox\"><img src=\"\"></div></a></dd>--></ul><div class=\"img\"><a href=\"/forum/pic/slide_101_10852071_95497220.html\" target=\"_blank\"><img src=\"https://bbs.qn.img-space.com/201908/27/7ed6eb741c5dcea56c130eb6168dda30.jpg?imageView2/2/w/1024/q/100/ignore-error/1/\"/></a></div><ul class=\"exifBox list-paddingleft-2\"><li><p>相机品牌: <a target=\"_blank\" href=\"http://product.fengniao.com/camera/232.html\">佳能(Canon)</a> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;相机型号: <a target=\"_blank\" href=\"http://product.fengniao.com/1049_332981/index.html\">佳能 6D(单机)</a> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;光圈：f/2.0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;曝光时间：1/160 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ISO：100 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;焦距：50.0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;拍摄时间: 2019-08-05 16:30:27</p></li><!--<dd class=\"equipment\"><span class=\"tit\">推荐器材</span>                                <a href=\"javascript:void(0)\">蜂鸟租赁：<div class=\"erweimaBox\"><img src=\"\"></div></a></dd>--></ul><div class=\"img\"><a href=\"/forum/pic/slide_101_10852071_95497221.html\" target=\"_blank\"><img src=\"https://bbs.qn.img-space.com/201908/27/23e173b206fcfe44aebb1c8768c65bb6.jpg?imageView2/2/w/1024/q/100/ignore-error/1/\"/></a></div><ul class=\"exifBox list-paddingleft-2\"><li><p>相机品牌: <a target=\"_blank\" href=\"http://product.fengniao.com/camera/232.html\">佳能(Canon)</a> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;相机型号: <a target=\"_blank\" href=\"http://product.fengniao.com/1049_332981/index.html\">佳能 6D(单机)</a> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;光圈：f/2.0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;曝光时间：1/200 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ISO：200 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;焦距：85.0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;拍摄时间: 2019-08-05 16:57:38</p></li><!--<dd class=\"equipment\"><span class=\"tit\">推荐器材</span>                                <a href=\"javascript:void(0)\">蜂鸟租赁：<div class=\"erweimaBox\"><img src=\"\"></div></a></dd>--></ul><div class=\"img\"><a href=\"/forum/pic/slide_101_10852071_95497222.html\" target=\"_blank\"><img src=\"https://bbs.qn.img-space.com/201908/27/9bf2111c75019428ed6b5f9c770375a8.jpg?imageView2/2/w/1024/q/100/ignore-error/1/\"/></a></div><ul class=\"exifBox list-paddingleft-2\"><li><p>相机品牌: <a target=\"_blank\" href=\"http://product.fengniao.com/camera/232.html\">佳能(Canon)</a> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;相机型号: <a target=\"_blank\" href=\"http://product.fengniao.com/1049_332981/index.html\">佳能 6D(单机)</a> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;光圈：f/2.0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;曝光时间：1/100 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ISO：200 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;焦距：85.0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;拍摄时间: 2019-08-05 16:54:04</p></li><!--<dd class=\"equipment\"><span class=\"tit\">推荐器材</span>                                <a href=\"javascript:void(0)\">蜂鸟租赁：<div class=\"erweimaBox\"><img src=\"\"></div></a></dd>--></ul><div class=\"img\"><a href=\"/forum/pic/slide_101_10852071_95497223.html\" target=\"_blank\"><img src=\"https://bbs.qn.img-space.com/201908/27/9a607f77ed0601fbae80ece515bc4efc.jpg?imageView2/2/w/1024/q/100/ignore-error/1/\"/></a></div><ul class=\"exifBox list-paddingleft-2\"><li><p>相机品牌: <a target=\"_blank\" href=\"http://product.fengniao.com/camera/232.html\">佳能(Canon)</a> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;相机型号: <a target=\"_blank\" href=\"http://product.fengniao.com/1049_332981/index.html\">佳能 6D(单机)</a> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;光圈：f/1.6 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;曝光时间：1/100 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ISO：200 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;焦距：85.0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;拍摄时间: 2019-08-05 16:52:12</p></li><!--<dd class=\"equipment\"><span class=\"tit\">推荐器材</span>                                <a href=\"javascript:void(0)\">蜂鸟租赁：<div class=\"erweimaBox\"><img src=\"\"></div></a></dd>--></ul><div class=\"img\"><a href=\"/forum/pic/slide_101_10852071_95497226.html\" target=\"_blank\"><img src=\"https://bbs.qn.img-space.com/201908/27/74540bb74ef03ef879c9a4bfc6b9ad26.jpg?imageView2/2/w/1024/q/100/ignore-error/1/\"/></a></div><ul class=\"exifBox list-paddingleft-2\"><li><p>相机品牌: <a target=\"_blank\" href=\"http://product.fengniao.com/camera/232.html\">佳能(Canon)</a> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;相机型号: <a target=\"_blank\" href=\"http://product.fengniao.com/1049_332981/index.html\">佳能 6D(单机)</a> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;光圈：f/2.0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;曝光时间：1/160 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ISO：100 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;焦距：50.0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;拍摄时间: 2019-08-05 16:29:53</p></li><!--<dd class=\"equipment\"><span class=\"tit\">推荐器材</span>                                <a href=\"javascript:void(0)\">蜂鸟租赁：<div class=\"erweimaBox\"><img src=\"\"></div></a></dd>--></ul><div class=\"img\"><a href=\"/forum/pic/slide_101_10852071_95497227.html\" target=\"_blank\"><img src=\"https://bbs.qn.img-space.com/201908/27/1909bcf80b2a2b084bbcd8e65b8557c5.jpg?imageView2/2/w/1024/q/100/ignore-error/1/\"/></a></div><ul class=\"exifBox list-paddingleft-2\"><li><p>相机品牌: <a target=\"_blank\" href=\"http://product.fengniao.com/camera/232.html\">佳能(Canon)</a> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;相机型号: <a target=\"_blank\" href=\"http://product.fengniao.com/1049_332981/index.html\">佳能 6D(单机)</a> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;光圈：f/1.8 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;曝光时间：1/125 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ISO：200 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;焦距：85.0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;拍摄时间: 2019-08-05 17:02:33</p></li><!--<dd class=\"equipment\"><span class=\"tit\">推荐器材</span>                                <a href=\"javascript:void(0)\">蜂鸟租赁：<div class=\"erweimaBox\"><img src=\"\"></div></a></dd>--></ul></div>', '1');
INSERT INTO `xpcms_article_content` VALUES ('26', '28', '<p><img src=\"/ueditor/php/upload/image/20190828/1566977091191543.jpg\" title=\"1566977091191543.jpg\" alt=\"dcb251ab80.jpg\"/></p>', '1');
INSERT INTO `xpcms_article_content` VALUES ('27', '29', '<p><img src=\"/ueditor/php/upload/image/20190828/1566977152951849.jpg\" title=\"1566977152951849.jpg\" alt=\"ec1658cdcc.jpg\"/></p>', '1');
INSERT INTO `xpcms_article_content` VALUES ('28', '30', '<div class=\"cont\"><p>模特：兔子<br/>摄影：奶爸<br/>拍摄地：西溪高庄<br/></p><div class=\"img\"><a href=\"/forum/pic/slide_101_10851947_95494825.html\" target=\"_blank\"><img src=\"https://bbs.qn.img-space.com/201908/27/9400accb020347c4764d8932be806055.jpg?imageView2/2/w/1024/q/100/ignore-error/1/\"/></a>\r\n\r\n &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<!--<span class=\"heart \" data=\"0\"><i >&nbsp;</i></span>--></div></div>', '1');
INSERT INTO `xpcms_article_content` VALUES ('29', '31', '<p><img src=\"/ueditor/php/upload/image/20190828/1566977588123035.jpg\" title=\"1566977588123035.jpg\" alt=\"timg.jpg\"/></p>', '1');
INSERT INTO `xpcms_article_content` VALUES ('30', '32', '<p><img src=\"/ueditor/php/upload/image/20190828/1566977655905573.jpg\" title=\"1566977655905573.jpg\" alt=\"timg (1).jpg\"/></p>', '1');
INSERT INTO `xpcms_article_content` VALUES ('31', '33', '<p><img src=\"/ueditor/php/upload/image/20190828/1566977713486596.jpg\" title=\"1566977713486596.jpg\" alt=\"timg (2).jpg\"/></p>', '1');
INSERT INTO `xpcms_article_content` VALUES ('32', '34', '<p><img src=\"/ueditor/php/upload/image/20190828/1566977858134784.jpg\" title=\"1566977858134784.jpg\" alt=\"20150520205908_zHs4i.jpg\"/></p>', '1');
INSERT INTO `xpcms_article_content` VALUES ('33', '35', '<p><img src=\"/ueditor/php/upload/image/20190828/1566978354421024.jpg\" title=\"1566978354421024.jpg\" alt=\"timg (3).jpg\"/></p>', '1');
INSERT INTO `xpcms_article_content` VALUES ('34', '36', '<p><img src=\"/ueditor/php/upload/image/20190828/1566978430476995.jpg\" title=\"1566978430476995.jpg\" alt=\"u=276866280,220136357&amp;fm=26&amp;gp=0.jpg\"/></p>', '1');
INSERT INTO `xpcms_article_content` VALUES ('35', '37', '<p>asdfasdfadsfasdfsdfasdfasdfasdfasdf</p><p>asdfasdfasdfasdfasdfasdfasdfda</p>', '1');
INSERT INTO `xpcms_article_content` VALUES ('36', '38', '<p>fasdfasdfasdf</p>', '1');
INSERT INTO `xpcms_article_content` VALUES ('37', '39', '<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 40px; font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, Tahoma, Arial, sans-serif；; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">原标题：“乔碧萝殿下”“红花会贝贝” 上主播黑名单</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 40px; font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, Tahoma, Arial, sans-serif；; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">　　昨天本报报道了红花会成员贝贝在直播中疑似自残并被封号的消息，8月6日，中国演出行业协会网络表演分会发布了《网络表演（直播）行业主播黑名单（第三批）》，“红花会贝贝”名列其中，近日引发网友争议的网络主播“乔碧萝殿下”也一样受到封禁5年的制裁。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 40px; font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, Tahoma, Arial, sans-serif；; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">　　<strong>两主播引发网友争议</strong></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 40px; font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, Tahoma, Arial, sans-serif；; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><strong>　　演出行业协会将其列入黑名单</strong></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 40px; font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, Tahoma, Arial, sans-serif；; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">　　中国演出行业协会网络表演分会官方微信公众号6日发布了《网络表演（直播）行业主播黑名单（第三批）》，北青报记者注意到，因在直播中容貌发生变化引发网友争议的主播“乔碧萝殿下”和另一因“剁手指”引发网友争议的主播“红花会贝贝”均名列黑名单中。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 40px; font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, Tahoma, Arial, sans-serif；; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">　　中国演出行业协会网络表演分会介绍，根据《网络表演（直播）行业主播“黑名单”管理制度（试行）》，被列入黑名单的主播将在行业内禁止注册和直播，封禁期限5年。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 40px; font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, Tahoma, Arial, sans-serif；; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">　　中国演出行业协会网络表演分会表示，近期，一些低俗、恶意炒作、有碍公序良俗的违法违规直播事件多次出现，引发社会广泛关注，损害了行业形象。“各直播平台严格自律，积极承	担主体责任，第一时间向分会上报了劣迹主播信息及其违规证据，分会组织内容评议委员会专家组进行审核，并经分会会长联席会讨论通过，正式确定了第三批网络表演（直播）行业主播‘黑名单’。”该协会分会亦表示，主播如对被列入黑名单有争议，可以在20个工作日内向该分会秘书处进行申诉。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 40px; font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, Tahoma, Arial, sans-serif；; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">　　<strong>本期黑名单内共59人</strong></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 40px; font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, Tahoma, Arial, sans-serif；; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><strong>　　“乔碧萝殿下”曾被两直播平台封禁</strong></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 40px; font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, Tahoma, Arial, sans-serif；; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">　　北青报记者注意到，包括“乔碧萝殿下”和“红花会贝贝”两名近期引发争议的主播在内，此次名列黑名单的网络主播达59个。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 40px; font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, Tahoma, Arial, sans-serif；; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">　　“乔碧萝殿下”为斗鱼APEX英雄分区主播，今年6月17日首次直播，直播内容以游戏直播加上少部分的闲聊为主，但在直播时该主播并不露脸，只是以声音和粉丝交流，其声线甜美，主动在斗鱼晒出的“个人美照”也是颜值上佳的少女，由此吸引了一批粉丝的关注。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 40px; font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, Tahoma, Arial, sans-serif；; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">　　7月25日，“乔碧萝殿下”与人连麦直播时发生“翻车事件”，平时用来遮挡脸部的图片不见了，还透露自己身份证上显示已经58岁。8月1日凌晨，斗鱼平台发布声明称，因为“乔碧萝殿下”的一场自主炒作，挑战公众底线等不当行为，决定对“乔碧萝殿下”进行永久封停以儆效尤。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 40px; font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, Tahoma, Arial, sans-serif；; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">　　几天后，“乔碧萝殿下”再次在Bilibili视频网进行直播。但没过多久，直播间就被该视频网站永久封禁。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 40px; font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, Tahoma, Arial, sans-serif；; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">　　据了解，此前中国演出行业协会网络表演（直播）分会曾公布两批黑名单主播，其中包括卢本伟、天佑、牌牌琦等主播。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 40px; font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, Tahoma, Arial, sans-serif；; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">　　文/本报记者&nbsp;&nbsp;屈畅&nbsp;&nbsp;张夕</p><p><br/></p>', '1');
INSERT INTO `xpcms_article_content` VALUES ('39', '45', '<p style=\"text-align: center;\"><br></p>', '1');
INSERT INTO `xpcms_article_content` VALUES ('47', '47', '<img src=\"http://laravel.com/static/layui/images/face/25.gif\" alt=\"[抱抱]\">', '1');
INSERT INTO `xpcms_article_content` VALUES ('42', '40', '<p style=\"text-align: center;\"><img src=\"/storage/static/images/WU8aIozEMedyAMlyhR2Si6syun1b8bW9YoNrgfAD.png\" alt=\"images\"><img src=\"/storage/static/images/aITcm1SbsJ8EjrR86O8S23YUnoGuRdmbC3cRXZNh.jpeg\" alt=\"images\"><br></p>', '1');
INSERT INTO `xpcms_article_content` VALUES ('43', '42', '测试<img src=\"/storage/static/images/WvI56ydpzXQLg2NukjU3FlHYlfgbAzTb47pLdDmy.jpeg\" alt=\"images\">', '1');
INSERT INTO `xpcms_article_content` VALUES ('44', '44', '请输入内容', '1');
INSERT INTO `xpcms_article_content` VALUES ('45', '45', '<p style=\"text-align: center;\"><br></p>', '1');

-- ----------------------------
-- Table structure for xpcms_article_content_images
-- ----------------------------
DROP TABLE IF EXISTS `xpcms_article_content_images`;
CREATE TABLE `xpcms_article_content_images` (
  `content_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '文章内容表ID',
  `aid` int(11) NOT NULL COMMENT '文章ID',
  `page_id` smallint(5) NOT NULL DEFAULT '1' COMMENT '文章内分页排序（分页ID）',
  `img` varchar(255) NOT NULL COMMENT '主图片路径',
  `thumb` varchar(255) NOT NULL COMMENT '对应缩略图路径',
  `img_title` varchar(255) NOT NULL COMMENT '分页图片标题',
  `img_desc` varchar(255) NOT NULL COMMENT '图片简介',
  PRIMARY KEY (`content_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xpcms_article_content_images
-- ----------------------------
INSERT INTO `xpcms_article_content_images` VALUES ('2', '4', '1', '/upload/2019/01/31/100012345.jpg', '/upload/2019/01/31/100012345.jpg', '', '当地时间2019年1月30日，美国芝加哥，当地迎来史无前例的极寒天气，芝加哥政府采取“火烧铁轨”的方式，保证火车运行。据悉，美国部分州甚至气温低到零下52度。图：东方IC (来自:腾讯图片)');
INSERT INTO `xpcms_article_content_images` VALUES ('3', '4', '2', '/upload/2019/01/31/100012346.jpg', '/upload/2019/01/31/100012345.jpg', '', '据悉，若气温过低，火车铁轨也无法承受，这样的超低温会造成铁轨金属变形甚至断掉，因此工作人员通过加热铁轨的方式来保障列车运行。 (来自:腾讯图片)');
INSERT INTO `xpcms_article_content_images` VALUES ('4', '4', '3', '/upload/2019/01/31/100012347.jpg', '/upload/2019/01/31/100012345.jpg', '', '美国国家气象局预计，美国中西部本周将有近9000万人将遭遇零下27摄氏度或更低的气温，其中2500万人将遭受零下33摄氏度的刺骨寒冷。 (来自:腾讯图片)');
INSERT INTO `xpcms_article_content_images` VALUES ('5', '4', '4', '/upload/2019/01/31/100012357.jpg', '/upload/2019/01/31/100012345.jpg', '', '芝加哥市长拉姆伊曼纽尔于本周二称:“（这种天气）实际上已对公众的安全和健康构成隐患，需要妥善处理。这是危及生命的天气。”根据美国气象局的数据，如果人类的皮肤暴露在零下32摄氏度的寒风中，15分钟内便会结冰。 (来自:腾讯图片)');
INSERT INTO `xpcms_article_content_images` VALUES ('6', '4', '5', '/upload/2019/01/31/100012557.jpg', '/upload/2019/01/31/100012345.jpg', '', 'CBS报道称，伊利诺伊、爱荷华、印第安纳、威斯康辛和明尼苏达这五个州中，已有至少六人因极寒天气而丧生，其中密尔沃基的一名男子直接被冻死在了车库中。包括明尼阿波利斯、密尔沃基、芝加哥和底特律在内的中西部大城市的官员们目前都在竭尽全力让无家可归的人们远离街头。 (来自:腾讯图片)');
INSERT INTO `xpcms_article_content_images` VALUES ('7', '4', '6', '/upload/2019/01/31/100019346.jpg', '/upload/2019/01/31/100012345.jpg', '', '芝加哥的铁道工作人员在铁轨上点火，以防止铁轨结冰影响列车运行。 (来自:腾讯图片)');

-- ----------------------------
-- Table structure for xpcms_article_content_single
-- ----------------------------
DROP TABLE IF EXISTS `xpcms_article_content_single`;
CREATE TABLE `xpcms_article_content_single` (
  `content_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '文章内容表ID',
  `aid` int(11) NOT NULL COMMENT '文章ID',
  `contents` text NOT NULL COMMENT '文章内容',
  PRIMARY KEY (`content_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='单页文章内容';

-- ----------------------------
-- Records of xpcms_article_content_single
-- ----------------------------
INSERT INTO `xpcms_article_content_single` VALUES ('9', '6', '<p style=\"margin-top:30px;\">一、php中文网提供的所有资源部分来自互联网，如果有侵犯您的版权或其他权益，请说明详细缘由并提供版权或权益证明然后发送到<br><strong style=\"font-weight:700;color:#b02b2b;\">邮箱a@php.cn</strong>，我们会在看到邮件的第一时间内为您处理，或直接联系<strong style=\"font-weight:700;color:#b02b2b;\">QQ：88526</strong>。</p>\r\n  <p style=\"margin-top:30px;\">二、网友通过php.cn途径发表的一切信息，本站有权在本网站范围内引用、发布、转载用户在本站发布的内容。本站对于用户发布的内容所引发的版权、署名权的异议、纠纷不承担任何责任。传统媒体转载须事先与原作者和本站联系。提交者发言纯属个人行为，与本网站立场无关。</p>\r。');

-- ----------------------------
-- Table structure for xpcms_article_content_video
-- ----------------------------
DROP TABLE IF EXISTS `xpcms_article_content_video`;
CREATE TABLE `xpcms_article_content_video` (
  `article_cid` int(10) NOT NULL COMMENT '文章内容ID',
  `aid` int(11) NOT NULL COMMENT '文章ID',
  `page_id` smallint(5) NOT NULL DEFAULT '1' COMMENT '文章内分页排序（分页ID）',
  `video_type` varchar(16) NOT NULL DEFAULT '1' COMMENT '视频类型；mp4；mpeg；flv；等等',
  `video_url` varchar(255) NOT NULL COMMENT '视频地址',
  `video_info` varchar(255) NOT NULL COMMENT '该视频信息；如视频长度等等',
  `video_code` varchar(255) NOT NULL COMMENT '直接调取视频代码',
  `video_title` varchar(255) NOT NULL COMMENT '视频标题',
  `video_desc` varchar(255) NOT NULL COMMENT '视频摘要',
  PRIMARY KEY (`article_cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xpcms_article_content_video
-- ----------------------------
INSERT INTO `xpcms_article_content_video` VALUES ('8', '5', '1', '1', 'http://videocdn.php.cn/video/yuanchuang/php/php%E4%B8%AD%E6%96%87%E7%BD%91%E5%AE%A3%E4%BC%A0%E7%89%87%5B%E5%A5%B3%E5%A3%B0%E7%89%88%5D_1.mp4?sign=7b0ce6e8ba1b0a5146adf0d851d7de40&timestamp=1548901331', '', '', '', '');

-- ----------------------------
-- Table structure for xpcms_article_shibai
-- ----------------------------
DROP TABLE IF EXISTS `xpcms_article_shibai`;
CREATE TABLE `xpcms_article_shibai` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '内容ID',
  `title` char(64) NOT NULL COMMENT '内容标题',
  `subtitle` char(64) NOT NULL DEFAULT '' COMMENT '内容副标题',
  `model_id` smallint(5) NOT NULL DEFAULT '0',
  `cate_id` smallint(5) NOT NULL DEFAULT '0' COMMENT '分类ID',
  `cover_img` varchar(255) NOT NULL DEFAULT '' COMMENT '文章封面图',
  `seo_title` varchar(255) NOT NULL DEFAULT '' COMMENT 'seo标题',
  `keyword` varchar(255) NOT NULL DEFAULT '' COMMENT 'seo key',
  `descs` varchar(255) NOT NULL DEFAULT '' COMMENT '文章摘要',
  `author` char(32) NOT NULL DEFAULT '' COMMENT '文章原创作者',
  `author_editor` varchar(32) NOT NULL DEFAULT '' COMMENT '文章编辑作者（转载）',
  `from_site` varchar(255) NOT NULL DEFAULT '' COMMENT '文章转载来源',
  `from_url` varchar(255) NOT NULL DEFAULT '' COMMENT '来源URL',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章记录创建时间',
  `edit_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章记录修改时间',
  `is_jump` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 跳转 0 不跳转',
  `jump_url` varchar(255) NOT NULL DEFAULT '' COMMENT '跳转地址',
  `hits` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击量',
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '操作管理员名称',
  `is_page` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '文章是否分页  0默认不分页，>1 具体页数',
  `is_comment` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否开启评论 0 不开启 1开启',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '文章状态 0 待发布（审核） 1已发布 2 逻辑删除 ',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COMMENT='新闻文章列表';

-- ----------------------------
-- Records of xpcms_article_shibai
-- ----------------------------
INSERT INTO `xpcms_article_shibai` VALUES ('3', '测试标题', '测试标题1', '0', '20', '/storage/static/images/QmWRjZMI1PpbE9xzwKCDuPyDeMSAscP6sSr6R79X.png', '测试标题2', '测试标题3', '测试标题4', '测试标题5', '', '腾讯新闻', '测试标题6', '1548580183', '1582638271', '0', '', '62345', '0', '1', '1', '1');
INSERT INTO `xpcms_article_shibai` VALUES ('4', '测试标题', '测试标题1', '0', '20', '/storage/static/images/rzHygVlYbHNbl5inerL0w2wfxO68YHVKajYp9tDM.png', '测试标题2', '测试标题3', '测试标题4', '测试标题5', '', '腾讯新闻', '测试标题6', '1548580183', '1582638271', '0', '', '12345', '0', '1', '1', '1');
INSERT INTO `xpcms_article_shibai` VALUES ('5', '测试标题', '测试标题1', '0', '20', '', '测试标题2', '测试标题3', '测试标题4', '测试标题5', '', '腾讯新闻', '测试标题6', '1548580183', '1582638271', '0', '', '23456', '0', '1', '1', '1');
INSERT INTO `xpcms_article_shibai` VALUES ('6', '测试标题', '测试标题1', '0', '20', '', '测试标题2', '测试标题3', '测试标题4', '测试标题5', '', 'php中文网', '测试标题6', '1548580183', '1582638271', '0', '', '67890', '0', '1', '1', '1');
INSERT INTO `xpcms_article_shibai` VALUES ('7', '测试标题', '测试标题1', '0', '20', '/storage/static/images/rkMDOLmsjLch75YfOycyqjp8XgAEfQb2NMXCSYNL.jpeg', '测试标题2', '测试标题3', '测试标题4', '测试标题5', '', 'sina', '测试标题6', '1563875463', '1582638271', '0', '', '0', '0', '0', '1', '1');
INSERT INTO `xpcms_article_shibai` VALUES ('8', '测试标题', '测试标题1', '0', '20', '', '测试标题2', '测试标题3', '测试标题4', '测试标题5', '', '新浪', '测试标题6', '1563875514', '1582638271', '0', '', '0', '0', '0', '1', '1');
INSERT INTO `xpcms_article_shibai` VALUES ('9', '测试标题', '测试标题1', '0', '20', '/storage/static/images/AFEaSChgLLustcv2zNE5J7k2GXFJ4TBD4GwT2TzO.jpeg', '测试标题2', '测试标题3', '测试标题4', '测试标题5', '', '腾讯新闻', '测试标题6', '1563875586', '1582638271', '0', '', '0', '0', '0', '1', '1');
INSERT INTO `xpcms_article_shibai` VALUES ('10', '测试标题', '测试标题1', '0', '20', '', '测试标题2', '测试标题3', '测试标题4', '测试标题5', '', 'php中文网', '测试标题6', '1563876169', '1582638271', '0', '', '0', '0', '0', '1', '1');
INSERT INTO `xpcms_article_shibai` VALUES ('15', '测试标题', '测试标题1', '0', '20', '', '测试标题2', '测试标题3', '测试标题4', '测试标题5', '', 'php中文网', '测试标题6', '1566810847', '1582638271', '0', '', '0', '0', '0', '1', '1');
INSERT INTO `xpcms_article_shibai` VALUES ('16', '测试标题', '测试标题1', '0', '20', '', '测试标题2', '测试标题3', '测试标题4', '测试标题5', '', '腾讯新闻', '测试标题6', '1566810994', '1582638271', '0', '', '0', '0', '0', '1', '1');
INSERT INTO `xpcms_article_shibai` VALUES ('17', '测试标题', '测试标题1', '0', '20', '', '测试标题2', '测试标题3', '测试标题4', '测试标题5', '', '新浪汽车', '测试标题6', '1566974106', '1582638271', '0', '', '0', '0', '0', '1', '1');
INSERT INTO `xpcms_article_shibai` VALUES ('18', '测试标题', '测试标题1', '0', '20', '', '测试标题2', '测试标题3', '测试标题4', '测试标题5', '', '新浪汽车', '测试标题6', '1566974180', '1582638271', '0', '', '0', '0', '0', '1', '1');
INSERT INTO `xpcms_article_shibai` VALUES ('19', '测试标题', '测试标题1', '0', '20', '', '测试标题2', '测试标题3', '测试标题4', '测试标题5', '', '新浪汽车', '测试标题6', '1566974229', '1582638271', '0', '', '0', '0', '0', '1', '1');
INSERT INTO `xpcms_article_shibai` VALUES ('20', '测试标题', '测试标题1', '0', '20', '', '测试标题2', '测试标题3', '测试标题4', '测试标题5', '', '新浪汽车', '测试标题6', '1566974266', '1582638271', '0', '', '0', '0', '0', '1', '1');
INSERT INTO `xpcms_article_shibai` VALUES ('21', '测试标题', '测试标题1', '0', '20', '', '测试标题2', '测试标题3', '测试标题4', '测试标题5', '', '新浪汽车', '测试标题6', '1566974308', '1582638271', '0', '', '0', '0', '0', '1', '1');
INSERT INTO `xpcms_article_shibai` VALUES ('22', '测试标题', '测试标题1', '0', '20', '', '测试标题2', '测试标题3', '测试标题4', '测试标题5', '', '新浪汽车', '测试标题6', '1566974434', '1582638271', '0', '', '0', '0', '0', '1', '1');
INSERT INTO `xpcms_article_shibai` VALUES ('23', '测试标题', '测试标题1', '0', '20', '', '测试标题2', '测试标题3', '测试标题4', '测试标题5', '', '新浪汽车', '测试标题6', '1566974477', '1582638271', '0', '', '0', '0', '0', '1', '1');
INSERT INTO `xpcms_article_shibai` VALUES ('24', '测试标题', '测试标题1', '0', '20', '', '测试标题2', '测试标题3', '测试标题4', '测试标题5', '', '新浪汽车', '测试标题6', '1566974522', '1582638271', '0', '', '0', '0', '0', '1', '1');
INSERT INTO `xpcms_article_shibai` VALUES ('25', '测试标题', '测试标题1', '0', '20', '', '测试标题2', '测试标题3', '测试标题4', '测试标题5', '', '小米原创', '测试标题6', '1566974784', '1582638271', '0', '', '0', '0', '0', '1', '1');
INSERT INTO `xpcms_article_shibai` VALUES ('26', '测试标题', '测试标题1', '0', '20', '', '测试标题2', '测试标题3', '测试标题4', '测试标题5', '', '小米原创', '测试标题6', '1566974828', '1582638271', '0', '', '0', '0', '0', '1', '1');
INSERT INTO `xpcms_article_shibai` VALUES ('27', '测试标题', '测试标题1', '0', '20', '/storage/static/images/x45to8flMZJgvBsjIqI4zC5MjrAw1EZeFC1erSsu.jpeg', '测试标题2', '测试标题3', '测试标题4', '测试标题5', '', '777', '测试标题6', '1566976984', '1582638271', '0', '', '0', '0', '0', '1', '1');
INSERT INTO `xpcms_article_shibai` VALUES ('28', '测试标题', '测试标题1', '0', '20', '/storage/static/images/oDb7UqJYUi5nO91HKS0Nr2TsXmVencwvFfrFgWlk.jpeg', '测试标题2', '测试标题3', '测试标题4', '测试标题5', '', '777', '测试标题6', '1566977102', '1582638271', '0', '', '0', '0', '0', '1', '1');
INSERT INTO `xpcms_article_shibai` VALUES ('29', '测试标题', '测试标题1', '0', '20', '/storage/static/images/pX8GF26GEXXwkDaHGNPIFmlcE2sQsc0UBr7zuzWn.jpeg', '测试标题2', '测试标题3', '测试标题4', '测试标题5', '', '腾讯新闻', '测试标题6', '1566977158', '1582638271', '0', '', '0', '0', '0', '1', '1');
INSERT INTO `xpcms_article_shibai` VALUES ('30', '测试标题', '测试标题1', '0', '20', '/storage/static/images/vw196dClq3YbQFIurpoZgmAlUGM2IqTCknW4LrtU.jpeg', '测试标题2', '测试标题3', '测试标题4', '测试标题5', '', 'php中文网', '测试标题6', '1566977263', '1582638271', '0', '', '0', '0', '0', '1', '1');
INSERT INTO `xpcms_article_shibai` VALUES ('31', '测试标题', '测试标题1', '0', '20', '/storage/static/images/X6FQ30RiLdOfpunMJMli16sA56lsc1nbli6eKMqw.jpeg', '测试标题2', '测试标题3', '测试标题4', '测试标题5', '', 'php中文网', '测试标题6', '1566977592', '1582638271', '0', '', '0', '0', '0', '1', '1');
INSERT INTO `xpcms_article_shibai` VALUES ('32', '测试标题', '测试标题1', '0', '20', '/storage/static/images/E5t5O0X1VwZUudMP8HrMYLIRXcyGgYOKUGkxvinw.jpeg', '测试标题2', '测试标题3', '测试标题4', '测试标题5', '', 'php中文网', '测试标题6', '1566977658', '1582638271', '0', '', '0', '0', '0', '1', '1');
INSERT INTO `xpcms_article_shibai` VALUES ('33', '测试标题', '测试标题1', '0', '20', '/storage/static/images/NxZ9Dx36V4qq2yfW0w7bXXCI1QpDxZODY2wr9MPw.jpeg', '测试标题2', '测试标题3', '测试标题4', '测试标题5', '', 'php中文网', '测试标题6', '1566977715', '1582638271', '0', '', '0', '0', '0', '1', '1');
INSERT INTO `xpcms_article_shibai` VALUES ('34', '测试标题', '测试标题1', '0', '20', '/storage/static/images/N6Emm72xNxWTdgI0dqM5iykfxA1yzLFl9hzBbm2P.jpeg', '测试标题2', '测试标题3', '测试标题4', '测试标题5', '', 'php中文网', '测试标题6', '1566977860', '1582638271', '0', '', '0', '0', '0', '1', '1');
INSERT INTO `xpcms_article_shibai` VALUES ('35', '测试标题', '测试标题1', '0', '20', '/storage/static/images/8AhUWr0BlsBZ7ugmSNGfMeqX9lunzRcxKRRXQfe2.jpeg', '测试标题2', '测试标题3', '测试标题4', '测试标题5', '', 'php中文网', '测试标题6', '1566978357', '1582638271', '0', '', '0', '0', '0', '1', '1');
INSERT INTO `xpcms_article_shibai` VALUES ('36', '测试标题', '测试标题1', '0', '20', '/storage/static/images/I5RDVHs5eZ1siLuDw3G1PYVblGjMapeBeIizQwQL.jpeg', '测试标题2', '测试标题3', '测试标题4', '测试标题5', '', 'php中文网', '测试标题6', '1566978437', '1582638271', '0', '', '0', '0', '0', '1', '1');
INSERT INTO `xpcms_article_shibai` VALUES ('39', '测试标题', '测试标题1', '23', '20', '/storage/static/images/I5RDVHs5eZ1siLuDw3G1PYVblGjMapeBeIizQwQL.jpeg', '测试标题2', '测试标题3', '测试标题4', '测试标题5', '', '', '测试标题6', '1575030846', '1582638271', '0', '', '0', '0', '0', '1', '1');
INSERT INTO `xpcms_article_shibai` VALUES ('46', '测试标题', '测试标题1', '0', '20', '', '测试标题2', '测试标题3', '测试标题4', '测试标题5', '', '', '测试标题6', '1582637395', '1582638271', '0', '', '0', '0', '0', '1', '1');
INSERT INTO `xpcms_article_shibai` VALUES ('47', '测试标题', '测试标题1', '0', '20', '', '测试标题2', '测试标题3', '测试标题4', '测试标题5', '', '', '测试标题6', '1582638063', '1582638271', '0', '', '0', '0', '0', '1', '1');

-- ----------------------------
-- Table structure for xpcms_article_title_catelog
-- ----------------------------
DROP TABLE IF EXISTS `xpcms_article_title_catelog`;
CREATE TABLE `xpcms_article_title_catelog` (
  `article_content_catelog_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '目录ID',
  `article_id` int(10) NOT NULL COMMENT '文章ID',
  `article_content_catelog_pid` int(11) NOT NULL COMMENT '目录父ID',
  `article_content_catelog_title` varchar(255) NOT NULL COMMENT '目录标题',
  `article_content_catelog_url` varchar(255) NOT NULL DEFAULT '' COMMENT '目录链接地址',
  `article_content_catelog_ext_1` varchar(255) DEFAULT NULL COMMENT '附加信息1',
  `article_content_catelog_ext_2` varchar(255) DEFAULT NULL COMMENT '附加信息2',
  `article_content_catelog_ext_3` varchar(255) DEFAULT NULL COMMENT '附加信息3',
  PRIMARY KEY (`article_content_catelog_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='带有目录的文章记录表';

-- ----------------------------
-- Records of xpcms_article_title_catelog
-- ----------------------------

-- ----------------------------
-- Table structure for xpcms_badword
-- ----------------------------
DROP TABLE IF EXISTS `xpcms_badword`;
CREATE TABLE `xpcms_badword` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '敏感词ID',
  `words` char(32) NOT NULL COMMENT '敏感词',
  `level` tinyint(1) NOT NULL DEFAULT '0' COMMENT '过滤等级，0带处理 1 过滤 2 危险直接删除',
  `replaces` char(32) NOT NULL DEFAULT '0' COMMENT '替换词',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `edit_time` int(10) NOT NULL COMMENT '更新时间',
  `admin_id` int(10) NOT NULL COMMENT '操作管理员',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xpcms_badword
-- ----------------------------
INSERT INTO `xpcms_badword` VALUES ('1', '贩枪', '2', '**', '1547101790', '1547112124', '0');
INSERT INTO `xpcms_badword` VALUES ('2', '制毒', '2', '**', '1547101790', '1547099176', '0');
INSERT INTO `xpcms_badword` VALUES ('3', '找小姐', '1', '**', '1547101790', '1547112100', '0');
INSERT INTO `xpcms_badword` VALUES ('4', '招妓', '1', '**', '1547112950', '1547113426', '0');
INSERT INTO `xpcms_badword` VALUES ('5', 'reerrrere', '1', '00', '1547200542', '1547200542', '0');
INSERT INTO `xpcms_badword` VALUES ('6', 'dad', '1', '**', '1548562336', '1548562336', '0');
INSERT INTO `xpcms_badword` VALUES ('7', 'bsd', '1', '**', '1548562336', '1548562336', '0');
INSERT INTO `xpcms_badword` VALUES ('8', 'abc', '1', '**', '1548562714', '1548562714', '0');
INSERT INTO `xpcms_badword` VALUES ('9', '456', '1', '**', '1548562714', '1548562714', '0');
INSERT INTO `xpcms_badword` VALUES ('10', '678', '1', '**', '1548562714', '1548562714', '0');
INSERT INTO `xpcms_badword` VALUES ('11', '冰毒', '2', '**', '1548562742', '1548562742', '0');
INSERT INTO `xpcms_badword` VALUES ('12', '摇头丸', '2', '**', '1548562742', '1548562742', '0');
INSERT INTO `xpcms_badword` VALUES ('13', '猎枪', '2', '***', '1548562742', '1565431728', '1');
INSERT INTO `xpcms_badword` VALUES ('14', '哈哈', '1', '**', '1565589493', '1565589493', '1');

-- ----------------------------
-- Table structure for xpcms_block
-- ----------------------------
DROP TABLE IF EXISTS `xpcms_block`;
CREATE TABLE `xpcms_block` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '文章数据块ID',
  `type` smallint(5) NOT NULL DEFAULT '1' COMMENT '数据块类型 1 文字推荐 2 图文推荐 3存图推荐 4幻灯推荐',
  `title` char(16) NOT NULL COMMENT '数据块名称',
  `add_time` int(10) NOT NULL DEFAULT '1' COMMENT '数据块创建时间',
  `edit_time` int(10) NOT NULL DEFAULT '1' COMMENT '数据块内容更新时间',
  `nums` smallint(5) NOT NULL DEFAULT '5' COMMENT '调取数据默认条数',
  `admin_id` smallint(5) NOT NULL COMMENT '数据块设置管理员操作ID',
  `is_auto` tinyint(1) NOT NULL DEFAULT '0' COMMENT '自动推荐调取 0 不自动获取，1 最新，2热门',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '数据块 状态 0 未启用（待启用、停用）1启用',
  PRIMARY KEY (`id`),
  UNIQUE KEY `block_name` (`title`) USING HASH
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='小皮CMS 数据块字典：\r\n作用，cms 中，各级页面需要推送显示的数据块';

-- ----------------------------
-- Records of xpcms_block
-- ----------------------------
INSERT INTO `xpcms_block` VALUES ('1', '5', '首页幻灯', '1542281727', '1542281727', '5', '1', '0', '1');
INSERT INTO `xpcms_block` VALUES ('2', '1', '测试数据块1113', '0', '0', '10', '1', '0', '1');
INSERT INTO `xpcms_block` VALUES ('3', '1', '测试数据1115', '1542334321', '1542334321', '5', '1', '0', '0');
INSERT INTO `xpcms_block` VALUES ('4', '1', '测试数据1116', '1542334321', '1542334321', '5', '1', '0', '0');
INSERT INTO `xpcms_block` VALUES ('5', '1', '测试数据1117', '1542334321', '1542334321', '5', '1', '0', '0');

-- ----------------------------
-- Table structure for xpcms_block_data
-- ----------------------------
DROP TABLE IF EXISTS `xpcms_block_data`;
CREATE TABLE `xpcms_block_data` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '数据块数据ID',
  `block_id` int(10) NOT NULL COMMENT '数据块ID',
  `type_id` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'block_type表的id',
  `title` varchar(255) NOT NULL COMMENT '数据块数据标题',
  `descs` varchar(255) NOT NULL COMMENT '推荐摘要',
  `thumb` varchar(255) NOT NULL COMMENT '数据块数据引用的图片缩略图',
  `add_time` int(10) NOT NULL COMMENT '添加时间',
  `edit_time` int(10) NOT NULL COMMENT '推送新闻修改时间，排序需要',
  `jump` tinyint(1) NOT NULL DEFAULT '1' COMMENT '跳转对象 1 新闻 2 频道列表 3 自定义URL（内外站皆可）',
  `article_id` int(10) NOT NULL DEFAULT '0' COMMENT '可跳转文章id',
  `channel_id` int(10) NOT NULL DEFAULT '0' COMMENT '可跳转频道ID',
  `jump_url` varchar(255) NOT NULL COMMENT '可跳转外链',
  `is_top` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否置顶 0 不置顶 1 置顶',
  `admin_id` smallint(5) NOT NULL DEFAULT '0' COMMENT '操作管理员ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='小皮CMS 数据块数据内容字典：\r\n作用，cms 中，各级页面需要推送显示的数据块';

-- ----------------------------
-- Records of xpcms_block_data
-- ----------------------------
INSERT INTO `xpcms_block_data` VALUES ('1', '1', '4', '第一幅图片', '', './data/updata/block/20181116/1.png', '1542282075', '1542282075', '1', '1', '0', '', '0', '1');
INSERT INTO `xpcms_block_data` VALUES ('2', '1', '1', '测试数据块2的测试数据1122334455', '测试数据块2的测试数据1122334455', './data/updata/block/20181116/1.png', '1542334321', '1542334521', '1', '2', '0', '', '0', '1');
INSERT INTO `xpcms_block_data` VALUES ('3', '1', '4', '第三幅图片', '', './data/updata/block/20181116/3.png', '1542282075', '1542282077', '1', '1', '0', '', '0', '1');
INSERT INTO `xpcms_block_data` VALUES ('4', '1', '4', '第四幅图片', '', './data/updata/block/20181116/4.png', '1542282075', '1542282078', '1', '1', '0', '', '0', '1');
INSERT INTO `xpcms_block_data` VALUES ('5', '2', '1', '测试数据块2的测试数据1122334455', '测试数据块2的测试数据1122334455', './data/updata/block/20181116/1.png', '1542334321', '1542334321', '1', '2', '0', '', '0', '1');
INSERT INTO `xpcms_block_data` VALUES ('6', '2', '1', '测试数据块2的测试数据1122334455', '测试数据块2的测试数据1122334455', './data/updata/block/20181116/1.png', '1542334321', '1542334321', '1', '2', '0', '', '0', '1');

-- ----------------------------
-- Table structure for xpcms_block_type
-- ----------------------------
DROP TABLE IF EXISTS `xpcms_block_type`;
CREATE TABLE `xpcms_block_type` (
  `id` tinyint(3) NOT NULL COMMENT '数据块类型 1 文字推荐 2 图文推荐 3存图推荐 4幻灯推荐',
  `title` char(16) NOT NULL COMMENT '数据块类型名称',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='数据块类型 1 文字推荐 2 图文推荐 3存图推荐 4幻灯推荐';

-- ----------------------------
-- Records of xpcms_block_type
-- ----------------------------
INSERT INTO `xpcms_block_type` VALUES ('1', '纯文字推荐');
INSERT INTO `xpcms_block_type` VALUES ('2', '图文推荐');
INSERT INTO `xpcms_block_type` VALUES ('3', '存图推荐');
INSERT INTO `xpcms_block_type` VALUES ('4', '幻灯推荐');
INSERT INTO `xpcms_block_type` VALUES ('5', '其它');

-- ----------------------------
-- Table structure for xpcms_category___暂时无用
-- ----------------------------
DROP TABLE IF EXISTS `xpcms_category___暂时无用`;
CREATE TABLE `xpcms_category___暂时无用` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT COMMENT '文章分类ID',
  `pid` int(5) NOT NULL,
  `title` varchar(32) NOT NULL COMMENT '文章分类名称',
  `seo_title` varchar(255) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  `descs` varchar(255) NOT NULL,
  `cover_img` varchar(255) NOT NULL COMMENT '频道封面图',
  `add_time` int(10) NOT NULL DEFAULT '0' COMMENT '分类创建时间',
  `edit_time` int(10) NOT NULL DEFAULT '0' COMMENT '分类修改时间',
  `admin_id` int(10) NOT NULL DEFAULT '0' COMMENT '操作管理员ID',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '分类状态 0启用，1禁用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='文章分类表';

-- ----------------------------
-- Records of xpcms_category___暂时无用
-- ----------------------------

-- ----------------------------
-- Table structure for xpcms_channel
-- ----------------------------
DROP TABLE IF EXISTS `xpcms_channel`;
CREATE TABLE `xpcms_channel` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '栏目（频道）ID',
  `title` char(32) NOT NULL COMMENT '栏目名称',
  `pid` int(10) NOT NULL DEFAULT '0' COMMENT '指向父ID（子栏目ID）',
  `seo_title` varchar(255) NOT NULL COMMENT '栏目（频道）SEO 标题',
  `keyword` varchar(255) NOT NULL COMMENT '栏目（频道）SEO 关键词',
  `descs` varchar(255) NOT NULL COMMENT '栏目（频道）SEO 描述',
  `add_time` int(10) NOT NULL COMMENT '频道创建时间',
  `edit_time` int(10) NOT NULL COMMENT '频道修改时间',
  `admin_id` smallint(5) NOT NULL COMMENT '操作管理ID',
  `is_single` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否开启频道独立页面，0否，1是',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '频道状态 0 未启用 1 启用 2锁定 \r\n0 未启用 前台不显示但可添加子频道，子频道也为0，\r\n2 锁定，锁定频道',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='小皮CMS新闻（栏目）表（栏目索引）';

-- ----------------------------
-- Records of xpcms_channel
-- ----------------------------
INSERT INTO `xpcms_channel` VALUES ('1', '开发', '0', '', '', '', '0', '0', '0', '0', '1');
INSERT INTO `xpcms_channel` VALUES ('2', 'PHP', '1', '', '', '', '0', '0', '0', '0', '1');
INSERT INTO `xpcms_channel` VALUES ('3', '框架', '2', '', '', '', '0', '0', '0', '0', '1');
INSERT INTO `xpcms_channel` VALUES ('4', 'XpPHP框架', '3', '', '', '', '0', '0', '0', '0', '1');
INSERT INTO `xpcms_channel` VALUES ('5', '基础知识', '2', '', '', '', '0', '0', '0', '0', '1');
INSERT INTO `xpcms_channel` VALUES ('6', '开发规范', '2', '', '', '', '0', '0', '0', '0', '1');
INSERT INTO `xpcms_channel` VALUES ('7', '类库下载', '2', '', '', '', '0', '0', '0', '0', '1');
INSERT INTO `xpcms_channel` VALUES ('8', 'Psr 规范', '6', '', '', '', '0', '0', '0', '0', '1');
INSERT INTO `xpcms_channel` VALUES ('9', 'Psr0', '8', '', '', '', '0', '0', '0', '0', '1');
INSERT INTO `xpcms_channel` VALUES ('10', 'Psr1', '8', '', '', '', '0', '0', '0', '0', '1');
INSERT INTO `xpcms_channel` VALUES ('11', 'Psr2', '8', '', '', '', '0', '0', '0', '0', '1');
INSERT INTO `xpcms_channel` VALUES ('12', 'Psr3', '8', '', '', '', '0', '0', '0', '0', '1');
INSERT INTO `xpcms_channel` VALUES ('13', 'Psr4', '8', '', '', '', '0', '0', '0', '0', '1');
INSERT INTO `xpcms_channel` VALUES ('14', 'Psr5', '8', '', '', '', '0', '0', '0', '0', '1');
INSERT INTO `xpcms_channel` VALUES ('15', 'Psr6', '8', '', '', '', '0', '0', '0', '0', '1');
INSERT INTO `xpcms_channel` VALUES ('16', 'Psr7', '8', '', '', '', '0', '0', '0', '0', '1');
INSERT INTO `xpcms_channel` VALUES ('17', '行业动态', '0', '', '', '', '0', '0', '0', '0', '1');
INSERT INTO `xpcms_channel` VALUES ('18', '人工智能', '0', '', '', '', '0', '0', '0', '0', '1');
INSERT INTO `xpcms_channel` VALUES ('19', '区块链', '0', '', '', '', '0', '0', '0', '0', '1');
INSERT INTO `xpcms_channel` VALUES ('20', '安全', '0', '', '', '', '0', '0', '0', '0', '1');

-- ----------------------------
-- Table structure for xpcms_comment
-- ----------------------------
DROP TABLE IF EXISTS `xpcms_comment`;
CREATE TABLE `xpcms_comment` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `aid` int(10) NOT NULL COMMENT '待评论文章ID',
  `user_id` int(10) NOT NULL COMMENT '评论用户ID',
  `contents` text NOT NULL COMMENT '评论内容',
  `replay_uid` smallint(5) NOT NULL COMMENT '谁回复的',
  `add_time` int(10) NOT NULL COMMENT '发表评论时间',
  `edit_time` int(10) NOT NULL COMMENT '管理员回复时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '回复 0 不显示 1 显示',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xpcms_comment
-- ----------------------------

-- ----------------------------
-- Table structure for xpcms_dict_con
-- ----------------------------
DROP TABLE IF EXISTS `xpcms_dict_con`;
CREATE TABLE `xpcms_dict_con` (
  `controller_name` varchar(255) DEFAULT NULL,
  `controller_title` varchar(255) DEFAULT NULL COMMENT '控制器标识'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xpcms_dict_con
-- ----------------------------
INSERT INTO `xpcms_dict_con` VALUES ('common', '通用接口');
INSERT INTO `xpcms_dict_con` VALUES ('admin', '权限接口');
INSERT INTO `xpcms_dict_con` VALUES ('content', '内容接口');
INSERT INTO `xpcms_dict_con` VALUES ('extend', '扩展接口');
INSERT INTO `xpcms_dict_con` VALUES ('site', '站点接口');
INSERT INTO `xpcms_dict_con` VALUES ('user', '用户接口');

-- ----------------------------
-- Table structure for xpcms_fs_link
-- ----------------------------
DROP TABLE IF EXISTS `xpcms_fs_link`;
CREATE TABLE `xpcms_fs_link` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '链接ID',
  `url` varchar(255) NOT NULL COMMENT '链接地址',
  `title` varchar(255) NOT NULL COMMENT '链接标题',
  `img` varchar(255) NOT NULL COMMENT '链接图片',
  `add_time` int(10) NOT NULL DEFAULT '1' COMMENT '创建时间',
  `edit_time` int(10) NOT NULL DEFAULT '1' COMMENT '更新时间',
  `is_transition` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否启用中转跳转 1 启用，0 直接显示友情链接地址',
  `admin_id` int(10) NOT NULL COMMENT '操作管理员名称',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='友情链接';

-- ----------------------------
-- Records of xpcms_fs_link
-- ----------------------------

-- ----------------------------
-- Table structure for xpcms_image
-- ----------------------------
DROP TABLE IF EXISTS `xpcms_image`;
CREATE TABLE `xpcms_image` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '上传图片记录ID',
  `remark` varchar(255) NOT NULL COMMENT '备注',
  `ext` char(16) NOT NULL COMMENT '文件类型 jpg|png',
  `size` varchar(32) NOT NULL,
  `url` varchar(255) NOT NULL COMMENT '图片链接地址',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 图片 2 其它类型文件',
  `width` int(4) NOT NULL DEFAULT '0' COMMENT '图片宽度',
  `height` int(4) NOT NULL DEFAULT '0' COMMENT '图片高度',
  `article_id` int(10) NOT NULL DEFAULT '0' COMMENT '归属文章来源',
  `article_cid` int(10) NOT NULL DEFAULT '0' COMMENT '对应文章详情ID',
  `block_id` int(10) NOT NULL DEFAULT '0' COMMENT '归属数据块ID',
  `user_id` int(10) NOT NULL DEFAULT '0' COMMENT '用户头像对应用户ID',
  `add_time` int(10) NOT NULL DEFAULT '0' COMMENT '上传文件时间',
  `edit_time` int(10) NOT NULL DEFAULT '0' COMMENT '更新文件时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xpcms_image
-- ----------------------------
INSERT INTO `xpcms_image` VALUES ('4', '', 'png', '394615', '2019/01/13/80e6c5bf337edc425f12a30349af91bd.png', '1', '0', '0', '0', '0', '0', '0', '1547392400', '1547392400');
INSERT INTO `xpcms_image` VALUES ('5', '', 'png', '702447', '2019/01/13/ee27d2edf331dffbfaa5036c1954e817.png', '1', '0', '0', '0', '0', '0', '0', '1547392400', '1547392400');
INSERT INTO `xpcms_image` VALUES ('3', '', 'jpeg', '31626', '2019/01/13/2e5fddeaeb67c162acb8675cda01b749.jpg', '1', '0', '0', '0', '0', '0', '0', '1547392235', '1547392235');
INSERT INTO `xpcms_image` VALUES ('6', '', 'png', '777752', '2019/01/13/5afc64c6e05edd22fc5f75f6f22fc15f.png', '1', '0', '0', '0', '0', '0', '0', '1547392400', '1547392400');
INSERT INTO `xpcms_image` VALUES ('7', '', 'jpeg', '108996', '2019/01/13/4b97e787afa03f5c07b2855c25f30180.jpg', '1', '0', '0', '0', '0', '0', '0', '1547392638', '1547392638');
INSERT INTO `xpcms_image` VALUES ('8', '', 'jpeg', '108996', '2019/01/13/4b97e787afa03f5c07b2855c25f30180.jpg', '1', '0', '0', '0', '0', '0', '0', '1547392650', '1547392650');
INSERT INTO `xpcms_image` VALUES ('9', '', 'jpeg', '108996', '2019/01/13/4b97e787afa03f5c07b2855c25f30180.jpg', '1', '0', '0', '0', '0', '0', '0', '1547392897', '1547392897');
INSERT INTO `xpcms_image` VALUES ('10', '', 'jpeg', '108996', '2019/01/13/4b97e787afa03f5c07b2855c25f30180.jpg', '1', '0', '0', '0', '0', '0', '0', '1547394186', '1547394186');
INSERT INTO `xpcms_image` VALUES ('11', '', 'jpeg', '108996', '2019/01/26/4b97e787afa03f5c07b2855c25f30180.jpg', '1', '0', '0', '0', '0', '0', '0', '1548514280', '1548514280');
INSERT INTO `xpcms_image` VALUES ('12', '', 'jpeg', '108996', '2019/01/26/4b97e787afa03f5c07b2855c25f30180.jpg', '1', '0', '0', '0', '0', '0', '0', '1548514285', '1548514285');
INSERT INTO `xpcms_image` VALUES ('13', '', 'png', '812671', '2019/01/26/d63d1113bd33cddb5ed88bbfc8e76214.png', '1', '0', '0', '0', '0', '0', '0', '1548514302', '1548514302');
INSERT INTO `xpcms_image` VALUES ('14', '', 'png', '394615', '2019/01/26/80e6c5bf337edc425f12a30349af91bd.png', '1', '0', '0', '0', '0', '0', '0', '1548514716', '1548514716');
INSERT INTO `xpcms_image` VALUES ('15', '', 'png', '777752', '2019/01/26/5afc64c6e05edd22fc5f75f6f22fc15f.png', '1', '0', '0', '0', '0', '0', '0', '1548514749', '1548514749');
INSERT INTO `xpcms_image` VALUES ('16', '', 'jpeg', '108996', '2019/01/27/4b97e787afa03f5c07b2855c25f30180.jpg', '1', '0', '0', '0', '0', '0', '0', '1548585148', '1548585148');
INSERT INTO `xpcms_image` VALUES ('17', '', 'png', '702447', '2019/01/27/ee27d2edf331dffbfaa5036c1954e817.png', '1', '0', '0', '0', '0', '0', '0', '1548589106', '1548589106');
INSERT INTO `xpcms_image` VALUES ('18', '', 'jpeg', '108996', '2019/01/29/4b97e787afa03f5c07b2855c25f30180.jpg', '1', '0', '0', '0', '0', '0', '0', '1548775317', '1548775317');

-- ----------------------------
-- Table structure for xpcms_model
-- ----------------------------
DROP TABLE IF EXISTS `xpcms_model`;
CREATE TABLE `xpcms_model` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '序号',
  `code` varchar(32) NOT NULL DEFAULT '' COMMENT '模型标识',
  `title` varchar(32) NOT NULL DEFAULT '' COMMENT '模型名称',
  `descs` varchar(255) NOT NULL DEFAULT '' COMMENT '该模型展示描述',
  `ord` smallint(4) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '模型状态, 0 正常 1 禁用',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `edit_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `index_url` varchar(150) NOT NULL DEFAULT '' COMMENT '首页自定义url',
  `list_url` varchar(150) NOT NULL DEFAULT '' COMMENT '列表页自定义url',
  `detail_url` varchar(150) NOT NULL DEFAULT '' COMMENT '内容页自定义url',
  `index_tpl` varchar(400) NOT NULL DEFAULT '' COMMENT '首页模板',
  `list_tpl` varchar(400) NOT NULL DEFAULT '' COMMENT '列表页模板',
  `detail_tpl` varchar(400) NOT NULL DEFAULT '' COMMENT '内容页模板',
  `article` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否开启公用列表 0开启 1关闭',
  `content` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否开启公用内容 0开启 1关闭',
  `controller` varchar(50) NOT NULL DEFAULT '' COMMENT '后端controller',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '后台action',
  `is_menu` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0开启1关闭',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `model_code` (`code`) USING BTREE,
  UNIQUE KEY `model_name` (`title`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='后台管理 - - 模型表';

-- ----------------------------
-- Records of xpcms_model
-- ----------------------------
INSERT INTO `xpcms_model` VALUES ('1', 'single', '单页', '', '2', '1', '1546936496', '1566610201', '', '', '', '[\"111\",\"222\",\"333\"]', '[\"444\",\"555\",\"666\"]', '[\"777\",\"888\",\"999\"]', '0', '0', '', '', '0');
INSERT INTO `xpcms_model` VALUES ('2', 'base', '资讯', '', '1', '0', '1546936496', '1566610571', '', '', '', '[\"index1\",\"index2\",\"index3\"]', '[\"list1\",\"list2\",\"list3\"]', '[\"detail1\",\"detail2\"]', '0', '0', '', '', '0');
INSERT INTO `xpcms_model` VALUES ('4', 'images', '图片集', '列表页 + 详情页', '4', '0', '1546936496', '1546936496', '', '', '', '', '', '', '0', '0', '', '', '0');
INSERT INTO `xpcms_model` VALUES ('5', 'video', '视频新闻', '列表页 + 详情页', '5', '1', '1546936496', '1566610161', '', '', '', '', '', '', '0', '0', '', '', '0');
INSERT INTO `xpcms_model` VALUES ('6', 'course', '在线课程', '频道页 + 列表页 + 详情页 + 详情内列表', '6', '1', '1546936496', '1566610342', '', '', '', '', '', '', '0', '0', '', '', '0');
INSERT INTO `xpcms_model` VALUES ('7', 'topic', '专题', '列表页 + 详情页', '7', '1', '1546936496', '1546936496', '', '', '', '', '', '', '0', '0', '', '', '0');
INSERT INTO `xpcms_model` VALUES ('23', 'shop', '商城模型', '商品模型', '0', '0', '1575030502', '1575030502', '', '', '', '', '', '', '0', '0', '', '', '0');

-- ----------------------------
-- Table structure for xpcms_model_copy1
-- ----------------------------
DROP TABLE IF EXISTS `xpcms_model_copy1`;
CREATE TABLE `xpcms_model_copy1` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '序号',
  `code` varchar(32) NOT NULL COMMENT '模型标识',
  `title` varchar(32) NOT NULL COMMENT '模型名称',
  `descs` varchar(255) NOT NULL COMMENT '该模型展示描述',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '模型类型, 1 单页 2 列表 + 详情',
  `ext_table` varchar(255) NOT NULL COMMENT '附加数据库表',
  `list_tpl` varchar(30) NOT NULL COMMENT '列表页模板',
  `detail_tpl` varchar(30) NOT NULL COMMENT '内容页模板',
  `is_sys` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '系统自带, 0 系统 1 自定义',
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '操作人员',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `edit_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `ord` smallint(4) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '模型状态, 0 正常 1 禁用',
  PRIMARY KEY (`id`),
  UNIQUE KEY `model_code` (`code`) USING BTREE,
  UNIQUE KEY `model_name` (`title`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='后台管理 - - 模型表';

-- ----------------------------
-- Records of xpcms_model_copy1
-- ----------------------------
INSERT INTO `xpcms_model_copy1` VALUES ('1', 'single', '单页文章', '单页面', '1', 'xp_cms_article_content_single', '', 'news_single.html', '1', '0', '1546936496', '1546936496', '2', '1');
INSERT INTO `xpcms_model_copy1` VALUES ('2', 'base', '常规文章', '列表页 + 详情页', '2', 'xp_cms_article_content_general', 'news_list.html', 'news_detail.html', '1', '0', '1546936496', '1546936496', '1', '1');
INSERT INTO `xpcms_model_copy1` VALUES ('4', 'images', '图片集', '列表页 + 详情页', '2', 'xp_cms_article_content_images', 'news_pic_list.html', 'news_pic_detail.html', '1', '0', '1546936496', '1546936496', '4', '1');
INSERT INTO `xpcms_model_copy1` VALUES ('5', 'video', '视频新闻', '列表页 + 详情页', '2', 'xp_cms_article_content_video', 'news_video_list.html', 'news_video_detail.html', '1', '0', '1546936496', '1546936496', '5', '1');
INSERT INTO `xpcms_model_copy1` VALUES ('6', 'course', '在线课程', '频道页 + 列表页 + 详情页 + 详情内列表', '3', 'xp_cms_article_content_course', 'course_list.html', 'course_detail.html', '1', '0', '1546936496', '1546936496', '6', '1');
INSERT INTO `xpcms_model_copy1` VALUES ('7', 'topic', '专题', '列表页 + 详情页', '2', 'xp_cms_article_content_topic', 'topic_list.html', 'topic_detail.html', '1', '0', '1546936496', '1546936496', '7', '0');
INSERT INTO `xpcms_model_copy1` VALUES ('16', 'aaaaaa', '1212', '', '1', 'a', 'a', 'a', '0', '0', '1564366520', '1564366520', '1111', '0');

-- ----------------------------
-- Table structure for xpcms_model_field
-- ----------------------------
DROP TABLE IF EXISTS `xpcms_model_field`;
CREATE TABLE `xpcms_model_field` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `model_id` int(10) unsigned NOT NULL COMMENT '模型ID',
  `table_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '表ID',
  `table_name` varchar(100) NOT NULL COMMENT '表名',
  `field_name` varchar(100) NOT NULL COMMENT '字段名',
  `field_effect` varchar(30) DEFAULT NULL COMMENT '作用',
  `field_type` varchar(20) NOT NULL COMMENT '类型',
  `field_value` varchar(255) DEFAULT NULL COMMENT '参照',
  `field_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COMMENT='后台管理 - - 模型字段';

-- ----------------------------
-- Records of xpcms_model_field
-- ----------------------------

-- ----------------------------
-- Table structure for xpcms_model_field_copy1
-- ----------------------------
DROP TABLE IF EXISTS `xpcms_model_field_copy1`;
CREATE TABLE `xpcms_model_field_copy1` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `model_id` int(10) unsigned NOT NULL COMMENT '模型ID',
  `field_name` varchar(255) NOT NULL COMMENT '名称',
  `field_type` varchar(255) NOT NULL COMMENT '类型',
  `field_length` varchar(255) NOT NULL COMMENT '长度',
  `field_title` varchar(255) NOT NULL COMMENT '标题',
  `field_tips` varchar(255) NOT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='后台管理 - - 模型字段';

-- ----------------------------
-- Records of xpcms_model_field_copy1
-- ----------------------------
INSERT INTO `xpcms_model_field_copy1` VALUES ('1', '4', 'content_image_path', 'upload', '', '图片集', '图片集提示');
INSERT INTO `xpcms_model_field_copy1` VALUES ('2', '4', 'content_image_summary', 'textarea', '', '图片文字说明', '字数不大于255');
INSERT INTO `xpcms_model_field_copy1` VALUES ('3', '4', 'content_image_thumb', 'input', '', '缩略图', '');
INSERT INTO `xpcms_model_field_copy1` VALUES ('4', '4', 'content_image_id', 'hidden', '', '图片集ID', '');
INSERT INTO `xpcms_model_field_copy1` VALUES ('5', '4', 'content_image_dateline', 'int', '', '', '');
INSERT INTO `xpcms_model_field_copy1` VALUES ('6', '4', 'content_image_update', 'int', '', '', '');

-- ----------------------------
-- Table structure for xpcms_model_table
-- ----------------------------
DROP TABLE IF EXISTS `xpcms_model_table`;
CREATE TABLE `xpcms_model_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `model_id` int(10) unsigned NOT NULL COMMENT '模型ID',
  `table_name` varchar(50) NOT NULL COMMENT '表名',
  `table_remark` varchar(50) NOT NULL COMMENT '作用（字段名）',
  `table_sql` varchar(500) NOT NULL COMMENT '数据库语句',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='后台管理 - - 模型下的数据表';

-- ----------------------------
-- Records of xpcms_model_table
-- ----------------------------

-- ----------------------------
-- Table structure for xpcms_nav
-- ----------------------------
DROP TABLE IF EXISTS `xpcms_nav`;
CREATE TABLE `xpcms_nav` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `pid` int(10) NOT NULL DEFAULT '0' COMMENT '导航父ID',
  `title` char(32) NOT NULL DEFAULT '' COMMENT '菜单名称',
  `keywords` varchar(255) NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0= 顶部导航 1= 底部导航 2= 其它导航',
  `is_jump` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0= 站内跳转， 1 =  站外跳转',
  `jump_url` varchar(255) NOT NULL DEFAULT '' COMMENT '导航链接',
  `jump_target` tinyint(1) NOT NULL DEFAULT '0' COMMENT '链接打开方式 0 本页面 1新页面',
  `ord` smallint(5) NOT NULL DEFAULT '0' COMMENT '导航排序',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '菜单数据创建时间',
  `edit_time` int(10) NOT NULL DEFAULT '0' COMMENT '菜单数据修改时间',
  `admin_id` int(10) NOT NULL DEFAULT '0' COMMENT '操作管理员',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '导航状态 0正常 1禁用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xpcms_nav
-- ----------------------------
INSERT INTO `xpcms_nav` VALUES ('1', '0', '科技', 'tech', '1', '1', 'new/category/cid/1', '1', '1', '1546912874', '1548808666', '0', '1');
INSERT INTO `xpcms_nav` VALUES ('2', '0', '军事', 'military', '1', '1', '2', '1', '2', '1546912874', '1546912874', '0', '0');
INSERT INTO `xpcms_nav` VALUES ('3', '0', '图片', 'picture', '1', '1', '3', '1', '3', '1546912874', '1546912874', '0', '0');
INSERT INTO `xpcms_nav` VALUES ('4', '0', '视频', 'video', '1', '1', '4', '1', '4', '1546912874', '1546912874', '0', '0');
INSERT INTO `xpcms_nav` VALUES ('5', '0', '课程', 'course', '1', '1', '5', '1', '5', '1546912874', '1546912874', '0', '1');
INSERT INTO `xpcms_nav` VALUES ('6', '0', '关于本站', '', '2', '2', 'http://www.php.cn', '2', '4', '1546912874', '1546912874', '0', '0');
INSERT INTO `xpcms_nav` VALUES ('7', '0', '加入我们', '', '2', '2', 'http://www.php.cn', '2', '2', '1546912874', '1546912874', '0', '1');
INSERT INTO `xpcms_nav` VALUES ('8', '0', '联系方式', '', '2', '2', 'http://www.php.cn', '2', '3', '1546912874', '1546912874', '0', '0');
INSERT INTO `xpcms_nav` VALUES ('9', '0', '合作伙伴', '', '2', '2', 'http://www.php.cn', '2', '1', '1546912874', '1546912874', '0', '0');
INSERT INTO `xpcms_nav` VALUES ('10', '0', '测试导航I', '', '1', '1', 'http://www.baidu.com', '2', '6', '1546929419', '1546934367', '0', '-2');
INSERT INTO `xpcms_nav` VALUES ('11', '0', '测试导航', '', '2', '1', 'new/category/cid/11', '1', '0', '1546929509', '1565602770', '0', '0');
INSERT INTO `xpcms_nav` VALUES ('12', '0', '111', '2222', '1', '1', '/fdfd/fdfd', '1', '0', '1548809420', '1548809420', '0', '-2');

-- ----------------------------
-- Table structure for xpcms_notes
-- ----------------------------
DROP TABLE IF EXISTS `xpcms_notes`;
CREATE TABLE `xpcms_notes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL COMMENT '笔记标题',
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `cid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '内容id',
  `content` varchar(255) NOT NULL DEFAULT '' COMMENT '内容',
  `edit_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xpcms_notes
-- ----------------------------
INSERT INTO `xpcms_notes` VALUES ('1', '测试笔记', '2', '0', '<p>笔记内容</p><p><img src=\"/storage/static/note/images/qNglEK6qsfPf49SyDkeaHF89BLPnRldmyvdEMr3y.png\" alt=\"images\"><br></p>', '1583596030');
INSERT INTO `xpcms_notes` VALUES ('2', '测试笔记1', '2', '0', '123', '1583596034');
INSERT INTO `xpcms_notes` VALUES ('3', '换个标题测试一下11231232131', '2', '0', '<p>                    换个内容测试一下\n                    </p><p><img src=\"/storage/static/note/images/33ylWPHnxrJh2ZN90FMVwgpcetcY7izMJP4GcOH8.png\" alt=\"images\"><br></p>', '1583644638');
INSERT INTO `xpcms_notes` VALUES ('12', '默认标题', '7', '0', '请输入内容', '1583655815');
INSERT INTO `xpcms_notes` VALUES ('7', '默认标题', '5', '0', '请输入内容', '1583651420');
INSERT INTO `xpcms_notes` VALUES ('8', '测试内容', '5', '0', '<p>                    测试内容</p><p>测试图片</p><p><img src=\"/storage/static/note/images/7nizlnYiUXhRaoUWMdhR2KQP4ajIxAJGXzqfeuuf.png\" alt=\"images\"><br></p>', '1583651458');
INSERT INTO `xpcms_notes` VALUES ('10', '默认标题', '1', '0', '请输入内容', '1583655704');
INSERT INTO `xpcms_notes` VALUES ('11', '默认标题', '6', '0', '请输入内容', '1583655760');
INSERT INTO `xpcms_notes` VALUES ('13', '默认标题', '8', '0', '请输入内容', '1583655851');
INSERT INTO `xpcms_notes` VALUES ('14', '默认标题', '9', '0', '请输入内容', '1583655867');

-- ----------------------------
-- Table structure for xpcms_note_group
-- ----------------------------
DROP TABLE IF EXISTS `xpcms_note_group`;
CREATE TABLE `xpcms_note_group` (
  `gid` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '分类名',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  PRIMARY KEY (`gid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xpcms_note_group
-- ----------------------------
INSERT INTO `xpcms_note_group` VALUES ('1', '默认分类', '2');
INSERT INTO `xpcms_note_group` VALUES ('2', '测试分类', '2');

-- ----------------------------
-- Table structure for xpcms_order
-- ----------------------------
DROP TABLE IF EXISTS `xpcms_order`;
CREATE TABLE `xpcms_order` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL COMMENT '谁买的',
  `order_no` varchar(50) NOT NULL COMMENT '订单号',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单金额',
  `pro_titles` varchar(255) NOT NULL DEFAULT '' COMMENT '商品名称',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '订单状态：0未付款，1已付款',
  `add_time` int(10) NOT NULL COMMENT '下单时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xpcms_order
-- ----------------------------
INSERT INTO `xpcms_order` VALUES ('1', '1', '115750359248242', '99.00', '', '0', '1575035924');
INSERT INTO `xpcms_order` VALUES ('2', '1', '115752945431563', '99.00', '', '0', '1575294543');
INSERT INTO `xpcms_order` VALUES ('3', '1', '115752947521150', '99.00', '', '0', '1575294752');
INSERT INTO `xpcms_order` VALUES ('4', '1', '115753747253299', '99.00', '', '0', '1575374725');
INSERT INTO `xpcms_order` VALUES ('5', '1', '115753751295656', '99.00', '', '0', '1575375129');
INSERT INTO `xpcms_order` VALUES ('6', '1', '115753759029605', '99.00', 'Android Auto负责人解读谷歌战略 改变人车交互体验', '0', '1575375902');
INSERT INTO `xpcms_order` VALUES ('7', '1', '115753760204727', '99.00', 'Android Auto负责人解读谷歌战略 改变人车交互体验', '0', '1575376020');
INSERT INTO `xpcms_order` VALUES ('8', '1', '115753766824793', '99.00', 'Android Auto负责人解读谷歌战略 改变人车交互体验', '0', '1575376682');
INSERT INTO `xpcms_order` VALUES ('9', '2', '20200308204640213078', '99.00', '测试', '0', '1583671600');
INSERT INTO `xpcms_order` VALUES ('10', '2', '20200308204748217729', '12.88', '商品1', '0', '1583671668');
INSERT INTO `xpcms_order` VALUES ('11', '2', '20200308214658211983', '12.88', '商品1', '0', '1583675218');
INSERT INTO `xpcms_order` VALUES ('12', '2', '20200308214712219173', '12.88', '商品1', '0', '1583675232');

-- ----------------------------
-- Table structure for xpcms_order_products
-- ----------------------------
DROP TABLE IF EXISTS `xpcms_order_products`;
CREATE TABLE `xpcms_order_products` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `order_no` varchar(50) NOT NULL COMMENT '订单号',
  `pro_id` int(10) NOT NULL DEFAULT '0' COMMENT '商品id',
  `count` int(10) NOT NULL DEFAULT '0' COMMENT '购买数量',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品价格',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xpcms_order_products
-- ----------------------------
INSERT INTO `xpcms_order_products` VALUES ('1', '115750359248242', '39', '1', '99.00');
INSERT INTO `xpcms_order_products` VALUES ('2', '115752945431563', '39', '1', '99.00');
INSERT INTO `xpcms_order_products` VALUES ('3', '115752947521150', '39', '1', '99.00');
INSERT INTO `xpcms_order_products` VALUES ('4', '115753747253299', '39', '1', '99.00');
INSERT INTO `xpcms_order_products` VALUES ('5', '115753751295656', '39', '1', '99.00');
INSERT INTO `xpcms_order_products` VALUES ('6', '115753759029605', '39', '1', '99.00');
INSERT INTO `xpcms_order_products` VALUES ('7', '115753760204727', '39', '1', '99.00');
INSERT INTO `xpcms_order_products` VALUES ('8', '115753766824793', '39', '1', '99.00');
INSERT INTO `xpcms_order_products` VALUES ('9', '20200308204640213078', '1', '1', '99.00');
INSERT INTO `xpcms_order_products` VALUES ('10', '20200308204748217729', '4', '1', '12.88');
INSERT INTO `xpcms_order_products` VALUES ('11', '20200308214658211983', '4', '1', '12.88');
INSERT INTO `xpcms_order_products` VALUES ('12', '20200308214712219173', '4', '1', '12.88');

-- ----------------------------
-- Table structure for xpcms_plugins
-- ----------------------------
DROP TABLE IF EXISTS `xpcms_plugins`;
CREATE TABLE `xpcms_plugins` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `names` varchar(255) NOT NULL COMMENT '应用名称',
  `path` varchar(255) NOT NULL COMMENT '应用的相对路径（相对于xplugins）',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xpcms_plugins
-- ----------------------------
INSERT INTO `xpcms_plugins` VALUES ('1', 'demo', '');

-- ----------------------------
-- Table structure for xpcms_products
-- ----------------------------
DROP TABLE IF EXISTS `xpcms_products`;
CREATE TABLE `xpcms_products` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `aid` int(10) NOT NULL DEFAULT '0' COMMENT '文章id',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品价格',
  `stock` int(10) NOT NULL DEFAULT '0' COMMENT '库存',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xpcms_products
-- ----------------------------
INSERT INTO `xpcms_products` VALUES ('1', '39', '99.00', '16');

-- ----------------------------
-- Table structure for xpcms_shop
-- ----------------------------
DROP TABLE IF EXISTS `xpcms_shop`;
CREATE TABLE `xpcms_shop` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(60) NOT NULL COMMENT '商品标题',
  `subtitle` varchar(255) NOT NULL DEFAULT '' COMMENT '副标题',
  `cate_id` smallint(5) NOT NULL DEFAULT '0' COMMENT '分类',
  `price` decimal(10,2) NOT NULL COMMENT '商品价格',
  `shop_img` varchar(255) NOT NULL COMMENT '商品图片',
  `seo_title` varchar(255) NOT NULL DEFAULT '' COMMENT 'seo标题',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT 'keywords',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `edit_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '操作管理员名称',
  `status` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '状态 0开启 1关闭',
  `count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '库存数量',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xpcms_shop
-- ----------------------------
INSERT INTO `xpcms_shop` VALUES ('1', '测试', '测试', '1', '99.00', '/storage/static/shop/images/BMYw5MZV6IsKtrSV0tLT7BgRCT7jUOU8pccrWU7h.png', '测试', '测试', '0', '1583416628', '1', '0', '9');
INSERT INTO `xpcms_shop` VALUES ('4', '商品1', '', '2', '12.88', '/storage/static/shop/images/kpDcUzhYFxne7GycgARIZiKSVw2NOEnf5njIEXzx.png', '', '', '1583068826', '1583671660', '0', '0', '97');

-- ----------------------------
-- Table structure for xpcms_shop_category
-- ----------------------------
DROP TABLE IF EXISTS `xpcms_shop_category`;
CREATE TABLE `xpcms_shop_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(50) NOT NULL COMMENT '商品分类标题',
  `url` varchar(255) NOT NULL DEFAULT '',
  `pid` int(10) NOT NULL DEFAULT '0' COMMENT '父级',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xpcms_shop_category
-- ----------------------------
INSERT INTO `xpcms_shop_category` VALUES ('1', '男装', '', '0');
INSERT INTO `xpcms_shop_category` VALUES ('2', '女装', '', '0');
INSERT INTO `xpcms_shop_category` VALUES ('3', '男T恤', '', '1');
INSERT INTO `xpcms_shop_category` VALUES ('4', '女T恤', '', '2');
INSERT INTO `xpcms_shop_category` VALUES ('5', '男长裤', '', '1');
INSERT INTO `xpcms_shop_category` VALUES ('6', '男帽子', '', '1');

-- ----------------------------
-- Table structure for xpcms_shop_content
-- ----------------------------
DROP TABLE IF EXISTS `xpcms_shop_content`;
CREATE TABLE `xpcms_shop_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` int(10) unsigned NOT NULL COMMENT '商品id',
  `content` varchar(255) NOT NULL DEFAULT '' COMMENT '商品详情页',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xpcms_shop_content
-- ----------------------------
INSERT INTO `xpcms_shop_content` VALUES ('1', '1', '<div style=\"text-align: center;\"><b>测试内容</b></div><div style=\"text-align: center;\"><b><img src=\"http://laravel.com/storage/static/shop/images/oDoe7fMCqpuENDxymbhmLGP4OPjkScpjvZfdG0R5.png\" alt=\"images\" width=\"100\" height=\"100\"><br></b></div>');
INSERT INTO `xpcms_shop_content` VALUES ('2', '4', '1231231231手动阀手动阀');

-- ----------------------------
-- Table structure for xpcms_source
-- ----------------------------
DROP TABLE IF EXISTS `xpcms_source`;
CREATE TABLE `xpcms_source` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL COMMENT '来源地址',
  `descs` varchar(255) NOT NULL COMMENT '来源摘要',
  `add_time` int(10) NOT NULL DEFAULT '1' COMMENT '来源添加时间',
  `admin_id` int(10) NOT NULL COMMENT '操作管理员',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态：0正常，1禁用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='新闻来源管理表';

-- ----------------------------
-- Records of xpcms_source
-- ----------------------------

-- ----------------------------
-- Table structure for xpcms_sys_setting
-- ----------------------------
DROP TABLE IF EXISTS `xpcms_sys_setting`;
CREATE TABLE `xpcms_sys_setting` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `keys` varchar(255) NOT NULL DEFAULT '',
  `values` text NOT NULL,
  PRIMARY KEY (`id`,`keys`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xpcms_sys_setting
-- ----------------------------
INSERT INTO `xpcms_sys_setting` VALUES ('2', 'set_security', '{\"login_faild\":\"3\",\"visit_time\":\"60\",\"sys_domain\":\"www.php.cn\",\"log_size\":\"6\",\"use_log\":\"1\"}');
INSERT INTO `xpcms_sys_setting` VALUES ('4', 'site_wechat', '{\"AppID\":\"8858\",\"AppSecret\":\"123456123\",\"Token\":\"\\u5854\\u9876f\",\"EncodingAESKey\":\"fsadfsfsadfasfasdf\",\"url\":\"fsadfsafasdf\"}');
INSERT INTO `xpcms_sys_setting` VALUES ('3', 'site_basic', '{\"site_title\":\"JCCMS\\u7b14\\u8bb0\",\"site_logo\":\"\\/storage\\/static\\/images\\/WVTZmYqCHtAFhlx0eweznqKhxIZDvmcZVc6e0NL0.png\",\"site_domain\":\"www.php.cn\",\"site_status\":\"1\",\"adminer_email\":null,\"annex_status\":\"1\"}');
INSERT INTO `xpcms_sys_setting` VALUES ('5', 'site_annex', '{\"upload_size\":\"1024\",\"upload_type\":[\".jpg\",\".png\",\".gif\"],\"is_watermark\":\"1\",\"watermark_width\":\"1024\",\"watermark_height\":\"1024\",\"watermark_url\":\"1024\",\"watermark_transparent\":\"1\",\"watermark_quality\":\"1\",\"watermark_position\":\"5\"}');
INSERT INTO `xpcms_sys_setting` VALUES ('8', 'site_user', '{\"is_reg\":\"1\",\"is_email\":\"1\",\"is_verify\":\"1\",\"is_phone\":\"1\",\"is_reg_verify\":\"0\",\"is_agreement\":\"1\",\"user_agreements\":\"111\",\"email_content\":\"222\",\"pwd_content\":\"333\"}');
INSERT INTO `xpcms_sys_setting` VALUES ('18', 'site_sms', '{\"bbbbbbbbb\":\"222222222\",\"cccccccc\":\"33333333\",\"aaaaaaa\":\"111111111\"}');
INSERT INTO `xpcms_sys_setting` VALUES ('13', 'site_email', '{\"send_type\":\"1\",\"server_address\":\"smtp.163.com\",\"port\":\"465\",\"from_address\":\"15626475734@163.com\",\"auth_check\":\"1\",\"check_user\":\"15626475734@163.com\",\"check_pwd\":\"An0754789\",\"encryption\":\"2\",\"name\":\"JCCMS\",\"subject\":\"\\u6d4b\\u8bd5\",\"content\":\"\\u6d4b\\u8bd5001\",\"to\":\"76050503@qq.com\"}');
INSERT INTO `xpcms_sys_setting` VALUES ('19', 'site_seo', '{\"title\":\"JCCMS\\u7cfb\\u7edf\",\"keywords\":\"JCCMS\\u7cfb\\u7edf\",\"descs\":\"\\u4f5c\\u8005\\uff1a\\u6d2a\\u5409\\u6f6e\"}');

-- ----------------------------
-- Table structure for xpcms_sys_setting_bak
-- ----------------------------
DROP TABLE IF EXISTS `xpcms_sys_setting_bak`;
CREATE TABLE `xpcms_sys_setting_bak` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `keys` varchar(255) NOT NULL DEFAULT '',
  `group_id` smallint(5) NOT NULL,
  `group_name` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`,`keys`)
) ENGINE=MyISAM AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xpcms_sys_setting_bak
-- ----------------------------
INSERT INTO `xpcms_sys_setting_bak` VALUES ('1', 'site_title', '1', 'setBaseDetail', '网站名称', 'XP-CMS1.1演示站');
INSERT INTO `xpcms_sys_setting_bak` VALUES ('2', 'site_domain', '1', 'setBaseDetail', '网站域名', 'http://demo.xpcms.cn');
INSERT INTO `xpcms_sys_setting_bak` VALUES ('3', 'site_icp', '1', 'setBaseDetail', '网站备案号', '皖备12345679');
INSERT INTO `xpcms_sys_setting_bak` VALUES ('4', 'site_admin_email', '1', 'setBaseDetail', '管理员邮箱', 'webmaster@xpcms1.php.cn');
INSERT INTO `xpcms_sys_setting_bak` VALUES ('5', 'site_syn_levels', '1', 'setBaseDetail', '异步显示栏目层级', '3');
INSERT INTO `xpcms_sys_setting_bak` VALUES ('6', 'site_account_static', '1', 'setBaseDetail', '开户附件状态统计', '-1');
INSERT INTO `xpcms_sys_setting_bak` VALUES ('7', 'site_path_js', '1', 'setBaseDetail', 'JS路径', './data/static/js/');
INSERT INTO `xpcms_sys_setting_bak` VALUES ('8', 'site_path_css', '1', 'setBaseDetail', 'CSS路径', './data/static/css/');
INSERT INTO `xpcms_sys_setting_bak` VALUES ('9', 'site_path_img', '1', 'setBaseDetail', '图片路径', './data/upload/images/');
INSERT INTO `xpcms_sys_setting_bak` VALUES ('10', 'site_path_ext', '1', 'setBaseDetail', '附件URL路径', './data/upload/file/');
INSERT INTO `xpcms_sys_setting_bak` VALUES ('11', 'site_statcode', '1', 'setBaseDetail', '统计代码', 'https://statistic.baidu.com/stat.js');
INSERT INTO `xpcms_sys_setting_bak` VALUES ('12', 'site_isClose', '1', 'setBaseDetail', '是否关站', '-1');
INSERT INTO `xpcms_sys_setting_bak` VALUES ('13', 'site_close_reasion', '1', 'setBaseDetail', '关站原因', '系统维护中...');
INSERT INTO `xpcms_sys_setting_bak` VALUES ('14', 'seo_site_title', '2', 'setSeoDetail', 'SEO标题', '- XP-CMS1.1.0 演示站');
INSERT INTO `xpcms_sys_setting_bak` VALUES ('15', 'seo_site_keywords', '2', 'setSeoDetail', 'SEO关键词', 'XPCMS,CMS,XPPHP,小皮科技');
INSERT INTO `xpcms_sys_setting_bak` VALUES ('16', 'seo_site_description', '2', 'setSeoDetail', 'SEO描述', '小皮CMS1.0是一个自主研发的CMS');
INSERT INTO `xpcms_sys_setting_bak` VALUES ('17', 'Security_islog_admin', '3', 'setSecurityDetail', '启用后台操作日志', '1');
INSERT INTO `xpcms_sys_setting_bak` VALUES ('18', 'Security_issavelog_admin', '3', 'setSecurityDetail', '保存错误日志', '1');
INSERT INTO `xpcms_sys_setting_bak` VALUES ('19', 'Security_logfile_warn', '3', 'setSecurityDetail', '错误日志预警大小', '100');
INSERT INTO `xpcms_sys_setting_bak` VALUES ('20', 'Security_login_maxerr', '3', 'setSecurityDetail', '后台最大登录失败次数', '6');
INSERT INTO `xpcms_sys_setting_bak` VALUES ('21', 'Security_reflush_period', '3', 'setSecurityDetail', '连续两次刷新 最短间隔', '120');
INSERT INTO `xpcms_sys_setting_bak` VALUES ('22', 'Security_admin_domain', '3', 'setSecurityDetail', '后台访问域名', 'mg.xpcms.net');
INSERT INTO `xpcms_sys_setting_bak` VALUES ('23', 'set_send_mail_method', '4', 'setEmailDetail', '邮件发送模式', '1');
INSERT INTO `xpcms_sys_setting_bak` VALUES ('24', 'set_send_mail_server', '4', 'setEmailDetail', '邮件服务器', '127.0.0.1');
INSERT INTO `xpcms_sys_setting_bak` VALUES ('25', 'set_send_mail_port', '4', 'setEmailDetail', '邮件发送端口', '25');
INSERT INTO `xpcms_sys_setting_bak` VALUES ('26', 'set_send_mail_from', '4', 'setEmailDetail', '发件人地址', 'webmaster@xpcms.cn');
INSERT INTO `xpcms_sys_setting_bak` VALUES ('27', 'set_send_mail_auth_login', '4', 'setEmailDetail', 'AUTH LOIN验证', '-1');
INSERT INTO `xpcms_sys_setting_bak` VALUES ('28', 'set_send_mail_username', '4', 'setEmailDetail', '验证用户名', 'user_098');
INSERT INTO `xpcms_sys_setting_bak` VALUES ('29', 'set_send_mail_password', '4', 'setEmailDetail', '验证密码', '1567890');
INSERT INTO `xpcms_sys_setting_bak` VALUES ('30', 'set_send_mail_test_address', '4', 'setEmailDetail', '邮件设置测试', '1');
INSERT INTO `xpcms_sys_setting_bak` VALUES ('31', 'set_send_mail_test_send', '4', 'setEmailDetail', '发送测试', '1');
INSERT INTO `xpcms_sys_setting_bak` VALUES ('32', 'oauth_weixin_isopen', '5', 'setOauthDetail', '开启微信登录', '1');
INSERT INTO `xpcms_sys_setting_bak` VALUES ('33', 'oauth_weixin_app_key', '5', 'setOauthDetail', '微信 APP_Key', '183924893783243');
INSERT INTO `xpcms_sys_setting_bak` VALUES ('34', 'oauth_weixin_app_secret', '5', 'setOauthDetail', '微信 APP_secret', 'HB99AF4A23E870F19765B');
INSERT INTO `xpcms_sys_setting_bak` VALUES ('35', 'oauth_qq_isopen', '5', 'setOauthDetail', '开启QQ登录', '1');
INSERT INTO `xpcms_sys_setting_bak` VALUES ('36', 'oauth_qq_app_key', '5', 'setOauthDetail', 'QQ APP_Key', '266524893783243');
INSERT INTO `xpcms_sys_setting_bak` VALUES ('37', 'oauth_qq_app_secret', '5', 'setOauthDetail', 'QQ APP_secret', 'aF4A23E870F19765B26A96');
INSERT INTO `xpcms_sys_setting_bak` VALUES ('38', 'oauth_weibo_isopen', '5', 'setOauthDetail', '开启微博登录', '1');
INSERT INTO `xpcms_sys_setting_bak` VALUES ('39', 'oauth_weibo_app_key', '5', 'setOauthDetail', '新浪微博 APP_Key', '3839248555783243');
INSERT INTO `xpcms_sys_setting_bak` VALUES ('40', 'oauth_weibo_app_secret', '5', 'setOauthDetail', '新浪微博 APP_secret', 'tjM5us46feM315cpmfQ9hAWfX8rE');
INSERT INTO `xpcms_sys_setting_bak` VALUES ('41', 'set_ext_allow_file_size', '6', 'setExtDetail', '允许上传附件大小', '1024');
INSERT INTO `xpcms_sys_setting_bak` VALUES ('42', 'set_ext_allow_file_type', '6', 'setExtDetail', '允许上传类型', 'png|jpg|gif|xls');
INSERT INTO `xpcms_sys_setting_bak` VALUES ('43', 'set_ext_gd_check', '6', 'setExtDetail', 'GD库检测', '1');
INSERT INTO `xpcms_sys_setting_bak` VALUES ('44', 'set_ext_iswatermark', '6', 'setExtDetail', '是否开启图片水印', '-1');
INSERT INTO `xpcms_sys_setting_bak` VALUES ('45', 'set_ext_size_wk_width', '6', 'setExtDetail', '水印尺寸_宽', '100');
INSERT INTO `xpcms_sys_setting_bak` VALUES ('46', 'set_ext_size_wk_high', '6', 'setExtDetail', '水印尺寸_高', '100');
INSERT INTO `xpcms_sys_setting_bak` VALUES ('47', 'set_ext_watermark_url', '6', 'setExtDetail', '水印图片地址', './data/upload/watermaker/xpcms_2018_wm.png');
INSERT INTO `xpcms_sys_setting_bak` VALUES ('48', 'set_ext_watermark_alpha', '6', 'setExtDetail', '水印透明度', '36');
INSERT INTO `xpcms_sys_setting_bak` VALUES ('49', 'set_ext_watermark_quality', '6', 'setExtDetail', 'JPEG水印质量', '4');
INSERT INTO `xpcms_sys_setting_bak` VALUES ('50', 'set_ext_watermark_position', '6', 'setExtDetail', '水印位置', '4');
INSERT INTO `xpcms_sys_setting_bak` VALUES ('51', 'set_ext_remote_allow', '6', 'setExtDetail', '允许远程附件', '1');
INSERT INTO `xpcms_sys_setting_bak` VALUES ('52', 'set_ext_remote_ip', '6', 'setExtDetail', '远程附件IP', '45.67.67.245');
INSERT INTO `xpcms_sys_setting_bak` VALUES ('53', 'set_ext_remote_port', '6', 'setExtDetail', '远程附件端口', '26');
INSERT INTO `xpcms_sys_setting_bak` VALUES ('54', 'set_ext_remote_username', '6', 'setExtDetail', '远程附件用户名', 'user_0567');
INSERT INTO `xpcms_sys_setting_bak` VALUES ('55', 'set_ext_remote_password', '6', 'setExtDetail', '远程附件密码', '8907r');
INSERT INTO `xpcms_sys_setting_bak` VALUES ('56', 'set_ext_remote_url_base', '6', 'setExtDetail', '远程附件访问URL', 'http://img.xpcms.net/upload/');
INSERT INTO `xpcms_sys_setting_bak` VALUES ('57', 'Security_admin_domain_is', '3', 'setSecurityDetail', '开启后台访问域名', '-1');
INSERT INTO `xpcms_sys_setting_bak` VALUES ('58', 'set_ext_isupload', '6', 'setExtDetail', '是否允许上传附件', '1');
INSERT INTO `xpcms_sys_setting_bak` VALUES ('59', 'set_user_allow_reg', '7', 'setUserSetting', '允许用户注册', '1');
INSERT INTO `xpcms_sys_setting_bak` VALUES ('60', 'set_user_allow_display_agreement', '7', 'setUserSetting', '显示注册协议', '1');
INSERT INTO `xpcms_sys_setting_bak` VALUES ('61', 'set_user_reg_agreement', '7', 'setUserSetting', '用户注册协议', '欢迎注册{site_title}\r\n\r\n1、本站会员必须遵守《{site_title}第一基本法规》。\r\n2、本站会员不得违反《国家互联网电子公告服务管理规定》。\r\n3、本站会员不得在本站发表任何违反国家法律法规的言论。\r\n4、注册会员必须接受{site_title}管理团队的管理。\r\n\r\n仔细阅读以上内容，完全接受并遵守论坛守则各项条款。按同意才能进行下一步。');
INSERT INTO `xpcms_sys_setting_bak` VALUES ('62', 'set_user_reg_check', '7', 'setUserSetting', '注册是否要审核', '-1');
INSERT INTO `xpcms_sys_setting_bak` VALUES ('63', 'set_user_allow_login', '7', 'setUserSetting', '允许用户登录', '1');
INSERT INTO `xpcms_sys_setting_bak` VALUES ('64', 'set_user_allow_login_vcode', '7', 'setUserSetting', '图形验证码', '1');
INSERT INTO `xpcms_sys_setting_bak` VALUES ('65', 'set_user_sms_check', '7', 'setUserSetting', '短信验证码', '-1');
INSERT INTO `xpcms_sys_setting_bak` VALUES ('66', 'set_user_allow_email_check', '7', 'setUserSetting', '开启邮箱验证', '-1');
INSERT INTO `xpcms_sys_setting_bak` VALUES ('67', 'set_user_email_auth_content', '7', 'setUserSetting', '注册认证内容', '亲爱的 {user_name} 感谢您注册 {site_title} 账号！<br /> \r\n<br /> \r\n请点击:<br /> \r\n<br /> \r\n<div style=\"width:150px;height:45px;background:#01814A;color:#fff;font-size:16px;text-align:center;line-height:45px;border-radius:5px\" onclick=\"location.href=\'{site_register_activation_url} \'\">激活认证</div><br /> \r\n<br /> \r\n或者复制 {site_register_activation_url} 链接完成激活。 <br /> \r\n<br /> \r\n如果您没有在 {site_title} 注册过，你可以安全地忽略本邮件。<br />  \r\n<br /> \r\n{site_title}<br /> \r\n{site_domain}<br /> ');
INSERT INTO `xpcms_sys_setting_bak` VALUES ('68', 'set_user_email_pwdback_content', '7', 'setUserSetting', '密码找回内容', '亲爱的 {user_name} 用户：<br /> \r\n<br /> \r\n请点击:<br /> \r\n<br /> \r\n<div style=\"width:150px;height:45px;background:#EA7500;color:#fff;font-size:16px;text-align:center;line-height:45px;border-radius:5px\" onclick=\"location.href=\'{site_edit_password_url} \'\">更改密码</div><br /> \r\n<br /> \r\n或者复制 {site_edit_password_url} 链接修改您的登录密码。 <br /> \r\n<br /> \r\n如果您不是您本人请求修改密码，你可以安全地忽略本邮件。<br />  \r\n<br /> \r\n{site_title}<br /> \r\n{site_domain}<br /> ');
INSERT INTO `xpcms_sys_setting_bak` VALUES ('69', 'site_logo', '1', 'setBaseDetail', '网站LOGO', '');
INSERT INTO `xpcms_sys_setting_bak` VALUES ('70', 'set_user_sms_check_type[1]', '7', 'setUserSetting', '验证码类型', 'true');
INSERT INTO `xpcms_sys_setting_bak` VALUES ('71', 'set_user_email_pwdback_title', '7', 'setUserSetting', '密码找回标题', '密码找回 - {site_title}');
INSERT INTO `xpcms_sys_setting_bak` VALUES ('72', 'set_user_email_auth_title', '7', 'setUserSetting', '注册认证标题', '注册激活验证 - {site_title}');

-- ----------------------------
-- Table structure for xpcms_token_admin
-- ----------------------------
DROP TABLE IF EXISTS `xpcms_token_admin`;
CREATE TABLE `xpcms_token_admin` (
  `admin_id` smallint(5) NOT NULL,
  `token_admin` char(32) NOT NULL,
  `token_date_Invalid` int(10) NOT NULL COMMENT 'Token 失效时间',
  `token_date_update` int(10) NOT NULL COMMENT 'Token 更新时间',
  PRIMARY KEY (`admin_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='用户登录Token';

-- ----------------------------
-- Records of xpcms_token_admin
-- ----------------------------

-- ----------------------------
-- Table structure for xpcms_token_user
-- ----------------------------
DROP TABLE IF EXISTS `xpcms_token_user`;
CREATE TABLE `xpcms_token_user` (
  `user_id` smallint(5) NOT NULL,
  `token_user` char(32) NOT NULL,
  `token_date_Invalid` int(10) NOT NULL COMMENT 'Token 失效时间',
  `token_date_update` int(10) NOT NULL COMMENT 'Token 更新时间',
  PRIMARY KEY (`user_id`,`token_user`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='用户登录Token';

-- ----------------------------
-- Records of xpcms_token_user
-- ----------------------------

-- ----------------------------
-- Table structure for xpcms_urlrules
-- ----------------------------
DROP TABLE IF EXISTS `xpcms_urlrules`;
CREATE TABLE `xpcms_urlrules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则ID',
  `title` varchar(30) NOT NULL COMMENT '规则标识',
  `pattens` varchar(255) NOT NULL COMMENT '匹配规则',
  `to_pattens` varchar(255) NOT NULL COMMENT '替换规则',
  `patten_example` varchar(255) NOT NULL COMMENT '规则例子',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xpcms_urlrules
-- ----------------------------
INSERT INTO `xpcms_urlrules` VALUES ('1', 'content', 'category', '1', 'news/china/1000.html');
INSERT INTO `xpcms_urlrules` VALUES ('6', 'content', 'category', '0', 'index.php?m=content&c=index&a=lists&catid=1&page=1');
INSERT INTO `xpcms_urlrules` VALUES ('11', 'content', 'show', '1', '2010/catdir_0720/1_2.html');
INSERT INTO `xpcms_urlrules` VALUES ('12', 'content', 'show', '1', 'it/product/2010/0720/1_2.html');
INSERT INTO `xpcms_urlrules` VALUES ('16', 'content', 'show', '0', 'index.php?m=content&c=index&a=show&catid=1&id=1');
INSERT INTO `xpcms_urlrules` VALUES ('17', 'content', 'show', '0', 'show-1-2-1.html');
INSERT INTO `xpcms_urlrules` VALUES ('18', 'content', 'show', 'asfdasdfs', 'content-1-2-1.html');
INSERT INTO `xpcms_urlrules` VALUES ('30', 'content', 'category', '0', 'list-1-1.html');

-- ----------------------------
-- Table structure for xpcms_user
-- ----------------------------
DROP TABLE IF EXISTS `xpcms_user`;
CREATE TABLE `xpcms_user` (
  `uid` int(10) NOT NULL AUTO_INCREMENT,
  `group_id` int(10) NOT NULL COMMENT '用户组',
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `pwd` char(32) NOT NULL,
  `phone` char(11) NOT NULL,
  `openid` varchar(128) NOT NULL COMMENT '微信openid',
  `unionid` varchar(128) NOT NULL,
  `email` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态 0正常使用 1禁用',
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xpcms_user
-- ----------------------------
INSERT INTO `xpcms_user` VALUES ('1', '1', 'myadmin', '', '', '', '', '', '0');
INSERT INTO `xpcms_user` VALUES ('2', '1', 'dioakasdf', '', '', '', '', '', '0');
INSERT INTO `xpcms_user` VALUES ('3', '2', 'asdf', '', '', '', '', '', '0');
INSERT INTO `xpcms_user` VALUES ('4', '2', '9843udfsg', '', '', '', '', '', '0');
INSERT INTO `xpcms_user` VALUES ('5', '2', '3874dw87542', '', '', '', '', '', '0');
INSERT INTO `xpcms_user` VALUES ('6', '3', 'asdf823453fajkfgs', '', '', '', '', '', '0');
INSERT INTO `xpcms_user` VALUES ('7', '3', '4695er', '', '', '', '', '', '0');

-- ----------------------------
-- Table structure for xpcms_user_audi_reason
-- ----------------------------
DROP TABLE IF EXISTS `xpcms_user_audi_reason`;
CREATE TABLE `xpcms_user_audi_reason` (
  `audi_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL DEFAULT '0' COMMENT '登录用户ID',
  `audi_no_dateline` int(10) NOT NULL DEFAULT '0',
  `admin_name` varchar(255) DEFAULT NULL,
  `audi_no_reason` text COMMENT '审核不通过原因',
  PRIMARY KEY (`audi_id`),
  KEY `audi_reason` (`user_id`,`audi_no_dateline`) USING HASH
) ENGINE=MyISAM AUTO_INCREMENT=108 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xpcms_user_audi_reason
-- ----------------------------
INSERT INTO `xpcms_user_audi_reason` VALUES ('106', '2', '1545728060', 'admin', '用户名不合法');
INSERT INTO `xpcms_user_audi_reason` VALUES ('107', '2', '1545828060', 'admin', '昵称不合法');

-- ----------------------------
-- Table structure for xpcms_user_group
-- ----------------------------
DROP TABLE IF EXISTS `xpcms_user_group`;
CREATE TABLE `xpcms_user_group` (
  `gid` int(10) NOT NULL AUTO_INCREMENT COMMENT '用户组ID',
  `title` char(32) NOT NULL COMMENT '会员分组名称',
  `add_time` int(10) NOT NULL DEFAULT '1' COMMENT '会员分组创建时间',
  `edit_time` int(10) NOT NULL DEFAULT '1' COMMENT '会员分组更新时间',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户分组 0自定义组 1系统组 2系统辅助管理组',
  `points` int(10) NOT NULL DEFAULT '0' COMMENT '积分(大于该积分则是下一个级别)',
  `user_counts` int(10) NOT NULL DEFAULT '0' COMMENT '成员数',
  `allow_upload` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否允许上传附件 0允许 1 禁止',
  `allow_search` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许搜索，1不允许，0允许',
  `auto_upgrade` tinyint(1) NOT NULL DEFAULT '0' COMMENT '自动升级，0否，1是',
  `allow_type` varchar(255) NOT NULL DEFAULT '' COMMENT '允许上传附件类型（空表示不允许）',
  `allow_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '允许上传附件文件上限 KB',
  `allow_pub` tinyint(1) NOT NULL DEFAULT '-1' COMMENT '是否允许投稿 0允许 1 不允许',
  `pub_need_audi` tinyint(1) NOT NULL DEFAULT '0' COMMENT '投稿是否审核 1 必须 0不需',
  `allow_comment` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许评论 0允许 1禁止',
  PRIMARY KEY (`gid`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='用户分组';

-- ----------------------------
-- Records of xpcms_user_group
-- ----------------------------
INSERT INTO `xpcms_user_group` VALUES ('1', '新手上路', '1', '1', '1', '12', '102', '1', '0', '0', '', '1024', '1', '1', '1');
INSERT INTO `xpcms_user_group` VALUES ('2', '普通用户', '1', '1', '1', '101', '0', '1', '0', '0', '', '0', '1', '1', '1');
INSERT INTO `xpcms_user_group` VALUES ('3', '中级用户', '1', '1', '1', '1001', '0', '1', '0', '0', '', '0', '1', '1', '1');
INSERT INTO `xpcms_user_group` VALUES ('4', '高级用户', '1', '1', '1', '10001', '0', '1', '0', '0', '', '0', '1', '1', '1');
INSERT INTO `xpcms_user_group` VALUES ('5', '游客', '1', '1', '3', '0', '0', '-1', '0', '0', '', '0', '-1', '1', '-1');
INSERT INTO `xpcms_user_group` VALUES ('6', '禁言', '1', '1', '3', '0', '0', '1', '0', '0', '', '0', '-1', '1', '-1');
INSERT INTO `xpcms_user_group` VALUES ('8', '测试组', '1', '1', '1', '200000', '0', '1', '0', '0', 'jpg|png|xls', '4069', '1', '1', '1');
INSERT INTO `xpcms_user_group` VALUES ('9', '测试组II', '1', '1', '1', '100000', '0', '1', '0', '0', 'jpg|png|gif', '10240', '1', '1', '1');
INSERT INTO `xpcms_user_group` VALUES ('10', '不知名用户组', '1', '1', '1', '0', '0', '-1', '0', '0', '', '0', '-1', '-1', '-1');
INSERT INTO `xpcms_user_group` VALUES ('11', '禁止登录', '1', '1', '3', '0', '0', '1', '0', '0', '', '0', '1', '-1', '1');

-- ----------------------------
-- Table structure for xpcms_user_oauth
-- ----------------------------
DROP TABLE IF EXISTS `xpcms_user_oauth`;
CREATE TABLE `xpcms_user_oauth` (
  `oauth_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL COMMENT '用户ID',
  `type` smallint(3) NOT NULL DEFAULT '1' COMMENT '联合登录方式  1 微信 2 QQ 3 微博  4 微博 5..',
  `param_1` varchar(255) NOT NULL COMMENT '联合登录定义参数1 如存放  openid',
  `param_2` varchar(255) NOT NULL COMMENT '联合登录定义参数2',
  `param_3` varchar(255) NOT NULL COMMENT '联合登录定义参数3',
  `param_4` varchar(255) NOT NULL COMMENT '联合登录定义参数4',
  `param_5` varchar(255) NOT NULL COMMENT '联合登录定义参数5',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0正常，1禁用',
  PRIMARY KEY (`oauth_id`),
  KEY `oauth` (`user_id`,`type`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户第三方平台登录凭证';

-- ----------------------------
-- Records of xpcms_user_oauth
-- ----------------------------

-- ----------------------------
-- Table structure for xpcms_user_profile
-- ----------------------------
DROP TABLE IF EXISTS `xpcms_user_profile`;
CREATE TABLE `xpcms_user_profile` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL COMMENT '登录用户ID',
  `nickname` varchar(32) NOT NULL COMMENT '用户昵称',
  `realname` varchar(64) NOT NULL COMMENT '用户真名',
  `avatar` varchar(255) NOT NULL COMMENT '头像',
  `gender` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别：0未知，1男，2女',
  `birthday` int(10) NOT NULL COMMENT '生日',
  `addr` varchar(255) NOT NULL COMMENT '用户联系地址',
  `zipcode` varchar(10) NOT NULL COMMENT '邮编',
  `province` int(6) NOT NULL,
  `city` int(6) NOT NULL,
  `area` int(6) NOT NULL COMMENT '用户所在区',
  `community` varchar(255) NOT NULL COMMENT '街道',
  `add_time` int(10) NOT NULL DEFAULT '0' COMMENT '用户注册时间',
  `last_login` int(10) NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `last_ip` varchar(16) NOT NULL COMMENT '最后登录IP',
  `edit_time` int(10) NOT NULL DEFAULT '0' COMMENT '用户资料修改时间',
  `points` int(11) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `qq` varchar(20) NOT NULL COMMENT 'qq号码',
  `weibo` varchar(255) NOT NULL COMMENT '微博',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=211 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xpcms_user_profile
-- ----------------------------
INSERT INTO `xpcms_user_profile` VALUES ('106', '1', '小皮PHP', '赵小皮', '', '0', '0', '', '', '0', '0', '0', '', '1542281727', '1542281737', '47.92.199.64', '1542281727', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('107', '2', '悦悦', '钱悦悦', '', '0', '0', '', '', '0', '0', '0', '', '1546440348', '1546440368', '47.92.199.64', '1546440348', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('108', '3', '昭昭', '孙昭昭', '', '0', '0', '', '', '0', '0', '0', '', '1546440348', '1546440378', '47.92.199.64', '1546440348', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('109', '4', '冰冰', '李冰冰', '', '0', '0', '', '', '0', '0', '0', '', '1546440348', '1546440388', '47.92.199.64', '1546440348', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('110', '5', '爽爽', '周爽爽', '', '0', '0', '', '', '0', '0', '0', '', '1546440348', '1546440398', '47.92.199.64', '1546440348', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('111', '6', '琬琬', '吴琬琬', '', '0', '0', '', '', '0', '0', '0', '', '1546440348', '1546440408', '47.92.199.64', '1546440348', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('112', '7', '茗茗1', '郑茗茗', '', '2', '0', '', '', '0', '0', '0', '', '1546440348', '1546440418', '47.92.199.64', '1546440348', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('113', '8', '羽羽', '王羽羽', '', '0', '0', '', '', '0', '0', '0', '', '1546440348', '1546440428', '47.92.199.64', '1546440348', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('114', '9', '希希', '冯希希', '', '0', '0', '', '', '0', '0', '0', '', '1546440348', '1546440438', '47.92.199.64', '1546440348', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('115', '10', '宁宁', '陈宁宁', '', '0', '0', '', '', '0', '0', '0', '', '1546440348', '1546440448', '47.92.199.64', '1546440348', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('116', '11', '萱萱', '张萱萱', '', '0', '0', '', '', '0', '0', '0', '', '1546440348', '1546440458', '47.92.199.64', '1546440348', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('117', '12', '昊昊', '黄昊昊', '', '0', '0', '', '', '0', '0', '0', '', '1546440348', '1546440468', '47.92.199.64', '1546440348', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('118', '13', '芸芸', '赵芸芸', '', '0', '0', '', '', '0', '0', '0', '', '1546440348', '1546440478', '47.92.199.64', '1546440348', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('119', '14', '天天', '钱天天', '', '0', '0', '', '', '0', '0', '0', '', '1546440348', '1546440488', '47.92.199.64', '1546440348', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('120', '15', '岚岚', '孙岚岚', '', '0', '0', '', '', '0', '0', '0', '', '1546440348', '1546440498', '47.92.199.64', '1546440348', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('121', '16', '乾乾', '李乾乾', '', '0', '0', '', '', '0', '0', '0', '', '1546440348', '1546440508', '47.92.199.64', '1546440348', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('122', '17', '亦亦', '周亦亦', '', '0', '0', '', '', '0', '0', '0', '', '1546440348', '1546440518', '47.92.199.64', '1546440348', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('123', '18', '雅雅', '吴雅雅', '', '0', '0', '', '', '0', '0', '0', '', '1546440348', '1546440528', '47.92.199.64', '1546440348', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('124', '19', '芝芝', '郑芝芝', '', '0', '0', '', '', '0', '0', '0', '', '1546440348', '1546440538', '47.92.199.64', '1546440348', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('125', '20', '烨烨', '王烨烨', '', '0', '0', '', '', '0', '0', '0', '', '1546440348', '1546440548', '47.92.199.64', '1546440348', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('126', '21', '欣欣', '冯欣欣', '', '0', '0', '', '', '0', '0', '0', '', '1546440348', '1546440558', '47.92.199.64', '1546440348', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('127', '22', '飘飘', '程飘飘', '', '0', '0', '', '', '0', '0', '0', '', '1546440348', '1546440568', '47.92.199.64', '1546440348', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('128', '23', '育育', '张育育', '', '0', '0', '', '', '0', '0', '0', '', '1546440348', '1546440578', '47.92.199.64', '1546440348', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('129', '24', '涵涵', '黄涵涵', '', '0', '0', '', '', '0', '0', '0', '', '1546440348', '1546440588', '47.92.199.64', '1546440348', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('130', '25', '小提琴', '王小琴', '', '0', '0', '', '', '0', '0', '0', '', '1546440348', '1546440348', '47.92.199.64', '1547175907', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('131', '26', '晴晴', '钱晴晴', '', '0', '0', '', '', '0', '0', '0', '', '1546440348', '1546440348', '47.92.199.64', '1547175912', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('132', '27', '丽丽', '孙丽丽', '', '0', '0', '', '', '0', '0', '0', '', '1546440348', '1546440348', '47.92.199.64', '1547175917', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('133', '28', '美美', '李美美', '', '0', '0', '', '', '0', '0', '0', '', '1546440349', '1546440629', '47.92.199.64', '1546440349', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('134', '29', '瑶瑶', '周瑶瑶', '', '0', '0', '', '', '0', '0', '0', '', '1546440349', '1546440639', '47.92.199.64', '1546440349', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('135', '30', '梦梦', '吴梦梦', '', '0', '0', '', '', '0', '0', '0', '', '1546440348', '1546440348', '47.92.199.64', '1547175959', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('136', '31', '茜茜', '郑茜茜', '', '0', '0', '', '', '0', '0', '0', '', '1546440349', '1546440659', '47.92.199.64', '1546440349', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('137', '32', '倩倩', '王倩倩', '', '0', '0', '', '', '0', '0', '0', '', '1546440349', '1546440669', '47.92.199.64', '1546440349', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('138', '33', '希希', '冯希希', '', '0', '0', '', '', '0', '0', '0', '', '1546440349', '1546440679', '47.92.199.64', '1547185745', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('139', '34', '小夕夕', '程夕夕', '', '0', '0', '', '', '0', '0', '0', '', '1546440349', '1546440689', '47.92.199.64', '1547177692', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('140', '35', '月月', '张月月', '', '0', '0', '', '', '0', '0', '0', '', '1546440349', '1546440699', '47.92.199.64', '1546440349', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('141', '36', '悦悦', '黄悦悦', '', '0', '0', '', '', '0', '0', '0', '', '1546440349', '1546440709', '47.92.199.64', '1546440349', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('142', '37', '乐乐', '赵乐乐', '', '0', '0', '', '', '0', '0', '0', '', '1546440349', '1546440719', '47.92.199.64', '1547189276', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('143', '38', '彤彤', '钱彤彤', '', '0', '0', '', '', '0', '0', '0', '', '1546440349', '1546440729', '47.92.199.64', '1546440349', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('144', '39', '影影', '孙影影', '', '0', '0', '', '', '0', '0', '0', '', '1546440349', '1546440739', '47.92.199.64', '1547189276', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('145', '40', '珍珍', '李珍珍', '', '0', '0', '', '', '0', '0', '0', '', '1546440349', '1546440749', '47.92.199.64', '1546440349', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('146', '41', '依依', '周依依', '', '0', '0', '', '', '0', '0', '0', '', '1546440349', '1546440759', '47.92.199.64', '1546440349', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('147', '42', '沫沫', '吴沫沫', '', '0', '0', '', '', '0', '0', '0', '', '1546440349', '1546440769', '47.92.199.64', '1546440349', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('148', '43', '玉玉', '郑玉玉', '', '0', '0', '', '', '0', '0', '0', '', '1546440349', '1546440779', '47.92.199.64', '1546440349', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('149', '44', '灵灵', '王灵灵', '', '0', '0', '', '', '0', '0', '0', '', '1546440349', '1546440789', '47.92.199.64', '1546440349', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('150', '45', '瑶瑶', '冯瑶瑶', '', '0', '0', '', '', '0', '0', '0', '', '1546440349', '1546440799', '47.92.199.64', '1546440349', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('151', '46', '嫣嫣', '程嫣嫣', '', '0', '0', '', '', '0', '0', '0', '', '1546440349', '1546440809', '47.92.199.64', '1546440349', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('152', '47', '倩倩', '张倩倩', '', '0', '0', '', '', '0', '0', '0', '', '1546440349', '1546440819', '47.92.199.64', '1546440349', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('153', '48', '妍妍', '黄妍妍', '', '0', '0', '', '', '0', '0', '0', '', '1546440349', '1546440829', '47.92.199.64', '1546440349', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('154', '49', '萱萱', '赵萱萱', '', '0', '0', '', '', '0', '0', '0', '', '1546440349', '1546440839', '47.92.199.64', '1546440349', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('155', '50', '漩漩', '钱漩漩', '', '0', '0', '', '', '0', '0', '0', '', '1546440349', '1546440849', '47.92.199.64', '1546440349', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('156', '51', '娅娅', '孙娅娅', '', '0', '0', '', '', '0', '0', '0', '', '1546440349', '1546440859', '47.92.199.64', '1546440349', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('157', '52', '媛媛', '李媛媛', '', '0', '0', '', '', '0', '0', '0', '', '1546440349', '1546440869', '47.92.199.64', '1546440349', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('158', '53', '怡怡', '周怡怡', '', '0', '0', '', '', '0', '0', '0', '', '1546440349', '1546440879', '47.92.199.64', '1546440349', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('159', '54', '佩佩', '吴佩佩', '', '0', '0', '', '', '0', '0', '0', '', '1546440349', '1546440889', '47.92.199.64', '1546440349', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('160', '55', '淇淇', '郑淇淇', '', '0', '0', '', '', '0', '0', '0', '', '1546440349', '1546440899', '47.92.199.64', '1546440349', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('161', '56', '雨雨', '王雨雨', '', '0', '0', '', '', '0', '0', '0', '', '1546440349', '1546440909', '47.92.199.64', '1546440349', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('162', '57', '娜娜', '冯娜娜', '', '0', '0', '', '', '0', '0', '0', '', '1546440349', '1546440919', '47.92.199.64', '1546440349', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('163', '58', '莹莹', '陈莹莹', '', '0', '0', '', '', '0', '0', '0', '', '1546440349', '1546440929', '47.92.199.64', '1546440349', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('164', '59', '一一', '张一一', '', '0', '0', '', '', '0', '0', '0', '', '1546440349', '1546440939', '47.92.199.64', '1546440349', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('165', '60', '娟娟', '黄娟娟', '', '0', '0', '', '', '0', '0', '0', '', '1546440349', '1546440949', '47.92.199.64', '1546440349', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('166', '61', '文文', '赵文文', '', '0', '0', '', '', '0', '0', '0', '', '1546440349', '1546440959', '47.92.199.64', '1546440349', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('167', '62', '芳芳', '钱芳芳', '', '0', '0', '', '', '0', '0', '0', '', '1546440349', '1546440969', '47.92.199.64', '1546440349', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('168', '63', '莉莉', '孙莉莉', '', '0', '0', '', '', '0', '0', '0', '', '1546440349', '1546440979', '47.92.199.64', '1546440349', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('169', '64', '雅雅', '李雅雅', '', '0', '0', '', '', '0', '0', '0', '', '1546440349', '1546440989', '47.92.199.64', '1546440349', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('170', '65', '芝芝', '周芝芝', '', '0', '0', '', '', '0', '0', '0', '', '1546440349', '1546440999', '47.92.199.64', '1546440349', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('171', '66', '文文', '吴文文', '', '0', '0', '', '', '0', '0', '0', '', '1546440349', '1546441009', '47.92.199.64', '1546440349', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('172', '67', '晨晨', '郑晨晨', '', '0', '0', '', '', '0', '0', '0', '', '1546440349', '1546441019', '47.92.199.64', '1546440349', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('173', '68', '宇宇', '王宇宇', '', '0', '0', '', '', '0', '0', '0', '', '1546440349', '1546441029', '47.92.199.64', '1546440349', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('174', '69', '怡怡', '冯怡怡', '', '0', '0', '', '', '0', '0', '0', '', '1546440349', '1546441039', '47.92.199.64', '1546440349', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('175', '70', '全全', '程全全', '', '0', '0', '', '', '0', '0', '0', '', '1546440349', '1546441049', '47.92.199.64', '1546440349', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('176', '71', '子子', '张子子', '', '0', '0', '', '', '0', '0', '0', '', '1546440349', '1546441059', '47.92.199.64', '1546440349', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('177', '72', '凡凡', '黄凡凡', '', '0', '0', '', '', '0', '0', '0', '', '1546440349', '1546441069', '47.92.199.64', '1546440349', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('178', '73', '悦悦', '刘悦悦', '', '0', '0', '', '', '0', '0', '0', '', '1546440349', '1546441079', '47.92.199.64', '1546440349', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('179', '74', '思思', '李思思', '', '0', '0', '', '', '0', '0', '0', '', '1546440349', '1546441089', '47.92.199.64', '1546440349', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('180', '75', '奕奕', '韩奕奕', '', '0', '0', '', '', '0', '0', '0', '', '1546440349', '1546441099', '47.92.199.64', '1546440349', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('181', '76', '英英', '孔英英', '', '0', '0', '', '', '0', '0', '0', '', '1546440349', '1546441109', '47.92.199.64', '1546440349', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('182', '77', '义义', '曹义义', '', '0', '0', '', '', '0', '0', '0', '', '1546440349', '1546441119', '47.92.199.64', '1546440349', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('183', '78', '小钱', '钱卿卿', '', '0', '0', '', '', '0', '0', '0', '', '1546440349', '1546441129', '47.92.199.64', '1547189982', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('184', '79', '钊钊', '徐钊钊', '', '0', '0', '', '', '0', '0', '0', '', '1546440349', '1546441139', '47.92.199.64', '1546440349', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('185', '80', '钧钧', '何钧钧', '', '0', '0', '', '', '0', '0', '0', '', '1546440349', '1546441149', '47.92.199.64', '1546440349', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('186', '81', '铎铎', '许铎铎', '', '0', '0', '', '', '0', '0', '0', '', '1546440349', '1546441159', '47.92.199.64', '1546440349', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('187', '82', '铭铭', '金铭铭', '', '0', '0', '', '', '0', '0', '0', '', '1546440349', '1546441169', '47.92.199.64', '1546440349', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('188', '83', '皑皑', '沈皑皑', '', '0', '0', '', '', '0', '0', '0', '', '1546440349', '1546441179', '47.92.199.64', '1546440349', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('189', '84', '柏柏', '蒋柏柏', '', '0', '0', '', '', '0', '0', '0', '', '1546440349', '1546441189', '47.92.199.64', '1546440349', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('190', '85', '镇镇', '吕镇镇', '', '0', '0', '', '', '0', '0', '0', '', '1546440349', '1546441199', '47.92.199.64', '1546440349', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('191', '86', '淇淇', '张淇淇', '', '0', '0', '', '', '0', '0', '0', '', '1546440349', '1546441209', '47.92.199.64', '1546440349', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('192', '87', '淳淳', '黄淳淳', '', '0', '0', '', '', '0', '0', '0', '', '1546440349', '1546441219', '47.92.199.64', '1546440349', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('193', '88', '一一', '武一一', '', '0', '0', '', '', '0', '0', '0', '', '1546440349', '1546441229', '47.92.199.64', '1546440349', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('194', '89', '洁洁', '秦洁洁', '', '0', '0', '', '', '0', '0', '0', '', '1546440349', '1546441239', '47.92.199.64', '1546440349', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('195', '90', '茹茹', '谢茹茹', '', '0', '0', '', '', '0', '0', '0', '', '1546440349', '1546441249', '47.92.199.64', '1546440349', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('196', '91', '清清', '蒋清清', '', '0', '0', '', '', '0', '0', '0', '', '1546440349', '1546441259', '47.92.199.64', '1546440349', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('197', '92', '吉吉', '姜吉吉', '', '0', '0', '', '', '0', '0', '0', '', '1546440349', '1546441269', '47.92.199.64', '1546440349', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('198', '93', '克克', '华克克', '', '0', '0', '', '', '0', '0', '0', '', '1546440349', '1546441279', '47.92.199.64', '1546440349', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('199', '94', '先先', '吕先先', '', '0', '0', '', '', '0', '0', '0', '', '1546440349', '1546441289', '47.92.199.64', '1546440349', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('200', '95', '依依', '邹依依', '', '0', '0', '', '', '0', '0', '0', '', '1546440349', '1546441299', '47.92.199.64', '1546440349', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('201', '96', '浩浩', '孙浩浩', '', '0', '0', '', '', '0', '0', '0', '', '1546440349', '1546441309', '47.92.199.64', '1546440349', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('202', '97', '泓泓', '谢泓泓', '', '0', '0', '', '', '0', '0', '0', '', '1546440349', '1546441319', '47.92.199.64', '1546440349', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('203', '98', '亮亮', '严亮亮', '', '0', '0', '', '', '0', '0', '0', '', '1546440349', '1546441329', '47.92.199.64', '1546440349', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('204', '99', '允允', '秦允允', '', '0', '0', '', '', '0', '0', '0', '', '1546440349', '1546441339', '47.92.199.64', '1546440349', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('205', '100', '元元', '华元元', '', '0', '0', '', '', '0', '0', '0', '', '1546440349', '1546441349', '47.92.199.64', '1546440349', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('206', '101', '源源', '姜源源', '', '0', '0', '', '', '0', '0', '0', '', '1546440349', '1546441359', '47.92.199.64', '1546440349', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('207', '102', '悦悦', '邹悦悦', '', '0', '0', '', '', '0', '0', '0', '', '1546440349', '1546441369', '47.92.199.64', '1546440349', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('208', '103', '晓东', '张晓东', '', '0', '0', '', '', '0', '0', '0', '', '1547187018', '1546441369', '', '1547187018', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('209', '104', '葛优', '葛优', '', '0', '0', '', '', '0', '0', '0', '', '1547187161', '1546441369', '', '1547187161', '0', '', '');
INSERT INTO `xpcms_user_profile` VALUES ('210', '105', '小吴', '吴东东', '', '0', '0', '', '', '0', '0', '0', '', '1547187339', '1546441369', '', '1547187339', '0', '', '');
