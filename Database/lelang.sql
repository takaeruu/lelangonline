/*
 Navicat Premium Data Transfer

 Source Server         : yoga
 Source Server Type    : MySQL
 Source Server Version : 100428 (10.4.28-MariaDB)
 Source Host           : localhost:3306
 Source Schema         : lelang

 Target Server Type    : MySQL
 Target Server Version : 100428 (10.4.28-MariaDB)
 File Encoding         : 65001

 Date: 14/11/2024 01:35:39
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for setting
-- ----------------------------
DROP TABLE IF EXISTS `setting`;
CREATE TABLE `setting`  (
  `id_setting` int NOT NULL AUTO_INCREMENT,
  `nama_website` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `logo_website` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tab_icon` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `login_icon` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `create_by` int NULL DEFAULT NULL,
  `update_by` int NULL DEFAULT NULL,
  `deleted_by` int NULL DEFAULT NULL,
  `create_at` datetime NULL DEFAULT NULL,
  `update_at` datetime NULL DEFAULT NULL,
  `deleted_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id_setting`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of setting
-- ----------------------------
INSERT INTO `setting` VALUES (1, 'Auctionesiaaa', '1731522622_f1035fc378f20444dd96.jpg', '1731522622_d449aa1fd68904ffd453.jpg', '1731522622_4d48aa66d97129e10fcf.jpg', NULL, 1, NULL, NULL, '2024-11-13 12:30:21', NULL);

-- ----------------------------
-- Table structure for tb_barang
-- ----------------------------
DROP TABLE IF EXISTS `tb_barang`;
CREATE TABLE `tb_barang`  (
  `id_barang` int NOT NULL AUTO_INCREMENT,
  `nama_barang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tanggal` date NULL DEFAULT NULL,
  `harga` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `deskripsi_barang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `foto_barang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_barang`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_barang
-- ----------------------------
INSERT INTO `tb_barang` VALUES (3, 'RM 52-01 Skull Tourbillon “Vanitas Vanitatum\"', '0000-00-00', '100000000', 'new', 'uploads/1731493669_f04a54ac4f05ffa03ff4.jpg');
INSERT INTO `tb_barang` VALUES (7, 'tes123', '0000-00-00', '2', '2', 'uploads/1731496091_f79da0597af4e2646a9e.png');
INSERT INTO `tb_barang` VALUES (8, 'Tequila Ley .925 Diamante', '2024-11-13', '10000', 'Only one in the world', 'uploads/1731496091_f79da0597af4e2646a9e.png');
INSERT INTO `tb_barang` VALUES (9, 'contoh barang', '2024-11-13', '10000', 'masih baru', 'uploads/1731521834_894dcfcc7ddbc5b096ac.png');

-- ----------------------------
-- Table structure for tb_history_lelang
-- ----------------------------
DROP TABLE IF EXISTS `tb_history_lelang`;
CREATE TABLE `tb_history_lelang`  (
  `id_history_lelang` int NOT NULL AUTO_INCREMENT,
  `id_lelang` int NULL DEFAULT NULL,
  `id_barang` int NULL DEFAULT NULL,
  `id_user` int NULL DEFAULT NULL,
  `penawaran_harga` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tanggal` date NULL DEFAULT NULL,
  PRIMARY KEY (`id_history_lelang`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_history_lelang
-- ----------------------------
INSERT INTO `tb_history_lelang` VALUES (1, 7, 7, 1, '20000', '2024-11-13');
INSERT INTO `tb_history_lelang` VALUES (2, 7, 7, 1, '30000', '2024-11-13');
INSERT INTO `tb_history_lelang` VALUES (3, 9, 9, 1, '12000', '2024-11-13');

-- ----------------------------
-- Table structure for tb_lelang
-- ----------------------------
DROP TABLE IF EXISTS `tb_lelang`;
CREATE TABLE `tb_lelang`  (
  `id_lelang` int NOT NULL AUTO_INCREMENT,
  `id_barang` int NULL DEFAULT NULL,
  `id_user` int NULL DEFAULT NULL,
  `tanggal_lelang` date NULL DEFAULT NULL,
  `harga_akhir` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` enum('DIBUKA','DITUTUP') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_lelang`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_lelang
-- ----------------------------
INSERT INTO `tb_lelang` VALUES (1, 3, 5, '2024-11-13', '100000000', 'DIBUKA');
INSERT INTO `tb_lelang` VALUES (2, 7, 1, '2024-11-13', '30000', 'DITUTUP');
INSERT INTO `tb_lelang` VALUES (3, 8, 1, '2024-11-13', '10000', 'DIBUKA');
INSERT INTO `tb_lelang` VALUES (7, 9, 1, '2024-11-13', '12000', 'DIBUKA');

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user`  (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `level` enum('admin','petugas','masyarakat') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `deleted_at` datetime NULL DEFAULT NULL,
  `deleted_by` int NULL DEFAULT NULL,
  `updated_by` int NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `backup_by` int NULL DEFAULT NULL,
  `backup_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id_user`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES (1, 'admin', 'c4ca4238a0b923820dcc509a6f75849b', 'admin', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_user` VALUES (2, 'petugas', 'c4ca4238a0b923820dcc509a6f75849b', 'petugas', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_user` VALUES (3, 'masyarakat', 'c4ca4238a0b923820dcc509a6f75849b', 'masyarakat', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_user` VALUES (4, 'pembisnis ', 'c4ca4238a0b923820dcc509a6f75849b', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_user` VALUES (5, 'tes1234', 'c4ca4238a0b923820dcc509a6f75849b', 'masyarakat', NULL, NULL, 1, '2024-11-13 12:29:42', NULL, NULL);
INSERT INTO `tb_user` VALUES (6, 'jor', NULL, 'masyarakat', NULL, NULL, 1, '2024-11-13 12:23:19', NULL, NULL);
INSERT INTO `tb_user` VALUES (7, 'testprojek', NULL, 'masyarakat', NULL, NULL, 1, '2024-11-13 12:20:25', NULL, NULL);

-- ----------------------------
-- Table structure for tb_user_backup
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_backup`;
CREATE TABLE `tb_user_backup`  (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `level` enum('admin','petugas','masyarakat') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `deleted_at` datetime NULL DEFAULT NULL,
  `deleted_by` int NULL DEFAULT NULL,
  `backup_by` int NULL DEFAULT NULL,
  `backup_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id_user`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_user_backup
-- ----------------------------
INSERT INTO `tb_user_backup` VALUES (5, 'tes1234', NULL, 'masyarakat', NULL, NULL, NULL, NULL);
INSERT INTO `tb_user_backup` VALUES (6, 'joni123', NULL, 'masyarakat', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for user_activity
-- ----------------------------
DROP TABLE IF EXISTS `user_activity`;
CREATE TABLE `user_activity`  (
  `id_log` int NOT NULL AUTO_INCREMENT,
  `id_user` int NULL DEFAULT NULL,
  `menu` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id_log`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 531 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_activity
-- ----------------------------
INSERT INTO `user_activity` VALUES (1, 1, 'Masuk ke Login', '2024-11-13 03:08:08');
INSERT INTO `user_activity` VALUES (2, 1, 'Masuk ke Login', '2024-11-13 03:09:24');
INSERT INTO `user_activity` VALUES (3, 1, 'Masuk ke Login', '2024-11-13 03:09:52');
INSERT INTO `user_activity` VALUES (4, 1, 'Masuk ke Dashboard', '2024-11-13 03:10:00');
INSERT INTO `user_activity` VALUES (5, 1, 'Masuk ke Dashboard', '2024-11-13 03:10:13');
INSERT INTO `user_activity` VALUES (6, 1, 'Masuk ke Dashboard', '2024-11-13 03:10:38');
INSERT INTO `user_activity` VALUES (7, 1, 'Masuk ke Dashboard', '2024-11-13 03:10:43');
INSERT INTO `user_activity` VALUES (8, 1, 'Masuk ke Dashboard', '2024-11-13 03:10:52');
INSERT INTO `user_activity` VALUES (9, 1, 'Masuk ke Dashboard', '2024-11-13 03:10:55');
INSERT INTO `user_activity` VALUES (10, 1, 'Masuk ke Dashboard', '2024-11-13 03:10:59');
INSERT INTO `user_activity` VALUES (11, 1, 'Masuk ke Login', '2024-11-13 03:11:48');
INSERT INTO `user_activity` VALUES (12, 1, 'Masuk ke Login', '2024-11-13 03:12:02');
INSERT INTO `user_activity` VALUES (13, 1, 'Masuk ke Login', '2024-11-13 03:20:08');
INSERT INTO `user_activity` VALUES (14, 1, 'Masuk ke Register', '2024-11-13 03:20:10');
INSERT INTO `user_activity` VALUES (15, 1, 'Masuk ke Register', '2024-11-13 03:20:51');
INSERT INTO `user_activity` VALUES (16, 1, 'Masuk ke Login', '2024-11-13 03:20:53');
INSERT INTO `user_activity` VALUES (17, 1, 'Masuk ke Register', '2024-11-13 03:20:58');
INSERT INTO `user_activity` VALUES (18, 1, 'Masuk ke Register', '2024-11-13 03:22:06');
INSERT INTO `user_activity` VALUES (19, 1, 'Masuk ke Register', '2024-11-13 03:22:09');
INSERT INTO `user_activity` VALUES (20, 1, 'Masuk ke Register', '2024-11-13 03:22:17');
INSERT INTO `user_activity` VALUES (21, 1, 'Masuk ke Register', '2024-11-13 03:22:37');
INSERT INTO `user_activity` VALUES (22, 1, 'Masuk ke Register', '2024-11-13 03:23:14');
INSERT INTO `user_activity` VALUES (23, 1, 'Masuk ke Register', '2024-11-13 03:23:21');
INSERT INTO `user_activity` VALUES (24, 1, 'Masuk ke Register', '2024-11-13 03:24:02');
INSERT INTO `user_activity` VALUES (25, 1, 'Masuk ke Register', '2024-11-13 03:26:05');
INSERT INTO `user_activity` VALUES (26, 1, 'Masuk ke Register', '2024-11-13 03:26:27');
INSERT INTO `user_activity` VALUES (27, 1, 'Masuk ke Register', '2024-11-13 03:26:39');
INSERT INTO `user_activity` VALUES (28, 1, 'Masuk ke Register', '2024-11-13 03:27:10');
INSERT INTO `user_activity` VALUES (29, 1, 'Masuk ke Register', '2024-11-13 03:28:31');
INSERT INTO `user_activity` VALUES (30, 1, 'Masuk ke Register', '2024-11-13 03:28:51');
INSERT INTO `user_activity` VALUES (31, 1, 'Masuk ke Register', '2024-11-13 03:31:48');
INSERT INTO `user_activity` VALUES (32, 1, 'Masuk ke Register', '2024-11-13 03:32:01');
INSERT INTO `user_activity` VALUES (33, 1, 'Masuk ke Register', '2024-11-13 03:32:11');
INSERT INTO `user_activity` VALUES (34, 1, 'Masuk ke Register', '2024-11-13 03:33:20');
INSERT INTO `user_activity` VALUES (35, 1, 'Masuk ke Register', '2024-11-13 03:33:49');
INSERT INTO `user_activity` VALUES (36, 1, 'Masuk ke Register', '2024-11-13 03:35:04');
INSERT INTO `user_activity` VALUES (37, 1, 'Masuk ke Login', '2024-11-13 03:35:18');
INSERT INTO `user_activity` VALUES (38, 1, 'Masuk ke Register', '2024-11-13 03:35:23');
INSERT INTO `user_activity` VALUES (39, 1, 'Masuk ke Register', '2024-11-13 03:36:08');
INSERT INTO `user_activity` VALUES (40, 1, 'Masuk ke Register', '2024-11-13 03:36:17');
INSERT INTO `user_activity` VALUES (41, 1, 'Masuk ke Register', '2024-11-13 03:36:31');
INSERT INTO `user_activity` VALUES (42, 1, 'Masuk ke Register', '2024-11-13 03:36:54');
INSERT INTO `user_activity` VALUES (43, 1, 'Masuk ke Register', '2024-11-13 03:37:46');
INSERT INTO `user_activity` VALUES (44, 1, 'Masuk ke Register', '2024-11-13 03:38:00');
INSERT INTO `user_activity` VALUES (45, 1, 'Masuk ke Register', '2024-11-13 03:38:21');
INSERT INTO `user_activity` VALUES (46, 1, 'Masuk ke Register', '2024-11-13 03:38:43');
INSERT INTO `user_activity` VALUES (47, 1, 'Masuk ke Register', '2024-11-13 03:40:03');
INSERT INTO `user_activity` VALUES (48, 1, 'Masuk ke Register', '2024-11-13 03:43:59');
INSERT INTO `user_activity` VALUES (49, 1, 'Masuk ke Register', '2024-11-13 03:44:11');
INSERT INTO `user_activity` VALUES (50, 1, 'Masuk ke Register', '2024-11-13 03:45:13');
INSERT INTO `user_activity` VALUES (51, 1, 'Masuk ke Register', '2024-11-13 03:45:41');
INSERT INTO `user_activity` VALUES (52, 1, 'Masuk ke Login', '2024-11-13 03:45:50');
INSERT INTO `user_activity` VALUES (53, 1, 'Masuk ke Register', '2024-11-13 03:45:53');
INSERT INTO `user_activity` VALUES (54, 1, 'Masuk ke Login', '2024-11-13 03:46:07');
INSERT INTO `user_activity` VALUES (55, 5, 'Masuk ke Dashboard', '2024-11-13 03:46:16');
INSERT INTO `user_activity` VALUES (56, 5, 'Masuk ke Dashboard', '2024-11-13 03:47:03');
INSERT INTO `user_activity` VALUES (57, 5, 'Masuk ke Dashboard', '2024-11-13 03:49:53');
INSERT INTO `user_activity` VALUES (58, 5, 'Masuk ke Barang', '2024-11-13 03:50:05');
INSERT INTO `user_activity` VALUES (59, 5, 'Masuk ke Barang', '2024-11-13 03:51:07');
INSERT INTO `user_activity` VALUES (60, 5, 'Masuk ke Barang', '2024-11-13 03:51:48');
INSERT INTO `user_activity` VALUES (61, 5, 'Masuk ke Barang', '2024-11-13 03:51:57');
INSERT INTO `user_activity` VALUES (62, 5, 'Masuk ke Barang', '2024-11-13 03:52:21');
INSERT INTO `user_activity` VALUES (63, 5, 'Masuk ke Barang', '2024-11-13 03:52:36');
INSERT INTO `user_activity` VALUES (64, 5, 'Masuk ke Barang', '2024-11-13 03:52:41');
INSERT INTO `user_activity` VALUES (65, 5, 'Masuk ke Barang', '2024-11-13 03:53:10');
INSERT INTO `user_activity` VALUES (66, 5, 'Masuk ke Barang', '2024-11-13 03:53:40');
INSERT INTO `user_activity` VALUES (67, 5, 'Masuk ke Barang', '2024-11-13 03:53:58');
INSERT INTO `user_activity` VALUES (68, 5, 'Masuk ke Barang', '2024-11-13 03:54:01');
INSERT INTO `user_activity` VALUES (69, 5, 'Masuk ke Barang', '2024-11-13 03:54:22');
INSERT INTO `user_activity` VALUES (70, 5, 'Masuk ke Barang', '2024-11-13 03:55:25');
INSERT INTO `user_activity` VALUES (71, 5, 'Masuk ke Barang', '2024-11-13 03:55:58');
INSERT INTO `user_activity` VALUES (72, 5, 'Masuk ke Barang', '2024-11-13 04:00:23');
INSERT INTO `user_activity` VALUES (73, 5, 'Masuk ke Barang', '2024-11-13 04:01:01');
INSERT INTO `user_activity` VALUES (74, 5, 'Masuk ke Barang', '2024-11-13 04:03:19');
INSERT INTO `user_activity` VALUES (75, 5, 'Masuk ke Barang', '2024-11-13 04:04:01');
INSERT INTO `user_activity` VALUES (76, 5, 'Masuk ke Barang', '2024-11-13 04:05:01');
INSERT INTO `user_activity` VALUES (77, 5, 'Masuk ke Barang', '2024-11-13 04:07:06');
INSERT INTO `user_activity` VALUES (78, 5, 'Masuk ke Barang', '2024-11-13 04:07:24');
INSERT INTO `user_activity` VALUES (79, 5, 'Masuk ke Barang', '2024-11-13 04:08:12');
INSERT INTO `user_activity` VALUES (80, 5, 'Masuk ke Barang', '2024-11-13 04:08:25');
INSERT INTO `user_activity` VALUES (81, 5, 'Masuk ke Barang', '2024-11-13 04:09:13');
INSERT INTO `user_activity` VALUES (82, 5, 'Masuk ke Barang', '2024-11-13 04:22:28');
INSERT INTO `user_activity` VALUES (83, 5, 'Masuk ke Barang', '2024-11-13 04:23:52');
INSERT INTO `user_activity` VALUES (84, 5, 'Masuk ke Barang', '2024-11-13 04:24:59');
INSERT INTO `user_activity` VALUES (85, 5, 'Masuk ke Barang', '2024-11-13 04:27:33');
INSERT INTO `user_activity` VALUES (86, 5, 'Masuk ke Barang', '2024-11-13 04:27:50');
INSERT INTO `user_activity` VALUES (87, 5, 'Masuk ke Barang', '2024-11-13 04:28:15');
INSERT INTO `user_activity` VALUES (88, 5, 'Masuk ke Barang', '2024-11-13 04:28:29');
INSERT INTO `user_activity` VALUES (89, 5, 'Masuk ke Barang', '2024-11-13 04:28:40');
INSERT INTO `user_activity` VALUES (90, 5, 'Masuk ke Barang', '2024-11-13 04:29:59');
INSERT INTO `user_activity` VALUES (91, 5, 'Masuk ke Barang', '2024-11-13 04:31:27');
INSERT INTO `user_activity` VALUES (92, 5, 'Masuk ke Barang', '2024-11-13 04:34:29');
INSERT INTO `user_activity` VALUES (93, 5, 'Masuk ke Barang', '2024-11-13 04:35:17');
INSERT INTO `user_activity` VALUES (94, 5, 'Masuk ke Barang', '2024-11-13 04:35:50');
INSERT INTO `user_activity` VALUES (95, 5, 'Masuk ke Barang', '2024-11-13 04:35:51');
INSERT INTO `user_activity` VALUES (96, 5, 'Masuk ke Barang', '2024-11-13 04:36:42');
INSERT INTO `user_activity` VALUES (97, 5, 'Masuk ke Barang', '2024-11-13 04:36:43');
INSERT INTO `user_activity` VALUES (98, 5, 'Masuk ke Barang', '2024-11-13 04:36:56');
INSERT INTO `user_activity` VALUES (99, 5, 'Masuk ke Barang', '2024-11-13 04:38:24');
INSERT INTO `user_activity` VALUES (100, 5, 'Masuk ke Barang', '2024-11-13 04:38:36');
INSERT INTO `user_activity` VALUES (101, 5, 'Masuk ke Barang', '2024-11-13 04:38:51');
INSERT INTO `user_activity` VALUES (102, 5, 'Masuk ke Barang', '2024-11-13 04:38:58');
INSERT INTO `user_activity` VALUES (103, 5, 'Masuk ke Barang', '2024-11-13 04:38:59');
INSERT INTO `user_activity` VALUES (104, 5, 'Masuk ke Barang', '2024-11-13 04:39:16');
INSERT INTO `user_activity` VALUES (105, 5, 'Masuk ke Barang', '2024-11-13 04:39:31');
INSERT INTO `user_activity` VALUES (106, 5, 'Masuk ke Barang', '2024-11-13 04:39:57');
INSERT INTO `user_activity` VALUES (107, 5, 'Masuk ke Barang', '2024-11-13 04:40:36');
INSERT INTO `user_activity` VALUES (108, 5, 'Masuk ke Barang', '2024-11-13 04:43:45');
INSERT INTO `user_activity` VALUES (109, 5, 'Masuk ke Barang', '2024-11-13 04:45:07');
INSERT INTO `user_activity` VALUES (110, 5, 'Masuk ke Barang', '2024-11-13 04:45:22');
INSERT INTO `user_activity` VALUES (111, 5, 'Masuk ke Barang', '2024-11-13 04:45:42');
INSERT INTO `user_activity` VALUES (112, 5, 'Masuk ke Barang', '2024-11-13 04:46:35');
INSERT INTO `user_activity` VALUES (113, 5, 'Masuk ke Barang', '2024-11-13 04:46:44');
INSERT INTO `user_activity` VALUES (114, 5, 'Masuk ke Barang', '2024-11-13 04:47:00');
INSERT INTO `user_activity` VALUES (115, 5, 'Masuk ke Barang', '2024-11-13 04:47:05');
INSERT INTO `user_activity` VALUES (116, 5, 'Masuk ke Barang', '2024-11-13 04:47:05');
INSERT INTO `user_activity` VALUES (117, 5, 'Masuk ke Barang', '2024-11-13 04:47:39');
INSERT INTO `user_activity` VALUES (118, 5, 'Masuk ke Barang', '2024-11-13 04:48:09');
INSERT INTO `user_activity` VALUES (119, 5, 'Masuk ke Barang', '2024-11-13 04:49:45');
INSERT INTO `user_activity` VALUES (120, 5, 'Masuk ke Barang', '2024-11-13 04:50:12');
INSERT INTO `user_activity` VALUES (121, 5, 'Masuk ke Barang', '2024-11-13 04:50:20');
INSERT INTO `user_activity` VALUES (122, 5, 'Masuk ke Barang', '2024-11-13 04:51:17');
INSERT INTO `user_activity` VALUES (123, 5, 'Masuk ke Barang', '2024-11-13 04:51:46');
INSERT INTO `user_activity` VALUES (124, 5, 'Masuk ke Barang', '2024-11-13 04:51:56');
INSERT INTO `user_activity` VALUES (125, 5, 'Masuk ke Barang', '2024-11-13 04:52:04');
INSERT INTO `user_activity` VALUES (126, 5, 'Masuk ke Barang', '2024-11-13 04:52:17');
INSERT INTO `user_activity` VALUES (127, 5, 'Masuk ke Barang', '2024-11-13 04:52:34');
INSERT INTO `user_activity` VALUES (128, 5, 'Masuk ke Barang', '2024-11-13 04:53:47');
INSERT INTO `user_activity` VALUES (129, 5, 'Masuk ke Barang', '2024-11-13 04:54:14');
INSERT INTO `user_activity` VALUES (130, 5, 'Masuk ke Barang', '2024-11-13 04:55:37');
INSERT INTO `user_activity` VALUES (131, 5, 'Masuk ke Barang', '2024-11-13 04:55:49');
INSERT INTO `user_activity` VALUES (132, 5, 'Masuk ke Barang', '2024-11-13 04:56:27');
INSERT INTO `user_activity` VALUES (133, 5, 'Masuk ke Barang', '2024-11-13 04:56:40');
INSERT INTO `user_activity` VALUES (134, 5, 'Masuk ke Barang', '2024-11-13 04:57:10');
INSERT INTO `user_activity` VALUES (135, 5, 'Masuk ke Barang', '2024-11-13 04:57:29');
INSERT INTO `user_activity` VALUES (136, 5, 'Masuk ke Barang', '2024-11-13 04:58:07');
INSERT INTO `user_activity` VALUES (137, 5, 'Masuk ke Barang', '2024-11-13 04:58:24');
INSERT INTO `user_activity` VALUES (138, 5, 'Masuk ke Barang', '2024-11-13 04:59:08');
INSERT INTO `user_activity` VALUES (139, 5, 'Masuk ke Barang', '2024-11-13 04:59:20');
INSERT INTO `user_activity` VALUES (140, 5, 'Masuk ke Barang', '2024-11-13 04:59:51');
INSERT INTO `user_activity` VALUES (141, 5, 'Masuk ke Barang', '2024-11-13 04:59:57');
INSERT INTO `user_activity` VALUES (142, 5, 'Masuk ke Barang', '2024-11-13 05:00:58');
INSERT INTO `user_activity` VALUES (143, 5, 'Masuk ke Barang', '2024-11-13 05:02:33');
INSERT INTO `user_activity` VALUES (144, 5, 'Masuk ke Barang', '2024-11-13 05:03:54');
INSERT INTO `user_activity` VALUES (145, 5, 'Menghapus Barang', '2024-11-13 05:04:16');
INSERT INTO `user_activity` VALUES (146, 5, 'Masuk ke Barang', '2024-11-13 05:04:17');
INSERT INTO `user_activity` VALUES (147, 5, 'Menghapus Barang', '2024-11-13 05:04:21');
INSERT INTO `user_activity` VALUES (148, 5, 'Masuk ke Barang', '2024-11-13 05:04:22');
INSERT INTO `user_activity` VALUES (149, 5, 'Masuk ke Barang', '2024-11-13 05:05:37');
INSERT INTO `user_activity` VALUES (150, 5, 'Masuk ke Barang', '2024-11-13 05:07:17');
INSERT INTO `user_activity` VALUES (151, 5, 'Menghapus Barang', '2024-11-13 05:07:25');
INSERT INTO `user_activity` VALUES (152, 5, 'Masuk ke Barang', '2024-11-13 05:07:26');
INSERT INTO `user_activity` VALUES (153, 5, 'Menghapus Barang', '2024-11-13 05:07:31');
INSERT INTO `user_activity` VALUES (154, 5, 'Masuk ke Barang', '2024-11-13 05:07:31');
INSERT INTO `user_activity` VALUES (155, 5, 'Menghapus Barang', '2024-11-13 05:07:41');
INSERT INTO `user_activity` VALUES (156, 5, 'Masuk ke Barang', '2024-11-13 05:07:41');
INSERT INTO `user_activity` VALUES (157, 5, 'Masuk ke Barang', '2024-11-13 05:08:12');
INSERT INTO `user_activity` VALUES (158, 5, 'Masuk ke Barang', '2024-11-13 05:12:35');
INSERT INTO `user_activity` VALUES (159, 5, 'Masuk ke Barang', '2024-11-13 05:21:59');
INSERT INTO `user_activity` VALUES (160, 5, 'Masuk ke Barang', '2024-11-13 05:25:19');
INSERT INTO `user_activity` VALUES (161, 5, 'Masuk ke Barang', '2024-11-13 05:40:07');
INSERT INTO `user_activity` VALUES (162, 5, 'Masuk ke Barang', '2024-11-13 05:40:35');
INSERT INTO `user_activity` VALUES (163, 5, 'Masuk ke Barang', '2024-11-13 05:47:07');
INSERT INTO `user_activity` VALUES (164, 5, 'Masuk ke Lelang', '2024-11-13 05:47:09');
INSERT INTO `user_activity` VALUES (165, 5, 'Masuk ke Lelang', '2024-11-13 05:47:20');
INSERT INTO `user_activity` VALUES (166, 5, 'Masuk ke Lelang', '2024-11-13 05:50:58');
INSERT INTO `user_activity` VALUES (167, 5, 'Masuk ke Lelang', '2024-11-13 05:51:13');
INSERT INTO `user_activity` VALUES (168, 5, 'Masuk ke Lelang', '2024-11-13 05:51:22');
INSERT INTO `user_activity` VALUES (169, 5, 'Masuk ke Lelang', '2024-11-13 05:52:58');
INSERT INTO `user_activity` VALUES (170, 5, 'Masuk ke Lelang', '2024-11-13 05:53:30');
INSERT INTO `user_activity` VALUES (171, 5, 'Masuk ke Lelang', '2024-11-13 05:55:21');
INSERT INTO `user_activity` VALUES (172, 5, 'Masuk ke Lelang', '2024-11-13 05:56:43');
INSERT INTO `user_activity` VALUES (173, 5, 'Masuk ke Lelang', '2024-11-13 05:56:44');
INSERT INTO `user_activity` VALUES (174, 5, 'Menambah Lelang', '2024-11-13 05:56:49');
INSERT INTO `user_activity` VALUES (175, 5, 'Masuk ke Lelang', '2024-11-13 05:56:49');
INSERT INTO `user_activity` VALUES (176, 5, 'Masuk ke Lelang', '2024-11-13 05:57:02');
INSERT INTO `user_activity` VALUES (177, 5, 'Masuk ke Lelang', '2024-11-13 05:59:52');
INSERT INTO `user_activity` VALUES (178, 5, 'Masuk ke Lelang', '2024-11-13 06:00:04');
INSERT INTO `user_activity` VALUES (179, 5, 'Masuk ke Lelang', '2024-11-13 06:03:55');
INSERT INTO `user_activity` VALUES (180, 5, 'Masuk ke Lelang', '2024-11-13 06:04:19');
INSERT INTO `user_activity` VALUES (181, 5, 'Masuk ke Lelang', '2024-11-13 06:04:26');
INSERT INTO `user_activity` VALUES (182, 5, 'Masuk ke Barang', '2024-11-13 06:04:39');
INSERT INTO `user_activity` VALUES (183, 5, 'Masuk ke Barang', '2024-11-13 07:23:37');
INSERT INTO `user_activity` VALUES (184, 5, 'Masuk ke Login', '2024-11-13 07:23:53');
INSERT INTO `user_activity` VALUES (185, 5, 'Masuk ke Login', '2024-11-13 07:23:58');
INSERT INTO `user_activity` VALUES (186, 1, 'Masuk ke Dashboard', '2024-11-13 07:24:13');
INSERT INTO `user_activity` VALUES (187, 1, 'Masuk ke Dashboard', '2024-11-13 07:24:35');
INSERT INTO `user_activity` VALUES (188, 1, 'Masuk ke Lelang', '2024-11-13 07:25:13');
INSERT INTO `user_activity` VALUES (189, 1, 'Masuk ke Lelang', '2024-11-13 07:25:15');
INSERT INTO `user_activity` VALUES (190, 1, 'Masuk ke Lelang', '2024-11-13 07:36:53');
INSERT INTO `user_activity` VALUES (191, 1, 'Masuk ke Lelang', '2024-11-13 07:39:24');
INSERT INTO `user_activity` VALUES (192, 1, 'Masuk ke Lelang', '2024-11-13 07:39:35');
INSERT INTO `user_activity` VALUES (193, 1, 'Masuk ke Lelang', '2024-11-13 07:42:05');
INSERT INTO `user_activity` VALUES (194, 1, 'Masuk ke Lelang', '2024-11-13 07:44:22');
INSERT INTO `user_activity` VALUES (195, 1, 'Masuk ke Lelang', '2024-11-13 07:47:12');
INSERT INTO `user_activity` VALUES (196, 1, 'Masuk ke Lelang', '2024-11-13 07:48:08');
INSERT INTO `user_activity` VALUES (197, 1, 'Masuk ke Barang', '2024-11-13 07:48:59');
INSERT INTO `user_activity` VALUES (198, 1, 'Masuk ke Lelang', '2024-11-13 07:49:14');
INSERT INTO `user_activity` VALUES (199, 1, 'Masuk ke Lelang', '2024-11-13 07:49:15');
INSERT INTO `user_activity` VALUES (200, 1, 'Masuk ke Lelang', '2024-11-13 07:51:44');
INSERT INTO `user_activity` VALUES (201, 1, 'Masuk ke Lelang', '2024-11-13 07:51:57');
INSERT INTO `user_activity` VALUES (202, 1, 'Masuk ke Lelang', '2024-11-13 07:52:04');
INSERT INTO `user_activity` VALUES (203, 1, 'Masuk ke Lelang', '2024-11-13 07:52:15');
INSERT INTO `user_activity` VALUES (204, 1, 'Masuk ke Lelang', '2024-11-13 07:52:38');
INSERT INTO `user_activity` VALUES (205, 1, 'Masuk ke Lelang', '2024-11-13 07:54:24');
INSERT INTO `user_activity` VALUES (206, 1, 'Masuk ke Lelang', '2024-11-13 07:54:38');
INSERT INTO `user_activity` VALUES (207, 1, 'Masuk ke Lelang', '2024-11-13 07:57:23');
INSERT INTO `user_activity` VALUES (208, 1, 'Masuk ke Lelang', '2024-11-13 07:58:14');
INSERT INTO `user_activity` VALUES (209, 1, 'Masuk ke Lelang', '2024-11-13 07:58:47');
INSERT INTO `user_activity` VALUES (210, 1, 'Masuk ke Lelang', '2024-11-13 07:58:57');
INSERT INTO `user_activity` VALUES (211, 1, 'Masuk ke Lelang', '2024-11-13 08:00:04');
INSERT INTO `user_activity` VALUES (212, 1, 'Masuk ke Lelang', '2024-11-13 08:02:42');
INSERT INTO `user_activity` VALUES (213, 1, 'Masuk ke Lelang', '2024-11-13 08:05:55');
INSERT INTO `user_activity` VALUES (214, 1, 'Masuk ke Lelang', '2024-11-13 08:09:15');
INSERT INTO `user_activity` VALUES (215, 1, 'Masuk ke Lelang', '2024-11-13 08:11:15');
INSERT INTO `user_activity` VALUES (216, 1, 'Masuk ke Lelang', '2024-11-13 08:11:31');
INSERT INTO `user_activity` VALUES (217, 1, 'Masuk ke Lelang', '2024-11-13 08:14:20');
INSERT INTO `user_activity` VALUES (218, 1, 'Masuk ke Lelang', '2024-11-13 08:14:27');
INSERT INTO `user_activity` VALUES (219, 1, 'Masuk ke Lelang', '2024-11-13 08:19:36');
INSERT INTO `user_activity` VALUES (220, 1, 'Masuk ke Lelang', '2024-11-13 08:19:41');
INSERT INTO `user_activity` VALUES (221, 1, 'Masuk ke Lelang', '2024-11-13 08:20:32');
INSERT INTO `user_activity` VALUES (222, 1, 'Masuk ke Dashboard', '2024-11-13 08:20:36');
INSERT INTO `user_activity` VALUES (223, 1, 'Masuk ke Lelang', '2024-11-13 08:20:38');
INSERT INTO `user_activity` VALUES (224, 1, 'Masuk ke Lelang', '2024-11-13 08:21:05');
INSERT INTO `user_activity` VALUES (225, 1, 'Masuk ke Lelang', '2024-11-13 08:25:28');
INSERT INTO `user_activity` VALUES (226, 1, 'Masuk ke Lelang', '2024-11-13 08:25:49');
INSERT INTO `user_activity` VALUES (227, 1, 'Masuk ke Lelang', '2024-11-13 08:26:00');
INSERT INTO `user_activity` VALUES (228, 1, 'Masuk ke Lelang', '2024-11-13 08:26:17');
INSERT INTO `user_activity` VALUES (229, 1, 'Masuk ke Lelang', '2024-11-13 08:26:43');
INSERT INTO `user_activity` VALUES (230, 1, 'Masuk ke Lelang', '2024-11-13 08:26:59');
INSERT INTO `user_activity` VALUES (231, 1, 'Masuk ke Lelang', '2024-11-13 08:27:15');
INSERT INTO `user_activity` VALUES (232, 1, 'Masuk ke Lelang', '2024-11-13 08:27:23');
INSERT INTO `user_activity` VALUES (233, 1, 'Masuk ke Lelang', '2024-11-13 08:27:45');
INSERT INTO `user_activity` VALUES (234, 1, 'Masuk ke Lelang', '2024-11-13 08:29:58');
INSERT INTO `user_activity` VALUES (235, 1, 'Masuk ke Lelang', '2024-11-13 08:30:13');
INSERT INTO `user_activity` VALUES (236, 1, 'Masuk ke Lelang', '2024-11-13 08:31:18');
INSERT INTO `user_activity` VALUES (237, 1, 'Masuk ke Lelang', '2024-11-13 08:32:11');
INSERT INTO `user_activity` VALUES (238, 1, 'Masuk ke Lelang', '2024-11-13 08:32:20');
INSERT INTO `user_activity` VALUES (239, 1, 'Masuk ke Lelang', '2024-11-13 08:32:34');
INSERT INTO `user_activity` VALUES (240, 1, 'Masuk ke Lelang', '2024-11-13 08:44:16');
INSERT INTO `user_activity` VALUES (241, 1, 'Masuk ke Lelang', '2024-11-13 08:44:28');
INSERT INTO `user_activity` VALUES (242, 1, 'Masuk ke Lelang', '2024-11-13 08:44:31');
INSERT INTO `user_activity` VALUES (243, 1, 'Masuk ke Lelang', '2024-11-13 08:44:45');
INSERT INTO `user_activity` VALUES (244, 1, 'Masuk ke Lelang', '2024-11-13 08:46:16');
INSERT INTO `user_activity` VALUES (245, 1, 'Masuk ke Lelang', '2024-11-13 08:47:06');
INSERT INTO `user_activity` VALUES (246, 1, 'Masuk ke Lelang', '2024-11-13 08:48:29');
INSERT INTO `user_activity` VALUES (247, 1, 'Masuk ke Lelang', '2024-11-13 08:48:37');
INSERT INTO `user_activity` VALUES (248, 1, 'Masuk ke Lelang', '2024-11-13 08:48:41');
INSERT INTO `user_activity` VALUES (249, 1, 'Masuk ke Lelang', '2024-11-13 08:48:48');
INSERT INTO `user_activity` VALUES (250, 1, 'Masuk ke Lelang', '2024-11-13 08:48:59');
INSERT INTO `user_activity` VALUES (251, 1, 'Masuk ke Lelang', '2024-11-13 08:49:14');
INSERT INTO `user_activity` VALUES (252, 1, 'Masuk ke Lelang', '2024-11-13 08:49:15');
INSERT INTO `user_activity` VALUES (253, 1, 'Masuk ke Lelang', '2024-11-13 08:49:25');
INSERT INTO `user_activity` VALUES (254, 1, 'Masuk ke Lelang', '2024-11-13 08:49:31');
INSERT INTO `user_activity` VALUES (255, 1, 'Masuk ke Lelang', '2024-11-13 08:50:09');
INSERT INTO `user_activity` VALUES (256, 1, 'Masuk ke Lelang', '2024-11-13 08:51:07');
INSERT INTO `user_activity` VALUES (257, 1, 'Masuk ke Lelang', '2024-11-13 08:51:11');
INSERT INTO `user_activity` VALUES (258, 1, 'Masuk ke Lelang', '2024-11-13 08:52:05');
INSERT INTO `user_activity` VALUES (259, 1, 'Masuk ke Lelang', '2024-11-13 08:52:19');
INSERT INTO `user_activity` VALUES (260, 1, 'Masuk ke Lelang', '2024-11-13 08:52:31');
INSERT INTO `user_activity` VALUES (261, 1, 'Masuk ke Lelang', '2024-11-13 08:53:32');
INSERT INTO `user_activity` VALUES (262, 1, 'Masuk ke Lelang', '2024-11-13 08:54:11');
INSERT INTO `user_activity` VALUES (263, 1, 'Masuk ke Lelang', '2024-11-13 08:55:50');
INSERT INTO `user_activity` VALUES (264, 1, 'Masuk ke Lelang', '2024-11-13 08:55:56');
INSERT INTO `user_activity` VALUES (265, 1, 'Masuk ke Lelang', '2024-11-13 08:56:05');
INSERT INTO `user_activity` VALUES (266, 1, 'Masuk ke Lelang', '2024-11-13 08:56:13');
INSERT INTO `user_activity` VALUES (267, 1, 'Masuk ke Lelang', '2024-11-13 08:57:19');
INSERT INTO `user_activity` VALUES (268, 1, 'Masuk ke Barang', '2024-11-13 08:58:54');
INSERT INTO `user_activity` VALUES (269, 1, 'Masuk ke Lelang', '2024-11-13 08:58:56');
INSERT INTO `user_activity` VALUES (270, 1, 'Masuk ke Lelang', '2024-11-13 08:59:41');
INSERT INTO `user_activity` VALUES (271, 1, 'Masuk ke Lelang', '2024-11-13 09:08:26');
INSERT INTO `user_activity` VALUES (272, 1, 'Masuk ke Lelang', '2024-11-13 09:08:43');
INSERT INTO `user_activity` VALUES (273, 1, 'Masuk ke Lelang', '2024-11-13 09:08:44');
INSERT INTO `user_activity` VALUES (274, 1, 'Masuk ke Lelang', '2024-11-13 09:09:04');
INSERT INTO `user_activity` VALUES (275, 1, 'Masuk ke Lelang', '2024-11-13 09:09:30');
INSERT INTO `user_activity` VALUES (276, 1, 'Masuk ke Lelang', '2024-11-13 09:10:13');
INSERT INTO `user_activity` VALUES (277, 1, 'Masuk ke Lelang', '2024-11-13 09:10:20');
INSERT INTO `user_activity` VALUES (278, 1, 'Masuk ke Lelang', '2024-11-13 09:10:32');
INSERT INTO `user_activity` VALUES (279, 1, 'Masuk ke Lelang', '2024-11-13 09:13:19');
INSERT INTO `user_activity` VALUES (280, 1, 'Masuk ke Lelang', '2024-11-13 09:13:46');
INSERT INTO `user_activity` VALUES (281, 1, 'Masuk ke Lelang', '2024-11-13 09:16:23');
INSERT INTO `user_activity` VALUES (282, 1, 'Masuk ke Barang', '2024-11-13 09:17:07');
INSERT INTO `user_activity` VALUES (283, 1, 'Masuk ke Barang', '2024-11-13 09:18:25');
INSERT INTO `user_activity` VALUES (284, 1, 'Masuk ke Lelang', '2024-11-13 09:18:40');
INSERT INTO `user_activity` VALUES (285, 1, 'Masuk ke Lelang', '2024-11-13 09:18:43');
INSERT INTO `user_activity` VALUES (286, 1, 'Masuk ke Barang', '2024-11-13 09:18:44');
INSERT INTO `user_activity` VALUES (287, 1, 'Masuk ke Lelang', '2024-11-13 09:18:45');
INSERT INTO `user_activity` VALUES (288, 1, 'Masuk ke Lelang', '2024-11-13 09:18:46');
INSERT INTO `user_activity` VALUES (289, 1, 'Masuk ke Dashboard', '2024-11-13 09:18:48');
INSERT INTO `user_activity` VALUES (290, 1, 'Masuk ke Barang', '2024-11-13 09:18:50');
INSERT INTO `user_activity` VALUES (291, 1, 'Masuk ke Barang', '2024-11-13 09:18:56');
INSERT INTO `user_activity` VALUES (292, 1, 'Masuk ke Lelang', '2024-11-13 09:18:58');
INSERT INTO `user_activity` VALUES (293, 1, 'Masuk ke Lelang', '2024-11-13 09:19:14');
INSERT INTO `user_activity` VALUES (294, 1, 'Masuk ke Barang', '2024-11-13 09:19:18');
INSERT INTO `user_activity` VALUES (295, 1, 'Masuk ke Barang', '2024-11-13 09:19:23');
INSERT INTO `user_activity` VALUES (296, 1, 'Masuk ke Barang', '2024-11-13 09:20:23');
INSERT INTO `user_activity` VALUES (297, 1, 'Masuk ke Lelang', '2024-11-13 09:20:26');
INSERT INTO `user_activity` VALUES (298, 1, 'Masuk ke Barang', '2024-11-13 09:20:29');
INSERT INTO `user_activity` VALUES (299, 1, 'Masuk ke Lelang', '2024-11-13 09:20:30');
INSERT INTO `user_activity` VALUES (300, 1, 'Masuk ke Lelang', '2024-11-13 09:20:32');
INSERT INTO `user_activity` VALUES (301, 1, 'Masuk ke Lelang', '2024-11-13 09:20:55');
INSERT INTO `user_activity` VALUES (302, 1, 'Masuk ke Lelang', '2024-11-13 09:21:16');
INSERT INTO `user_activity` VALUES (303, 1, 'Masuk ke Lelang', '2024-11-13 09:21:55');
INSERT INTO `user_activity` VALUES (304, 1, 'Masuk ke Lelang', '2024-11-13 09:22:36');
INSERT INTO `user_activity` VALUES (305, 1, 'Masuk ke Barang', '2024-11-13 09:22:39');
INSERT INTO `user_activity` VALUES (306, 1, 'Masuk ke Barang', '2024-11-13 09:22:52');
INSERT INTO `user_activity` VALUES (307, 1, 'Masuk ke Barang', '2024-11-13 09:23:02');
INSERT INTO `user_activity` VALUES (308, 1, 'Masuk ke Barang', '2024-11-13 09:24:53');
INSERT INTO `user_activity` VALUES (309, 1, 'Masuk ke Barang', '2024-11-13 09:26:45');
INSERT INTO `user_activity` VALUES (310, 1, 'Masuk ke Barang', '2024-11-13 09:26:46');
INSERT INTO `user_activity` VALUES (311, 1, 'Masuk ke Barang', '2024-11-13 09:27:06');
INSERT INTO `user_activity` VALUES (312, 1, 'Masuk ke Barang', '2024-11-13 09:27:17');
INSERT INTO `user_activity` VALUES (313, 1, 'Masuk ke Barang', '2024-11-13 09:27:23');
INSERT INTO `user_activity` VALUES (314, 1, 'Masuk ke Barang', '2024-11-13 09:28:26');
INSERT INTO `user_activity` VALUES (315, 1, 'Masuk ke Barang', '2024-11-13 09:30:29');
INSERT INTO `user_activity` VALUES (316, 1, 'Masuk ke Barang', '2024-11-13 09:31:35');
INSERT INTO `user_activity` VALUES (317, 1, 'Masuk ke Barang', '2024-11-13 09:33:32');
INSERT INTO `user_activity` VALUES (318, 1, 'Masuk ke Barang', '2024-11-13 09:33:41');
INSERT INTO `user_activity` VALUES (319, 1, 'Masuk ke Barang', '2024-11-13 09:34:47');
INSERT INTO `user_activity` VALUES (320, 1, 'Masuk ke Barang', '2024-11-13 09:35:29');
INSERT INTO `user_activity` VALUES (321, 1, 'Masuk ke Lelang', '2024-11-13 09:35:49');
INSERT INTO `user_activity` VALUES (322, 1, 'Masuk ke Lelang', '2024-11-13 09:36:41');
INSERT INTO `user_activity` VALUES (323, 1, 'Masuk ke Lelang', '2024-11-13 09:37:27');
INSERT INTO `user_activity` VALUES (324, 1, 'Masuk ke Setting', '2024-11-13 09:37:34');
INSERT INTO `user_activity` VALUES (325, 1, 'Masuk ke Setting', '2024-11-13 09:37:49');
INSERT INTO `user_activity` VALUES (326, 1, 'Masuk ke Setting', '2024-11-13 09:38:31');
INSERT INTO `user_activity` VALUES (327, 1, 'Masuk ke Setting', '2024-11-13 09:39:28');
INSERT INTO `user_activity` VALUES (328, 1, 'Masuk ke Setting', '2024-11-13 09:39:45');
INSERT INTO `user_activity` VALUES (329, 1, 'Masuk ke Log Activity', '2024-11-13 09:40:06');
INSERT INTO `user_activity` VALUES (330, 1, 'Masuk ke Log Activity', '2024-11-13 09:40:10');
INSERT INTO `user_activity` VALUES (331, 1, 'Masuk ke Log Activity', '2024-11-13 09:40:17');
INSERT INTO `user_activity` VALUES (332, 1, 'Masuk ke Log Activity', '2024-11-13 09:40:22');
INSERT INTO `user_activity` VALUES (333, 1, 'Masuk ke Log Activity', '2024-11-13 09:40:44');
INSERT INTO `user_activity` VALUES (334, 1, 'Masuk ke Log Activity', '2024-11-13 09:41:33');
INSERT INTO `user_activity` VALUES (335, 1, 'Masuk ke Barang', '2024-11-13 09:42:51');
INSERT INTO `user_activity` VALUES (336, 1, 'Masuk ke Barang', '2024-11-13 09:53:03');
INSERT INTO `user_activity` VALUES (337, 1, 'Masuk ke Laporan', '2024-11-13 09:53:06');
INSERT INTO `user_activity` VALUES (338, 1, 'Masuk ke Laporan', '2024-11-13 09:56:27');
INSERT INTO `user_activity` VALUES (339, 1, 'Masuk ke Laporan', '2024-11-13 09:58:24');
INSERT INTO `user_activity` VALUES (340, 1, 'Masuk ke Laporan', '2024-11-13 09:58:25');
INSERT INTO `user_activity` VALUES (341, 1, 'Masuk ke Laporan', '2024-11-13 10:01:29');
INSERT INTO `user_activity` VALUES (342, 1, 'Masuk ke Laporan', '2024-11-13 10:01:46');
INSERT INTO `user_activity` VALUES (343, 1, 'Masuk ke Laporan', '2024-11-13 10:03:50');
INSERT INTO `user_activity` VALUES (344, 1, 'Masuk ke Laporan', '2024-11-13 10:04:49');
INSERT INTO `user_activity` VALUES (345, 1, 'Masuk Ke Window Print', '2024-11-13 10:04:54');
INSERT INTO `user_activity` VALUES (346, 1, 'Masuk Ke Window Print', '2024-11-13 10:04:54');
INSERT INTO `user_activity` VALUES (347, 1, 'Masuk Ke Window Print', '2024-11-13 10:06:06');
INSERT INTO `user_activity` VALUES (348, 1, 'Masuk Ke Window Print', '2024-11-13 10:19:11');
INSERT INTO `user_activity` VALUES (349, 1, 'Masuk Ke Window Print', '2024-11-13 10:19:39');
INSERT INTO `user_activity` VALUES (350, 1, 'Masuk Ke Window Print', '2024-11-13 10:24:56');
INSERT INTO `user_activity` VALUES (351, 1, 'Masuk Ke Window Print', '2024-11-13 10:27:25');
INSERT INTO `user_activity` VALUES (352, 1, 'Masuk ke Laporan', '2024-11-13 10:27:27');
INSERT INTO `user_activity` VALUES (353, 1, 'Masuk ke Laporan', '2024-11-13 10:27:29');
INSERT INTO `user_activity` VALUES (354, 1, 'Masuk ke Laporan', '2024-11-13 10:27:31');
INSERT INTO `user_activity` VALUES (355, 1, 'Masuk Ke Window Print', '2024-11-13 10:27:37');
INSERT INTO `user_activity` VALUES (356, 1, 'Masuk Ke Window Print', '2024-11-13 10:27:38');
INSERT INTO `user_activity` VALUES (357, 1, 'Masuk Ke Window Print', '2024-11-13 10:28:56');
INSERT INTO `user_activity` VALUES (358, 1, 'Masuk ke Laporan', '2024-11-13 10:28:58');
INSERT INTO `user_activity` VALUES (359, 1, 'Masuk ke Laporan', '2024-11-13 10:28:59');
INSERT INTO `user_activity` VALUES (360, 1, 'Masuk ke Laporan', '2024-11-13 10:29:39');
INSERT INTO `user_activity` VALUES (361, 1, 'Masuk Ke Window Print', '2024-11-13 10:29:44');
INSERT INTO `user_activity` VALUES (362, 1, 'Masuk Ke Window Print', '2024-11-13 10:29:45');
INSERT INTO `user_activity` VALUES (363, 1, 'Masuk ke Laporan', '2024-11-13 10:31:41');
INSERT INTO `user_activity` VALUES (364, 1, 'Masuk ke Laporan', '2024-11-13 10:33:09');
INSERT INTO `user_activity` VALUES (365, 1, 'Masuk Ke Window Print', '2024-11-13 10:33:14');
INSERT INTO `user_activity` VALUES (366, 1, 'Masuk Ke Window Print', '2024-11-13 10:36:31');
INSERT INTO `user_activity` VALUES (367, 1, 'Masuk Ke Window Print', '2024-11-13 10:37:39');
INSERT INTO `user_activity` VALUES (368, 1, 'Masuk Ke Window Print', '2024-11-13 10:38:22');
INSERT INTO `user_activity` VALUES (369, 1, 'Masuk ke Laporan', '2024-11-13 10:38:30');
INSERT INTO `user_activity` VALUES (370, 1, 'Masuk ke Lelang', '2024-11-13 10:38:54');
INSERT INTO `user_activity` VALUES (371, 1, 'Masuk ke Lelang', '2024-11-13 10:38:54');
INSERT INTO `user_activity` VALUES (372, 1, 'Masuk ke Lelang', '2024-11-13 10:38:54');
INSERT INTO `user_activity` VALUES (373, 1, 'Masuk ke Lelang', '2024-11-13 10:38:54');
INSERT INTO `user_activity` VALUES (374, 1, 'Masuk ke Laporan', '2024-11-13 10:38:56');
INSERT INTO `user_activity` VALUES (375, 1, 'Masuk ke Laporan', '2024-11-13 10:40:56');
INSERT INTO `user_activity` VALUES (376, 1, 'Masuk ke Laporan', '2024-11-13 10:41:05');
INSERT INTO `user_activity` VALUES (377, 1, 'Masuk Ke Window Print', '2024-11-13 10:41:11');
INSERT INTO `user_activity` VALUES (378, 1, 'Masuk Ke Window Print', '2024-11-13 10:41:29');
INSERT INTO `user_activity` VALUES (379, 1, 'Masuk Ke Window Print', '2024-11-13 10:42:20');
INSERT INTO `user_activity` VALUES (380, 1, 'Masuk ke Laporan', '2024-11-13 10:43:09');
INSERT INTO `user_activity` VALUES (381, 1, 'Masuk ke Lelang', '2024-11-13 10:43:09');
INSERT INTO `user_activity` VALUES (382, 1, 'Masuk ke Laporan', '2024-11-13 10:44:53');
INSERT INTO `user_activity` VALUES (383, 1, 'Masuk ke Laporan', '2024-11-13 10:44:54');
INSERT INTO `user_activity` VALUES (384, 1, 'Masuk Ke Window Print', '2024-11-13 10:45:04');
INSERT INTO `user_activity` VALUES (385, 1, 'Masuk Ke Window Print', '2024-11-13 10:45:21');
INSERT INTO `user_activity` VALUES (386, 1, 'Masuk Ke Window Print', '2024-11-13 10:52:09');
INSERT INTO `user_activity` VALUES (387, 1, 'Masuk Ke Window Print', '2024-11-13 10:53:30');
INSERT INTO `user_activity` VALUES (388, 1, 'Masuk Ke Window Print', '2024-11-13 10:54:03');
INSERT INTO `user_activity` VALUES (389, 1, 'Masuk ke Laporan', '2024-11-13 10:54:16');
INSERT INTO `user_activity` VALUES (390, 1, 'Masuk ke Lelang', '2024-11-13 10:54:17');
INSERT INTO `user_activity` VALUES (391, 1, 'Masuk ke Barang', '2024-11-13 10:54:22');
INSERT INTO `user_activity` VALUES (392, 1, 'Masuk ke Barang', '2024-11-13 10:57:33');
INSERT INTO `user_activity` VALUES (393, 1, 'Masuk ke Barang', '2024-11-13 10:57:49');
INSERT INTO `user_activity` VALUES (394, 1, 'Masuk ke User', '2024-11-13 10:57:54');
INSERT INTO `user_activity` VALUES (395, 1, 'Masuk ke User', '2024-11-13 10:59:11');
INSERT INTO `user_activity` VALUES (396, 1, 'Masuk ke User', '2024-11-13 11:01:01');
INSERT INTO `user_activity` VALUES (397, 1, 'Masuk ke User', '2024-11-13 11:01:10');
INSERT INTO `user_activity` VALUES (398, 1, 'Masuk ke User', '2024-11-13 11:02:01');
INSERT INTO `user_activity` VALUES (399, 1, 'Masuk ke User', '2024-11-13 11:04:02');
INSERT INTO `user_activity` VALUES (400, 1, 'Masuk ke User', '2024-11-13 11:04:08');
INSERT INTO `user_activity` VALUES (401, 1, 'Masuk ke User', '2024-11-13 11:08:17');
INSERT INTO `user_activity` VALUES (402, 1, 'Masuk ke User', '2024-11-13 11:08:47');
INSERT INTO `user_activity` VALUES (403, 1, 'Masuk ke User', '2024-11-13 11:08:49');
INSERT INTO `user_activity` VALUES (404, 1, 'Masuk ke Soft Delete', '2024-11-13 11:08:50');
INSERT INTO `user_activity` VALUES (405, 1, 'Masuk ke Soft Delete', '2024-11-13 11:09:01');
INSERT INTO `user_activity` VALUES (406, 1, 'Masuk ke User', '2024-11-13 11:09:03');
INSERT INTO `user_activity` VALUES (407, 1, 'Masuk ke User', '2024-11-13 11:10:02');
INSERT INTO `user_activity` VALUES (408, 1, 'Masuk ke User', '2024-11-13 11:10:03');
INSERT INTO `user_activity` VALUES (409, 1, 'Masuk ke User', '2024-11-13 11:13:47');
INSERT INTO `user_activity` VALUES (410, 1, 'Masuk ke User', '2024-11-13 11:18:17');
INSERT INTO `user_activity` VALUES (411, 1, 'Masuk ke User', '2024-11-13 11:20:02');
INSERT INTO `user_activity` VALUES (412, 1, 'Masuk ke User', '2024-11-13 11:20:02');
INSERT INTO `user_activity` VALUES (413, 1, 'Masuk ke Restore Edit User', '2024-11-13 11:20:30');
INSERT INTO `user_activity` VALUES (414, 1, 'Masuk ke Restore Edit User', '2024-11-13 11:21:17');
INSERT INTO `user_activity` VALUES (415, 1, 'Masuk ke Restore Edit User', '2024-11-13 11:23:10');
INSERT INTO `user_activity` VALUES (416, 1, 'Masuk ke Restore Edit User', '2024-11-13 11:23:14');
INSERT INTO `user_activity` VALUES (417, 1, 'Masuk ke User', '2024-11-13 11:23:16');
INSERT INTO `user_activity` VALUES (418, 1, 'Masuk ke User', '2024-11-13 11:23:30');
INSERT INTO `user_activity` VALUES (419, 1, 'Masuk ke Restore Edit User', '2024-11-13 11:23:32');
INSERT INTO `user_activity` VALUES (420, 1, 'Masuk ke User', '2024-11-13 11:23:34');
INSERT INTO `user_activity` VALUES (421, 1, 'Masuk ke User', '2024-11-13 11:24:10');
INSERT INTO `user_activity` VALUES (422, 1, 'Masuk ke Restore Edit User', '2024-11-13 11:24:11');
INSERT INTO `user_activity` VALUES (423, 1, 'Masuk ke User', '2024-11-13 11:24:13');
INSERT INTO `user_activity` VALUES (424, 1, 'Masuk ke User', '2024-11-13 11:26:11');
INSERT INTO `user_activity` VALUES (425, 1, 'Masuk ke User', '2024-11-13 11:27:23');
INSERT INTO `user_activity` VALUES (426, 1, 'Masuk ke Restore Edit User', '2024-11-13 11:27:23');
INSERT INTO `user_activity` VALUES (427, 1, 'Masuk ke Restore Edit User', '2024-11-13 11:27:23');
INSERT INTO `user_activity` VALUES (428, 1, 'Masuk ke User', '2024-11-13 11:27:25');
INSERT INTO `user_activity` VALUES (429, 1, 'Masuk ke Laporan', '2024-11-13 11:27:51');
INSERT INTO `user_activity` VALUES (430, 1, 'Masuk ke Laporan', '2024-11-13 11:34:32');
INSERT INTO `user_activity` VALUES (431, 1, 'Masuk ke User', '2024-11-13 11:34:34');
INSERT INTO `user_activity` VALUES (432, 1, 'Masuk ke Lelang', '2024-11-13 11:34:34');
INSERT INTO `user_activity` VALUES (433, 1, 'Masuk ke Lelang', '2024-11-13 11:34:40');
INSERT INTO `user_activity` VALUES (434, 1, 'Masuk ke Lelang', '2024-11-13 11:34:56');
INSERT INTO `user_activity` VALUES (435, 1, 'Masuk ke Lelang', '2024-11-13 11:34:59');
INSERT INTO `user_activity` VALUES (436, 1, 'Masuk ke Lelang', '2024-11-13 11:35:03');
INSERT INTO `user_activity` VALUES (437, 1, 'Masuk ke Lelang', '2024-11-13 11:35:15');
INSERT INTO `user_activity` VALUES (438, 1, 'Masuk ke Lelang', '2024-11-13 11:35:19');
INSERT INTO `user_activity` VALUES (439, 1, 'Masuk ke Lelang', '2024-11-13 11:36:58');
INSERT INTO `user_activity` VALUES (440, 1, 'Masuk ke Lelang', '2024-11-13 11:37:49');
INSERT INTO `user_activity` VALUES (441, 1, 'Masuk ke Lelang', '2024-11-13 11:38:11');
INSERT INTO `user_activity` VALUES (442, 1, 'Masuk ke Lelang', '2024-11-13 11:38:16');
INSERT INTO `user_activity` VALUES (443, 1, 'Masuk ke Lelang', '2024-11-13 11:38:24');
INSERT INTO `user_activity` VALUES (444, 1, 'Masuk ke Laporan', '2024-11-13 11:39:23');
INSERT INTO `user_activity` VALUES (445, 1, 'Masuk ke Laporan', '2024-11-13 11:39:23');
INSERT INTO `user_activity` VALUES (446, 1, 'Masuk ke Laporan', '2024-11-13 11:48:41');
INSERT INTO `user_activity` VALUES (447, 1, 'Masuk Ke Window Print', '2024-11-13 11:48:49');
INSERT INTO `user_activity` VALUES (448, 1, 'Masuk Ke Window Print', '2024-11-13 11:49:01');
INSERT INTO `user_activity` VALUES (449, 1, 'Masuk Ke Window Print', '2024-11-13 11:49:04');
INSERT INTO `user_activity` VALUES (450, 1, 'Masuk Ke Window Print', '2024-11-13 11:50:23');
INSERT INTO `user_activity` VALUES (451, 1, 'Masuk Ke Window Print', '2024-11-13 11:50:34');
INSERT INTO `user_activity` VALUES (452, 1, 'Masuk Ke Window Print', '2024-11-13 11:50:55');
INSERT INTO `user_activity` VALUES (453, 1, 'Masuk Ke Window Print', '2024-11-13 11:52:45');
INSERT INTO `user_activity` VALUES (454, 1, 'Masuk ke Laporan', '2024-11-13 11:52:49');
INSERT INTO `user_activity` VALUES (455, 1, 'Masuk ke Laporan', '2024-11-13 11:52:51');
INSERT INTO `user_activity` VALUES (456, 1, 'Masuk ke Laporan', '2024-11-13 11:52:51');
INSERT INTO `user_activity` VALUES (457, 1, 'Masuk Ke Window Print', '2024-11-13 11:52:57');
INSERT INTO `user_activity` VALUES (458, 1, 'Masuk Ke Window Print', '2024-11-13 11:54:27');
INSERT INTO `user_activity` VALUES (459, 1, 'Masuk ke Laporan', '2024-11-13 11:54:30');
INSERT INTO `user_activity` VALUES (460, 1, 'Masuk ke Laporan', '2024-11-13 11:54:31');
INSERT INTO `user_activity` VALUES (461, 1, 'Masuk Ke Window Print', '2024-11-13 11:54:39');
INSERT INTO `user_activity` VALUES (462, 1, 'Masuk Ke Window Print', '2024-11-13 11:57:28');
INSERT INTO `user_activity` VALUES (463, 1, 'Masuk ke Laporan Lelang', '2024-11-13 11:57:30');
INSERT INTO `user_activity` VALUES (464, 1, 'Masuk ke Laporan Lelang', '2024-11-13 11:57:30');
INSERT INTO `user_activity` VALUES (465, 1, 'Masuk Ke Window Print', '2024-11-13 11:57:37');
INSERT INTO `user_activity` VALUES (466, 1, 'Masuk Ke Window Print', '2024-11-13 11:59:53');
INSERT INTO `user_activity` VALUES (467, 1, 'Masuk ke Laporan Lelang', '2024-11-13 12:00:33');
INSERT INTO `user_activity` VALUES (468, 1, 'Masuk ke Dashboard', '2024-11-13 12:00:36');
INSERT INTO `user_activity` VALUES (469, 1, 'Masuk ke Dashboard', '2024-11-13 12:02:00');
INSERT INTO `user_activity` VALUES (470, 1, 'Masuk ke Dashboard', '2024-11-13 12:02:33');
INSERT INTO `user_activity` VALUES (471, 1, 'Masuk ke Dashboard', '2024-11-13 12:02:51');
INSERT INTO `user_activity` VALUES (472, 1, 'Masuk ke Dashboard', '2024-11-13 12:03:50');
INSERT INTO `user_activity` VALUES (473, 1, 'Masuk ke Lelang', '2024-11-13 12:08:21');
INSERT INTO `user_activity` VALUES (474, NULL, 'Masuk ke Login', '2024-11-13 12:10:26');
INSERT INTO `user_activity` VALUES (475, 2, 'Masuk ke Dashboard', '2024-11-13 12:10:46');
INSERT INTO `user_activity` VALUES (476, 2, 'Masuk ke Barang', '2024-11-13 12:11:39');
INSERT INTO `user_activity` VALUES (477, NULL, 'Masuk ke Login', '2024-11-13 12:11:58');
INSERT INTO `user_activity` VALUES (478, 1, 'Masuk ke Dashboard', '2024-11-13 12:15:45');
INSERT INTO `user_activity` VALUES (479, 1, 'Masuk ke Barang', '2024-11-13 12:16:43');
INSERT INTO `user_activity` VALUES (480, 1, 'Masuk ke Barang', '2024-11-13 12:17:14');
INSERT INTO `user_activity` VALUES (481, 1, 'Masuk ke Lelang', '2024-11-13 12:17:31');
INSERT INTO `user_activity` VALUES (482, 1, 'Masuk ke Lelang', '2024-11-13 12:17:47');
INSERT INTO `user_activity` VALUES (483, 1, 'Masuk ke Lelang', '2024-11-13 12:18:11');
INSERT INTO `user_activity` VALUES (484, 1, 'Masuk ke Lelang', '2024-11-13 12:18:33');
INSERT INTO `user_activity` VALUES (485, 1, 'Masuk ke Lelang', '2024-11-13 12:18:45');
INSERT INTO `user_activity` VALUES (486, 1, 'Masuk ke Lelang', '2024-11-13 12:18:49');
INSERT INTO `user_activity` VALUES (487, 1, 'Masuk ke Laporan Lelang', '2024-11-13 12:18:53');
INSERT INTO `user_activity` VALUES (488, 1, 'Masuk Ke Window Print', '2024-11-13 12:19:00');
INSERT INTO `user_activity` VALUES (489, 1, 'Masuk ke Laporan Lelang', '2024-11-13 12:19:22');
INSERT INTO `user_activity` VALUES (490, 1, 'Masuk ke User', '2024-11-13 12:19:24');
INSERT INTO `user_activity` VALUES (491, 1, 'Masuk ke User', '2024-11-13 12:19:34');
INSERT INTO `user_activity` VALUES (492, 1, 'Masuk ke User', '2024-11-13 12:19:43');
INSERT INTO `user_activity` VALUES (493, 1, 'Masuk ke User', '2024-11-13 12:19:55');
INSERT INTO `user_activity` VALUES (494, 1, 'Masuk ke Soft Delete', '2024-11-13 12:19:58');
INSERT INTO `user_activity` VALUES (495, 1, 'Masuk ke User', '2024-11-13 12:20:02');
INSERT INTO `user_activity` VALUES (496, 1, 'Masuk ke Soft Delete', '2024-11-13 12:20:05');
INSERT INTO `user_activity` VALUES (497, 1, 'Masuk ke User', '2024-11-13 12:20:06');
INSERT INTO `user_activity` VALUES (498, 1, 'Masuk ke Restore Edit User', '2024-11-13 12:20:12');
INSERT INTO `user_activity` VALUES (499, 1, 'Masuk ke User', '2024-11-13 12:20:15');
INSERT INTO `user_activity` VALUES (500, 1, 'Masuk ke User', '2024-11-13 12:20:25');
INSERT INTO `user_activity` VALUES (501, 1, 'Masuk ke Restore Edit User', '2024-11-13 12:20:27');
INSERT INTO `user_activity` VALUES (502, 1, 'Masuk ke User', '2024-11-13 12:20:30');
INSERT INTO `user_activity` VALUES (503, 1, 'Masuk ke Restore Edit User', '2024-11-13 12:20:33');
INSERT INTO `user_activity` VALUES (504, 1, 'Masuk ke User', '2024-11-13 12:20:38');
INSERT INTO `user_activity` VALUES (505, 1, 'Masuk ke User', '2024-11-13 12:20:51');
INSERT INTO `user_activity` VALUES (506, 1, 'Masuk ke Restore Edit User', '2024-11-13 12:20:54');
INSERT INTO `user_activity` VALUES (507, 1, 'Masuk ke Restore Edit User', '2024-11-13 12:21:20');
INSERT INTO `user_activity` VALUES (508, 1, 'Masuk ke User', '2024-11-13 12:21:22');
INSERT INTO `user_activity` VALUES (509, 1, 'Masuk ke User', '2024-11-13 12:21:29');
INSERT INTO `user_activity` VALUES (510, 1, 'Masuk ke Restore Edit User', '2024-11-13 12:21:32');
INSERT INTO `user_activity` VALUES (511, 1, 'Masuk ke User', '2024-11-13 12:23:02');
INSERT INTO `user_activity` VALUES (512, 1, 'Masuk ke User', '2024-11-13 12:23:11');
INSERT INTO `user_activity` VALUES (513, 1, 'Masuk ke User', '2024-11-13 12:23:19');
INSERT INTO `user_activity` VALUES (514, 1, 'Masuk ke User', '2024-11-13 12:25:08');
INSERT INTO `user_activity` VALUES (515, 1, 'Masuk ke User', '2024-11-13 12:25:44');
INSERT INTO `user_activity` VALUES (516, 1, 'Masuk ke User', '2024-11-13 12:28:00');
INSERT INTO `user_activity` VALUES (517, 1, 'Masuk ke User', '2024-11-13 12:28:59');
INSERT INTO `user_activity` VALUES (518, 1, 'Masuk ke Restore Edit User', '2024-11-13 12:29:02');
INSERT INTO `user_activity` VALUES (519, 1, 'Masuk ke User', '2024-11-13 12:29:07');
INSERT INTO `user_activity` VALUES (520, 1, 'Masuk ke User', '2024-11-13 12:29:19');
INSERT INTO `user_activity` VALUES (521, 1, 'Masuk ke Restore Edit User', '2024-11-13 12:29:20');
INSERT INTO `user_activity` VALUES (522, 1, 'Masuk ke User', '2024-11-13 12:29:22');
INSERT INTO `user_activity` VALUES (523, 1, 'Masuk ke User', '2024-11-13 12:29:42');
INSERT INTO `user_activity` VALUES (524, 1, 'Masuk ke Restore Edit User', '2024-11-13 12:29:44');
INSERT INTO `user_activity` VALUES (525, 1, 'Masuk ke User', '2024-11-13 12:29:46');
INSERT INTO `user_activity` VALUES (526, 1, 'Masuk ke Log Activity', '2024-11-13 12:29:49');
INSERT INTO `user_activity` VALUES (527, 1, 'Masuk ke Setting', '2024-11-13 12:30:07');
INSERT INTO `user_activity` VALUES (528, 1, 'Masuk ke Setting', '2024-11-13 12:30:22');
INSERT INTO `user_activity` VALUES (529, NULL, 'Masuk ke Login', '2024-11-13 12:30:28');
INSERT INTO `user_activity` VALUES (530, NULL, 'Masuk ke Soft Delete', '2024-11-13 12:32:20');

SET FOREIGN_KEY_CHECKS = 1;
