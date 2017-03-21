DROP TABLE IF EXISTS `vote_online`;
CREATE TABLE `vote_online` (
  `id` int(12) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) NOT NULL,
  `number` int(12) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;


INSERT INTO `vote_online` VALUES (1, '非常理解', 16);
INSERT INTO `vote_online` VALUES (2, '有所了解', 11);
INSERT INTO `vote_online` VALUES (3, '不了解', 6);
