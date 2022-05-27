/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50616
Source Host           : 127.0.0.1:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2022-05-27 17:51:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `security_question`
-- ----------------------------
DROP TABLE IF EXISTS `security_question`;
CREATE TABLE `security_question` (
`question_id`  int(11) NOT NULL ,
`question`  varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
PRIMARY KEY (`question_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_unicode_ci

;

-- ----------------------------
-- Records of security_question
-- ----------------------------
BEGIN;
INSERT INTO `security_question` VALUES ('1', '小学名称？'), ('2', '印象最深的班主任名字？'), ('3', '第一辆车品牌？'), ('4', '母亲姓名？'), ('5', '父亲姓名？'), ('6', '爱人姓名？'), ('7', '宠物名字？'), ('8', '大学名称？'), ('9', '第一家公司名称？');
COMMIT;

-- ----------------------------
-- Table structure for `tran_list`
-- ----------------------------
DROP TABLE IF EXISTS `tran_list`;
CREATE TABLE `tran_list` (
`tran_id`  int(11) NOT NULL AUTO_INCREMENT COMMENT '交易id' ,
`user_id`  int(11) NULL DEFAULT NULL COMMENT '用户id' ,
`tran_date`  varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '交易日期' ,
`tran_time`  varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '交易时间' ,
`tran_type`  varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '交易类型' ,
`tran_seq`  varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '交易流水' ,
`host_code`  varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '系统回执码' ,
`host_msg`  varchar(258) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '系统回执信息' ,
`host_ip`  varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '客户ip' ,
`create_time`  varchar(58) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '创建时间' ,
`update_time`  varchar(58) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '更新时间' ,
PRIMARY KEY (`tran_id`),
INDEX `tran_seq_index` (`tran_seq`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_unicode_ci
AUTO_INCREMENT=63

;

-- ----------------------------
-- Records of tran_list
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `user_info`
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
`USER_ID`  int(10) NOT NULL AUTO_INCREMENT COMMENT '用户ID' ,
`USER_ROLE_ID`  int(11) NULL DEFAULT NULL ,
`USER_ACCOUNT`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户账号' ,
`USER_PHONE`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户手机号' ,
`USER_PASSWORD`  varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户密码' ,
`USER_NAME`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户姓名' ,
`USER_AGE`  varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户年龄' ,
`USER_SEX`  varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户性别 0：女 1：男' ,
`USER_OPENID`  varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户openid' ,
`USER_STATE`  varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '用户状态 1：正常 2：冻结 3:销户' ,
`USER_STATE_MSG`  varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`USER_INFO_STATE`  varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '用户信息状态 0：缺失 1：完整 ' ,
`PASSWORD_ERR__TIME`  varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '密码错误次数' ,
`CREATE_TIME`  varchar(48) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建时间' ,
`UPDATE_TIME`  varchar(48) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新时间' ,
PRIMARY KEY (`USER_ID`),
INDEX `user_index` (`USER_ID`, `USER_ACCOUNT`, `USER_PHONE`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=27

;

-- ----------------------------
-- Records of user_info
-- ----------------------------
BEGIN;
INSERT INTO `user_info` VALUES ('5', '1', 'darkgases', '15735183132', 'ITtWNbvpdiNtg45fIktaDoO/gMey5xSIi9i53rTx3MrPqV8IHya7HcFdUGwumGfMm1YmxUtgqA1Ea0Ra66qtqPj8XTcfrF4kkeglmAY+1UiDfWP+TJAx1Pr1C6tzY3SUOMA8KZtp8Ezn3ED4L1Ab21XpMe9Bx7z8zixiQrICBbM=', null, null, null, null, '1', null, '0', '0', '2022-05-23 16:06:12', '2022-05-23 16:06:12'), ('26', '2', 'darkgases1', '15735183133', 'fIFCUWjs0ztUkQBzuHgLwROGGzDxohdKciVyIy6DlzCZTh9s7b8qmyxRVJQuaUk9mkdkda+z54iz\r\nDIfC+uI5Ty6yuFoDEFmAVdukT16T7qdLTy2lKtV5YRrGqxfCLEAD2EcvnJ5bzEyWhvNWVWpwoDSO\r\nvD6XciA6RWrdCpiBTEc=', '1', '1', '1', null, '1', '', '1', '0', '2022-05-27 16:26:36', '2022-05-27 17:41:04');
COMMIT;

-- ----------------------------
-- Table structure for `user_role`
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
`USER_ROLE_ID`  int(11) NOT NULL ,
`USER_ROLE_NAME`  varchar(24) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
PRIMARY KEY (`USER_ROLE_ID`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_unicode_ci

;

-- ----------------------------
-- Records of user_role
-- ----------------------------
BEGIN;
INSERT INTO `user_role` VALUES ('1', '系统管理员'), ('2', '特殊权限人员'), ('3', '一般用户');
COMMIT;

-- ----------------------------
-- Table structure for `user_security_question`
-- ----------------------------
DROP TABLE IF EXISTS `user_security_question`;
CREATE TABLE `user_security_question` (
`user_id`  int(11) NOT NULL ,
`question_id`  int(11) NULL DEFAULT NULL ,
`answer`  varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
`create_time`  varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
`update_time`  varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
PRIMARY KEY (`user_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_unicode_ci

;

-- ----------------------------
-- Records of user_security_question
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Auto increment value for `tran_list`
-- ----------------------------
ALTER TABLE `tran_list` AUTO_INCREMENT=63;

-- ----------------------------
-- Auto increment value for `user_info`
-- ----------------------------
ALTER TABLE `user_info` AUTO_INCREMENT=27;
