/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : easyorder

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2016-03-22 23:19:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tbl_log
-- ----------------------------
DROP TABLE IF EXISTS `tbl_log`;
CREATE TABLE `tbl_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(255) DEFAULT NULL,
  `user_id` int(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `money` float(255,2) DEFAULT NULL,
  `addtime` bigint(13) DEFAULT NULL,
  `left_money` float(255,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_log
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_order
-- ----------------------------
DROP TABLE IF EXISTS `tbl_order`;
CREATE TABLE `tbl_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_name` varchar(255) DEFAULT NULL,
  `client_address` varchar(255) DEFAULT NULL,
  `client_phone` varchar(255) DEFAULT NULL,
  `order_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_order
-- ----------------------------
INSERT INTO `tbl_order` VALUES ('61', '张三', '路6', '12345678910', '2015-12-01 00:00:00');
INSERT INTO `tbl_order` VALUES ('62', '李四', '路3', '12345777777', '2016-03-06 00:00:00');

-- ----------------------------
-- Table structure for tbl_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `tbl_order_detail`;
CREATE TABLE `tbl_order_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `spec1` double DEFAULT NULL,
  `spec2` double DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `area` double DEFAULT NULL,
  `price` double DEFAULT NULL,
  `money` double DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `type` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=638 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_order_detail
-- ----------------------------
INSERT INTO `tbl_order_detail` VALUES ('620', '61', '海星米黄灶面折角边面板', '3', '2', '0', '100', '5', '3000', '2', '1');
INSERT INTO `tbl_order_detail` VALUES ('621', '61', '楼梯加厚机器边', '62.1', '0', '0', '0', '35', '0', '322', '2');
INSERT INTO `tbl_order_detail` VALUES ('630', '61', '浅啡网门坎', '1', '0', '5', '0', '15', '75', '', '2');
INSERT INTO `tbl_order_detail` VALUES ('631', '61', '金典红玉灶面', '30', '1', '0', '2', '1.2', '72', '', '1');
INSERT INTO `tbl_order_detail` VALUES ('633', '61', '金典红玉灶面', '30', '1', '0', '2', '1.2', '72', '', '1');
INSERT INTO `tbl_order_detail` VALUES ('636', '62', '产品1', '2', '2', '0', '10', '2', '80', '3', '1');
INSERT INTO `tbl_order_detail` VALUES ('637', '62', '产品2', '2', '0', '23', '0', '2', '92', '', '2');

-- ----------------------------
-- Table structure for tbl_product
-- ----------------------------
DROP TABLE IF EXISTS `tbl_product`;
CREATE TABLE `tbl_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `type` tinyint(2) DEFAULT NULL,
  `spec1` double(10,2) DEFAULT NULL,
  `spec2` double(10,2) DEFAULT NULL,
  `price` double(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_product
-- ----------------------------
INSERT INTO `tbl_product` VALUES ('1', '金典红玉灶面', '1', '30.00', '1.00', '1.23');
INSERT INTO `tbl_product` VALUES ('3', '浅啡网门坎', '2', '1.00', '0.00', '16.00');
INSERT INTO `tbl_product` VALUES ('8', '产品1', '1', '2.00', '2.00', '2.00');
INSERT INTO `tbl_product` VALUES ('11', '3', '3', null, null, '3.00');

-- ----------------------------
-- Table structure for tbl_project
-- ----------------------------
DROP TABLE IF EXISTS `tbl_project`;
CREATE TABLE `tbl_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_project
-- ----------------------------
INSERT INTO `tbl_project` VALUES ('1', null, '金典红玉灶面');
INSERT INTO `tbl_project` VALUES ('3', null, '浅啡网门坎');
INSERT INTO `tbl_project` VALUES ('8', null, '产品1');
INSERT INTO `tbl_project` VALUES ('11', null, '3');
INSERT INTO `tbl_project` VALUES ('12', '61', '12');
INSERT INTO `tbl_project` VALUES ('13', '61', '33');
INSERT INTO `tbl_project` VALUES ('15', '62', '222');

-- ----------------------------
-- Table structure for tbl_user
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user`;
CREATE TABLE `tbl_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `money` float(255,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_user
-- ----------------------------
