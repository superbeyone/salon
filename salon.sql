/*
 Navicat Premium Data Transfer

 Source Server         : MySQL
 Source Server Type    : MySQL
 Source Server Version : 50635
 Source Host           : localhost:3306
 Source Schema         : salon

 Target Server Type    : MySQL
 Target Server Version : 50635
 File Encoding         : 65001

 Date: 11/05/2018 23:13:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for coffer
-- ----------------------------
DROP TABLE IF EXISTS `coffer`;
CREATE TABLE `coffer`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `now_money` decimal(8, 2) DEFAULT NULL,
  `last_money` decimal(8, 2) DEFAULT NULL,
  `create_date` datetime(0) DEFAULT NULL,
  `operator` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of coffer
-- ----------------------------
INSERT INTO `coffer` VALUES (1, 12.00, 0.00, '2018-04-02 15:30:45', 'admin');
INSERT INTO `coffer` VALUES (2, 37.00, 12.00, '2018-04-02 15:31:34', 'admin');
INSERT INTO `coffer` VALUES (3, 157.00, 37.00, '2018-04-02 17:13:01', 'admin');
INSERT INTO `coffer` VALUES (4, 257.00, 157.00, '2018-04-11 23:16:28', 'admin');
INSERT INTO `coffer` VALUES (5, 267.00, 257.00, '2018-04-11 23:37:22', 'admin');
INSERT INTO `coffer` VALUES (6, 387.00, 267.00, '2018-04-12 17:53:49', 'admin');
INSERT INTO `coffer` VALUES (7, 407.00, 387.00, '2018-04-15 10:42:21', 'admin');
INSERT INTO `coffer` VALUES (8, 507.00, 407.00, '2018-04-18 13:21:41', 'admin');
INSERT INTO `coffer` VALUES (9, 627.00, 507.00, '2018-04-18 13:21:54', 'admin');
INSERT INTO `coffer` VALUES (10, 757.00, 627.00, '2018-04-18 13:22:07', 'admin');
INSERT INTO `coffer` VALUES (11, 907.00, 757.00, '2018-04-18 13:22:17', 'admin');
INSERT INTO `coffer` VALUES (12, 987.00, 907.00, '2018-04-18 13:22:30', 'admin');
INSERT INTO `coffer` VALUES (13, 1077.00, 987.00, '2018-04-18 13:22:46', 'admin');
INSERT INTO `coffer` VALUES (14, 1187.00, 1077.00, '2018-04-18 13:22:57', 'admin');
INSERT INTO `coffer` VALUES (15, 1277.00, 1187.00, '2018-04-18 13:23:08', 'admin');
INSERT INTO `coffer` VALUES (16, 1387.00, 1277.00, '2018-04-18 13:23:18', 'admin');
INSERT INTO `coffer` VALUES (17, 1567.00, 1387.00, '2018-04-18 13:29:50', 'admin');
INSERT INTO `coffer` VALUES (18, 1647.00, 1567.00, '2018-04-18 13:40:25', 'admin');
INSERT INTO `coffer` VALUES (19, 2947.00, 1647.00, '2018-05-05 09:07:40', 'admin');
INSERT INTO `coffer` VALUES (20, 3047.00, 2947.00, '2018-05-05 09:09:08', 'admin');
INSERT INTO `coffer` VALUES (21, 3059.00, 3047.00, '2018-05-05 10:20:25', 'admin');
INSERT INTO `coffer` VALUES (22, 3182.00, 3059.00, '2018-05-05 10:21:48', 'admin');
INSERT INTO `coffer` VALUES (23, 3306.00, 3182.00, '2018-05-05 10:56:05', 'admin');
INSERT INTO `coffer` VALUES (24, 3426.00, 3306.00, '2018-05-05 09:23:41', 'admin');
INSERT INTO `coffer` VALUES (25, 3546.00, 3426.00, '2018-05-05 09:28:32', 'admin');
INSERT INTO `coffer` VALUES (26, 3646.00, 3546.00, '2018-05-05 09:29:00', 'admin');
INSERT INTO `coffer` VALUES (27, 3768.00, 3646.00, '2018-05-05 09:37:53', 'admin');
INSERT INTO `coffer` VALUES (28, 3868.00, 3768.00, '2018-05-05 09:42:50', 'admin');
INSERT INTO `coffer` VALUES (29, 4168.00, 3868.00, '2018-05-05 10:58:50', 'admin');
INSERT INTO `coffer` VALUES (30, 4268.00, 4168.00, '2018-05-05 11:11:04', 'gyc');

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `card_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '会员卡号',
  `username` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '姓名',
  `sex` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '性别',
  `password` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '登录密码',
  `pay_pwd` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '支付密码',
  `wallet` decimal(6, 2) DEFAULT NULL COMMENT '钱包余额',
  `pay_money` decimal(6, 2) DEFAULT NULL COMMENT '上次消费金额',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '手机',
  `email` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '邮箱',
  `credit_card` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '校园卡号',
  `c_id_card` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '身份证号',
  `college` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '院系',
  `grade` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '年级',
  `create_date` datetime(0) DEFAULT NULL COMMENT '注册日期',
  `update_date` datetime(0) DEFAULT NULL COMMENT '更新日期',
  `pay_date` datetime(0) DEFAULT NULL COMMENT '支付日期',
  `record` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '操作记录',
  `state` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '1' COMMENT '状态:0停用，1启用',
  `remark` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `operator` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '操作者',
  `deposit` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '充值状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 146 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES (111, '5976', '张飞', '0', '746216f6aef97dd5a85cdd849c35bbfb', '670b14728ad9902aecba32e22fa4f6bd', 828.41, 13.00, '1995-08-09', '15733338888', 'zf@outlook.com', '6222228888899999', '412829199308037889', '计算机', '2014级', '2018-02-21 19:39:11', '2018-05-05 10:56:05', '2018-05-05 10:51:42', NULL, '0', '啦啦啦', NULL, '1');
INSERT INTO `customer` VALUES (112, '6129', '李志', '1', 'f4d067967ea66792dc85e89c4df1ef9a', '670b14728ad9902aecba32e22fa4f6bd', 2609.00, 38.00, '2018-03-07', '15736950000', 'liz@outlook.com', '6217384834534582', '621819199208090346', '计算机', '2014', '2018-03-28 13:31:17', '2018-05-05 09:23:40', '2018-04-12 23:03:56', NULL, '1', '', NULL, '1');
INSERT INTO `customer` VALUES (115, '6130', '刘梦溪', '0', 'a87ff679a2f3e71d9181a67b7542122c', '670b14728ad9902aecba32e22fa4f6bd', 560.00, 18.00, '1995-03-29', '13898898865', 'lmx@qq.com', '', '', '', '', '2018-03-28 13:52:36', '2018-04-12 18:07:02', '2018-04-12 18:07:02', NULL, '1', '', NULL, '1');
INSERT INTO `customer` VALUES (116, '6218', '赵云', '1', 'eccbc87e4b5ce2fe28308fd9f2a7baf3', '670b14728ad9902aecba32e22fa4f6bd', 192.00, 10.00, '1993-07-15', '15987655678', 'zyun@qq.com', '', '675698199307157856', '外国语', '2014', '2018-03-28 13:54:31', '2018-05-05 11:11:04', '2018-04-18 13:24:09', NULL, '1', '', NULL, '1');
INSERT INTO `customer` VALUES (117, '6824', '林黛玉', '0', 'c20ad4d76fe97759aa27a0c99bff6710', '670b14728ad9902aecba32e22fa4f6bd', 150.00, 50.00, '1996-04-09', '13997653896', 'lindy@163.com', '', '', '文学院', '2015', '2018-03-28 14:01:57', '2018-05-05 11:11:55', '2018-05-05 11:11:55', NULL, '1', '', NULL, '1');
INSERT INTO `customer` VALUES (118, '5876', '薛宝钗', '0', '6512bd43d9caa6e02c990b0a82652dca', '670b14728ad9902aecba32e22fa4f6bd', 112.00, 18.00, '1995-08-17', '15678965679', 'xbx@163.com', '', '', '文学院', '2015', '2018-03-28 14:04:33', '2018-04-18 13:25:53', '2018-04-18 13:25:53', NULL, '1', '', NULL, '1');
INSERT INTO `customer` VALUES (126, '6723', '林冲', '1', '37693cfc748049e45d87b8c7d8b9aacd', '670b14728ad9902aecba32e22fa4f6bd', 117.00, 15.00, '1989-09-14', '15688266792', 'lc@126.com', '', '', '体育', '2013', '2018-03-28 14:48:57', '2018-04-18 13:27:47', '2018-04-18 13:27:47', NULL, '1', '', NULL, '1');
INSERT INTO `customer` VALUES (129, '2369', '甘宁', '1', '01161aaa0b6d1345dd8fe4e481144d84', '670b14728ad9902aecba32e22fa4f6bd', 180.00, 80.00, '1991-07-26', '15736366363', 'gn@qq.com', '', '', '生命科学', '2012', '2018-03-28 15:09:45', '2018-04-18 13:29:50', '2018-04-18 13:28:20', NULL, '1', '', NULL, '1');
INSERT INTO `customer` VALUES (130, '3467', '周公瑾', '1', '81dc9bdb52d04dc20036dbd8313ed055', '670b14728ad9902aecba32e22fa4f6bd', 183.00, 17.00, '1994-04-18', '13455556666', 'sqw@qq.com', '', '', '商学院', '2014', '2018-03-28 15:20:43', '2018-04-18 13:28:45', '2018-04-18 13:28:45', NULL, '1', '', NULL, '1');
INSERT INTO `customer` VALUES (131, '3589', '貂蝉', '0', 'd9729feb74992cc3482b350163a1a010', '670b14728ad9902aecba32e22fa4f6bd', 110.00, 90.00, '1989-04-20', '15578960823', 'dc@qq.com', '', '', '法学院', '2012', '2018-03-28 15:24:23', '2018-04-18 13:29:07', '2018-04-18 13:29:07', NULL, '1', '', NULL, '1');
INSERT INTO `customer` VALUES (132, '3842', '黄忠', '0', 'd81f9c1be2e08964bf9f24b15f0e4900', '670b14728ad9902aecba32e22fa4f6bd', 0.00, 0.00, '1995-04-24', '17389897654', 'hz@yandex.com', '', '', '', '', '2018-03-29 13:36:50', '2018-03-29 13:36:50', NULL, NULL, '1', '', NULL, NULL);
INSERT INTO `customer` VALUES (133, '5738', '郭子仪', '0', '0c0b3da4ac402bd86191d959be081114', '670b14728ad9902aecba32e22fa4f6bd', 0.00, 0.00, '1996-03-08', '15988526748', '', '', '', '文学院', '2016', '2018-03-29 13:37:02', '2018-03-29 13:37:02', NULL, NULL, '1', '', NULL, NULL);
INSERT INTO `customer` VALUES (134, '3458', '吴用', '1', 'cf7e4e52a148d66670e30a3b94735e72', '670b14728ad9902aecba32e22fa4f6bd', 0.00, 0.00, '1981-04-16', '15778733682', '', '', '', '', '', '2018-03-29 13:37:16', '2018-03-29 13:37:16', NULL, NULL, '1', '', NULL, NULL);
INSERT INTO `customer` VALUES (135, '6214', '张山峰', '0', 'c69eaffb229a01522c0c22b356f2a804', '670b14728ad9902aecba32e22fa4f6bd', 0.00, 0.00, '1991-07-25', '15678956789', '', '', '', '体育', '2014', '2018-03-29 13:37:24', '2018-03-29 13:37:24', NULL, NULL, '1', '', NULL, NULL);
INSERT INTO `customer` VALUES (136, '3465', '贾双喜', '0', 'c83e1063684dc479d10608633dc7fc62', '670b14728ad9902aecba32e22fa4f6bd', 0.00, 0.00, '1996-06-27', '13789273479', '', '', '', '计算机', '2014', '2018-03-29 13:37:45', '2018-03-29 13:37:45', NULL, NULL, '1', '', NULL, NULL);
INSERT INTO `customer` VALUES (137, '3453', '宋江', '1', '52746115ed4579e191e8a82c2c6682b5', '670b14728ad9902aecba32e22fa4f6bd', 0.00, 0.00, '1996-04-18', '17378963368', '', '', '', '', '', '2018-03-29 13:37:53', '2018-03-29 13:37:53', NULL, NULL, '1', '', NULL, NULL);
INSERT INTO `customer` VALUES (138, '3455', '刘玄德', '0', '77de9b030204b8d1074b01820016b7a5', '670b14728ad9902aecba32e22fa4f6bd', 0.00, 0.00, '1993-03-27', '13667288624', '', '', '', '会计', '2013', '2018-03-29 13:38:02', '2018-03-29 13:38:02', NULL, NULL, '1', '', NULL, NULL);
INSERT INTO `customer` VALUES (139, '6782', '马超', '0', 'a0a080f42e6f13b3a2df133f073095dd', '670b14728ad9902aecba32e22fa4f6bd', 0.00, 0.00, '1990-11-06', '15667677678', 'mc@163.com', '', '', '', '', '2018-03-29 14:38:21', '2018-03-29 14:38:21', NULL, NULL, '1', '', NULL, NULL);
INSERT INTO `customer` VALUES (140, '2345', '吕布', '1', '81b073de9370ea873f548e31b8adc081', '670b14728ad9902aecba32e22fa4f6bd', 315.00, 15.00, NULL, '15789900612', 'lb@qq.com', '', '', '', '', '2018-03-29 14:40:07', '2018-05-05 09:38:44', '2018-05-05 09:38:44', NULL, '1', '', NULL, '1');
INSERT INTO `customer` VALUES (141, '6928', '小乔', '0', '79caaef5e339aed843dd028ef92bf4ff', '670b14728ad9902aecba32e22fa4f6bd', 0.00, 0.00, '1996-07-18', '15899667852', '', '', '', '外国语', '2015', '2018-03-29 14:41:06', '2018-03-29 14:41:06', NULL, NULL, '1', '', NULL, NULL);
INSERT INTO `customer` VALUES (142, '10001', '江小白', '1', 'd89f3a35931c386956c1a402a8e09941', '670b14728ad9902aecba32e22fa4f6bd', 0.00, 0.00, '1994-09-10', '15733445643', 'jxb@qq.com', '6,211,234', '411456199409102980', '计算机与信息工程', '2012级', '2018-05-05 07:32:20', '2018-05-05 07:32:20', NULL, NULL, '1', '小白', NULL, NULL);
INSERT INTO `customer` VALUES (143, '10002', '江大白', '1', '9103c8c82514f39d8360c7430c4ee557', '670b14728ad9902aecba32e22fa4f6bd', 0.00, 0.00, '1994-09-10', '15733445642', 'jxb@qq.com', '6,211,234', '411456199409102980', '计算机与信息工程', '2014级', '2018-05-05 07:36:05', '2018-05-05 07:36:05', NULL, NULL, '1', '大白', NULL, NULL);
INSERT INTO `customer` VALUES (144, 'as', '小明', '1', 'f970e2767d0cfe75876ea857f92e319b', '670b14728ad9902aecba32e22fa4f6bd', 0.00, 0.00, '1996-05-05', '15699899909', 'as@qq.com', '', '', '', '', '2018-05-05 09:32:23', '2018-05-05 09:32:23', NULL, NULL, '1', '', NULL, NULL);
INSERT INTO `customer` VALUES (145, '10005', '李青', '0', '6eb887126d24e8f1cd8ad5033482c781', '670b14728ad9902aecba32e22fa4f6bd', 345.00, 30.00, '1994-08-09', '15736968899', 'lq@qq.com', '123,234', '32144555', '计算机', '2014级', '2018-05-05 09:40:09', '2018-05-05 11:02:11', '2018-05-05 11:02:11', NULL, '1', '好学生', NULL, '1');

-- ----------------------------
-- Table structure for customer_wallet
-- ----------------------------
DROP TABLE IF EXISTS `customer_wallet`;
CREATE TABLE `customer_wallet`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `cid` int(11) DEFAULT NULL COMMENT '顾客主键id',
  `wid` int(11) DEFAULT NULL COMMENT '职员主键',
  `pay_money` decimal(8, 2) DEFAULT NULL COMMENT '消费金额',
  `pay_property` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '消费属性',
  `pay_date` datetime(0) DEFAULT NULL COMMENT '消费日期',
  `remark` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注信息',
  `operator` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '操作者',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 169 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of customer_wallet
-- ----------------------------
INSERT INTO `customer_wallet` VALUES (109, 111, 1, 4.00, '洗头', '2018-02-21 19:24:28', NULL, 'admin');
INSERT INTO `customer_wallet` VALUES (110, 111, 1, 32.00, '理发', '2018-02-21 19:29:56', NULL, 'admin');
INSERT INTO `customer_wallet` VALUES (113, 111, 1, 12.59, '理发', '2018-02-21 19:46:13', NULL, 'admin');
INSERT INTO `customer_wallet` VALUES (114, 111, 1, 24.00, '洗头', '2018-02-21 19:48:51', NULL, 'admin');
INSERT INTO `customer_wallet` VALUES (116, 111, 1, 56.00, '剪刘海', '2018-03-21 17:42:46', NULL, 'admin');
INSERT INTO `customer_wallet` VALUES (117, 111, 1, 34.00, '剪刘海', '2018-03-21 17:45:31', NULL, 'admin');
INSERT INTO `customer_wallet` VALUES (118, 111, 88, 67.00, '染发', '2018-03-21 17:45:58', NULL, 'admin');
INSERT INTO `customer_wallet` VALUES (119, 111, 1, 25.00, '剪发', '2018-03-21 17:46:34', NULL, 'admin');
INSERT INTO `customer_wallet` VALUES (140, 111, 88, 25.00, '剪发', '2018-03-28 17:19:26', NULL, 'admin');
INSERT INTO `customer_wallet` VALUES (141, 111, 88, 98.00, '染发', '2018-03-28 17:20:26', NULL, 'admin');
INSERT INTO `customer_wallet` VALUES (142, 111, 88, 20.00, '理发', '2018-04-02 14:46:36', NULL, 'admin');
INSERT INTO `customer_wallet` VALUES (143, 111, 90, 12.00, '美发', '2018-04-02 15:06:36', NULL, 'admin');
INSERT INTO `customer_wallet` VALUES (144, 111, 88, 24.00, '洗头', '2018-04-02 15:29:37', NULL, 'admin');
INSERT INTO `customer_wallet` VALUES (145, 111, 88, 12.00, '洗头', '2018-04-02 15:30:45', NULL, 'admin');
INSERT INTO `customer_wallet` VALUES (146, 111, 88, 25.00, '美发', '2018-04-02 15:31:34', NULL, 'admin');
INSERT INTO `customer_wallet` VALUES (147, 115, 88, 20.00, '美发', '2018-04-12 18:05:03', NULL, 'admin');
INSERT INTO `customer_wallet` VALUES (148, 115, 88, 18.00, '理发', '2018-04-12 18:06:49', NULL, 'mayun');
INSERT INTO `customer_wallet` VALUES (149, 112, 88, 12.00, '理发', '2018-04-12 23:03:04', NULL, 'admin');
INSERT INTO `customer_wallet` VALUES (150, 112, 88, 38.00, '染发', '2018-04-12 23:03:56', NULL, 'admin');
INSERT INTO `customer_wallet` VALUES (151, 111, 88, 15.00, '理发', '2018-04-15 10:44:16', NULL, 'admin');
INSERT INTO `customer_wallet` VALUES (152, 116, 88, 20.00, '理发', '2018-04-18 13:23:44', NULL, 'admin');
INSERT INTO `customer_wallet` VALUES (153, 116, 1, 10.00, '洗头', '2018-04-18 13:24:09', NULL, 'admin');
INSERT INTO `customer_wallet` VALUES (154, 117, 1, 20.00, '染发', '2018-04-18 13:24:36', NULL, 'admin');
INSERT INTO `customer_wallet` VALUES (155, 118, 90, 18.00, '理发', '2018-04-18 13:25:53', NULL, 'admin');
INSERT INTO `customer_wallet` VALUES (156, 126, 88, 18.00, '理发', '2018-04-18 13:26:20', NULL, 'admin');
INSERT INTO `customer_wallet` VALUES (157, 126, 90, 15.00, '理发', '2018-04-18 13:27:47', NULL, 'admin');
INSERT INTO `customer_wallet` VALUES (158, 129, 88, 80.00, '染发', '2018-04-18 13:28:20', NULL, 'admin');
INSERT INTO `customer_wallet` VALUES (159, 130, 90, 17.00, '理发', '2018-04-18 13:28:45', NULL, 'admin');
INSERT INTO `customer_wallet` VALUES (160, 131, 88, 90.00, '染发', '2018-04-18 13:29:07', NULL, 'admin');
INSERT INTO `customer_wallet` VALUES (161, 111, 90, 20.00, '理发', '2018-04-18 13:42:40', NULL, 'admin');
INSERT INTO `customer_wallet` VALUES (162, 111, 88, 13.00, '理发', '2018-05-05 10:51:42', NULL, 'admin');
INSERT INTO `customer_wallet` VALUES (163, 140, 88, 12.00, '理发', '2018-05-05 09:29:55', NULL, 'admin');
INSERT INTO `customer_wallet` VALUES (164, 144, NULL, NULL, NULL, '2018-05-05 09:32:23', NULL, NULL);
INSERT INTO `customer_wallet` VALUES (165, 140, 88, 15.00, '理发', '2018-05-05 09:38:44', NULL, 'admin');
INSERT INTO `customer_wallet` VALUES (166, 145, 88, 25.00, '理发', '2018-05-05 11:01:35', NULL, 'admin');
INSERT INTO `customer_wallet` VALUES (167, 145, 1, 30.00, '理发', '2018-05-05 11:02:11', NULL, 'admin');
INSERT INTO `customer_wallet` VALUES (168, 117, 1, 50.00, '理发', '2018-05-05 11:11:55', NULL, 'gyc');

-- ----------------------------
-- Table structure for deposit
-- ----------------------------
DROP TABLE IF EXISTS `deposit`;
CREATE TABLE `deposit`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) DEFAULT NULL COMMENT '会员主键',
  `deposit_money` decimal(8, 2) DEFAULT NULL COMMENT '充值金额',
  `money` decimal(8, 2) DEFAULT NULL COMMENT '当前余额',
  `create_time` datetime(0) DEFAULT NULL COMMENT '充值日期',
  `operator` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '操作者',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of deposit
-- ----------------------------
INSERT INTO `deposit` VALUES (1, 111, 122.00, 220.41, '2018-04-02 14:42:29', 'admin');
INSERT INTO `deposit` VALUES (2, 111, 200.00, 420.41, '2018-04-02 14:44:02', 'admin');
INSERT INTO `deposit` VALUES (3, 111, 30.00, 357.41, '2018-04-02 16:06:58', 'admin');
INSERT INTO `deposit` VALUES (4, 111, 40.00, 397.41, '2018-04-02 16:08:28', 'admin');
INSERT INTO `deposit` VALUES (5, 111, 120.00, 517.41, '2018-04-02 17:13:01', 'admin');
INSERT INTO `deposit` VALUES (6, 115, 100.00, 105.00, '2018-04-11 23:16:28', 'admin');
INSERT INTO `deposit` VALUES (7, 115, 20.00, 125.00, '2018-04-11 23:16:52', 'admin');
INSERT INTO `deposit` VALUES (8, 115, 20.00, 145.00, '2018-04-11 23:17:08', 'admin');
INSERT INTO `deposit` VALUES (9, 115, 200.00, 345.00, '2018-04-11 23:17:36', 'admin');
INSERT INTO `deposit` VALUES (10, 115, 23.00, 368.00, '2018-04-11 23:33:50', 'admin');
INSERT INTO `deposit` VALUES (11, 112, 20.00, 1019.00, '2018-04-11 23:34:48', 'admin');
INSERT INTO `deposit` VALUES (12, 115, 10.00, 378.00, '2018-04-11 23:37:22', 'admin');
INSERT INTO `deposit` VALUES (13, 112, 120.00, 1139.00, '2018-04-12 17:43:27', 'admin');
INSERT INTO `deposit` VALUES (14, 115, 120.00, 498.00, '2018-04-12 17:45:10', 'admin');
INSERT INTO `deposit` VALUES (15, 115, 100.00, 598.00, '2018-04-12 17:47:44', 'admin');
INSERT INTO `deposit` VALUES (16, 116, 120.00, 122.00, '2018-04-12 17:53:47', 'admin');
INSERT INTO `deposit` VALUES (17, 111, 20.00, 537.41, '2018-04-15 10:42:16', 'admin');
INSERT INTO `deposit` VALUES (18, 117, 100.00, 100.00, '2018-04-18 13:21:40', 'admin');
INSERT INTO `deposit` VALUES (19, 117, 120.00, 220.00, '2018-04-18 13:21:54', 'admin');
INSERT INTO `deposit` VALUES (20, 118, 130.00, 130.00, '2018-04-18 13:22:07', 'admin');
INSERT INTO `deposit` VALUES (21, 126, 150.00, 150.00, '2018-04-18 13:22:17', 'admin');
INSERT INTO `deposit` VALUES (22, 129, 80.00, 80.00, '2018-04-18 13:22:30', 'admin');
INSERT INTO `deposit` VALUES (23, 130, 90.00, 90.00, '2018-04-18 13:22:46', 'admin');
INSERT INTO `deposit` VALUES (24, 130, 110.00, 200.00, '2018-04-18 13:22:57', 'admin');
INSERT INTO `deposit` VALUES (25, 131, 90.00, 90.00, '2018-04-18 13:23:08', 'admin');
INSERT INTO `deposit` VALUES (26, 131, 110.00, 200.00, '2018-04-18 13:23:18', 'admin');
INSERT INTO `deposit` VALUES (27, 129, 180.00, 180.00, '2018-04-18 13:29:50', 'admin');
INSERT INTO `deposit` VALUES (28, 111, 80.00, 602.41, '2018-04-18 13:40:25', 'admin');
INSERT INTO `deposit` VALUES (29, 112, 1300.00, 2389.00, '2018-05-05 09:07:40', 'admin');
INSERT INTO `deposit` VALUES (30, 112, 100.00, 2489.00, '2018-05-05 09:09:08', 'admin');
INSERT INTO `deposit` VALUES (31, 111, 12.00, 594.41, '2018-05-05 10:20:24', 'admin');
INSERT INTO `deposit` VALUES (32, 111, 123.00, 717.41, '2018-05-05 10:21:48', 'admin');
INSERT INTO `deposit` VALUES (33, 111, 124.00, 828.41, '2018-05-05 10:56:05', 'admin');
INSERT INTO `deposit` VALUES (34, 112, 120.00, 2609.00, '2018-05-05 09:23:40', 'admin');
INSERT INTO `deposit` VALUES (35, 140, 120.00, 120.00, '2018-05-05 09:28:32', 'admin');
INSERT INTO `deposit` VALUES (36, 140, 100.00, 220.00, '2018-05-05 09:29:00', 'admin');
INSERT INTO `deposit` VALUES (37, 140, 122.00, 330.00, '2018-05-05 09:37:53', 'admin');
INSERT INTO `deposit` VALUES (38, 145, 100.00, 100.00, '2018-05-05 09:42:50', 'admin');
INSERT INTO `deposit` VALUES (39, 145, 300.00, 400.00, '2018-05-05 10:58:50', 'admin');
INSERT INTO `deposit` VALUES (40, 116, 100.00, 192.00, '2018-05-05 11:11:04', 'gyc');

-- ----------------------------
-- Table structure for worker
-- ----------------------------
DROP TABLE IF EXISTS `worker`;
CREATE TABLE `worker`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `entry_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '入职ID',
  `username` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '姓名',
  `nickname` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '昵称',
  `sex` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '性别',
  `password` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '登录密码',
  `role` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '角色',
  `authority` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '权限',
  `entry_date` datetime(0) DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '入职日期',
  `address` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '家庭住址',
  `mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '手机号',
  `email` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '邮箱',
  `update_date` datetime(0) DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新日期',
  `record` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '操作记录',
  `state` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '工作状态',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 98 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of worker
-- ----------------------------
INSERT INTO `worker` VALUES (1, '001', 'admin', 'admin', '0', '21232f297a57a5a743894a0e4a801fc3', '1', '1,2,3', '2014-09-01 00:00:00', '河南新乡', '15899998888', 'admin@qq.com', '2018-04-12 23:20:35', '', '1', '管理员');
INSERT INTO `worker` VALUES (88, '002', 'super', '江孜', '1', '21232f297a57a5a743894a0e4a801fc3', '2', '1,2,3', '2018-04-11 00:00:00', '', '15666778900', 'jz@qq.com', '2018-05-09 11:01:48', '', '1', '江孜艺术');
INSERT INTO `worker` VALUES (90, '009', 'gyc', '关云长', '1', '21232f297a57a5a743894a0e4a801fc3', '3', '1,2', '2018-04-03 00:00:00', '', '15733338888', '123@qq.com', '2018-05-05 09:44:40', '', '1', '');
INSERT INTO `worker` VALUES (97, '007', 'mc', '马克', '0', '670b14728ad9902aecba32e22fa4f6bd', '3', '1,2', '2015-03-11 00:00:00', '', '15766667854', 'mc@qq.com', '2018-04-14 11:27:43', '', '1', '');

SET FOREIGN_KEY_CHECKS = 1;
