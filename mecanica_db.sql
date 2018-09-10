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

 Date: 09/09/2018 19:40:17
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for articulos
-- ----------------------------
DROP TABLE IF EXISTS `articulos`;
CREATE TABLE `articulos`  (
  `id` int(4) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT COMMENT 'id incrementable de articulos',
  `identificador` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'identificador del articulo a inventariar',
  `id_modelo` int(11) NULL DEFAULT NULL COMMENT 'id del modelo a inventariar',
  `id_marca` int(11) NULL DEFAULT NULL COMMENT 'id de la marca a inventariar',
  `id_categoria` int(11) NULL DEFAULT NULL COMMENT 'id de la categoria a inventariar',
  `numero_serie` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'Numero de serie del articulo',
  `stock` int(11) NULL DEFAULT NULL COMMENT 'cuantos articulos se van almacenar',
  `comentarios` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'caja de comentarios',
  `fecha_registro` datetime(0) NULL DEFAULT NULL COMMENT 'Fecha de registro',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for articulos_categoria
-- ----------------------------
DROP TABLE IF EXISTS `articulos_categoria`;
CREATE TABLE `articulos_categoria`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id incrementable del articulo',
  `nombre` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'Descripci\'on del articulo',
  `activo` int(11) NULL DEFAULT NULL,
  `fecha_registro` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for articulos_marca
-- ----------------------------
DROP TABLE IF EXISTS `articulos_marca`;
CREATE TABLE `articulos_marca`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Auto incrementable de tabla modelo',
  `nombre` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'Nombre del modelo del articulo',
  `descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'Descripcion del modelo del arituclo',
  `fecha_registro` datetime(0) NULL DEFAULT NULL COMMENT 'Fecha cuando se registro el modelo del articulo',
  `activo` int(11) NULL DEFAULT NULL COMMENT 'Seleccionar si el articulo esta activo',
  `id_categoria` int(11) NULL DEFAULT NULL COMMENT 'Referencia de que categoria pertenece',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for articulos_modelo
-- ----------------------------
DROP TABLE IF EXISTS `articulos_modelo`;
CREATE TABLE `articulos_modelo`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Auto incrementable de tabla modelo',
  `nombre` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'Nombre del modelo del articulo',
  `descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'Descripcion del modelo del arituclo',
  `fecha_registro` datetime(0) NULL DEFAULT NULL COMMENT 'Fecha cuando se registro el modelo del articulo',
  `activo` int(11) NULL DEFAULT NULL COMMENT 'Seleccionar si el articulo esta activo',
  `id_marca` int(11) NULL DEFAULT NULL COMMENT 'Referencia de que modelo pertenece',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bitacora_eventos
-- ----------------------------
INSERT INTO `bitacora_eventos` VALUES (1, 'E0001', '::1', 'Inicio de sesion correcta', 'Inicio de sesion', '2018-09-08 12:16:56');
INSERT INTO `bitacora_eventos` VALUES (2, 'E0001', '::1', 'Se agrego la categoría: Teclados por el usuario: Israel Rodríguez Sánchez', 'agregar-categoria', '2018-09-08 12:17:15');
INSERT INTO `bitacora_eventos` VALUES (3, 'E0001', '::1', 'Se agrego el marca: DELL por el usuario: Israel Rodríguez Sánchez', 'agregar-marca', '2018-09-08 12:18:53');
INSERT INTO `bitacora_eventos` VALUES (4, 'E0001', '::1', 'Cierre de sesión', 'Cierre de sesión', '2018-09-08 12:35:20');
INSERT INTO `bitacora_eventos` VALUES (5, 'E0001', '::1', 'Inicio de sesion correcta', 'Inicio de sesion', '2018-09-08 12:35:32');
INSERT INTO `bitacora_eventos` VALUES (6, 'E0001', '::1', 'Agregar sucursal', 'Agregar sucursal', '2018-09-08 12:37:29');
INSERT INTO `bitacora_eventos` VALUES (7, 'E0001', '::1', 'Se agrego la categoría: Teclado por el usuario: Israel Rodríguez Sánchez', 'agregar-categoria', '2018-09-08 12:40:26');
INSERT INTO `bitacora_eventos` VALUES (8, 'E0001', '::1', 'Se agrego el marca: DELL por el usuario: Israel Rodríguez Sánchez', 'agregar-marca', '2018-09-08 12:40:47');
INSERT INTO `bitacora_eventos` VALUES (9, 'E0001', '::1', 'Cierre de sesión', 'Cierre de sesión', '2018-09-08 17:05:43');
INSERT INTO `bitacora_eventos` VALUES (10, 'E0001', '::1', 'Inicio de sesion correcta', 'Inicio de sesion', '2018-09-08 21:24:45');
INSERT INTO `bitacora_eventos` VALUES (11, 'E0001', '::1', 'Se agrego el modelo: xt-2530 por el usuario: Israel Rodríguez Sánchez', 'agregar-modelo', '2018-09-08 21:28:10');
INSERT INTO `bitacora_eventos` VALUES (12, 'E0001', '::1', 'Cierre de sesión', 'Cierre de sesión', '2018-09-08 21:28:52');
INSERT INTO `bitacora_eventos` VALUES (13, 'E0001', '::1', 'Inicio de sesion correcta', 'Inicio de sesion', '2018-09-09 12:09:12');
INSERT INTO `bitacora_eventos` VALUES (14, 'E0001', '::1', 'Se agrego la categoría: Audifonos por el usuario: Israel Rodríguez Sánchez', 'agregar-categoria', '2018-09-09 12:51:40');
INSERT INTO `bitacora_eventos` VALUES (15, 'E0001', '::1', 'Se agrego el marca: Logitech por el usuario: Israel Rodríguez Sánchez', 'agregar-marca', '2018-09-09 12:53:41');
INSERT INTO `bitacora_eventos` VALUES (16, 'E0001', '::1', 'Se agrego el modelo: G-35 por el usuario: Israel Rodríguez Sánchez', 'agregar-modelo', '2018-09-09 12:54:06');
INSERT INTO `bitacora_eventos` VALUES (17, 'E0001', '::1', 'Ocurrio un error al agregar el articulo:    con la cantidad de: 10 por el usuario: Israel Rodríguez Sánchez', 'agregar-articulo-error', '2018-09-09 14:18:32');
INSERT INTO `bitacora_eventos` VALUES (18, 'E0001', '::1', 'Ocurrio un error al agregar el articulo:    con la cantidad de:  por el usuario: Israel Rodríguez Sánchez', 'agregar-articulo-error', '2018-09-09 14:21:31');
INSERT INTO `bitacora_eventos` VALUES (19, 'E0001', '::1', 'Se agrego se agrego el articulo: Teclado DELL xt-2530 con la cantidad de: 10 por el usuario: Israel Rodríguez Sánchez', 'agregar-articulo', '2018-09-09 14:28:25');
INSERT INTO `bitacora_eventos` VALUES (20, 'E0001', '::1', 'Se agrego se agrego el articulo: Teclado DELL xt-2530 con la cantidad de: 10 por el usuario: Israel Rodríguez Sánchez', 'agregar-articulo', '2018-09-09 14:29:39');
INSERT INTO `bitacora_eventos` VALUES (21, 'E0001', '::1', 'Cierre de sesión', 'Cierre de sesión', '2018-09-09 14:34:16');
INSERT INTO `bitacora_eventos` VALUES (22, 'E0001', '::1', 'Inicio de sesion correcta', 'Inicio de sesion', '2018-09-09 16:52:20');
INSERT INTO `bitacora_eventos` VALUES (23, 'E0001', '::1', 'Inicio de sesion correcta', 'Inicio de sesion', '2018-09-09 19:38:52');
INSERT INTO `bitacora_eventos` VALUES (24, 'E0001', '::1', 'Se agrego se agrego el articulo: Teclado DELL xt-2530 con la cantidad de: 3 por el usuario: Israel Rodríguez Sánchez', 'agregar-articulo', '2018-09-09 19:39:07');

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
INSERT INTO `empleados` VALUES (0001, 'E', 'Israel', 'Rodr&iacute;guez', 'S&aacute;nchez', 'irodrigu@gmail.com', '(664) 404 7203', '(664) 404 7203', '(664) 404 7203', '2018-08-30 21:35:43', 1, '30528f068bcfa2dfafb2f1a6ebcaa28f85ff8e94a79ed52d079c589eb78ed691', '3bba8d155137568', 'Administrador', 'Matriz', 'Tijuana', 'ROSI-770426-S38', 'NSS:11-11-11-1111-1', 'fdafadfa2233', '2018-08-30', 'images/user.png', 0, 1, 'conocido 1234', 'Matriz', '', NULL, NULL, '2019-08-30');

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sucursales
-- ----------------------------
INSERT INTO `sucursales` VALUES (1, 'Tijuana', 'Domicilio Conocido', '(664) 111 1111', '2018-09-08 12:37:29', 1, 'Matriz');

SET FOREIGN_KEY_CHECKS = 1;
