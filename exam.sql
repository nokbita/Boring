/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : exam

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2022-05-10 11:06:54
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `BNO` int(11) NOT NULL,
  `BNAME` varchar(255) NOT NULL,
  `AUTHOR` varchar(255) DEFAULT NULL,
  `PRICE` decimal(10,2) DEFAULT NULL,
  `PUBLISHER` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`BNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES ('9781111', '数据库原理与应用', '张三', '32.00', '清华大学出版社');
INSERT INTO `book` VALUES ('9781234', '计算机网络', '赵六', '34.00', '电子工业出版社');
INSERT INTO `book` VALUES ('9783456', 'Javaweb开发', '李四', '46.00', '清华大学出版社');
INSERT INTO `book` VALUES ('9787878', '操作系统', '王五', '28.00', '机械工业出版社');

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `CNO` int(11) NOT NULL,
  `CNAME` varchar(255) NOT NULL,
  `SEX` varchar(255) DEFAULT NULL,
  `AGE` int(11) DEFAULT NULL,
  `ADDRESS` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('111', '张三', '男', '30', '洛阳市洛龙区');
INSERT INTO `customer` VALUES ('112', '李思', '女', '29', '郑州市金水区');
INSERT INTO `customer` VALUES ('113', '王五', '男', '29', '洛阳市涧西区');
INSERT INTO `customer` VALUES ('114', '赵六', '女', '28', '郑州市惠济区');

-- ----------------------------
-- Table structure for part
-- ----------------------------
DROP TABLE IF EXISTS `part`;
CREATE TABLE `part` (
  `PNO` int(11) NOT NULL,
  `PNAME` varchar(255) NOT NULL,
  `BRAND` varchar(255) DEFAULT NULL,
  `MODEL` varchar(255) DEFAULT NULL,
  `PRICE` float DEFAULT NULL,
  PRIMARY KEY (`PNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of part
-- ----------------------------
INSERT INTO `part` VALUES ('1', '鼠标', '罗技', 'M585', '89');
INSERT INTO `part` VALUES ('2', '键盘', '联想', 'M123', '129');
INSERT INTO `part` VALUES ('3', 'U盘', '纽顿', '32G', '56');
INSERT INTO `part` VALUES ('4', '移动硬盘', '三星', '2T', '799');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `TNO` int(11) NOT NULL,
  `TNAME` varchar(255) NOT NULL,
  `PHONE` varchar(255) DEFAULT NULL,
  `DEPT` varchar(255) DEFAULT NULL,
  `COURSE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`TNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('2111', '李建国', '13213245678', '网络工程系', '操作系统');
INSERT INTO `teacher` VALUES ('2345', '刘世元', '13737798765', '软件工程系', '软件设计');
INSERT INTO `teacher` VALUES ('2487', '王淑芬', '15538865673', '计算机科学系', '数据库系统');
INSERT INTO `teacher` VALUES ('2873', '张伟', '15837921234', '物联网工程系', '高级语言程序设计');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `ID` int(11) NOT NULL,
  `ACCOUNT` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', 'admin');
INSERT INTO `user` VALUES ('2', '123', '123');

-- ----------------------------
-- Table structure for warehouse
-- ----------------------------
DROP TABLE IF EXISTS `warehouse`;
CREATE TABLE `warehouse` (
  `WNO` int(11) NOT NULL,
  `WNAME` varchar(255) NOT NULL,
  `LOCATION` varchar(255) DEFAULT NULL,
  `SQUARE` double DEFAULT NULL,
  `MANAGER` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`WNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of warehouse
-- ----------------------------
INSERT INTO `warehouse` VALUES ('201903', '配件库', 'A区8号', '156', '张三');
INSERT INTO `warehouse` VALUES ('201904', '主机库', 'B区2号', '234', '李四');
INSERT INTO `warehouse` VALUES ('201905', '打印机库', 'A区7号', '211', '王五');
INSERT INTO `warehouse` VALUES ('201906', '显示器库', 'B区1号', '187', '李四');
