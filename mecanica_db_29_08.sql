/*
 Navicat Premium Data Transfer

 Source Server         : hal-9000
 Source Server Type    : MariaDB
 Source Server Version : 100309
 Source Host           : localhost:3306
 Source Schema         : mecanica_db

 Target Server Type    : MariaDB
 Target Server Version : 100309
 File Encoding         : 65001

 Date: 29/08/2018 22:11:10
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for bitacora_eventos
-- ----------------------------
DROP TABLE IF EXISTS `bitacora_eventos`;
CREATE TABLE `bitacora_eventos`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave incremento',
  `numero_empleado` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Llave foranea de tabla empleados',
  `direccion_ip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'Registro de IP',
  `evento` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'Descripcion del evento',
  `tipo_evento` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'Tipo de evento',
  `fecha_hora_registro` datetime(0) NULL DEFAULT NULL COMMENT 'Fecha y hora del registro',
  PRIMARY KEY (`id`, `numero_empleado`) USING BTREE,
  INDEX `numero_empleado`(`numero_empleado`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 64 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bitacora_eventos
-- ----------------------------
INSERT INTO `bitacora_eventos` VALUES (1, 'E0000', '::1', 'Inicio de sesion fallida, el número de empleado /  contraseña son incorrectos', 'Inicio de sesion', '2018-08-24 22:29:38');
INSERT INTO `bitacora_eventos` VALUES (2, 'E0000', '::1', 'Inicio de sesion correcta', 'Inicio de sesion', '2018-08-24 22:30:57');
INSERT INTO `bitacora_eventos` VALUES (3, 'E0000', '::1', 'Bienvenid@ de nuevo: Israel Rodríguez Sánchez', 'Inicio de sesion', '2018-08-24 22:32:10');
INSERT INTO `bitacora_eventos` VALUES (4, 'E0000', '::1', 'Inicio de sesion correcta', 'Inicio de sesion', '2018-08-24 22:33:13');
INSERT INTO `bitacora_eventos` VALUES (5, 'E0000', '::1', 'Inicio de sesion correcta', 'Inicio de sesion', '2018-08-24 22:33:55');
INSERT INTO `bitacora_eventos` VALUES (6, 'E0000', '::1', 'Inicio de sesion correcta', 'Inicio de sesion', '2018-08-24 22:35:31');
INSERT INTO `bitacora_eventos` VALUES (7, 'E0000', '::1', 'Inicio de sesion correcta', 'Inicio de sesion', '2018-08-24 22:36:15');
INSERT INTO `bitacora_eventos` VALUES (8, 'E0000', '::1', 'Inicio de sesion correcta', 'Inicio de sesion', '2018-08-24 22:37:26');
INSERT INTO `bitacora_eventos` VALUES (9, 'E0000', '::1', 'Inicio de sesion correcta', 'Inicio de sesion', '2018-08-24 22:42:02');
INSERT INTO `bitacora_eventos` VALUES (10, 'E0000', '::1', 'Inicio de sesion correcta', 'Inicio de sesion', '2018-08-24 22:42:55');
INSERT INTO `bitacora_eventos` VALUES (11, 'E0000', '::1', 'Inicio de sesion correcta', 'Inicio de sesion', '2018-08-24 22:43:56');
INSERT INTO `bitacora_eventos` VALUES (12, 'E0000', '::1', 'Inicio de sesion correcta', 'Inicio de sesion', '2018-08-24 22:44:18');
INSERT INTO `bitacora_eventos` VALUES (13, 'E0000', '::1', 'Inicio de sesion correcta', 'Inicio de sesion', '2018-08-24 22:56:37');
INSERT INTO `bitacora_eventos` VALUES (14, 'E0000', '::1', 'Inicio de sesion correcta', 'Inicio de sesion', '2018-08-24 22:56:50');
INSERT INTO `bitacora_eventos` VALUES (15, 'E0000', '::1', 'Cierre de sesión', 'Cierre de sesión', '2018-08-24 23:00:46');
INSERT INTO `bitacora_eventos` VALUES (16, 'E0000', '::1', 'Inicio de sesion correcta', 'Inicio de sesion', '2018-08-24 23:00:54');
INSERT INTO `bitacora_eventos` VALUES (17, 'E0000', '::1', 'Cierre de sesión', 'Cierre de sesión', '2018-08-24 23:00:57');
INSERT INTO `bitacora_eventos` VALUES (18, 'E0000', '::1', 'Inicio de sesion correcta', 'Inicio de sesion', '2018-08-24 23:04:04');
INSERT INTO `bitacora_eventos` VALUES (19, 'E0000', '::1', 'Cierre de sesión', 'Cierre de sesión', '2018-08-24 23:06:36');
INSERT INTO `bitacora_eventos` VALUES (20, 'E0000', '::1', 'Inicio de sesion fallida, el número de empleado /  contraseña son incorrectos', 'Inicio de sesion', '2018-08-24 23:07:10');
INSERT INTO `bitacora_eventos` VALUES (21, 'E0000', '::1', 'Inicio de sesion correcta', 'Inicio de sesion', '2018-08-24 23:08:15');
INSERT INTO `bitacora_eventos` VALUES (22, 'E0000', '::1', 'Cierre de sesión', 'Cierre de sesión', '2018-08-24 23:08:44');
INSERT INTO `bitacora_eventos` VALUES (23, 'E0000', '::1', 'Inicio de sesion correcta', 'Inicio de sesion', '2018-08-24 23:09:16');
INSERT INTO `bitacora_eventos` VALUES (24, 'E0000', '::1', 'Cierre de sesión', 'Cierre de sesión', '2018-08-24 23:16:21');
INSERT INTO `bitacora_eventos` VALUES (25, 'E0000', '::1', 'Inicio de sesion correcta', 'Inicio de sesion', '2018-08-24 23:16:33');
INSERT INTO `bitacora_eventos` VALUES (26, 'E0000', '::1', 'Cierre de sesión', 'Cierre de sesión', '2018-08-24 23:18:10');
INSERT INTO `bitacora_eventos` VALUES (27, 'E0000', '::1', 'Inicio de sesion correcta', 'Inicio de sesion', '2018-08-24 23:18:15');
INSERT INTO `bitacora_eventos` VALUES (28, 'E0000', '::1', 'Cierre de sesión', 'Cierre de sesión', '2018-08-24 23:29:02');
INSERT INTO `bitacora_eventos` VALUES (29, 'E0000', '::1', 'Inicio de sesion correcta', 'Inicio de sesion', '2018-08-25 14:35:46');
INSERT INTO `bitacora_eventos` VALUES (30, 'E0000', '::1', 'Cierre de sesión', 'Cierre de sesión', '2018-08-25 14:42:17');
INSERT INTO `bitacora_eventos` VALUES (31, 'E0000', '::1', 'Inicio de sesion correcta', 'Inicio de sesion', '2018-08-25 14:44:27');
INSERT INTO `bitacora_eventos` VALUES (32, 'E0000', '::1', 'Cierre de sesión', 'Cierre de sesión', '2018-08-25 14:53:05');
INSERT INTO `bitacora_eventos` VALUES (33, 'E0000', '::1', 'Inicio de sesion correcta', 'Inicio de sesion', '2018-08-25 14:53:09');
INSERT INTO `bitacora_eventos` VALUES (34, 'E0000', '::1', 'Inicio de sesion correcta', 'Inicio de sesion', '2018-08-25 16:35:10');
INSERT INTO `bitacora_eventos` VALUES (35, 'E0000', '::1', 'Cierre de sesión', 'Cierre de sesión', '2018-08-25 16:36:18');
INSERT INTO `bitacora_eventos` VALUES (36, 'E0000', '::1', 'Inicio de sesion correcta', 'Inicio de sesion', '2018-08-25 16:51:58');
INSERT INTO `bitacora_eventos` VALUES (37, 'E0000', '::1', 'Cierre de sesión', 'Cierre de sesión', '2018-08-25 17:25:43');
INSERT INTO `bitacora_eventos` VALUES (38, 'E0000', '::1', 'Inicio de sesion fallida, el número de empleado /  contraseña son incorrectos', 'Inicio de sesion', '2018-08-25 17:25:52');
INSERT INTO `bitacora_eventos` VALUES (39, 'E0000', '::1', 'Inicio de sesion fallida, el número de empleado /  contraseña son incorrectos', 'Inicio de sesion', '2018-08-25 17:26:04');
INSERT INTO `bitacora_eventos` VALUES (40, 'E0000', '::1', 'Inicio de sesion fallida, el número de empleado /  contraseña son incorrectos', 'Inicio de sesion', '2018-08-25 17:27:36');
INSERT INTO `bitacora_eventos` VALUES (41, '', '::1', 'Inicio de sesion fallida, el número de empleado /  contraseña son incorrectos', 'Inicio de sesion', '2018-08-25 17:27:41');
INSERT INTO `bitacora_eventos` VALUES (42, 'E0000', '::1', 'Inicio de sesion correcta', 'Inicio de sesion', '2018-08-25 17:28:22');
INSERT INTO `bitacora_eventos` VALUES (43, 'E0000', '::1', 'Cierre de sesión', 'Cierre de sesión', '2018-08-25 17:30:29');
INSERT INTO `bitacora_eventos` VALUES (44, 'E0000', '::1', 'Inicio de sesion correcta', 'Inicio de sesion', '2018-08-25 17:32:59');
INSERT INTO `bitacora_eventos` VALUES (45, 'E0000', '::1', 'Cierre de sesión', 'Cierre de sesión', '2018-08-25 17:40:08');
INSERT INTO `bitacora_eventos` VALUES (46, 'E0000', '::1', 'Inicio de sesion correcta', 'Inicio de sesion', '2018-08-25 17:40:14');
INSERT INTO `bitacora_eventos` VALUES (47, 'E0000', '::1', 'Inicio de sesion correcta', 'Inicio de sesion', '2018-08-25 22:09:30');
INSERT INTO `bitacora_eventos` VALUES (48, 'E0000', '::1', 'Cierre de sesión', 'Cierre de sesión', '2018-08-25 23:05:15');
INSERT INTO `bitacora_eventos` VALUES (49, 'E0000', '::1', 'Inicio de sesion correcta', 'Inicio de sesion', '2018-08-25 23:45:24');
INSERT INTO `bitacora_eventos` VALUES (50, 'E0000', '::1', 'Inicio de sesion fallida, el número de empleado /  contraseña son incorrectos', 'Inicio de sesion', '2018-08-26 18:16:13');
INSERT INTO `bitacora_eventos` VALUES (51, 'E0000', '::1', 'Inicio de sesion fallida, el número de empleado /  contraseña son incorrectos', 'Inicio de sesion', '2018-08-26 18:16:28');
INSERT INTO `bitacora_eventos` VALUES (52, 'E0000', '::1', 'Inicio de sesion fallida, el número de empleado /  contraseña son incorrectos', 'Inicio de sesion', '2018-08-26 18:16:36');
INSERT INTO `bitacora_eventos` VALUES (53, 'E0000', '::1', 'Inicio de sesion correcta', 'Inicio de sesion', '2018-08-26 18:16:42');
INSERT INTO `bitacora_eventos` VALUES (54, 'E0000', '::1', 'Cierre de sesión', 'Cierre de sesión', '2018-08-26 21:56:44');
INSERT INTO `bitacora_eventos` VALUES (55, 'E0000', '::1', 'Inicio de sesion correcta', 'Inicio de sesion', '2018-08-27 20:18:12');
INSERT INTO `bitacora_eventos` VALUES (56, 'E0000', '::1', 'Agrego el rol de Administrador', 'Agregar rol', '2018-08-27 20:18:41');
INSERT INTO `bitacora_eventos` VALUES (57, 'E0000', '::1', 'Inicio de sesion correcta', 'Inicio de sesion', '2018-08-28 20:39:11');
INSERT INTO `bitacora_eventos` VALUES (58, 'E0000', '::1', 'Cierre de sesión', 'Cierre de sesión', '2018-08-28 22:31:39');
INSERT INTO `bitacora_eventos` VALUES (59, 'E0000', '::1', 'Inicio de sesion correcta', 'Inicio de sesion', '2018-08-28 22:31:52');
INSERT INTO `bitacora_eventos` VALUES (60, 'E0000', '::1', 'Inicio de sesion correcta', 'Inicio de sesion', '2018-08-29 20:46:51');
INSERT INTO `bitacora_eventos` VALUES (61, 'E0000', '::1', 'Inicio de sesion correcta', 'Inicio de sesion', '2018-08-29 20:53:34');
INSERT INTO `bitacora_eventos` VALUES (62, 'E0000', '::1', 'Cierre de sesión', 'Cierre de sesión', '2018-08-29 20:54:19');
INSERT INTO `bitacora_eventos` VALUES (63, 'E0000', '::1', 'Inicio de sesion correcta', 'Inicio de sesion', '2018-08-29 21:04:19');

-- ----------------------------
-- Table structure for carta_antecentes_penales
-- ----------------------------
DROP TABLE IF EXISTS `carta_antecentes_penales`;
CREATE TABLE `carta_antecentes_penales`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id para carta no antecedentes penales',
  `ruta` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'ruta carta antecedentes no penales',
  `id_empleado` int(4) UNSIGNED ZEROFILL NULL DEFAULT NULL COMMENT 'Llave foranea del empleado',
  `fecha_upload` datetime(0) NULL DEFAULT NULL COMMENT 'Fecha de cuando se subio el archivo',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for carta_antidoping
-- ----------------------------
DROP TABLE IF EXISTS `carta_antidoping`;
CREATE TABLE `carta_antidoping`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador para incremento de antidoping',
  `ruta_carta_antidoping` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'Ruta para la carta de antidoping',
  `fecha_upload` datetime(0) NULL DEFAULT NULL COMMENT 'Decha en la que se sube la carta de antidoping',
  `id_empleado` int(4) UNSIGNED ZEROFILL NULL DEFAULT NULL COMMENT 'Id foraneo del empleado',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ciudades
-- ----------------------------
DROP TABLE IF EXISTS `ciudades`;
CREATE TABLE `ciudades`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id incrementable de la ciudad',
  `nombre_ciudad` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'Nombre de la ciudad',
  `activo` int(11) NULL DEFAULT NULL COMMENT 'Si la ciudad esta activa para la creacion de sucursales',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ciudades
-- ----------------------------
INSERT INTO `ciudades` VALUES (1, 'Tijuana', 1);
INSERT INTO `ciudades` VALUES (2, 'Mexicali', 1);
INSERT INTO `ciudades` VALUES (3, 'Rosarito', 1);
INSERT INTO `ciudades` VALUES (4, 'Ensenada', 1);

-- ----------------------------
-- Table structure for empleados
-- ----------------------------
DROP TABLE IF EXISTS `empleados`;
CREATE TABLE `empleados`  (
  `id` int(4) UNSIGNED ZEROFILL NOT NULL COMMENT 'Identificador unico de empleados',
  `identificador` char(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'identificador para el id',
  `nombre` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'Nombre del empleado',
  `paterno` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'Apellido Paterno del empleado',
  `materno` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'Apellido materno del empleado',
  `correo_electronico` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'Correo electronico del empleado',
  `telefono_casa` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'Teléfono de  casa para contacto del empleado',
  `telefono_emergencia` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'Telefono de contacto para emergencia',
  `telefono_celular` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'Teléfono celular del empleado',
  `fecha_de_registro` datetime(0) NULL DEFAULT NULL COMMENT 'Fecha de registro del empleado',
  `activo` int(11) NULL DEFAULT NULL COMMENT 'Si se encuentra activo en el sistema',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'Password encriptado, no se puede desencriptar',
  `salt` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'Llave alterna para encriptar',
  `tipo_usuario` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'Tipo de usuario de acuerdo a su rol',
  `nombre_sucursal` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'A cual sucursal pertenece',
  `ciudad` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'Ciudad de la sucursal',
  `rfc` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'RFC con homoclave',
  `numero_seguro_social` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'Numero de seguro social del empleado',
  `comentarios` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id`, `identificador`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of empleados
-- ----------------------------
INSERT INTO `empleados` VALUES (0000, 'E', 'Israel', 'Rodríguez', 'Sánchez', 'irodrigu@gmail.com', '664-404-4203', NULL, '664-404-7203', '2018-08-19 14:08:24', 1, '30528f068bcfa2dfafb2f1a6ebcaa28f85ff8e94a79ed52d079c589eb78ed691', '3bba8d155137568', 'Administrador', 'Matriz', 'Tijuana', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id incrementable para los roles',
  `nombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'nombre del rol',
  `activo` int(11) NULL DEFAULT NULL COMMENT 'si se encuentra activo el rol',
  `fecha_registro` datetime(0) NULL DEFAULT NULL COMMENT 'Fecha de registro del rol',
  `descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'Descripcion del rol',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (1, 'Administrador', 1, '2018-08-27 20:18:40', 'El administrador del sistema');

-- ----------------------------
-- Table structure for sucursales
-- ----------------------------
DROP TABLE IF EXISTS `sucursales`;
CREATE TABLE `sucursales`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la sucursal',
  `ciudad` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'Nombre del lugar de la sucursal',
  `direccion` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'Direccion de la sucursal',
  `telefono` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'Télefono de la sucursal',
  `fecha_de_registro` datetime(0) NULL DEFAULT NULL COMMENT 'Fecha de registro de la sucursal',
  `activo` int(11) NULL DEFAULT NULL COMMENT 'Activo 1, inactivo 0',
  `nombre_sucursal` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'Nombre de la sucursal',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sucursales
-- ----------------------------
INSERT INTO `sucursales` VALUES (1, 'Tijuana', 'Domicilio conocido', '6644047203', '2018-08-25 16:59:56', 1, 'Matriz');
INSERT INTO `sucursales` VALUES (2, 'Mexicali', 'Domicilio conocido', '123456789', '2018-08-26 21:34:40', 1, 'Sucursal');
INSERT INTO `sucursales` VALUES (3, 'Tijuana', 'Otro domicilio', '8789654654654', '2018-08-26 21:35:12', 1, 'Sucursal');
INSERT INTO `sucursales` VALUES (4, 'Ensenada', 'Calle 4ta', '66412345678', '2018-08-26 21:45:38', 1, 'Benitez');

SET FOREIGN_KEY_CHECKS = 1;
