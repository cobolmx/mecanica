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

 Date: 02/09/2018 17:55:37
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
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bitacora_eventos
-- ----------------------------
INSERT INTO `bitacora_eventos` VALUES (1, 'E0001', '::1', 'Inicio de sesion correcta', 'Inicio de sesion', '2018-08-30 21:37:07');
INSERT INTO `bitacora_eventos` VALUES (2, 'E0001', '::1', 'Agrego el rol de Mostrador', 'Agregar rol', '2018-08-30 21:38:13');
INSERT INTO `bitacora_eventos` VALUES (3, 'E0001', '::1', 'Agrego un empleado al sistema: Lucero Margarita Cruz Anaya', 'Agregar empleado', '2018-08-30 22:18:34');
INSERT INTO `bitacora_eventos` VALUES (4, 'E0001', '::1', 'Cierre de sesión', 'Cierre de sesión', '2018-08-30 22:39:12');
INSERT INTO `bitacora_eventos` VALUES (5, 'E0001', '::1', 'Inicio de sesion correcta', 'Inicio de sesion', '2018-08-30 22:39:17');
INSERT INTO `bitacora_eventos` VALUES (6, 'E0001', '::1', 'Cierre de sesión', 'Cierre de sesión', '2018-08-30 22:42:31');
INSERT INTO `bitacora_eventos` VALUES (7, 'E0001', '::1', 'Inicio de sesion correcta', 'Inicio de sesion', '2018-08-30 22:42:36');
INSERT INTO `bitacora_eventos` VALUES (8, 'E0001', '::1', 'Cierre de sesión', 'Cierre de sesión', '2018-08-30 23:00:07');
INSERT INTO `bitacora_eventos` VALUES (9, 'E0001', '::1', 'Inicio de sesion correcta', 'Inicio de sesion', '2018-08-31 20:43:33');
INSERT INTO `bitacora_eventos` VALUES (10, 'E0001', '::1', 'Ocurrio un error al agregar al empleado: Lucero Margarita Cruz Anaya', 'Agregar empleado', '2018-08-31 23:53:49');
INSERT INTO `bitacora_eventos` VALUES (11, 'E0001', '::1', 'Ocurrio un error al agregar al empleado: Lucero Margarita Cruz Anaya', 'Agregar empleado', '2018-08-31 23:54:04');
INSERT INTO `bitacora_eventos` VALUES (12, 'E0001', '::1', 'Agrego un empleado al sistema: Lucero Margarita Cruz Anaya', 'Agregar empleado', '2018-08-31 23:54:52');
INSERT INTO `bitacora_eventos` VALUES (13, 'E0001', '::1', 'Agrego un empleado al sistema: Lucero Margarita Cruz Anaya', 'Agregar empleado', '2018-09-01 00:19:10');
INSERT INTO `bitacora_eventos` VALUES (14, 'E0001', '::1', 'Cierre de sesión', 'Cierre de sesión', '2018-09-01 00:36:39');
INSERT INTO `bitacora_eventos` VALUES (15, 'E0001', '::1', 'Inicio de sesion correcta', 'Inicio de sesion', '2018-09-01 11:22:26');
INSERT INTO `bitacora_eventos` VALUES (16, 'E0001', '::1', 'Cierre de sesión', 'Cierre de sesión', '2018-09-01 14:29:21');
INSERT INTO `bitacora_eventos` VALUES (17, 'E0001', '::1', 'Inicio de sesion correcta', 'Inicio de sesion', '2018-09-01 14:29:45');
INSERT INTO `bitacora_eventos` VALUES (18, 'E0001', '::1', 'Agrego un empleado al sistema: Jose Antonio Martinez Pacheco', 'Agregar empleado', '2018-09-01 17:10:19');
INSERT INTO `bitacora_eventos` VALUES (19, 'E0001', '::1', 'Se actualizo información de: Israel Rodr&iacute;guez S&aacute;nchez con el número de empleado: E0001', 'Agregar empleado', '2018-09-01 18:39:32');
INSERT INTO `bitacora_eventos` VALUES (20, 'E0001', '::1', 'Se actualizo información de: Israel Rodr&iacute;guez S&aacute;nchez con el número de empleado: E0001', 'Agregar empleado', '2018-09-01 18:42:14');
INSERT INTO `bitacora_eventos` VALUES (21, 'E0001', '::1', 'Se actualizo información de: Israel Rodr&iacute;guez S&aacute;nchez con el número de empleado: E0001', 'Agregar empleado', '2018-09-01 18:45:30');
INSERT INTO `bitacora_eventos` VALUES (22, 'E0001', '::1', 'Se actualizo información de: Israel Rodr&iacute;guez S&aacute;nchez con el número de empleado: E0001', 'Agregar empleado', '2018-09-01 18:48:04');
INSERT INTO `bitacora_eventos` VALUES (23, 'E0001', '::1', 'Se actualizo información de: Israel Rodr&iacute;guez S&aacute;nchez con el número de empleado: E0001', 'Agregar empleado', '2018-09-01 19:12:42');
INSERT INTO `bitacora_eventos` VALUES (24, 'E0001', '::1', 'Se actualizo información de: Israel Rodr&iacute;guez S&aacute;nchez con el número de empleado: E0001', 'Agregar empleado', '2018-09-01 19:30:48');
INSERT INTO `bitacora_eventos` VALUES (25, 'E0001', '::1', 'Inicio de sesion correcta', 'Inicio de sesion', '2018-09-02 11:14:11');
INSERT INTO `bitacora_eventos` VALUES (26, 'E0001', '::1', 'Se actualizo información de: Israel Rodr&iacute;guez S&aacute;nchez con el número de empleado: E0001', 'Agregar empleado', '2018-09-02 11:24:08');
INSERT INTO `bitacora_eventos` VALUES (27, 'E0001', '::1', 'Se actualizo información de: Israel Rodríguez Sánchez con el número de empleado: E0001', 'Agregar empleado', '2018-09-02 11:30:31');
INSERT INTO `bitacora_eventos` VALUES (28, 'E0001', '::1', 'Agrego un empleado al sistema: Lucero Margarita Cruz Anaya', 'Agregar empleado', '2018-09-02 11:57:17');
INSERT INTO `bitacora_eventos` VALUES (29, 'E0001', '::1', 'Agrego un empleado al sistema: Lucero Margarita Cruz Anaya', 'Agregar empleado', '2018-09-02 12:06:05');
INSERT INTO `bitacora_eventos` VALUES (30, 'E0001', '::1', 'Agrego un empleado al sistema: Lucero Margarita Cruz Anaya', 'Agregar empleado', '2018-09-02 13:50:14');
INSERT INTO `bitacora_eventos` VALUES (31, 'E0001', '::1', 'Inicio de sesion correcta', 'Inicio de sesion', '2018-09-02 13:53:21');
INSERT INTO `bitacora_eventos` VALUES (32, 'E0001', '::1', 'Agrego un empleado al sistema: Lucero Margarita Cruz Anaya', 'Agregar empleado', '2018-09-02 13:54:51');
INSERT INTO `bitacora_eventos` VALUES (33, 'E0001', '::1', 'Agrego un empleado al sistema: Daniel Ramirez Cruz', 'Agregar empleado', '2018-09-02 13:56:46');
INSERT INTO `bitacora_eventos` VALUES (34, 'E0001', '::1', 'Agrego un empleado al sistema: Daniel Ramirez Cruz', 'Agregar empleado', '2018-09-02 13:58:57');
INSERT INTO `bitacora_eventos` VALUES (35, 'E0001', '::1', 'Agrego un empleado al sistema: Lucero Margarita Cruz Anaya', 'Agregar empleado', '2018-09-02 14:00:40');
INSERT INTO `bitacora_eventos` VALUES (36, 'E0001', '::1', 'Agrego un empleado al sistema: Lucero Margarita Cruz Anaya', 'Agregar empleado', '2018-09-02 14:07:19');
INSERT INTO `bitacora_eventos` VALUES (37, 'E0001', '::1', 'Agrego un empleado al sistema: Lucero Margarita Cruz Anaya', 'Agregar empleado', '2018-09-02 14:12:37');
INSERT INTO `bitacora_eventos` VALUES (38, 'E0001', '::1', 'Agrego un empleado al sistema: Lucero Margarita Cruz Anaya', 'Agregar empleado', '2018-09-02 14:20:39');
INSERT INTO `bitacora_eventos` VALUES (39, 'E0001', '::1', 'Agrego un empleado al sistema: Lucero Margarita Cruz Anaya', 'Agregar empleado', '2018-09-02 14:26:24');
INSERT INTO `bitacora_eventos` VALUES (40, 'E0001', '::1', 'Agrego un empleado al sistema: Lucero Margarita Cruz Anaya', 'Agregar empleado', '2018-09-02 14:30:05');
INSERT INTO `bitacora_eventos` VALUES (41, 'E0001', '::1', 'Cierre de sesión', 'Cierre de sesión', '2018-09-02 14:31:43');
INSERT INTO `bitacora_eventos` VALUES (42, 'E0001', '::1', 'Inicio de sesion correcta', 'Inicio de sesion', '2018-09-02 16:04:21');
INSERT INTO `bitacora_eventos` VALUES (43, 'E0001', '::1', 'Agrego un empleado al sistema: Lucero Margarita Cruz Anaya', 'Agregar empleado', '2018-09-02 16:05:17');
INSERT INTO `bitacora_eventos` VALUES (44, 'E0001', '::1', 'Cierre de sesión', 'Cierre de sesión', '2018-09-02 16:12:19');
INSERT INTO `bitacora_eventos` VALUES (45, 'E0001', '::1', 'Inicio de sesion correcta', 'Inicio de sesion', '2018-09-02 16:12:24');
INSERT INTO `bitacora_eventos` VALUES (46, 'E0001', '::1', 'Cierre de sesión', 'Cierre de sesión', '2018-09-02 16:14:23');
INSERT INTO `bitacora_eventos` VALUES (47, 'E0001', '::1', 'Inicio de sesion correcta', 'Inicio de sesion', '2018-09-02 16:18:07');
INSERT INTO `bitacora_eventos` VALUES (48, 'E0001', '::1', 'Agrego un empleado al sistema: Daniel Ramirez Cruz', 'Agregar empleado', '2018-09-02 17:16:58');
INSERT INTO `bitacora_eventos` VALUES (49, 'E0001', '::1', 'Agrego un empleado al sistema: Lucero Margarita Cruz Anaya', 'Agregar empleado', '2018-09-02 17:28:18');
INSERT INTO `bitacora_eventos` VALUES (50, 'E0001', '::1', 'Agrego un empleado al sistema: Lucero Margarita Cruz Anaya', 'Agregar empleado', '2018-09-02 17:31:57');
INSERT INTO `bitacora_eventos` VALUES (51, 'E0001', '::1', 'Agrego un empleado al sistema: Lucero Margarita Cruz Anaya', 'Agregar empleado', '2018-09-02 17:51:56');

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
  `id` int(4) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT COMMENT 'Identificador unico de empleados',
  `identificador` char(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'identificador para el id',
  `nombre` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Nombre del empleado',
  `paterno` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Apellido Paterno del empleado',
  `materno` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Apellido materno del empleado',
  `correo_electronico` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'Correo electronico del empleado',
  `telefono_casa` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'Teléfono de  casa para contacto del empleado',
  `telefono_emergencia` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'Telefono de contacto para emergencia',
  `telefono_celular` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'Teléfono celular del empleado',
  `fecha_de_registro` datetime(0) NULL DEFAULT NULL COMMENT 'Fecha de registro del empleado',
  `activo` int(11) NULL DEFAULT NULL COMMENT 'Si se encuentra activo en el sistema',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Password encriptado, no se puede desencriptar',
  `salt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Llave alterna para encriptar',
  `tipo_usuario` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'Tipo de usuario de acuerdo a su rol',
  `nombre_sucursal` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'A cual sucursal pertenece',
  `ciudad` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Ciudad de la sucursal',
  `rfc` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'RFC con homoclave',
  `numero_seguro_social` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'Numero de seguro social del empleado',
  `comentarios` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'comentarios al empleado',
  `fecha_de_ingreso` date NULL DEFAULT NULL COMMENT 'Fecha de ingreso',
  `imagen_perfil` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `documento_antidoping` int(11) NULL DEFAULT NULL,
  `documento_antecedentes` int(11) NULL DEFAULT NULL,
  `domicilio` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sucursal` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Nombre de la sucursal',
  `path_antecedentes_penales` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'Path donde se almacena las cartas de antecedentes no penales',
  `path_contratos` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'Path donde se almacena los contratos',
  `path_antidoping` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'Path donde se almacena los antidopings',
  `fecha_expiracion` date NULL DEFAULT NULL COMMENT 'Fecha cuando expira el contrato',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id`, `identificador`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of empleados
-- ----------------------------
INSERT INTO `empleados` VALUES (0001, 'E', 'Israel', 'Rodr&iacute;guez', 'S&aacute;nchez', 'irodrigu@gmail.com', '(664) 404 7203', '(664) 404 7203', '(664) 404 7203', '2018-08-30 21:35:43', 1, '30528f068bcfa2dfafb2f1a6ebcaa28f85ff8e94a79ed52d079c589eb78ed691', '3bba8d155137568', 'Administrador', 'Matriz', 'Tijuana', 'ROSI-770426-S38', 'NSS:11-11-11-1111-1', 'fdafadfa', '2018-08-30', 'images/user.png', 0, 0, 'conocido 1234', 'Matriz', NULL, NULL, NULL, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (1, 'Administrador', 1, '2018-08-27 20:18:40', 'El administrador del sistema');
INSERT INTO `roles` VALUES (2, 'Mostrador', 1, '2018-08-30 21:38:13', 'Empleado de mostrador');

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
