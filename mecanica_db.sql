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

 Date: 06/09/2018 22:59:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of articulos_categoria
-- ----------------------------
INSERT INTO `articulos_categoria` VALUES (1, 'Destornillador', 'Destornillador', 1, '2018-09-06 21:42:03');

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
) ENGINE = InnoDB AUTO_INCREMENT = 116 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `bitacora_eventos` VALUES (52, 'E0001', '::1', 'Inicio de sesion correcta', 'Inicio de sesion', '2018-09-02 19:13:55');
INSERT INTO `bitacora_eventos` VALUES (53, 'E0001', '::1', 'Agrego un empleado al sistema: Lucero Margarita Cruz Anaya', 'Agregar empleado', '2018-09-02 19:20:06');
INSERT INTO `bitacora_eventos` VALUES (54, 'E0001', '::1', 'Agrego un empleado al sistema: Lucero Margarita Cruz Anaya', 'Agregar empleado', '2018-09-02 19:24:12');
INSERT INTO `bitacora_eventos` VALUES (55, 'E0001', '::1', 'Agrego un empleado al sistema: Lucero Margarita Cruz Anaya', 'Agregar empleado', '2018-09-02 20:02:30');
INSERT INTO `bitacora_eventos` VALUES (56, 'E0001', '::1', 'Agrego un empleado al sistema: Lucero Margarita Cruz Anaya', 'Agregar empleado', '2018-09-02 20:29:06');
INSERT INTO `bitacora_eventos` VALUES (57, 'E0001', '::1', 'Se actualizo información de: Israel Rodríguez Sánchez con el número de empleado: E0001', 'Agregar empleado', '2018-09-02 20:42:50');
INSERT INTO `bitacora_eventos` VALUES (58, 'E0001', '::1', 'Inicio de sesion correcta', 'Inicio de sesion', '2018-09-04 20:27:00');
INSERT INTO `bitacora_eventos` VALUES (59, 'E0001', '::1', 'Agrego un empleado al sistema: Lucero Margarita Cruz Anaya', 'Agregar empleado', '2018-09-04 20:28:03');
INSERT INTO `bitacora_eventos` VALUES (60, 'E0001', '::1', 'Se actualizo información de: Lucero Margarita Cruz Anaya con el número de empleado: E0002', 'Agregar empleado', '2018-09-04 23:25:56');
INSERT INTO `bitacora_eventos` VALUES (61, 'E0001', '::1', 'Se actualizo información de: Lucero Margarita Cruz Anaya con el número de empleado: E0002', 'Agregar empleado', '2018-09-04 23:27:23');
INSERT INTO `bitacora_eventos` VALUES (62, 'E0001', '::1', 'Se actualizo información de: Lucero Margarita Cruz Anaya con el número de empleado: E0002', 'Agregar empleado', '2018-09-04 23:29:08');
INSERT INTO `bitacora_eventos` VALUES (63, 'E0001', '::1', 'Se actualizo información de: Lucero Margarita Cruz Anaya con el número de empleado: E0002', 'Agregar empleado', '2018-09-04 23:29:52');
INSERT INTO `bitacora_eventos` VALUES (64, 'E0001', '::1', 'Se actualizo información de: Lucero Margarita Cruz Anaya con el número de empleado: E0002', 'Agregar empleado', '2018-09-04 23:35:33');
INSERT INTO `bitacora_eventos` VALUES (65, 'E0001', '::1', 'Se actualizo información de: Lucero Margarita Cruz Anaya con el número de empleado: E0002', 'Agregar empleado', '2018-09-04 23:38:04');
INSERT INTO `bitacora_eventos` VALUES (66, 'E0001', '::1', 'Se actualizo información de: Lucero Margarita Cruz Anaya con el número de empleado: E0002', 'Agregar empleado', '2018-09-04 23:40:06');
INSERT INTO `bitacora_eventos` VALUES (67, 'E0001', '::1', 'Se actualizo información de: Lucero Margarita Cruz Anaya con el número de empleado: E0002', 'Agregar empleado', '2018-09-04 23:43:05');
INSERT INTO `bitacora_eventos` VALUES (68, 'E0001', '::1', 'Se actualizo información de: Lucero Margarita Cruz Anaya con el número de empleado: E0002', 'Agregar empleado', '2018-09-04 23:43:37');
INSERT INTO `bitacora_eventos` VALUES (69, 'E0001', '::1', 'Se actualizo información de: Lucero Margarita Cruz Anaya con el número de empleado: E0002', 'Agregar empleado', '2018-09-04 23:44:55');
INSERT INTO `bitacora_eventos` VALUES (70, 'E0001', '::1', 'Se actualizo información de: Lucero Margarita Cruz Anaya con el número de empleado: E0002', 'Agregar empleado', '2018-09-04 23:45:39');
INSERT INTO `bitacora_eventos` VALUES (71, 'E0001', '::1', 'Se actualizo información de: Lucero Margarita Cruz Anaya con el número de empleado: E0002', 'Agregar empleado', '2018-09-04 23:46:25');
INSERT INTO `bitacora_eventos` VALUES (72, 'E0001', '::1', 'Se actualizo información de: Lucero Margarita Cruz Anaya con el número de empleado: E0002', 'Agregar empleado', '2018-09-04 23:49:13');
INSERT INTO `bitacora_eventos` VALUES (73, 'E0001', '::1', 'Se actualizo información de: Lucero Margarita Cruz Anaya con el número de empleado: E0002', 'Agregar empleado', '2018-09-04 23:49:36');
INSERT INTO `bitacora_eventos` VALUES (74, 'E0001', '::1', 'Se actualizo información de: Lucero Margarita Cruz Anaya con el número de empleado: E0002', 'Agregar empleado', '2018-09-04 23:52:48');
INSERT INTO `bitacora_eventos` VALUES (75, 'E0001', '::1', 'Se actualizo información de: Lucero Margarita Cruz Anaya con el número de empleado: E0002', 'Agregar empleado', '2018-09-04 23:59:19');
INSERT INTO `bitacora_eventos` VALUES (76, 'E0001', '::1', 'Se actualizo información de: Lucero Margarita Cruz Anaya con el número de empleado: E0002', 'Agregar empleado', '2018-09-05 00:01:56');
INSERT INTO `bitacora_eventos` VALUES (77, 'E0001', '::1', 'Se actualizo información de: Lucero Margarita Cruz Anaya con el número de empleado: E0002', 'Agregar empleado', '2018-09-05 00:02:30');
INSERT INTO `bitacora_eventos` VALUES (78, 'E0001', '::1', 'Se actualizo información de: Lucero Margarita Cruz Anaya con el número de empleado: E0002', 'Agregar empleado', '2018-09-05 00:03:42');
INSERT INTO `bitacora_eventos` VALUES (79, 'E0001', '::1', 'Se actualizo información de: Lucero Margarita Cruz Anaya con el número de empleado: E0002', 'Agregar empleado', '2018-09-05 00:04:25');
INSERT INTO `bitacora_eventos` VALUES (80, 'E0001', '::1', 'Se actualizo información de: Lucero Margarita Cruz Anaya con el número de empleado: E0002', 'Agregar empleado', '2018-09-05 00:05:46');
INSERT INTO `bitacora_eventos` VALUES (81, 'E0001', '::1', 'Se actualizo información de: Lucero Margarita Cruz Anaya con el número de empleado: E0002', 'Agregar empleado', '2018-09-05 00:06:15');
INSERT INTO `bitacora_eventos` VALUES (82, 'E0001', '::1', 'Se actualizo información de: Lucero Margarita Cruz Anaya con el número de empleado: E0002', 'Agregar empleado', '2018-09-05 00:07:29');
INSERT INTO `bitacora_eventos` VALUES (83, 'E0001', '::1', 'Se actualizo información de: Lucero Margarita Cruz Anaya con el número de empleado: E0002', 'Agregar empleado', '2018-09-05 00:08:04');
INSERT INTO `bitacora_eventos` VALUES (84, 'E0001', '::1', 'Se actualizo información de: Lucero Margarita Cruz Anaya con el número de empleado: E0002', 'Agregar empleado', '2018-09-05 00:09:00');
INSERT INTO `bitacora_eventos` VALUES (85, 'E0001', '::1', 'Se actualizo información de: Lucero Margarita Cruz Anaya con el número de empleado: E0002', 'Agregar empleado', '2018-09-05 00:09:13');
INSERT INTO `bitacora_eventos` VALUES (86, 'E0001', '::1', 'Se actualizo información de: Israel Rodríguez Sánchez con el número de empleado: E0001', 'Agregar empleado', '2018-09-05 00:09:57');
INSERT INTO `bitacora_eventos` VALUES (87, 'E0001', '::1', 'Se actualizo información de: Lucero Margarita Cruz Anaya con el número de empleado: E0002', 'Agregar empleado', '2018-09-05 00:10:54');
INSERT INTO `bitacora_eventos` VALUES (88, 'E0001', '::1', 'Se actualizo información de: Lucero Margarita Cruz Anaya con el número de empleado: E0002', 'Agregar empleado', '2018-09-05 00:11:19');
INSERT INTO `bitacora_eventos` VALUES (89, 'E0001', '::1', 'Se actualizo información de: Lucero Margarita Cruz Anaya con el número de empleado: E0002', 'Agregar empleado', '2018-09-05 00:12:00');
INSERT INTO `bitacora_eventos` VALUES (90, 'E0001', '::1', 'Se actualizo información de: Lucero Margarita Cruz Anaya con el número de empleado: E0002', 'Agregar empleado', '2018-09-05 00:12:55');
INSERT INTO `bitacora_eventos` VALUES (91, 'E0001', '::1', 'Se actualizo información de: Lucero Margarita Cruz Anaya con el número de empleado: E0002', 'Agregar empleado', '2018-09-05 00:13:42');
INSERT INTO `bitacora_eventos` VALUES (92, 'E0001', '::1', 'Cierre de sesión', 'Cierre de sesión', '2018-09-05 00:14:07');
INSERT INTO `bitacora_eventos` VALUES (93, 'E0001', '::1', 'Inicio de sesion correcta', 'Inicio de sesion', '2018-09-05 00:14:20');
INSERT INTO `bitacora_eventos` VALUES (94, 'E0001', '::1', 'Se actualizo información de: Lucero Margarita Cruz Anaya con el número de empleado: E0002', 'Agregar empleado', '2018-09-05 00:14:40');
INSERT INTO `bitacora_eventos` VALUES (95, 'E0001', '::1', 'Se actualizo información de: Lucero Margarita Cruz Anaya con el número de empleado: E0002', 'Agregar empleado', '2018-09-05 00:18:24');
INSERT INTO `bitacora_eventos` VALUES (96, 'E0001', '::1', 'Se actualizo información de: Lucero Margarita Cruz Anaya con el número de empleado: E0002', 'Agregar empleado', '2018-09-05 00:19:03');
INSERT INTO `bitacora_eventos` VALUES (97, 'E0001', '::1', 'Se actualizo información de: Lucero Margarita Cruz Anaya con el número de empleado: E0002', 'Agregar empleado', '2018-09-05 00:20:05');
INSERT INTO `bitacora_eventos` VALUES (98, 'E0001', '::1', 'Se actualizo información de: Lucero Margarita Cruz Anaya con el número de empleado: E0002', 'Agregar empleado', '2018-09-05 00:20:28');
INSERT INTO `bitacora_eventos` VALUES (99, 'E0001', '::1', 'Cierre de sesión', 'Cierre de sesión', '2018-09-05 00:21:22');
INSERT INTO `bitacora_eventos` VALUES (100, 'E0001', '::1', 'Inicio de sesion correcta', 'Inicio de sesion', '2018-09-06 20:12:34');
INSERT INTO `bitacora_eventos` VALUES (101, 'E0001', '::1', 'Agrego un empleado al sistema: Lucero Margarita Cruz Anaya', 'Agregar empleado', '2018-09-06 20:13:38');
INSERT INTO `bitacora_eventos` VALUES (102, 'E0001', '::1', 'Cierre de sesión', 'Cierre de sesión', '2018-09-06 20:13:52');
INSERT INTO `bitacora_eventos` VALUES (103, 'E0002', '::1', 'Inicio de sesion correcta', 'Inicio de sesion', '2018-09-06 20:13:57');
INSERT INTO `bitacora_eventos` VALUES (104, 'E0002', '::1', 'Lucero Margarita Cruz Anaya acabas de actualizar tu contraseña', 'Actualizar contraseña', '2018-09-06 20:14:12');
INSERT INTO `bitacora_eventos` VALUES (105, 'E0002', '::1', 'Cierre de sesión', 'Cierre de sesión', '2018-09-06 20:14:15');
INSERT INTO `bitacora_eventos` VALUES (106, 'E0002', '::1', 'Inicio de sesion correcta', 'Inicio de sesion', '2018-09-06 20:14:20');
INSERT INTO `bitacora_eventos` VALUES (107, 'E0002', '::1', 'Cierre de sesión', 'Cierre de sesión', '2018-09-06 20:14:24');
INSERT INTO `bitacora_eventos` VALUES (108, 'E0001', '::1', 'Inicio de sesion correcta', 'Inicio de sesion', '2018-09-06 20:14:29');
INSERT INTO `bitacora_eventos` VALUES (109, 'E0001', '192.168.0.5', 'Inicio de sesion correcta', 'Inicio de sesion', '2018-09-06 21:07:50');
INSERT INTO `bitacora_eventos` VALUES (110, 'E0001', '192.168.0.5', 'Inicio de sesion correcta', 'Inicio de sesion', '2018-09-06 21:12:31');
INSERT INTO `bitacora_eventos` VALUES (111, 'E0001', '192.168.0.5', 'Cierre de sesión', 'Cierre de sesión', '2018-09-06 21:13:13');
INSERT INTO `bitacora_eventos` VALUES (112, 'E0001', '192.168.0.5', 'Inicio de sesion correcta', 'Inicio de sesion', '2018-09-06 21:13:18');
INSERT INTO `bitacora_eventos` VALUES (113, 'E0001', '::1', 'agregar-categoria-error', 'agregar-categoria-error', '2018-09-06 21:41:28');
INSERT INTO `bitacora_eventos` VALUES (114, 'E0001', '::1', 'agregar-categoria', 'agregar-categoria', '2018-09-06 21:42:03');
INSERT INTO `bitacora_eventos` VALUES (115, 'E0001', '::1', 'Cierre de sesión', 'Cierre de sesión', '2018-09-06 22:58:56');

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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of empleados
-- ----------------------------
INSERT INTO `empleados` VALUES (0001, 'E', 'Israel', 'Rodr&iacute;guez', 'S&aacute;nchez', 'irodrigu@gmail.com', '(664) 404 7203', '(664) 404 7203', '(664) 404 7203', '2018-08-30 21:35:43', 1, '30528f068bcfa2dfafb2f1a6ebcaa28f85ff8e94a79ed52d079c589eb78ed691', '3bba8d155137568', 'Administrador', 'Matriz', 'Tijuana', 'ROSI-770426-S38', 'NSS:11-11-11-1111-1', 'fdafadfa2233', '2018-08-30', 'images/user.png', 0, 1, 'conocido 1234', 'Matriz', '', NULL, NULL, '2019-08-30');
INSERT INTO `empleados` VALUES (0002, 'E', 'Lucero Margarita', 'Cruz', 'Anaya', 'lucero.cruz.anaya@gmail.com', '(465) 465 4654', '(654) 654 6546', '(654) 654 6546', '2018-09-06 20:13:38', 1, 'b9428ef4f7adf4bf1f04eb8834d525a1e8c23b8848a321f7e26a278a343ce144', '2d28b7f351e06608', 'Mostrador', NULL, 'Tijuana', 'FDSA-564654-654', 'NSS:32-13-21-6546-5', 'ffadfadf', '2018-09-06', 'images/user.png', 1, 1, 'conocido 1234', 'Sucursal', 'documentos/antecedentes_no_penales/E0002/antecedentes_penales.pdf', 'documentos/contrato/E0002', 'documentos/antidoping/E0002/anti_doping.pdf', '2019-09-06');

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
