/*
Navicat MySQL Data Transfer

Source Server         : server
Source Server Version : 50532
Source Host           : 192.168.1.200:3306
Source Database       : Java

Target Server Type    : MYSQL
Target Server Version : 50532
File Encoding         : 65001

Date: 2013-11-18 20:24:08
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for java_authorization
-- ----------------------------
DROP TABLE IF EXISTS `java_authorization`;
CREATE TABLE `java_authorization` (
  `authorizationid` int(11) NOT NULL AUTO_INCREMENT,
  `describe` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`authorizationid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for java_code
-- ----------------------------
DROP TABLE IF EXISTS `java_code`;
CREATE TABLE `java_code` (
  `codeid` int(11) NOT NULL AUTO_INCREMENT,
  `describe` varchar(255) DEFAULT NULL,
  `content` text,
  `answer` text,
  PRIMARY KEY (`codeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for java_exam
-- ----------------------------
DROP TABLE IF EXISTS `java_exam`;
CREATE TABLE `java_exam` (
  `examid` int(11) NOT NULL AUTO_INCREMENT,
  `examtitle` varchar(255) DEFAULT NULL,
  `describe` varchar(255) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  PRIMARY KEY (`examid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for java_examcode
-- ----------------------------
DROP TABLE IF EXISTS `java_examcode`;
CREATE TABLE `java_examcode` (
  `examitemid` int(11) NOT NULL AUTO_INCREMENT,
  `examid` int(11) DEFAULT NULL,
  `codeid` int(11) DEFAULT NULL,
  PRIMARY KEY (`examitemid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for java_examitem
-- ----------------------------
DROP TABLE IF EXISTS `java_examitem`;
CREATE TABLE `java_examitem` (
  `examitemid` int(11) NOT NULL AUTO_INCREMENT,
  `examid` int(11) DEFAULT NULL,
  `questionid` int(11) DEFAULT NULL,
  PRIMARY KEY (`examitemid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for java_group
-- ----------------------------
DROP TABLE IF EXISTS `java_group`;
CREATE TABLE `java_group` (
  `groupid` int(11) NOT NULL AUTO_INCREMENT,
  `groupname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`groupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for java_groupitem
-- ----------------------------
DROP TABLE IF EXISTS `java_groupitem`;
CREATE TABLE `java_groupitem` (
  `groupitemid` int(11) NOT NULL AUTO_INCREMENT,
  `groupid` int(11) DEFAULT NULL,
  `authorizationid` int(11) DEFAULT NULL,
  PRIMARY KEY (`groupitemid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for java_news
-- ----------------------------
DROP TABLE IF EXISTS `java_news`;
CREATE TABLE `java_news` (
  `newsid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `createtime` datetime DEFAULT NULL,
  `authorid` int(11) DEFAULT NULL,
  PRIMARY KEY (`newsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for java_question
-- ----------------------------
DROP TABLE IF EXISTS `java_question`;
CREATE TABLE `java_question` (
  `questionid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `selectionA` varchar(255) DEFAULT NULL,
  `selectionB` varchar(255) DEFAULT NULL,
  `selectionC` varchar(255) DEFAULT NULL,
  `selectionD` varchar(255) DEFAULT NULL,
  `right_answer` varchar(255) DEFAULT NULL,
  `question_type` int(255) DEFAULT NULL,
  PRIMARY KEY (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for java_score
-- ----------------------------
DROP TABLE IF EXISTS `java_score`;
CREATE TABLE `java_score` (
  `scoreid` int(11) NOT NULL AUTO_INCREMENT,
  `studentid` int(11) DEFAULT NULL,
  `examid` int(11) DEFAULT NULL,
  `selection_right` int(11) DEFAULT NULL,
  `selection_wrong` int(11) DEFAULT NULL,
  `code_right` int(11) DEFAULT NULL,
  `code_wrong` int(11) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  PRIMARY KEY (`scoreid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for java_student
-- ----------------------------
DROP TABLE IF EXISTS `java_student`;
CREATE TABLE `java_student` (
  `studentid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`studentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for java_user
-- ----------------------------
DROP TABLE IF EXISTS `java_user`;
CREATE TABLE `java_user` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for java_video
-- ----------------------------
DROP TABLE IF EXISTS `java_video`;
CREATE TABLE `java_video` (
  `videoid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `describe` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`videoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
