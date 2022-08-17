/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50616
Source Host           : 127.0.0.1:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2022-08-17 17:42:12
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `album_info`
-- ----------------------------
DROP TABLE IF EXISTS `album_info`;
CREATE TABLE `album_info` (
  `album_id` int(11) NOT NULL AUTO_INCREMENT,
  `album_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `album_describe` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_time` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `update_time` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `album_state` varchar(1) COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '0:状态正常 1:已停用',
  PRIMARY KEY (`album_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of album_info
-- ----------------------------
INSERT INTO `album_info` VALUES ('22', '游记', 'liuzhishan', '2022-08-17 09:16:48', '2022-08-17 09:16:48', '0');
INSERT INTO `album_info` VALUES ('23', 'onMyWay', '我的一天', '2022-08-17 09:18:44', '2022-08-17 09:21:26', '0');
INSERT INTO `album_info` VALUES ('24', '游记', 'liuzhishan', '2022-08-17 10:54:21', '2022-08-17 10:54:21', '0');
INSERT INTO `album_info` VALUES ('25', '游记', 'liuzhishan', '2022-08-17 10:54:24', '2022-08-17 10:54:24', '0');

-- ----------------------------
-- Table structure for `photo_info`
-- ----------------------------
DROP TABLE IF EXISTS `photo_info`;
CREATE TABLE `photo_info` (
  `photo_id` int(11) NOT NULL AUTO_INCREMENT,
  `album_id` int(11) NOT NULL,
  `photo_shumbnail_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photo_original_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photo_praise_num` int(11) DEFAULT NULL,
  PRIMARY KEY (`photo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of photo_info
-- ----------------------------

-- ----------------------------
-- Table structure for `security_question`
-- ----------------------------
DROP TABLE IF EXISTS `security_question`;
CREATE TABLE `security_question` (
  `question_id` int(11) NOT NULL,
  `question` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of security_question
-- ----------------------------
INSERT INTO `security_question` VALUES ('1', '小学名称？');
INSERT INTO `security_question` VALUES ('2', '印象最深的班主任名字？');
INSERT INTO `security_question` VALUES ('3', '第一辆车品牌？');
INSERT INTO `security_question` VALUES ('4', '母亲姓名？');
INSERT INTO `security_question` VALUES ('5', '父亲姓名？');
INSERT INTO `security_question` VALUES ('6', '爱人姓名？');
INSERT INTO `security_question` VALUES ('7', '宠物名字？');
INSERT INTO `security_question` VALUES ('8', '大学名称？');
INSERT INTO `security_question` VALUES ('9', '第一家公司名称？');

-- ----------------------------
-- Table structure for `tran_list`
-- ----------------------------
DROP TABLE IF EXISTS `tran_list`;
CREATE TABLE `tran_list` (
  `tran_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '交易id',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `tran_date` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '交易日期',
  `tran_time` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '交易时间',
  `tran_type` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '交易类型',
  `tran_seq` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '交易流水',
  `host_code` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '系统回执码',
  `host_msg` varchar(258) CHARACTER SET utf8 DEFAULT NULL COMMENT '系统回执信息',
  `host_ip` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '客户ip',
  `create_time` varchar(58) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建时间',
  `update_time` varchar(58) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`tran_id`),
  KEY `tran_seq_index` (`tran_seq`)
) ENGINE=InnoDB AUTO_INCREMENT=639 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tran_list
-- ----------------------------
INSERT INTO `tran_list` VALUES ('63', null, '20220601', '170801', '获取公钥', '2022060117080181572648', '000000', '成功', null, '2022-06-01 17:08:01', '2022-06-01 17:08:03');
INSERT INTO `tran_list` VALUES ('64', null, '20220601', '170804', '获取公钥', '2022060117080484785845', '000000', '成功', null, '2022-06-01 17:08:04', '2022-06-01 17:09:00');
INSERT INTO `tran_list` VALUES ('65', null, '20220601', '171028', '获取公钥', '202206011710281028798688', null, null, null, '2022-06-01 17:10:28', null);
INSERT INTO `tran_list` VALUES ('66', null, '20220601', '171348', '获取公钥', '202206011713481348376354', '000000', '成功', null, '2022-06-01 17:13:48', '2022-06-01 17:14:53');
INSERT INTO `tran_list` VALUES ('67', null, '20220601', '171718', '获取openId', '202206011717181718595018', '000001', '前端上传code为空', null, '2022-06-01 17:17:18', '2022-06-01 17:17:23');
INSERT INTO `tran_list` VALUES ('68', null, '20220601', '180340', '获取openId', '20220601180340340555598', '000001', '前端上传code为空', null, '2022-06-01 18:03:40', '2022-06-01 18:03:41');
INSERT INTO `tran_list` VALUES ('69', null, '20220601', '180431', '获取openId', '20220601180431431584025', '000001', '前端上传code为空', null, '2022-06-01 18:04:31', '2022-06-01 18:04:31');
INSERT INTO `tran_list` VALUES ('70', null, '20220601', '180457', '获取openId', '20220601180457457483599', null, null, null, '2022-06-01 18:04:57', null);
INSERT INTO `tran_list` VALUES ('71', null, '20220601', '180736', '获取openId', '20220601180736736393006', '000001', '前端上传code为空', null, '2022-06-01 18:07:36', '2022-06-01 18:07:38');
INSERT INTO `tran_list` VALUES ('72', null, '20220601', '180816', '获取openId', '20220601180816816489010', '000001', '前端上传code为空', null, '2022-06-01 18:08:16', '2022-06-01 18:08:16');
INSERT INTO `tran_list` VALUES ('73', null, '20220601', '181102', '获取openId', '20220601181102112174190', '000001', '获取openId失败', null, '2022-06-01 18:11:02', '2022-06-01 18:11:04');
INSERT INTO `tran_list` VALUES ('74', null, '20220601', '181117', '获取openId', '202206011811171117132840', '000001', '获取openId失败', null, '2022-06-01 18:11:17', '2022-06-01 18:11:17');
INSERT INTO `tran_list` VALUES ('75', null, '20220606', '151834', '获取openId', '202206061518341834857471', '000001', '前端上传code为空', null, '2022-06-06 15:18:34', '2022-06-06 15:18:43');
INSERT INTO `tran_list` VALUES ('76', null, '20220606', '151940', '获取openId', '202206061519401940797809', '000001', '前端上传code为空', null, '2022-06-06 15:19:40', '2022-06-06 15:19:41');
INSERT INTO `tran_list` VALUES ('77', null, '20220606', '152036', '获取openId', '202206061520362036951874', '000001', '前端上传code为空', null, '2022-06-06 15:20:36', '2022-06-06 15:20:37');
INSERT INTO `tran_list` VALUES ('78', null, '20220606', '152309', '获取openId', '20220606152309239393408', null, null, null, '2022-06-06 15:23:09', null);
INSERT INTO `tran_list` VALUES ('79', null, '20220606', '153601', '获取openId', '20220606153601361760657', '000001', '前端上传code为空', null, '2022-06-06 15:36:01', '2022-06-06 15:36:28');
INSERT INTO `tran_list` VALUES ('80', null, '20220606', '153958', '获取openId', '202206061539583958433945', '000001', '前端上传code为空', null, '2022-06-06 15:39:58', '2022-06-06 15:39:58');
INSERT INTO `tran_list` VALUES ('81', null, '20220606', '154048', '获取openId', '202206061540484048773121', '000001', '前端上传code为空', null, '2022-06-06 15:40:48', '2022-06-06 15:48:07');
INSERT INTO `tran_list` VALUES ('82', null, '20220606', '154807', '获取openId', '20220606154807487676074', '000001', '前端上传code为空', null, '2022-06-06 15:48:07', '2022-06-06 15:48:08');
INSERT INTO `tran_list` VALUES ('83', null, '20220606', '154817', '获取openId', '202206061548174817791404', '000001', '前端上传code为空', null, '2022-06-06 15:48:17', '2022-06-06 15:52:40');
INSERT INTO `tran_list` VALUES ('84', null, '20220606', '155312', '获取openId', '202206061553125312104389', '000001', '获取openId失败', null, '2022-06-06 15:53:12', '2022-06-06 15:54:50');
INSERT INTO `tran_list` VALUES ('85', null, '20220606', '155510', '获取openId', '202206061555105510767173', '000001', '获取openId失败', null, '2022-06-06 15:55:10', '2022-06-06 15:56:39');
INSERT INTO `tran_list` VALUES ('86', null, '20220606', '155649', '获取openId', '202206061556495649208516', '000001', '获取openId失败', null, '2022-06-06 15:56:49', '2022-06-06 15:56:52');
INSERT INTO `tran_list` VALUES ('87', null, '20220606', '155656', '获取openId', '202206061556565656910185', null, null, null, '2022-06-06 15:56:56', null);
INSERT INTO `tran_list` VALUES ('88', null, '20220606', '155852', '获取openId', '202206061558525852961108', '000001', '前端上传code为空', null, '2022-06-06 15:58:52', '2022-06-06 15:59:05');
INSERT INTO `tran_list` VALUES ('89', null, '20220606', '160058', '获取openId', '20220606160058058993565', '000001', '获取openId失败', null, '2022-06-06 16:00:58', '2022-06-06 16:02:26');
INSERT INTO `tran_list` VALUES ('90', null, '20220606', '160316', '获取openId', '20220606160316316371874', '100008', '系统异常:null', null, '2022-06-06 16:03:16', '2022-06-06 16:03:17');
INSERT INTO `tran_list` VALUES ('91', null, '20220606', '160410', '获取openId', '20220606160410410473980', '000001', '前端上传code为空', null, '2022-06-06 16:04:10', '2022-06-06 16:04:10');
INSERT INTO `tran_list` VALUES ('92', null, '20220606', '160428', '获取openId', '20220606160428428436022', '000001', '前端上传code为空', null, '2022-06-06 16:04:28', '2022-06-06 16:04:28');
INSERT INTO `tran_list` VALUES ('93', null, '20220606', '160450', '获取openId', '20220606160450450445230', null, null, null, '2022-06-06 16:04:50', null);
INSERT INTO `tran_list` VALUES ('94', null, '20220606', '161301', '获取openId', '20220606161301131614831', '000001', '前端上传code为空', null, '2022-06-06 16:13:01', '2022-06-06 16:14:33');
INSERT INTO `tran_list` VALUES ('95', null, '20220606', '161433', '获取openId', '202206061614331433871621', '000001', '获取openId失败', null, '2022-06-06 16:14:33', '2022-06-06 16:14:36');
INSERT INTO `tran_list` VALUES ('96', null, '20220606', '161505', '获取openId', '20220606161505155961901', '000001', '获取openId失败', null, '2022-06-06 16:15:05', '2022-06-06 16:15:05');
INSERT INTO `tran_list` VALUES ('97', null, '20220606', '161712', '获取openId', '202206061617121712417423', '000001', '获取openId失败', null, '2022-06-06 16:17:12', '2022-06-06 16:17:46');
INSERT INTO `tran_list` VALUES ('98', null, '20220606', '161959', '获取openId', '202206061619591959831852', null, null, null, '2022-06-06 16:19:59', null);
INSERT INTO `tran_list` VALUES ('99', null, '20220606', '162016', '获取openId', '202206061620162016829854', null, null, null, '2022-06-06 16:20:16', null);
INSERT INTO `tran_list` VALUES ('100', null, '20220606', '162901', '获取openId', '20220606162901291643873', null, null, null, '2022-06-06 16:29:01', null);
INSERT INTO `tran_list` VALUES ('101', null, '20220606', '163318', '获取openId', '202206061633183318338826', '000000', '获取openId成功', null, '2022-06-06 16:33:18', '2022-06-06 16:33:21');
INSERT INTO `tran_list` VALUES ('102', null, '20220606', '163349', '获取openId', '202206061633493349431920', '000000', '获取openId成功', null, '2022-06-06 16:33:49', '2022-06-06 16:34:56');
INSERT INTO `tran_list` VALUES ('103', null, '20220606', '164105', '获取openId', '20220606164105415782807', '000000', '获取openId成功', null, '2022-06-06 16:41:05', '2022-06-06 16:41:05');
INSERT INTO `tran_list` VALUES ('104', null, '20220606', '164105', '获取openId', '20220606164105415728932', null, null, null, '2022-06-06 16:41:05', null);
INSERT INTO `tran_list` VALUES ('105', null, '20220606', '164105', '获取openId', '20220606164105415106471', null, null, null, '2022-06-06 16:41:05', null);
INSERT INTO `tran_list` VALUES ('106', null, '20220606', '163651', '获取openId', '202206061636513651319781', null, null, null, '2022-06-06 16:36:51', null);
INSERT INTO `tran_list` VALUES ('107', null, '20220606', '164105', '获取openId', '20220606164105415400500', null, null, null, '2022-06-06 16:41:05', null);
INSERT INTO `tran_list` VALUES ('108', null, '20220606', '164152', '获取openId', '202206061641524152399742', '000000', '获取openId成功', null, '2022-06-06 16:41:52', '2022-06-06 16:41:52');
INSERT INTO `tran_list` VALUES ('109', null, '20220606', '164223', '获取openId', '202206061642234223974741', '000000', '获取openId成功', null, '2022-06-06 16:42:23', '2022-06-06 16:42:48');
INSERT INTO `tran_list` VALUES ('110', null, '20220606', '164433', '获取openId', '202206061644334433804254', '000000', '获取openId成功', null, '2022-06-06 16:44:33', '2022-06-06 16:44:41');
INSERT INTO `tran_list` VALUES ('111', null, '20220606', '164454', '获取openId', '202206061644544454600553', '000000', '获取openId成功', null, '2022-06-06 16:44:54', '2022-06-06 16:44:55');
INSERT INTO `tran_list` VALUES ('112', null, '20220606', '164634', '获取openId', '202206061646344634224795', '000000', '获取openId成功', null, '2022-06-06 16:46:34', '2022-06-06 16:46:34');
INSERT INTO `tran_list` VALUES ('113', null, '20220606', '165455', '获取openId', '202206061654555455584231', '000000', '获取openId成功', null, '2022-06-06 16:54:55', '2022-06-06 16:54:56');
INSERT INTO `tran_list` VALUES ('114', null, '20220606', '165527', '获取openId', '202206061655275527438337', '000000', '获取openId成功', null, '2022-06-06 16:55:27', '2022-06-06 16:55:27');
INSERT INTO `tran_list` VALUES ('115', null, '20220606', '171550', '获取openId', '202206061715501550724170', '000000', '获取openId成功', null, '2022-06-06 17:15:50', '2022-06-06 17:18:43');
INSERT INTO `tran_list` VALUES ('116', null, '20220606', '174730', '获取openId', '202206061747304730178388', '000000', '获取openId成功', null, '2022-06-06 17:47:30', '2022-06-06 17:47:30');
INSERT INTO `tran_list` VALUES ('117', null, '20220606', '175014', '获取openId', '202206061750145014251547', '000000', '获取openId成功', null, '2022-06-06 17:50:14', '2022-06-06 17:50:14');
INSERT INTO `tran_list` VALUES ('118', null, '20220606', '175048', '获取openId', '202206061750485048349588', '000000', '获取openId成功', null, '2022-06-06 17:50:48', '2022-06-06 17:50:48');
INSERT INTO `tran_list` VALUES ('119', null, '20220606', '175105', '获取openId', '20220606175105515507894', '000000', '获取openId成功', null, '2022-06-06 17:51:05', '2022-06-06 17:51:05');
INSERT INTO `tran_list` VALUES ('120', null, '20220606', '175127', '获取openId', '202206061751275127931662', '000000', '获取openId成功', null, '2022-06-06 17:51:27', '2022-06-06 17:51:27');
INSERT INTO `tran_list` VALUES ('121', null, '20220606', '175202', '获取openId', '20220606175202522981654', '000000', '获取openId成功', null, '2022-06-06 17:52:02', '2022-06-06 17:52:03');
INSERT INTO `tran_list` VALUES ('122', null, '20220606', '175334', '获取openId', '202206061753345334864571', '000000', '获取openId成功', null, '2022-06-06 17:53:34', '2022-06-06 17:53:34');
INSERT INTO `tran_list` VALUES ('123', null, '20220606', '180256', '获取openId', '20220606180256256305304', '000000', '获取openId成功', null, '2022-06-06 18:02:56', '2022-06-06 18:02:56');
INSERT INTO `tran_list` VALUES ('124', null, '20220606', '180525', '获取openId', '20220606180525525975255', '000000', '获取openId成功', null, '2022-06-06 18:05:25', '2022-06-06 18:05:25');
INSERT INTO `tran_list` VALUES ('125', null, '20220606', '180552', '获取openId', '20220606180552552681347', '000000', '获取openId成功', null, '2022-06-06 18:05:52', '2022-06-06 18:05:52');
INSERT INTO `tran_list` VALUES ('126', null, '20220606', '180624', '获取openId', '20220606180624624933963', '000000', '获取openId成功', null, '2022-06-06 18:06:24', '2022-06-06 18:06:25');
INSERT INTO `tran_list` VALUES ('127', null, '20220606', '180843', '获取openId', '20220606180843843442096', '000000', '获取openId成功', null, '2022-06-06 18:08:43', '2022-06-06 18:08:43');
INSERT INTO `tran_list` VALUES ('128', null, '20220606', '181020', '获取openId', '202206061810201020183769', '000000', '获取openId成功', null, '2022-06-06 18:10:20', '2022-06-06 18:10:20');
INSERT INTO `tran_list` VALUES ('129', null, '20220606', '181051', '获取openId', '202206061810511051433641', '000000', '获取openId成功', null, '2022-06-06 18:10:51', '2022-06-06 18:10:51');
INSERT INTO `tran_list` VALUES ('130', null, '20220606', '181120', '获取openId', '202206061811201120715743', '000000', '获取openId成功', null, '2022-06-06 18:11:20', '2022-06-06 18:11:20');
INSERT INTO `tran_list` VALUES ('131', null, '20220606', '181450', '获取openId', '202206061814501450566847', '000000', '获取openId成功', null, '2022-06-06 18:14:50', '2022-06-06 18:14:51');
INSERT INTO `tran_list` VALUES ('132', null, '20220606', '181535', '获取openId', '202206061815351535911533', '000000', '获取openId成功', null, '2022-06-06 18:15:35', '2022-06-06 18:15:35');
INSERT INTO `tran_list` VALUES ('133', null, '20220606', '181543', '获取openId', '202206061815431543779737', '000000', '获取openId成功', null, '2022-06-06 18:15:43', '2022-06-06 18:15:43');
INSERT INTO `tran_list` VALUES ('134', null, '20220606', '181630', '获取openId', '202206061816301630818134', '000000', '获取openId成功', null, '2022-06-06 18:16:30', '2022-06-06 18:16:30');
INSERT INTO `tran_list` VALUES ('135', null, '20220606', '181723', '获取openId', '202206061817231723977415', '000000', '获取openId成功', null, '2022-06-06 18:17:23', '2022-06-06 18:17:23');
INSERT INTO `tran_list` VALUES ('136', null, '20220606', '182346', '获取openId', '202206061823462346181709', '000000', '获取openId成功', null, '2022-06-06 18:23:46', '2022-06-06 18:23:47');
INSERT INTO `tran_list` VALUES ('137', null, '20220606', '182431', '获取openId', '202206061824312431142968', '000000', '获取openId成功', null, '2022-06-06 18:24:31', '2022-06-06 18:24:31');
INSERT INTO `tran_list` VALUES ('138', null, '20220606', '182545', '获取openId', '202206061825452545349956', '000000', '获取openId成功', null, '2022-06-06 18:25:45', '2022-06-06 18:25:46');
INSERT INTO `tran_list` VALUES ('139', null, '20220606', '182624', '获取openId', '202206061826242624869969', '000000', '获取openId成功', null, '2022-06-06 18:26:24', '2022-06-06 18:26:24');
INSERT INTO `tran_list` VALUES ('140', null, '20220606', '182721', '获取openId', '202206061827212721358986', '000000', '获取openId成功', null, '2022-06-06 18:27:21', '2022-06-06 18:27:21');
INSERT INTO `tran_list` VALUES ('141', null, '20220606', '182730', '获取openId', '202206061827302730442551', '000000', '获取openId成功', null, '2022-06-06 18:27:30', '2022-06-06 18:27:30');
INSERT INTO `tran_list` VALUES ('142', null, '20220606', '182815', '获取openId', '202206061828152815180796', '000000', '获取openId成功', null, '2022-06-06 18:28:15', '2022-06-06 18:28:15');
INSERT INTO `tran_list` VALUES ('143', null, '20220606', '182853', '获取openId', '202206061828532853960052', '000000', '获取openId成功', null, '2022-06-06 18:28:53', '2022-06-06 18:28:54');
INSERT INTO `tran_list` VALUES ('144', null, '20220606', '183110', '获取openId', '202206061831103110102490', '000000', '获取openId成功', null, '2022-06-06 18:31:10', '2022-06-06 18:31:10');
INSERT INTO `tran_list` VALUES ('145', null, '20220606', '183305', '获取openId', '20220606183305335561445', '000000', '获取openId成功', null, '2022-06-06 18:33:05', '2022-06-06 18:33:05');
INSERT INTO `tran_list` VALUES ('146', null, '20220607', '150408', '获取openId', '2022060715040848852350', '000000', '获取openId成功', null, '2022-06-07 15:04:08', '2022-06-07 15:05:34');
INSERT INTO `tran_list` VALUES ('147', null, '20220607', '150735', '获取openId', '20220607150735735660241', '000000', '获取openId成功', null, '2022-06-07 15:07:35', '2022-06-07 15:07:35');
INSERT INTO `tran_list` VALUES ('148', null, '20220607', '150746', '获取openId', '20220607150746746141052', '000000', '获取openId成功', null, '2022-06-07 15:07:46', '2022-06-07 15:07:46');
INSERT INTO `tran_list` VALUES ('149', null, '20220607', '150759', '获取openId', '20220607150759759668505', '000000', '获取openId成功', null, '2022-06-07 15:07:59', '2022-06-07 15:08:00');
INSERT INTO `tran_list` VALUES ('150', null, '20220607', '150810', '获取openId', '20220607150810810169030', '000000', '获取openId成功', null, '2022-06-07 15:08:10', '2022-06-07 15:08:11');
INSERT INTO `tran_list` VALUES ('151', null, '20220607', '151236', '获取openId', '202206071512361236104219', '000000', '获取openId成功', null, '2022-06-07 15:12:36', '2022-06-07 15:12:37');
INSERT INTO `tran_list` VALUES ('152', null, '20220607', '151826', '获取openId', '202206071518261826731958', '000000', '获取openId成功', null, '2022-06-07 15:18:26', '2022-06-07 15:18:26');
INSERT INTO `tran_list` VALUES ('153', null, '20220607', '152258', '获取openId', '202206071522582258797153', '000000', '获取openId成功', null, '2022-06-07 15:22:58', '2022-06-07 15:22:59');
INSERT INTO `tran_list` VALUES ('154', null, '20220607', '152312', '获取openId', '202206071523122312182904', '000000', '获取openId成功', null, '2022-06-07 15:23:12', '2022-06-07 15:23:13');
INSERT INTO `tran_list` VALUES ('155', null, '20220607', '152412', '获取openId', '202206071524122412140198', '000000', '获取openId成功', null, '2022-06-07 15:24:12', '2022-06-07 15:24:12');
INSERT INTO `tran_list` VALUES ('156', null, '20220607', '152526', '获取openId', '202206071525262526425542', '000000', '获取openId成功', null, '2022-06-07 15:25:26', '2022-06-07 15:25:27');
INSERT INTO `tran_list` VALUES ('157', null, '20220607', '152915', '获取openId', '202206071529152915569442', '000000', '获取openId成功', null, '2022-06-07 15:29:15', '2022-06-07 15:29:15');
INSERT INTO `tran_list` VALUES ('158', null, '20220607', '153513', '获取openId', '202206071535133513371850', '000000', '获取openId成功', null, '2022-06-07 15:35:13', '2022-06-07 15:35:13');
INSERT INTO `tran_list` VALUES ('159', null, '20220607', '154009', '获取openId', '20220607154009409710216', '000000', '获取openId成功', null, '2022-06-07 15:40:09', '2022-06-07 15:40:10');
INSERT INTO `tran_list` VALUES ('160', null, '20220607', '154735', '获取openId', '202206071547354735425046', '000000', '获取openId成功', null, '2022-06-07 15:47:35', '2022-06-07 15:47:35');
INSERT INTO `tran_list` VALUES ('161', null, '20220607', '155029', '获取openId', '202206071550295029105044', '000000', '获取openId成功', null, '2022-06-07 15:50:29', '2022-06-07 15:50:30');
INSERT INTO `tran_list` VALUES ('162', null, '20220607', '155103', '获取openId', '20220607155103513992791', '000000', '获取openId成功', null, '2022-06-07 15:51:03', '2022-06-07 15:51:04');
INSERT INTO `tran_list` VALUES ('163', null, '20220607', '155117', '获取openId', '202206071551175117794793', '000000', '获取openId成功', null, '2022-06-07 15:51:17', '2022-06-07 15:51:18');
INSERT INTO `tran_list` VALUES ('164', null, '20220607', '155136', '获取openId', '202206071551365136400614', '000000', '获取openId成功', null, '2022-06-07 15:51:36', '2022-06-07 15:51:36');
INSERT INTO `tran_list` VALUES ('165', null, '20220607', '155141', '获取openId', '202206071551415141899934', '000000', '获取openId成功', null, '2022-06-07 15:51:41', '2022-06-07 15:51:41');
INSERT INTO `tran_list` VALUES ('166', null, '20220607', '155217', '获取openId', '202206071552175217229351', '000000', '获取openId成功', null, '2022-06-07 15:52:17', '2022-06-07 15:52:17');
INSERT INTO `tran_list` VALUES ('167', null, '20220607', '155331', '获取openId', '202206071553315331741567', '000000', '获取openId成功', null, '2022-06-07 15:53:31', '2022-06-07 15:53:31');
INSERT INTO `tran_list` VALUES ('168', null, '20220607', '155502', '获取openId', '20220607155502552775160', '000000', '获取openId成功', null, '2022-06-07 15:55:02', '2022-06-07 15:55:02');
INSERT INTO `tran_list` VALUES ('169', null, '20220607', '155526', '获取openId', '202206071555265526775434', '000000', '获取openId成功', null, '2022-06-07 15:55:26', '2022-06-07 15:55:26');
INSERT INTO `tran_list` VALUES ('170', null, '20220607', '155801', '获取openId', '20220607155801581247530', '000000', '获取openId成功', null, '2022-06-07 15:58:01', '2022-06-07 15:58:01');
INSERT INTO `tran_list` VALUES ('171', null, '20220607', '155831', '获取openId', '202206071558315831661437', '000000', '获取openId成功', null, '2022-06-07 15:58:31', '2022-06-07 15:58:31');
INSERT INTO `tran_list` VALUES ('172', null, '20220607', '155954', '获取openId', '202206071559545954915068', '000000', '获取openId成功', null, '2022-06-07 15:59:54', '2022-06-07 15:59:55');
INSERT INTO `tran_list` VALUES ('173', null, '20220607', '160027', '获取openId', '20220607160027027308036', '000000', '获取openId成功', null, '2022-06-07 16:00:27', '2022-06-07 16:00:28');
INSERT INTO `tran_list` VALUES ('174', null, '20220607', '160107', '获取openId', '2022060716010717554813', '000000', '获取openId成功', null, '2022-06-07 16:01:07', '2022-06-07 16:01:08');
INSERT INTO `tran_list` VALUES ('175', null, '20220607', '160205', '获取openId', '2022060716020525668416', '000000', '获取openId成功', null, '2022-06-07 16:02:05', '2022-06-07 16:02:05');
INSERT INTO `tran_list` VALUES ('176', null, '20220607', '160212', '获取openId', '20220607160212212396966', '000000', '获取openId成功', null, '2022-06-07 16:02:12', '2022-06-07 16:02:13');
INSERT INTO `tran_list` VALUES ('177', null, '20220607', '160234', '获取openId', '20220607160234234803377', '000000', '获取openId成功', null, '2022-06-07 16:02:34', '2022-06-07 16:02:35');
INSERT INTO `tran_list` VALUES ('178', null, '20220607', '160303', '获取openId', '2022060716030333610565', '000000', '获取openId成功', null, '2022-06-07 16:03:03', '2022-06-07 16:03:03');
INSERT INTO `tran_list` VALUES ('179', null, '20220607', '160327', '获取openId', '20220607160327327295727', '000000', '获取openId成功', null, '2022-06-07 16:03:27', '2022-06-07 16:03:28');
INSERT INTO `tran_list` VALUES ('180', null, '20220607', '160500', '获取openId', '2022060716050050988322', '000000', '获取openId成功', null, '2022-06-07 16:05:00', '2022-06-07 16:05:00');
INSERT INTO `tran_list` VALUES ('181', null, '20220607', '160806', '获取openId', '2022060716080686210631', '000000', '获取openId成功', null, '2022-06-07 16:08:06', '2022-06-07 16:08:06');
INSERT INTO `tran_list` VALUES ('182', null, '20220607', '160827', '获取openId', '20220607160827827941126', '000000', '获取openId成功', null, '2022-06-07 16:08:27', '2022-06-07 16:08:27');
INSERT INTO `tran_list` VALUES ('183', null, '20220607', '161120', '获取openId', '202206071611201120855183', '000000', '获取openId成功', null, '2022-06-07 16:11:20', '2022-06-07 16:11:20');
INSERT INTO `tran_list` VALUES ('184', null, '20220607', '161141', '获取openId', '202206071611411141849247', '000000', '获取openId成功', null, '2022-06-07 16:11:41', '2022-06-07 16:11:41');
INSERT INTO `tran_list` VALUES ('185', null, '20220607', '161200', '获取openId', '20220607161200120834609', '000000', '获取openId成功', null, '2022-06-07 16:12:00', '2022-06-07 16:12:01');
INSERT INTO `tran_list` VALUES ('186', null, '20220607', '161218', '获取openId', '202206071612181218971734', '000000', '获取openId成功', null, '2022-06-07 16:12:18', '2022-06-07 16:12:19');
INSERT INTO `tran_list` VALUES ('187', null, '20220607', '161251', '获取openId', '202206071612511251719446', '000000', '获取openId成功', null, '2022-06-07 16:12:51', '2022-06-07 16:12:52');
INSERT INTO `tran_list` VALUES ('188', null, '20220607', '161313', '获取openId', '202206071613131313335620', '000000', '获取openId成功', null, '2022-06-07 16:13:13', '2022-06-07 16:13:13');
INSERT INTO `tran_list` VALUES ('189', null, '20220607', '161532', '获取openId', '202206071615321532692052', '000000', '获取openId成功', null, '2022-06-07 16:15:32', '2022-06-07 16:15:33');
INSERT INTO `tran_list` VALUES ('190', null, '20220607', '161648', '获取openId', '202206071616481648999189', '000000', '获取openId成功', null, '2022-06-07 16:16:48', '2022-06-07 16:16:48');
INSERT INTO `tran_list` VALUES ('191', null, '20220607', '161714', '获取openId', '202206071617141714697526', '000000', '获取openId成功', null, '2022-06-07 16:17:14', '2022-06-07 16:17:14');
INSERT INTO `tran_list` VALUES ('192', null, '20220607', '161734', '获取openId', '202206071617341734759557', '000000', '获取openId成功', null, '2022-06-07 16:17:34', '2022-06-07 16:17:35');
INSERT INTO `tran_list` VALUES ('193', null, '20220607', '161802', '获取openId', '20220607161802182975844', '000000', '获取openId成功', null, '2022-06-07 16:18:02', '2022-06-07 16:18:02');
INSERT INTO `tran_list` VALUES ('194', null, '20220607', '161830', '获取openId', '202206071618301830894140', '000000', '获取openId成功', null, '2022-06-07 16:18:30', '2022-06-07 16:18:31');
INSERT INTO `tran_list` VALUES ('195', null, '20220607', '161913', '获取openId', '202206071619131913442690', '000000', '获取openId成功', null, '2022-06-07 16:19:13', '2022-06-07 16:19:14');
INSERT INTO `tran_list` VALUES ('196', null, '20220607', '162000', '获取openId', '20220607162000200442230', '000000', '获取openId成功', null, '2022-06-07 16:20:00', '2022-06-07 16:20:00');
INSERT INTO `tran_list` VALUES ('197', null, '20220607', '162038', '获取openId', '202206071620382038336313', '000000', '获取openId成功', null, '2022-06-07 16:20:38', '2022-06-07 16:20:38');
INSERT INTO `tran_list` VALUES ('198', null, '20220607', '162302', '获取openId', '20220607162302232539922', '000000', '获取openId成功', null, '2022-06-07 16:23:02', '2022-06-07 16:23:03');
INSERT INTO `tran_list` VALUES ('199', null, '20220607', '162408', '获取openId', '20220607162408248378952', '000000', '获取openId成功', null, '2022-06-07 16:24:08', '2022-06-07 16:24:08');
INSERT INTO `tran_list` VALUES ('200', null, '20220607', '162416', '获取openId', '202206071624162416776179', '000000', '获取openId成功', null, '2022-06-07 16:24:16', '2022-06-07 16:24:16');
INSERT INTO `tran_list` VALUES ('201', null, '20220607', '162434', '获取openId', '202206071624342434162312', '000000', '获取openId成功', null, '2022-06-07 16:24:34', '2022-06-07 16:24:34');
INSERT INTO `tran_list` VALUES ('202', null, '20220607', '162502', '获取openId', '20220607162502252786082', '000000', '获取openId成功', null, '2022-06-07 16:25:02', '2022-06-07 16:25:03');
INSERT INTO `tran_list` VALUES ('203', null, '20220607', '162638', '获取openId', '202206071626382638957397', '000000', '获取openId成功', null, '2022-06-07 16:26:38', '2022-06-07 16:26:38');
INSERT INTO `tran_list` VALUES ('204', null, '20220607', '162940', '获取openId', '202206071629402940899514', '000000', '获取openId成功', null, '2022-06-07 16:29:40', '2022-06-07 16:29:41');
INSERT INTO `tran_list` VALUES ('205', null, '20220607', '162956', '获取openId', '202206071629562956446442', '000000', '获取openId成功', null, '2022-06-07 16:29:56', '2022-06-07 16:29:57');
INSERT INTO `tran_list` VALUES ('206', null, '20220607', '163042', '获取openId', '202206071630423042419026', '000000', '获取openId成功', null, '2022-06-07 16:30:42', '2022-06-07 16:30:42');
INSERT INTO `tran_list` VALUES ('207', null, '20220607', '164340', '获取openId', '202206071643404340356821', '000000', '获取openId成功', null, '2022-06-07 16:43:40', '2022-06-07 16:43:40');
INSERT INTO `tran_list` VALUES ('208', null, '20220607', '164421', '获取openId', '202206071644214421872777', '000000', '获取openId成功', null, '2022-06-07 16:44:21', '2022-06-07 16:44:22');
INSERT INTO `tran_list` VALUES ('209', null, '20220607', '164550', '获取openId', '202206071645504550448533', '000000', '获取openId成功', null, '2022-06-07 16:45:50', '2022-06-07 16:45:50');
INSERT INTO `tran_list` VALUES ('210', null, '20220607', '164649', '获取openId', '202206071646494649529682', '000000', '获取openId成功', null, '2022-06-07 16:46:49', '2022-06-07 16:46:49');
INSERT INTO `tran_list` VALUES ('211', null, '20220607', '164735', '获取openId', '202206071647354735624519', '000000', '获取openId成功', null, '2022-06-07 16:47:35', '2022-06-07 16:47:36');
INSERT INTO `tran_list` VALUES ('212', null, '20220607', '164922', '获取openId', '202206071649224922540753', '000000', '获取openId成功', null, '2022-06-07 16:49:22', '2022-06-07 16:49:22');
INSERT INTO `tran_list` VALUES ('213', null, '20220607', '164959', '获取openId', '202206071649594959829462', '000000', '获取openId成功', null, '2022-06-07 16:49:59', '2022-06-07 16:49:59');
INSERT INTO `tran_list` VALUES ('214', null, '20220607', '165123', '获取openId', '202206071651235123588631', '000000', '获取openId成功', null, '2022-06-07 16:51:23', '2022-06-07 16:51:23');
INSERT INTO `tran_list` VALUES ('215', null, '20220607', '165211', '获取openId', '202206071652115211212513', '000000', '获取openId成功', null, '2022-06-07 16:52:11', '2022-06-07 16:52:11');
INSERT INTO `tran_list` VALUES ('216', null, '20220607', '165242', '获取openId', '202206071652425242556123', '000000', '获取openId成功', null, '2022-06-07 16:52:42', '2022-06-07 16:52:42');
INSERT INTO `tran_list` VALUES ('217', null, '20220607', '165253', '获取openId', '202206071652535253813365', '000000', '获取openId成功', null, '2022-06-07 16:52:53', '2022-06-07 16:52:53');
INSERT INTO `tran_list` VALUES ('218', null, '20220607', '165259', '获取openId', '202206071652595259422843', '000000', '获取openId成功', null, '2022-06-07 16:52:59', '2022-06-07 16:52:59');
INSERT INTO `tran_list` VALUES ('219', null, '20220607', '170100', '获取openId', '2022060717010010302131', '000000', '获取openId成功', null, '2022-06-07 17:01:00', '2022-06-07 17:01:00');
INSERT INTO `tran_list` VALUES ('220', null, '20220607', '170344', '获取openId', '20220607170344344539632', '000000', '获取openId成功', null, '2022-06-07 17:03:44', '2022-06-07 17:03:44');
INSERT INTO `tran_list` VALUES ('221', null, '20220607', '170500', '获取openId', '2022060717050050650506', '000000', '获取openId成功', null, '2022-06-07 17:05:00', '2022-06-07 17:05:01');
INSERT INTO `tran_list` VALUES ('222', null, '20220607', '172505', '获取openId', '20220607172505255224984', '000000', '获取openId成功', null, '2022-06-07 17:25:05', '2022-06-07 17:25:06');
INSERT INTO `tran_list` VALUES ('223', null, '20220607', '172704', '获取openId', '20220607172704274525540', '000000', '获取openId成功', null, '2022-06-07 17:27:04', '2022-06-07 17:27:04');
INSERT INTO `tran_list` VALUES ('224', null, '20220607', '172803', '获取openId', '20220607172803283152305', '000000', '获取openId成功', null, '2022-06-07 17:28:03', '2022-06-07 17:28:03');
INSERT INTO `tran_list` VALUES ('225', null, '20220607', '172821', '获取openId', '202206071728212821395324', '000000', '获取openId成功', null, '2022-06-07 17:28:21', '2022-06-07 17:28:21');
INSERT INTO `tran_list` VALUES ('226', null, '20220607', '173428', '获取openId', '202206071734283428416193', '000000', '获取openId成功', null, '2022-06-07 17:34:28', '2022-06-07 17:34:29');
INSERT INTO `tran_list` VALUES ('227', null, '20220607', '173447', '获取openId', '202206071734473447186727', '000000', '获取openId成功', null, '2022-06-07 17:34:47', '2022-06-07 17:34:48');
INSERT INTO `tran_list` VALUES ('228', null, '20220607', '173530', '获取openId', '202206071735303530559263', '000000', '获取openId成功', null, '2022-06-07 17:35:30', '2022-06-07 17:35:30');
INSERT INTO `tran_list` VALUES ('229', null, '20220607', '173613', '获取openId', '202206071736133613984597', '000000', '获取openId成功', null, '2022-06-07 17:36:13', '2022-06-07 17:36:13');
INSERT INTO `tran_list` VALUES ('230', null, '20220607', '174400', '获取openId', '20220607174400440526298', '000000', '获取openId成功', null, '2022-06-07 17:44:00', '2022-06-07 17:44:07');
INSERT INTO `tran_list` VALUES ('231', null, '20220607', '174423', '获取openId', '202206071744234423856341', '000000', '获取openId成功', null, '2022-06-07 17:44:23', '2022-06-07 17:44:24');
INSERT INTO `tran_list` VALUES ('232', null, '20220607', '174458', '获取openId', '202206071744584458671797', '000000', '获取openId成功', null, '2022-06-07 17:44:58', '2022-06-07 17:45:00');
INSERT INTO `tran_list` VALUES ('233', null, '20220607', '174512', '获取openId', '202206071745124512699205', '000000', '获取openId成功', null, '2022-06-07 17:45:12', '2022-06-07 17:45:13');
INSERT INTO `tran_list` VALUES ('234', null, '20220607', '174532', '获取openId', '202206071745324532151634', '000000', '获取openId成功', null, '2022-06-07 17:45:32', '2022-06-07 17:45:33');
INSERT INTO `tran_list` VALUES ('235', null, '20220607', '174542', '获取openId', '202206071745424542864963', '000000', '获取openId成功', null, '2022-06-07 17:45:42', '2022-06-07 17:45:42');
INSERT INTO `tran_list` VALUES ('236', null, '20220607', '174547', '获取openId', '202206071745474547864647', '000000', '获取openId成功', null, '2022-06-07 17:45:47', '2022-06-07 17:45:48');
INSERT INTO `tran_list` VALUES ('237', null, '20220607', '174553', '获取openId', '202206071745534553519613', '000000', '获取openId成功', null, '2022-06-07 17:45:53', '2022-06-07 17:45:53');
INSERT INTO `tran_list` VALUES ('238', null, '20220607', '174645', '获取openId', '202206071746454645199924', '000000', '获取openId成功', null, '2022-06-07 17:46:45', '2022-06-07 17:46:46');
INSERT INTO `tran_list` VALUES ('239', null, '20220607', '174736', '获取openId', '202206071747364736647546', '000000', '获取openId成功', null, '2022-06-07 17:47:36', '2022-06-07 17:47:36');
INSERT INTO `tran_list` VALUES ('240', null, '20220607', '180023', '获取openId', '20220607180023023878775', '000000', '获取openId成功', null, '2022-06-07 18:00:23', '2022-06-07 18:00:23');
INSERT INTO `tran_list` VALUES ('241', null, '20220607', '180031', '登陆', '20220607180031031140013', '100008', '系统异常:nested exception is org.apache.ibatis.exceptions.TooManyResultsException: Expected one result (or null) to be returned by selectOne(), but found: 2', null, '2022-06-07 18:00:31', '2022-06-07 18:00:31');
INSERT INTO `tran_list` VALUES ('242', null, '20220607', '180059', '登陆', '20220607180059059734164', '100008', '系统异常:nested exception is org.apache.ibatis.exceptions.TooManyResultsException: Expected one result (or null) to be returned by selectOne(), but found: 2', null, '2022-06-07 18:00:59', '2022-06-07 18:11:41');
INSERT INTO `tran_list` VALUES ('243', null, '20220607', '181213', '登陆', '202206071812131213832601', '100008', '系统异常:null', null, '2022-06-07 18:12:13', '2022-06-07 18:12:14');
INSERT INTO `tran_list` VALUES ('244', null, '20220607', '181352', '登陆', '202206071813521352670790', '100003', '用户不存在', null, '2022-06-07 18:13:52', '2022-06-07 18:13:53');
INSERT INTO `tran_list` VALUES ('245', null, '20220607', '181405', '登陆', '20220607181405145713090', '100003', '用户不存在', null, '2022-06-07 18:14:05', '2022-06-07 18:14:05');
INSERT INTO `tran_list` VALUES ('246', null, '20220607', '181409', '登陆', '20220607181409149928614', '100003', '用户不存在', null, '2022-06-07 18:14:09', '2022-06-07 18:14:09');
INSERT INTO `tran_list` VALUES ('247', null, '20220607', '181504', '获取openId', '20220607181504154950901', '000000', '获取openId成功', null, '2022-06-07 18:15:04', '2022-06-07 18:15:07');
INSERT INTO `tran_list` VALUES ('248', null, '20220607', '181757', '获取openId', '202206071817571757612608', '000000', '获取openId成功', null, '2022-06-07 18:17:57', '2022-06-07 18:17:57');
INSERT INTO `tran_list` VALUES ('249', null, '20220607', '181840', '获取openId', '202206071818401840370898', '000000', '获取openId成功', null, '2022-06-07 18:18:40', '2022-06-07 18:18:41');
INSERT INTO `tran_list` VALUES ('250', null, '20220607', '182043', '获取openId', '202206071820432043162204', '000000', '获取openId成功', null, '2022-06-07 18:20:43', '2022-06-07 18:20:44');
INSERT INTO `tran_list` VALUES ('251', null, '20220607', '182145', '获取openId', '202206071821452145774544', '000000', '获取openId成功', null, '2022-06-07 18:21:45', '2022-06-07 18:21:45');
INSERT INTO `tran_list` VALUES ('252', null, '20220607', '182300', '获取公钥', '20220607182300230386687', '000000', '成功', null, '2022-06-07 18:23:00', '2022-06-07 18:23:00');
INSERT INTO `tran_list` VALUES ('253', null, '20220607', '182300', '获取openId', '20220607182300230476297', '000000', '获取openId成功', null, '2022-06-07 18:23:00', '2022-06-07 18:23:00');
INSERT INTO `tran_list` VALUES ('254', null, '20220607', '182326', '获取公钥', '202206071823262326704231', '000000', '成功', null, '2022-06-07 18:23:26', '2022-06-07 18:23:26');
INSERT INTO `tran_list` VALUES ('255', null, '20220607', '182341', '获取openId', '202206071823412341806296', '000000', '获取openId成功', null, '2022-06-07 18:23:41', '2022-06-07 18:23:42');
INSERT INTO `tran_list` VALUES ('256', null, '20220607', '182407', '获取公钥', '20220607182407247395750', '000000', '成功', null, '2022-06-07 18:24:07', '2022-06-07 18:24:07');
INSERT INTO `tran_list` VALUES ('257', null, '20220607', '182410', '获取openId', '202206071824102410722994', '000000', '获取openId成功', null, '2022-06-07 18:24:10', '2022-06-07 18:24:10');
INSERT INTO `tran_list` VALUES ('258', null, '20220610', '152615', '获取公钥', '202206101526152615328009', '100003', '用户不存在', null, '2022-06-10 15:26:15', '2022-06-10 15:26:50');
INSERT INTO `tran_list` VALUES ('259', null, '20220610', '152518', '登陆', '202206101525182518590032', null, null, null, '2022-06-10 15:25:18', null);
INSERT INTO `tran_list` VALUES ('260', null, '20220610', '152832', '登陆', '202206101528322832899435', '100003', '用户不存在', null, '2022-06-10 15:28:32', '2022-06-10 15:28:32');
INSERT INTO `tran_list` VALUES ('261', null, '20220610', '152840', '登陆', '202206101528402840956375', '100003', '用户不存在', null, '2022-06-10 15:28:40', '2022-06-10 15:28:40');
INSERT INTO `tran_list` VALUES ('262', null, '20220610', '152942', '获取公钥', '202206101529422942110339', '000000', '成功', null, '2022-06-10 15:29:42', '2022-06-10 15:29:42');
INSERT INTO `tran_list` VALUES ('263', null, '20220610', '152943', '获取openId', '202206101529432943258695', '000000', '获取openId成功', null, '2022-06-10 15:29:43', '2022-06-10 15:29:46');
INSERT INTO `tran_list` VALUES ('264', null, '20220610', '153627', '获取公钥', '202206101536273627572972', '000000', '成功', null, '2022-06-10 15:36:27', '2022-06-10 15:36:27');
INSERT INTO `tran_list` VALUES ('265', null, '20220610', '153628', '获取openId', '202206101536283628253373', '000000', '获取openId成功', null, '2022-06-10 15:36:28', '2022-06-10 15:36:28');
INSERT INTO `tran_list` VALUES ('266', null, '20220610', '154002', '登陆', '20220610154002402692397', '100003', '用户不存在', null, '2022-06-10 15:40:02', '2022-06-10 15:40:02');
INSERT INTO `tran_list` VALUES ('267', null, '20220610', '154013', '登陆', '202206101540134013851380', '100003', '用户不存在', null, '2022-06-10 15:40:13', '2022-06-10 15:40:41');
INSERT INTO `tran_list` VALUES ('268', null, '20220610', '154120', '登陆', '202206101541204120598627', '000001', '登陆：账号或手机号不能为空', null, '2022-06-10 15:41:20', '2022-06-10 15:41:25');
INSERT INTO `tran_list` VALUES ('269', null, '20220610', '154330', '登陆', '202206101543304330381850', '000001', '登陆：账号或手机号不能为空', null, '2022-06-10 15:43:30', '2022-06-10 15:43:30');
INSERT INTO `tran_list` VALUES ('270', null, '20220610', '154336', '登陆', '202206101543364336562261', '000001', '登陆：账号或手机号不能为空', null, '2022-06-10 15:43:36', '2022-06-10 15:43:36');
INSERT INTO `tran_list` VALUES ('271', null, '20220610', '154441', '登陆', '202206101544414441664224', '000001', '登陆：账号或手机号不能为空', null, '2022-06-10 15:44:41', '2022-06-10 15:44:41');
INSERT INTO `tran_list` VALUES ('272', null, '20220610', '154630', '获取公钥', '202206101546304630849337', '000000', '成功', null, '2022-06-10 15:46:30', '2022-06-10 15:46:30');
INSERT INTO `tran_list` VALUES ('273', null, '20220610', '154632', '获取openId', '202206101546324632144520', '000000', '获取openId成功', null, '2022-06-10 15:46:32', '2022-06-10 15:46:34');
INSERT INTO `tran_list` VALUES ('274', null, '20220610', '154643', '登陆', '202206101546434643199605', '000001', '登陆：账号或手机号不能为空', null, '2022-06-10 15:46:43', '2022-06-10 15:46:43');
INSERT INTO `tran_list` VALUES ('275', null, '20220610', '155438', '登陆', '202206101554385438946854', '000001', '登陆：账号或手机号不能为空', null, '2022-06-10 15:54:38', '2022-06-10 15:54:38');
INSERT INTO `tran_list` VALUES ('276', null, '20220610', '155443', '获取公钥', '202206101554435443575968', '000000', '成功', null, '2022-06-10 15:54:43', '2022-06-10 15:54:43');
INSERT INTO `tran_list` VALUES ('277', null, '20220610', '155444', '登陆', '202206101554445444391279', '000001', '登陆：账号或手机号不能为空', null, '2022-06-10 15:54:44', '2022-06-10 15:54:44');
INSERT INTO `tran_list` VALUES ('278', null, '20220610', '155641', '获取公钥', '202206101556415641572741', '000000', '成功', null, '2022-06-10 15:56:41', '2022-06-10 15:56:41');
INSERT INTO `tran_list` VALUES ('279', null, '20220610', '161101', '获取公钥', '20220610161101111884845', '000000', '成功', null, '2022-06-10 16:11:01', '2022-06-10 16:11:01');
INSERT INTO `tran_list` VALUES ('280', null, '20220610', '161101', '获取openId', '20220610161101111588941', '000000', '获取openId成功', null, '2022-06-10 16:11:01', '2022-06-10 16:11:01');
INSERT INTO `tran_list` VALUES ('281', null, '20220610', '161218', '获取公钥', '202206101612181218586147', '000000', '成功', null, '2022-06-10 16:12:18', '2022-06-10 16:12:18');
INSERT INTO `tran_list` VALUES ('282', null, '20220610', '161218', '获取openId', '202206101612181218793193', '000000', '获取openId成功', null, '2022-06-10 16:12:18', '2022-06-10 16:12:18');
INSERT INTO `tran_list` VALUES ('283', null, '20220610', '161311', '获取公钥', '202206101613111311949070', '000000', '成功', null, '2022-06-10 16:13:11', '2022-06-10 16:13:11');
INSERT INTO `tran_list` VALUES ('284', null, '20220610', '161311', '获取openId', '202206101613111311459218', '000000', '获取openId成功', null, '2022-06-10 16:13:11', '2022-06-10 16:13:12');
INSERT INTO `tran_list` VALUES ('285', null, '20220610', '161430', '获取公钥', '202206101614301430386816', '000000', '成功', null, '2022-06-10 16:14:30', '2022-06-10 16:14:30');
INSERT INTO `tran_list` VALUES ('286', null, '20220610', '161430', '获取openId', '202206101614301430412642', '000000', '获取openId成功', null, '2022-06-10 16:14:30', '2022-06-10 16:14:31');
INSERT INTO `tran_list` VALUES ('287', null, '20220610', '161612', '获取公钥', '202206101616121612103180', '000000', '成功', null, '2022-06-10 16:16:12', '2022-06-10 16:16:12');
INSERT INTO `tran_list` VALUES ('288', null, '20220610', '161612', '获取openId', '202206101616121612911130', '000000', '获取openId成功', null, '2022-06-10 16:16:12', '2022-06-10 16:16:12');
INSERT INTO `tran_list` VALUES ('289', null, '20220610', '161742', '获取公钥', '202206101617421742641106', '000000', '成功', null, '2022-06-10 16:17:42', '2022-06-10 16:17:42');
INSERT INTO `tran_list` VALUES ('290', null, '20220610', '161742', '获取openId', '202206101617421742130096', '000000', '获取openId成功', null, '2022-06-10 16:17:42', '2022-06-10 16:17:42');
INSERT INTO `tran_list` VALUES ('291', null, '20220610', '161823', '获取公钥', '202206101618231823927006', '000000', '成功', null, '2022-06-10 16:18:23', '2022-06-10 16:18:23');
INSERT INTO `tran_list` VALUES ('292', null, '20220610', '161823', '获取openId', '202206101618231823358736', '000000', '获取openId成功', null, '2022-06-10 16:18:23', '2022-06-10 16:18:24');
INSERT INTO `tran_list` VALUES ('293', null, '20220610', '161913', '获取公钥', '202206101619131913197948', '000000', '成功', null, '2022-06-10 16:19:13', '2022-06-10 16:19:13');
INSERT INTO `tran_list` VALUES ('294', null, '20220610', '161913', '获取openId', '202206101619131913128341', '000000', '获取openId成功', null, '2022-06-10 16:19:13', '2022-06-10 16:19:14');
INSERT INTO `tran_list` VALUES ('295', null, '20220610', '161923', '获取公钥', '202206101619231923394023', '000000', '成功', null, '2022-06-10 16:19:23', '2022-06-10 16:19:23');
INSERT INTO `tran_list` VALUES ('296', null, '20220610', '161924', '获取openId', '202206101619241924513301', '000000', '获取openId成功', null, '2022-06-10 16:19:24', '2022-06-10 16:19:24');
INSERT INTO `tran_list` VALUES ('297', null, '20220610', '162008', '获取公钥', '20220610162008208462755', '000000', '成功', null, '2022-06-10 16:20:08', '2022-06-10 16:20:08');
INSERT INTO `tran_list` VALUES ('298', null, '20220610', '162008', '获取openId', '20220610162008208220459', '000000', '获取openId成功', null, '2022-06-10 16:20:08', '2022-06-10 16:20:08');
INSERT INTO `tran_list` VALUES ('299', null, '20220610', '162025', '获取公钥', '202206101620252025240986', '000000', '成功', null, '2022-06-10 16:20:25', '2022-06-10 16:20:25');
INSERT INTO `tran_list` VALUES ('300', null, '20220610', '162025', '获取openId', '202206101620252025834123', '000000', '获取openId成功', null, '2022-06-10 16:20:25', '2022-06-10 16:20:26');
INSERT INTO `tran_list` VALUES ('301', null, '20220610', '162028', '获取公钥', '202206101620282028863094', '000000', '成功', null, '2022-06-10 16:20:28', '2022-06-10 16:20:28');
INSERT INTO `tran_list` VALUES ('302', null, '20220610', '162028', '获取openId', '202206101620282028320842', '000000', '获取openId成功', null, '2022-06-10 16:20:28', '2022-06-10 16:20:30');
INSERT INTO `tran_list` VALUES ('303', null, '20220610', '162047', '获取公钥', '202206101620472047155450', '000000', '成功', null, '2022-06-10 16:20:47', '2022-06-10 16:20:47');
INSERT INTO `tran_list` VALUES ('304', null, '20220610', '162047', '获取openId', '202206101620472047942672', '000000', '获取openId成功', null, '2022-06-10 16:20:47', '2022-06-10 16:20:48');
INSERT INTO `tran_list` VALUES ('305', null, '20220610', '162229', '获取公钥', '202206101622292229854698', '000000', '成功', null, '2022-06-10 16:22:29', '2022-06-10 16:22:29');
INSERT INTO `tran_list` VALUES ('306', null, '20220610', '162230', '获取openId', '202206101622302230642001', '000000', '获取openId成功', null, '2022-06-10 16:22:30', '2022-06-10 16:22:30');
INSERT INTO `tran_list` VALUES ('307', null, '20220610', '162255', '获取公钥', '202206101622552255872615', '000000', '成功', null, '2022-06-10 16:22:55', '2022-06-10 16:22:55');
INSERT INTO `tran_list` VALUES ('308', null, '20220610', '162308', '获取公钥', '20220610162308238870903', '000000', '成功', null, '2022-06-10 16:23:08', '2022-06-10 16:23:08');
INSERT INTO `tran_list` VALUES ('309', null, '20220610', '162401', '获取公钥', '20220610162401241790168', '000000', '成功', null, '2022-06-10 16:24:01', '2022-06-10 16:24:01');
INSERT INTO `tran_list` VALUES ('310', null, '20220610', '162402', '获取openId', '20220610162402242358356', '000000', '获取openId成功', null, '2022-06-10 16:24:02', '2022-06-10 16:24:02');
INSERT INTO `tran_list` VALUES ('311', null, '20220610', '162425', '获取公钥', '202206101624252425616761', '000000', '成功', null, '2022-06-10 16:24:25', '2022-06-10 16:24:25');
INSERT INTO `tran_list` VALUES ('312', null, '20220610', '162534', '获取公钥', '202206101625342534968593', '000000', '成功', null, '2022-06-10 16:25:34', '2022-06-10 16:25:34');
INSERT INTO `tran_list` VALUES ('313', null, '20220610', '162534', '获取openId', '202206101625342534393122', '000000', '获取openId成功', null, '2022-06-10 16:25:34', '2022-06-10 16:25:34');
INSERT INTO `tran_list` VALUES ('314', null, '20220610', '162631', '获取公钥', '202206101626312631271318', '000000', '成功', null, '2022-06-10 16:26:31', '2022-06-10 16:26:31');
INSERT INTO `tran_list` VALUES ('315', null, '20220610', '162631', '获取openId', '202206101626312631744546', '000000', '获取openId成功', null, '2022-06-10 16:26:31', '2022-06-10 16:26:32');
INSERT INTO `tran_list` VALUES ('316', null, '20220610', '162642', '获取公钥', '202206101626422642651693', '000000', '成功', null, '2022-06-10 16:26:42', '2022-06-10 16:26:42');
INSERT INTO `tran_list` VALUES ('317', null, '20220610', '162643', '获取openId', '202206101626432643929066', '000000', '获取openId成功', null, '2022-06-10 16:26:43', '2022-06-10 16:26:43');
INSERT INTO `tran_list` VALUES ('318', null, '20220610', '162650', '获取公钥', '202206101626502650456109', '000000', '成功', null, '2022-06-10 16:26:50', '2022-06-10 16:26:50');
INSERT INTO `tran_list` VALUES ('319', null, '20220610', '162651', '获取openId', '202206101626512651947503', '000000', '获取openId成功', null, '2022-06-10 16:26:51', '2022-06-10 16:26:51');
INSERT INTO `tran_list` VALUES ('320', null, '20220610', '162736', '获取公钥', '202206101627362736433926', '000000', '成功', null, '2022-06-10 16:27:36', '2022-06-10 16:27:36');
INSERT INTO `tran_list` VALUES ('321', null, '20220610', '162736', '获取openId', '202206101627362736240944', '000000', '获取openId成功', null, '2022-06-10 16:27:36', '2022-06-10 16:27:37');
INSERT INTO `tran_list` VALUES ('322', null, '20220610', '162748', '获取公钥', '202206101627482748170122', '000000', '成功', null, '2022-06-10 16:27:48', '2022-06-10 16:27:48');
INSERT INTO `tran_list` VALUES ('323', null, '20220610', '162748', '获取openId', '202206101627482748449327', '000000', '获取openId成功', null, '2022-06-10 16:27:48', '2022-06-10 16:27:48');
INSERT INTO `tran_list` VALUES ('324', null, '20220610', '162810', '获取公钥', '202206101628102810547259', '000000', '成功', null, '2022-06-10 16:28:10', '2022-06-10 16:28:10');
INSERT INTO `tran_list` VALUES ('325', null, '20220610', '162811', '获取openId', '202206101628112811622096', '000000', '获取openId成功', null, '2022-06-10 16:28:11', '2022-06-10 16:28:11');
INSERT INTO `tran_list` VALUES ('326', null, '20220610', '162840', '获取公钥', '202206101628402840455048', '000000', '成功', null, '2022-06-10 16:28:40', '2022-06-10 16:28:40');
INSERT INTO `tran_list` VALUES ('327', null, '20220610', '162841', '获取openId', '202206101628412841589846', '000000', '获取openId成功', null, '2022-06-10 16:28:41', '2022-06-10 16:28:41');
INSERT INTO `tran_list` VALUES ('328', null, '20220610', '163434', '获取公钥', '202206101634343434623365', '000000', '成功', null, '2022-06-10 16:34:34', '2022-06-10 16:34:34');
INSERT INTO `tran_list` VALUES ('329', null, '20220610', '163434', '获取openId', '202206101634343434232266', '000000', '获取openId成功', null, '2022-06-10 16:34:34', '2022-06-10 16:34:35');
INSERT INTO `tran_list` VALUES ('330', null, '20220610', '163710', '获取公钥', '202206101637103710570561', '000000', '成功', null, '2022-06-10 16:37:10', '2022-06-10 16:37:10');
INSERT INTO `tran_list` VALUES ('331', null, '20220610', '163710', '获取openId', '202206101637103710722113', '000000', '获取openId成功', null, '2022-06-10 16:37:10', '2022-06-10 16:37:10');
INSERT INTO `tran_list` VALUES ('332', null, '20220610', '163731', '获取公钥', '202206101637313731577830', '000000', '成功', null, '2022-06-10 16:37:31', '2022-06-10 16:37:31');
INSERT INTO `tran_list` VALUES ('333', null, '20220610', '163732', '获取openId', '202206101637323732223344', '000000', '获取openId成功', null, '2022-06-10 16:37:32', '2022-06-10 16:37:32');
INSERT INTO `tran_list` VALUES ('334', null, '20220610', '163933', '获取公钥', '202206101639333933956059', '000000', '成功', null, '2022-06-10 16:39:33', '2022-06-10 16:39:33');
INSERT INTO `tran_list` VALUES ('335', null, '20220610', '163934', '获取openId', '202206101639343934661561', '000000', '获取openId成功', null, '2022-06-10 16:39:34', '2022-06-10 16:39:34');
INSERT INTO `tran_list` VALUES ('336', null, '20220610', '164115', '获取公钥', '202206101641154115111603', '000000', '成功', null, '2022-06-10 16:41:15', '2022-06-10 16:41:16');
INSERT INTO `tran_list` VALUES ('337', null, '20220610', '164116', '获取openId', '202206101641164116630669', '000000', '获取openId成功', null, '2022-06-10 16:41:16', '2022-06-10 16:41:16');
INSERT INTO `tran_list` VALUES ('338', null, '20220610', '164319', '获取公钥', '202206101643194319428753', '000000', '成功', null, '2022-06-10 16:43:19', '2022-06-10 16:43:19');
INSERT INTO `tran_list` VALUES ('339', null, '20220610', '164319', '获取openId', '202206101643194319616987', '000000', '获取openId成功', null, '2022-06-10 16:43:19', '2022-06-10 16:43:19');
INSERT INTO `tran_list` VALUES ('340', null, '20220610', '164337', '获取公钥', '202206101643374337320083', '000000', '成功', null, '2022-06-10 16:43:37', '2022-06-10 16:43:37');
INSERT INTO `tran_list` VALUES ('341', null, '20220610', '164337', '获取openId', '202206101643374337703025', '000000', '获取openId成功', null, '2022-06-10 16:43:37', '2022-06-10 16:43:37');
INSERT INTO `tran_list` VALUES ('342', null, '20220610', '164443', '获取公钥', '202206101644434443991356', '000000', '成功', null, '2022-06-10 16:44:43', '2022-06-10 16:44:43');
INSERT INTO `tran_list` VALUES ('343', null, '20220610', '164443', '获取openId', '202206101644434443101881', '000000', '获取openId成功', null, '2022-06-10 16:44:43', '2022-06-10 16:44:43');
INSERT INTO `tran_list` VALUES ('344', null, '20220610', '164447', '获取公钥', '202206101644474447579224', '000000', '成功', null, '2022-06-10 16:44:47', '2022-06-10 16:44:47');
INSERT INTO `tran_list` VALUES ('345', null, '20220610', '164447', '获取openId', '202206101644474447789859', '000000', '获取openId成功', null, '2022-06-10 16:44:47', '2022-06-10 16:44:47');
INSERT INTO `tran_list` VALUES ('346', null, '20220610', '164512', '获取公钥', '202206101645124512140684', '000000', '成功', null, '2022-06-10 16:45:12', '2022-06-10 16:45:12');
INSERT INTO `tran_list` VALUES ('347', null, '20220610', '164512', '获取openId', '202206101645124512271672', '000000', '获取openId成功', null, '2022-06-10 16:45:12', '2022-06-10 16:45:13');
INSERT INTO `tran_list` VALUES ('348', null, '20220610', '164521', '获取公钥', '202206101645214521360175', '000000', '成功', null, '2022-06-10 16:45:21', '2022-06-10 16:45:21');
INSERT INTO `tran_list` VALUES ('349', null, '20220610', '164521', '获取openId', '202206101645214521577799', '000000', '获取openId成功', null, '2022-06-10 16:45:21', '2022-06-10 16:45:21');
INSERT INTO `tran_list` VALUES ('350', null, '20220610', '164534', '获取公钥', '202206101645344534139671', '000000', '成功', null, '2022-06-10 16:45:34', '2022-06-10 16:45:34');
INSERT INTO `tran_list` VALUES ('351', null, '20220610', '164535', '获取openId', '202206101645354535457503', '000000', '获取openId成功', null, '2022-06-10 16:45:35', '2022-06-10 16:45:35');
INSERT INTO `tran_list` VALUES ('352', null, '20220610', '164605', '获取公钥', '20220610164605465409226', '000000', '成功', null, '2022-06-10 16:46:05', '2022-06-10 16:46:05');
INSERT INTO `tran_list` VALUES ('353', null, '20220610', '164605', '获取openId', '20220610164605465570176', '000000', '获取openId成功', null, '2022-06-10 16:46:05', '2022-06-10 16:46:05');
INSERT INTO `tran_list` VALUES ('354', null, '20220610', '164618', '获取公钥', '202206101646184618139609', '000000', '成功', null, '2022-06-10 16:46:18', '2022-06-10 16:46:18');
INSERT INTO `tran_list` VALUES ('355', null, '20220610', '164618', '获取openId', '202206101646184618670393', '000000', '获取openId成功', null, '2022-06-10 16:46:18', '2022-06-10 16:46:18');
INSERT INTO `tran_list` VALUES ('356', null, '20220610', '164700', '获取公钥', '20220610164700470318216', '000000', '成功', null, '2022-06-10 16:47:00', '2022-06-10 16:47:00');
INSERT INTO `tran_list` VALUES ('357', null, '20220610', '164700', '获取openId', '20220610164700470633100', '000000', '获取openId成功', null, '2022-06-10 16:47:00', '2022-06-10 16:47:01');
INSERT INTO `tran_list` VALUES ('358', null, '20220610', '165202', '获取公钥', '20220610165202522616893', '000000', '成功', null, '2022-06-10 16:52:02', '2022-06-10 16:52:03');
INSERT INTO `tran_list` VALUES ('359', null, '20220610', '165246', '获取公钥', '202206101652465246131001', '000000', '成功', null, '2022-06-10 16:52:46', '2022-06-10 16:52:46');
INSERT INTO `tran_list` VALUES ('360', null, '20220610', '165319', '获取公钥', '202206101653195319902042', '000000', '成功', null, '2022-06-10 16:53:19', '2022-06-10 16:53:19');
INSERT INTO `tran_list` VALUES ('361', null, '20220610', '165442', '获取公钥', '202206101654425442689481', '000000', '成功', null, '2022-06-10 16:54:42', '2022-06-10 16:54:42');
INSERT INTO `tran_list` VALUES ('362', null, '20220610', '165522', '获取公钥', '202206101655225522919081', '000000', '成功', null, '2022-06-10 16:55:22', '2022-06-10 16:55:22');
INSERT INTO `tran_list` VALUES ('363', null, '20220610', '165554', '获取公钥', '202206101655545554239652', '000000', '成功', null, '2022-06-10 16:55:54', '2022-06-10 16:55:54');
INSERT INTO `tran_list` VALUES ('364', null, '20220610', '165739', '获取公钥', '202206101657395739394573', '000000', '成功', null, '2022-06-10 16:57:39', '2022-06-10 16:57:39');
INSERT INTO `tran_list` VALUES ('365', null, '20220610', '170148', '获取公钥', '20220610170148148128472', '000000', '成功', null, '2022-06-10 17:01:48', '2022-06-10 17:01:48');
INSERT INTO `tran_list` VALUES ('366', null, '20220610', '170148', '获取openId', '20220610170148148598791', '000000', '获取openId成功', null, '2022-06-10 17:01:48', '2022-06-10 17:01:48');
INSERT INTO `tran_list` VALUES ('367', null, '20220610', '170208', '获取公钥', '2022061017020828538909', '000000', '成功', null, '2022-06-10 17:02:08', '2022-06-10 17:02:08');
INSERT INTO `tran_list` VALUES ('368', null, '20220610', '170208', '获取openId', '2022061017020828671976', '000000', '获取openId成功', null, '2022-06-10 17:02:08', '2022-06-10 17:02:09');
INSERT INTO `tran_list` VALUES ('369', null, '20220610', '170223', '获取公钥', '20220610170223223211950', '000000', '成功', null, '2022-06-10 17:02:23', '2022-06-10 17:02:23');
INSERT INTO `tran_list` VALUES ('370', null, '20220610', '170224', '获取openId', '20220610170224224350780', '000000', '获取openId成功', null, '2022-06-10 17:02:24', '2022-06-10 17:02:24');
INSERT INTO `tran_list` VALUES ('371', null, '20220610', '170242', '获取公钥', '20220610170242242936687', '000000', '成功', null, '2022-06-10 17:02:42', '2022-06-10 17:02:42');
INSERT INTO `tran_list` VALUES ('372', null, '20220610', '170243', '获取openId', '20220610170243243113402', '000000', '获取openId成功', null, '2022-06-10 17:02:43', '2022-06-10 17:02:43');
INSERT INTO `tran_list` VALUES ('373', null, '20220610', '170400', '获取公钥', '2022061017040040801934', '000000', '成功', null, '2022-06-10 17:04:00', '2022-06-10 17:04:00');
INSERT INTO `tran_list` VALUES ('374', null, '20220610', '170400', '获取openId', '2022061017040040857464', '000000', '获取openId成功', null, '2022-06-10 17:04:00', '2022-06-10 17:04:01');
INSERT INTO `tran_list` VALUES ('375', null, '20220610', '170420', '获取公钥', '20220610170420420951745', '000000', '成功', null, '2022-06-10 17:04:20', '2022-06-10 17:04:20');
INSERT INTO `tran_list` VALUES ('376', null, '20220610', '170420', '获取openId', '20220610170420420812924', '000000', '获取openId成功', null, '2022-06-10 17:04:20', '2022-06-10 17:04:21');
INSERT INTO `tran_list` VALUES ('377', null, '20220610', '170428', '获取公钥', '20220610170428428403265', '000000', '成功', null, '2022-06-10 17:04:28', '2022-06-10 17:04:28');
INSERT INTO `tran_list` VALUES ('378', null, '20220610', '170428', '获取openId', '20220610170428428591246', '000000', '获取openId成功', null, '2022-06-10 17:04:28', '2022-06-10 17:04:28');
INSERT INTO `tran_list` VALUES ('379', null, '20220610', '170453', '获取公钥', '20220610170453453715382', '000000', '成功', null, '2022-06-10 17:04:53', '2022-06-10 17:04:53');
INSERT INTO `tran_list` VALUES ('380', null, '20220610', '170453', '获取openId', '20220610170453453763790', '000000', '获取openId成功', null, '2022-06-10 17:04:53', '2022-06-10 17:04:53');
INSERT INTO `tran_list` VALUES ('381', null, '20220610', '170531', '获取公钥', '20220610170531531114390', '000000', '成功', null, '2022-06-10 17:05:31', '2022-06-10 17:05:31');
INSERT INTO `tran_list` VALUES ('382', null, '20220610', '170531', '获取openId', '20220610170531531218158', '000000', '获取openId成功', null, '2022-06-10 17:05:31', '2022-06-10 17:05:31');
INSERT INTO `tran_list` VALUES ('383', null, '20220610', '170814', '获取公钥', '20220610170814814413244', '000000', '成功', null, '2022-06-10 17:08:14', '2022-06-10 17:08:14');
INSERT INTO `tran_list` VALUES ('384', null, '20220610', '170814', '获取openId', '20220610170814814446286', '000000', '获取openId成功', null, '2022-06-10 17:08:14', '2022-06-10 17:08:14');
INSERT INTO `tran_list` VALUES ('385', null, '20220610', '170923', '获取公钥', '20220610170923923105751', '000000', '成功', null, '2022-06-10 17:09:23', '2022-06-10 17:09:23');
INSERT INTO `tran_list` VALUES ('386', null, '20220610', '170923', '获取openId', '20220610170923923196691', '000000', '获取openId成功', null, '2022-06-10 17:09:23', '2022-06-10 17:09:23');
INSERT INTO `tran_list` VALUES ('387', null, '20220610', '171231', '获取公钥', '202206101712311231779383', '000000', '成功', null, '2022-06-10 17:12:31', '2022-06-10 17:12:31');
INSERT INTO `tran_list` VALUES ('388', null, '20220610', '171231', '获取openId', '202206101712311231263898', '000000', '获取openId成功', null, '2022-06-10 17:12:31', '2022-06-10 17:12:32');
INSERT INTO `tran_list` VALUES ('389', null, '20220610', '171519', '获取公钥', '202206101715191519400105', '000000', '成功', null, '2022-06-10 17:15:19', '2022-06-10 17:15:19');
INSERT INTO `tran_list` VALUES ('390', null, '20220610', '171520', '获取openId', '202206101715201520568093', '000000', '获取openId成功', null, '2022-06-10 17:15:20', '2022-06-10 17:15:20');
INSERT INTO `tran_list` VALUES ('391', null, '20220610', '171632', '登陆', '202206101716321632161054', '100003', '用户不存在', null, '2022-06-10 17:16:32', '2022-06-10 17:16:32');
INSERT INTO `tran_list` VALUES ('392', null, '20220610', '171633', '获取公钥', '202206101716331633288945', '000000', '成功', null, '2022-06-10 17:16:33', '2022-06-10 17:16:33');
INSERT INTO `tran_list` VALUES ('393', null, '20220610', '171633', '获取openId', '202206101716331633411938', '000000', '获取openId成功', null, '2022-06-10 17:16:33', '2022-06-10 17:16:34');
INSERT INTO `tran_list` VALUES ('394', null, '20220610', '171654', '登陆', '202206101716541654389999', '100003', '用户不存在', null, '2022-06-10 17:16:54', '2022-06-10 17:16:54');
INSERT INTO `tran_list` VALUES ('395', null, '20220610', '171700', '登陆', '20220610171700170457198', '100003', '用户不存在', null, '2022-06-10 17:17:00', '2022-06-10 17:17:00');
INSERT INTO `tran_list` VALUES ('396', null, '20220610', '171741', '登陆', '202206101717411741898508', '100003', '用户不存在', null, '2022-06-10 17:17:41', '2022-06-10 17:17:42');
INSERT INTO `tran_list` VALUES ('397', null, '20220610', '171743', '获取公钥', '202206101717431743514252', '000000', '成功', null, '2022-06-10 17:17:43', '2022-06-10 17:17:43');
INSERT INTO `tran_list` VALUES ('398', null, '20220610', '171743', '获取openId', '202206101717431743973937', '000000', '获取openId成功', null, '2022-06-10 17:17:43', '2022-06-10 17:17:44');
INSERT INTO `tran_list` VALUES ('399', null, '20220610', '171819', '获取公钥', '202206101718191819196179', '000000', '成功', null, '2022-06-10 17:18:19', '2022-06-10 17:18:20');
INSERT INTO `tran_list` VALUES ('400', null, '20220610', '171820', '获取openId', '202206101718201820604216', '000000', '获取openId成功', null, '2022-06-10 17:18:20', '2022-06-10 17:18:20');
INSERT INTO `tran_list` VALUES ('401', null, '20220610', '172528', '获取公钥', '202206101725282528640098', '000000', '成功', null, '2022-06-10 17:25:28', '2022-06-10 17:25:28');
INSERT INTO `tran_list` VALUES ('402', null, '20220610', '172528', '获取openId', '202206101725282528649083', '000000', '获取openId成功', null, '2022-06-10 17:25:28', '2022-06-10 17:25:29');
INSERT INTO `tran_list` VALUES ('403', null, '20220610', '174436', '获取公钥', '202206101744364436459041', '000000', '成功', null, '2022-06-10 17:44:36', '2022-06-10 17:44:36');
INSERT INTO `tran_list` VALUES ('404', null, '20220610', '174436', '获取openId', '202206101744364436205343', '000000', '获取openId成功', null, '2022-06-10 17:44:36', '2022-06-10 17:44:36');
INSERT INTO `tran_list` VALUES ('405', null, '20220610', '174448', '获取公钥', '202206101744484448693554', '000000', '成功', null, '2022-06-10 17:44:48', '2022-06-10 17:44:48');
INSERT INTO `tran_list` VALUES ('406', null, '20220610', '174448', '获取openId', '202206101744484448289570', '000000', '获取openId成功', null, '2022-06-10 17:44:48', '2022-06-10 17:44:48');
INSERT INTO `tran_list` VALUES ('407', null, '20220610', '175348', '获取公钥', '202206101753485348973417', '000000', '成功', null, '2022-06-10 17:53:48', '2022-06-10 17:53:48');
INSERT INTO `tran_list` VALUES ('408', null, '20220610', '175348', '获取openId', '202206101753485348823650', '000000', '获取openId成功', null, '2022-06-10 17:53:48', '2022-06-10 17:53:48');
INSERT INTO `tran_list` VALUES ('409', null, '20220610', '175526', '获取公钥', '202206101755265526240246', '000000', '成功', null, '2022-06-10 17:55:26', '2022-06-10 17:55:26');
INSERT INTO `tran_list` VALUES ('410', null, '20220610', '175526', '获取openId', '202206101755265526410720', '000000', '获取openId成功', null, '2022-06-10 17:55:26', '2022-06-10 17:55:26');
INSERT INTO `tran_list` VALUES ('411', null, '20220610', '175627', '获取公钥', '202206101756275627400183', '000000', '成功', null, '2022-06-10 17:56:27', '2022-06-10 17:56:27');
INSERT INTO `tran_list` VALUES ('412', null, '20220610', '175627', '获取openId', '202206101756275627310576', '000000', '获取openId成功', null, '2022-06-10 17:56:27', '2022-06-10 17:56:27');
INSERT INTO `tran_list` VALUES ('413', null, '20220610', '175700', '获取公钥', '20220610175700570271029', '000000', '成功', null, '2022-06-10 17:57:00', '2022-06-10 17:57:00');
INSERT INTO `tran_list` VALUES ('414', null, '20220610', '175700', '获取openId', '20220610175700570860777', '000000', '获取openId成功', null, '2022-06-10 17:57:00', '2022-06-10 17:57:00');
INSERT INTO `tran_list` VALUES ('415', null, '20220610', '175822', '获取公钥', '202206101758225822710063', '000000', '成功', null, '2022-06-10 17:58:22', '2022-06-10 17:58:22');
INSERT INTO `tran_list` VALUES ('416', null, '20220610', '175822', '获取openId', '202206101758225822252583', '000000', '获取openId成功', null, '2022-06-10 17:58:22', '2022-06-10 17:58:22');
INSERT INTO `tran_list` VALUES ('417', null, '20220610', '180148', '获取公钥', '20220610180148148784137', '000000', '成功', null, '2022-06-10 18:01:48', '2022-06-10 18:01:48');
INSERT INTO `tran_list` VALUES ('418', null, '20220610', '180148', '获取openId', '20220610180148148509009', '000000', '获取openId成功', null, '2022-06-10 18:01:48', '2022-06-10 18:01:48');
INSERT INTO `tran_list` VALUES ('419', null, '20220610', '180544', '获取公钥', '20220610180544544100581', '000000', '成功', null, '2022-06-10 18:05:44', '2022-06-10 18:05:44');
INSERT INTO `tran_list` VALUES ('420', null, '20220610', '180544', '获取openId', '20220610180544544138895', '000000', '获取openId成功', null, '2022-06-10 18:05:44', '2022-06-10 18:05:44');
INSERT INTO `tran_list` VALUES ('421', null, '20220613', '150914', '获取公钥', '20220613150914914194334', '000000', '成功', null, '2022-06-13 15:09:14', '2022-06-13 15:09:26');
INSERT INTO `tran_list` VALUES ('422', null, '20220613', '151005', '获取公钥', '20220613151005105275423', '000000', '成功', null, '2022-06-13 15:10:05', '2022-06-13 15:10:05');
INSERT INTO `tran_list` VALUES ('423', null, '20220613', '151005', '获取openId', '20220613151005105902112', '000000', '获取openId成功', null, '2022-06-13 15:10:05', '2022-06-13 15:10:08');
INSERT INTO `tran_list` VALUES ('424', null, '20220613', '151312', '获取公钥', '202206131513121312172454', '000000', '成功', null, '2022-06-13 15:13:12', '2022-06-13 15:13:12');
INSERT INTO `tran_list` VALUES ('425', null, '20220613', '151312', '获取openId', '202206131513121312713672', '000000', '获取openId成功', null, '2022-06-13 15:13:12', '2022-06-13 15:13:12');
INSERT INTO `tran_list` VALUES ('426', null, '20220613', '153554', '获取公钥', '202206131535543554342584', '000000', '成功', null, '2022-06-13 15:35:54', '2022-06-13 15:35:54');
INSERT INTO `tran_list` VALUES ('427', null, '20220613', '153555', '获取openId', '202206131535553555514705', '000000', '获取openId成功', null, '2022-06-13 15:35:55', '2022-06-13 15:35:55');
INSERT INTO `tran_list` VALUES ('428', null, '20220613', '153601', '获取公钥', '20220613153601361381174', '000000', '成功', null, '2022-06-13 15:36:01', '2022-06-13 15:36:01');
INSERT INTO `tran_list` VALUES ('429', null, '20220613', '153601', '获取openId', '20220613153601361622480', '000000', '获取openId成功', null, '2022-06-13 15:36:01', '2022-06-13 15:36:01');
INSERT INTO `tran_list` VALUES ('430', null, '20220613', '153746', '获取公钥', '202206131537463746938224', '000000', '成功', null, '2022-06-13 15:37:46', '2022-06-13 15:37:46');
INSERT INTO `tran_list` VALUES ('431', null, '20220613', '153746', '获取openId', '202206131537463746587438', '000000', '获取openId成功', null, '2022-06-13 15:37:46', '2022-06-13 15:37:47');
INSERT INTO `tran_list` VALUES ('432', null, '20220613', '154103', '获取公钥', '20220613154103413838098', '000000', '成功', null, '2022-06-13 15:41:03', '2022-06-13 15:41:03');
INSERT INTO `tran_list` VALUES ('433', null, '20220613', '154103', '获取openId', '20220613154103413402234', '000000', '获取openId成功', null, '2022-06-13 15:41:03', '2022-06-13 15:41:03');
INSERT INTO `tran_list` VALUES ('434', null, '20220613', '154259', '获取公钥', '202206131542594259198799', '000000', '成功', null, '2022-06-13 15:42:59', '2022-06-13 15:42:59');
INSERT INTO `tran_list` VALUES ('435', null, '20220613', '154300', '获取openId', '20220613154300430953189', '000000', '获取openId成功', null, '2022-06-13 15:43:00', '2022-06-13 15:43:00');
INSERT INTO `tran_list` VALUES ('436', null, '20220613', '154346', '获取公钥', '202206131543464346248502', '000000', '成功', null, '2022-06-13 15:43:46', '2022-06-13 15:43:46');
INSERT INTO `tran_list` VALUES ('437', null, '20220613', '154346', '获取openId', '202206131543464346478776', '000000', '获取openId成功', null, '2022-06-13 15:43:46', '2022-06-13 15:43:46');
INSERT INTO `tran_list` VALUES ('438', null, '20220613', '154422', '获取公钥', '202206131544224422835674', '000000', '成功', null, '2022-06-13 15:44:22', '2022-06-13 15:44:22');
INSERT INTO `tran_list` VALUES ('439', null, '20220613', '154422', '获取openId', '202206131544224422308376', '000000', '获取openId成功', null, '2022-06-13 15:44:22', '2022-06-13 15:44:22');
INSERT INTO `tran_list` VALUES ('440', null, '20220613', '154829', '获取公钥', '202206131548294829219540', '000000', '成功', null, '2022-06-13 15:48:29', '2022-06-13 15:48:29');
INSERT INTO `tran_list` VALUES ('441', null, '20220613', '154829', '获取openId', '202206131548294829418180', '000000', '获取openId成功', null, '2022-06-13 15:48:29', '2022-06-13 15:48:29');
INSERT INTO `tran_list` VALUES ('442', null, '20220613', '154926', '获取公钥', '202206131549264926727142', '000000', '成功', null, '2022-06-13 15:49:26', '2022-06-13 15:49:26');
INSERT INTO `tran_list` VALUES ('443', null, '20220613', '154926', '获取openId', '202206131549264926824575', '000000', '获取openId成功', null, '2022-06-13 15:49:26', '2022-06-13 15:49:27');
INSERT INTO `tran_list` VALUES ('444', null, '20220613', '155109', '获取公钥', '20220613155109519940695', '000000', '成功', null, '2022-06-13 15:51:09', '2022-06-13 15:51:09');
INSERT INTO `tran_list` VALUES ('445', null, '20220613', '155109', '获取openId', '20220613155109519317720', '000000', '获取openId成功', null, '2022-06-13 15:51:09', '2022-06-13 15:51:10');
INSERT INTO `tran_list` VALUES ('446', null, '20220613', '160235', '获取公钥', '20220613160235235579712', '000000', '成功', null, '2022-06-13 16:02:35', '2022-06-13 16:02:35');
INSERT INTO `tran_list` VALUES ('447', null, '20220613', '161214', '获取公钥', '202206131612141214137338', '000000', '成功', null, '2022-06-13 16:12:14', '2022-06-13 16:12:14');
INSERT INTO `tran_list` VALUES ('448', null, '20220613', '161754', '获取公钥', '202206131617541754913510', '000000', '成功', null, '2022-06-13 16:17:54', '2022-06-13 16:17:54');
INSERT INTO `tran_list` VALUES ('449', null, '20220613', '161826', '获取公钥', '202206131618261826691129', '000000', '成功', null, '2022-06-13 16:18:26', '2022-06-13 16:18:26');
INSERT INTO `tran_list` VALUES ('450', null, '20220613', '163401', '获取公钥', '20220613163401341254626', '000000', '成功', null, '2022-06-13 16:34:01', '2022-06-13 16:34:01');
INSERT INTO `tran_list` VALUES ('451', null, '20220613', '163437', '获取公钥', '202206131634373437884885', '000000', '成功', null, '2022-06-13 16:34:37', '2022-06-13 16:34:37');
INSERT INTO `tran_list` VALUES ('452', null, '20220613', '163445', '获取公钥', '202206131634453445367618', '000000', '成功', null, '2022-06-13 16:34:45', '2022-06-13 16:34:45');
INSERT INTO `tran_list` VALUES ('453', null, '20220613', '163552', '获取公钥', '202206131635523552157565', '000000', '成功', null, '2022-06-13 16:35:52', '2022-06-13 16:35:53');
INSERT INTO `tran_list` VALUES ('454', null, '20220613', '163703', '获取公钥', '20220613163703373982243', '000000', '成功', null, '2022-06-13 16:37:03', '2022-06-13 16:37:03');
INSERT INTO `tran_list` VALUES ('455', null, '20220613', '164332', '获取公钥', '202206131643324332118622', '000000', '成功', null, '2022-06-13 16:43:32', '2022-06-13 16:43:32');
INSERT INTO `tran_list` VALUES ('456', null, '20220613', '164351', '获取公钥', '202206131643514351428335', '000000', '成功', null, '2022-06-13 16:43:51', '2022-06-13 16:43:51');
INSERT INTO `tran_list` VALUES ('457', null, '20220613', '164528', '获取公钥', '202206131645284528257095', '000000', '成功', null, '2022-06-13 16:45:28', '2022-06-13 16:45:28');
INSERT INTO `tran_list` VALUES ('458', null, '20220613', '164944', '获取公钥', '202206131649444944741721', '000000', '成功', null, '2022-06-13 16:49:44', '2022-06-13 16:49:44');
INSERT INTO `tran_list` VALUES ('459', null, '20220613', '164944', '获取openId', '202206131649444944909928', '000000', '获取openId成功', null, '2022-06-13 16:49:44', '2022-06-13 16:49:44');
INSERT INTO `tran_list` VALUES ('460', null, '20220613', '165443', '获取公钥', '202206131654435443107436', '000000', '成功', null, '2022-06-13 16:54:43', '2022-06-13 16:54:43');
INSERT INTO `tran_list` VALUES ('461', null, '20220613', '165443', '获取openId', '202206131654435443531999', '000000', '获取openId成功', null, '2022-06-13 16:54:43', '2022-06-13 16:54:43');
INSERT INTO `tran_list` VALUES ('462', null, '20220613', '165821', '获取公钥', '202206131658215821466309', '000000', '成功', null, '2022-06-13 16:58:21', '2022-06-13 16:58:21');
INSERT INTO `tran_list` VALUES ('463', null, '20220613', '165822', '获取openId', '202206131658225822433173', '000000', '获取openId成功', null, '2022-06-13 16:58:22', '2022-06-13 16:58:23');
INSERT INTO `tran_list` VALUES ('464', null, '20220613', '165918', '获取公钥', '202206131659185918973190', '000000', '成功', null, '2022-06-13 16:59:18', '2022-06-13 16:59:18');
INSERT INTO `tran_list` VALUES ('465', null, '20220613', '165919', '获取openId', '202206131659195919932847', '000000', '获取openId成功', null, '2022-06-13 16:59:19', '2022-06-13 16:59:19');
INSERT INTO `tran_list` VALUES ('466', null, '20220613', '165954', '获取公钥', '202206131659545954745627', '000000', '成功', null, '2022-06-13 16:59:54', '2022-06-13 16:59:54');
INSERT INTO `tran_list` VALUES ('467', null, '20220613', '165954', '获取openId', '202206131659545954113654', '000000', '获取openId成功', null, '2022-06-13 16:59:54', '2022-06-13 16:59:55');
INSERT INTO `tran_list` VALUES ('468', null, '20220613', '170105', '获取公钥', '2022061317010515718329', '000000', '成功', null, '2022-06-13 17:01:05', '2022-06-13 17:01:05');
INSERT INTO `tran_list` VALUES ('469', null, '20220613', '170106', '获取openId', '2022061317010616231027', '000000', '获取openId成功', null, '2022-06-13 17:01:06', '2022-06-13 17:01:06');
INSERT INTO `tran_list` VALUES ('470', null, '20220613', '170117', '登陆', '20220613170117117935463', '100003', '用户不存在', null, '2022-06-13 17:01:17', '2022-06-13 17:01:17');
INSERT INTO `tran_list` VALUES ('471', null, '20220613', '170355', '获取公钥', '20220613170355355300930', '000000', '成功', null, '2022-06-13 17:03:55', '2022-06-13 17:04:07');
INSERT INTO `tran_list` VALUES ('472', null, '20220613', '170415', '登陆', '20220613170415415564662', '100003', '用户不存在', null, '2022-06-13 17:04:15', '2022-06-13 17:04:22');
INSERT INTO `tran_list` VALUES ('473', null, '20220613', '170447', '登陆', '20220613170447447169801', '100003', '用户不存在', null, '2022-06-13 17:04:47', '2022-06-13 17:05:45');
INSERT INTO `tran_list` VALUES ('474', null, '20220613', '170725', '登陆', '20220613170725725740549', '100002', '密码错误', null, '2022-06-13 17:07:25', '2022-06-13 17:08:01');
INSERT INTO `tran_list` VALUES ('475', null, '20220613', '171039', '登陆', '202206131710391039746621', '100002', '密码错误', null, '2022-06-13 17:10:39', '2022-06-13 17:10:39');
INSERT INTO `tran_list` VALUES ('476', null, '20220613', '171041', '获取公钥', '202206131710411041702739', '000000', '成功', null, '2022-06-13 17:10:41', '2022-06-13 17:10:41');
INSERT INTO `tran_list` VALUES ('477', null, '20220613', '171041', '获取openId', '202206131710411041330244', '000000', '获取openId成功', null, '2022-06-13 17:10:41', '2022-06-13 17:10:41');
INSERT INTO `tran_list` VALUES ('478', '5', '20220613', '171051', '登陆', '202206131710511051865221', '000000', '成功', null, '2022-06-13 17:10:51', '2022-06-13 17:10:51');
INSERT INTO `tran_list` VALUES ('479', null, '20220613', '171748', '获取公钥', '202206131717481748513785', '000000', '成功', null, '2022-06-13 17:17:48', '2022-06-13 17:17:48');
INSERT INTO `tran_list` VALUES ('480', null, '20220613', '171748', '获取openId', '202206131717481748437173', '000000', '获取openId成功', null, '2022-06-13 17:17:48', '2022-06-13 17:17:49');
INSERT INTO `tran_list` VALUES ('481', '5', '20220613', '171755', '登陆', '202206131717551755949953', '000000', '成功', null, '2022-06-13 17:17:55', '2022-06-13 17:17:55');
INSERT INTO `tran_list` VALUES ('482', '5', '20220613', '171805', '登陆', '20220613171805185805637', '000000', '成功', null, '2022-06-13 17:18:05', '2022-06-13 17:18:05');
INSERT INTO `tran_list` VALUES ('483', '5', '20220613', '171809', '登陆', '20220613171809189483487', '000000', '成功', null, '2022-06-13 17:18:09', '2022-06-13 17:18:09');
INSERT INTO `tran_list` VALUES ('484', null, '20220613', '171854', '获取公钥', '202206131718541854498962', '000000', '成功', null, '2022-06-13 17:18:54', '2022-06-13 17:18:54');
INSERT INTO `tran_list` VALUES ('485', null, '20220613', '171902', '登陆', '20220613171902192778625', '100007', '密码错误次数已达上限，账户锁定', null, '2022-06-13 17:19:02', '2022-06-13 17:19:02');
INSERT INTO `tran_list` VALUES ('486', null, '20220613', '172754', '获取公钥', '202206131727542754748283', '000000', '成功', null, '2022-06-13 17:27:54', '2022-06-13 17:27:55');
INSERT INTO `tran_list` VALUES ('487', null, '20220613', '172808', '获取公钥', '20220613172808288810416', '000000', '成功', null, '2022-06-13 17:28:08', '2022-06-13 17:28:08');
INSERT INTO `tran_list` VALUES ('488', null, '20220613', '172809', '获取openId', '20220613172809289711660', '000000', '获取openId成功', null, '2022-06-13 17:28:09', '2022-06-13 17:28:12');
INSERT INTO `tran_list` VALUES ('489', null, '20220613', '172819', '登陆', '202206131728192819645361', '100008', '账户状态异常,请联系管理员', null, '2022-06-13 17:28:19', '2022-06-13 17:28:19');
INSERT INTO `tran_list` VALUES ('490', null, '20220613', '173441', '更新用户信息', '202206131734413441365206', '000001', '必须参数updateType缺失', null, '2022-06-13 17:34:41', '2022-06-13 17:34:41');
INSERT INTO `tran_list` VALUES ('491', '1', '20220613', '173513', '更新用户信息', '202206131735133513153914', '100003', '用户不存在', null, '2022-06-13 17:35:13', '2022-06-13 17:35:13');
INSERT INTO `tran_list` VALUES ('492', null, '20220613', '173522', '登陆', '202206131735223522822339', '100008', '账户状态异常,请联系管理员', null, '2022-06-13 17:35:22', '2022-06-13 17:35:22');
INSERT INTO `tran_list` VALUES ('493', '5', '20220613', '173538', '更新用户信息', '202206131735383538127084', '000000', '账户状态初始化成功', null, '2022-06-13 17:35:38', '2022-06-13 17:35:38');
INSERT INTO `tran_list` VALUES ('494', '5', '20220613', '173543', '登陆', '202206131735433543275215', '000000', '成功', null, '2022-06-13 17:35:43', '2022-06-13 17:35:43');
INSERT INTO `tran_list` VALUES ('495', '5', '20220613', '173545', '登陆', '202206131735453545318215', '000000', '成功', null, '2022-06-13 17:35:45', '2022-06-13 17:35:46');
INSERT INTO `tran_list` VALUES ('496', '5', '20220613', '173546', '登陆', '202206131735463546906370', '000000', '成功', null, '2022-06-13 17:35:46', '2022-06-13 17:35:46');
INSERT INTO `tran_list` VALUES ('497', null, '20220613', '173548', '登陆', '202206131735483548969182', '100002', '密码错误', null, '2022-06-13 17:35:48', '2022-06-13 17:35:48');
INSERT INTO `tran_list` VALUES ('498', null, '20220613', '173548', '登陆', '202206131735483548458956', '100002', '密码错误', null, '2022-06-13 17:35:48', '2022-06-13 17:35:48');
INSERT INTO `tran_list` VALUES ('499', '5', '20220613', '173554', '登陆', '202206131735543554247670', '000000', '成功', null, '2022-06-13 17:35:54', '2022-06-13 17:35:54');
INSERT INTO `tran_list` VALUES ('500', '5', '20220613', '173555', '登陆', '202206131735553555107648', '000000', '成功', null, '2022-06-13 17:35:55', '2022-06-13 17:35:55');
INSERT INTO `tran_list` VALUES ('501', null, '20220613', '173557', '登陆', '202206131735573557418598', '100002', '密码错误', null, '2022-06-13 17:35:57', '2022-06-13 17:35:57');
INSERT INTO `tran_list` VALUES ('502', null, '20220613', '173557', '登陆', '202206131735573557722577', '100002', '密码错误', null, '2022-06-13 17:35:57', '2022-06-13 17:35:57');
INSERT INTO `tran_list` VALUES ('503', null, '20220613', '173558', '登陆', '202206131735583558115052', '100007', '密码错误次数已达上限，账户锁定', null, '2022-06-13 17:35:58', '2022-06-13 17:35:58');
INSERT INTO `tran_list` VALUES ('504', '5', '20220613', '173605', '更新用户信息', '20220613173605365890930', '000000', '账户状态初始化成功', null, '2022-06-13 17:36:05', '2022-06-13 17:36:05');
INSERT INTO `tran_list` VALUES ('505', null, '20220613', '174144', '获取公钥', '202206131741444144319939', '000000', '成功', null, '2022-06-13 17:41:44', '2022-06-13 17:41:44');
INSERT INTO `tran_list` VALUES ('506', null, '20220613', '174215', '获取公钥', '202206131742154215618548', '000000', '成功', null, '2022-06-13 17:42:15', '2022-06-13 17:42:15');
INSERT INTO `tran_list` VALUES ('507', null, '20220613', '174215', '获取openId', '202206131742154215623713', '000000', '获取openId成功', null, '2022-06-13 17:42:15', '2022-06-13 17:42:15');
INSERT INTO `tran_list` VALUES ('508', null, '20220613', '174318', '获取公钥', '202206131743184318729385', '000000', '成功', null, '2022-06-13 17:43:18', '2022-06-13 17:43:18');
INSERT INTO `tran_list` VALUES ('509', null, '20220613', '174358', '获取公钥', '202206131743584358442332', '000000', '成功', null, '2022-06-13 17:43:58', '2022-06-13 17:43:58');
INSERT INTO `tran_list` VALUES ('510', null, '20220613', '174358', '获取openId', '202206131743584358580623', '000000', '获取openId成功', null, '2022-06-13 17:43:58', '2022-06-13 17:43:58');
INSERT INTO `tran_list` VALUES ('511', null, '20220613', '174443', '获取公钥', '202206131744434443695961', '000000', '成功', null, '2022-06-13 17:44:43', '2022-06-13 17:44:43');
INSERT INTO `tran_list` VALUES ('512', null, '20220613', '174443', '获取openId', '202206131744434443420987', '000000', '获取openId成功', null, '2022-06-13 17:44:43', '2022-06-13 17:44:43');
INSERT INTO `tran_list` VALUES ('513', null, '20220613', '174449', '获取公钥', '202206131744494449697329', '000000', '成功', null, '2022-06-13 17:44:49', '2022-06-13 17:44:49');
INSERT INTO `tran_list` VALUES ('514', null, '20220613', '174449', '获取openId', '202206131744494449709225', '000000', '获取openId成功', null, '2022-06-13 17:44:49', '2022-06-13 17:44:50');
INSERT INTO `tran_list` VALUES ('515', null, '20220613', '174544', '获取公钥', '202206131745444544240150', '000000', '成功', null, '2022-06-13 17:45:44', '2022-06-13 17:45:44');
INSERT INTO `tran_list` VALUES ('516', null, '20220613', '174545', '获取openId', '202206131745454545337283', '000000', '获取openId成功', null, '2022-06-13 17:45:45', '2022-06-13 17:45:45');
INSERT INTO `tran_list` VALUES ('517', null, '20220613', '174557', '获取公钥', '202206131745574557125132', '000000', '成功', null, '2022-06-13 17:45:57', '2022-06-13 17:45:57');
INSERT INTO `tran_list` VALUES ('518', null, '20220613', '174655', '获取公钥', '202206131746554655141286', '000000', '成功', null, '2022-06-13 17:46:55', '2022-06-13 17:46:55');
INSERT INTO `tran_list` VALUES ('519', null, '20220613', '174655', '获取openId', '202206131746554655803081', '000000', '获取openId成功', null, '2022-06-13 17:46:55', '2022-06-13 17:46:56');
INSERT INTO `tran_list` VALUES ('520', null, '20220613', '174742', '获取公钥', '202206131747424742444872', '000000', '成功', null, '2022-06-13 17:47:42', '2022-06-13 17:47:42');
INSERT INTO `tran_list` VALUES ('521', null, '20220613', '174742', '获取openId', '202206131747424742742149', '000000', '获取openId成功', null, '2022-06-13 17:47:42', '2022-06-13 17:47:42');
INSERT INTO `tran_list` VALUES ('522', null, '20220613', '175045', '获取公钥', '202206131750455045839468', '000000', '成功', null, '2022-06-13 17:50:45', '2022-06-13 17:50:45');
INSERT INTO `tran_list` VALUES ('523', null, '20220613', '175237', '获取公钥', '202206131752375237156624', '000000', '成功', null, '2022-06-13 17:52:37', '2022-06-13 17:52:37');
INSERT INTO `tran_list` VALUES ('524', null, '20220613', '175432', '获取公钥', '202206131754325432829856', '000000', '成功', null, '2022-06-13 17:54:32', '2022-06-13 17:54:32');
INSERT INTO `tran_list` VALUES ('525', null, '20220613', '175650', '获取公钥', '202206131756505650936705', '000000', '成功', null, '2022-06-13 17:56:50', '2022-06-13 17:56:50');
INSERT INTO `tran_list` VALUES ('526', null, '20220613', '175914', '获取公钥', '202206131759145914539677', '000000', '成功', null, '2022-06-13 17:59:14', '2022-06-13 17:59:14');
INSERT INTO `tran_list` VALUES ('527', null, '20220613', '180003', '获取公钥', '2022061318000303837885', '000000', '成功', null, '2022-06-13 18:00:03', '2022-06-13 18:00:03');
INSERT INTO `tran_list` VALUES ('528', null, '20220613', '180040', '获取公钥', '20220613180040040398626', '000000', '成功', null, '2022-06-13 18:00:40', '2022-06-13 18:00:40');
INSERT INTO `tran_list` VALUES ('529', null, '20220613', '180213', '获取公钥', '20220613180213213471737', '000000', '成功', null, '2022-06-13 18:02:13', '2022-06-13 18:02:13');
INSERT INTO `tran_list` VALUES ('530', null, '20220614', '175001', '注册', '20220614175001501887796', '000001', '必须参数signInType缺失', null, '2022-06-14 17:50:01', '2022-06-14 17:50:13');
INSERT INTO `tran_list` VALUES ('531', null, '20220614', '175635', '注册', '202206141756355635978817', '000001', '必须参数signInType缺失', null, '2022-06-14 17:56:35', '2022-06-14 17:56:35');
INSERT INTO `tran_list` VALUES ('532', null, '20220614', '175733', '注册', '202206141757335733682805', '000001', '无此注册渠道', null, '2022-06-14 17:57:33', '2022-06-14 17:57:38');
INSERT INTO `tran_list` VALUES ('533', null, '20220614', '175858', '注册', '202206141758585858216754', '000001', '无此注册渠道', null, '2022-06-14 17:58:58', '2022-06-14 17:59:00');
INSERT INTO `tran_list` VALUES ('534', null, '20220614', '175937', '注册', '202206141759375937773927', '000001', '无此注册渠道', null, '2022-06-14 17:59:37', '2022-06-14 18:01:17');
INSERT INTO `tran_list` VALUES ('535', null, '20220614', '180142', '注册', '20220614180142142811987', '100008', '系统异常:null', null, '2022-06-14 18:01:42', '2022-06-14 18:01:59');
INSERT INTO `tran_list` VALUES ('536', null, '20220614', '180533', '注册', '20220614180533533176172', '100005', '账号已经存在', null, '2022-06-14 18:05:33', '2022-06-14 18:05:40');
INSERT INTO `tran_list` VALUES ('537', null, '20220614', '180728', '注册', '20220614180728728606529', null, null, null, '2022-06-14 18:07:28', null);
INSERT INTO `tran_list` VALUES ('538', null, '20220614', '180811', '注册', '20220614180811811378700', null, null, null, '2022-06-14 18:08:11', null);
INSERT INTO `tran_list` VALUES ('539', null, '20220614', '180834', '注册', '20220614180834834176618', null, null, null, '2022-06-14 18:08:34', null);
INSERT INTO `tran_list` VALUES ('540', '27', '20220614', '180954', '注册', '20220614180954954620988', '000000', '成功', null, '2022-06-14 18:09:54', '2022-06-14 18:09:54');
INSERT INTO `tran_list` VALUES ('541', null, '20220614', '181017', '获取公钥', '202206141810171017667572', '000000', '成功', null, '2022-06-14 18:10:17', '2022-06-14 18:10:18');
INSERT INTO `tran_list` VALUES ('542', null, '20220614', '181018', '获取openId', '202206141810181018459673', '000000', '获取openId成功', null, '2022-06-14 18:10:18', '2022-06-14 18:10:20');
INSERT INTO `tran_list` VALUES ('543', '27', '20220614', '181022', '登陆', '202206141810221022459096', '000000', '成功', null, '2022-06-14 18:10:22', '2022-06-14 18:10:23');
INSERT INTO `tran_list` VALUES ('544', null, '20220718', '162600', '获取公钥', '20220718162600260719977', '000000', '成功', null, '2022-07-18 16:26:00', '2022-07-18 16:26:07');
INSERT INTO `tran_list` VALUES ('545', '5', '20220718', '162620', '登陆', '202207181626202620801987', '000000', '成功', null, '2022-07-18 16:26:20', '2022-07-18 16:26:24');
INSERT INTO `tran_list` VALUES ('546', '5', '20220718', '162633', '登陆', '202207181626332633959813', '000000', '成功', null, '2022-07-18 16:26:33', '2022-07-18 16:26:33');
INSERT INTO `tran_list` VALUES ('547', '5', '20220718', '162637', '登陆', '202207181626372637909143', '000000', '成功', null, '2022-07-18 16:26:37', '2022-07-18 16:26:37');
INSERT INTO `tran_list` VALUES ('548', '5', '20220718', '162647', '登陆', '202207181626472647558172', '000000', '成功', null, '2022-07-18 16:26:47', '2022-07-18 16:26:47');
INSERT INTO `tran_list` VALUES ('549', null, '20220718', '165210', '获取公钥', '202207181652105210653961', '000000', '成功', null, '2022-07-18 16:52:10', '2022-07-18 16:52:10');
INSERT INTO `tran_list` VALUES ('550', null, '20220718', '165210', '获取openId', '202207181652105210499798', '000000', '获取openId成功', null, '2022-07-18 16:52:10', '2022-07-18 16:52:11');
INSERT INTO `tran_list` VALUES ('551', null, '20220718', '165219', '登陆', '202207181652195219975301', '100002', '密码错误', null, '2022-07-18 16:52:19', '2022-07-18 16:52:19');
INSERT INTO `tran_list` VALUES ('552', '5', '20220718', '165226', '登陆', '202207181652265226375286', '000000', '成功', null, '2022-07-18 16:52:26', '2022-07-18 16:52:26');
INSERT INTO `tran_list` VALUES ('553', null, '20220718', '165501', '获取公钥', '20220718165501551850992', '000000', '成功', null, '2022-07-18 16:55:01', '2022-07-18 16:55:01');
INSERT INTO `tran_list` VALUES ('554', null, '20220718', '165502', '获取openId', '20220718165502552363495', '000000', '获取openId成功', null, '2022-07-18 16:55:02', '2022-07-18 16:55:03');
INSERT INTO `tran_list` VALUES ('555', '5', '20220718', '165511', '登陆', '202207181655115511654970', '000000', '成功', null, '2022-07-18 16:55:11', '2022-07-18 16:55:11');
INSERT INTO `tran_list` VALUES ('556', null, '20220718', '165602', '获取公钥', '20220718165602562169718', '000000', '成功', null, '2022-07-18 16:56:02', '2022-07-18 16:56:02');
INSERT INTO `tran_list` VALUES ('557', null, '20220718', '165603', '获取openId', '20220718165603563811050', '000000', '获取openId成功', null, '2022-07-18 16:56:03', '2022-07-18 16:56:04');
INSERT INTO `tran_list` VALUES ('558', null, '20220718', '165608', '获取公钥', '20220718165608568354447', '000000', '成功', null, '2022-07-18 16:56:08', '2022-07-18 16:56:08');
INSERT INTO `tran_list` VALUES ('559', null, '20220718', '165608', '获取openId', '20220718165608568816109', '000000', '获取openId成功', null, '2022-07-18 16:56:08', '2022-07-18 16:56:08');
INSERT INTO `tran_list` VALUES ('560', '5', '20220718', '165616', '登陆', '202207181656165616236695', '000000', '成功', null, '2022-07-18 16:56:16', '2022-07-18 16:56:16');
INSERT INTO `tran_list` VALUES ('561', null, '20220718', '165745', '获取公钥', '202207181657455745922298', '000000', '成功', null, '2022-07-18 16:57:45', '2022-07-18 16:57:45');
INSERT INTO `tran_list` VALUES ('562', null, '20220718', '165746', '获取openId', '202207181657465746799428', '000000', '获取openId成功', null, '2022-07-18 16:57:46', '2022-07-18 16:57:46');
INSERT INTO `tran_list` VALUES ('563', null, '20220718', '180137', '获取公钥', '20220718180137137596728', '000000', '成功', null, '2022-07-18 18:01:37', '2022-07-18 18:01:37');
INSERT INTO `tran_list` VALUES ('564', null, '20220718', '180137', '获取openId', '20220718180137137435537', '000000', '获取openId成功', null, '2022-07-18 18:01:37', '2022-07-18 18:01:37');
INSERT INTO `tran_list` VALUES ('565', null, '20220804', '160056', '登陆', '20220804160056056609591', '000001', '登陆：账号或手机号不能为空', null, '2022-08-04 16:00:56', '2022-08-04 16:00:56');
INSERT INTO `tran_list` VALUES ('566', null, '20220804', '160121', '更新用户信息', '20220804160121121928767', '000001', '必须参数updateType缺失', null, '2022-08-04 16:01:21', '2022-08-04 16:01:22');
INSERT INTO `tran_list` VALUES ('567', null, '20220804', '160134', '更新用户信息', '20220804160134134715820', '000001', '必须参数updateType缺失', null, '2022-08-04 16:01:34', '2022-08-04 16:02:54');
INSERT INTO `tran_list` VALUES ('568', null, '20220804', '160452', '登陆', '20220804160452452696844', '100008', '系统异常:null', null, '2022-08-04 16:04:52', '2022-08-04 16:04:52');
INSERT INTO `tran_list` VALUES ('569', null, '20220804', '160502', '登陆', '2022080416050252252304', '100008', '系统异常:null', null, '2022-08-04 16:05:02', '2022-08-04 16:05:24');
INSERT INTO `tran_list` VALUES ('570', null, '20220804', '162002', '更新用户信息', '20220804162002202809294', '000001', '必须参数updateType缺失', null, '2022-08-04 16:20:02', '2022-08-04 16:22:48');
INSERT INTO `tran_list` VALUES ('571', null, '20220804', '162256', '更新用户信息', '202208041622562256533630', '000001', '必须参数updateType缺失', null, '2022-08-04 16:22:56', '2022-08-04 16:22:56');
INSERT INTO `tran_list` VALUES ('572', null, '20220804', '162429', '更新用户信息', '202208041624292429976013', '000001', '必须参数updateType缺失', null, '2022-08-04 16:24:29', '2022-08-04 16:24:29');
INSERT INTO `tran_list` VALUES ('573', null, '20220804', '162446', '更新用户信息', '202208041624462446381642', '000001', '必须参数updateType缺失', null, '2022-08-04 16:24:46', '2022-08-04 16:25:08');
INSERT INTO `tran_list` VALUES ('574', null, '20220804', '162528', '更新用户信息', '202208041625282528554551', '000001', '必须参数updateType缺失', null, '2022-08-04 16:25:28', '2022-08-04 16:25:28');
INSERT INTO `tran_list` VALUES ('575', null, '20220804', '162533', '更新用户信息', '202208041625332533224865', '000001', '必须参数updateType缺失', null, '2022-08-04 16:25:33', '2022-08-04 16:25:49');
INSERT INTO `tran_list` VALUES ('576', null, '20220804', '162623', '更新用户信息', '202208041626232623470257', '100003', '用户不存在', null, '2022-08-04 16:26:23', '2022-08-04 16:26:24');
INSERT INTO `tran_list` VALUES ('577', null, '20220804', '162631', '更新用户信息', '202208041626312631281715', '100003', '用户不存在', null, '2022-08-04 16:26:31', '2022-08-04 16:31:50');
INSERT INTO `tran_list` VALUES ('578', null, '20220804', '163326', '更新用户信息', '202208041633263326342130', '000000', '更换手机号成功', null, '2022-08-04 16:33:26', '2022-08-04 16:33:26');
INSERT INTO `tran_list` VALUES ('579', null, '20220804', '163418', '更新用户信息', '202208041634183418997250', '000000', '更换手机号成功', null, '2022-08-04 16:34:18', '2022-08-04 16:34:18');
INSERT INTO `tran_list` VALUES ('580', null, '20220804', '163445', '更新用户信息', '202208041634453445564607', '000000', '更换手机号成功', null, '2022-08-04 16:34:45', '2022-08-04 16:35:30');
INSERT INTO `tran_list` VALUES ('581', null, '20220804', '163616', '更新用户信息', '202208041636163616646804', '000000', '完善资料成功', null, '2022-08-04 16:36:16', '2022-08-04 16:36:16');
INSERT INTO `tran_list` VALUES ('582', null, '20220804', '164043', '登陆', '202208041640434043406046', '100008', '系统异常:null', null, '2022-08-04 16:40:43', '2022-08-04 16:41:01');
INSERT INTO `tran_list` VALUES ('583', null, '20220804', '164517', '登陆', '202208041645174517472115', '100002', '密码错误', null, '2022-08-04 16:45:17', '2022-08-04 16:45:28');
INSERT INTO `tran_list` VALUES ('584', null, '20220804', '170501', '新建相册', '2022080417050151391583', null, null, null, '2022-08-04 17:05:01', null);
INSERT INTO `tran_list` VALUES ('585', null, '20220804', '170831', '新建相册', '20220804170831831427164', null, null, null, '2022-08-04 17:08:31', null);
INSERT INTO `tran_list` VALUES ('586', null, '20220804', '170935', '新建相册', '20220804170935935259315', '000000', '成功', null, '2022-08-04 17:09:35', '2022-08-04 17:09:35');
INSERT INTO `tran_list` VALUES ('587', null, '20220804', '171029', '新建相册', '202208041710291029190514', '000000', '成功', null, '2022-08-04 17:10:29', '2022-08-04 17:10:30');
INSERT INTO `tran_list` VALUES ('588', null, '20220804', '174515', '新建相册', '202208041745154515608521', '100008', '系统异常:nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'albunDescribe\' in \'class com.example.cn.vx.demo.entity.AlbumInfo\'', null, '2022-08-04 17:45:15', '2022-08-04 17:45:19');
INSERT INTO `tran_list` VALUES ('589', null, '20220804', '174751', '新建相册', '202208041747514751785405', '000000', '成功', null, '2022-08-04 17:47:51', '2022-08-04 17:47:51');
INSERT INTO `tran_list` VALUES ('590', null, '20220804', '174824', '新建相册', '202208041748244824163123', '000000', '成功', null, '2022-08-04 17:48:24', '2022-08-04 17:48:24');
INSERT INTO `tran_list` VALUES ('591', null, '20220804', '175156', '新建相册', '202208041751565156925873', '000000', '成功', null, '2022-08-04 17:51:56', '2022-08-04 17:51:56');
INSERT INTO `tran_list` VALUES ('592', '25', '20220804', '184349', '新建相册', '202208041843494349455530', '000000', '成功', null, '2022-08-04 18:43:49', '2022-08-04 18:44:05');
INSERT INTO `tran_list` VALUES ('593', '25', '20220804', '184444', '新建相册', '202208041844444444451525', '000000', '成功', null, '2022-08-04 18:44:44', '2022-08-04 18:44:44');
INSERT INTO `tran_list` VALUES ('594', '25', '20220804', '184450', '新建相册', '202208041844504450667374', '000000', '成功', null, '2022-08-04 18:44:50', '2022-08-04 18:44:50');
INSERT INTO `tran_list` VALUES ('595', '25', '20220804', '184504', '新建相册', '20220804184504454338720', '000000', '成功', null, '2022-08-04 18:45:04', '2022-08-04 18:45:04');
INSERT INTO `tran_list` VALUES ('596', null, '20220805', '173446', '登陆', '202208051734463446612965', '100002', '密码错误', null, '2022-08-05 17:34:46', '2022-08-05 17:34:54');
INSERT INTO `tran_list` VALUES ('597', null, '20220805', '173558', '登陆', '202208051735583558269588', '100007', '密码错误次数已达上限，账户锁定', null, '2022-08-05 17:35:58', '2022-08-05 17:35:58');
INSERT INTO `tran_list` VALUES ('598', '5', '20220805', '173630', '更新用户信息', '202208051736303630524958', '000000', '账户状态初始化成功', null, '2022-08-05 17:36:30', '2022-08-05 17:36:30');
INSERT INTO `tran_list` VALUES ('599', null, '20220805', '173634', '登陆', '202208051736343634375520', '100002', '密码错误', null, '2022-08-05 17:36:34', '2022-08-05 17:36:34');
INSERT INTO `tran_list` VALUES ('600', '5', '20220805', '173650', '登陆', '202208051736503650775573', '000000', '成功', null, '2022-08-05 17:36:50', '2022-08-05 17:36:51');
INSERT INTO `tran_list` VALUES ('601', '5', '20220805', '174529', '登陆', '202208051745294529308280', '000000', '成功', null, '2022-08-05 17:45:29', '2022-08-05 17:45:32');
INSERT INTO `tran_list` VALUES ('602', '5', '20220805', '174600', '登陆', '20220805174600460468633', '100002', '密码错误', null, '2022-08-05 17:46:00', '2022-08-05 17:46:00');
INSERT INTO `tran_list` VALUES ('603', null, '20220816', '154138', '修改相册', '202208161541384138238849', null, null, null, '2022-08-16 15:41:38', null);
INSERT INTO `tran_list` VALUES ('604', null, '20220816', '154436', '修改相册', '202208161544364436990233', '2000001', '该相册不存在', null, '2022-08-16 15:44:36', '2022-08-16 15:44:37');
INSERT INTO `tran_list` VALUES ('605', null, '20220816', '154932', '修改相册', '202208161549324932362797', '000000', '成功', null, '2022-08-16 15:49:32', '2022-08-16 15:49:32');
INSERT INTO `tran_list` VALUES ('606', null, '20220816', '155003', '修改相册', '20220816155003503362631', '000000', '成功', null, '2022-08-16 15:50:03', '2022-08-16 15:50:03');
INSERT INTO `tran_list` VALUES ('607', null, '20220816', '155020', '修改相册', '202208161550205020499518', '000000', '成功', null, '2022-08-16 15:50:20', '2022-08-16 15:50:20');
INSERT INTO `tran_list` VALUES ('608', '25', '20220816', '160544', '新建相册', '20220816160544544750757', '000000', '成功', null, '2022-08-16 16:05:44', '2022-08-16 16:05:45');
INSERT INTO `tran_list` VALUES ('609', '25', '20220816', '161301', '新建相册', '20220816161301131675153', '100008', '系统异常:Mapper method \'com.example.cn.vx.demo.mapper.AlbumInfoMapper.insert\' has an unsupported return type: class com.example.cn.vx.demo.entity.AlbumInfo', null, '2022-08-16 16:13:01', '2022-08-16 16:13:02');
INSERT INTO `tran_list` VALUES ('610', '25', '20220816', '162050', '新建相册', '202208161620502050707386', '000000', '成功', null, '2022-08-16 16:20:50', '2022-08-16 16:20:50');
INSERT INTO `tran_list` VALUES ('611', '25', '20220816', '164901', '新建相册', '20220816164901491828017', null, null, null, '2022-08-16 16:49:01', null);
INSERT INTO `tran_list` VALUES ('612', '25', '20220816', '165339', '新建相册', '202208161653395339320471', '000000', '成功', null, '2022-08-16 16:53:39', '2022-08-16 16:53:39');
INSERT INTO `tran_list` VALUES ('613', '25', '20220816', '165444', '新建相册', '202208161654445444706594', null, null, null, '2022-08-16 16:54:44', null);
INSERT INTO `tran_list` VALUES ('614', '25', '20220816', '165620', '新建相册', '202208161656205620398706', null, null, null, '2022-08-16 16:56:20', null);
INSERT INTO `tran_list` VALUES ('615', '25', '20220816', '165856', '新建相册', '202208161658565856880114', '000000', '成功', null, '2022-08-16 16:58:56', '2022-08-16 16:59:01');
INSERT INTO `tran_list` VALUES ('616', '25', '20220816', '165912', '新建相册', '202208161659125912167405', '000000', '成功', null, '2022-08-16 16:59:12', '2022-08-16 16:59:12');
INSERT INTO `tran_list` VALUES ('617', '25', '20220816', '172855', '新建相册', '202208161728552855491015', '000000', '成功', null, '2022-08-16 17:28:55', '2022-08-16 17:28:55');
INSERT INTO `tran_list` VALUES ('618', '25', '20220816', '173447', '新建相册', '202208161734473447269478', '000000', '成功', null, '2022-08-16 17:34:47', '2022-08-16 17:34:48');
INSERT INTO `tran_list` VALUES ('619', '25', '20220817', '091254', '删除相册', '202208170912541254606049', '2000005', '该用户无操作次相册权限', null, '2022-08-17 09:12:54', '2022-08-17 09:12:55');
INSERT INTO `tran_list` VALUES ('620', '25', '20220817', '091352', '新建相册', '202208170913521352376830', null, null, null, '2022-08-17 09:13:52', null);
INSERT INTO `tran_list` VALUES ('621', '25', '20220817', '091647', '新建相册', '202208170916471647207104', null, null, null, '2022-08-17 09:16:47', '2022-08-17 09:16:48');
INSERT INTO `tran_list` VALUES ('622', '25', '20220817', '091807', '删除相册', '20220817091807187521593', '000000', '成功', null, '2022-08-17 09:18:07', '2022-08-17 09:18:07');
INSERT INTO `tran_list` VALUES ('623', '25', '20220817', '091844', '新建相册', '202208170918441844480001', null, null, null, '2022-08-17 09:18:44', '2022-08-17 09:18:44');
INSERT INTO `tran_list` VALUES ('624', null, '20220817', '091858', '修改相册', '202208170918581858455698', '000001', '修改相册：用户ID不能为空', null, '2022-08-17 09:18:58', '2022-08-17 09:18:58');
INSERT INTO `tran_list` VALUES ('625', '29', '20220817', '092109', '修改相册', '20220817092109219640568', '2000005', '该用户无操作次相册权限', null, '2022-08-17 09:21:09', '2022-08-17 09:21:10');
INSERT INTO `tran_list` VALUES ('626', '25', '20220817', '092126', '修改相册', '202208170921262126735635', '000000', '成功', null, '2022-08-17 09:21:26', '2022-08-17 09:21:26');
INSERT INTO `tran_list` VALUES ('627', '25', '20220817', '102114', '对用户分享相册', '202208171021142114419346', '000001', '分享相册：无法对自己发起分享操作', null, '2022-08-17 10:21:14', '2022-08-17 10:21:15');
INSERT INTO `tran_list` VALUES ('628', '5', '20220817', '102200', '对用户分享相册', '20220817102200220591695', '2000005', '该用户无操作次相册权限', null, '2022-08-17 10:22:00', '2022-08-17 10:22:00');
INSERT INTO `tran_list` VALUES ('629', '25', '20220817', '102208', '对用户分享相册', '20220817102208228105562', '2000005', '该用户无操作次相册权限', null, '2022-08-17 10:22:08', '2022-08-17 10:22:08');
INSERT INTO `tran_list` VALUES ('630', '25', '20220817', '102247', '对用户分享相册', '202208171022472247307389', null, null, null, '2022-08-17 10:22:47', null);
INSERT INTO `tran_list` VALUES ('631', '25', '20220817', '102508', '对用户分享相册', '20220817102508258498555', '000000', '成功', null, '2022-08-17 10:25:08', '2022-08-17 10:25:09');
INSERT INTO `tran_list` VALUES ('632', '25', '20220817', '102703', '取消对用户分享相册', '20220817102703273495056', '000000', '成功', null, '2022-08-17 10:27:03', '2022-08-17 10:27:03');
INSERT INTO `tran_list` VALUES ('633', '25', '20220817', '105205', '新建相册', '20220817105205525267313', '2000005', '已经达到允许创建的最大相册数量', null, '2022-08-17 10:52:05', '2022-08-17 10:52:06');
INSERT INTO `tran_list` VALUES ('634', '25', '20220817', '105421', '新建相册', '202208171054215421466001', '000000', '成功', null, '2022-08-17 10:54:21', '2022-08-17 10:54:21');
INSERT INTO `tran_list` VALUES ('635', '25', '20220817', '105424', '新建相册', '202208171054245424320690', '000000', '成功', null, '2022-08-17 10:54:24', '2022-08-17 10:54:24');
INSERT INTO `tran_list` VALUES ('636', '25', '20220817', '105425', '新建相册', '202208171054255425570026', '2000005', '已经达到允许创建的最大相册数量', null, '2022-08-17 10:54:25', '2022-08-17 10:54:25');
INSERT INTO `tran_list` VALUES ('637', '25', '20220817', '172119', '获取我的相册列表', '202208171721192119727681', null, null, null, '2022-08-17 17:21:19', null);
INSERT INTO `tran_list` VALUES ('638', '25', '20220817', '172305', '获取我的相册列表', '20220817172305235755723', '000000', '成功', null, '2022-08-17 17:23:05', '2022-08-17 17:23:05');

-- ----------------------------
-- Table structure for `user_info`
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `USER_ID` int(10) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `USER_ROLE_ID` int(11) DEFAULT NULL,
  `USER_ACCOUNT` varchar(20) DEFAULT NULL COMMENT '用户账号',
  `USER_PHONE` varchar(20) DEFAULT NULL COMMENT '用户手机号',
  `USER_PASSWORD` varchar(256) DEFAULT NULL COMMENT '用户密码',
  `USER_NAME` varchar(20) DEFAULT NULL COMMENT '用户姓名',
  `USER_AGE` varchar(5) DEFAULT NULL COMMENT '用户年龄',
  `USER_SEX` varchar(1) DEFAULT NULL COMMENT '用户性别 0：女 1：男',
  `USER_OPENID` varchar(256) DEFAULT NULL COMMENT '用户openid',
  `USER_STATE` varchar(1) DEFAULT '1' COMMENT '用户状态 1：正常 2：冻结 3:销户',
  `USER_STATE_MSG` varchar(128) DEFAULT NULL,
  `USER_INFO_STATE` varchar(1) DEFAULT '0' COMMENT '用户信息状态 0：缺失 1：完整 ',
  `PASSWORD_ERR__TIME` varchar(1) DEFAULT '' COMMENT '密码错误次数',
  `CREATE_TIME` varchar(48) DEFAULT NULL COMMENT '创建时间',
  `UPDATE_TIME` varchar(48) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`USER_ID`),
  KEY `user_index` (`USER_ID`,`USER_ACCOUNT`,`USER_PHONE`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES ('5', '1', 'darkgases', '15555555555', 'ITtWNbvpdiNtg45fIktaDoO/gMey5xSIi9i53rTx3MrPqV8IHya7HcFdUGwumGfMm1YmxUtgqA1Ea0Ra66qtqPj8XTcfrF4kkeglmAY+1UiDfWP+TJAx1Pr1C6tzY3SUOMA8KZtp8Ezn3ED4L1Ab21XpMe9Bx7z8zixiQrICBbM=', '张三', '22', '1', null, '1', '', '1', '1', '2022-05-23 16:06:12', '2022-08-05 17:46:00');
INSERT INTO `user_info` VALUES ('26', '2', 'darkgases1', '15735183133', 'fIFCUWjs0ztUkQBzuHgLwROGGzDxohdKciVyIy6DlzCZTh9s7b8qmyxRVJQuaUk9mkdkda+z54iz\r\nDIfC+uI5Ty6yuFoDEFmAVdukT16T7qdLTy2lKtV5YRrGqxfCLEAD2EcvnJ5bzEyWhvNWVWpwoDSO\r\nvD6XciA6RWrdCpiBTEc=', '1', '1', '1', null, '1', '', '1', '0', '2022-05-27 16:26:36', '2022-05-27 17:41:04');
INSERT INTO `user_info` VALUES ('27', '2', 'bobo', null, 'dE0ma6Cxuz9//5FUIGtN09gyJipRz7XDBlZxVEC6MPcsw7JNuJdcWZ/C1GHjCaQDFAtIWMKkHhemckwwpaYp/zKVHmyTCEWoVcXfVF91OcDm0ijyAKHie5o68T3jjddsdxhptN5KqkuE9JpQQVVmZDSuZIFIoqPLWuUQVD1/1u0=', '', '', '1', 'oge-w5zRgngO3N5PI26OZgr-L1DQ', '1', null, '0', '0', '2022-06-14 18:09:54', '2022-06-14 18:10:23');

-- ----------------------------
-- Table structure for `user_other_album`
-- ----------------------------
DROP TABLE IF EXISTS `user_other_album`;
CREATE TABLE `user_other_album` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `other_album_id` int(10) NOT NULL,
  `other_user_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user_other_album
-- ----------------------------

-- ----------------------------
-- Table structure for `user_role`
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `USER_ROLE_ID` int(11) NOT NULL,
  `USER_ROLE_NAME` varchar(24) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`USER_ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('1', '系统管理员');
INSERT INTO `user_role` VALUES ('2', '特殊权限人员');
INSERT INTO `user_role` VALUES ('3', '一般用户');

-- ----------------------------
-- Table structure for `user_security_question`
-- ----------------------------
DROP TABLE IF EXISTS `user_security_question`;
CREATE TABLE `user_security_question` (
  `user_id` int(11) NOT NULL,
  `question_id` int(11) DEFAULT NULL,
  `answer` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_time` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `update_time` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user_security_question
-- ----------------------------

-- ----------------------------
-- Table structure for `user_self_album`
-- ----------------------------
DROP TABLE IF EXISTS `user_self_album`;
CREATE TABLE `user_self_album` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `album_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user_self_album
-- ----------------------------
INSERT INTO `user_self_album` VALUES ('2', '25', '23');
INSERT INTO `user_self_album` VALUES ('3', '25', '24');
INSERT INTO `user_self_album` VALUES ('4', '25', '25');
