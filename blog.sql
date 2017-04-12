/*
Navicat MySQL Data Transfer
Source Server         : mysql
Source Server Version : 50554
Source Host           : localhost:3306
Source Database       : blog
Target Server Type    : MYSQL
Target Server Version : 50554
File Encoding         : 65001
Date: 2017-04-12 13:43:12
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(2) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  `meta` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL COMMENT '文章标题',
  `content` varchar(2000) NOT NULL COMMENT '文章内容',
  `publish_date` datetime NOT NULL COMMENT '发表时间',
  `click_count` int(5) NOT NULL COMMENT '浏览量',
  `category_id` int(2) NOT NULL COMMENT '文章类别',
  PRIMARY KEY (`id`),
  KEY `category_foreign` (`category_id`),
  CONSTRAINT `tag_foreign` FOREIGN KEY (`id`) REFERENCES `article_tag` (`article_id`),
  CONSTRAINT `category_foreign` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for article_tag
-- ----------------------------
DROP TABLE IF EXISTS `article_tag`;
CREATE TABLE `article_tag` (
  `id` int(10) NOT NULL,
  `article_id` int(10) NOT NULL,
  `tag_id` int(2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `article_id` (`article_id`),
  KEY `tag_id` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tag
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag` (
  `id` int(2) NOT NULL,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `article_foreign` FOREIGN KEY (`id`) REFERENCES `article_tag` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
