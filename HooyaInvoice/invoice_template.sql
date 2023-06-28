/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.9.26
 Source Server Type    : MySQL
 Source Server Version : 80033
 Source Host           : 192.168.9.26:3306
 Source Schema         : invoice_template

 Target Server Type    : MySQL
 Target Server Version : 80033
 File Encoding         : 65001

 Date: 28/06/2023 16:15:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_admin
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `username` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `password` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '密码',
  `role` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '角色',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '帐号状态（0停用 1正常）',
  `safe` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '加密随机码',
  `login_ip` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_time` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '管理员表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES (1, 'admin', '8b481699893c8b51afe80f68ace3ea57', '[1]', 1, 'yJ2J', '192.168.9.26', '2023-06-16 16:10:20');
INSERT INTO `t_admin` VALUES (2, 'style', '23e19f06935caac03bd21ee3f0b7b1a9', '[2]', 1, 'Tlew', '192.168.9.26', '2023-06-16 16:02:43');

-- ----------------------------
-- Table structure for t_errorlog
-- ----------------------------
DROP TABLE IF EXISTS `t_errorlog`;
CREATE TABLE `t_errorlog`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `method` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `url` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `params` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `message` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `exception` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 155 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_errorlog
-- ----------------------------
INSERT INTO `t_errorlog` VALUES (9, 'GET', '/InvoiceTemplate/list', '{}', '/ by zero', 'class java.lang.ArithmeticException', '2023-06-14 15:42:33');
INSERT INTO `t_errorlog` VALUES (10, 'GET', '/InvoiceTemplate/list', '{}', '/ by zero', 'class java.lang.ArithmeticException', '2023-06-14 15:43:35');
INSERT INTO `t_errorlog` VALUES (11, 'GET', '/InvoiceTemplate/list', '{}', '/ by zero', 'class java.lang.ArithmeticException', '2023-06-14 15:47:37');
INSERT INTO `t_errorlog` VALUES (12, 'GET', '/InvoiceTemplate/list', '{}', '/ by zero', 'class java.lang.ArithmeticException', '2023-06-14 15:48:22');
INSERT INTO `t_errorlog` VALUES (13, 'GET', '/InvoiceTemplate/list', '{}', '/ by zero', 'class java.lang.ArithmeticException', '2023-06-14 15:51:24');
INSERT INTO `t_errorlog` VALUES (14, 'GET', '/InvoiceTemplate/list', '{}', '/ by zero', 'class java.lang.ArithmeticException', '2023-06-14 15:52:35');
INSERT INTO `t_errorlog` VALUES (15, 'GET', '/InvoiceTemplate/list', '{}', '/ by zero', 'class java.lang.ArithmeticException', '2023-06-14 15:58:05');
INSERT INTO `t_errorlog` VALUES (16, 'GET', '/InvoiceTemplate/list', '{}', '/ by zero', 'class java.lang.ArithmeticException', '2023-06-14 15:58:36');
INSERT INTO `t_errorlog` VALUES (17, 'GET', '/InvoiceTemplate/list', '{}', '/ by zero', 'class java.lang.ArithmeticException', '2023-06-14 16:06:10');
INSERT INTO `t_errorlog` VALUES (18, 'GET', '/InvoiceTemplate/list', '{}', '/ by zero', 'class java.lang.ArithmeticException', '2023-06-14 16:07:22');
INSERT INTO `t_errorlog` VALUES (19, 'GET', '/InvoiceTemplate/list', '{}', '/ by zero', 'class java.lang.ArithmeticException', '2023-06-14 16:10:15');
INSERT INTO `t_errorlog` VALUES (20, 'GET', '/InvoiceTemplate/list', '{}', '/ by zero', 'class java.lang.ArithmeticException', '2023-06-14 16:12:14');
INSERT INTO `t_errorlog` VALUES (21, 'GET', '/InvoiceTemplate/list', '{}', '/ by zero', 'class java.lang.ArithmeticException', '2023-06-14 16:15:18');
INSERT INTO `t_errorlog` VALUES (22, 'GET', '/InvoiceTemplate/list', '{}', '/ by zero', 'class java.lang.ArithmeticException', '2023-06-14 16:15:48');
INSERT INTO `t_errorlog` VALUES (23, 'GET', '/log/error', '{}', 'Required String parameter \'startTime\' is not present', 'class org.springframework.web.bind.MissingServletRequestParameterException', '2023-06-14 16:17:50');
INSERT INTO `t_errorlog` VALUES (24, 'GET', '/log/error', '{}', 'Required String parameter \'startTime\' is not present', 'class org.springframework.web.bind.MissingServletRequestParameterException', '2023-06-14 16:17:55');
INSERT INTO `t_errorlog` VALUES (25, 'GET', '/log/error', '{}', 'Required String parameter \'startTime\' is not present', 'class org.springframework.web.bind.MissingServletRequestParameterException', '2023-06-14 16:17:57');
INSERT INTO `t_errorlog` VALUES (26, 'GET', '/log/error', '{}', 'Required String parameter \'startTime\' is not present', 'class org.springframework.web.bind.MissingServletRequestParameterException', '2023-06-14 16:17:59');
INSERT INTO `t_errorlog` VALUES (27, 'GET', '/log/error', '{}', 'Required String parameter \'startTime\' is not present', 'class org.springframework.web.bind.MissingServletRequestParameterException', '2023-06-14 16:18:00');
INSERT INTO `t_errorlog` VALUES (28, 'GET', '/log/error', '{}', 'Required String parameter \'startTime\' is not present', 'class org.springframework.web.bind.MissingServletRequestParameterException', '2023-06-14 16:18:05');
INSERT INTO `t_errorlog` VALUES (29, 'GET', '/log/error', '{}', 'Required String parameter \'startTime\' is not present', 'class org.springframework.web.bind.MissingServletRequestParameterException', '2023-06-14 16:18:53');
INSERT INTO `t_errorlog` VALUES (30, 'GET', '/log/error', '{}', 'Required String parameter \'startTime\' is not present', 'class org.springframework.web.bind.MissingServletRequestParameterException', '2023-06-14 16:18:59');
INSERT INTO `t_errorlog` VALUES (31, 'GET', '/log/error', '{}', 'Required String parameter \'startTime\' is not present', 'class org.springframework.web.bind.MissingServletRequestParameterException', '2023-06-14 16:19:00');
INSERT INTO `t_errorlog` VALUES (32, 'GET', '/log/error', '{}', 'Required String parameter \'startTime\' is not present', 'class org.springframework.web.bind.MissingServletRequestParameterException', '2023-06-14 16:19:02');
INSERT INTO `t_errorlog` VALUES (33, 'GET', '/log/error', '{}', 'Required String parameter \'startTime\' is not present', 'class org.springframework.web.bind.MissingServletRequestParameterException', '2023-06-14 16:19:08');
INSERT INTO `t_errorlog` VALUES (34, 'GET', '/log/error', '{}', 'Required Integer parameter \'page\' is not present', 'class org.springframework.web.bind.MissingServletRequestParameterException', '2023-06-14 16:20:28');
INSERT INTO `t_errorlog` VALUES (35, 'GET', '/log/error', '{}', 'Required Integer parameter \'page\' is not present', 'class org.springframework.web.bind.MissingServletRequestParameterException', '2023-06-14 16:23:13');
INSERT INTO `t_errorlog` VALUES (36, 'GET', '/log/error', '{}', 'Required Integer parameter \'page\' is not present', 'class org.springframework.web.bind.MissingServletRequestParameterException', '2023-06-14 16:23:16');
INSERT INTO `t_errorlog` VALUES (37, 'GET', '/log/error', '{}', 'Required Integer parameter \'page\' is not present', 'class org.springframework.web.bind.MissingServletRequestParameterException', '2023-06-14 16:26:00');
INSERT INTO `t_errorlog` VALUES (38, 'GET', '/log/error', '{}', 'Required Integer parameter \'page\' is not present', 'class org.springframework.web.bind.MissingServletRequestParameterException', '2023-06-14 16:26:12');
INSERT INTO `t_errorlog` VALUES (39, 'GET', '/log/error', '{}', 'Required Integer parameter \'page\' is not present', 'class org.springframework.web.bind.MissingServletRequestParameterException', '2023-06-14 16:26:17');
INSERT INTO `t_errorlog` VALUES (40, 'GET', '/InvoiceTemplate/list', '{}', '/ by zero', 'class java.lang.ArithmeticException', '2023-06-14 16:26:35');
INSERT INTO `t_errorlog` VALUES (41, 'GET', '/InvoiceTemplate/list', '{}', '/ by zero', 'class java.lang.ArithmeticException', '2023-06-14 16:26:36');
INSERT INTO `t_errorlog` VALUES (42, 'GET', '/InvoiceTemplate/list', '{}', '/ by zero', 'class java.lang.ArithmeticException', '2023-06-14 16:26:39');
INSERT INTO `t_errorlog` VALUES (43, 'GET', '/InvoiceTemplate/list', '{}', '/ by zero', 'class java.lang.ArithmeticException', '2023-06-14 16:26:48');
INSERT INTO `t_errorlog` VALUES (44, 'POST', '/InvoiceTemplate/uploadTemplate', '{\"templateName\":[\"test\"],\"country\":[\"test\"],\"dianpu\":[\"test\"],\"path\":[\"D:\\\\Code_Space\\\\FileData\\\\HooyaInvoice\\\\templateDic2\\\\GiantexDE-am_Invoice.docx\"],\"pdfpath\":[\"D:\\\\Code_Space\\\\FileData\\\\HooyaInvoice\\\\templatePdf\\\\GiantexDE-am_Invoice.pdf\"],\"unit\":[\"€\"],\"type\":[\"0\"],\"id\":[\"79\"]}', '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'79\' for key \'t_template.PRIMARY\'\r\n### The error may exist in org/Hooya/mapper/TemplateMapper.java (best guess)\r\n### The error may involve org.Hooya.mapper.TemplateMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO t_template  ( id, template_name, country, dianpu, path, pdfpath, unit, type )  VALUES  ( ?, ?, ?, ?, ?, ?, ?, ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'79\' for key \'t_template.PRIMARY\'\n; Duplicate entry \'79\' for key \'t_template.PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'79\' for key \'t_template.PRIMARY\'', 'class org.springframework.dao.DuplicateKeyException', '2023-06-15 09:59:50');
INSERT INTO `t_errorlog` VALUES (45, 'POST', '/InvoiceTemplate/getTemplateRootPath', '{}', 'Request method \'POST\' not supported', 'class org.springframework.web.HttpRequestMethodNotSupportedException', '2023-06-15 14:41:42');
INSERT INTO `t_errorlog` VALUES (46, 'POST', '/InvoiceTemplate/uploadTemplate', '{\"templateName\":[\"test\"],\"dianpu\":[\"test\"],\"country\":[\"test\"],\"path\":[\"D:\\\\Code_Space\\\\FileData\\\\HooyaInvoice\\\\templateDic2\\\\test.docx\"],\"pdfpath\":[\"D:\\\\Code_Space\\\\FileData\\\\HooyaInvoice\\\\templatePdf\\\\test.pdf\"],\"fileList\":[\"[object Object]\"],\"type\":[\"0\"],\"unit\":[\"€\"],\"id\":[\"82\"]}', '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'82\' for key \'t_template.PRIMARY\'\r\n### The error may exist in org/Hooya/mapper/TemplateMapper.java (best guess)\r\n### The error may involve org.Hooya.mapper.TemplateMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO t_template  ( id, template_name, country, dianpu, path, pdfpath, unit, type )  VALUES  ( ?, ?, ?, ?, ?, ?, ?, ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'82\' for key \'t_template.PRIMARY\'\n; Duplicate entry \'82\' for key \'t_template.PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'82\' for key \'t_template.PRIMARY\'', 'class org.springframework.dao.DuplicateKeyException', '2023-06-15 15:11:14');
INSERT INTO `t_errorlog` VALUES (47, 'POST', '/InvoiceTemplate/uploadTemplate', '{\"templateName\":[\"test\"],\"dianpu\":[\"test\"],\"country\":[\"test\"],\"path\":[\"D:\\\\Code_Space\\\\FileData\\\\HooyaInvoice\\\\templateDic2\\\\test.docxtest.docx\"],\"pdfpath\":[\"D:\\\\Code_Space\\\\FileData\\\\HooyaInvoice\\\\templatePdf\\\\test.pdftest.pdf\"],\"fileList\":[\"[object Object]\"],\"type\":[\"0\"],\"unit\":[\"€\"],\"id\":[\"82\"]}', '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'82\' for key \'t_template.PRIMARY\'\r\n### The error may exist in org/Hooya/mapper/TemplateMapper.java (best guess)\r\n### The error may involve org.Hooya.mapper.TemplateMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO t_template  ( id, template_name, country, dianpu, path, pdfpath, unit, type )  VALUES  ( ?, ?, ?, ?, ?, ?, ?, ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'82\' for key \'t_template.PRIMARY\'\n; Duplicate entry \'82\' for key \'t_template.PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'82\' for key \'t_template.PRIMARY\'', 'class org.springframework.dao.DuplicateKeyException', '2023-06-15 15:12:16');
INSERT INTO `t_errorlog` VALUES (48, 'POST', '/InvoiceTemplate/uploadTemplate', '{\"templateName\":[\"test\"],\"dianpu\":[\"test\"],\"country\":[\"test\"],\"path\":[\"D:\\\\Code_Space\\\\FileData\\\\HooyaInvoice\\\\templateDic2\\\\test.docxtest.docxtest.docx\"],\"pdfpath\":[\"D:\\\\Code_Space\\\\FileData\\\\HooyaInvoice\\\\templatePdf\\\\test.pdftest.pdftest.pdf\"],\"fileList\":[\"[object Object]\"],\"type\":[\"0\"],\"unit\":[\"€\"],\"id\":[\"82\"]}', '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'82\' for key \'t_template.PRIMARY\'\r\n### The error may exist in org/Hooya/mapper/TemplateMapper.java (best guess)\r\n### The error may involve org.Hooya.mapper.TemplateMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO t_template  ( id, template_name, country, dianpu, path, pdfpath, unit, type )  VALUES  ( ?, ?, ?, ?, ?, ?, ?, ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'82\' for key \'t_template.PRIMARY\'\n; Duplicate entry \'82\' for key \'t_template.PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'82\' for key \'t_template.PRIMARY\'', 'class org.springframework.dao.DuplicateKeyException', '2023-06-15 15:14:11');
INSERT INTO `t_errorlog` VALUES (49, 'POST', '/InvoiceTemplate/uploadTemplate', '{\"templateName\":[\"test1\"],\"dianpu\":[\"test1\"],\"country\":[\"test1\"],\"path\":[\"D:\\\\Code_Space\\\\FileData\\\\HooyaInvoice\\\\templateDic2\\\\test1.docx\"],\"pdfpath\":[\"D:\\\\Code_Space\\\\FileData\\\\HooyaInvoice\\\\templatePdf\\\\test1.pdf\"],\"type\":[\"1\"],\"unit\":[\"kr\"]}', 'nested exception is org.apache.ibatis.reflection.ReflectionException: Could not set property \'id\' of \'class org.Hooya.entity.Template\' with value \'1669247165729222658\' Cause: java.lang.IllegalArgumentException: java.lang.ClassCastException@2bb77b49', 'class org.mybatis.spring.MyBatisSystemException', '2023-06-15 15:35:12');
INSERT INTO `t_errorlog` VALUES (50, 'POST', '/InvoiceTemplate/uploadTemplate', '{\"templateName\":[\"test1\"],\"dianpu\":[\"test1\"],\"country\":[\"test1\"],\"path\":[\"D:\\\\Code_Space\\\\FileData\\\\HooyaInvoice\\\\templateDic2\\\\test1.docxtest1.docx\"],\"pdfpath\":[\"D:\\\\Code_Space\\\\FileData\\\\HooyaInvoice\\\\templatePdf\\\\test1.pdftest1.pdf\"],\"type\":[\"1\"],\"unit\":[\"kr\"]}', 'nested exception is org.apache.ibatis.reflection.ReflectionException: Could not set property \'id\' of \'class org.Hooya.entity.Template\' with value \'1669247708316971009\' Cause: java.lang.IllegalArgumentException: java.lang.ClassCastException@43cfe1b', 'class org.mybatis.spring.MyBatisSystemException', '2023-06-15 15:37:21');
INSERT INTO `t_errorlog` VALUES (51, 'POST', '/InvoiceTemplate/uploadTemplate', '{\"templateName\":[\"test1\"],\"dianpu\":[\"test1\"],\"country\":[\"test1\"],\"path\":[\"D:\\\\Code_Space\\\\FileData\\\\HooyaInvoice\\\\templateDic2\\\\test1.docxtest1.docxtest1.docx\"],\"pdfpath\":[\"D:\\\\Code_Space\\\\FileData\\\\HooyaInvoice\\\\templatePdf\\\\test1.pdftest1.pdftest1.pdf\"],\"type\":[\"1\"],\"unit\":[\"kr\"]}', 'nested exception is org.apache.ibatis.reflection.ReflectionException: Could not set property \'id\' of \'class org.Hooya.entity.Template\' with value \'1669248340088205314\' Cause: java.lang.IllegalArgumentException: java.lang.ClassCastException@ad53911', 'class org.mybatis.spring.MyBatisSystemException', '2023-06-15 15:40:11');
INSERT INTO `t_errorlog` VALUES (52, 'POST', '/InvoiceTemplate/uploadTemplate', '{\"templateName\":[\"test1\"],\"dianpu\":[\"test1\"],\"country\":[\"test1\"],\"path\":[\"D:\\\\Code_Space\\\\FileData\\\\HooyaInvoice\\\\templateDic2\\\\test1.docxtest1.docxtest1.docxtest1.docx\"],\"pdfpath\":[\"D:\\\\Code_Space\\\\FileData\\\\HooyaInvoice\\\\templatePdf\\\\test1.pdftest1.pdftest1.pdftest1.pdf\"],\"type\":[\"1\"],\"unit\":[\"kr\"]}', 'nested exception is org.apache.ibatis.reflection.ReflectionException: Could not set property \'id\' of \'class org.Hooya.entity.Template\' with value \'1669249094156955650\' Cause: java.lang.IllegalArgumentException: java.lang.ClassCastException@7332f371', 'class org.mybatis.spring.MyBatisSystemException', '2023-06-15 15:42:52');
INSERT INTO `t_errorlog` VALUES (53, 'POST', '/InvoiceTemplate/uploadTemplate', '{\"templateName\":[\"test1\"],\"dianpu\":[\"test1\"],\"country\":[\"test1\"],\"path\":[\"D:\\\\Code_Space\\\\FileData\\\\HooyaInvoice\\\\templateDic2\\\\test1.docxtest1.docxtest1.docxtest1.docxtest1.docx\"],\"pdfpath\":[\"D:\\\\Code_Space\\\\FileData\\\\HooyaInvoice\\\\templatePdf\\\\test1.pdftest1.pdftest1.pdftest1.pdftest1.pdf\"],\"type\":[\"1\"],\"unit\":[\"kr\"]}', 'nested exception is org.apache.ibatis.reflection.ReflectionException: Could not set property \'id\' of \'class org.Hooya.entity.Template\' with value \'1669249207206031361\' Cause: java.lang.IllegalArgumentException: java.lang.ClassCastException@1fc2ecfc', 'class org.mybatis.spring.MyBatisSystemException', '2023-06-15 15:43:19');
INSERT INTO `t_errorlog` VALUES (54, 'POST', '/InvoiceTemplate/uploadTemplate', '{\"templateName\":[\"test\"],\"dianpu\":[\"test\"],\"country\":[\"test\"],\"path\":[\"D:\\\\Code_Space\\\\FileData\\\\HooyaInvoice\\\\templateDic2\\\\test.docx\"],\"pdfpath\":[\"D:\\\\Code_Space\\\\FileData\\\\HooyaInvoice\\\\templatePdf\\\\test.pdf\"],\"type\":[\"\"],\"unit\":[\"EUR\"]}', 'org.springframework.validation.BeanPropertyBindingResult: 1 errors\nField error in object \'template\' on field \'type\': rejected value []; codes [typeMismatch.template.type,typeMismatch.type,typeMismatch.int,typeMismatch]; arguments [org.springframework.context.support.DefaultMessageSourceResolvable: codes [template.type,type]; arguments []; default message [type]]; default message [Failed to convert property value of type \'java.lang.String\' to required type \'int\' for property \'type\'; nested exception is java.lang.NumberFormatException: For input string: \"\"]', 'class org.springframework.validation.BindException', '2023-06-15 15:44:29');
INSERT INTO `t_errorlog` VALUES (55, 'POST', '/InvoiceTemplate/uploadTemplate', '{\"templateName\":[\"test\"],\"dianpu\":[\"test\"],\"country\":[\"test\"],\"path\":[\"D:\\\\Code_Space\\\\FileData\\\\HooyaInvoice\\\\templateDic2\\\\test.docxtest.docx\"],\"pdfpath\":[\"D:\\\\Code_Space\\\\FileData\\\\HooyaInvoice\\\\templatePdf\\\\test.pdftest.pdf\"],\"type\":[\"1\"],\"unit\":[\"EUR\"]}', 'nested exception is org.apache.ibatis.reflection.ReflectionException: Could not set property \'id\' of \'class org.Hooya.entity.Template\' with value \'1669250299138551809\' Cause: java.lang.IllegalArgumentException: java.lang.ClassCastException@6111d7da', 'class org.mybatis.spring.MyBatisSystemException', '2023-06-15 15:47:39');
INSERT INTO `t_errorlog` VALUES (56, 'GET', '/HooyaInvoice/ExportOrder', '{}', 'Required request body is missing: public void org.Hooya.controller.InvoiceController.ExportSingleOrderBase64(org.Hooya.vo.InvoiceInfomation)', 'class org.springframework.http.converter.HttpMessageNotReadableException', '2023-06-15 17:25:50');
INSERT INTO `t_errorlog` VALUES (57, 'GET', '/HooyaInvoice/ExportOrder', '{}', 'Required request body is missing: public void org.Hooya.controller.InvoiceController.ExportSingleOrderBase64(org.Hooya.vo.InvoiceInfomation)', 'class org.springframework.http.converter.HttpMessageNotReadableException', '2023-06-15 17:25:54');
INSERT INTO `t_errorlog` VALUES (58, 'GET', '/log/error', '{}', 'Required Integer parameter \'page\' is not present', 'class org.springframework.web.bind.MissingServletRequestParameterException', '2023-06-20 16:40:02');
INSERT INTO `t_errorlog` VALUES (59, 'GET', '/log/error', '{\"page\":[\"1\"],\"size\":[\"5\"]}', 'Token无效：30412b3e-3875-4bda-974c-c6d3de895aed', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-20 16:41:06');
INSERT INTO `t_errorlog` VALUES (60, 'GET', '/log/error', '{\"username\":[\"admin\"],\"password\":[\"admin\"]}', 'Invalid bound statement (not found): org.Hooya.mapper.PermissionMapper.getAllPermissions', 'class org.apache.ibatis.binding.BindingException', '2023-06-20 16:42:31');
INSERT INTO `t_errorlog` VALUES (61, 'GET', '/log/error', '{\"username\":[\"admin\"],\"password\":[\"admin\"]}', 'Token无效：6e4dd946-6951-4fd0-a00f-9a2bedebd54a', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-20 16:51:28');
INSERT INTO `t_errorlog` VALUES (62, 'GET', '/error', '{\"username\":[\"admin\"],\"password\":[\"admin\"]}', 'Token无效：6e4dd946-6951-4fd0-a00f-9a2bedebd54a', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-20 16:54:51');
INSERT INTO `t_errorlog` VALUES (63, 'GET', '/log/error', '{\"username\":[\"admin\"],\"password\":[\"admin\"]}', 'Invalid bound statement (not found): org.Hooya.mapper.PermissionMapper.getAllPermissions', 'class org.apache.ibatis.binding.BindingException', '2023-06-20 16:56:23');
INSERT INTO `t_errorlog` VALUES (64, 'GET', '/log/error', '{\"page\":[\"1\"],\"size\":[\"15\"]}', 'Invalid bound statement (not found): org.Hooya.mapper.PermissionMapper.getAllPermissions', 'class org.apache.ibatis.binding.BindingException', '2023-06-20 16:56:41');
INSERT INTO `t_errorlog` VALUES (65, 'GET', '/log/error', '{\"page\":[\"1\"],\"size\":[\"15\"]}', 'Invalid bound statement (not found): org.Hooya.mapper.PermissionMapper.getAllPermissions', 'class org.apache.ibatis.binding.BindingException', '2023-06-20 16:57:46');
INSERT INTO `t_errorlog` VALUES (66, 'GET', '/log/error', '{\"page\":[\"1\"],\"size\":[\"15\"]}', 'Invalid bound statement (not found): org.Hooya.mapper.PermissionMapper.getAllPermissions', 'class org.apache.ibatis.binding.BindingException', '2023-06-20 16:58:12');
INSERT INTO `t_errorlog` VALUES (67, 'GET', '/log/error', '{\"page\":[\"1\"],\"size\":[\"15\"]}', 'Invalid bound statement (not found): org.Hooya.mapper.PermissionMapper.getAllPermissions', 'class org.apache.ibatis.binding.BindingException', '2023-06-20 16:59:14');
INSERT INTO `t_errorlog` VALUES (68, 'GET', '/log/error', '{\"page\":[\"1\"],\"size\":[\"15\"]}', 'Invalid bound statement (not found): org.Hooya.mapper.PermissionMapper.getAllPermissions', 'class org.apache.ibatis.binding.BindingException', '2023-06-20 17:01:10');
INSERT INTO `t_errorlog` VALUES (69, 'GET', '/log/error', '{\"page\":[\"1\"],\"size\":[\"15\"]}', 'Invalid bound statement (not found): org.Hooya.mapper.PermissionMapper.getAllPermissions', 'class org.apache.ibatis.binding.BindingException', '2023-06-20 17:01:39');
INSERT INTO `t_errorlog` VALUES (70, 'GET', '/log/error', '{\"page\":[\"1\"],\"size\":[\"15\"]}', 'Invalid bound statement (not found): org.Hooya.mapper.PermissionMapper.getAllPermissions', 'class org.apache.ibatis.binding.BindingException', '2023-06-20 17:01:45');
INSERT INTO `t_errorlog` VALUES (71, 'POST', '/admin/login', '{\"username\":[\"\"],\"password\":[\"\"]}', 'Login.password: 请输入密码!, Login.username: 请输入账号!', 'class javax.validation.ConstraintViolationException', '2023-06-20 18:13:04');
INSERT INTO `t_errorlog` VALUES (72, 'POST', '/admin/login', '{\"username\":[\"\"],\"password\":[\"\"]}', 'Login.username: 请输入账号!, Login.password: 请输入密码!', 'class javax.validation.ConstraintViolationException', '2023-06-21 09:08:05');
INSERT INTO `t_errorlog` VALUES (73, 'POST', '/admin/login', '{\"username\":[\"\"],\"password\":[\"\"]}', 'Login.username: 请输入账号!, Login.password: 请输入密码!', 'class javax.validation.ConstraintViolationException', '2023-06-21 09:09:09');
INSERT INTO `t_errorlog` VALUES (74, 'POST', '/admin/login', '{\"username\":[\"\"],\"password\":[\"\"]}', 'Login.password: 请输入密码!, Login.username: 请输入账号!', 'class javax.validation.ConstraintViolationException', '2023-06-21 09:16:09');
INSERT INTO `t_errorlog` VALUES (75, 'POST', '/admin/login', '{\"username\":[\"\"],\"password\":[\"\"]}', 'Login.username: 请输入账号!, Login.password: 请输入密码!', 'class javax.validation.ConstraintViolationException', '2023-06-21 09:18:30');
INSERT INTO `t_errorlog` VALUES (76, 'POST', '/admin/login', '{\"username\":[\"\"],\"password\":[\"\"]}', 'Login.password: 请输入密码!, Login.username: 请输入账号!', 'class javax.validation.ConstraintViolationException', '2023-06-21 09:23:54');
INSERT INTO `t_errorlog` VALUES (77, 'POST', '/admin/login', '{\"username\":[\"\"],\"password\":[\"\"]}', 'Login.username: 请输入账号!, Login.password: 请输入密码!', 'class javax.validation.ConstraintViolationException', '2023-06-21 09:25:00');
INSERT INTO `t_errorlog` VALUES (78, 'POST', '/admin/login', '{\"username\":[\"\"],\"password\":[\"\"]}', 'Login.username: 请输入账号!, Login.password: 请输入密码!', 'class javax.validation.ConstraintViolationException', '2023-06-21 09:27:56');
INSERT INTO `t_errorlog` VALUES (79, 'POST', '/admin/login', '{\"username\":[\"\"],\"password\":[\"\"]}', 'Login.username: 请输入账号!, Login.password: 请输入密码!', 'class javax.validation.ConstraintViolationException', '2023-06-21 09:28:03');
INSERT INTO `t_errorlog` VALUES (80, 'POST', '/admin/login', '{\"username\":[\"123\"],\"password\":[\"\"]}', 'Login.password: 请输入密码!', 'class javax.validation.ConstraintViolationException', '2023-06-21 09:28:12');
INSERT INTO `t_errorlog` VALUES (81, 'POST', '/admin/login', '{\"username\":[\"123\"],\"password\":[\"\"]}', 'Login.password: 请输入密码!', 'class javax.validation.ConstraintViolationException', '2023-06-21 09:28:15');
INSERT INTO `t_errorlog` VALUES (82, 'POST', '/admin/login', '{\"username\":[\"123\"],\"password\":[\"\"]}', 'Login.password: 密码长度在6-30, Login.username: 用户名长度在6-30, Login.password: 请输入密码!', 'class javax.validation.ConstraintViolationException', '2023-06-21 09:32:23');
INSERT INTO `t_errorlog` VALUES (83, 'POST', '/admin/login', '{\"username\":[\"123123\"],\"password\":[\"\"]}', 'Login.password: 密码长度在6-30, Login.password: 请输入密码!', 'class javax.validation.ConstraintViolationException', '2023-06-21 09:32:29');
INSERT INTO `t_errorlog` VALUES (84, 'POST', '/admin/login', '{\"username\":[\"123123\"],\"password\":[\"\"]}', 'Login.password: 密码长度在6-30, Login.password: 请输入密码!', 'class javax.validation.ConstraintViolationException', '2023-06-21 09:43:37');
INSERT INTO `t_errorlog` VALUES (85, 'POST', '/admin/login', '{\"username\":[\"123123\"],\"password\":[\"\"]}', 'Login.password: 请输入密码!, Login.password: 密码长度在6-30', 'class javax.validation.ConstraintViolationException', '2023-06-21 09:43:42');
INSERT INTO `t_errorlog` VALUES (86, 'POST', '/admin/login', '{\"username\":[\"123123\"],\"password\":[\"\"]}', 'Login.password: 请输入密码!, Login.password: 密码长度在6-30', 'class javax.validation.ConstraintViolationException', '2023-06-21 09:43:59');
INSERT INTO `t_errorlog` VALUES (87, 'GET', '/log/error', '{\"start\":[\"\"],\"end\":[\"\"],\"page\":[\"1\"],\"size\":[\"15\"]}', 'Token无效：d7ff31b2-6aa7-43c3-ab16-e31dcb3d3152', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-21 11:31:31');
INSERT INTO `t_errorlog` VALUES (88, 'GET', '/log/error', '{\"start\":[\"\"],\"end\":[\"\"],\"page\":[\"1\"],\"size\":[\"15\"]}', 'Token无效：d7ff31b2-6aa7-43c3-ab16-e31dcb3d3152', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-21 11:31:35');
INSERT INTO `t_errorlog` VALUES (89, 'GET', '/InvoiceTemplate/list', '{}', 'Token无效：d7ff31b2-6aa7-43c3-ab16-e31dcb3d3152', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-21 11:31:37');
INSERT INTO `t_errorlog` VALUES (90, 'GET', '/InvoiceTemplate/list', '{}', 'Token无效：d7ff31b2-6aa7-43c3-ab16-e31dcb3d3152', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-21 11:31:40');
INSERT INTO `t_errorlog` VALUES (91, 'GET', '/log/error', '{\"start\":[\"\"],\"end\":[\"\"],\"page\":[\"1\"],\"size\":[\"15\"]}', 'Token无效：d7ff31b2-6aa7-43c3-ab16-e31dcb3d3152', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-21 11:31:40');
INSERT INTO `t_errorlog` VALUES (92, 'GET', '/log/error', '{\"start\":[\"\"],\"end\":[\"\"],\"page\":[\"1\"],\"size\":[\"15\"]}', 'Token无效：d7ff31b2-6aa7-43c3-ab16-e31dcb3d3152', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-21 11:31:42');
INSERT INTO `t_errorlog` VALUES (93, 'GET', '/InvoiceTemplate/list', '{}', 'Token无效：d7ff31b2-6aa7-43c3-ab16-e31dcb3d3152', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-21 11:31:48');
INSERT INTO `t_errorlog` VALUES (94, 'GET', '/InvoiceTemplate/list', '{}', 'Token无效：d7ff31b2-6aa7-43c3-ab16-e31dcb3d3152', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-21 11:31:49');
INSERT INTO `t_errorlog` VALUES (95, 'GET', '/log/error', '{\"start\":[\"\"],\"end\":[\"\"],\"page\":[\"1\"],\"size\":[\"15\"]}', 'Token无效：d7ff31b2-6aa7-43c3-ab16-e31dcb3d3152', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-21 11:31:49');
INSERT INTO `t_errorlog` VALUES (96, 'GET', '/InvoiceTemplate/list', '{}', 'Token无效：d7ff31b2-6aa7-43c3-ab16-e31dcb3d3152', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-21 11:31:50');
INSERT INTO `t_errorlog` VALUES (97, 'GET', '/log/error', '{\"start\":[\"\"],\"end\":[\"\"],\"page\":[\"1\"],\"size\":[\"15\"]}', 'Token无效：d7ff31b2-6aa7-43c3-ab16-e31dcb3d3152', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-21 11:31:51');
INSERT INTO `t_errorlog` VALUES (98, 'GET', '/InvoiceTemplate/list', '{}', 'Token无效：d7ff31b2-6aa7-43c3-ab16-e31dcb3d3152', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-21 11:31:51');
INSERT INTO `t_errorlog` VALUES (99, 'GET', '/log/error', '{\"start\":[\"\"],\"end\":[\"\"],\"page\":[\"1\"],\"size\":[\"15\"]}', 'Token无效：3f56cd74-2441-4811-8664-e104f1b48ecc', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-21 11:37:08');
INSERT INTO `t_errorlog` VALUES (100, 'GET', '/InvoiceTemplate/list', '{}', 'Token无效：1a01f293-b1df-4850-b54c-ac373898163f', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-21 11:40:24');
INSERT INTO `t_errorlog` VALUES (101, 'GET', '/InvoiceTemplate/list', '{}', 'Token无效：1a01f293-b1df-4850-b54c-ac373898163f', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-21 11:41:11');
INSERT INTO `t_errorlog` VALUES (102, 'GET', '/InvoiceTemplate/list', '{}', 'Token无效：1a01f293-b1df-4850-b54c-ac373898163f', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-21 11:41:23');
INSERT INTO `t_errorlog` VALUES (103, 'GET', '/InvoiceTemplate/list', '{}', 'Token无效：1a01f293-b1df-4850-b54c-ac373898163f', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-21 11:42:49');
INSERT INTO `t_errorlog` VALUES (104, 'GET', '/InvoiceTemplate/list', '{}', 'Token无效：1a01f293-b1df-4850-b54c-ac373898163f', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-21 11:42:52');
INSERT INTO `t_errorlog` VALUES (105, 'GET', '/InvoiceTemplate/list', '{}', 'Token无效：1a01f293-b1df-4850-b54c-ac373898163f', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-21 11:45:39');
INSERT INTO `t_errorlog` VALUES (106, 'GET', '/InvoiceTemplate/list', '{}', 'Token无效：1a01f293-b1df-4850-b54c-ac373898163f', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-21 11:45:45');
INSERT INTO `t_errorlog` VALUES (107, 'GET', '/InvoiceTemplate/list', '{}', 'Token无效：1a01f293-b1df-4850-b54c-ac373898163f', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-21 11:45:47');
INSERT INTO `t_errorlog` VALUES (108, 'GET', '/InvoiceTemplate/list', '{}', 'Token无效：67a718c5-4891-469e-8b24-6a73514cf93d', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-21 13:50:19');
INSERT INTO `t_errorlog` VALUES (109, 'GET', '/InvoiceTemplate/list', '{}', 'Token无效：67a718c5-4891-469e-8b24-6a73514cf93d', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-21 13:51:41');
INSERT INTO `t_errorlog` VALUES (110, 'GET', '/InvoiceTemplate/list', '{}', 'Token无效：67a718c5-4891-469e-8b24-6a73514cf93d', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-21 13:51:42');
INSERT INTO `t_errorlog` VALUES (111, 'GET', '/InvoiceTemplate/list', '{}', 'Token无效：67a718c5-4891-469e-8b24-6a73514cf93d', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-21 13:52:59');
INSERT INTO `t_errorlog` VALUES (112, 'GET', '/InvoiceTemplate/list', '{}', 'Token无效：67a718c5-4891-469e-8b24-6a73514cf93d', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-21 13:53:22');
INSERT INTO `t_errorlog` VALUES (113, 'GET', '/InvoiceTemplate/list', '{}', 'Token无效：67a718c5-4891-469e-8b24-6a73514cf93d', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-21 13:53:24');
INSERT INTO `t_errorlog` VALUES (114, 'GET', '/InvoiceTemplate/list', '{}', 'Token无效：67a718c5-4891-469e-8b24-6a73514cf93d', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-21 14:02:10');
INSERT INTO `t_errorlog` VALUES (115, 'GET', '/InvoiceTemplate/list', '{}', 'Token无效：67a718c5-4891-469e-8b24-6a73514cf93d', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-21 14:02:34');
INSERT INTO `t_errorlog` VALUES (116, 'GET', '/InvoiceTemplate/list', '{}', 'Token无效：67a718c5-4891-469e-8b24-6a73514cf93d', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-21 14:02:55');
INSERT INTO `t_errorlog` VALUES (117, 'GET', '/InvoiceTemplate/list', '{}', 'Token无效：2b87fee2-34b6-4446-a832-4888da93c005', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-21 14:27:31');
INSERT INTO `t_errorlog` VALUES (118, 'GET', '/InvoiceTemplate/list', '{}', 'Token无效：2b87fee2-34b6-4446-a832-4888da93c005', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-21 14:27:37');
INSERT INTO `t_errorlog` VALUES (119, 'GET', '/log/error', '{\"start\":[\"\"],\"end\":[\"\"],\"page\":[\"1\"],\"size\":[\"15\"]}', 'Token无效：2b87fee2-34b6-4446-a832-4888da93c005', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-21 14:27:38');
INSERT INTO `t_errorlog` VALUES (120, 'GET', '/InvoiceTemplate/list', '{}', 'Token无效：2b87fee2-34b6-4446-a832-4888da93c005', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-21 14:27:39');
INSERT INTO `t_errorlog` VALUES (121, 'GET', '/InvoiceTemplate/list', '{}', 'Token无效：2b87fee2-34b6-4446-a832-4888da93c005', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-21 14:32:05');
INSERT INTO `t_errorlog` VALUES (122, 'GET', '/log/error', '{\"start\":[\"\"],\"end\":[\"\"],\"page\":[\"1\"],\"size\":[\"15\"]}', 'Token无效：null', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-21 14:32:20');
INSERT INTO `t_errorlog` VALUES (123, 'GET', '/log/error', '{\"start\":[\"\"],\"end\":[\"\"],\"page\":[\"1\"],\"size\":[\"15\"]}', 'Token无效：null', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-21 14:33:12');
INSERT INTO `t_errorlog` VALUES (124, 'GET', '/log/error', '{\"start\":[\"\"],\"end\":[\"\"],\"page\":[\"1\"],\"size\":[\"15\"]}', 'Token无效：null', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-21 14:36:28');
INSERT INTO `t_errorlog` VALUES (125, 'GET', '/log/error', '{\"start\":[\"\"],\"end\":[\"\"],\"page\":[\"1\"],\"size\":[\"15\"]}', 'Token无效：null', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-21 14:36:33');
INSERT INTO `t_errorlog` VALUES (126, 'GET', '/InvoiceTemplate/list', '{}', 'Token无效：null', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-21 14:36:48');
INSERT INTO `t_errorlog` VALUES (127, 'GET', '/InvoiceTemplate/list', '{}', 'Token无效：null', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-21 14:37:10');
INSERT INTO `t_errorlog` VALUES (128, 'GET', '/InvoiceTemplate/list', '{}', 'Token无效：null', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-21 14:38:23');
INSERT INTO `t_errorlog` VALUES (129, 'GET', '/InvoiceTemplate/list', '{}', 'Token无效：null', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-21 14:38:24');
INSERT INTO `t_errorlog` VALUES (130, 'GET', '/InvoiceTemplate/list', '{}', 'Token无效：null', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-21 14:38:28');
INSERT INTO `t_errorlog` VALUES (131, 'GET', '/InvoiceTemplate/list', '{}', 'Token无效：null', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-21 14:39:29');
INSERT INTO `t_errorlog` VALUES (132, 'GET', '/InvoiceTemplate/list', '{}', 'Token已过期：24cec22e-2632-459d-a6e3-66043a207e27', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-21 14:40:13');
INSERT INTO `t_errorlog` VALUES (133, 'GET', '/InvoiceTemplate/list', '{}', 'Token无效：null', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-21 14:40:33');
INSERT INTO `t_errorlog` VALUES (134, 'GET', '/InvoiceTemplate/list', '{}', 'Token已过期：24cec22e-2632-459d-a6e3-66043a207e27', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-21 14:41:34');
INSERT INTO `t_errorlog` VALUES (135, 'GET', '/InvoiceTemplate/list', '{}', 'Token无效：null', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-21 14:41:53');
INSERT INTO `t_errorlog` VALUES (136, 'POST', '/HooyaInvoice/ExportJsonData', '{}', '未提供Token', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-21 14:42:39');
INSERT INTO `t_errorlog` VALUES (137, 'POST', '/HooyaInvoice/ExportJsonData', '{}', '未提供Token', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-21 14:42:39');
INSERT INTO `t_errorlog` VALUES (138, 'POST', '/HooyaInvoice/ExportJsonData', '{}', '未提供Token', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-21 14:43:15');
INSERT INTO `t_errorlog` VALUES (139, 'POST', '/HooyaInvoice/ExportJsonData', '{}', '未提供Token', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-21 14:43:15');
INSERT INTO `t_errorlog` VALUES (140, 'GET', '/HooyaInvoice/getExportAuth', '{}', 'Token无效：24cec22e-2632-459d-a6e3-66043a207e27', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-21 14:54:30');
INSERT INTO `t_errorlog` VALUES (141, 'GET', '/HooyaInvoice/getExportAuth', '{}', 'Token无效：24cec22e-2632-459d-a6e3-66043a207e27', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-21 14:54:32');
INSERT INTO `t_errorlog` VALUES (142, 'GET', '/HooyaInvoice/getExportAuth', '{}', 'Token无效：24cec22e-2632-459d-a6e3-66043a207e27', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-21 14:54:35');
INSERT INTO `t_errorlog` VALUES (143, 'GET', '/HooyaInvoice/getExportAuth', '{}', 'Token无效：24cec22e-2632-459d-a6e3-66043a207e27', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-21 14:54:48');
INSERT INTO `t_errorlog` VALUES (144, 'GET', '/InvoiceTemplate/list', '{}', 'Token无效：24cec22e-2632-459d-a6e3-66043a207e27', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-21 14:55:00');
INSERT INTO `t_errorlog` VALUES (145, 'GET', '/InvoiceTemplate/list', '{}', 'Token无效：null', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-21 14:55:03');
INSERT INTO `t_errorlog` VALUES (146, 'GET', '/InvoiceTemplate/list', '{}', 'Token无效：null', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-21 14:55:17');
INSERT INTO `t_errorlog` VALUES (147, 'GET', '/HooyaInvoice/getExportAuth', '{}', 'Token已过期：183f5d62-068f-494f-99eb-f60a5a8f9fd4', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-21 14:57:24');
INSERT INTO `t_errorlog` VALUES (148, 'GET', '/HooyaInvoice/getExportAuth', '{}', 'Token无效：null', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-21 14:57:30');
INSERT INTO `t_errorlog` VALUES (149, 'GET', '/InvoiceTemplate/list', '{}', 'Token已过期：70116cc3-e077-4bca-bdd0-6b31ab9bb110', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-21 16:46:39');
INSERT INTO `t_errorlog` VALUES (150, 'GET', '/log/error', '{\"start\":[\"\"],\"end\":[\"\"],\"page\":[\"1\"],\"size\":[\"15\"]}', 'Token已过期：70116cc3-e077-4bca-bdd0-6b31ab9bb110', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-21 16:46:39');
INSERT INTO `t_errorlog` VALUES (151, 'GET', '/log/error', '{\"start\":[\"\"],\"end\":[\"\"],\"page\":[\"1\"],\"size\":[\"15\"]}', 'Token已过期：70116cc3-e077-4bca-bdd0-6b31ab9bb110', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-26 11:18:34');
INSERT INTO `t_errorlog` VALUES (152, 'GET', '/log/error', '{\"start\":[\"\"],\"end\":[\"\"],\"page\":[\"1\"],\"size\":[\"15\"]}', 'Token已过期：70116cc3-e077-4bca-bdd0-6b31ab9bb110', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-27 15:04:57');
INSERT INTO `t_errorlog` VALUES (153, 'GET', '/InvoiceTemplate/list', '{}', 'Token已过期：70116cc3-e077-4bca-bdd0-6b31ab9bb110', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-27 15:04:57');
INSERT INTO `t_errorlog` VALUES (154, 'GET', '/InvoiceTemplate/list', '{}', 'Token已过期：410c00b6-84ce-4324-8f1e-932b1cd585a6', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-27 16:45:34');
INSERT INTO `t_errorlog` VALUES (155, 'GET', '/HooyaInvoice/getExportAuth', '{}', 'Token无效：null', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-27 16:59:22');
INSERT INTO `t_errorlog` VALUES (156, 'GET', '/InvoiceTemplate/list', '{}', 'Token无效：null', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-27 16:59:22');
INSERT INTO `t_errorlog` VALUES (157, 'POST', '/HooyaInvoice/ExportJsonData', '{}', '未提供Token', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-27 17:00:41');
INSERT INTO `t_errorlog` VALUES (158, 'POST', '/HooyaInvoice/ExportJsonData', '{}', '未提供Token', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-27 17:01:51');
INSERT INTO `t_errorlog` VALUES (159, 'GET', '/HooyaInvoice/getExportAuth', '{}', 'Token无效：31f191cb-890a-49a3-9ad1-3b85f588ec8c', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-27 17:12:16');
INSERT INTO `t_errorlog` VALUES (160, 'POST', '/HooyaInvoice/ExportJsonData', '{}', '未提供Token', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-27 17:12:30');
INSERT INTO `t_errorlog` VALUES (161, 'POST', '/HooyaInvoice/ExportJsonData', '{}', '未提供Token', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-27 17:13:02');
INSERT INTO `t_errorlog` VALUES (162, 'POST', '/HooyaInvoice/ExportJsonData', '{}', '未提供Token', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-27 17:13:48');
INSERT INTO `t_errorlog` VALUES (163, 'GET', '/HooyaInvoice/getExportAuth', '{}', 'Token无效：799d651a-f60b-4049-ac73-d50b341a8d43', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-27 17:20:58');
INSERT INTO `t_errorlog` VALUES (164, 'POST', '/HooyaInvoice/ExportJsonData', '{}', '未提供Token', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-27 17:21:19');
INSERT INTO `t_errorlog` VALUES (165, 'POST', '/HooyaInvoice/ExportJsonData', '{}', '未提供Token', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-27 17:22:21');
INSERT INTO `t_errorlog` VALUES (166, 'POST', '/HooyaInvoice/ExportJsonData', '{}', '未提供Token', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-27 17:24:38');
INSERT INTO `t_errorlog` VALUES (167, 'POST', '/HooyaInvoice/ExportJsonData', '{}', '未提供Token', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-27 17:24:38');
INSERT INTO `t_errorlog` VALUES (168, 'POST', '/HooyaInvoice/ExportJsonData', '{}', '未提供Token', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-27 17:24:59');
INSERT INTO `t_errorlog` VALUES (169, 'POST', '/HooyaInvoice/ExportJsonData', '{}', '未提供Token', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-27 17:24:59');
INSERT INTO `t_errorlog` VALUES (170, 'POST', '/HooyaInvoice/ExportJsonData', '{}', '未提供Token', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-27 17:25:29');
INSERT INTO `t_errorlog` VALUES (171, 'POST', '/HooyaInvoice/ExportJsonData', '{}', '未提供Token', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-27 17:25:29');
INSERT INTO `t_errorlog` VALUES (172, 'GET', '/HooyaInvoice/getExportAuth', '{}', 'Token无效：7609c782-666f-4bec-8e41-d280caf105a4', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-27 17:31:55');
INSERT INTO `t_errorlog` VALUES (173, 'GET', '/HooyaInvoice/getExportAuth', '{}', 'Token无效：null', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-27 17:32:34');
INSERT INTO `t_errorlog` VALUES (174, 'GET', '/HooyaInvoice/getExportAuth', '{}', 'Token无效：null', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-27 17:32:37');
INSERT INTO `t_errorlog` VALUES (175, 'GET', '/HooyaInvoice/getExportAuth', '{}', 'Token无效：null', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-27 17:32:50');
INSERT INTO `t_errorlog` VALUES (176, 'POST', '/HooyaInvoice/ExportJsonData', '{}', '未提供Token', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-27 17:34:49');
INSERT INTO `t_errorlog` VALUES (177, 'POST', '/HooyaInvoice/ExportJsonData', '{}', '未提供Token', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-27 17:36:44');
INSERT INTO `t_errorlog` VALUES (178, 'POST', '/HooyaInvoice/ExportJsonData', '{}', '未提供Token', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-27 17:44:03');
INSERT INTO `t_errorlog` VALUES (179, 'POST', '/HooyaInvoice/ExportJsonData', '{}', '未提供Token', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-27 17:44:03');
INSERT INTO `t_errorlog` VALUES (180, 'GET', '/HooyaInvoice/getExportAuth', '{}', 'Token无效：ebb67b19-d80e-4dee-b325-c833c81af387', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-27 17:44:23');
INSERT INTO `t_errorlog` VALUES (181, 'POST', '/HooyaInvoice/ExportJsonData', '{}', '未提供Token', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-27 17:44:36');
INSERT INTO `t_errorlog` VALUES (182, 'POST', '/HooyaInvoice/ExportJsonData', '{}', '未提供Token', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-27 17:45:00');
INSERT INTO `t_errorlog` VALUES (183, 'POST', '/HooyaInvoice/ExportJsonData', '{}', '未提供Token', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-27 17:51:02');
INSERT INTO `t_errorlog` VALUES (184, 'POST', '/HooyaInvoice/ExportJsonData', '{}', '未提供Token', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-27 17:51:24');
INSERT INTO `t_errorlog` VALUES (185, 'POST', '/HooyaInvoice/ExportJsonData', '{}', '未提供Token', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-27 17:54:17');
INSERT INTO `t_errorlog` VALUES (186, 'POST', '/HooyaInvoice/ExportJsonData', '{}', '未提供Token', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-27 17:54:38');
INSERT INTO `t_errorlog` VALUES (187, 'POST', '/HooyaInvoice/ExportJsonData', '{}', '未提供Token', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-27 17:55:36');
INSERT INTO `t_errorlog` VALUES (188, 'POST', '/HooyaInvoice/ExportJsonData', '{}', '未提供Token', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-27 17:55:36');
INSERT INTO `t_errorlog` VALUES (189, 'POST', '/HooyaInvoice/ExportJsonData', '{}', '未提供Token', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-27 17:55:42');
INSERT INTO `t_errorlog` VALUES (190, 'POST', '/HooyaInvoice/ExportJsonData', '{}', '未提供Token', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-27 17:55:42');
INSERT INTO `t_errorlog` VALUES (191, 'GET', '/InvoiceTemplate/list', '{}', 'Token无效：cb112481-c915-4a3a-8980-5eac99d34bda', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-27 17:57:12');
INSERT INTO `t_errorlog` VALUES (192, 'GET', '/HooyaInvoice/getExportAuth', '{}', 'Token无效：a0da6535-d5d2-47b0-b7a6-e069efa4174f', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-27 17:59:43');
INSERT INTO `t_errorlog` VALUES (193, 'POST', '/HooyaInvoice/ExportJsonData', '{}', '未提供Token', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-27 18:00:33');
INSERT INTO `t_errorlog` VALUES (194, 'POST', '/HooyaInvoice/ExportJsonData', '{}', '未提供Token', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-27 18:00:33');
INSERT INTO `t_errorlog` VALUES (195, 'GET', '/HooyaInvoice/getExportAuth', '{}', 'Token无效：9d61c9b9-63c6-4f73-acd7-3d6fd7af9d08', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-27 18:04:02');
INSERT INTO `t_errorlog` VALUES (196, 'POST', '/HooyaInvoice/ExportJsonData', '{}', '未提供Token', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-27 18:04:14');
INSERT INTO `t_errorlog` VALUES (197, 'GET', '/InvoiceTemplate/list', '{}', 'Token无效：bcd672fa-6b9d-4553-aed3-71728b1cb740', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-27 18:05:11');
INSERT INTO `t_errorlog` VALUES (198, 'GET', '/HooyaInvoice/getExportAuth', '{}', 'Token无效：8c08f9f1-88e9-4aa2-b2c0-1d3941d7d14f', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-27 18:11:28');
INSERT INTO `t_errorlog` VALUES (199, 'POST', '/HooyaInvoice/ExportJsonData', '{}', '未提供Token', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-27 18:11:39');
INSERT INTO `t_errorlog` VALUES (200, 'GET', '/HooyaInvoice/getExportAuth', '{}', 'Token无效：22a93dc3-cfcf-4be8-b48f-cf96dbc52d8a', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-27 18:13:06');
INSERT INTO `t_errorlog` VALUES (201, 'POST', '/HooyaInvoice/ExportJsonData', '{}', '未提供Token', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-27 18:13:17');
INSERT INTO `t_errorlog` VALUES (202, 'GET', '/HooyaInvoice/getExportAuth', '{}', 'Token无效：f8cbc678-ca52-402a-890f-ca9b377dcb4a', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-27 18:14:09');
INSERT INTO `t_errorlog` VALUES (203, 'POST', '/HooyaInvoice/ExportJsonData', '{}', '未提供Token', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-27 18:14:22');
INSERT INTO `t_errorlog` VALUES (204, 'POST', '/HooyaInvoice/ExportJsonData', '{}', 'Token无效：d7ff31b2-6aa7-43c3-ab16-e31dcb3d3152', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-27 18:16:21');
INSERT INTO `t_errorlog` VALUES (205, 'POST', '/HooyaInvoice/ExportJsonData', '{}', 'Token无效：d7ff31b2-6aa7-43c3-ab16-e31dcb3d3152', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-27 18:17:20');
INSERT INTO `t_errorlog` VALUES (206, 'POST', '/HooyaInvoice/ExportJsonData', '{}', 'Token无效：d7ff31b2-6aa7-43c3-ab16-e31dcb3d3152', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-27 18:17:43');
INSERT INTO `t_errorlog` VALUES (207, 'POST', '/HooyaInvoice/ExportJsonData', '{}', 'Token无效：d7ff31b2-6aa7-43c3-ab16-e31dcb3d3152', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-27 18:18:08');
INSERT INTO `t_errorlog` VALUES (208, 'POST', '/HooyaInvoice/ExportJsonData', '{}', 'Token无效：d7ff31b2-6aa7-43c3-ab16-e31dcb3d3152', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-27 18:18:21');
INSERT INTO `t_errorlog` VALUES (209, 'POST', '/HooyaInvoice/ExportJsonData', '{}', 'Token无效：d7ff31b2-6aa7-43c3-ab16-e31dcb3d3152', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-27 18:19:18');
INSERT INTO `t_errorlog` VALUES (210, 'GET', '/HooyaInvoice/getExportAuth', '{}', 'Token无效：448500e8-2137-405c-ac36-f32cfcad0f11', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-28 09:12:22');
INSERT INTO `t_errorlog` VALUES (211, 'POST', '/HooyaInvoice/ExportJsonData', '{}', 'Token无效：d7ff31b2-6aa7-43c3-ab16-e31dcb3d3152', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-28 09:13:19');
INSERT INTO `t_errorlog` VALUES (212, 'POST', '/HooyaInvoice/ExportJsonData', '{}', 'Required request body is missing: public void org.Hooya.controller.InvoiceController.ExportInvoiceBatch(javax.servlet.http.HttpServletResponse,java.lang.String)', 'class org.springframework.http.converter.HttpMessageNotReadableException', '2023-06-28 09:13:29');
INSERT INTO `t_errorlog` VALUES (213, 'POST', '/HooyaInvoice/ExportJsonData', '{}', '未提供Token', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-28 09:24:50');
INSERT INTO `t_errorlog` VALUES (214, 'GET', '/HooyaInvoice/getExportAuth', '{}', 'Token无效：e246a7e1-ab82-4aad-a636-dcf7935aba0f', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-28 09:28:23');
INSERT INTO `t_errorlog` VALUES (215, 'POST', '/HooyaInvoice/ExportJsonData', '{}', '未提供Token', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-28 09:28:38');
INSERT INTO `t_errorlog` VALUES (216, 'GET', '/HooyaInvoice/getExportAuth', '{}', 'Token无效：4a98c2f5-7d94-4c65-9c98-9e801a65e077', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-28 09:29:25');
INSERT INTO `t_errorlog` VALUES (217, 'GET', '/HooyaInvoice/getExportAuth', '{}', 'Token无效：be7957a0-50a0-4d27-b3dc-15e5949530bb', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-28 09:59:17');
INSERT INTO `t_errorlog` VALUES (218, 'GET', '/InvoiceTemplate/list', '{}', 'Token无效：101ccef0-a8ed-485f-a8d6-b797168b7f43', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-28 10:13:18');
INSERT INTO `t_errorlog` VALUES (219, 'GET', '/log/error', '{\"start\":[\"\"],\"end\":[\"\"],\"page\":[\"1\"],\"size\":[\"15\"]}', 'Token已过期：96c84101-a9eb-4d39-abe3-cdd8336bc318', 'class cn.dev33.satoken.exception.NotLoginException', '2023-06-28 14:07:15');

-- ----------------------------
-- Table structure for t_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_permission`;
CREATE TABLE `t_permission`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '菜单名称',
  `parent_id` int(0) NOT NULL DEFAULT 0 COMMENT '父菜单ID',
  `type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `path` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '组件路径',
  `perms` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '权限标识',
  `sort` int(0) NOT NULL DEFAULT 0 COMMENT '显示顺序',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '菜单状态（0停用 1正常 ）',
  `icon` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单图标',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_permission
-- ----------------------------
INSERT INTO `t_permission` VALUES (1, '账单导出', 0, 'M', '/index', 'invoice:export', 0, 1, 'el-icon-document');
INSERT INTO `t_permission` VALUES (2, '模板查询', 0, 'M', '/template', 'invoice:template', 0, 1, 'el-icon-document-copy');
INSERT INTO `t_permission` VALUES (3, '错误日志', 0, 'M', '/errorlog', 'log:error', 0, 1, 'el-icon-s-order');

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '角色名称',
  `permission` json NOT NULL COMMENT '权限集合',
  `root` tinyint(0) NOT NULL DEFAULT 0 COMMENT '超级管理员（0否 1是）',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '角色状态（0停用 1正常）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES (1, '超级管理员', '[1, 2, 3]', 1, 1);
INSERT INTO `t_role` VALUES (2, '客户', '[1, 2]', 0, 1);

-- ----------------------------
-- Table structure for t_template
-- ----------------------------
DROP TABLE IF EXISTS `t_template`;
CREATE TABLE `t_template`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `template_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `country` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `dianpu` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `pdfpath` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `unit` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `type` tinyint(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 84 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_template
-- ----------------------------
INSERT INTO `t_template` VALUES (45, 'RealdeEN_Invoice', 'sk', 'realde-sk', 'D:\\Code_Space\\FileData\\HooyaInvoice\\templateDic2\\RealdeEN_Invoice.docx', 'D:\\Code_Space\\FileData\\HooyaInvoice\\templatePdf\\RealdeEN_Invoice.pdf', 'EUR', 0);
INSERT INTO `t_template` VALUES (46, 'RealdeEN_DeliveryNote', 'sk', 'realde-sk', 'D:\\Code_Space\\FileData\\HooyaInvoice\\templateDic2\\RealdeEN_DeliveryNote.docx', 'D:\\Code_Space\\FileData\\HooyaInvoice\\templatePdf\\RealdeEN_DeliveryNote.pdf', 'EUR', 1);
INSERT INTO `t_template` VALUES (47, 'RealdeEN_Invoice2', 'cz', 'realde-cz', 'D:\\Code_Space\\FileData\\HooyaInvoice\\templateDic2\\RealdeEN_Invoice2.docx', 'D:\\Code_Space\\FileData\\HooyaInvoice\\templatePdf\\RealdeEN_Invoice2.pdf', 'CZK', 0);
INSERT INTO `t_template` VALUES (48, 'RealdeEN_DeliveryNote2', 'cz', 'realde-cz', 'D:\\Code_Space\\FileData\\HooyaInvoice\\templateDic2\\RealdeEN_DeliveryNote2.docx', 'D:\\Code_Space\\FileData\\HooyaInvoice\\templatePdf\\RealdeEN_DeliveryNote2.pdf', 'CZK', 1);
INSERT INTO `t_template` VALUES (51, 'FdsES_Invoice', 'ES', 'FDSES', 'D:\\Code_Space\\FileData\\HooyaInvoice\\templateDic2\\FdsES_Invoice.docx', 'D:\\Code_Space\\FileData\\HooyaInvoice\\templatePdf\\FdsES_Invoice.pdf', 'EUR', 0);
INSERT INTO `t_template` VALUES (52, 'FdsES_DeliveryNote', 'ES', 'FDSES', 'D:\\Code_Space\\FileData\\HooyaInvoice\\templateDic2\\FdsES_DeliveryNote.docx', 'D:\\Code_Space\\FileData\\HooyaInvoice\\templatePdf\\FdsES_DeliveryNote.pdf', 'EUR', 1);
INSERT INTO `t_template` VALUES (53, 'FdvamIT_Invoice', 'IT', 'FDVAM-IT', 'D:\\Code_Space\\FileData\\HooyaInvoice\\templateDic2\\FdvamIT_Invoice.docx', 'D:\\Code_Space\\FileData\\HooyaInvoice\\templatePdf\\FdvamIT_Invoice.pdf', 'EUR', 0);
INSERT INTO `t_template` VALUES (54, 'FdvamIT_DeliveryNote', 'IT', 'FDVAM-IT', 'D:\\Code_Space\\FileData\\HooyaInvoice\\templateDic2\\FdvamIT_DeliveryNote.docx', 'D:\\Code_Space\\FileData\\HooyaInvoice\\templatePdf\\FdvamIT_DeliveryNote.pdf', 'EUR', 1);
INSERT INTO `t_template` VALUES (55, 'FdvamFR_Invoice', 'FR', 'FDVAM-FR', 'D:\\Code_Space\\FileData\\HooyaInvoice\\templateDic2\\FdvamFR_Invoice.docx', 'D:\\Code_Space\\FileData\\HooyaInvoice\\templatePdf\\FdvamFR_Invoice.pdf', 'EUR', 0);
INSERT INTO `t_template` VALUES (56, 'FdvamFR_DeliveryNote', 'FR', 'FDVAM-FR', 'D:\\Code_Space\\FileData\\HooyaInvoice\\templateDic2\\FdvamFR_DeliveryNote.docx', 'D:\\Code_Space\\FileData\\HooyaInvoice\\templatePdf\\FdvamFR_DeliveryNote.pdf', 'EUR', 1);
INSERT INTO `t_template` VALUES (57, 'GiantexES-am_DeliveryNote', 'ES', 'GiantexES', 'D:\\Code_Space\\FileData\\HooyaInvoice\\templateDic2\\GiantexES-am_DeliveryNote.docx', 'D:\\Code_Space\\FileData\\HooyaInvoice\\templatePdf\\GiantexES-am_DeliveryNote.pdf', '€', 1);
INSERT INTO `t_template` VALUES (58, 'GiantexES-am_Invoice', 'ES', 'GiantexES', 'D:\\Code_Space\\FileData\\HooyaInvoice\\templateDic2\\GiantexES-am_Invoice.docx', 'D:\\Code_Space\\FileData\\HooyaInvoice\\templatePdf\\GiantexES-am_Invoice.pdf', '€', 0);
INSERT INTO `t_template` VALUES (59, 'GiantexIT-am_Invoice', 'IT', 'GiantexIT', 'D:\\Code_Space\\FileData\\HooyaInvoice\\templateDic2\\GiantexIT-am_Invoice.docx', 'D:\\Code_Space\\FileData\\HooyaInvoice\\templatePdf\\GiantexIT-am_Invoice.pdf', '€', 0);
INSERT INTO `t_template` VALUES (60, 'GiantexIT-am_DeliveryNote', 'IT', 'GiantexIT', 'D:\\Code_Space\\FileData\\HooyaInvoice\\templateDic2\\GiantexIT-am_DeliveryNote.docx', 'D:\\Code_Space\\FileData\\HooyaInvoice\\templatePdf\\GiantexIT-am_DeliveryNote.pdf', '€', 1);
INSERT INTO `t_template` VALUES (61, 'GiantexFR-am_Invoice', 'FR', 'GiantexFR', 'D:\\Code_Space\\FileData\\HooyaInvoice\\templateDic2\\GiantexFR-am_Invoice.docx', 'D:\\Code_Space\\FileData\\HooyaInvoice\\templatePdf\\GiantexFR-am_Invoice.pdf', '€', 0);
INSERT INTO `t_template` VALUES (62, 'GiantexFR-am_DeliveryNote', 'FR', 'GiantexFR', 'D:\\Code_Space\\FileData\\HooyaInvoice\\templateDic2\\GiantexFR-am_DeliveryNote.docx', 'D:\\Code_Space\\FileData\\HooyaInvoice\\templatePdf\\GiantexFR-am_DeliveryNote.pdf', '€', 1);
INSERT INTO `t_template` VALUES (63, 'GiantexBE-am_Invoice', 'BE', 'GiantexBE', 'D:\\Code_Space\\FileData\\HooyaInvoice\\templateDic2\\GiantexBE-am_Invoice.docx', 'D:\\Code_Space\\FileData\\HooyaInvoice\\templatePdf\\GiantexBE-am_Invoice.pdf', '€', 0);
INSERT INTO `t_template` VALUES (64, 'GiantexBE-am_DeliveryNote', 'BE', 'GiantexBE', 'D:\\Code_Space\\FileData\\HooyaInvoice\\templateDic2\\GiantexBE-am_DeliveryNote.docx', 'D:\\Code_Space\\FileData\\HooyaInvoice\\templatePdf\\GiantexBE-am_DeliveryNote.pdf', '€', 1);
INSERT INTO `t_template` VALUES (69, 'GiantexSE-am_Invoice', 'SE', 'GiantexSE', 'D:\\Code_Space\\FileData\\HooyaInvoice\\templateDic2\\GiantexSE-am_Invoice.docx', 'D:\\Code_Space\\FileData\\HooyaInvoice\\templatePdf\\GiantexSE-am_Invoice.pdf', 'kr', 0);
INSERT INTO `t_template` VALUES (70, 'GiantexSE-am_DeliveryNote', 'SE', 'GiantexSE', 'D:\\Code_Space\\FileData\\HooyaInvoice\\templateDic2\\GiantexSE-am_DeliveryNote.docx', 'D:\\Code_Space\\FileData\\HooyaInvoice\\templatePdf\\GiantexSE-am_DeliveryNote.pdf', 'kr', 1);
INSERT INTO `t_template` VALUES (71, 'GiantexNL-am_Invoice', 'NL', 'GiantexNL', 'D:\\Code_Space\\FileData\\HooyaInvoice\\templateDic2\\GiantexNL-am_Invoice.docx', 'D:\\Code_Space\\FileData\\HooyaInvoice\\templatePdf\\GiantexNL-am_Invoice.pdf', '€', 0);
INSERT INTO `t_template` VALUES (72, 'GiantexNL-am_DeliveryNote', 'NL', 'GiantexNL', 'D:\\Code_Space\\FileData\\HooyaInvoice\\templateDic2\\GiantexNL-am_DeliveryNote.docx', 'D:\\Code_Space\\FileData\\HooyaInvoice\\templatePdf\\GiantexNL-am_DeliveryNote.pdf', '€', 1);
INSERT INTO `t_template` VALUES (77, 'FdsDE_Invoice', 'DE', 'FdsDE', 'D:\\Code_Space\\FileData\\HooyaInvoice\\templateDic2\\FdsDE_Invoice.docx', 'D:\\Code_Space\\FileData\\HooyaInvoice\\templatePdf\\FdsDE_Invoice.pdf', 'EUR', 0);
INSERT INTO `t_template` VALUES (78, 'FdsDE_DeliveryNote', 'DE', 'FdsDE', 'D:\\Code_Space\\FileData\\HooyaInvoice\\templateDic2\\FdsDE_DeliveryNote.docx', 'D:\\Code_Space\\FileData\\HooyaInvoice\\templatePdf\\FdsDE_DeliveryNote.pdf', 'EUR', 1);
INSERT INTO `t_template` VALUES (79, 'GiantexDE-am_Invoice', 'DE', 'Giantex-KF', 'D:\\Code_Space\\FileData\\HooyaInvoice\\templateDic2\\GiantexDE-am_Invoice.docx', 'D:\\Code_Space\\FileData\\HooyaInvoice\\templatePdf\\GiantexDE-am_Invoice.pdf', '€', 0);
INSERT INTO `t_template` VALUES (80, 'GiantexDE-am_DeliveryNote', 'DE', 'Giantex-KF', 'D:\\Code_Space\\FileData\\HooyaInvoice\\templateDic2\\GiantexDE-am_DeliveryNote.docx', 'D:\\Code_Space\\FileData\\HooyaInvoice\\templatePdf\\GiantexDE-am_DeliveryNote.pdf', '€', 1);

SET FOREIGN_KEY_CHECKS = 1;
