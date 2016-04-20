/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : easyorder

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2016-03-26 21:29:05
*/

SET FOREIGN_KEY_CHECKS=0;

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
  `area` double(10,3) NOT NULL DEFAULT '0.000',
  `money` double(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_order
-- ----------------------------
INSERT INTO `tbl_order` VALUES ('61', '张三', '路6', '12345678910', '2015-12-01 00:00:00','0.000','0.00');
INSERT INTO `tbl_order` VALUES ('62', '李四', '路3', '12345777777', '2016-03-06 00:00:00','0.000','0.00');

-- ----------------------------
-- Table structure for tbl_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `tbl_order_detail`;
CREATE TABLE `tbl_order_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(255) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `spec1` double DEFAULT NULL,
  `spec2` double DEFAULT NULL,
  `num` double(10,4) DEFAULT NULL,
  `area` double(10,3) DEFAULT NULL,
  `price` double(10,2) DEFAULT NULL,
  `money` double(10,2) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `type` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=695 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_order_detail
-- ----------------------------
INSERT INTO `tbl_order_detail` VALUES ('620', '61', '13', '3', '0', '0', '5', '0.000', '16.00', '80.00', '2', '1');
INSERT INTO `tbl_order_detail` VALUES ('621', '61', '12', '1', '0', '0', '0', '0.000', '35.00', '0.00', '322', '2');
INSERT INTO `tbl_order_detail` VALUES ('630', '61', '12', '1', '1', '0', '5', '0.000', '15.00', '75.00', '', '1');
INSERT INTO `tbl_order_detail` VALUES ('631', '61', '12', '1', '30', '1', '0', '2.000', '1.20', '72.00', '', '0');
INSERT INTO `tbl_order_detail` VALUES ('633', '61', '12', '1', '0', '0', '0', '0.000', '1.20', '0.00', '', '2');
INSERT INTO `tbl_order_detail` VALUES ('636', '61', '12', '1', '2', '2', '0', '10.000', '2.00', '80.00', '3', '0');
INSERT INTO `tbl_order_detail` VALUES ('637', '61', '12', '1', '2', '0', '23', '0.000', '2.00', '92.00', '', '1');
INSERT INTO `tbl_order_detail` VALUES ('640', '61', '13', '1', '0', '0', '2', '0.000', '1.00', '2.00', '', '2');
INSERT INTO `tbl_order_detail` VALUES ('641', '61', '13', '11', '0', '0', '20', '0.000', '3.00', '60.00', '3', '1');
INSERT INTO `tbl_order_detail` VALUES ('642', '61', '13', '1', '1', '6', '9', '54.000', '1.23', '66.42', '333', '0');

-- ----------------------------
-- Table structure for tbl_product
-- ----------------------------
DROP TABLE IF EXISTS `tbl_product`;
CREATE TABLE `tbl_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `type` tinyint(2) NOT NULL,
  `spec1` double(10,2) NOT NULL DEFAULT '0.00',
  `spec2` double(10,2) NOT NULL DEFAULT '0.00',
  `price` double(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_product
-- ----------------------------
INSERT INTO `tbl_product` VALUES ('1', '金典红玉灶面', '1', '30.00', '1.00', '1.23');
INSERT INTO `tbl_product` VALUES ('3', '浅啡网门坎', '2', '1.00', '0.00', '16.00');
INSERT INTO `tbl_product` VALUES ('8', '桃花红立板', '1', '2.00', '2.00', '38.00');
INSERT INTO `tbl_product` VALUES ('11', '加工费2', '3', '0.00', '0.00', '3.00');
INSERT INTO `tbl_product` VALUES ('12', '产品2', '1', '0.00', '0.00', '12.00');
INSERT INTO `tbl_product` VALUES ('13', '加工费1', '3', '0.00', '0.00', '32.00');

-- ----------------------------
-- Table structure for tbl_project
-- ----------------------------
DROP TABLE IF EXISTS `tbl_project`;
CREATE TABLE `tbl_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_project
-- ----------------------------
INSERT INTO `tbl_project` VALUES ('12', '61', '灶面');
INSERT INTO `tbl_project` VALUES ('13', '61', '灶台');
INSERT INTO `tbl_project` VALUES ('16', '62', '65623');
INSERT INTO `tbl_project` VALUES ('17', '61', '楼梯');
INSERT INTO `tbl_project` VALUES ('18', '61', '门套');

-- ----------------------------
-- Table structure for tbl_user
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user`;
CREATE TABLE `tbl_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `money` float(255,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_user
-- ----------------------------
