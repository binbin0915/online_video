#
# 影视图片表
#

CREATE TABLE `crm_banner` (
  `id` char(19) NOT NULL DEFAULT '' COMMENT 'ID',
  `title` varchar(20) DEFAULT '' COMMENT '标题',
  `image_url` varchar(500) NOT NULL DEFAULT '' COMMENT '图片地址',
  `link_url` varchar(500) DEFAULT '' COMMENT '链接地址',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `is_deleted` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='首页banner表';

#
# Data for table "crm_banner"
#

INSERT INTO `crm_banner` VALUES ('1194556896025845762','test1',
'https://xxx.jpg',
'/course',1,0,'2019-11-13 18:05:32','2019-11-18 10:28:22'),('1194607458461216769','test2',
'https://xxxx.jpg',
'/teacher',2,0,'2019-11-13 21:26:27','2019-11-14 09:12:15');



#
# 影视片段表
#

CREATE TABLE `edu_chapter` (
  `id` char(19) NOT NULL COMMENT '片段ID',
  `movies_id` char(19) NOT NULL COMMENT '影视ID',
  `title` varchar(50) NOT NULL COMMENT '片段名称',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '显示排序',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_movies_id` (`movies_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='影视';

#
# Data for table "edu_chapter"
#

INSERT INTO `edu_chapter` VALUES ('1','14','第一片段：剧情介绍',0,'2019-01-01 12:27:40','2019-01-01 12:55:30'),
('1181729226915577857','18','故事发生的时间',70,'2019-10-09 08:32:58','2019-10-09 08:33:20'),
('1192252428399751169','1192252213659774977','第一段',0,'2019-11-07 09:28:25','2019-11-07 09:28:25'),
('15','18','第一片段：演员入戏',0,'2019-01-01 12:27:40','2019-10-09 09:13:19'),
('3','14','第二片段：演员公司入职',0,'2019-01-01 12:55:35','2019-01-01 12:27:40'),
('44','18','第三片段：演员学习',0,'2019-01-01 12:27:40','2019-01-01 12:27:40');


#
# 影片表
#

CREATE TABLE `edu_movies` (
  `id` char(19) NOT NULL COMMENT '影视ID',
  `actor_id` char(19) NOT NULL COMMENT '影视演员ID',
  `subject_id` char(19) NOT NULL COMMENT '影视专业ID',
  `subject_parent_id` char(19) NOT NULL COMMENT '影视专业父级ID',
  `title` varchar(50) NOT NULL COMMENT '影视标题',
  `price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '影视销售价格，设置为0则可免费观看',
  `video_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '总段数',
  `cover` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '影视封面图片路径',
  `buy_count` bigint(10) unsigned NOT NULL DEFAULT '0' COMMENT '销售数量',
  `view_count` bigint(10) unsigned NOT NULL DEFAULT '0' COMMENT '浏览数量',
  `version` bigint(20) unsigned NOT NULL DEFAULT '1' COMMENT '乐观锁',
  `status` varchar(10) NOT NULL DEFAULT 'Draft' COMMENT '影视状态 Draft未发布  Normal已发布',
  `is_deleted` tinyint(3) DEFAULT NULL COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_title` (`title`),
  KEY `idx_subject_id` (`subject_id`),
  KEY `idx_actor_id` (`actor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='影视';

#
# Data for table "edu_movies"
#

INSERT INTO `edu_movies` VALUES ('1192252213659774977','1189389726308478977','1178214681139539969',
'1178214681118568449','基础影视：test',0.01,2,
'https://xxx.gif',4,387,1,'Normal',0,'2019-11-07 09:27:33','2019-11-18 13:35:03'),
('14','1189389726308478977','1101348944971091969','1101348944920760321','我的祖国',0.00,3,
'http://xxxx.jpg',3,44,15,'Normal',0,'2018-04-02 18:33:34','2019-11-16 21:21:45'),
('15','1189389726308478977','1101348944971091969','1101348944920760321','冠军',0.00,23,
'http://xxx.jpg',0,51,17,'Normal',0,'2018-04-02 18:34:32','2019-11-12 10:19:20'),
('18','1189389726308478977','1178214681139539969','1178214681118568449','战狼2',0.01,20,
'http://xxx.jpg',151,737,6,'Normal',0,'2018-04-02 21:28:46','2019-11-18 11:14:52');

#
# 影视收藏表
#

CREATE TABLE `edu_movies_collect` (
  `id` char(19) NOT NULL COMMENT '收藏ID',
  `movies_id` char(19) NOT NULL COMMENT '影视演员ID',
  `member_id` char(19) NOT NULL DEFAULT '' COMMENT '影视专业ID',
  `is_deleted` tinyint(3) NOT NULL DEFAULT '0' COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='影视收藏';

#
# Data for table "edu_movies_collect"
#

INSERT INTO `edu_movies_collect` VALUES ('1196269345666019330','1192252213659774977','1',1,'2019-11-18 11:30:12','2019-11-18 11:30:12');

#
# 影视简介表
#

CREATE TABLE `edu_movies_description` (
  `id` char(19) NOT NULL COMMENT '影视ID',
  `description` text COMMENT '影视简介',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='影视简介';

#
# Data for table "edu_movies_description"
#

INSERT INTO `edu_movies_description` VALUES ('1104870479077879809','<p>11</p>','2019-03-11 06:23:44',
'2019-03-11 06:23:44'),('1192252213659774977','<p>影片</p>','2019-11-07 09:27:33','2019-11-13 16:21:28'),
('14','','2019-03-13 06:04:43','2019-03-13 06:05:33'),('15','','2019-03-13 06:03:33','2019-03-13 06:04:22'),
('18','<p>本影片介绍了中国的历史</p>','2019-03-06 18:06:36','2019-10-30 19:58:36');

#
# 影视类别表
#

CREATE TABLE `edu_subject` (
  `id` char(19) NOT NULL COMMENT '影视类别ID',
  `title` varchar(10) NOT NULL COMMENT '类别名称',
  `parent_id` char(19) NOT NULL DEFAULT '0' COMMENT '父ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序字段',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='影视科目';

#
# Data for table "edu_subject"
#

INSERT INTO `edu_subject` VALUES ('1178214681118568449','战争','0',1,'2019-09-29 15:47:25','2019-09-29 15:47:25'),
('1178214681139539969','爱情','1178214681118568449',1,'2019-09-29 15:47:25','2019-09-29 15:47:25'),
('1178214681181483010','城市剧','0',3,'2019-09-29 15:47:25','2019-09-29 15:47:25'),
('1178214681210843137','伦理剧','1178214681181483010',4,'2019-09-29 15:47:25','2019-09-29 15:47:25'),
('1178214681231814658','喜剧','0',5,'2019-09-29 15:47:25','2019-09-29 15:47:25'),
('1178214681252786178','武打片','1178214681231814658',5,'2019-09-29 15:47:25','2019-09-29 15:47:25'),
('1178214681294729217','纪录片','1178214681231814658',6,'2019-09-29 15:47:25','2019-09-29 15:47:25'),
('1178214681324089345','连续剧','0',7,'2019-09-29 15:47:25','2019-09-29 15:47:25'),
('1178214681353449473','战争1','1178214681324089345',7,'2019-09-29 15:47:25','2019-09-29 15:47:25'),
('1178214681382809602','言情剧','1178214681324089345',8,'2019-09-29 15:47:25','2019-09-29 15:47:25');

#
# 演员(主演)表
#

CREATE TABLE `edu_actor` (
  `id` char(19) NOT NULL COMMENT '演员ID',
  `name` varchar(20) NOT NULL COMMENT '演员姓名',
  `intro` varchar(500) NOT NULL DEFAULT '' COMMENT '演员简介',
  `career` varchar(500) DEFAULT NULL COMMENT '演员资历,一句话说明演员',
  `level` int(10) unsigned NOT NULL COMMENT '头衔 1高级演员 2首席演员',
  `avatar` varchar(255) DEFAULT NULL COMMENT '演员头像',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `is_deleted` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='演员';

#
# Data for table "edu_actor"
#

INSERT INTO `edu_actor` VALUES ('1','张三','一级演员','一线',1,'https://xx/avatar/default.jpg',0,0,
'2019-10-30 14:18:46','2019-11-12 13:36:36'),
('1189389726308478977','李四','一级演员','一线',2,'https://xxx/actor/11.png',1,0,'2019-10-30 11:53:03',
'2019-10-30 11:53:03'),('1189390295668469762','李刚','高级演员简介','高级演员',2,
'https://xxx.png',2,0,'2019-10-30 11:55:19','2019-11-12 13:37:52'),
('1189426437876985857','王二','高级演员简介','高级演员',1,'https://2ec96ef88.png',0,0,'2019-10-30 14:18:56',
'2019-11-12 13:37:35'),('1189426464967995393','王五','高级演员简介','高级演员',1,
'https://xxxx.png',0,0,'2019-10-30 14:19:02','2019-11-12 13:37:18'),
('1192249914833055746','李四1','高级演员简介','高级演员',1,'https://d825d.png',0,0,
'2019-11-07 09:18:25','2019-11-12 13:37:01'),
('1192327476087115778','1222-12-12','1111','11',1,'https://fd8a4.png',0,1,
'2019-11-07 14:26:37','2019-11-11 16:26:26'),
('1195337453429129218','test','sdfsdf','sdfdf',1,'https://default.jpg',0,1,
'2019-11-15 21:47:12','2019-11-15 21:47:27');

#
# 电影视频表
#

CREATE TABLE `edu_video` (
  `id` char(19) NOT NULL COMMENT '视频ID',
  `movies_id` char(19) NOT NULL COMMENT '影视ID',
  `chapter_id` char(19) NOT NULL COMMENT '章节ID',
  `title` varchar(50) NOT NULL COMMENT '节点名称',
  `video_source_id` varchar(100) DEFAULT NULL COMMENT '云端视频资源',
  `video_original_name` varchar(100) DEFAULT NULL COMMENT '原始文件名称',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序字段',
  `play_count` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '播放次数',
  `is_free` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否可以试听：0收费 1免费',
  `duration` float NOT NULL DEFAULT '0' COMMENT '视频时长（秒）',
  `status` varchar(20) NOT NULL DEFAULT 'Empty' COMMENT 'Empty未上传 Transcoding转码中  Normal正常',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '视频源文件大小（字节）',
  `version` bigint(20) unsigned NOT NULL DEFAULT '1' COMMENT '乐观锁',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_movies_id` (`movies_id`),
  KEY `idx_chapter_id` (`chapter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='影视视频';

#
# Data for table "edu_video"
#

INSERT INTO `edu_video` VALUES ('1182499307429339137','18','32','第一节','','',0,0,0,0,'',0,1,
'2019-10-11 11:32:59','2019-10-11 11:57:38'),('1185312444399071234','14','1','12','','',0,0,0,0,
'Empty',0,1,'2019-10-19 05:51:23','2019-10-19 05:51:33'),('1189434737808990210','18','44','测试','','',
1,0,0,0,'Empty',0,1,'2019-10-30 14:51:55','2019-10-30 14:51:55'),
('1189471423678939138','18','1181729226915577857','test','2b887dc9584d4dc68908780ec57cd3b9',
'视频',1,0,0,0,'Empty',0,1,'2019-10-30 17:17:41','2019-10-30 17:17:41'),
('1189476403626409986','18','1181729226915577857','22','5155c73dc112475cbbddccf4723f7cef',
'视频.mp4',0,0,0,0,'Empty',0,1,'2019-10-30 17:37:29','2019-10-30 17:37:29'),
('1192252824606289921','1192252213659774977','1192252428399751169','第一段落',
'756cf06db9cb4f30be85a9758b19c645','eae2b847ef8503b81f5d5593d769dde2.mp4',0,0,0,0,
'Empty',0,1,'2019-11-07 09:29:59','2019-11-07 09:29:59'),
('1192628092797730818','1192252213659774977','1192252428399751169','第二段落',
'2a02d726622f4c7089d44cb993c531e1','eae2b847ef8503b81f5d5593d769dde2.mp4',0,0,1,0,
'Empty',0,1,'2019-11-08 10:21:10','2019-11-08 10:21:22'),
('1192632495013380097','1192252213659774977','1192252428399751169','第三段落',
'4e560c892fdf4fa2b42e0671aa42fa9d','eae2b847ef8503b81f5d5593d769dde2.mp4',0,0,1,0,'Empty',0,1,
'2019-11-08 10:38:40','2019-11-08 10:38:40'),('1194117638832111617','1192252213659774977','1192252428399751169',
'第四段落','4e560c892fdf4fa2b42e0671aa42fa9d','eae2b847ef8503b81f5d5593d769dde2.mp4',0,0,0,0,'Empty',0
,1,'2019-11-12 13:00:05','2019-11-12 13:00:05'),('1196263770832023554','1192252213659774977',
'1192252428399751169','第五段落','27d21158b0834cb5a8d50710937de330','eae2b847ef8503b81f5d5593d769dde2.mp4',
5,0,0,0,'Empty',0,1,'2019-11-18 11:08:03','2019-11-18 11:08:03'),
('17','18','15','第一节：喜剧','196116a6fee742e1ba9f6c18f65bd8c1','1',1,1000,1,100,'喜剧1',
0,1,'2019-01-01 13:08:57','2019-10-11 11:26:39'),('18','18','15','第二节：爱情剧',
'2d99b08ca0214909899910c9ba042d47','爱情剧',2,999,1,100,'爱情剧',0,1,'2019-01-01 13:09:02','2019-03-08 03:30:27'),
('19','18','15','第三节：爱情剧','51120d59ddfd424cb5ab08b44fc8b23a',
'eae2b847ef8503b81f5d5593d769dde2.mp4',3,888,0,100,'Draft',0,1,'2019-01-01 13:09:05','2019-11-12 12:50:45'),
('20','18','15','第四节：爱情剧','2a38988892d84df598752226c50f3fa3','爱情剧总结.avi',4,666,0,100,
'Draft',0,1,'2019-01-01 13:09:05','2019-10-11 09:20:09');














































































