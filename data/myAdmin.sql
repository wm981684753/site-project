/*
Navicat MySQL Data Transfer

Source Server         : 1.15.177.241
Source Server Version : 80026
Source Host           : 1.15.177.241:13308
Source Database       : write-app

Target Server Type    : MYSQL
Target Server Version : 80026
File Encoding         : 65001

Date: 2022-02-18 14:37:31
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for ea_system_admin
-- ----------------------------
DROP TABLE IF EXISTS `ea_system_admin`;
CREATE TABLE `ea_system_admin` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `auth_ids` varchar(255) DEFAULT NULL COMMENT '角色权限ID',
  `head_img` varchar(255) DEFAULT NULL COMMENT '头像',
  `username` varchar(50) NOT NULL DEFAULT '' COMMENT '用户登录名',
  `password` char(40) NOT NULL DEFAULT '' COMMENT '用户登录密码',
  `phone` varchar(16) DEFAULT NULL COMMENT '联系手机号',
  `remark` varchar(255) DEFAULT '' COMMENT '备注说明',
  `login_num` bigint unsigned DEFAULT '0' COMMENT '登录次数',
  `sort` int DEFAULT '0' COMMENT '排序',
  `status` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '状态(0:禁用,1:启用,)',
  `create_time` int DEFAULT NULL COMMENT '创建时间',
  `update_time` int DEFAULT NULL COMMENT '更新时间',
  `delete_time` int DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE,
  KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT COMMENT='系统用户表';

-- ----------------------------
-- Records of ea_system_admin
-- ----------------------------
INSERT INTO `ea_system_admin` VALUES ('1', null, '/static/admin/images/head.jpg', 'admin', 'ed696eb5bba1f7460585cc6975e6cf9bf24903dd', 'admin', 'admin', '1', '0', '1', '1589454169', '1645164781', null);

-- ----------------------------
-- Table structure for ea_system_auth
-- ----------------------------
DROP TABLE IF EXISTS `ea_system_auth`;
CREATE TABLE `ea_system_auth` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL COMMENT '权限名称',
  `sort` int DEFAULT '0' COMMENT '排序',
  `status` tinyint unsigned DEFAULT '1' COMMENT '状态(1:禁用,2:启用)',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注说明',
  `create_time` int DEFAULT NULL COMMENT '创建时间',
  `update_time` int DEFAULT NULL COMMENT '更新时间',
  `delete_time` int DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT COMMENT='系统权限表';

-- ----------------------------
-- Records of ea_system_auth
-- ----------------------------
INSERT INTO `ea_system_auth` VALUES ('1', '管理员', '1', '1', '测试管理员', '1588921753', '1589614331', null);
INSERT INTO `ea_system_auth` VALUES ('6', '游客权限', '0', '1', '', '1588227513', '1589591751', '1589591751');

-- ----------------------------
-- Table structure for ea_system_auth_node
-- ----------------------------
DROP TABLE IF EXISTS `ea_system_auth_node`;
CREATE TABLE `ea_system_auth_node` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `auth_id` bigint unsigned DEFAULT NULL COMMENT '角色ID',
  `node_id` bigint DEFAULT NULL COMMENT '节点ID',
  PRIMARY KEY (`id`),
  KEY `index_system_auth_auth` (`auth_id`) USING BTREE,
  KEY `index_system_auth_node` (`node_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT COMMENT='角色与节点关系表';

-- ----------------------------
-- Records of ea_system_auth_node
-- ----------------------------
INSERT INTO `ea_system_auth_node` VALUES ('1', '6', '1');
INSERT INTO `ea_system_auth_node` VALUES ('2', '6', '2');
INSERT INTO `ea_system_auth_node` VALUES ('3', '6', '9');
INSERT INTO `ea_system_auth_node` VALUES ('4', '6', '12');
INSERT INTO `ea_system_auth_node` VALUES ('5', '6', '18');
INSERT INTO `ea_system_auth_node` VALUES ('6', '6', '19');
INSERT INTO `ea_system_auth_node` VALUES ('7', '6', '21');
INSERT INTO `ea_system_auth_node` VALUES ('8', '6', '22');
INSERT INTO `ea_system_auth_node` VALUES ('9', '6', '29');
INSERT INTO `ea_system_auth_node` VALUES ('10', '6', '30');
INSERT INTO `ea_system_auth_node` VALUES ('11', '6', '38');
INSERT INTO `ea_system_auth_node` VALUES ('12', '6', '39');
INSERT INTO `ea_system_auth_node` VALUES ('13', '6', '45');
INSERT INTO `ea_system_auth_node` VALUES ('14', '6', '46');
INSERT INTO `ea_system_auth_node` VALUES ('15', '6', '52');
INSERT INTO `ea_system_auth_node` VALUES ('16', '6', '53');

-- ----------------------------
-- Table structure for ea_system_config
-- ----------------------------
DROP TABLE IF EXISTS `ea_system_config`;
CREATE TABLE `ea_system_config` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '变量名',
  `group` varchar(30) NOT NULL DEFAULT '' COMMENT '分组',
  `value` text COMMENT '变量值',
  `remark` varchar(100) DEFAULT '' COMMENT '备注信息',
  `sort` int DEFAULT '0',
  `create_time` int DEFAULT NULL COMMENT '创建时间',
  `update_time` int DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `group` (`group`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT COMMENT='系统配置表';

-- ----------------------------
-- Records of ea_system_config
-- ----------------------------
INSERT INTO `ea_system_config` VALUES ('41', 'alisms_access_key_id', 'sms', '填你的', '阿里大于公钥', '0', null, null);
INSERT INTO `ea_system_config` VALUES ('42', 'alisms_access_key_secret', 'sms', '填你的', '阿里大鱼私钥', '0', null, null);
INSERT INTO `ea_system_config` VALUES ('55', 'upload_type', 'upload', 'local', '当前上传方式 （local,alioss,qnoss,txoss）', '0', null, null);
INSERT INTO `ea_system_config` VALUES ('56', 'upload_allow_ext', 'upload', 'doc,gif,ico,icon,jpg,mp3,mp4,p12,pem,png,rar,jpeg', '允许上传的文件类型', '0', null, null);
INSERT INTO `ea_system_config` VALUES ('57', 'upload_allow_size', 'upload', '1024000', '允许上传的大小', '0', null, null);
INSERT INTO `ea_system_config` VALUES ('58', 'upload_allow_mime', 'upload', 'image/gif,image/jpeg,video/x-msvideo,text/plain,image/png', '允许上传的文件mime', '0', null, null);
INSERT INTO `ea_system_config` VALUES ('59', 'upload_allow_type', 'upload', 'local,alioss,qnoss,txcos', '可用的上传文件方式', '0', null, null);
INSERT INTO `ea_system_config` VALUES ('60', 'alioss_access_key_id', 'upload', '填你的', '阿里云oss公钥', '0', null, null);
INSERT INTO `ea_system_config` VALUES ('61', 'alioss_access_key_secret', 'upload', '填你的', '阿里云oss私钥', '0', null, null);
INSERT INTO `ea_system_config` VALUES ('62', 'alioss_endpoint', 'upload', '填你的', '阿里云oss数据中心', '0', null, null);
INSERT INTO `ea_system_config` VALUES ('63', 'alioss_bucket', 'upload', '填你的', '阿里云oss空间名称', '0', null, null);
INSERT INTO `ea_system_config` VALUES ('64', 'alioss_domain', 'upload', '填你的', '阿里云oss访问域名', '0', null, null);
INSERT INTO `ea_system_config` VALUES ('65', 'logo_title', 'site', 'EasyAdmin', 'LOGO标题', '0', null, null);
INSERT INTO `ea_system_config` VALUES ('66', 'logo_image', 'site', '/favicon.ico', 'logo图片', '0', null, null);
INSERT INTO `ea_system_config` VALUES ('68', 'site_name', 'site', 'EasyAdmin后台系统', '站点名称', '0', null, null);
INSERT INTO `ea_system_config` VALUES ('69', 'site_ico', 'site', '填你的', '浏览器图标', '0', null, null);
INSERT INTO `ea_system_config` VALUES ('70', 'site_copyright', 'site', '填你的', '版权信息', '0', null, null);
INSERT INTO `ea_system_config` VALUES ('71', 'site_beian', 'site', '填你的', '备案信息', '0', null, null);
INSERT INTO `ea_system_config` VALUES ('72', 'site_version', 'site', '2.0.0', '版本信息', '0', null, null);
INSERT INTO `ea_system_config` VALUES ('75', 'sms_type', 'sms', 'alisms', '短信类型', '0', null, null);
INSERT INTO `ea_system_config` VALUES ('76', 'miniapp_appid', 'wechat', '填你的', '小程序公钥', '0', null, null);
INSERT INTO `ea_system_config` VALUES ('77', 'miniapp_appsecret', 'wechat', '填你的', '小程序私钥', '0', null, null);
INSERT INTO `ea_system_config` VALUES ('78', 'web_appid', 'wechat', '填你的', '公众号公钥', '0', null, null);
INSERT INTO `ea_system_config` VALUES ('79', 'web_appsecret', 'wechat', '填你的', '公众号私钥', '0', null, null);
INSERT INTO `ea_system_config` VALUES ('80', 'txcos_secret_id', 'upload', '填你的', '腾讯云cos密钥', '0', null, null);
INSERT INTO `ea_system_config` VALUES ('81', 'txcos_secret_key', 'upload', '填你的', '腾讯云cos私钥', '0', null, null);
INSERT INTO `ea_system_config` VALUES ('82', 'txcos_region', 'upload', '填你的', '存储桶地域', '0', null, null);
INSERT INTO `ea_system_config` VALUES ('83', 'tecos_bucket', 'upload', '填你的', '存储桶名称', '0', null, null);
INSERT INTO `ea_system_config` VALUES ('84', 'qnoss_access_key', 'upload', '填你的', '访问密钥', '0', null, null);
INSERT INTO `ea_system_config` VALUES ('85', 'qnoss_secret_key', 'upload', '填你的', '安全密钥', '0', null, null);
INSERT INTO `ea_system_config` VALUES ('86', 'qnoss_bucket', 'upload', '填你的', '存储空间', '0', null, null);
INSERT INTO `ea_system_config` VALUES ('87', 'qnoss_domain', 'upload', '填你的', '访问域名', '0', null, null);

-- ----------------------------
-- Table structure for ea_system_log_202202
-- ----------------------------
DROP TABLE IF EXISTS `ea_system_log_202202`;
CREATE TABLE `ea_system_log_202202` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int unsigned DEFAULT '0' COMMENT '管理员ID',
  `url` varchar(1500) NOT NULL DEFAULT '' COMMENT '操作页面',
  `method` varchar(50) NOT NULL COMMENT '请求方法',
  `title` varchar(100) DEFAULT '' COMMENT '日志标题',
  `content` text NOT NULL COMMENT '内容',
  `ip` varchar(50) NOT NULL DEFAULT '' COMMENT 'IP',
  `useragent` varchar(255) DEFAULT '' COMMENT 'User-Agent',
  `create_time` int DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=640 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT COMMENT='后台操作日志表 - 202202';

-- ----------------------------
-- Records of ea_system_log_202202
-- ----------------------------
INSERT INTO `ea_system_log_202202` VALUES ('630', null, '/admin/login/index.html', 'post', '', '{\"username\":\"admin\",\"password\":\"***********\",\"keep_login\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36', '1645164688');
INSERT INTO `ea_system_log_202202` VALUES ('631', null, '/admin/login/index.html', 'post', '', '{\"username\":\"demo\",\"password\":\"***********\",\"keep_login\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36', '1645164696');
INSERT INTO `ea_system_log_202202` VALUES ('632', null, '/admin/login/index.html', 'post', '', '{\"username\":\"admin\",\"password\":\"***********\",\"keep_login\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36', '1645164737');
INSERT INTO `ea_system_log_202202` VALUES ('633', null, '/admin/login/index.html', 'post', '', '{\"username\":\"admin\",\"password\":\"***********\",\"keep_login\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36', '1645164780');
INSERT INTO `ea_system_log_202202` VALUES ('634', '1', '/admin/system.menu/edit?id=249', 'post', '', '{\"id\":\"249\",\"pid\":\"0\",\"title\":\"应用管理\",\"href\":\"\",\"icon\":\"fa fa-list\",\"target\":\"_self\",\"sort\":\"0\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36', '1645164821');
INSERT INTO `ea_system_log_202202` VALUES ('635', '1', '/admin/system.menu/delete?id=250', 'post', '', '{\"id\":\"250\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36', '1645164831');
INSERT INTO `ea_system_log_202202` VALUES ('636', '1', '/admin/system.menu/delete?id=251', 'post', '', '{\"id\":\"251\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36', '1645164837');
INSERT INTO `ea_system_log_202202` VALUES ('637', '1', '/admin/system.node/refreshNode?force=1', 'post', '', '{\"force\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36', '1645164866');
INSERT INTO `ea_system_log_202202` VALUES ('638', '1', '/admin/system.node/refreshNode?force=0', 'post', '', '{\"force\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36', '1645164916');
INSERT INTO `ea_system_log_202202` VALUES ('639', '1', '/admin/system.config/save', 'post', '', '{\"site_name\":\"EasyAdmin后台系统\",\"site_ico\":\"填你的\",\"file\":\"\",\"site_version\":\"2.0.0\",\"site_beian\":\"填你的\",\"site_copyright\":\"填你的\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36', '1645164985');

-- ----------------------------
-- Table structure for ea_system_menu
-- ----------------------------
DROP TABLE IF EXISTS `ea_system_menu`;
CREATE TABLE `ea_system_menu` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `pid` bigint unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '名称',
  `icon` varchar(100) NOT NULL DEFAULT '' COMMENT '菜单图标',
  `href` varchar(100) NOT NULL DEFAULT '' COMMENT '链接',
  `params` varchar(500) DEFAULT '' COMMENT '链接参数',
  `target` varchar(20) NOT NULL DEFAULT '_self' COMMENT '链接打开方式',
  `sort` int DEFAULT '0' COMMENT '菜单排序',
  `status` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '状态(0:禁用,1:启用)',
  `remark` varchar(255) DEFAULT NULL,
  `create_time` int DEFAULT NULL COMMENT '创建时间',
  `update_time` int DEFAULT NULL COMMENT '更新时间',
  `delete_time` int DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`),
  KEY `title` (`title`),
  KEY `href` (`href`)
) ENGINE=InnoDB AUTO_INCREMENT=254 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT COMMENT='系统菜单表';

-- ----------------------------
-- Records of ea_system_menu
-- ----------------------------
INSERT INTO `ea_system_menu` VALUES ('227', '99999999', '后台首页', 'fa fa-home', 'index/welcome', '', '_self', '0', '1', null, null, '1573120497', null);
INSERT INTO `ea_system_menu` VALUES ('228', '0', '系统管理', 'fa fa-cog', '', '', '_self', '0', '1', '', null, '1588999529', null);
INSERT INTO `ea_system_menu` VALUES ('234', '228', '菜单管理', 'fa fa-tree', 'system.menu/index', '', '_self', '10', '1', '', null, '1588228555', null);
INSERT INTO `ea_system_menu` VALUES ('244', '228', '管理员管理', 'fa fa-user', 'system.admin/index', '', '_self', '12', '1', '', '1573185011', '1588228573', null);
INSERT INTO `ea_system_menu` VALUES ('245', '228', '角色管理', 'fa fa-bitbucket-square', 'system.auth/index', '', '_self', '11', '1', '', '1573435877', '1588228634', null);
INSERT INTO `ea_system_menu` VALUES ('246', '228', '节点管理', 'fa fa-list', 'system.node/index', '', '_self', '9', '1', '', '1573435919', '1588228648', null);
INSERT INTO `ea_system_menu` VALUES ('247', '228', '配置管理', 'fa fa-asterisk', 'system.config/index', '', '_self', '8', '1', '', '1573457448', '1588228566', null);
INSERT INTO `ea_system_menu` VALUES ('248', '228', '上传管理', 'fa fa-arrow-up', 'system.uploadfile/index', '', '_self', '0', '1', '', '1573542953', '1588228043', null);
INSERT INTO `ea_system_menu` VALUES ('249', '0', '应用管理', 'fa fa-list', '', '', '_self', '0', '1', '', '1589439884', '1645164822', null);
INSERT INTO `ea_system_menu` VALUES ('250', '249', '商品分类', 'fa fa-calendar-check-o', 'mall.cate/index', '', '_self', '0', '1', '', '1589439910', '1645164831', '1645164831');
INSERT INTO `ea_system_menu` VALUES ('251', '249', '商品管理', 'fa fa-list', 'mall.goods/index', '', '_self', '0', '1', '', '1589439931', '1645164837', '1645164837');
INSERT INTO `ea_system_menu` VALUES ('252', '228', '快捷入口', 'fa fa-list', 'system.quick/index', '', '_self', '0', '1', '', '1589623683', '1589623683', null);
INSERT INTO `ea_system_menu` VALUES ('253', '228', '日志管理', 'fa fa-connectdevelop', 'system.log/index', '', '_self', '0', '1', '', '1589623684', '1589623684', null);

-- ----------------------------
-- Table structure for ea_system_node
-- ----------------------------
DROP TABLE IF EXISTS `ea_system_node`;
CREATE TABLE `ea_system_node` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `node` varchar(100) DEFAULT NULL COMMENT '节点代码',
  `title` varchar(500) DEFAULT NULL COMMENT '节点标题',
  `type` tinyint(1) DEFAULT '3' COMMENT '节点类型（1：控制器，2：节点）',
  `is_auth` tinyint unsigned DEFAULT '1' COMMENT '是否启动RBAC权限控制',
  `create_time` int DEFAULT NULL COMMENT '创建时间',
  `update_time` int DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `node` (`node`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1323 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT COMMENT='系统节点表';

-- ----------------------------
-- Records of ea_system_node
-- ----------------------------
INSERT INTO `ea_system_node` VALUES ('1', 'system.admin', '管理员管理', '1', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('2', 'system.admin/index', '列表', '2', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('3', 'system.admin/add', '添加', '2', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('4', 'system.admin/edit', '编辑', '2', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('5', 'system.admin/password', '编辑', '2', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('6', 'system.admin/delete', '删除', '2', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('7', 'system.admin/modify', '属性修改', '2', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('8', 'system.admin/export', '导出', '2', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('9', 'system.auth', '角色权限管理', '1', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('10', 'system.auth/authorize', '授权', '2', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('11', 'system.auth/saveAuthorize', '授权保存', '2', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('12', 'system.auth/index', '列表', '2', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('13', 'system.auth/add', '添加', '2', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('14', 'system.auth/edit', '编辑', '2', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('15', 'system.auth/delete', '删除', '2', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('16', 'system.auth/export', '导出', '2', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('17', 'system.auth/modify', '属性修改', '2', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('18', 'system.config', '系统配置管理', '1', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('19', 'system.config/index', '列表', '2', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('20', 'system.config/save', '保存', '2', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('21', 'system.menu', '菜单管理', '1', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('22', 'system.menu/index', '列表', '2', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('23', 'system.menu/add', '添加', '2', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('24', 'system.menu/edit', '编辑', '2', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('25', 'system.menu/delete', '删除', '2', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('26', 'system.menu/modify', '属性修改', '2', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('27', 'system.menu/getMenuTips', '添加菜单提示', '2', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('28', 'system.menu/export', '导出', '2', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('29', 'system.node', '系统节点管理', '1', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('30', 'system.node/index', '列表', '2', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('31', 'system.node/refreshNode', '系统节点更新', '2', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('32', 'system.node/clearNode', '清除失效节点', '2', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('33', 'system.node/add', '添加', '2', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('34', 'system.node/edit', '编辑', '2', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('35', 'system.node/delete', '删除', '2', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('36', 'system.node/export', '导出', '2', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('37', 'system.node/modify', '属性修改', '2', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('38', 'system.uploadfile', '上传文件管理', '1', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('39', 'system.uploadfile/index', '列表', '2', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('40', 'system.uploadfile/add', '添加', '2', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('41', 'system.uploadfile/edit', '编辑', '2', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('42', 'system.uploadfile/delete', '删除', '2', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('43', 'system.uploadfile/export', '导出', '2', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('44', 'system.uploadfile/modify', '属性修改', '2', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('45', 'mall.cate', '商品分类管理', '1', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('46', 'mall.cate/index', '列表', '2', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('47', 'mall.cate/add', '添加', '2', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('48', 'mall.cate/edit', '编辑', '2', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('49', 'mall.cate/delete', '删除', '2', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('50', 'mall.cate/export', '导出', '2', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('51', 'mall.cate/modify', '属性修改', '2', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('52', 'mall.goods', '商城商品管理', '1', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('53', 'mall.goods/index', '列表', '2', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('54', 'mall.goods/stock', '入库', '2', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('55', 'mall.goods/add', '添加', '2', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('56', 'mall.goods/edit', '编辑', '2', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('57', 'mall.goods/delete', '删除', '2', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('58', 'mall.goods/export', '导出', '2', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('59', 'mall.goods/modify', '属性修改', '2', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('60', 'system.quick', '快捷入口管理', '1', '1', '1589623188', '1589623188');
INSERT INTO `ea_system_node` VALUES ('61', 'system.quick/index', '列表', '2', '1', '1589623188', '1589623188');
INSERT INTO `ea_system_node` VALUES ('62', 'system.quick/add', '添加', '2', '1', '1589623188', '1589623188');
INSERT INTO `ea_system_node` VALUES ('63', 'system.quick/edit', '编辑', '2', '1', '1589623188', '1589623188');
INSERT INTO `ea_system_node` VALUES ('64', 'system.quick/delete', '删除', '2', '1', '1589623188', '1589623188');
INSERT INTO `ea_system_node` VALUES ('65', 'system.quick/export', '导出', '2', '1', '1589623188', '1589623188');
INSERT INTO `ea_system_node` VALUES ('66', 'system.quick/modify', '属性修改', '2', '1', '1589623188', '1589623188');
INSERT INTO `ea_system_node` VALUES ('67', 'system.log', '操作日志管理', '1', '1', '1589623188', '1589623188');
INSERT INTO `ea_system_node` VALUES ('68', 'system.log/index', '列表', '2', '1', '1589623188', '1589623188');
INSERT INTO `ea_system_node` VALUES ('687', 'site.about_contact', 'site_about_contact', '1', '1', '1645164917', '1645164917');
INSERT INTO `ea_system_node` VALUES ('689', 'site.about_contact/index', '列表', '2', '1', '1645164917', '1645164917');
INSERT INTO `ea_system_node` VALUES ('691', 'site.about_contact/add', '添加', '2', '1', '1645164917', '1645164917');
INSERT INTO `ea_system_node` VALUES ('693', 'site.about_contact/edit', '编辑', '2', '1', '1645164917', '1645164917');
INSERT INTO `ea_system_node` VALUES ('695', 'site.about_contact/delete', '删除', '2', '1', '1645164917', '1645164917');
INSERT INTO `ea_system_node` VALUES ('697', 'site.about_contact/export', '导出', '2', '1', '1645164917', '1645164917');
INSERT INTO `ea_system_node` VALUES ('698', 'site.about_contact/modify', '属性修改', '2', '1', '1645164917', '1645164917');
INSERT INTO `ea_system_node` VALUES ('699', 'site.about_course', 'site_about_course', '1', '1', '1645164917', '1645164917');
INSERT INTO `ea_system_node` VALUES ('700', 'site.about_course/index', '列表', '2', '1', '1645164917', '1645164917');
INSERT INTO `ea_system_node` VALUES ('701', 'site.about_course/add', '添加', '2', '1', '1645164917', '1645164917');
INSERT INTO `ea_system_node` VALUES ('702', 'site.about_course/edit', '编辑', '2', '1', '1645164917', '1645164917');
INSERT INTO `ea_system_node` VALUES ('703', 'site.about_course/delete', '删除', '2', '1', '1645164917', '1645164917');
INSERT INTO `ea_system_node` VALUES ('704', 'site.about_course/export', '导出', '2', '1', '1645164917', '1645164917');
INSERT INTO `ea_system_node` VALUES ('705', 'site.about_course/modify', '属性修改', '2', '1', '1645164917', '1645164917');
INSERT INTO `ea_system_node` VALUES ('706', 'site.about_culture', 'site_about_culture', '1', '1', '1645164917', '1645164917');
INSERT INTO `ea_system_node` VALUES ('707', 'site.about_culture/index', '列表', '2', '1', '1645164918', '1645164918');
INSERT INTO `ea_system_node` VALUES ('708', 'site.about_culture/add', '添加', '2', '1', '1645164918', '1645164918');
INSERT INTO `ea_system_node` VALUES ('709', 'site.about_culture/edit', '编辑', '2', '1', '1645164918', '1645164918');
INSERT INTO `ea_system_node` VALUES ('710', 'site.about_culture/delete', '删除', '2', '1', '1645164918', '1645164918');
INSERT INTO `ea_system_node` VALUES ('711', 'site.about_culture/export', '导出', '2', '1', '1645164918', '1645164918');
INSERT INTO `ea_system_node` VALUES ('712', 'site.about_culture/modify', '属性修改', '2', '1', '1645164918', '1645164918');
INSERT INTO `ea_system_node` VALUES ('713', 'site.about_honor', 'site_about_honor', '1', '1', '1645164918', '1645164918');
INSERT INTO `ea_system_node` VALUES ('714', 'site.about_honor/index', '列表', '2', '1', '1645164918', '1645164918');
INSERT INTO `ea_system_node` VALUES ('715', 'site.about_honor/save', '保存', '2', '1', '1645164918', '1645164918');
INSERT INTO `ea_system_node` VALUES ('716', 'site.about_honor/add', '添加', '2', '1', '1645164918', '1645164918');
INSERT INTO `ea_system_node` VALUES ('717', 'site.about_honor/edit', '编辑', '2', '1', '1645164918', '1645164918');
INSERT INTO `ea_system_node` VALUES ('718', 'site.about_honor/delete', '删除', '2', '1', '1645164918', '1645164918');
INSERT INTO `ea_system_node` VALUES ('719', 'site.about_honor/export', '导出', '2', '1', '1645164918', '1645164918');
INSERT INTO `ea_system_node` VALUES ('720', 'site.about_honor/modify', '属性修改', '2', '1', '1645164918', '1645164918');
INSERT INTO `ea_system_node` VALUES ('721', 'site.about_job', 'site_about_job', '1', '1', '1645164918', '1645164918');
INSERT INTO `ea_system_node` VALUES ('722', 'site.about_job/index', '列表', '2', '1', '1645164919', '1645164919');
INSERT INTO `ea_system_node` VALUES ('723', 'site.about_job/add', '添加', '2', '1', '1645164919', '1645164919');
INSERT INTO `ea_system_node` VALUES ('724', 'site.about_job/edit', '编辑', '2', '1', '1645164919', '1645164919');
INSERT INTO `ea_system_node` VALUES ('725', 'site.about_job/delete', '删除', '2', '1', '1645164919', '1645164919');
INSERT INTO `ea_system_node` VALUES ('726', 'site.about_job/export', '导出', '2', '1', '1645164919', '1645164919');
INSERT INTO `ea_system_node` VALUES ('727', 'site.about_job/modify', '属性修改', '2', '1', '1645164919', '1645164919');
INSERT INTO `ea_system_node` VALUES ('728', 'site.about_job_cate', 'site_about_job_cate', '1', '1', '1645164919', '1645164919');
INSERT INTO `ea_system_node` VALUES ('729', 'site.about_job_cate/index', '列表', '2', '1', '1645164919', '1645164919');
INSERT INTO `ea_system_node` VALUES ('730', 'site.about_job_cate/add', '添加', '2', '1', '1645164919', '1645164919');
INSERT INTO `ea_system_node` VALUES ('731', 'site.about_job_cate/edit', '编辑', '2', '1', '1645164919', '1645164919');
INSERT INTO `ea_system_node` VALUES ('732', 'site.about_job_cate/delete', '删除', '2', '1', '1645164919', '1645164919');
INSERT INTO `ea_system_node` VALUES ('733', 'site.about_job_cate/export', '导出', '2', '1', '1645164919', '1645164919');
INSERT INTO `ea_system_node` VALUES ('734', 'site.about_job_cate/modify', '属性修改', '2', '1', '1645164919', '1645164919');
INSERT INTO `ea_system_node` VALUES ('735', 'site.about_job_show', 'site_about_job_show', '1', '1', '1645164919', '1645164919');
INSERT INTO `ea_system_node` VALUES ('736', 'site.about_job_show/index', '列表', '2', '1', '1645164919', '1645164919');
INSERT INTO `ea_system_node` VALUES ('737', 'site.about_job_show/add', '添加', '2', '1', '1645164920', '1645164920');
INSERT INTO `ea_system_node` VALUES ('738', 'site.about_job_show/edit', '编辑', '2', '1', '1645164920', '1645164920');
INSERT INTO `ea_system_node` VALUES ('739', 'site.about_job_show/delete', '删除', '2', '1', '1645164920', '1645164920');
INSERT INTO `ea_system_node` VALUES ('740', 'site.about_job_show/export', '导出', '2', '1', '1645164920', '1645164920');
INSERT INTO `ea_system_node` VALUES ('741', 'site.about_job_show/modify', '属性修改', '2', '1', '1645164920', '1645164920');
INSERT INTO `ea_system_node` VALUES ('742', 'site.about_team', 'site_about_team', '1', '1', '1645164920', '1645164920');
INSERT INTO `ea_system_node` VALUES ('743', 'site.about_team/index', '列表', '2', '1', '1645164920', '1645164920');
INSERT INTO `ea_system_node` VALUES ('744', 'site.about_team/save', '保存', '2', '1', '1645164920', '1645164920');
INSERT INTO `ea_system_node` VALUES ('745', 'site.about_team/add', '添加', '2', '1', '1645164920', '1645164920');
INSERT INTO `ea_system_node` VALUES ('746', 'site.about_team/edit', '编辑', '2', '1', '1645164920', '1645164920');
INSERT INTO `ea_system_node` VALUES ('747', 'site.about_team/delete', '删除', '2', '1', '1645164920', '1645164920');
INSERT INTO `ea_system_node` VALUES ('748', 'site.about_team/export', '导出', '2', '1', '1645164920', '1645164920');
INSERT INTO `ea_system_node` VALUES ('749', 'site.about_team/modify', '属性修改', '2', '1', '1645164920', '1645164920');
INSERT INTO `ea_system_node` VALUES ('750', 'site.about_us', 'site_about_us', '1', '1', '1645164920', '1645164920');
INSERT INTO `ea_system_node` VALUES ('751', 'site.about_us/index', '列表', '2', '1', '1645164920', '1645164920');
INSERT INTO `ea_system_node` VALUES ('752', 'site.about_us/save', '保存', '2', '1', '1645164921', '1645164921');
INSERT INTO `ea_system_node` VALUES ('753', 'site.about_us/add', '添加', '2', '1', '1645164921', '1645164921');
INSERT INTO `ea_system_node` VALUES ('754', 'site.about_us/edit', '编辑', '2', '1', '1645164921', '1645164921');
INSERT INTO `ea_system_node` VALUES ('755', 'site.about_us/delete', '删除', '2', '1', '1645164921', '1645164921');
INSERT INTO `ea_system_node` VALUES ('756', 'site.about_us/export', '导出', '2', '1', '1645164921', '1645164921');
INSERT INTO `ea_system_node` VALUES ('757', 'site.about_us/modify', '属性修改', '2', '1', '1645164921', '1645164921');
INSERT INTO `ea_system_node` VALUES ('758', 'site.banner', 'site_banner', '1', '1', '1645164921', '1645164921');
INSERT INTO `ea_system_node` VALUES ('759', 'site.banner/index', '列表', '2', '1', '1645164921', '1645164921');
INSERT INTO `ea_system_node` VALUES ('760', 'site.banner/add', '添加', '2', '1', '1645164921', '1645164921');
INSERT INTO `ea_system_node` VALUES ('761', 'site.banner/edit', '编辑', '2', '1', '1645164921', '1645164921');
INSERT INTO `ea_system_node` VALUES ('762', 'site.banner/delete', '删除', '2', '1', '1645164921', '1645164921');
INSERT INTO `ea_system_node` VALUES ('763', 'site.banner/export', '导出', '2', '1', '1645164921', '1645164921');
INSERT INTO `ea_system_node` VALUES ('764', 'site.banner/modify', '属性修改', '2', '1', '1645164921', '1645164921');
INSERT INTO `ea_system_node` VALUES ('765', 'site.banner_inside', 'site_banner_inside', '1', '1', '1645164921', '1645164921');
INSERT INTO `ea_system_node` VALUES ('766', 'site.banner_inside/index', '列表', '2', '1', '1645164921', '1645164921');
INSERT INTO `ea_system_node` VALUES ('767', 'site.banner_inside/save', '保存', '2', '1', '1645164922', '1645164922');
INSERT INTO `ea_system_node` VALUES ('768', 'site.banner_inside/add', '添加', '2', '1', '1645164922', '1645164922');
INSERT INTO `ea_system_node` VALUES ('769', 'site.banner_inside/edit', '编辑', '2', '1', '1645164922', '1645164922');
INSERT INTO `ea_system_node` VALUES ('770', 'site.banner_inside/delete', '删除', '2', '1', '1645164922', '1645164922');
INSERT INTO `ea_system_node` VALUES ('771', 'site.banner_inside/export', '导出', '2', '1', '1645164922', '1645164922');
INSERT INTO `ea_system_node` VALUES ('772', 'site.banner_inside/modify', '属性修改', '2', '1', '1645164922', '1645164922');
INSERT INTO `ea_system_node` VALUES ('773', 'site.banner_res', 'site_banner_res', '1', '1', '1645164922', '1645164922');
INSERT INTO `ea_system_node` VALUES ('774', 'site.banner_res/index', '列表', '2', '1', '1645164922', '1645164922');
INSERT INTO `ea_system_node` VALUES ('775', 'site.banner_res/add', '添加', '2', '1', '1645164922', '1645164922');
INSERT INTO `ea_system_node` VALUES ('776', 'site.banner_res/edit', '编辑', '2', '1', '1645164922', '1645164922');
INSERT INTO `ea_system_node` VALUES ('777', 'site.banner_res/delete', '删除', '2', '1', '1645164922', '1645164922');
INSERT INTO `ea_system_node` VALUES ('778', 'site.banner_res/export', '导出', '2', '1', '1645164922', '1645164922');
INSERT INTO `ea_system_node` VALUES ('779', 'site.banner_res/modify', '属性修改', '2', '1', '1645164922', '1645164922');
INSERT INTO `ea_system_node` VALUES ('780', 'site.brand_config', 'site_brand_config', '1', '1', '1645164922', '1645164922');
INSERT INTO `ea_system_node` VALUES ('781', 'site.brand_config/index', '列表', '2', '1', '1645164922', '1645164922');
INSERT INTO `ea_system_node` VALUES ('782', 'site.brand_config/add', '添加', '2', '1', '1645164922', '1645164922');
INSERT INTO `ea_system_node` VALUES ('783', 'site.brand_config/edit', '编辑', '2', '1', '1645164922', '1645164922');
INSERT INTO `ea_system_node` VALUES ('784', 'site.brand_config/delete', '删除', '2', '1', '1645164923', '1645164923');
INSERT INTO `ea_system_node` VALUES ('785', 'site.brand_config/export', '导出', '2', '1', '1645164923', '1645164923');
INSERT INTO `ea_system_node` VALUES ('786', 'site.brand_config/modify', '属性修改', '2', '1', '1645164923', '1645164923');
INSERT INTO `ea_system_node` VALUES ('787', 'site.brand_config_title', 'site_brand_config_title', '1', '1', '1645164923', '1645164923');
INSERT INTO `ea_system_node` VALUES ('788', 'site.brand_config_title/index', '列表', '2', '1', '1645164923', '1645164923');
INSERT INTO `ea_system_node` VALUES ('789', 'site.brand_config_title/save', '保存', '2', '1', '1645164923', '1645164923');
INSERT INTO `ea_system_node` VALUES ('790', 'site.brand_config_title/add', '添加', '2', '1', '1645164923', '1645164923');
INSERT INTO `ea_system_node` VALUES ('791', 'site.brand_config_title/edit', '编辑', '2', '1', '1645164923', '1645164923');
INSERT INTO `ea_system_node` VALUES ('792', 'site.brand_config_title/delete', '删除', '2', '1', '1645164923', '1645164923');
INSERT INTO `ea_system_node` VALUES ('793', 'site.brand_config_title/export', '导出', '2', '1', '1645164923', '1645164923');
INSERT INTO `ea_system_node` VALUES ('794', 'site.brand_config_title/modify', '属性修改', '2', '1', '1645164923', '1645164923');
INSERT INTO `ea_system_node` VALUES ('795', 'site.brand_content2', 'site_brand_content2', '1', '1', '1645164923', '1645164923');
INSERT INTO `ea_system_node` VALUES ('796', 'site.brand_content2/index', '列表', '2', '1', '1645164923', '1645164923');
INSERT INTO `ea_system_node` VALUES ('797', 'site.brand_content2/add', '添加', '2', '1', '1645164923', '1645164923');
INSERT INTO `ea_system_node` VALUES ('798', 'site.brand_content2/edit', '编辑', '2', '1', '1645164923', '1645164923');
INSERT INTO `ea_system_node` VALUES ('799', 'site.brand_content2/delete', '删除', '2', '1', '1645164923', '1645164923');
INSERT INTO `ea_system_node` VALUES ('800', 'site.brand_content2/export', '导出', '2', '1', '1645164923', '1645164923');
INSERT INTO `ea_system_node` VALUES ('801', 'site.brand_content2/modify', '属性修改', '2', '1', '1645164923', '1645164923');
INSERT INTO `ea_system_node` VALUES ('802', 'site.brand_content2_title', 'site_brand_content2_title', '1', '1', '1645164924', '1645164924');
INSERT INTO `ea_system_node` VALUES ('803', 'site.brand_content2_title/index', '列表', '2', '1', '1645164924', '1645164924');
INSERT INTO `ea_system_node` VALUES ('804', 'site.brand_content2_title/save', '保存', '2', '1', '1645164924', '1645164924');
INSERT INTO `ea_system_node` VALUES ('805', 'site.brand_content2_title/add', '添加', '2', '1', '1645164924', '1645164924');
INSERT INTO `ea_system_node` VALUES ('806', 'site.brand_content2_title/edit', '编辑', '2', '1', '1645164924', '1645164924');
INSERT INTO `ea_system_node` VALUES ('807', 'site.brand_content2_title/delete', '删除', '2', '1', '1645164924', '1645164924');
INSERT INTO `ea_system_node` VALUES ('808', 'site.brand_content2_title/export', '导出', '2', '1', '1645164924', '1645164924');
INSERT INTO `ea_system_node` VALUES ('809', 'site.brand_content2_title/modify', '属性修改', '2', '1', '1645164924', '1645164924');
INSERT INTO `ea_system_node` VALUES ('810', 'site.brand_content6', 'site_brand_content6', '1', '1', '1645164924', '1645164924');
INSERT INTO `ea_system_node` VALUES ('811', 'site.brand_content6/index', '列表', '2', '1', '1645164924', '1645164924');
INSERT INTO `ea_system_node` VALUES ('812', 'site.brand_content6/add', '添加', '2', '1', '1645164924', '1645164924');
INSERT INTO `ea_system_node` VALUES ('813', 'site.brand_content6/edit', '编辑', '2', '1', '1645164924', '1645164924');
INSERT INTO `ea_system_node` VALUES ('814', 'site.brand_content6/delete', '删除', '2', '1', '1645164924', '1645164924');
INSERT INTO `ea_system_node` VALUES ('815', 'site.brand_content6/export', '导出', '2', '1', '1645164924', '1645164924');
INSERT INTO `ea_system_node` VALUES ('816', 'site.brand_content6/modify', '属性修改', '2', '1', '1645164924', '1645164924');
INSERT INTO `ea_system_node` VALUES ('817', 'site.brand_content6_title', 'site_brand_content6_title', '1', '1', '1645164924', '1645164924');
INSERT INTO `ea_system_node` VALUES ('818', 'site.brand_content6_title/index', '列表', '2', '1', '1645164924', '1645164924');
INSERT INTO `ea_system_node` VALUES ('819', 'site.brand_content6_title/save', '保存', '2', '1', '1645164925', '1645164925');
INSERT INTO `ea_system_node` VALUES ('820', 'site.brand_content6_title/add', '添加', '2', '1', '1645164925', '1645164925');
INSERT INTO `ea_system_node` VALUES ('821', 'site.brand_content6_title/edit', '编辑', '2', '1', '1645164925', '1645164925');
INSERT INTO `ea_system_node` VALUES ('822', 'site.brand_content6_title/delete', '删除', '2', '1', '1645164925', '1645164925');
INSERT INTO `ea_system_node` VALUES ('823', 'site.brand_content6_title/export', '导出', '2', '1', '1645164925', '1645164925');
INSERT INTO `ea_system_node` VALUES ('824', 'site.brand_content6_title/modify', '属性修改', '2', '1', '1645164925', '1645164925');
INSERT INTO `ea_system_node` VALUES ('825', 'site.brand_content8', 'site_brand_content8', '1', '1', '1645164925', '1645164925');
INSERT INTO `ea_system_node` VALUES ('826', 'site.brand_content8/index', '列表', '2', '1', '1645164925', '1645164925');
INSERT INTO `ea_system_node` VALUES ('827', 'site.brand_content8/add', '添加', '2', '1', '1645164925', '1645164925');
INSERT INTO `ea_system_node` VALUES ('828', 'site.brand_content8/edit', '编辑', '2', '1', '1645164925', '1645164925');
INSERT INTO `ea_system_node` VALUES ('829', 'site.brand_content8/delete', '删除', '2', '1', '1645164925', '1645164925');
INSERT INTO `ea_system_node` VALUES ('830', 'site.brand_content8/export', '导出', '2', '1', '1645164925', '1645164925');
INSERT INTO `ea_system_node` VALUES ('831', 'site.brand_content8/modify', '属性修改', '2', '1', '1645164925', '1645164925');
INSERT INTO `ea_system_node` VALUES ('832', 'site.brand_content8_title', 'site_brand_content8_title', '1', '1', '1645164925', '1645164925');
INSERT INTO `ea_system_node` VALUES ('833', 'site.brand_content8_title/index', '列表', '2', '1', '1645164925', '1645164925');
INSERT INTO `ea_system_node` VALUES ('834', 'site.brand_content8_title/save', '保存', '2', '1', '1645164925', '1645164925');
INSERT INTO `ea_system_node` VALUES ('835', 'site.brand_content8_title/add', '添加', '2', '1', '1645164926', '1645164926');
INSERT INTO `ea_system_node` VALUES ('836', 'site.brand_content8_title/edit', '编辑', '2', '1', '1645164926', '1645164926');
INSERT INTO `ea_system_node` VALUES ('837', 'site.brand_content8_title/delete', '删除', '2', '1', '1645164926', '1645164926');
INSERT INTO `ea_system_node` VALUES ('838', 'site.brand_content8_title/export', '导出', '2', '1', '1645164926', '1645164926');
INSERT INTO `ea_system_node` VALUES ('839', 'site.brand_content8_title/modify', '属性修改', '2', '1', '1645164926', '1645164926');
INSERT INTO `ea_system_node` VALUES ('840', 'site.brand_demand', 'site_brand_demand', '1', '1', '1645164926', '1645164926');
INSERT INTO `ea_system_node` VALUES ('841', 'site.brand_demand/index', '列表', '2', '1', '1645164926', '1645164926');
INSERT INTO `ea_system_node` VALUES ('842', 'site.brand_demand/add', '添加', '2', '1', '1645164926', '1645164926');
INSERT INTO `ea_system_node` VALUES ('843', 'site.brand_demand/edit', '编辑', '2', '1', '1645164926', '1645164926');
INSERT INTO `ea_system_node` VALUES ('844', 'site.brand_demand/delete', '删除', '2', '1', '1645164926', '1645164926');
INSERT INTO `ea_system_node` VALUES ('845', 'site.brand_demand/export', '导出', '2', '1', '1645164926', '1645164926');
INSERT INTO `ea_system_node` VALUES ('846', 'site.brand_demand/modify', '属性修改', '2', '1', '1645164926', '1645164926');
INSERT INTO `ea_system_node` VALUES ('847', 'site.brand_demand_title', 'site_brand_demand_title', '1', '1', '1645164926', '1645164926');
INSERT INTO `ea_system_node` VALUES ('848', 'site.brand_demand_title/index', '列表', '2', '1', '1645164926', '1645164926');
INSERT INTO `ea_system_node` VALUES ('849', 'site.brand_demand_title/save', '保存', '2', '1', '1645164927', '1645164927');
INSERT INTO `ea_system_node` VALUES ('850', 'site.brand_demand_title/add', '添加', '2', '1', '1645164927', '1645164927');
INSERT INTO `ea_system_node` VALUES ('851', 'site.brand_demand_title/edit', '编辑', '2', '1', '1645164927', '1645164927');
INSERT INTO `ea_system_node` VALUES ('852', 'site.brand_demand_title/delete', '删除', '2', '1', '1645164927', '1645164927');
INSERT INTO `ea_system_node` VALUES ('853', 'site.brand_demand_title/export', '导出', '2', '1', '1645164927', '1645164927');
INSERT INTO `ea_system_node` VALUES ('854', 'site.brand_demand_title/modify', '属性修改', '2', '1', '1645164927', '1645164927');
INSERT INTO `ea_system_node` VALUES ('855', 'site.brand_flow', 'site_brand_flow', '1', '1', '1645164927', '1645164927');
INSERT INTO `ea_system_node` VALUES ('856', 'site.brand_flow/index', '列表', '2', '1', '1645164927', '1645164927');
INSERT INTO `ea_system_node` VALUES ('857', 'site.brand_flow/add', '添加', '2', '1', '1645164927', '1645164927');
INSERT INTO `ea_system_node` VALUES ('858', 'site.brand_flow/edit', '编辑', '2', '1', '1645164927', '1645164927');
INSERT INTO `ea_system_node` VALUES ('859', 'site.brand_flow/delete', '删除', '2', '1', '1645164927', '1645164927');
INSERT INTO `ea_system_node` VALUES ('860', 'site.brand_flow/export', '导出', '2', '1', '1645164927', '1645164927');
INSERT INTO `ea_system_node` VALUES ('861', 'site.brand_flow/modify', '属性修改', '2', '1', '1645164927', '1645164927');
INSERT INTO `ea_system_node` VALUES ('862', 'site.brand_flow_title', 'site_brand_flow_title', '1', '1', '1645164927', '1645164927');
INSERT INTO `ea_system_node` VALUES ('863', 'site.brand_flow_title/index', '列表', '2', '1', '1645164927', '1645164927');
INSERT INTO `ea_system_node` VALUES ('864', 'site.brand_flow_title/save', '保存', '2', '1', '1645164927', '1645164927');
INSERT INTO `ea_system_node` VALUES ('865', 'site.brand_flow_title/add', '添加', '2', '1', '1645164928', '1645164928');
INSERT INTO `ea_system_node` VALUES ('866', 'site.brand_flow_title/edit', '编辑', '2', '1', '1645164928', '1645164928');
INSERT INTO `ea_system_node` VALUES ('867', 'site.brand_flow_title/delete', '删除', '2', '1', '1645164928', '1645164928');
INSERT INTO `ea_system_node` VALUES ('868', 'site.brand_flow_title/export', '导出', '2', '1', '1645164928', '1645164928');
INSERT INTO `ea_system_node` VALUES ('869', 'site.brand_flow_title/modify', '属性修改', '2', '1', '1645164928', '1645164928');
INSERT INTO `ea_system_node` VALUES ('870', 'site.brand_point', 'site_brand_point', '1', '1', '1645164928', '1645164928');
INSERT INTO `ea_system_node` VALUES ('871', 'site.brand_point/index', '列表', '2', '1', '1645164928', '1645164928');
INSERT INTO `ea_system_node` VALUES ('872', 'site.brand_point/add', '添加', '2', '1', '1645164928', '1645164928');
INSERT INTO `ea_system_node` VALUES ('873', 'site.brand_point/edit', '编辑', '2', '1', '1645164928', '1645164928');
INSERT INTO `ea_system_node` VALUES ('874', 'site.brand_point/delete', '删除', '2', '1', '1645164928', '1645164928');
INSERT INTO `ea_system_node` VALUES ('875', 'site.brand_point/export', '导出', '2', '1', '1645164928', '1645164928');
INSERT INTO `ea_system_node` VALUES ('876', 'site.brand_point/modify', '属性修改', '2', '1', '1645164928', '1645164928');
INSERT INTO `ea_system_node` VALUES ('877', 'site.brand_point_title', 'site_brand_point_title', '1', '1', '1645164928', '1645164928');
INSERT INTO `ea_system_node` VALUES ('878', 'site.brand_point_title/index', '列表', '2', '1', '1645164928', '1645164928');
INSERT INTO `ea_system_node` VALUES ('879', 'site.brand_point_title/save', '保存', '2', '1', '1645164928', '1645164928');
INSERT INTO `ea_system_node` VALUES ('880', 'site.brand_point_title/add', '添加', '2', '1', '1645164928', '1645164928');
INSERT INTO `ea_system_node` VALUES ('881', 'site.brand_point_title/edit', '编辑', '2', '1', '1645164928', '1645164928');
INSERT INTO `ea_system_node` VALUES ('882', 'site.brand_point_title/delete', '删除', '2', '1', '1645164928', '1645164928');
INSERT INTO `ea_system_node` VALUES ('883', 'site.brand_point_title/export', '导出', '2', '1', '1645164929', '1645164929');
INSERT INTO `ea_system_node` VALUES ('884', 'site.brand_point_title/modify', '属性修改', '2', '1', '1645164929', '1645164929');
INSERT INTO `ea_system_node` VALUES ('885', 'site.brand_scheme', 'site_brand_scheme', '1', '1', '1645164929', '1645164929');
INSERT INTO `ea_system_node` VALUES ('886', 'site.brand_scheme/index', '列表', '2', '1', '1645164929', '1645164929');
INSERT INTO `ea_system_node` VALUES ('887', 'site.brand_scheme/add', '添加', '2', '1', '1645164929', '1645164929');
INSERT INTO `ea_system_node` VALUES ('888', 'site.brand_scheme/edit', '编辑', '2', '1', '1645164929', '1645164929');
INSERT INTO `ea_system_node` VALUES ('889', 'site.brand_scheme/delete', '删除', '2', '1', '1645164929', '1645164929');
INSERT INTO `ea_system_node` VALUES ('890', 'site.brand_scheme/export', '导出', '2', '1', '1645164929', '1645164929');
INSERT INTO `ea_system_node` VALUES ('891', 'site.brand_scheme/modify', '属性修改', '2', '1', '1645164929', '1645164929');
INSERT INTO `ea_system_node` VALUES ('892', 'site.brand_scheme_title', 'site_brand_scheme_title', '1', '1', '1645164929', '1645164929');
INSERT INTO `ea_system_node` VALUES ('893', 'site.brand_scheme_title/index', '列表', '2', '1', '1645164929', '1645164929');
INSERT INTO `ea_system_node` VALUES ('894', 'site.brand_scheme_title/save', '保存', '2', '1', '1645164929', '1645164929');
INSERT INTO `ea_system_node` VALUES ('895', 'site.brand_scheme_title/add', '添加', '2', '1', '1645164929', '1645164929');
INSERT INTO `ea_system_node` VALUES ('896', 'site.brand_scheme_title/edit', '编辑', '2', '1', '1645164929', '1645164929');
INSERT INTO `ea_system_node` VALUES ('897', 'site.brand_scheme_title/delete', '删除', '2', '1', '1645164930', '1645164930');
INSERT INTO `ea_system_node` VALUES ('898', 'site.brand_scheme_title/export', '导出', '2', '1', '1645164930', '1645164930');
INSERT INTO `ea_system_node` VALUES ('899', 'site.brand_scheme_title/modify', '属性修改', '2', '1', '1645164930', '1645164930');
INSERT INTO `ea_system_node` VALUES ('900', 'site.case_cate', 'site_case_cate', '1', '1', '1645164930', '1645164930');
INSERT INTO `ea_system_node` VALUES ('901', 'site.case_cate/index', '列表', '2', '1', '1645164930', '1645164930');
INSERT INTO `ea_system_node` VALUES ('902', 'site.case_cate/add', '添加', '2', '1', '1645164930', '1645164930');
INSERT INTO `ea_system_node` VALUES ('903', 'site.case_cate/edit', '编辑', '2', '1', '1645164930', '1645164930');
INSERT INTO `ea_system_node` VALUES ('904', 'site.case_cate/delete', '删除', '2', '1', '1645164930', '1645164930');
INSERT INTO `ea_system_node` VALUES ('905', 'site.case_cate/export', '导出', '2', '1', '1645164930', '1645164930');
INSERT INTO `ea_system_node` VALUES ('906', 'site.case_cate/modify', '属性修改', '2', '1', '1645164930', '1645164930');
INSERT INTO `ea_system_node` VALUES ('907', 'site.case_detail', 'site_case_detail', '1', '1', '1645164930', '1645164930');
INSERT INTO `ea_system_node` VALUES ('908', 'site.case_detail/index', '列表', '2', '1', '1645164930', '1645164930');
INSERT INTO `ea_system_node` VALUES ('909', 'site.case_detail/add', '添加', '2', '1', '1645164930', '1645164930');
INSERT INTO `ea_system_node` VALUES ('910', 'site.case_detail/edit', '编辑', '2', '1', '1645164930', '1645164930');
INSERT INTO `ea_system_node` VALUES ('911', 'site.case_detail/delete', '删除', '2', '1', '1645164930', '1645164930');
INSERT INTO `ea_system_node` VALUES ('912', 'site.case_detail/export', '导出', '2', '1', '1645164930', '1645164930');
INSERT INTO `ea_system_node` VALUES ('913', 'site.case_detail/modify', '属性修改', '2', '1', '1645164930', '1645164930');
INSERT INTO `ea_system_node` VALUES ('914', 'site.case_products', 'site_case_products', '1', '1', '1645164931', '1645164931');
INSERT INTO `ea_system_node` VALUES ('915', 'site.case_products/index', '列表', '2', '1', '1645164931', '1645164931');
INSERT INTO `ea_system_node` VALUES ('916', 'site.case_products/add', '添加', '2', '1', '1645164931', '1645164931');
INSERT INTO `ea_system_node` VALUES ('917', 'site.case_products/edit', '编辑', '2', '1', '1645164931', '1645164931');
INSERT INTO `ea_system_node` VALUES ('918', 'site.case_products/delete', '删除', '2', '1', '1645164931', '1645164931');
INSERT INTO `ea_system_node` VALUES ('919', 'site.case_products/export', '导出', '2', '1', '1645164931', '1645164931');
INSERT INTO `ea_system_node` VALUES ('920', 'site.case_products/modify', '属性修改', '2', '1', '1645164931', '1645164931');
INSERT INTO `ea_system_node` VALUES ('921', 'site.config_bottom1', 'site_config_bottom1', '1', '1', '1645164931', '1645164931');
INSERT INTO `ea_system_node` VALUES ('922', 'site.config_bottom1/index', '列表', '2', '1', '1645164931', '1645164931');
INSERT INTO `ea_system_node` VALUES ('923', 'site.config_bottom1/save', '保存', '2', '1', '1645164931', '1645164931');
INSERT INTO `ea_system_node` VALUES ('924', 'site.config_bottom1/add', '添加', '2', '1', '1645164931', '1645164931');
INSERT INTO `ea_system_node` VALUES ('925', 'site.config_bottom1/edit', '编辑', '2', '1', '1645164931', '1645164931');
INSERT INTO `ea_system_node` VALUES ('926', 'site.config_bottom1/delete', '删除', '2', '1', '1645164931', '1645164931');
INSERT INTO `ea_system_node` VALUES ('927', 'site.config_bottom1/export', '导出', '2', '1', '1645164931', '1645164931');
INSERT INTO `ea_system_node` VALUES ('928', 'site.config_bottom1/modify', '属性修改', '2', '1', '1645164931', '1645164931');
INSERT INTO `ea_system_node` VALUES ('929', 'site.config_link', 'site_config_link', '1', '1', '1645164931', '1645164931');
INSERT INTO `ea_system_node` VALUES ('930', 'site.config_link/index', '列表', '2', '1', '1645164931', '1645164931');
INSERT INTO `ea_system_node` VALUES ('931', 'site.config_link/add', '添加', '2', '1', '1645164932', '1645164932');
INSERT INTO `ea_system_node` VALUES ('932', 'site.config_link/edit', '编辑', '2', '1', '1645164932', '1645164932');
INSERT INTO `ea_system_node` VALUES ('933', 'site.config_link/delete', '删除', '2', '1', '1645164932', '1645164932');
INSERT INTO `ea_system_node` VALUES ('934', 'site.config_link/export', '导出', '2', '1', '1645164932', '1645164932');
INSERT INTO `ea_system_node` VALUES ('935', 'site.config_link/modify', '属性修改', '2', '1', '1645164932', '1645164932');
INSERT INTO `ea_system_node` VALUES ('936', 'site.config_mix', 'site_config_mix', '1', '1', '1645164932', '1645164932');
INSERT INTO `ea_system_node` VALUES ('937', 'site.config_mix/index', '列表', '2', '1', '1645164932', '1645164932');
INSERT INTO `ea_system_node` VALUES ('938', 'site.config_mix/save', '保存', '2', '1', '1645164932', '1645164932');
INSERT INTO `ea_system_node` VALUES ('939', 'site.config_mix/add', '添加', '2', '1', '1645164932', '1645164932');
INSERT INTO `ea_system_node` VALUES ('940', 'site.config_mix/edit', '编辑', '2', '1', '1645164932', '1645164932');
INSERT INTO `ea_system_node` VALUES ('941', 'site.config_mix/delete', '删除', '2', '1', '1645164932', '1645164932');
INSERT INTO `ea_system_node` VALUES ('942', 'site.config_mix/export', '导出', '2', '1', '1645164932', '1645164932');
INSERT INTO `ea_system_node` VALUES ('943', 'site.config_mix/modify', '属性修改', '2', '1', '1645164932', '1645164932');
INSERT INTO `ea_system_node` VALUES ('944', 'site.config_qr_code', 'site_config_qr_code', '1', '1', '1645164932', '1645164932');
INSERT INTO `ea_system_node` VALUES ('945', 'site.config_qr_code/index', '列表', '2', '1', '1645164932', '1645164932');
INSERT INTO `ea_system_node` VALUES ('946', 'site.config_qr_code/add', '添加', '2', '1', '1645164932', '1645164932');
INSERT INTO `ea_system_node` VALUES ('947', 'site.config_qr_code/edit', '编辑', '2', '1', '1645164932', '1645164932');
INSERT INTO `ea_system_node` VALUES ('948', 'site.config_qr_code/delete', '删除', '2', '1', '1645164932', '1645164932');
INSERT INTO `ea_system_node` VALUES ('949', 'site.config_qr_code/export', '导出', '2', '1', '1645164933', '1645164933');
INSERT INTO `ea_system_node` VALUES ('950', 'site.config_qr_code/modify', '属性修改', '2', '1', '1645164933', '1645164933');
INSERT INTO `ea_system_node` VALUES ('951', 'site.config_top', 'site_config_top', '1', '1', '1645164933', '1645164933');
INSERT INTO `ea_system_node` VALUES ('952', 'site.config_top/index', '列表', '2', '1', '1645164933', '1645164933');
INSERT INTO `ea_system_node` VALUES ('953', 'site.config_top/add', '添加', '2', '1', '1645164933', '1645164933');
INSERT INTO `ea_system_node` VALUES ('954', 'site.config_top/edit', '编辑', '2', '1', '1645164933', '1645164933');
INSERT INTO `ea_system_node` VALUES ('955', 'site.config_top/delete', '删除', '2', '1', '1645164933', '1645164933');
INSERT INTO `ea_system_node` VALUES ('956', 'site.config_top/export', '导出', '2', '1', '1645164933', '1645164933');
INSERT INTO `ea_system_node` VALUES ('957', 'site.config_top/modify', '属性修改', '2', '1', '1645164933', '1645164933');
INSERT INTO `ea_system_node` VALUES ('958', 'site.cons_content4', 'site_cons_content4', '1', '1', '1645164933', '1645164933');
INSERT INTO `ea_system_node` VALUES ('959', 'site.cons_content4/index', '列表', '2', '1', '1645164933', '1645164933');
INSERT INTO `ea_system_node` VALUES ('960', 'site.cons_content4/add', '添加', '2', '1', '1645164933', '1645164933');
INSERT INTO `ea_system_node` VALUES ('961', 'site.cons_content4/edit', '编辑', '2', '1', '1645164933', '1645164933');
INSERT INTO `ea_system_node` VALUES ('962', 'site.cons_content4/delete', '删除', '2', '1', '1645164933', '1645164933');
INSERT INTO `ea_system_node` VALUES ('963', 'site.cons_content4/export', '导出', '2', '1', '1645164933', '1645164933');
INSERT INTO `ea_system_node` VALUES ('964', 'site.cons_content4/modify', '属性修改', '2', '1', '1645164933', '1645164933');
INSERT INTO `ea_system_node` VALUES ('965', 'site.cons_content4_title', 'site_cons_content4_title', '1', '1', '1645164933', '1645164933');
INSERT INTO `ea_system_node` VALUES ('966', 'site.cons_content4_title/index', '列表', '2', '1', '1645164934', '1645164934');
INSERT INTO `ea_system_node` VALUES ('967', 'site.cons_content4_title/save', '保存', '2', '1', '1645164934', '1645164934');
INSERT INTO `ea_system_node` VALUES ('968', 'site.cons_content4_title/add', '添加', '2', '1', '1645164934', '1645164934');
INSERT INTO `ea_system_node` VALUES ('969', 'site.cons_content4_title/edit', '编辑', '2', '1', '1645164934', '1645164934');
INSERT INTO `ea_system_node` VALUES ('970', 'site.cons_content4_title/delete', '删除', '2', '1', '1645164934', '1645164934');
INSERT INTO `ea_system_node` VALUES ('971', 'site.cons_content4_title/export', '导出', '2', '1', '1645164934', '1645164934');
INSERT INTO `ea_system_node` VALUES ('972', 'site.cons_content4_title/modify', '属性修改', '2', '1', '1645164934', '1645164934');
INSERT INTO `ea_system_node` VALUES ('973', 'site.cons_content5', 'site_cons_content5', '1', '1', '1645164934', '1645164934');
INSERT INTO `ea_system_node` VALUES ('974', 'site.cons_content5/index', '列表', '2', '1', '1645164934', '1645164934');
INSERT INTO `ea_system_node` VALUES ('975', 'site.cons_content5/add', '添加', '2', '1', '1645164934', '1645164934');
INSERT INTO `ea_system_node` VALUES ('976', 'site.cons_content5/edit', '编辑', '2', '1', '1645164934', '1645164934');
INSERT INTO `ea_system_node` VALUES ('977', 'site.cons_content5/delete', '删除', '2', '1', '1645164934', '1645164934');
INSERT INTO `ea_system_node` VALUES ('978', 'site.cons_content5/export', '导出', '2', '1', '1645164934', '1645164934');
INSERT INTO `ea_system_node` VALUES ('979', 'site.cons_content5/modify', '属性修改', '2', '1', '1645164934', '1645164934');
INSERT INTO `ea_system_node` VALUES ('980', 'site.cons_content5_title', 'site_cons_content5_title', '1', '1', '1645164934', '1645164934');
INSERT INTO `ea_system_node` VALUES ('981', 'site.cons_content5_title/index', '列表', '2', '1', '1645164934', '1645164934');
INSERT INTO `ea_system_node` VALUES ('982', 'site.cons_content5_title/save', '保存', '2', '1', '1645164934', '1645164934');
INSERT INTO `ea_system_node` VALUES ('983', 'site.cons_content5_title/add', '添加', '2', '1', '1645164934', '1645164934');
INSERT INTO `ea_system_node` VALUES ('984', 'site.cons_content5_title/edit', '编辑', '2', '1', '1645164935', '1645164935');
INSERT INTO `ea_system_node` VALUES ('985', 'site.cons_content5_title/delete', '删除', '2', '1', '1645164935', '1645164935');
INSERT INTO `ea_system_node` VALUES ('986', 'site.cons_content5_title/export', '导出', '2', '1', '1645164935', '1645164935');
INSERT INTO `ea_system_node` VALUES ('987', 'site.cons_content5_title/modify', '属性修改', '2', '1', '1645164935', '1645164935');
INSERT INTO `ea_system_node` VALUES ('988', 'site.cons_service_content', 'site_cons_service_content', '1', '1', '1645164935', '1645164935');
INSERT INTO `ea_system_node` VALUES ('989', 'site.cons_service_content/index', '列表', '2', '1', '1645164935', '1645164935');
INSERT INTO `ea_system_node` VALUES ('990', 'site.cons_service_content/add', '添加', '2', '1', '1645164935', '1645164935');
INSERT INTO `ea_system_node` VALUES ('991', 'site.cons_service_content/edit', '编辑', '2', '1', '1645164935', '1645164935');
INSERT INTO `ea_system_node` VALUES ('992', 'site.cons_service_content/delete', '删除', '2', '1', '1645164935', '1645164935');
INSERT INTO `ea_system_node` VALUES ('993', 'site.cons_service_content/export', '导出', '2', '1', '1645164935', '1645164935');
INSERT INTO `ea_system_node` VALUES ('994', 'site.cons_service_content/modify', '属性修改', '2', '1', '1645164935', '1645164935');
INSERT INTO `ea_system_node` VALUES ('995', 'site.cons_service_content_title', 'site_cons_service_content_title', '1', '1', '1645164935', '1645164935');
INSERT INTO `ea_system_node` VALUES ('996', 'site.cons_service_content_title/index', '列表', '2', '1', '1645164935', '1645164935');
INSERT INTO `ea_system_node` VALUES ('997', 'site.cons_service_content_title/save', '保存', '2', '1', '1645164935', '1645164935');
INSERT INTO `ea_system_node` VALUES ('998', 'site.cons_service_content_title/add', '添加', '2', '1', '1645164935', '1645164935');
INSERT INTO `ea_system_node` VALUES ('999', 'site.cons_service_content_title/edit', '编辑', '2', '1', '1645164935', '1645164935');
INSERT INTO `ea_system_node` VALUES ('1000', 'site.cons_service_content_title/delete', '删除', '2', '1', '1645164935', '1645164935');
INSERT INTO `ea_system_node` VALUES ('1001', 'site.cons_service_content_title/export', '导出', '2', '1', '1645164936', '1645164936');
INSERT INTO `ea_system_node` VALUES ('1002', 'site.cons_service_content_title/modify', '属性修改', '2', '1', '1645164936', '1645164936');
INSERT INTO `ea_system_node` VALUES ('1003', 'site.cons_service_title', 'site_cons_service_title', '1', '1', '1645164936', '1645164936');
INSERT INTO `ea_system_node` VALUES ('1004', 'site.cons_service_title/index', '列表', '2', '1', '1645164936', '1645164936');
INSERT INTO `ea_system_node` VALUES ('1005', 'site.cons_service_title/add', '添加', '2', '1', '1645164936', '1645164936');
INSERT INTO `ea_system_node` VALUES ('1006', 'site.cons_service_title/edit', '编辑', '2', '1', '1645164936', '1645164936');
INSERT INTO `ea_system_node` VALUES ('1007', 'site.cons_service_title/delete', '删除', '2', '1', '1645164936', '1645164936');
INSERT INTO `ea_system_node` VALUES ('1008', 'site.cons_service_title/export', '导出', '2', '1', '1645164936', '1645164936');
INSERT INTO `ea_system_node` VALUES ('1009', 'site.cons_service_title/modify', '属性修改', '2', '1', '1645164936', '1645164936');
INSERT INTO `ea_system_node` VALUES ('1010', 'site.index_content1', 'site_index_content1', '1', '1', '1645164936', '1645164936');
INSERT INTO `ea_system_node` VALUES ('1011', 'site.index_content1/index', '列表', '2', '1', '1645164936', '1645164936');
INSERT INTO `ea_system_node` VALUES ('1012', 'site.index_content1/add', '添加', '2', '1', '1645164936', '1645164936');
INSERT INTO `ea_system_node` VALUES ('1013', 'site.index_content1/edit', '编辑', '2', '1', '1645164936', '1645164936');
INSERT INTO `ea_system_node` VALUES ('1014', 'site.index_content1/delete', '删除', '2', '1', '1645164936', '1645164936');
INSERT INTO `ea_system_node` VALUES ('1015', 'site.index_content1/export', '导出', '2', '1', '1645164936', '1645164936');
INSERT INTO `ea_system_node` VALUES ('1016', 'site.index_content1/modify', '属性修改', '2', '1', '1645164936', '1645164936');
INSERT INTO `ea_system_node` VALUES ('1017', 'site.index_content1_title', 'site_index_content1_title', '1', '1', '1645164936', '1645164936');
INSERT INTO `ea_system_node` VALUES ('1018', 'site.index_content1_title/index', '列表', '2', '1', '1645164937', '1645164937');
INSERT INTO `ea_system_node` VALUES ('1019', 'site.index_content1_title/save', '保存', '2', '1', '1645164937', '1645164937');
INSERT INTO `ea_system_node` VALUES ('1020', 'site.index_content1_title/add', '添加', '2', '1', '1645164937', '1645164937');
INSERT INTO `ea_system_node` VALUES ('1021', 'site.index_content1_title/edit', '编辑', '2', '1', '1645164937', '1645164937');
INSERT INTO `ea_system_node` VALUES ('1022', 'site.index_content1_title/delete', '删除', '2', '1', '1645164937', '1645164937');
INSERT INTO `ea_system_node` VALUES ('1023', 'site.index_content1_title/export', '导出', '2', '1', '1645164937', '1645164937');
INSERT INTO `ea_system_node` VALUES ('1024', 'site.index_content1_title/modify', '属性修改', '2', '1', '1645164937', '1645164937');
INSERT INTO `ea_system_node` VALUES ('1025', 'site.index_content2', 'site_index_content2', '1', '1', '1645164937', '1645164937');
INSERT INTO `ea_system_node` VALUES ('1026', 'site.index_content2/index', '列表', '2', '1', '1645164937', '1645164937');
INSERT INTO `ea_system_node` VALUES ('1027', 'site.index_content2/add', '添加', '2', '1', '1645164937', '1645164937');
INSERT INTO `ea_system_node` VALUES ('1028', 'site.index_content2/edit', '编辑', '2', '1', '1645164937', '1645164937');
INSERT INTO `ea_system_node` VALUES ('1029', 'site.index_content2/delete', '删除', '2', '1', '1645164937', '1645164937');
INSERT INTO `ea_system_node` VALUES ('1030', 'site.index_content2/export', '导出', '2', '1', '1645164937', '1645164937');
INSERT INTO `ea_system_node` VALUES ('1031', 'site.index_content2/modify', '属性修改', '2', '1', '1645164937', '1645164937');
INSERT INTO `ea_system_node` VALUES ('1032', 'site.index_content2_bottom', 'site_index_content2_bottom', '1', '1', '1645164937', '1645164937');
INSERT INTO `ea_system_node` VALUES ('1033', 'site.index_content2_bottom/index', '列表', '2', '1', '1645164937', '1645164937');
INSERT INTO `ea_system_node` VALUES ('1034', 'site.index_content2_bottom/add', '添加', '2', '1', '1645164937', '1645164937');
INSERT INTO `ea_system_node` VALUES ('1035', 'site.index_content2_bottom/edit', '编辑', '2', '1', '1645164937', '1645164937');
INSERT INTO `ea_system_node` VALUES ('1036', 'site.index_content2_bottom/delete', '删除', '2', '1', '1645164938', '1645164938');
INSERT INTO `ea_system_node` VALUES ('1037', 'site.index_content2_bottom/export', '导出', '2', '1', '1645164938', '1645164938');
INSERT INTO `ea_system_node` VALUES ('1038', 'site.index_content2_bottom/modify', '属性修改', '2', '1', '1645164938', '1645164938');
INSERT INTO `ea_system_node` VALUES ('1039', 'site.index_content2_title', 'site_index_content2_title', '1', '1', '1645164938', '1645164938');
INSERT INTO `ea_system_node` VALUES ('1040', 'site.index_content2_title/index', '列表', '2', '1', '1645164938', '1645164938');
INSERT INTO `ea_system_node` VALUES ('1041', 'site.index_content2_title/save', '保存', '2', '1', '1645164938', '1645164938');
INSERT INTO `ea_system_node` VALUES ('1042', 'site.index_content2_title/add', '添加', '2', '1', '1645164938', '1645164938');
INSERT INTO `ea_system_node` VALUES ('1043', 'site.index_content2_title/edit', '编辑', '2', '1', '1645164938', '1645164938');
INSERT INTO `ea_system_node` VALUES ('1044', 'site.index_content2_title/delete', '删除', '2', '1', '1645164938', '1645164938');
INSERT INTO `ea_system_node` VALUES ('1045', 'site.index_content2_title/export', '导出', '2', '1', '1645164938', '1645164938');
INSERT INTO `ea_system_node` VALUES ('1046', 'site.index_content2_title/modify', '属性修改', '2', '1', '1645164938', '1645164938');
INSERT INTO `ea_system_node` VALUES ('1047', 'site.index_content3', 'site_index_content3', '1', '1', '1645164938', '1645164938');
INSERT INTO `ea_system_node` VALUES ('1048', 'site.index_content3/index', '列表', '2', '1', '1645164938', '1645164938');
INSERT INTO `ea_system_node` VALUES ('1049', 'site.index_content3/add', '添加', '2', '1', '1645164938', '1645164938');
INSERT INTO `ea_system_node` VALUES ('1050', 'site.index_content3/edit', '编辑', '2', '1', '1645164938', '1645164938');
INSERT INTO `ea_system_node` VALUES ('1051', 'site.index_content3/delete', '删除', '2', '1', '1645164938', '1645164938');
INSERT INTO `ea_system_node` VALUES ('1052', 'site.index_content3/export', '导出', '2', '1', '1645164938', '1645164938');
INSERT INTO `ea_system_node` VALUES ('1053', 'site.index_content3/modify', '属性修改', '2', '1', '1645164939', '1645164939');
INSERT INTO `ea_system_node` VALUES ('1054', 'site.index_content3_title', 'site_index_content3_title', '1', '1', '1645164939', '1645164939');
INSERT INTO `ea_system_node` VALUES ('1055', 'site.index_content3_title/index', '列表', '2', '1', '1645164939', '1645164939');
INSERT INTO `ea_system_node` VALUES ('1056', 'site.index_content3_title/save', '保存', '2', '1', '1645164939', '1645164939');
INSERT INTO `ea_system_node` VALUES ('1057', 'site.index_content3_title/add', '添加', '2', '1', '1645164939', '1645164939');
INSERT INTO `ea_system_node` VALUES ('1058', 'site.index_content3_title/edit', '编辑', '2', '1', '1645164939', '1645164939');
INSERT INTO `ea_system_node` VALUES ('1059', 'site.index_content3_title/delete', '删除', '2', '1', '1645164939', '1645164939');
INSERT INTO `ea_system_node` VALUES ('1060', 'site.index_content3_title/export', '导出', '2', '1', '1645164939', '1645164939');
INSERT INTO `ea_system_node` VALUES ('1061', 'site.index_content3_title/modify', '属性修改', '2', '1', '1645164939', '1645164939');
INSERT INTO `ea_system_node` VALUES ('1062', 'site.innojet_content1', 'site_innojet_content1', '1', '1', '1645164939', '1645164939');
INSERT INTO `ea_system_node` VALUES ('1063', 'site.innojet_content1/index', '列表', '2', '1', '1645164939', '1645164939');
INSERT INTO `ea_system_node` VALUES ('1064', 'site.innojet_content1/add', '添加', '2', '1', '1645164939', '1645164939');
INSERT INTO `ea_system_node` VALUES ('1065', 'site.innojet_content1/edit', '编辑', '2', '1', '1645164939', '1645164939');
INSERT INTO `ea_system_node` VALUES ('1066', 'site.innojet_content1/delete', '删除', '2', '1', '1645164939', '1645164939');
INSERT INTO `ea_system_node` VALUES ('1067', 'site.innojet_content1/export', '导出', '2', '1', '1645164939', '1645164939');
INSERT INTO `ea_system_node` VALUES ('1068', 'site.innojet_content1/modify', '属性修改', '2', '1', '1645164939', '1645164939');
INSERT INTO `ea_system_node` VALUES ('1069', 'site.innojet_content1_title', 'site_innojet_content1_title', '1', '1', '1645164939', '1645164939');
INSERT INTO `ea_system_node` VALUES ('1070', 'site.innojet_content1_title/index', '列表', '2', '1', '1645164940', '1645164940');
INSERT INTO `ea_system_node` VALUES ('1071', 'site.innojet_content1_title/save', '保存', '2', '1', '1645164940', '1645164940');
INSERT INTO `ea_system_node` VALUES ('1072', 'site.innojet_content1_title/add', '添加', '2', '1', '1645164940', '1645164940');
INSERT INTO `ea_system_node` VALUES ('1073', 'site.innojet_content1_title/edit', '编辑', '2', '1', '1645164940', '1645164940');
INSERT INTO `ea_system_node` VALUES ('1074', 'site.innojet_content1_title/delete', '删除', '2', '1', '1645164940', '1645164940');
INSERT INTO `ea_system_node` VALUES ('1075', 'site.innojet_content1_title/export', '导出', '2', '1', '1645164940', '1645164940');
INSERT INTO `ea_system_node` VALUES ('1076', 'site.innojet_content1_title/modify', '属性修改', '2', '1', '1645164940', '1645164940');
INSERT INTO `ea_system_node` VALUES ('1077', 'site.innojet_content2', 'site_innojet_content2', '1', '1', '1645164940', '1645164940');
INSERT INTO `ea_system_node` VALUES ('1078', 'site.innojet_content2/index', '列表', '2', '1', '1645164940', '1645164940');
INSERT INTO `ea_system_node` VALUES ('1079', 'site.innojet_content2/add', '添加', '2', '1', '1645164940', '1645164940');
INSERT INTO `ea_system_node` VALUES ('1080', 'site.innojet_content2/edit', '编辑', '2', '1', '1645164940', '1645164940');
INSERT INTO `ea_system_node` VALUES ('1081', 'site.innojet_content2/delete', '删除', '2', '1', '1645164940', '1645164940');
INSERT INTO `ea_system_node` VALUES ('1082', 'site.innojet_content2/export', '导出', '2', '1', '1645164940', '1645164940');
INSERT INTO `ea_system_node` VALUES ('1083', 'site.innojet_content2/modify', '属性修改', '2', '1', '1645164940', '1645164940');
INSERT INTO `ea_system_node` VALUES ('1084', 'site.innojet_content2_title', 'site_innojet_content2_title', '1', '1', '1645164940', '1645164940');
INSERT INTO `ea_system_node` VALUES ('1085', 'site.innojet_content2_title/index', '列表', '2', '1', '1645164940', '1645164940');
INSERT INTO `ea_system_node` VALUES ('1086', 'site.innojet_content2_title/save', '保存', '2', '1', '1645164941', '1645164941');
INSERT INTO `ea_system_node` VALUES ('1087', 'site.innojet_content2_title/add', '添加', '2', '1', '1645164941', '1645164941');
INSERT INTO `ea_system_node` VALUES ('1088', 'site.innojet_content2_title/edit', '编辑', '2', '1', '1645164941', '1645164941');
INSERT INTO `ea_system_node` VALUES ('1089', 'site.innojet_content2_title/delete', '删除', '2', '1', '1645164941', '1645164941');
INSERT INTO `ea_system_node` VALUES ('1090', 'site.innojet_content2_title/export', '导出', '2', '1', '1645164941', '1645164941');
INSERT INTO `ea_system_node` VALUES ('1091', 'site.innojet_content2_title/modify', '属性修改', '2', '1', '1645164941', '1645164941');
INSERT INTO `ea_system_node` VALUES ('1092', 'site.innojet_content3', 'site_innojet_content3', '1', '1', '1645164941', '1645164941');
INSERT INTO `ea_system_node` VALUES ('1093', 'site.innojet_content3/index', '列表', '2', '1', '1645164941', '1645164941');
INSERT INTO `ea_system_node` VALUES ('1094', 'site.innojet_content3/add', '添加', '2', '1', '1645164941', '1645164941');
INSERT INTO `ea_system_node` VALUES ('1095', 'site.innojet_content3/edit', '编辑', '2', '1', '1645164941', '1645164941');
INSERT INTO `ea_system_node` VALUES ('1096', 'site.innojet_content3/delete', '删除', '2', '1', '1645164941', '1645164941');
INSERT INTO `ea_system_node` VALUES ('1097', 'site.innojet_content3/export', '导出', '2', '1', '1645164941', '1645164941');
INSERT INTO `ea_system_node` VALUES ('1098', 'site.innojet_content3/modify', '属性修改', '2', '1', '1645164941', '1645164941');
INSERT INTO `ea_system_node` VALUES ('1099', 'site.innojet_content3_title', 'site_innojet_content3_title', '1', '1', '1645164941', '1645164941');
INSERT INTO `ea_system_node` VALUES ('1100', 'site.innojet_content3_title/index', '列表', '2', '1', '1645164942', '1645164942');
INSERT INTO `ea_system_node` VALUES ('1101', 'site.innojet_content3_title/save', '保存', '2', '1', '1645164942', '1645164942');
INSERT INTO `ea_system_node` VALUES ('1102', 'site.innojet_content3_title/add', '添加', '2', '1', '1645164942', '1645164942');
INSERT INTO `ea_system_node` VALUES ('1103', 'site.innojet_content3_title/edit', '编辑', '2', '1', '1645164942', '1645164942');
INSERT INTO `ea_system_node` VALUES ('1104', 'site.innojet_content3_title/delete', '删除', '2', '1', '1645164942', '1645164942');
INSERT INTO `ea_system_node` VALUES ('1105', 'site.innojet_content3_title/export', '导出', '2', '1', '1645164942', '1645164942');
INSERT INTO `ea_system_node` VALUES ('1106', 'site.innojet_content3_title/modify', '属性修改', '2', '1', '1645164942', '1645164942');
INSERT INTO `ea_system_node` VALUES ('1107', 'site.innojet_content4', 'site_innojet_content4', '1', '1', '1645164942', '1645164942');
INSERT INTO `ea_system_node` VALUES ('1108', 'site.innojet_content4/index', '列表', '2', '1', '1645164942', '1645164942');
INSERT INTO `ea_system_node` VALUES ('1109', 'site.innojet_content4/add', '添加', '2', '1', '1645164942', '1645164942');
INSERT INTO `ea_system_node` VALUES ('1110', 'site.innojet_content4/edit', '编辑', '2', '1', '1645164942', '1645164942');
INSERT INTO `ea_system_node` VALUES ('1111', 'site.innojet_content4/delete', '删除', '2', '1', '1645164942', '1645164942');
INSERT INTO `ea_system_node` VALUES ('1112', 'site.innojet_content4/export', '导出', '2', '1', '1645164942', '1645164942');
INSERT INTO `ea_system_node` VALUES ('1113', 'site.innojet_content4/modify', '属性修改', '2', '1', '1645164942', '1645164942');
INSERT INTO `ea_system_node` VALUES ('1114', 'site.innojet_content4_title', 'site_innojet_content4_title', '1', '1', '1645164942', '1645164942');
INSERT INTO `ea_system_node` VALUES ('1115', 'site.innojet_content4_title/index', '列表', '2', '1', '1645164942', '1645164942');
INSERT INTO `ea_system_node` VALUES ('1116', 'site.innojet_content4_title/save', '保存', '2', '1', '1645164942', '1645164942');
INSERT INTO `ea_system_node` VALUES ('1117', 'site.innojet_content4_title/add', '添加', '2', '1', '1645164943', '1645164943');
INSERT INTO `ea_system_node` VALUES ('1118', 'site.innojet_content4_title/edit', '编辑', '2', '1', '1645164943', '1645164943');
INSERT INTO `ea_system_node` VALUES ('1119', 'site.innojet_content4_title/delete', '删除', '2', '1', '1645164943', '1645164943');
INSERT INTO `ea_system_node` VALUES ('1120', 'site.innojet_content4_title/export', '导出', '2', '1', '1645164943', '1645164943');
INSERT INTO `ea_system_node` VALUES ('1121', 'site.innojet_content4_title/modify', '属性修改', '2', '1', '1645164943', '1645164943');
INSERT INTO `ea_system_node` VALUES ('1122', 'site.innojet_content5', 'site_innojet_content5', '1', '1', '1645164943', '1645164943');
INSERT INTO `ea_system_node` VALUES ('1123', 'site.innojet_content5/index', '列表', '2', '1', '1645164943', '1645164943');
INSERT INTO `ea_system_node` VALUES ('1124', 'site.innojet_content5/add', '添加', '2', '1', '1645164943', '1645164943');
INSERT INTO `ea_system_node` VALUES ('1125', 'site.innojet_content5/edit', '编辑', '2', '1', '1645164943', '1645164943');
INSERT INTO `ea_system_node` VALUES ('1126', 'site.innojet_content5/delete', '删除', '2', '1', '1645164943', '1645164943');
INSERT INTO `ea_system_node` VALUES ('1127', 'site.innojet_content5/export', '导出', '2', '1', '1645164943', '1645164943');
INSERT INTO `ea_system_node` VALUES ('1128', 'site.innojet_content5/modify', '属性修改', '2', '1', '1645164943', '1645164943');
INSERT INTO `ea_system_node` VALUES ('1129', 'site.innojet_content5_title', 'site_innojet_content5_title', '1', '1', '1645164943', '1645164943');
INSERT INTO `ea_system_node` VALUES ('1130', 'site.innojet_content5_title/index', '列表', '2', '1', '1645164943', '1645164943');
INSERT INTO `ea_system_node` VALUES ('1131', 'site.innojet_content5_title/save', '保存', '2', '1', '1645164943', '1645164943');
INSERT INTO `ea_system_node` VALUES ('1132', 'site.innojet_content5_title/add', '添加', '2', '1', '1645164943', '1645164943');
INSERT INTO `ea_system_node` VALUES ('1133', 'site.innojet_content5_title/edit', '编辑', '2', '1', '1645164943', '1645164943');
INSERT INTO `ea_system_node` VALUES ('1134', 'site.innojet_content5_title/delete', '删除', '2', '1', '1645164944', '1645164944');
INSERT INTO `ea_system_node` VALUES ('1135', 'site.innojet_content5_title/export', '导出', '2', '1', '1645164944', '1645164944');
INSERT INTO `ea_system_node` VALUES ('1136', 'site.innojet_content5_title/modify', '属性修改', '2', '1', '1645164944', '1645164944');
INSERT INTO `ea_system_node` VALUES ('1137', 'site.innojet_content6', 'site_innojet_content6', '1', '1', '1645164944', '1645164944');
INSERT INTO `ea_system_node` VALUES ('1138', 'site.innojet_content6/index', '列表', '2', '1', '1645164944', '1645164944');
INSERT INTO `ea_system_node` VALUES ('1139', 'site.innojet_content6/add', '添加', '2', '1', '1645164944', '1645164944');
INSERT INTO `ea_system_node` VALUES ('1140', 'site.innojet_content6/edit', '编辑', '2', '1', '1645164944', '1645164944');
INSERT INTO `ea_system_node` VALUES ('1141', 'site.innojet_content6/delete', '删除', '2', '1', '1645164944', '1645164944');
INSERT INTO `ea_system_node` VALUES ('1142', 'site.innojet_content6/export', '导出', '2', '1', '1645164944', '1645164944');
INSERT INTO `ea_system_node` VALUES ('1143', 'site.innojet_content6/modify', '属性修改', '2', '1', '1645164944', '1645164944');
INSERT INTO `ea_system_node` VALUES ('1144', 'site.innojet_content6_title', 'site_innojet_content6_title', '1', '1', '1645164944', '1645164944');
INSERT INTO `ea_system_node` VALUES ('1145', 'site.innojet_content6_title/index', '列表', '2', '1', '1645164944', '1645164944');
INSERT INTO `ea_system_node` VALUES ('1146', 'site.innojet_content6_title/save', '保存', '2', '1', '1645164944', '1645164944');
INSERT INTO `ea_system_node` VALUES ('1147', 'site.innojet_content6_title/add', '添加', '2', '1', '1645164944', '1645164944');
INSERT INTO `ea_system_node` VALUES ('1148', 'site.innojet_content6_title/edit', '编辑', '2', '1', '1645164944', '1645164944');
INSERT INTO `ea_system_node` VALUES ('1149', 'site.innojet_content6_title/delete', '删除', '2', '1', '1645164944', '1645164944');
INSERT INTO `ea_system_node` VALUES ('1150', 'site.innojet_content6_title/export', '导出', '2', '1', '1645164944', '1645164944');
INSERT INTO `ea_system_node` VALUES ('1151', 'site.innojet_content6_title/modify', '属性修改', '2', '1', '1645164945', '1645164945');
INSERT INTO `ea_system_node` VALUES ('1152', 'site.innojet_content7', 'site_innojet_content7', '1', '1', '1645164945', '1645164945');
INSERT INTO `ea_system_node` VALUES ('1153', 'site.innojet_content7/index', '列表', '2', '1', '1645164945', '1645164945');
INSERT INTO `ea_system_node` VALUES ('1154', 'site.innojet_content7/add', '添加', '2', '1', '1645164945', '1645164945');
INSERT INTO `ea_system_node` VALUES ('1155', 'site.innojet_content7/edit', '编辑', '2', '1', '1645164945', '1645164945');
INSERT INTO `ea_system_node` VALUES ('1156', 'site.innojet_content7/delete', '删除', '2', '1', '1645164945', '1645164945');
INSERT INTO `ea_system_node` VALUES ('1157', 'site.innojet_content7/export', '导出', '2', '1', '1645164945', '1645164945');
INSERT INTO `ea_system_node` VALUES ('1158', 'site.innojet_content7/modify', '属性修改', '2', '1', '1645164945', '1645164945');
INSERT INTO `ea_system_node` VALUES ('1159', 'site.innojet_content7_title', 'site_innojet_content7_title', '1', '1', '1645164945', '1645164945');
INSERT INTO `ea_system_node` VALUES ('1160', 'site.innojet_content7_title/index', '列表', '2', '1', '1645164945', '1645164945');
INSERT INTO `ea_system_node` VALUES ('1161', 'site.innojet_content7_title/save', '保存', '2', '1', '1645164945', '1645164945');
INSERT INTO `ea_system_node` VALUES ('1162', 'site.innojet_content7_title/add', '添加', '2', '1', '1645164945', '1645164945');
INSERT INTO `ea_system_node` VALUES ('1163', 'site.innojet_content7_title/edit', '编辑', '2', '1', '1645164945', '1645164945');
INSERT INTO `ea_system_node` VALUES ('1164', 'site.innojet_content7_title/delete', '删除', '2', '1', '1645164945', '1645164945');
INSERT INTO `ea_system_node` VALUES ('1165', 'site.innojet_content7_title/export', '导出', '2', '1', '1645164945', '1645164945');
INSERT INTO `ea_system_node` VALUES ('1166', 'site.innojet_content7_title/modify', '属性修改', '2', '1', '1645164945', '1645164945');
INSERT INTO `ea_system_node` VALUES ('1167', 'site.innojet_content8', 'site_innojet_content8', '1', '1', '1645164945', '1645164945');
INSERT INTO `ea_system_node` VALUES ('1168', 'site.innojet_content8/index', '列表', '2', '1', '1645164945', '1645164945');
INSERT INTO `ea_system_node` VALUES ('1169', 'site.innojet_content8/add', '添加', '2', '1', '1645164946', '1645164946');
INSERT INTO `ea_system_node` VALUES ('1170', 'site.innojet_content8/edit', '编辑', '2', '1', '1645164946', '1645164946');
INSERT INTO `ea_system_node` VALUES ('1171', 'site.innojet_content8/delete', '删除', '2', '1', '1645164946', '1645164946');
INSERT INTO `ea_system_node` VALUES ('1172', 'site.innojet_content8/export', '导出', '2', '1', '1645164946', '1645164946');
INSERT INTO `ea_system_node` VALUES ('1173', 'site.innojet_content8/modify', '属性修改', '2', '1', '1645164946', '1645164946');
INSERT INTO `ea_system_node` VALUES ('1174', 'site.innojet_content8_title', 'site_innojet_content8_title', '1', '1', '1645164946', '1645164946');
INSERT INTO `ea_system_node` VALUES ('1175', 'site.innojet_content8_title/index', '列表', '2', '1', '1645164946', '1645164946');
INSERT INTO `ea_system_node` VALUES ('1176', 'site.innojet_content8_title/save', '保存', '2', '1', '1645164946', '1645164946');
INSERT INTO `ea_system_node` VALUES ('1177', 'site.innojet_content8_title/add', '添加', '2', '1', '1645164946', '1645164946');
INSERT INTO `ea_system_node` VALUES ('1178', 'site.innojet_content8_title/edit', '编辑', '2', '1', '1645164946', '1645164946');
INSERT INTO `ea_system_node` VALUES ('1179', 'site.innojet_content8_title/delete', '删除', '2', '1', '1645164946', '1645164946');
INSERT INTO `ea_system_node` VALUES ('1180', 'site.innojet_content8_title/export', '导出', '2', '1', '1645164946', '1645164946');
INSERT INTO `ea_system_node` VALUES ('1181', 'site.innojet_content8_title/modify', '属性修改', '2', '1', '1645164946', '1645164946');
INSERT INTO `ea_system_node` VALUES ('1182', 'site.innojoy_content1', 'site_innojoy_content1', '1', '1', '1645164946', '1645164946');
INSERT INTO `ea_system_node` VALUES ('1183', 'site.innojoy_content1/index', '列表', '2', '1', '1645164946', '1645164946');
INSERT INTO `ea_system_node` VALUES ('1184', 'site.innojoy_content1/add', '添加', '2', '1', '1645164946', '1645164946');
INSERT INTO `ea_system_node` VALUES ('1185', 'site.innojoy_content1/edit', '编辑', '2', '1', '1645164946', '1645164946');
INSERT INTO `ea_system_node` VALUES ('1186', 'site.innojoy_content1/delete', '删除', '2', '1', '1645164947', '1645164947');
INSERT INTO `ea_system_node` VALUES ('1187', 'site.innojoy_content1/export', '导出', '2', '1', '1645164947', '1645164947');
INSERT INTO `ea_system_node` VALUES ('1188', 'site.innojoy_content1/modify', '属性修改', '2', '1', '1645164947', '1645164947');
INSERT INTO `ea_system_node` VALUES ('1189', 'site.innojoy_content1_title', 'site_innojoy_content1_title', '1', '1', '1645164947', '1645164947');
INSERT INTO `ea_system_node` VALUES ('1190', 'site.innojoy_content1_title/index', '列表', '2', '1', '1645164947', '1645164947');
INSERT INTO `ea_system_node` VALUES ('1191', 'site.innojoy_content1_title/save', '保存', '2', '1', '1645164947', '1645164947');
INSERT INTO `ea_system_node` VALUES ('1192', 'site.innojoy_content1_title/add', '添加', '2', '1', '1645164947', '1645164947');
INSERT INTO `ea_system_node` VALUES ('1193', 'site.innojoy_content1_title/edit', '编辑', '2', '1', '1645164947', '1645164947');
INSERT INTO `ea_system_node` VALUES ('1194', 'site.innojoy_content1_title/delete', '删除', '2', '1', '1645164947', '1645164947');
INSERT INTO `ea_system_node` VALUES ('1195', 'site.innojoy_content1_title/export', '导出', '2', '1', '1645164947', '1645164947');
INSERT INTO `ea_system_node` VALUES ('1196', 'site.innojoy_content1_title/modify', '属性修改', '2', '1', '1645164947', '1645164947');
INSERT INTO `ea_system_node` VALUES ('1197', 'site.innojoy_content2', 'site_innojoy_content2', '1', '1', '1645164947', '1645164947');
INSERT INTO `ea_system_node` VALUES ('1198', 'site.innojoy_content2/index', '列表', '2', '1', '1645164947', '1645164947');
INSERT INTO `ea_system_node` VALUES ('1199', 'site.innojoy_content2/save', '保存', '2', '1', '1645164947', '1645164947');
INSERT INTO `ea_system_node` VALUES ('1200', 'site.innojoy_content2/add', '添加', '2', '1', '1645164947', '1645164947');
INSERT INTO `ea_system_node` VALUES ('1201', 'site.innojoy_content2/edit', '编辑', '2', '1', '1645164947', '1645164947');
INSERT INTO `ea_system_node` VALUES ('1202', 'site.innojoy_content2/delete', '删除', '2', '1', '1645164947', '1645164947');
INSERT INTO `ea_system_node` VALUES ('1203', 'site.innojoy_content2/export', '导出', '2', '1', '1645164947', '1645164947');
INSERT INTO `ea_system_node` VALUES ('1204', 'site.innojoy_content2/modify', '属性修改', '2', '1', '1645164948', '1645164948');
INSERT INTO `ea_system_node` VALUES ('1205', 'site.innojoy_content3', 'site_innojoy_content3', '1', '1', '1645164948', '1645164948');
INSERT INTO `ea_system_node` VALUES ('1206', 'site.innojoy_content3/index', '列表', '2', '1', '1645164948', '1645164948');
INSERT INTO `ea_system_node` VALUES ('1207', 'site.innojoy_content3/add', '添加', '2', '1', '1645164948', '1645164948');
INSERT INTO `ea_system_node` VALUES ('1208', 'site.innojoy_content3/edit', '编辑', '2', '1', '1645164948', '1645164948');
INSERT INTO `ea_system_node` VALUES ('1209', 'site.innojoy_content3/delete', '删除', '2', '1', '1645164948', '1645164948');
INSERT INTO `ea_system_node` VALUES ('1210', 'site.innojoy_content3/export', '导出', '2', '1', '1645164948', '1645164948');
INSERT INTO `ea_system_node` VALUES ('1211', 'site.innojoy_content3/modify', '属性修改', '2', '1', '1645164948', '1645164948');
INSERT INTO `ea_system_node` VALUES ('1212', 'site.innojoy_content3_title', 'site_innojoy_content3_title', '1', '1', '1645164948', '1645164948');
INSERT INTO `ea_system_node` VALUES ('1213', 'site.innojoy_content3_title/index', '列表', '2', '1', '1645164948', '1645164948');
INSERT INTO `ea_system_node` VALUES ('1214', 'site.innojoy_content3_title/save', '保存', '2', '1', '1645164948', '1645164948');
INSERT INTO `ea_system_node` VALUES ('1215', 'site.innojoy_content3_title/add', '添加', '2', '1', '1645164948', '1645164948');
INSERT INTO `ea_system_node` VALUES ('1216', 'site.innojoy_content3_title/edit', '编辑', '2', '1', '1645164948', '1645164948');
INSERT INTO `ea_system_node` VALUES ('1217', 'site.innojoy_content3_title/delete', '删除', '2', '1', '1645164948', '1645164948');
INSERT INTO `ea_system_node` VALUES ('1218', 'site.innojoy_content3_title/export', '导出', '2', '1', '1645164948', '1645164948');
INSERT INTO `ea_system_node` VALUES ('1219', 'site.innojoy_content3_title/modify', '属性修改', '2', '1', '1645164948', '1645164948');
INSERT INTO `ea_system_node` VALUES ('1220', 'site.innojoy_content4', 'site_innojoy_content4', '1', '1', '1645164948', '1645164948');
INSERT INTO `ea_system_node` VALUES ('1221', 'site.innojoy_content4/index', '列表', '2', '1', '1645164949', '1645164949');
INSERT INTO `ea_system_node` VALUES ('1222', 'site.innojoy_content4/save', '保存', '2', '1', '1645164949', '1645164949');
INSERT INTO `ea_system_node` VALUES ('1223', 'site.innojoy_content4/add', '添加', '2', '1', '1645164949', '1645164949');
INSERT INTO `ea_system_node` VALUES ('1224', 'site.innojoy_content4/edit', '编辑', '2', '1', '1645164949', '1645164949');
INSERT INTO `ea_system_node` VALUES ('1225', 'site.innojoy_content4/delete', '删除', '2', '1', '1645164949', '1645164949');
INSERT INTO `ea_system_node` VALUES ('1226', 'site.innojoy_content4/export', '导出', '2', '1', '1645164949', '1645164949');
INSERT INTO `ea_system_node` VALUES ('1227', 'site.innojoy_content4/modify', '属性修改', '2', '1', '1645164949', '1645164949');
INSERT INTO `ea_system_node` VALUES ('1228', 'site.innojoy_content5', 'site_innojoy_content5', '1', '1', '1645164949', '1645164949');
INSERT INTO `ea_system_node` VALUES ('1229', 'site.innojoy_content5/index', '列表', '2', '1', '1645164949', '1645164949');
INSERT INTO `ea_system_node` VALUES ('1230', 'site.innojoy_content5/add', '添加', '2', '1', '1645164949', '1645164949');
INSERT INTO `ea_system_node` VALUES ('1231', 'site.innojoy_content5/edit', '编辑', '2', '1', '1645164949', '1645164949');
INSERT INTO `ea_system_node` VALUES ('1232', 'site.innojoy_content5/delete', '删除', '2', '1', '1645164949', '1645164949');
INSERT INTO `ea_system_node` VALUES ('1233', 'site.innojoy_content5/export', '导出', '2', '1', '1645164949', '1645164949');
INSERT INTO `ea_system_node` VALUES ('1234', 'site.innojoy_content5/modify', '属性修改', '2', '1', '1645164949', '1645164949');
INSERT INTO `ea_system_node` VALUES ('1235', 'site.innojoy_content5_title', 'site_innojoy_content5_title', '1', '1', '1645164949', '1645164949');
INSERT INTO `ea_system_node` VALUES ('1236', 'site.innojoy_content5_title/index', '列表', '2', '1', '1645164950', '1645164950');
INSERT INTO `ea_system_node` VALUES ('1237', 'site.innojoy_content5_title/save', '保存', '2', '1', '1645164950', '1645164950');
INSERT INTO `ea_system_node` VALUES ('1238', 'site.innojoy_content5_title/add', '添加', '2', '1', '1645164950', '1645164950');
INSERT INTO `ea_system_node` VALUES ('1239', 'site.innojoy_content5_title/edit', '编辑', '2', '1', '1645164950', '1645164950');
INSERT INTO `ea_system_node` VALUES ('1240', 'site.innojoy_content5_title/delete', '删除', '2', '1', '1645164950', '1645164950');
INSERT INTO `ea_system_node` VALUES ('1241', 'site.innojoy_content5_title/export', '导出', '2', '1', '1645164950', '1645164950');
INSERT INTO `ea_system_node` VALUES ('1242', 'site.innojoy_content5_title/modify', '属性修改', '2', '1', '1645164950', '1645164950');
INSERT INTO `ea_system_node` VALUES ('1243', 'site.know_us_service', 'site_know_us_service', '1', '1', '1645164950', '1645164950');
INSERT INTO `ea_system_node` VALUES ('1244', 'site.know_us_service/index', '列表', '2', '1', '1645164950', '1645164950');
INSERT INTO `ea_system_node` VALUES ('1245', 'site.know_us_service/add', '添加', '2', '1', '1645164950', '1645164950');
INSERT INTO `ea_system_node` VALUES ('1246', 'site.know_us_service/edit', '编辑', '2', '1', '1645164950', '1645164950');
INSERT INTO `ea_system_node` VALUES ('1247', 'site.know_us_service/delete', '删除', '2', '1', '1645164950', '1645164950');
INSERT INTO `ea_system_node` VALUES ('1248', 'site.know_us_service/export', '导出', '2', '1', '1645164950', '1645164950');
INSERT INTO `ea_system_node` VALUES ('1249', 'site.know_us_service/modify', '属性修改', '2', '1', '1645164950', '1645164950');
INSERT INTO `ea_system_node` VALUES ('1250', 'site.know_us_service_title', 'site_know_us_service_title', '1', '1', '1645164950', '1645164950');
INSERT INTO `ea_system_node` VALUES ('1251', 'site.know_us_service_title/index', '列表', '2', '1', '1645164950', '1645164950');
INSERT INTO `ea_system_node` VALUES ('1252', 'site.know_us_service_title/save', '保存', '2', '1', '1645164951', '1645164951');
INSERT INTO `ea_system_node` VALUES ('1253', 'site.know_us_service_title/add', '添加', '2', '1', '1645164951', '1645164951');
INSERT INTO `ea_system_node` VALUES ('1254', 'site.know_us_service_title/edit', '编辑', '2', '1', '1645164951', '1645164951');
INSERT INTO `ea_system_node` VALUES ('1255', 'site.know_us_service_title/delete', '删除', '2', '1', '1645164951', '1645164951');
INSERT INTO `ea_system_node` VALUES ('1256', 'site.know_us_service_title/export', '导出', '2', '1', '1645164951', '1645164951');
INSERT INTO `ea_system_node` VALUES ('1257', 'site.know_us_service_title/modify', '属性修改', '2', '1', '1645164951', '1645164951');
INSERT INTO `ea_system_node` VALUES ('1258', 'site.prof_service', 'site_prof_service', '1', '1', '1645164951', '1645164951');
INSERT INTO `ea_system_node` VALUES ('1259', 'site.prof_service/index', '列表', '2', '1', '1645164951', '1645164951');
INSERT INTO `ea_system_node` VALUES ('1260', 'site.prof_service/add', '添加', '2', '1', '1645164951', '1645164951');
INSERT INTO `ea_system_node` VALUES ('1261', 'site.prof_service/edit', '编辑', '2', '1', '1645164951', '1645164951');
INSERT INTO `ea_system_node` VALUES ('1262', 'site.prof_service/delete', '删除', '2', '1', '1645164951', '1645164951');
INSERT INTO `ea_system_node` VALUES ('1263', 'site.prof_service/export', '导出', '2', '1', '1645164951', '1645164951');
INSERT INTO `ea_system_node` VALUES ('1264', 'site.prof_service/modify', '属性修改', '2', '1', '1645164951', '1645164951');
INSERT INTO `ea_system_node` VALUES ('1265', 'site.prof_service_title', 'site_prof_service_title', '1', '1', '1645164951', '1645164951');
INSERT INTO `ea_system_node` VALUES ('1266', 'site.prof_service_title/index', '列表', '2', '1', '1645164951', '1645164951');
INSERT INTO `ea_system_node` VALUES ('1267', 'site.prof_service_title/save', '保存', '2', '1', '1645164951', '1645164951');
INSERT INTO `ea_system_node` VALUES ('1268', 'site.prof_service_title/add', '添加', '2', '1', '1645164951', '1645164951');
INSERT INTO `ea_system_node` VALUES ('1269', 'site.prof_service_title/edit', '编辑', '2', '1', '1645164952', '1645164952');
INSERT INTO `ea_system_node` VALUES ('1270', 'site.prof_service_title/delete', '删除', '2', '1', '1645164952', '1645164952');
INSERT INTO `ea_system_node` VALUES ('1271', 'site.prof_service_title/export', '导出', '2', '1', '1645164952', '1645164952');
INSERT INTO `ea_system_node` VALUES ('1272', 'site.prof_service_title/modify', '属性修改', '2', '1', '1645164952', '1645164952');
INSERT INTO `ea_system_node` VALUES ('1273', 'site.res_book', 'site_res_book', '1', '1', '1645164952', '1645164952');
INSERT INTO `ea_system_node` VALUES ('1274', 'site.res_book/index', '列表', '2', '1', '1645164952', '1645164952');
INSERT INTO `ea_system_node` VALUES ('1275', 'site.res_book/add', '添加', '2', '1', '1645164952', '1645164952');
INSERT INTO `ea_system_node` VALUES ('1276', 'site.res_book/edit', '编辑', '2', '1', '1645164952', '1645164952');
INSERT INTO `ea_system_node` VALUES ('1277', 'site.res_book/delete', '删除', '2', '1', '1645164952', '1645164952');
INSERT INTO `ea_system_node` VALUES ('1278', 'site.res_book/export', '导出', '2', '1', '1645164952', '1645164952');
INSERT INTO `ea_system_node` VALUES ('1279', 'site.res_book/modify', '属性修改', '2', '1', '1645164952', '1645164952');
INSERT INTO `ea_system_node` VALUES ('1280', 'site.res_course', 'site_res_course', '1', '1', '1645164952', '1645164952');
INSERT INTO `ea_system_node` VALUES ('1281', 'site.res_course/index', '列表', '2', '1', '1645164952', '1645164952');
INSERT INTO `ea_system_node` VALUES ('1282', 'site.res_course/add', '添加', '2', '1', '1645164952', '1645164952');
INSERT INTO `ea_system_node` VALUES ('1283', 'site.res_course/edit', '编辑', '2', '1', '1645164952', '1645164952');
INSERT INTO `ea_system_node` VALUES ('1284', 'site.res_course/delete', '删除', '2', '1', '1645164952', '1645164952');
INSERT INTO `ea_system_node` VALUES ('1285', 'site.res_course/export', '导出', '2', '1', '1645164952', '1645164952');
INSERT INTO `ea_system_node` VALUES ('1286', 'site.res_course/modify', '属性修改', '2', '1', '1645164953', '1645164953');
INSERT INTO `ea_system_node` VALUES ('1287', 'site.res_course_cate', 'site_res_course_cate', '1', '1', '1645164953', '1645164953');
INSERT INTO `ea_system_node` VALUES ('1288', 'site.res_course_cate/index', '列表', '2', '1', '1645164953', '1645164953');
INSERT INTO `ea_system_node` VALUES ('1289', 'site.res_course_cate/add', '添加', '2', '1', '1645164953', '1645164953');
INSERT INTO `ea_system_node` VALUES ('1290', 'site.res_course_cate/edit', '编辑', '2', '1', '1645164953', '1645164953');
INSERT INTO `ea_system_node` VALUES ('1291', 'site.res_course_cate/delete', '删除', '2', '1', '1645164953', '1645164953');
INSERT INTO `ea_system_node` VALUES ('1292', 'site.res_course_cate/export', '导出', '2', '1', '1645164953', '1645164953');
INSERT INTO `ea_system_node` VALUES ('1293', 'site.res_course_cate/modify', '属性修改', '2', '1', '1645164953', '1645164953');
INSERT INTO `ea_system_node` VALUES ('1294', 'site.res_course_lecturer', 'site_res_course_lecturer', '1', '1', '1645164953', '1645164953');
INSERT INTO `ea_system_node` VALUES ('1295', 'site.res_course_lecturer/index', '列表', '2', '1', '1645164953', '1645164953');
INSERT INTO `ea_system_node` VALUES ('1296', 'site.res_course_lecturer/add', '添加', '2', '1', '1645164953', '1645164953');
INSERT INTO `ea_system_node` VALUES ('1297', 'site.res_course_lecturer/edit', '编辑', '2', '1', '1645164953', '1645164953');
INSERT INTO `ea_system_node` VALUES ('1298', 'site.res_course_lecturer/delete', '删除', '2', '1', '1645164953', '1645164953');
INSERT INTO `ea_system_node` VALUES ('1299', 'site.res_course_lecturer/export', '导出', '2', '1', '1645164953', '1645164953');
INSERT INTO `ea_system_node` VALUES ('1300', 'site.res_course_lecturer/modify', '属性修改', '2', '1', '1645164953', '1645164953');
INSERT INTO `ea_system_node` VALUES ('1301', 'site.res_news', 'site_res_news', '1', '1', '1645164953', '1645164953');
INSERT INTO `ea_system_node` VALUES ('1302', 'site.res_news/index', '列表', '2', '1', '1645164953', '1645164953');
INSERT INTO `ea_system_node` VALUES ('1303', 'site.res_news/add', '添加', '2', '1', '1645164954', '1645164954');
INSERT INTO `ea_system_node` VALUES ('1304', 'site.res_news/edit', '编辑', '2', '1', '1645164954', '1645164954');
INSERT INTO `ea_system_node` VALUES ('1305', 'site.res_news/delete', '删除', '2', '1', '1645164954', '1645164954');
INSERT INTO `ea_system_node` VALUES ('1306', 'site.res_news/export', '导出', '2', '1', '1645164954', '1645164954');
INSERT INTO `ea_system_node` VALUES ('1307', 'site.res_news/modify', '属性修改', '2', '1', '1645164954', '1645164954');
INSERT INTO `ea_system_node` VALUES ('1308', 'site.res_top', 'site_res_top', '1', '1', '1645164954', '1645164954');
INSERT INTO `ea_system_node` VALUES ('1309', 'site.res_top/index', '列表', '2', '1', '1645164954', '1645164954');
INSERT INTO `ea_system_node` VALUES ('1310', 'site.res_top/add', '添加', '2', '1', '1645164954', '1645164954');
INSERT INTO `ea_system_node` VALUES ('1311', 'site.res_top/edit', '编辑', '2', '1', '1645164954', '1645164954');
INSERT INTO `ea_system_node` VALUES ('1312', 'site.res_top/delete', '删除', '2', '1', '1645164954', '1645164954');
INSERT INTO `ea_system_node` VALUES ('1313', 'site.res_top/export', '导出', '2', '1', '1645164954', '1645164954');
INSERT INTO `ea_system_node` VALUES ('1314', 'site.res_top/modify', '属性修改', '2', '1', '1645164954', '1645164954');
INSERT INTO `ea_system_node` VALUES ('1315', 'site.seo', 'site_seo', '1', '1', '1645164954', '1645164954');
INSERT INTO `ea_system_node` VALUES ('1316', 'site.seo/index', '列表', '2', '1', '1645164954', '1645164954');
INSERT INTO `ea_system_node` VALUES ('1317', 'site.seo/save', '保存', '2', '1', '1645164954', '1645164954');
INSERT INTO `ea_system_node` VALUES ('1318', 'site.seo/add', '添加', '2', '1', '1645164954', '1645164954');
INSERT INTO `ea_system_node` VALUES ('1319', 'site.seo/edit', '编辑', '2', '1', '1645164954', '1645164954');
INSERT INTO `ea_system_node` VALUES ('1320', 'site.seo/delete', '删除', '2', '1', '1645164954', '1645164954');
INSERT INTO `ea_system_node` VALUES ('1321', 'site.seo/export', '导出', '2', '1', '1645164955', '1645164955');
INSERT INTO `ea_system_node` VALUES ('1322', 'site.seo/modify', '属性修改', '2', '1', '1645164955', '1645164955');

-- ----------------------------
-- Table structure for ea_system_quick
-- ----------------------------
DROP TABLE IF EXISTS `ea_system_quick`;
CREATE TABLE `ea_system_quick` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL COMMENT '快捷入口名称',
  `icon` varchar(100) DEFAULT NULL COMMENT '图标',
  `href` varchar(255) DEFAULT NULL COMMENT '快捷链接',
  `sort` int DEFAULT '0' COMMENT '排序',
  `status` tinyint unsigned DEFAULT '1' COMMENT '状态(1:禁用,2:启用)',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注说明',
  `create_time` int DEFAULT NULL COMMENT '创建时间',
  `update_time` int DEFAULT NULL COMMENT '更新时间',
  `delete_time` int DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT COMMENT='系统快捷入口表';

-- ----------------------------
-- Records of ea_system_quick
-- ----------------------------
INSERT INTO `ea_system_quick` VALUES ('1', '管理员管理', 'fa fa-user', 'system.admin/index', '0', '1', '', '1589624097', '1589624792', null);
INSERT INTO `ea_system_quick` VALUES ('2', '角色管理', 'fa fa-bitbucket-square', 'system.auth/index', '0', '1', '', '1589624772', '1589624781', null);
INSERT INTO `ea_system_quick` VALUES ('3', '菜单管理', 'fa fa-tree', 'system.menu/index', '0', '1', null, '1589624097', '1589624792', null);
INSERT INTO `ea_system_quick` VALUES ('6', '节点管理', 'fa fa-list', 'system.node/index', '0', '1', null, '1589624772', '1589624781', null);
INSERT INTO `ea_system_quick` VALUES ('7', '配置管理', 'fa fa-asterisk', 'system.config/index', '0', '1', null, '1589624097', '1589624792', null);
INSERT INTO `ea_system_quick` VALUES ('8', '上传管理', 'fa fa-arrow-up', 'system.uploadfile/index', '0', '1', null, '1589624772', '1589624781', null);
INSERT INTO `ea_system_quick` VALUES ('10', '商品分类', 'fa fa-calendar-check-o', 'mall.cate/index', '0', '1', null, '1589624097', '1589624792', null);
INSERT INTO `ea_system_quick` VALUES ('11', '商品管理', 'fa fa-list', 'mall.goods/index', '0', '1', null, '1589624772', '1589624781', null);

-- ----------------------------
-- Table structure for ea_system_uploadfile
-- ----------------------------
DROP TABLE IF EXISTS `ea_system_uploadfile`;
CREATE TABLE `ea_system_uploadfile` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `upload_type` varchar(20) NOT NULL DEFAULT 'local' COMMENT '存储位置',
  `original_name` varchar(255) DEFAULT NULL COMMENT '文件原名',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '物理路径',
  `image_width` varchar(30) NOT NULL DEFAULT '' COMMENT '宽度',
  `image_height` varchar(30) NOT NULL DEFAULT '' COMMENT '高度',
  `image_type` varchar(30) NOT NULL DEFAULT '' COMMENT '图片类型',
  `image_frames` int unsigned NOT NULL DEFAULT '0' COMMENT '图片帧数',
  `mime_type` varchar(100) NOT NULL DEFAULT '' COMMENT 'mime类型',
  `file_size` int unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `file_ext` varchar(100) DEFAULT NULL,
  `sha1` varchar(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `create_time` int DEFAULT NULL COMMENT '创建日期',
  `update_time` int DEFAULT NULL COMMENT '更新时间',
  `upload_time` int DEFAULT NULL COMMENT '上传时间',
  PRIMARY KEY (`id`),
  KEY `upload_type` (`upload_type`),
  KEY `original_name` (`original_name`)
) ENGINE=InnoDB AUTO_INCREMENT=316 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT COMMENT='上传文件表';

-- ----------------------------
-- Records of ea_system_uploadfile
-- ----------------------------
INSERT INTO `ea_system_uploadfile` VALUES ('286', 'alioss', 'image/jpeg', 'https://lxn-99php.oss-cn-shenzhen.aliyuncs.com/upload/20191111/0a6de1ac058ee134301501899b84ecb1.jpg', '', '', '', '0', 'image/jpeg', '0', 'jpg', '', null, null, null);
INSERT INTO `ea_system_uploadfile` VALUES ('287', 'alioss', 'image/jpeg', 'https://lxn-99php.oss-cn-shenzhen.aliyuncs.com/upload/20191111/46d7384f04a3bed331715e86a4095d15.jpg', '', '', '', '0', 'image/jpeg', '0', 'jpg', '', null, null, null);
INSERT INTO `ea_system_uploadfile` VALUES ('288', 'alioss', 'image/x-icon', 'https://lxn-99php.oss-cn-shenzhen.aliyuncs.com/upload/20191111/7d32671f4c1d1b01b0b28f45205763f9.ico', '', '', '', '0', 'image/x-icon', '0', 'ico', '', null, null, null);
INSERT INTO `ea_system_uploadfile` VALUES ('289', 'alioss', 'image/jpeg', 'https://lxn-99php.oss-cn-shenzhen.aliyuncs.com/upload/20191111/28cefa547f573a951bcdbbeb1396b06f.jpg', '', '', '', '0', 'image/jpeg', '0', 'jpg', '', null, null, null);
INSERT INTO `ea_system_uploadfile` VALUES ('290', 'alioss', 'image/jpeg', 'https://lxn-99php.oss-cn-shenzhen.aliyuncs.com/upload/20191111/2c412adf1b30c8be3a913e603c7b6e4a.jpg', '', '', '', '0', 'image/jpeg', '0', 'jpg', '', null, null, null);
INSERT INTO `ea_system_uploadfile` VALUES ('291', 'alioss', 'timg (1).jpg', 'http://easyadmin.oss-cn-shenzhen.aliyuncs.com/upload/20191113/ff793ced447febfa9ea2d86f9f88fa8e.jpg', '', '', '', '0', 'image/jpeg', '0', 'jpg', '', '1573612437', null, null);
INSERT INTO `ea_system_uploadfile` VALUES ('296', 'txcos', '22243.jpg', 'https://easyadmin-1251997243.cos.ap-guangzhou.myqcloud.com/upload/20191114/2381eaf81208ac188fa994b6f2579953.jpg', '', '', '', '0', 'image/jpeg', '0', 'jpg', '', '1573712153', null, null);
INSERT INTO `ea_system_uploadfile` VALUES ('297', 'local', 'timg.jpg', 'http://admin.host/upload/20200423/5055a273cf8e3f393d699d622b74f247.jpg', '', '', '', '0', 'image/jpeg', '0', 'jpg', '', '1587614155', null, null);
INSERT INTO `ea_system_uploadfile` VALUES ('298', 'local', 'timg.jpg', 'http://admin.host/upload/20200423/243f4e59f1b929951ef79c5f8be7468a.jpg', '', '', '', '0', 'image/jpeg', '0', 'jpg', '', '1587614269', null, null);
INSERT INTO `ea_system_uploadfile` VALUES ('299', 'local', 'head.jpg', 'http://admin.host/upload/20200512/a5ce9883379727324f5686ef61205ce2.jpg', '', '', '', '0', 'image/jpeg', '0', 'jpg', '', '1589255649', null, null);
INSERT INTO `ea_system_uploadfile` VALUES ('300', 'local', '896e5b87c9ca70e4.jpg', 'http://admin.host/upload/20200514/577c65f101639f53dbbc9e7aa346f81c.jpg', '', '', '', '0', 'image/jpeg', '0', 'jpg', '', '1589427798', null, null);
INSERT INTO `ea_system_uploadfile` VALUES ('301', 'local', '896e5b87c9ca70e4.jpg', 'http://admin.host/upload/20200514/98fc09b0c4ad4d793a6f04bef79a0edc.jpg', '', '', '', '0', 'image/jpeg', '0', 'jpg', '', '1589427840', null, null);
INSERT INTO `ea_system_uploadfile` VALUES ('302', 'local', '18811e7611c8f292.jpg', 'http://admin.host/upload/20200514/e1c6c9ef6a4b98b8f7d95a1a0191a2df.jpg', '', '', '', '0', 'image/jpeg', '0', 'jpg', '', '1589438645', null, null);
