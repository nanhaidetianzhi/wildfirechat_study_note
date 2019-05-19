/*
 Navicat Premium Data Transfer

 Source Server         : 亚投疆
 Source Server Type    : MySQL
 Source Server Version : 80016
 Source Host           : 47.103.98.32:13306
 Source Schema         : yatoujiang_wfchat

 Target Server Type    : MySQL
 Target Server Version : 80016
 File Encoding         : 65001

 Date: 19/05/2019 17:03:47
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for Test
-- ----------------------------
DROP TABLE IF EXISTS `Test`;
CREATE TABLE `Test`  (
  `a` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for flyway_schema_history
-- ----------------------------
DROP TABLE IF EXISTS `flyway_schema_history`;
CREATE TABLE `flyway_schema_history`  (
  `installed_rank` int(11) NOT NULL,
  `version` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `script` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `checksum` int(11) NULL DEFAULT NULL,
  `installed_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `installed_on` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `execution_time` int(11) NOT NULL,
  `success` tinyint(1) NOT NULL,
  PRIMARY KEY (`installed_rank`) USING BTREE,
  INDEX `flyway_schema_history_s_idx`(`success`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flyway_schema_history
-- ----------------------------
INSERT INTO `flyway_schema_history` VALUES (1, '1', '<< Flyway Baseline >>', 'BASELINE', '<< Flyway Baseline >>', NULL, 'root', '2019-05-18 17:46:50', 0, 1);
INSERT INTO `flyway_schema_history` VALUES (2, '2', 'create table', 'SQL', 'V2__create_table.sql', -1748263735, 'root', '2019-05-18 17:46:51', 799, 1);
INSERT INTO `flyway_schema_history` VALUES (3, '3', 'create sharding table', 'SQL', 'V3__create_sharding_table.sql', 478454046, 'root', '2019-05-18 17:47:00', 8405, 1);
INSERT INTO `flyway_schema_history` VALUES (4, '4', 'create default chatroom', 'SQL', 'V4__create_default_chatroom.sql', 1427169464, 'root', '2019-05-18 17:47:00', 6, 1);
INSERT INTO `flyway_schema_history` VALUES (5, '5', 'create default robot', 'SQL', 'V5__create_default_robot.sql', -230242622, 'root', '2019-05-18 17:47:00', 6, 1);
INSERT INTO `flyway_schema_history` VALUES (6, '6', 'add friend alias', 'SQL', 'V6__add_friend_alias.sql', 277839155, 'root', '2019-05-18 17:47:00', 27, 1);

-- ----------------------------
-- Table structure for t_channel
-- ----------------------------
DROP TABLE IF EXISTS `t_channel`;
CREATE TABLE `t_channel`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_cid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `_portrait` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `_owner` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `_status` tinyint(4) NOT NULL DEFAULT 0,
  `_desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `_secret` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `_callback` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `_extra` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `_automatic` tinyint(4) NOT NULL DEFAULT 0,
  `_dt` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `channel_cid_index`(`_cid`) USING BTREE,
  INDEX `channel_name_index`(`_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_channel_listener
-- ----------------------------
DROP TABLE IF EXISTS `t_channel_listener`;
CREATE TABLE `t_channel_listener`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_cid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_mid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `_dt` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `channel_cid_mid_index`(`_cid`, `_mid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_chatroom
-- ----------------------------
DROP TABLE IF EXISTS `t_chatroom`;
CREATE TABLE `t_chatroom`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_cid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `_portrait` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `_state` tinyint(4) NOT NULL DEFAULT 0,
  `_desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `_extra` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `_dt` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `chatroom_cid_index`(`_cid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_chatroom
-- ----------------------------
INSERT INTO `t_chatroom` VALUES (1, 'chatroom1', '火信聊天室1', '', 0, '火信测试聊天室1，用来演示聊天室功能', NULL, 1);
INSERT INTO `t_chatroom` VALUES (2, 'chatroom2', '火信聊天室2', '', 0, '火信测试聊天室2，用来演示聊天室功能', NULL, 1);
INSERT INTO `t_chatroom` VALUES (3, 'chatroom3', '火信聊天室3', '', 0, '火信测试聊天室3，用来演示聊天室功能', NULL, 1);

-- ----------------------------
-- Table structure for t_friend
-- ----------------------------
DROP TABLE IF EXISTS `t_friend`;
CREATE TABLE `t_friend`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_friend_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_state` tinyint(4) NULL DEFAULT 0 COMMENT '0, normal; 1, deleted; 2, blacked',
  `_dt` bigint(20) NOT NULL,
  `_alias` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `f_user_target_index`(`_uid`, `_friend_uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;


-- ----------------------------
-- Table structure for t_friend_request
-- ----------------------------
DROP TABLE IF EXISTS `t_friend_request`;
CREATE TABLE `t_friend_request`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_friend_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `_status` tinyint(4) NOT NULL DEFAULT 0,
  `_dt` bigint(20) NOT NULL,
  `_from_read_status` tinyint(4) NULL DEFAULT 0,
  `_to_read_status` tinyint(4) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `fr_user_target_index`(`_uid`, `_friend_uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;



-- ----------------------------
-- Table structure for t_group
-- ----------------------------
DROP TABLE IF EXISTS `t_group`;
CREATE TABLE `t_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_gid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `_portrait` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `_owner` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `_type` tinyint(4) NOT NULL DEFAULT 0,
  `_extra` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `_dt` bigint(20) NOT NULL,
  `_member_count` int(11) NULL DEFAULT 0,
  `_member_dt` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `group_gid_index`(`_gid`) USING BTREE,
  INDEX `group_name_index`(`_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_group_member
-- ----------------------------
DROP TABLE IF EXISTS `t_group_member`;
CREATE TABLE `t_group_member`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_gid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_mid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `_alias` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `_type` tinyint(4) NULL DEFAULT 0 COMMENT '0普通成员；1，管理员；2，群主，与Owner相同',
  `_dt` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_gid_mid_index`(`_gid`, `_mid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_id_generator
-- ----------------------------
DROP TABLE IF EXISTS `t_id_generator`;
CREATE TABLE `t_id_generator`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_id_generator
-- ----------------------------
INSERT INTO `t_id_generator` VALUES (3);
INSERT INTO `t_id_generator` VALUES (4);
INSERT INTO `t_id_generator` VALUES (5);
INSERT INTO `t_id_generator` VALUES (6);
INSERT INTO `t_id_generator` VALUES (7);
INSERT INTO `t_id_generator` VALUES (8);
INSERT INTO `t_id_generator` VALUES (9);

-- ----------------------------
-- Table structure for t_messages
-- ----------------------------
DROP TABLE IF EXISTS `t_messages`;
CREATE TABLE `t_messages`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_from` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_type` tinyint(4) NOT NULL DEFAULT 0,
  `_target` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_line` int(11) NOT NULL DEFAULT 0,
  `_data` blob NOT NULL,
  `_searchable_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `_dt` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `message_uid_index`(`_mid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_messages_0
-- ----------------------------
DROP TABLE IF EXISTS `t_messages_0`;
CREATE TABLE `t_messages_0`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_from` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_type` tinyint(4) NOT NULL DEFAULT 0,
  `_target` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_line` int(11) NOT NULL DEFAULT 0,
  `_data` blob NOT NULL,
  `_searchable_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `_dt` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_uid_index`(`_mid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_messages_1
-- ----------------------------
DROP TABLE IF EXISTS `t_messages_1`;
CREATE TABLE `t_messages_1`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_from` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_type` tinyint(4) NOT NULL DEFAULT 0,
  `_target` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_line` int(11) NOT NULL DEFAULT 0,
  `_data` blob NOT NULL,
  `_searchable_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `_dt` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_uid_index`(`_mid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_messages_10
-- ----------------------------
DROP TABLE IF EXISTS `t_messages_10`;
CREATE TABLE `t_messages_10`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_from` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_type` tinyint(4) NOT NULL DEFAULT 0,
  `_target` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_line` int(11) NOT NULL DEFAULT 0,
  `_data` blob NOT NULL,
  `_searchable_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `_dt` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_uid_index`(`_mid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_messages_11
-- ----------------------------
DROP TABLE IF EXISTS `t_messages_11`;
CREATE TABLE `t_messages_11`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_from` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_type` tinyint(4) NOT NULL DEFAULT 0,
  `_target` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_line` int(11) NOT NULL DEFAULT 0,
  `_data` blob NOT NULL,
  `_searchable_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `_dt` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_uid_index`(`_mid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_messages_12
-- ----------------------------
DROP TABLE IF EXISTS `t_messages_12`;
CREATE TABLE `t_messages_12`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_from` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_type` tinyint(4) NOT NULL DEFAULT 0,
  `_target` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_line` int(11) NOT NULL DEFAULT 0,
  `_data` blob NOT NULL,
  `_searchable_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `_dt` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_uid_index`(`_mid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_messages_13
-- ----------------------------
DROP TABLE IF EXISTS `t_messages_13`;
CREATE TABLE `t_messages_13`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_from` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_type` tinyint(4) NOT NULL DEFAULT 0,
  `_target` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_line` int(11) NOT NULL DEFAULT 0,
  `_data` blob NOT NULL,
  `_searchable_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `_dt` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_uid_index`(`_mid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_messages_14
-- ----------------------------
DROP TABLE IF EXISTS `t_messages_14`;
CREATE TABLE `t_messages_14`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_from` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_type` tinyint(4) NOT NULL DEFAULT 0,
  `_target` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_line` int(11) NOT NULL DEFAULT 0,
  `_data` blob NOT NULL,
  `_searchable_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `_dt` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_uid_index`(`_mid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_messages_15
-- ----------------------------
DROP TABLE IF EXISTS `t_messages_15`;
CREATE TABLE `t_messages_15`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_from` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_type` tinyint(4) NOT NULL DEFAULT 0,
  `_target` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_line` int(11) NOT NULL DEFAULT 0,
  `_data` blob NOT NULL,
  `_searchable_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `_dt` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_uid_index`(`_mid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_messages_16
-- ----------------------------
DROP TABLE IF EXISTS `t_messages_16`;
CREATE TABLE `t_messages_16`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_from` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_type` tinyint(4) NOT NULL DEFAULT 0,
  `_target` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_line` int(11) NOT NULL DEFAULT 0,
  `_data` blob NOT NULL,
  `_searchable_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `_dt` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_uid_index`(`_mid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_messages_17
-- ----------------------------
DROP TABLE IF EXISTS `t_messages_17`;
CREATE TABLE `t_messages_17`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_from` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_type` tinyint(4) NOT NULL DEFAULT 0,
  `_target` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_line` int(11) NOT NULL DEFAULT 0,
  `_data` blob NOT NULL,
  `_searchable_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `_dt` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_uid_index`(`_mid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_messages_18
-- ----------------------------
DROP TABLE IF EXISTS `t_messages_18`;
CREATE TABLE `t_messages_18`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_from` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_type` tinyint(4) NOT NULL DEFAULT 0,
  `_target` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_line` int(11) NOT NULL DEFAULT 0,
  `_data` blob NOT NULL,
  `_searchable_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `_dt` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_uid_index`(`_mid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_messages_19
-- ----------------------------
DROP TABLE IF EXISTS `t_messages_19`;
CREATE TABLE `t_messages_19`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_from` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_type` tinyint(4) NOT NULL DEFAULT 0,
  `_target` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_line` int(11) NOT NULL DEFAULT 0,
  `_data` blob NOT NULL,
  `_searchable_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `_dt` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_uid_index`(`_mid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_messages_2
-- ----------------------------
DROP TABLE IF EXISTS `t_messages_2`;
CREATE TABLE `t_messages_2`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_from` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_type` tinyint(4) NOT NULL DEFAULT 0,
  `_target` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_line` int(11) NOT NULL DEFAULT 0,
  `_data` blob NOT NULL,
  `_searchable_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `_dt` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_uid_index`(`_mid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_messages_20
-- ----------------------------
DROP TABLE IF EXISTS `t_messages_20`;
CREATE TABLE `t_messages_20`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_from` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_type` tinyint(4) NOT NULL DEFAULT 0,
  `_target` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_line` int(11) NOT NULL DEFAULT 0,
  `_data` blob NOT NULL,
  `_searchable_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `_dt` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_uid_index`(`_mid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_messages_21
-- ----------------------------
DROP TABLE IF EXISTS `t_messages_21`;
CREATE TABLE `t_messages_21`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_from` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_type` tinyint(4) NOT NULL DEFAULT 0,
  `_target` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_line` int(11) NOT NULL DEFAULT 0,
  `_data` blob NOT NULL,
  `_searchable_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `_dt` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_uid_index`(`_mid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_messages_22
-- ----------------------------
DROP TABLE IF EXISTS `t_messages_22`;
CREATE TABLE `t_messages_22`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_from` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_type` tinyint(4) NOT NULL DEFAULT 0,
  `_target` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_line` int(11) NOT NULL DEFAULT 0,
  `_data` blob NOT NULL,
  `_searchable_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `_dt` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_uid_index`(`_mid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_messages_23
-- ----------------------------
DROP TABLE IF EXISTS `t_messages_23`;
CREATE TABLE `t_messages_23`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_from` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_type` tinyint(4) NOT NULL DEFAULT 0,
  `_target` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_line` int(11) NOT NULL DEFAULT 0,
  `_data` blob NOT NULL,
  `_searchable_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `_dt` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_uid_index`(`_mid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_messages_24
-- ----------------------------
DROP TABLE IF EXISTS `t_messages_24`;
CREATE TABLE `t_messages_24`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_from` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_type` tinyint(4) NOT NULL DEFAULT 0,
  `_target` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_line` int(11) NOT NULL DEFAULT 0,
  `_data` blob NOT NULL,
  `_searchable_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `_dt` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_uid_index`(`_mid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_messages_25
-- ----------------------------
DROP TABLE IF EXISTS `t_messages_25`;
CREATE TABLE `t_messages_25`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_from` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_type` tinyint(4) NOT NULL DEFAULT 0,
  `_target` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_line` int(11) NOT NULL DEFAULT 0,
  `_data` blob NOT NULL,
  `_searchable_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `_dt` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_uid_index`(`_mid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_messages_26
-- ----------------------------
DROP TABLE IF EXISTS `t_messages_26`;
CREATE TABLE `t_messages_26`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_from` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_type` tinyint(4) NOT NULL DEFAULT 0,
  `_target` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_line` int(11) NOT NULL DEFAULT 0,
  `_data` blob NOT NULL,
  `_searchable_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `_dt` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_uid_index`(`_mid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_messages_27
-- ----------------------------
DROP TABLE IF EXISTS `t_messages_27`;
CREATE TABLE `t_messages_27`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_from` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_type` tinyint(4) NOT NULL DEFAULT 0,
  `_target` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_line` int(11) NOT NULL DEFAULT 0,
  `_data` blob NOT NULL,
  `_searchable_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `_dt` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_uid_index`(`_mid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_messages_28
-- ----------------------------
DROP TABLE IF EXISTS `t_messages_28`;
CREATE TABLE `t_messages_28`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_from` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_type` tinyint(4) NOT NULL DEFAULT 0,
  `_target` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_line` int(11) NOT NULL DEFAULT 0,
  `_data` blob NOT NULL,
  `_searchable_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `_dt` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_uid_index`(`_mid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_messages_29
-- ----------------------------
DROP TABLE IF EXISTS `t_messages_29`;
CREATE TABLE `t_messages_29`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_from` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_type` tinyint(4) NOT NULL DEFAULT 0,
  `_target` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_line` int(11) NOT NULL DEFAULT 0,
  `_data` blob NOT NULL,
  `_searchable_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `_dt` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_uid_index`(`_mid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_messages_3
-- ----------------------------
DROP TABLE IF EXISTS `t_messages_3`;
CREATE TABLE `t_messages_3`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_from` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_type` tinyint(4) NOT NULL DEFAULT 0,
  `_target` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_line` int(11) NOT NULL DEFAULT 0,
  `_data` blob NOT NULL,
  `_searchable_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `_dt` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_uid_index`(`_mid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_messages_30
-- ----------------------------
DROP TABLE IF EXISTS `t_messages_30`;
CREATE TABLE `t_messages_30`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_from` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_type` tinyint(4) NOT NULL DEFAULT 0,
  `_target` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_line` int(11) NOT NULL DEFAULT 0,
  `_data` blob NOT NULL,
  `_searchable_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `_dt` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_uid_index`(`_mid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_messages_31
-- ----------------------------
DROP TABLE IF EXISTS `t_messages_31`;
CREATE TABLE `t_messages_31`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_from` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_type` tinyint(4) NOT NULL DEFAULT 0,
  `_target` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_line` int(11) NOT NULL DEFAULT 0,
  `_data` blob NOT NULL,
  `_searchable_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `_dt` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_uid_index`(`_mid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_messages_32
-- ----------------------------
DROP TABLE IF EXISTS `t_messages_32`;
CREATE TABLE `t_messages_32`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_from` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_type` tinyint(4) NOT NULL DEFAULT 0,
  `_target` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_line` int(11) NOT NULL DEFAULT 0,
  `_data` blob NOT NULL,
  `_searchable_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `_dt` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_uid_index`(`_mid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_messages_33
-- ----------------------------
DROP TABLE IF EXISTS `t_messages_33`;
CREATE TABLE `t_messages_33`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_from` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_type` tinyint(4) NOT NULL DEFAULT 0,
  `_target` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_line` int(11) NOT NULL DEFAULT 0,
  `_data` blob NOT NULL,
  `_searchable_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `_dt` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_uid_index`(`_mid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_messages_34
-- ----------------------------
DROP TABLE IF EXISTS `t_messages_34`;
CREATE TABLE `t_messages_34`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_from` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_type` tinyint(4) NOT NULL DEFAULT 0,
  `_target` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_line` int(11) NOT NULL DEFAULT 0,
  `_data` blob NOT NULL,
  `_searchable_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `_dt` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_uid_index`(`_mid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_messages_35
-- ----------------------------
DROP TABLE IF EXISTS `t_messages_35`;
CREATE TABLE `t_messages_35`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_from` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_type` tinyint(4) NOT NULL DEFAULT 0,
  `_target` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_line` int(11) NOT NULL DEFAULT 0,
  `_data` blob NOT NULL,
  `_searchable_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `_dt` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_uid_index`(`_mid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_messages_4
-- ----------------------------
DROP TABLE IF EXISTS `t_messages_4`;
CREATE TABLE `t_messages_4`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_from` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_type` tinyint(4) NOT NULL DEFAULT 0,
  `_target` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_line` int(11) NOT NULL DEFAULT 0,
  `_data` blob NOT NULL,
  `_searchable_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `_dt` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_uid_index`(`_mid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_messages_5
-- ----------------------------
DROP TABLE IF EXISTS `t_messages_5`;
CREATE TABLE `t_messages_5`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_from` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_type` tinyint(4) NOT NULL DEFAULT 0,
  `_target` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_line` int(11) NOT NULL DEFAULT 0,
  `_data` blob NOT NULL,
  `_searchable_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `_dt` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_uid_index`(`_mid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_messages_6
-- ----------------------------
DROP TABLE IF EXISTS `t_messages_6`;
CREATE TABLE `t_messages_6`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_from` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_type` tinyint(4) NOT NULL DEFAULT 0,
  `_target` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_line` int(11) NOT NULL DEFAULT 0,
  `_data` blob NOT NULL,
  `_searchable_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `_dt` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_uid_index`(`_mid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_messages_7
-- ----------------------------
DROP TABLE IF EXISTS `t_messages_7`;
CREATE TABLE `t_messages_7`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_from` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_type` tinyint(4) NOT NULL DEFAULT 0,
  `_target` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_line` int(11) NOT NULL DEFAULT 0,
  `_data` blob NOT NULL,
  `_searchable_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `_dt` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_uid_index`(`_mid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_messages_8
-- ----------------------------
DROP TABLE IF EXISTS `t_messages_8`;
CREATE TABLE `t_messages_8`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_from` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_type` tinyint(4) NOT NULL DEFAULT 0,
  `_target` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_line` int(11) NOT NULL DEFAULT 0,
  `_data` blob NOT NULL,
  `_searchable_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `_dt` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_uid_index`(`_mid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_messages_9
-- ----------------------------
DROP TABLE IF EXISTS `t_messages_9`;
CREATE TABLE `t_messages_9`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_from` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_type` tinyint(4) NOT NULL DEFAULT 0,
  `_target` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_line` int(11) NOT NULL DEFAULT 0,
  `_data` blob NOT NULL,
  `_searchable_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `_dt` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_uid_index`(`_mid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_robot
-- ----------------------------
DROP TABLE IF EXISTS `t_robot`;
CREATE TABLE `t_robot`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_owner` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `_secret` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `_callback` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `_state` tinyint(4) NULL DEFAULT 0,
  `_extra` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `_dt` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `robot_uid_index`(`_uid`) USING BTREE,
  INDEX `robot_owner_index`(`_owner`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_robot
-- ----------------------------
INSERT INTO `t_robot` VALUES (1, 'FireRobot', 'FireRobot', '123456', 'http://127.0.0.1:8883/robot/recvmsg', 0, NULL, 1);

-- ----------------------------
-- Table structure for t_sensitiveword
-- ----------------------------
DROP TABLE IF EXISTS `t_sensitiveword`;
CREATE TABLE `t_sensitiveword`  (
  `_word` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_thing
-- ----------------------------
DROP TABLE IF EXISTS `t_thing`;
CREATE TABLE `t_thing`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_owner` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `_token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `_state` tinyint(4) NULL DEFAULT 0,
  `_extra` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `_dt` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `thing_uid_index`(`_uid`) USING BTREE,
  INDEX `thing_owner_index`(`_owner`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `_display_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `_gender` int(11) NOT NULL DEFAULT 0,
  `_portrait` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `_mobile` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `_email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `_address` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `_company` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `_social` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `_passwd_md5` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `_salt` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `_extra` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `_type` tinyint(4) NULL DEFAULT 0,
  `_dt` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_uid_index`(`_uid`) USING BTREE,
  UNIQUE INDEX `user_name_index`(`_name`) USING BTREE,
  INDEX `user_display_name_index`(`_display_name`) USING BTREE,
  INDEX `user_mobile_index`(`_mobile`) USING BTREE,
  INDEX `user_email_index`(`_email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (1, 'FireRobot', 'FireRobot', '小火', 0, 'http://cdn2.wildfirechat.cn/robot.png', '', '', '', '', '', '', '', NULL, 1, 1);
-- ----------------------------
-- Table structure for t_user_messages
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages`;
CREATE TABLE `t_user_messages`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_0
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_0`;
CREATE TABLE `t_user_messages_0`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_1
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_1`;
CREATE TABLE `t_user_messages_1`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_10
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_10`;
CREATE TABLE `t_user_messages_10`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_100
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_100`;
CREATE TABLE `t_user_messages_100`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_101
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_101`;
CREATE TABLE `t_user_messages_101`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_102
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_102`;
CREATE TABLE `t_user_messages_102`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_103
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_103`;
CREATE TABLE `t_user_messages_103`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_104
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_104`;
CREATE TABLE `t_user_messages_104`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_105
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_105`;
CREATE TABLE `t_user_messages_105`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_106
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_106`;
CREATE TABLE `t_user_messages_106`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_107
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_107`;
CREATE TABLE `t_user_messages_107`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_108
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_108`;
CREATE TABLE `t_user_messages_108`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_109
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_109`;
CREATE TABLE `t_user_messages_109`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_11
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_11`;
CREATE TABLE `t_user_messages_11`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_110
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_110`;
CREATE TABLE `t_user_messages_110`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_111
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_111`;
CREATE TABLE `t_user_messages_111`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_112
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_112`;
CREATE TABLE `t_user_messages_112`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_113
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_113`;
CREATE TABLE `t_user_messages_113`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_114
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_114`;
CREATE TABLE `t_user_messages_114`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_115
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_115`;
CREATE TABLE `t_user_messages_115`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_116
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_116`;
CREATE TABLE `t_user_messages_116`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;


-- ----------------------------
-- Table structure for t_user_messages_117
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_117`;
CREATE TABLE `t_user_messages_117`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_118
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_118`;
CREATE TABLE `t_user_messages_118`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_119
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_119`;
CREATE TABLE `t_user_messages_119`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_12
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_12`;
CREATE TABLE `t_user_messages_12`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_120
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_120`;
CREATE TABLE `t_user_messages_120`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_121
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_121`;
CREATE TABLE `t_user_messages_121`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_122
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_122`;
CREATE TABLE `t_user_messages_122`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_123
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_123`;
CREATE TABLE `t_user_messages_123`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_124
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_124`;
CREATE TABLE `t_user_messages_124`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_125
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_125`;
CREATE TABLE `t_user_messages_125`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_126
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_126`;
CREATE TABLE `t_user_messages_126`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_127
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_127`;
CREATE TABLE `t_user_messages_127`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;


-- ----------------------------
-- Table structure for t_user_messages_13
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_13`;
CREATE TABLE `t_user_messages_13`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_14
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_14`;
CREATE TABLE `t_user_messages_14`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_15
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_15`;
CREATE TABLE `t_user_messages_15`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_16
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_16`;
CREATE TABLE `t_user_messages_16`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_17
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_17`;
CREATE TABLE `t_user_messages_17`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_18
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_18`;
CREATE TABLE `t_user_messages_18`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_19
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_19`;
CREATE TABLE `t_user_messages_19`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_2
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_2`;
CREATE TABLE `t_user_messages_2`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_20
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_20`;
CREATE TABLE `t_user_messages_20`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_21
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_21`;
CREATE TABLE `t_user_messages_21`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_22
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_22`;
CREATE TABLE `t_user_messages_22`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_23
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_23`;
CREATE TABLE `t_user_messages_23`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;



-- ----------------------------
-- Table structure for t_user_messages_24
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_24`;
CREATE TABLE `t_user_messages_24`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_25
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_25`;
CREATE TABLE `t_user_messages_25`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_26
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_26`;
CREATE TABLE `t_user_messages_26`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_27
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_27`;
CREATE TABLE `t_user_messages_27`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_28
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_28`;
CREATE TABLE `t_user_messages_28`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_29
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_29`;
CREATE TABLE `t_user_messages_29`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_3
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_3`;
CREATE TABLE `t_user_messages_3`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_30
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_30`;
CREATE TABLE `t_user_messages_30`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_31
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_31`;
CREATE TABLE `t_user_messages_31`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_32
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_32`;
CREATE TABLE `t_user_messages_32`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_33
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_33`;
CREATE TABLE `t_user_messages_33`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_34
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_34`;
CREATE TABLE `t_user_messages_34`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_35
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_35`;
CREATE TABLE `t_user_messages_35`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_36
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_36`;
CREATE TABLE `t_user_messages_36`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;


-- ----------------------------
-- Table structure for t_user_messages_37
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_37`;
CREATE TABLE `t_user_messages_37`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_38
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_38`;
CREATE TABLE `t_user_messages_38`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_39
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_39`;
CREATE TABLE `t_user_messages_39`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_4
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_4`;
CREATE TABLE `t_user_messages_4`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_40
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_40`;
CREATE TABLE `t_user_messages_40`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_41
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_41`;
CREATE TABLE `t_user_messages_41`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_42
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_42`;
CREATE TABLE `t_user_messages_42`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_43
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_43`;
CREATE TABLE `t_user_messages_43`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_44
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_44`;
CREATE TABLE `t_user_messages_44`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_45
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_45`;
CREATE TABLE `t_user_messages_45`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_46
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_46`;
CREATE TABLE `t_user_messages_46`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_47
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_47`;
CREATE TABLE `t_user_messages_47`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_48
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_48`;
CREATE TABLE `t_user_messages_48`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_49
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_49`;
CREATE TABLE `t_user_messages_49`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_5
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_5`;
CREATE TABLE `t_user_messages_5`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_50
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_50`;
CREATE TABLE `t_user_messages_50`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_51
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_51`;
CREATE TABLE `t_user_messages_51`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_52
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_52`;
CREATE TABLE `t_user_messages_52`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_53
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_53`;
CREATE TABLE `t_user_messages_53`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_54
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_54`;
CREATE TABLE `t_user_messages_54`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_55
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_55`;
CREATE TABLE `t_user_messages_55`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_56
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_56`;
CREATE TABLE `t_user_messages_56`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_57
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_57`;
CREATE TABLE `t_user_messages_57`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_58
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_58`;
CREATE TABLE `t_user_messages_58`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_59
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_59`;
CREATE TABLE `t_user_messages_59`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_6
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_6`;
CREATE TABLE `t_user_messages_6`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_60
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_60`;
CREATE TABLE `t_user_messages_60`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_61
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_61`;
CREATE TABLE `t_user_messages_61`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_62
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_62`;
CREATE TABLE `t_user_messages_62`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_63
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_63`;
CREATE TABLE `t_user_messages_63`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_64
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_64`;
CREATE TABLE `t_user_messages_64`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_65
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_65`;
CREATE TABLE `t_user_messages_65`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_66
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_66`;
CREATE TABLE `t_user_messages_66`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_67
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_67`;
CREATE TABLE `t_user_messages_67`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_68
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_68`;
CREATE TABLE `t_user_messages_68`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_69
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_69`;
CREATE TABLE `t_user_messages_69`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_7
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_7`;
CREATE TABLE `t_user_messages_7`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_70
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_70`;
CREATE TABLE `t_user_messages_70`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_71
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_71`;
CREATE TABLE `t_user_messages_71`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_72
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_72`;
CREATE TABLE `t_user_messages_72`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_73
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_73`;
CREATE TABLE `t_user_messages_73`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_74
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_74`;
CREATE TABLE `t_user_messages_74`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_75
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_75`;
CREATE TABLE `t_user_messages_75`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_76
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_76`;
CREATE TABLE `t_user_messages_76`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_77
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_77`;
CREATE TABLE `t_user_messages_77`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_78
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_78`;
CREATE TABLE `t_user_messages_78`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_79
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_79`;
CREATE TABLE `t_user_messages_79`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_8
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_8`;
CREATE TABLE `t_user_messages_8`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_80
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_80`;
CREATE TABLE `t_user_messages_80`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_81
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_81`;
CREATE TABLE `t_user_messages_81`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_82
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_82`;
CREATE TABLE `t_user_messages_82`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_83
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_83`;
CREATE TABLE `t_user_messages_83`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_84
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_84`;
CREATE TABLE `t_user_messages_84`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_85
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_85`;
CREATE TABLE `t_user_messages_85`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_86
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_86`;
CREATE TABLE `t_user_messages_86`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_87
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_87`;
CREATE TABLE `t_user_messages_87`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_88
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_88`;
CREATE TABLE `t_user_messages_88`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_89
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_89`;
CREATE TABLE `t_user_messages_89`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_9
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_9`;
CREATE TABLE `t_user_messages_9`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_90
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_90`;
CREATE TABLE `t_user_messages_90`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_91
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_91`;
CREATE TABLE `t_user_messages_91`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_92
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_92`;
CREATE TABLE `t_user_messages_92`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_93
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_93`;
CREATE TABLE `t_user_messages_93`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_94
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_94`;
CREATE TABLE `t_user_messages_94`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_95
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_95`;
CREATE TABLE `t_user_messages_95`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_96
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_96`;
CREATE TABLE `t_user_messages_96`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_97
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_97`;
CREATE TABLE `t_user_messages_97`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_98
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_98`;
CREATE TABLE `t_user_messages_98`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_messages_99
-- ----------------------------
DROP TABLE IF EXISTS `t_user_messages_99`;
CREATE TABLE `t_user_messages_99`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_mid` bigint(20) NOT NULL,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_seq` bigint(20) NOT NULL,
  `_dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_seq_uid_index`(`_uid`, `_seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_session
-- ----------------------------
DROP TABLE IF EXISTS `t_user_session`;
CREATE TABLE `t_user_session`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_cid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `_voip_token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `_secret` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_db_secret` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_platform` tinyint(4) NULL DEFAULT 0,
  `_push_type` tinyint(4) NULL DEFAULT 0,
  `_package_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `_device_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `_device_version` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `_phone_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `_language` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `_carrier_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `_dt` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `session_uid_cid_index`(`_cid`, `_uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_setting
-- ----------------------------
DROP TABLE IF EXISTS `t_user_setting`;
CREATE TABLE `t_user_setting`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_scope` int(11) NOT NULL,
  `_key` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_value` varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_dt` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_setting_index`(`_uid`, `_scope`, `_key`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;


-- ----------------------------
-- Table structure for t_user_status
-- ----------------------------
DROP TABLE IF EXISTS `t_user_status`;
CREATE TABLE `t_user_status`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_status` int(11) NOT NULL DEFAULT 0,
  `_dt` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_status_uid_index`(`_uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
