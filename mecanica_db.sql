/*
 Navicat Premium Data Transfer

 Source Server         : hal-9000
 Source Server Type    : MariaDB
 Source Server Version : 100310
 Source Host           : localhost:3306
 Source Schema         : mecanica_db

 Target Server Type    : MariaDB
 Target Server Version : 100310
 File Encoding         : 65001

 Date: 08/10/2018 22:21:54
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
  `numero_serie` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'Numero de serie del articulo',
  `comentarios` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'caja de comentarios',
  `fecha_registro` datetime(0) NULL DEFAULT NULL COMMENT 'Fecha de registro',
  `disponible` int(11) NULL DEFAULT NULL COMMENT 'si esta disponible 1 = si, 0 = no',
  `activo` int(11) NULL DEFAULT NULL COMMENT 'Activo 1 = si, 0= no',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of articulos
-- ----------------------------
INSERT INTO `articulos` VALUES (0001, 'A', 1, 1, 1, '123456', 'mexicali', '2018-09-11 20:44:46', 1, 1);
INSERT INTO `articulos` VALUES (0002, 'A', 3, 2, 2, '963741', '', '2018-09-14 20:28:04', 1, 1);
INSERT INTO `articulos` VALUES (0003, 'A', 4, 3, 2, '3322132131', '', '2018-09-14 20:32:16', 1, 1);
INSERT INTO `articulos` VALUES (0004, 'A', 1, 1, 1, '987654', 'este es nuevo', '2018-10-08 21:23:38', 1, 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of articulos_categoria
-- ----------------------------
INSERT INTO `articulos_categoria` VALUES (1, 'Perifericos', 'Perifericos equipo de computo', 1, '2018-09-11 20:13:50');
INSERT INTO `articulos_categoria` VALUES (2, 'Teclados', 'Teclados para computadoras', 1, '2018-09-14 20:22:59');
INSERT INTO `articulos_categoria` VALUES (3, 'Monitores', 'Monitores para computadoras', 1, '2018-09-16 10:47:03');

-- ----------------------------
-- Table structure for articulos_empleado
-- ----------------------------
DROP TABLE IF EXISTS `articulos_empleado`;
CREATE TABLE `articulos_empleado`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero_empleado` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  `fecha_entrega` datetime(0) NULL DEFAULT NULL,
  `fecha_retorno` datetime(0) NULL DEFAULT NULL,
  `id_articulo` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of articulos_marca
-- ----------------------------
INSERT INTO `articulos_marca` VALUES (1, 'DELL', 'Dell incorporated', '2018-09-11 20:14:07', 1, 1);
INSERT INTO `articulos_marca` VALUES (2, 'Logitech', 'marca logitech', '2018-09-14 20:27:21', 1, 2);
INSERT INTO `articulos_marca` VALUES (3, 'Microsoft', 'microsoft', '2018-09-14 20:31:41', 1, 2);

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
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of articulos_modelo
-- ----------------------------
INSERT INTO `articulos_modelo` VALUES (1, 'E-24', 'teclado de alta calidad', '2018-09-11 20:14:57', 1, 1);
INSERT INTO `articulos_modelo` VALUES (2, 'xt-2530', 'fdafa', '2018-09-11 20:21:23', 1, 1);
INSERT INTO `articulos_modelo` VALUES (3, 'g-105', 'teclado mecanico con rgb', '2018-09-14 20:27:46', 1, 2);
INSERT INTO `articulos_modelo` VALUES (4, 'xyz23', 'dfada', '2018-09-14 20:32:00', 1, 3);

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
) ENGINE = InnoDB AUTO_INCREMENT = 137 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `bitacora_eventos` VALUES (25, 'E0001', '::1', 'Cierre de sesión', 'Cierre de sesión', '2018-09-09 19:40:23');
INSERT INTO `bitacora_eventos` VALUES (26, 'E0001', '::1', 'Inicio de sesion correcta', 'Inicio de sesion', '2018-09-11 19:53:38');
INSERT INTO `bitacora_eventos` VALUES (27, 'E0001', '::1', 'Se agrego la categoría: Perifericos por el usuario: Israel Rodríguez Sánchez', 'agregar-categoria', '2018-09-11 20:13:50');
INSERT INTO `bitacora_eventos` VALUES (28, 'E0001', '::1', 'Se agrego el marca: DELL por el usuario: Israel Rodríguez Sánchez', 'agregar-marca', '2018-09-11 20:14:07');
INSERT INTO `bitacora_eventos` VALUES (29, 'E0001', '::1', 'Se agrego el modelo: E-24 por el usuario: Israel Rodríguez Sánchez', 'agregar-modelo', '2018-09-11 20:14:57');
INSERT INTO `bitacora_eventos` VALUES (30, 'E0001', '::1', 'Ocurrio un error al agregar el articulo: Perifericos DELL E-24 con la cantidad de:  por el usuario: Israel Rodríguez Sánchez', 'agregar-articulo-error', '2018-09-11 20:15:22');
INSERT INTO `bitacora_eventos` VALUES (31, 'E0001', '::1', 'Se agrego se agrego el articulo: Perifericos DELL E-24 con la cantidad de:  por el usuario: Israel Rodríguez Sánchez', 'agregar-articulo', '2018-09-11 20:16:08');
INSERT INTO `bitacora_eventos` VALUES (32, 'E0001', '::1', 'Se agrego se agrego el articulo: Perifericos DELL E-24 con la cantidad de:  por el usuario: Israel Rodríguez Sánchez', 'agregar-articulo', '2018-09-11 20:16:27');
INSERT INTO `bitacora_eventos` VALUES (33, 'E0001', '::1', 'Se agrego se agrego el articulo: Perifericos DELL E-24 con la cantidad de:  por el usuario: Israel Rodríguez Sánchez', 'agregar-articulo', '2018-09-11 20:18:41');
INSERT INTO `bitacora_eventos` VALUES (34, 'E0001', '::1', 'Se agrego se agrego el articulo: Perifericos DELL E-24 con la cantidad de:  por el usuario: Israel Rodríguez Sánchez', 'agregar-articulo', '2018-09-11 20:19:07');
INSERT INTO `bitacora_eventos` VALUES (35, 'E0001', '::1', 'Se agrego se agrego el articulo: Perifericos DELL E-24 con la cantidad de:  por el usuario: Israel Rodríguez Sánchez', 'agregar-articulo', '2018-09-11 20:20:01');
INSERT INTO `bitacora_eventos` VALUES (36, 'E0001', '::1', 'Se agrego el modelo: xt-2530 por el usuario: Israel Rodríguez Sánchez', 'agregar-modelo', '2018-09-11 20:21:23');
INSERT INTO `bitacora_eventos` VALUES (37, 'E0001', '::1', 'Se agrego se agrego el articulo: Perifericos DELL xt-2530 con la cantidad de:  por el usuario: Israel Rodríguez Sánchez', 'agregar-articulo', '2018-09-11 20:21:54');
INSERT INTO `bitacora_eventos` VALUES (38, 'E0001', '::1', 'Se agrego se agrego el articulo: Perifericos DELL E-24 con la cantidad de:  por el usuario: Israel Rodríguez Sánchez', 'agregar-articulo', '2018-09-11 20:41:44');
INSERT INTO `bitacora_eventos` VALUES (39, 'E0001', '::1', 'Se agrego se agrego el articulo: Perifericos DELL E-24 con la cantidad de:  por el usuario: Israel Rodríguez Sánchez', 'agregar-articulo', '2018-09-11 20:44:46');
INSERT INTO `bitacora_eventos` VALUES (40, 'E0001', '::1', 'Cierre de sesión', 'Cierre de sesión', '2018-09-11 22:59:48');
INSERT INTO `bitacora_eventos` VALUES (41, 'E0001', '::1', 'Inicio de sesion correcta', 'Inicio de sesion', '2018-09-12 21:00:47');
INSERT INTO `bitacora_eventos` VALUES (42, 'E0001', '::1', 'Cierre de sesión', 'Cierre de sesión', '2018-09-12 21:27:32');
INSERT INTO `bitacora_eventos` VALUES (43, 'E0001', '::1', 'Inicio de sesion correcta', 'Inicio de sesion', '2018-09-14 20:05:24');
INSERT INTO `bitacora_eventos` VALUES (44, 'E0001', '::1', 'Se agrego la categoría: Teclados por el usuario: Israel Rodríguez Sánchez', 'agregar-categoria', '2018-09-14 20:22:59');
INSERT INTO `bitacora_eventos` VALUES (45, 'E0001', '::1', 'Se agrego el marca: Logitech por el usuario: Israel Rodríguez Sánchez', 'agregar-marca', '2018-09-14 20:27:21');
INSERT INTO `bitacora_eventos` VALUES (46, 'E0001', '::1', 'Se agrego el modelo: g-105 por el usuario: Israel Rodríguez Sánchez', 'agregar-modelo', '2018-09-14 20:27:46');
INSERT INTO `bitacora_eventos` VALUES (47, 'E0001', '::1', 'Se agrego se agrego el articulo: Teclados Logitech g-105 con la cantidad de:  por el usuario: Israel Rodríguez Sánchez', 'agregar-articulo', '2018-09-14 20:28:04');
INSERT INTO `bitacora_eventos` VALUES (48, 'E0001', '::1', 'Se agrego el marca: Microsoft por el usuario: Israel Rodríguez Sánchez', 'agregar-marca', '2018-09-14 20:31:41');
INSERT INTO `bitacora_eventos` VALUES (49, 'E0001', '::1', 'Se agrego el modelo: xyz23 por el usuario: Israel Rodríguez Sánchez', 'agregar-modelo', '2018-09-14 20:32:00');
INSERT INTO `bitacora_eventos` VALUES (50, 'E0001', '::1', 'Se agrego se agrego el articulo: Teclados Microsoft xyz23 con la cantidad de:  por el usuario: Israel Rodríguez Sánchez', 'agregar-articulo', '2018-09-14 20:32:16');
INSERT INTO `bitacora_eventos` VALUES (51, 'E0001', '::1', 'Inicio de sesion correcta', 'Inicio de sesion', '2018-09-16 10:17:13');
INSERT INTO `bitacora_eventos` VALUES (52, 'E0001', '::1', 'Se agrego la categoría: Monitores por el usuario: Israel Rodríguez Sánchez', 'agregar-categoria', '2018-09-16 10:47:03');
INSERT INTO `bitacora_eventos` VALUES (53, 'E0001', '192.168.0.4', 'Inicio de sesion correcta', 'Inicio de sesion', '2018-09-16 12:48:27');
INSERT INTO `bitacora_eventos` VALUES (54, 'E0001', '192.168.0.4', 'Inicio de sesion correcta', 'Inicio de sesion', '2018-09-16 13:06:52');
INSERT INTO `bitacora_eventos` VALUES (55, 'E0001', '192.168.0.4', 'Inicio de sesion correcta', 'Inicio de sesion', '2018-09-16 13:20:50');
INSERT INTO `bitacora_eventos` VALUES (56, 'E0001', '192.168.0.4', 'Inicio de sesion correcta', 'Inicio de sesion', '2018-09-16 13:22:35');
INSERT INTO `bitacora_eventos` VALUES (57, 'E0001', '::1', 'Israel Rodríguez Sánchez acabas de actualizar una categoria', 'Actualizar categoria', '2018-09-16 14:16:32');
INSERT INTO `bitacora_eventos` VALUES (58, 'E0001', '::1', 'Israel Rodríguez Sánchez acabas de actualizar una categoria', 'Actualizar categoria', '2018-09-16 14:17:15');
INSERT INTO `bitacora_eventos` VALUES (59, 'E0001', '::1', 'Israel Rodríguez Sánchez acabas de actualizar una categoria', 'Actualizar categoria', '2018-09-16 14:20:57');
INSERT INTO `bitacora_eventos` VALUES (60, 'E0001', '::1', 'Israel Rodríguez Sánchez acabas de actualizar una categoria', 'Actualizar categoria', '2018-09-16 14:20:59');
INSERT INTO `bitacora_eventos` VALUES (61, 'E0001', '::1', 'Israel Rodríguez Sánchez acabas de actualizar una categoria', 'Actualizar categoria', '2018-09-16 14:22:11');
INSERT INTO `bitacora_eventos` VALUES (62, 'E0001', '::1', 'Israel Rodríguez Sánchez acabas de actualizar una categoria', 'Actualizar categoria', '2018-09-16 14:22:53');
INSERT INTO `bitacora_eventos` VALUES (63, 'E0001', '::1', 'Israel Rodríguez Sánchez acabas de actualizar una categoria', 'Actualizar categoria', '2018-09-16 14:23:36');
INSERT INTO `bitacora_eventos` VALUES (64, 'E0001', '::1', 'Israel Rodríguez Sánchez acabas de actualizar una categoria', 'Actualizar categoria', '2018-09-16 14:23:44');
INSERT INTO `bitacora_eventos` VALUES (65, 'E0001', '::1', 'Israel Rodríguez Sánchez acabas de actualizar una categoria', 'Actualizar categoria', '2018-09-16 14:24:39');
INSERT INTO `bitacora_eventos` VALUES (66, 'E0001', '::1', 'Israel Rodríguez Sánchez acabas de actualizar una categoria', 'Actualizar categoria', '2018-09-16 14:25:15');
INSERT INTO `bitacora_eventos` VALUES (67, 'E0001', '::1', 'Israel Rodríguez Sánchez acabas de actualizar una categoria', 'Actualizar categoria', '2018-09-16 14:26:47');
INSERT INTO `bitacora_eventos` VALUES (68, 'E0001', '::1', 'Israel Rodríguez Sánchez acabas de actualizar una categoria', 'Actualizar categoria', '2018-09-16 14:27:40');
INSERT INTO `bitacora_eventos` VALUES (69, 'E0001', '::1', 'Israel Rodríguez Sánchez acabas de actualizar una categoria', 'Actualizar categoria', '2018-09-16 14:27:50');
INSERT INTO `bitacora_eventos` VALUES (70, 'E0001', '::1', 'Israel Rodríguez Sánchez acabas de actualizar una categoria', 'Actualizar categoria', '2018-09-16 14:27:58');
INSERT INTO `bitacora_eventos` VALUES (71, 'E0001', '::1', 'Israel Rodríguez Sánchez acabas de actualizar una categoria', 'Actualizar categoria', '2018-09-16 14:28:05');
INSERT INTO `bitacora_eventos` VALUES (72, 'E0001', '::1', 'Israel Rodríguez Sánchez acabas de actualizar una categoria', 'Actualizar categoria', '2018-09-16 14:28:27');
INSERT INTO `bitacora_eventos` VALUES (73, 'E0001', '::1', 'Israel Rodríguez Sánchez acabas de actualizar una categoria', 'Actualizar categoria', '2018-09-16 14:29:30');
INSERT INTO `bitacora_eventos` VALUES (74, 'E0001', '::1', 'Israel Rodríguez Sánchez acabas de actualizar una categoria', 'Actualizar categoria', '2018-09-16 14:29:36');
INSERT INTO `bitacora_eventos` VALUES (75, 'E0001', '::1', 'Cierre de sesión', 'Cierre de sesión', '2018-09-16 19:04:00');
INSERT INTO `bitacora_eventos` VALUES (76, 'E0001', '::1', 'Inicio de sesion correcta', 'Inicio de sesion', '2018-09-19 20:44:24');
INSERT INTO `bitacora_eventos` VALUES (77, 'E0001', '::1', 'Israel Rodríguez Sánchez acabas de actualizar una categoria', 'Actualizar categoria', '2018-09-19 21:44:13');
INSERT INTO `bitacora_eventos` VALUES (78, 'E0001', '::1', 'Israel Rodríguez Sánchez acabas de actualizar una categoria', 'Actualizar categoria', '2018-09-19 21:45:35');
INSERT INTO `bitacora_eventos` VALUES (79, 'E0001', '::1', 'Israel Rodríguez Sánchez acabas de actualizar una categoria', 'Actualizar categoria', '2018-09-19 21:55:49');
INSERT INTO `bitacora_eventos` VALUES (80, 'E0001', '::1', 'Israel Rodríguez Sánchez acabas de actualizar una categoria', 'Actualizar categoria', '2018-09-19 21:55:59');
INSERT INTO `bitacora_eventos` VALUES (81, 'E0001', '::1', 'Israel Rodríguez Sánchez acabas de actualizar una categoria', 'Actualizar categoria', '2018-09-19 21:57:44');
INSERT INTO `bitacora_eventos` VALUES (82, 'E0001', '::1', 'Israel Rodríguez Sánchez acabas de actualizar una categoria', 'Actualizar categoria', '2018-09-19 21:57:56');
INSERT INTO `bitacora_eventos` VALUES (83, 'E0001', '::1', 'Israel Rodríguez Sánchez acabas de actualizar una categoria', 'Actualizar categoria', '2018-09-19 22:01:18');
INSERT INTO `bitacora_eventos` VALUES (84, 'E0001', '::1', 'Israel Rodríguez Sánchez acabas de actualizar una marca', 'Actualizar marca', '2018-09-19 22:24:32');
INSERT INTO `bitacora_eventos` VALUES (85, 'E0001', '::1', 'Israel Rodríguez Sánchez acabas de actualizar una marca', 'Actualizar marca', '2018-09-19 22:24:41');
INSERT INTO `bitacora_eventos` VALUES (86, 'E0001', '::1', 'Israel Rodríguez Sánchez acabas de actualizar una marca', 'Actualizar marca', '2018-09-19 22:24:46');
INSERT INTO `bitacora_eventos` VALUES (87, 'E0001', '::1', 'Israel Rodríguez Sánchez acabas de actualizar una marca', 'Actualizar marca', '2018-09-19 22:24:51');
INSERT INTO `bitacora_eventos` VALUES (88, 'E0001', '::1', 'Cierre de sesión', 'Cierre de sesión', '2018-09-19 22:25:13');
INSERT INTO `bitacora_eventos` VALUES (89, 'E0001', '::1', 'Inicio de sesion fallida, el número de empleado /  contraseña son incorrectos', 'Inicio de sesion', '2018-09-22 08:46:57');
INSERT INTO `bitacora_eventos` VALUES (90, 'E0001', '::1', 'Inicio de sesion correcta', 'Inicio de sesion', '2018-09-22 08:47:03');
INSERT INTO `bitacora_eventos` VALUES (91, 'E0001', '::1', 'Cierre de sesión', 'Cierre de sesión', '2018-09-22 08:51:51');
INSERT INTO `bitacora_eventos` VALUES (92, 'E0001', '::1', 'Inicio de sesion fallida, el número de empleado /  contraseña son incorrectos', 'Inicio de sesion', '2018-09-22 08:51:57');
INSERT INTO `bitacora_eventos` VALUES (93, 'E0001', '::1', 'Inicio de sesion correcta', 'Inicio de sesion', '2018-09-22 08:52:03');
INSERT INTO `bitacora_eventos` VALUES (94, 'E0001', '::1', 'Israel Rodríguez Sánchez acabas de actualizar un modelo', 'Actualizar modelo', '2018-09-22 09:29:36');
INSERT INTO `bitacora_eventos` VALUES (95, 'E0001', '::1', 'Israel Rodríguez Sánchez acabas de actualizar un modelo', 'Actualizar modelo', '2018-09-22 09:30:04');
INSERT INTO `bitacora_eventos` VALUES (96, 'E0001', '::1', 'Israel Rodríguez Sánchez acabas de actualizar un modelo', 'Actualizar modelo', '2018-09-22 09:31:45');
INSERT INTO `bitacora_eventos` VALUES (97, 'E0001', '::1', 'Israel Rodríguez Sánchez acabas de actualizar un modelo', 'Actualizar modelo', '2018-09-22 09:34:46');
INSERT INTO `bitacora_eventos` VALUES (98, 'E0001', '::1', 'Israel Rodríguez Sánchez acabas de actualizar un modelo', 'Actualizar modelo', '2018-09-22 09:36:08');
INSERT INTO `bitacora_eventos` VALUES (99, 'E0001', '::1', 'Israel Rodríguez Sánchez acabas de actualizar un modelo', 'Actualizar modelo', '2018-09-22 09:37:19');
INSERT INTO `bitacora_eventos` VALUES (100, 'E0001', '::1', 'Israel Rodríguez Sánchez acabas de actualizar un modelo', 'Actualizar modelo', '2018-09-22 09:37:33');
INSERT INTO `bitacora_eventos` VALUES (101, 'E0001', '::1', 'Israel Rodríguez Sánchez acabas de actualizar un modelo', 'Actualizar modelo', '2018-09-22 09:39:52');
INSERT INTO `bitacora_eventos` VALUES (102, 'E0001', '::1', 'Israel Rodríguez Sánchez acabas de actualizar un modelo', 'Actualizar modelo', '2018-09-22 09:40:02');
INSERT INTO `bitacora_eventos` VALUES (103, 'E0001', '::1', 'Israel Rodríguez Sánchez acabas de actualizar un modelo', 'Actualizar modelo', '2018-09-22 09:40:11');
INSERT INTO `bitacora_eventos` VALUES (104, 'E0001', '::1', 'Israel Rodríguez Sánchez acabas de actualizar un modelo', 'Actualizar modelo', '2018-09-22 09:46:01');
INSERT INTO `bitacora_eventos` VALUES (105, 'E0001', '::1', 'Cierre de sesión', 'Cierre de sesión', '2018-09-22 09:47:46');
INSERT INTO `bitacora_eventos` VALUES (106, 'E0001', '::1', 'Inicio de sesion correcta', 'Inicio de sesion', '2018-09-22 09:47:58');
INSERT INTO `bitacora_eventos` VALUES (107, 'E0001', '::1', 'Israel Rodríguez Sánchez acabas de actualizar un modelo', 'Actualizar modelo', '2018-09-22 09:48:19');
INSERT INTO `bitacora_eventos` VALUES (108, 'E0001', '::1', 'Israel Rodríguez Sánchez acabas de actualizar un modelo', 'Actualizar modelo', '2018-09-22 09:49:28');
INSERT INTO `bitacora_eventos` VALUES (109, 'E0001', '::1', 'Israel Rodríguez Sánchez acabas de actualizar un modelo', 'Actualizar modelo', '2018-09-22 09:51:16');
INSERT INTO `bitacora_eventos` VALUES (110, 'E0001', '::1', 'Israel Rodríguez Sánchez acabas de actualizar un modelo', 'Actualizar modelo', '2018-09-22 09:52:41');
INSERT INTO `bitacora_eventos` VALUES (111, 'E0001', '::1', 'Israel Rodríguez Sánchez acabas de actualizar un modelo', 'Actualizar modelo', '2018-09-22 09:53:00');
INSERT INTO `bitacora_eventos` VALUES (112, 'E0001', '::1', 'Israel Rodríguez Sánchez acabas de actualizar un modelo', 'Actualizar modelo', '2018-09-22 09:53:25');
INSERT INTO `bitacora_eventos` VALUES (113, 'E0001', '::1', 'Israel Rodríguez Sánchez acabas de actualizar un modelo', 'Actualizar modelo', '2018-09-22 09:53:58');
INSERT INTO `bitacora_eventos` VALUES (114, 'E0001', '::1', 'Israel Rodríguez Sánchez acabas de actualizar un modelo', 'Actualizar modelo', '2018-09-22 09:54:04');
INSERT INTO `bitacora_eventos` VALUES (115, 'E0001', '::1', 'Israel Rodríguez Sánchez acabas de actualizar un modelo', 'Actualizar modelo', '2018-09-22 09:55:02');
INSERT INTO `bitacora_eventos` VALUES (116, 'E0001', '::1', 'Israel Rodríguez Sánchez acabas de actualizar un modelo', 'Actualizar modelo', '2018-09-22 09:55:26');
INSERT INTO `bitacora_eventos` VALUES (117, 'E0001', '::1', 'Israel Rodríguez Sánchez acabas de actualizar un modelo', 'Actualizar modelo', '2018-09-22 10:27:15');
INSERT INTO `bitacora_eventos` VALUES (118, 'E0001', '::1', 'Israel Rodríguez Sánchez acabas de actualizar un modelo', 'Actualizar modelo', '2018-09-22 10:28:21');
INSERT INTO `bitacora_eventos` VALUES (119, 'E0001', '::1', 'Israel Rodríguez Sánchez acabas de actualizar una categoria', 'Actualizar categoria', '2018-09-22 10:28:56');
INSERT INTO `bitacora_eventos` VALUES (120, 'E0001', '::1', 'Israel Rodríguez Sánchez acabas de actualizar una marca', 'Actualizar marca', '2018-09-22 10:29:09');
INSERT INTO `bitacora_eventos` VALUES (121, 'E0001', '::1', 'Israel Rodríguez Sánchez acabas de actualizar una marca', 'Actualizar marca', '2018-09-22 10:29:17');
INSERT INTO `bitacora_eventos` VALUES (122, 'E0001', '::1', 'Israel Rodríguez Sánchez acabas de actualizar un modelo', 'Actualizar modelo', '2018-09-22 10:29:44');
INSERT INTO `bitacora_eventos` VALUES (123, 'E0001', '::1', 'Israel Rodríguez Sánchez acabas de actualizar un modelo', 'Actualizar modelo', '2018-09-22 10:30:24');
INSERT INTO `bitacora_eventos` VALUES (124, 'E0001', '::1', 'Israel Rodríguez Sánchez acabas de actualizar un modelo', 'Actualizar modelo', '2018-09-22 10:30:29');
INSERT INTO `bitacora_eventos` VALUES (125, 'E0001', '::1', 'Inicio de sesion correcta', 'Inicio de sesion', '2018-09-23 15:12:28');
INSERT INTO `bitacora_eventos` VALUES (126, 'E0001', '::1', 'Agrego un empleado al sistema: Lucero Margarita Cruz Anaya', 'Agregar empleado', '2018-09-23 15:55:54');
INSERT INTO `bitacora_eventos` VALUES (127, 'E0001', '::1', 'Agrego un empleado al sistema: Camelia Gonzalez Perez', 'Agregar empleado', '2018-09-23 16:49:46');
INSERT INTO `bitacora_eventos` VALUES (128, 'E0001', '::1', 'Inicio de sesion correcta', 'Inicio de sesion', '2018-10-04 16:20:08');
INSERT INTO `bitacora_eventos` VALUES (129, 'E0001', '::1', 'Cierre de sesión', 'Cierre de sesión', '2018-10-04 20:32:28');
INSERT INTO `bitacora_eventos` VALUES (130, 'E0001', '::1', 'Inicio de sesion fallida, el número de empleado /  contraseña son incorrectos', 'Inicio de sesion', '2018-10-07 20:16:58');
INSERT INTO `bitacora_eventos` VALUES (131, 'E0001', '::1', 'Inicio de sesion fallida, el número de empleado /  contraseña son incorrectos', 'Inicio de sesion', '2018-10-07 20:17:05');
INSERT INTO `bitacora_eventos` VALUES (132, 'E0001', '::1', 'Inicio de sesion correcta', 'Inicio de sesion', '2018-10-07 20:17:22');
INSERT INTO `bitacora_eventos` VALUES (133, 'E0001', '::1', 'Cierre de sesión', 'Cierre de sesión', '2018-10-07 20:18:19');
INSERT INTO `bitacora_eventos` VALUES (134, 'E0001', '::1', 'Inicio de sesion correcta', 'Inicio de sesion', '2018-10-08 21:15:11');
INSERT INTO `bitacora_eventos` VALUES (135, 'E0001', '::1', 'Se agrego se agrego el articulo: Perifericos DELL E-24 con la cantidad de:  por el usuario: Israel Rodríguez Sánchez', 'agregar-articulo', '2018-10-08 21:23:38');
INSERT INTO `bitacora_eventos` VALUES (136, 'E0001', '::1', 'Cierre de sesión', 'Cierre de sesión', '2018-10-08 22:21:01');

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
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of empleados
-- ----------------------------
INSERT INTO `empleados` VALUES (0001, 'E', 'Israel', 'Rodr&iacute;guez', 'S&aacute;nchez', 'irodrigu@gmail.com', '(664) 404 7203', '(664) 404 7203', '(664) 404 7203', '2018-08-30 21:35:43', 1, '30528f068bcfa2dfafb2f1a6ebcaa28f85ff8e94a79ed52d079c589eb78ed691', '3bba8d155137568', 'Administrador', 'Matriz', 'Tijuana', 'ROSI-770426-S38', 'NSS:11-11-11-1111-1', 'fdafadfa2233', '2018-08-30', 'images/user.png', 0, 1, 'conocido 1234', 'Matriz', '', NULL, NULL, '2019-08-30');
INSERT INTO `empleados` VALUES (0002, 'E', 'Lucero Margarita', 'Cruz', 'Anaya', 'lucero.cruz.anaya@gmail.com', '(664) 404 4040', '(654) 654 6546', '(546) 546 5446', '2018-09-23 15:55:53', 1, 'ae39d5b8cf2345f26b789870d263143181e9d8ac3b07bd3511afe32de25bbf34', '51a49db3179f7f38', 'Administrador', NULL, 'Tijuana', 'DFDF-564654-891', 'NSS:65-46-54-9812-3', 'fdfa', '2018-09-23', 'images/user.png', 0, 0, 'conocido', 'Matriz', 'documentos/antecedentes_no_penales/E0002/', 'documentos/contrato/E0002', 'documentos/antidoping/E0002/', '2019-09-23');
INSERT INTO `empleados` VALUES (0003, 'E', 'Camelia', 'Gonzalez', 'Perez', 'cgonzalezp@gmail.com', '(546) 546 5464', '(654) 654 6546', '(654) 654 6546', '2018-09-23 16:49:46', 1, '5cbc2ddfed3d85849109e0049773497490b40abbc6e683b6a5c0aaf50c65313d', '70f21cc341a59ef9', 'Administrador', NULL, 'Tijuana', 'FDAF-521321-121', 'NSS:14-12-24-6465-4', '', '2018-09-23', 'images/user.png', 0, 0, 'dfadfadf', 'Matriz', 'documentos/antecedentes_no_penales/E0003/', 'documentos/contrato/E0003', 'documentos/antidoping/E0003/', '2019-09-23');

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
