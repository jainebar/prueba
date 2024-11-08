/*
 Navicat Premium Data Transfer

 Source Server         : localhostMy
 Source Server Type    : MySQL
 Source Server Version : 100509
 Source Host           : localhost:3306
 Source Schema         : prueba

 Target Server Type    : MySQL
 Target Server Version : 100509
 File Encoding         : 65001

 Date: 08/11/2024 14:57:55
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for bodega
-- ----------------------------
DROP TABLE IF EXISTS `bodega`;
CREATE TABLE `bodega`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bodega
-- ----------------------------
INSERT INTO `bodega` VALUES (1, 'bodega 1');
INSERT INTO `bodega` VALUES (2, 'bodega 2');
INSERT INTO `bodega` VALUES (3, 'bodega 3');

-- ----------------------------
-- Table structure for moneda
-- ----------------------------
DROP TABLE IF EXISTS `moneda`;
CREATE TABLE `moneda`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of moneda
-- ----------------------------
INSERT INTO `moneda` VALUES (1, 'dolar');
INSERT INTO `moneda` VALUES (2, 'nuevo sol');
INSERT INTO `moneda` VALUES (3, 'euro');

-- ----------------------------
-- Table structure for producto
-- ----------------------------
DROP TABLE IF EXISTS `producto`;
CREATE TABLE `producto`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `bodega` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `sucursal` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `moneda` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `precio` decimal(10, 2) NULL DEFAULT NULL,
  `material` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `descripcion` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `codigo`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of producto
-- ----------------------------
INSERT INTO `producto` VALUES (5, '456yopi', 'nombre', 'bodega', 'sucursal', 'moneda', 10.00, 'material', 'descripcion');
INSERT INTO `producto` VALUES (6, '001bcp', 'asdasd', 'Bodega1', 'Sucursal 1', 'Soles', NULL, NULL, 'asdas');
INSERT INTO `producto` VALUES (8, 'asd666', 'asd', 'Bodega1', 'Sucursal 1', 'Soles', 23.00, 'Vidrio', 'asd');
INSERT INTO `producto` VALUES (9, '233abc', '123123a', 'Bodega2', 'Sucursal2', 'Euro', 12.00, 'Madera,Vidrio', 'asdad');
INSERT INTO `producto` VALUES (10, 'asdasd1', '2233', 'bodega 1', 'sucursal 2', 'dolar', 21.00, 'Madera,Vidrio', 'asdasdasd');
INSERT INTO `producto` VALUES (16, 'code12312', 'asdad', 'bodega 2', 'sucursal 2', 'dolar', 46.00, 'Madera,Vidrio', 'sadasdad');
INSERT INTO `producto` VALUES (17, 'asdas343', 'asda', 'bodega 1', 'sucursal 3', 'euro', 46.23, NULL, NULL);
INSERT INTO `producto` VALUES (18, 'code666', 'Eduardo', 'bodega 3', 'surcusal 1', 'euro', 66.66, 'Madera,Vidrio', 'sadasdad');
INSERT INTO `producto` VALUES (20, 'code669', 'Jaine', 'bodega 2', 'sucursal 2', 'euro', 66.87, 'Madera,Vidrio', 'asdasd');
INSERT INTO `producto` VALUES (21, 'sdfsdf4545', 'jaasas', 'bodega 1', 'sucursal 3', 'nuevo sol', 456.00, 'Madera,Vidrio', 'dsfdfdfdfggfg');
INSERT INTO `producto` VALUES (22, '5555tttt', 'ffdfr', 'bodega 3', 'surcusal 1', 'dolar', 47.80, 'Vidrio,Textil', 'ppppppppppp');
INSERT INTO `producto` VALUES (23, '5566yyyt', 'asdas', 'bodega 1', 'sucursal 2', 'nuevo sol', 67.80, 'Madera,Vidrio', 'pppppppppppppppppp');

-- ----------------------------
-- Table structure for sucursal
-- ----------------------------
DROP TABLE IF EXISTS `sucursal`;
CREATE TABLE `sucursal`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sucursal
-- ----------------------------
INSERT INTO `sucursal` VALUES (1, 'surcusal 1');
INSERT INTO `sucursal` VALUES (2, 'sucursal 2');
INSERT INTO `sucursal` VALUES (3, 'sucursal 3');

SET FOREIGN_KEY_CHECKS = 1;
