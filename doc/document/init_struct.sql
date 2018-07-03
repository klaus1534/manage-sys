drop database if exists tender;
create database if not exists  tender default character set utf8 collate utf8_general_ci;

use tender;
# 公司表
drop table if exists `enterprise`;
CREATE TABLE if not exists `enterprise` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enterprise_name` varchar(255) NOT NULL,
  `province_id` int(11) DEFAULT NULL,
  `province_name` varchar(255) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `city_name` varchar(255) DEFAULT NULL,
  `area_id` int(11) DEFAULT NULL,
  `area_name` varchar(255) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `creater` varchar(255) DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `updater` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# 省份表
drop table if exists `province`;
CREATE TABLE if not exists `province` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `province_name` varchar(255) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `creater` varchar(255) DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `updater` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
# 市级表
drop table if exists `city`;
CREATE TABLE if not exists `city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city_name` varchar(255) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `creater` varchar(255) DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `updater` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
# 区域表
drop table if exists `area`;
CREATE TABLE if not exists `area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `area_name` varchar(255) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `creater` varchar(255) DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `updater` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


# 公司资质表
drop table if exists `enterprise_qualification`;
CREATE TABLE if not exists `enterprise_qualification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enterprise_id` varchar(255) NOT NULL,
  `qualification_name` varchar(255) not null,
  `qualification_level` varchar(255) null,
  `qualification_no` varchar(255) not null ,
  `issue_time` datetime default null ,
  `valid_time` datetime default null ,
  `created_time` datetime DEFAULT NULL,
  `creater` varchar(255) DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `updater` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# 公司人员表
drop table if exists `enterprise_employee`;
CREATE TABLE if not exists `enterprise_employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enterprise_id` varchar(255) NOT NULL,
  `emp_name` varchar(255) default null ,
  `emp_sex` varchar(255) default null ,
  `emp_idno` varchar(255) default null ,
  `emp_type` varchar(255) default null ,
  `emp_qulification_no` varchar(255) default null ,
  `created_time` datetime DEFAULT NULL,
  `creater` varchar(255) DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `updater` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# 招标信息表
drop table if exists `pro_tender`;
CREATE TABLE if not exists `pro_tender` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_enter_id` int(11) NOT NULL,
  `project_no` varchar(255) default null ,
  `project_tender_no` varchar(255) default null ,
  `project_name` varchar(255) default null ,
  `project_type` varchar(255) default null ,
  `tender_shoot_date` datetime default null ,
  `tender_amount` decimal(16,4) default null ,
  `build_scale` varchar(255) default null ,
  `tender_build_area` decimal(16,4) default null ,
  `tender_enter_id` int(11) default null ,
  `tender_man` varchar(255) default null ,
  `created_time` datetime DEFAULT NULL,
  `creater` varchar(255) DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `updater` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# 施工单位信息表
drop table if exists `pro_build`;
CREATE TABLE if not exists `pro_build` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_enter_id` int(11) NOT NULL,
  `project_name` varchar(255) default null ,
  `project_no` varchar(255) default null ,
  `project_build_no` varchar(255) default null ,
  `project_contract_amount` decimal(16,4) default null ,
  `project_contract_duration` decimal(16,4) default null ,
  `build_scale` varchar(255) default null ,
  `build_area` decimal(16,4) default null ,
  `build_enter_id` int(11) default null ,
  `build_man` varchar(255) default null ,
  `created_time` datetime DEFAULT NULL,
  `creater` varchar(255) DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `updater` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# 竣工备案信息表 --
drop table if exists `pro_completed`;
CREATE TABLE if not exists `pro_completed` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_enter_id` int(11) NOT NULL,
  `project_name` varchar(255) default null ,
  `project_no` varchar(255) default null ,
  `project_completed_no` varchar(255) default null ,
  `real_build_amount` decimal(16,4) default null ,
  `real_build_area` decimal(16,4) default null ,
  `real_build_scale` varchar(255) default null ,
  `real_start_time` datetime default null ,
  `real_completed_time` datetime default null ,
  `created_time` datetime DEFAULT NULL,
  `creater` varchar(255) DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `updater` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# 项目合同备案信息 --
drop table if exists `pro_contract`;
CREATE TABLE if not exists `pro_contract` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_enter_id` int(11) NOT NULL,
  `project_name` varchar(255) default null ,
  `project_no` varchar(255) default null ,
  `project_contract_no` varchar(255) default null ,
  `contract_sign_time` datetime default null ,
  `contract_build_scale` varchar(255) default null ,
  `contract_build_amount` decimal(16,4) default null ,
  `contract_type` varchar(255) default null ,
  `tender_enter_id` int(11) default null ,
  `created_time` datetime DEFAULT NULL,
  `creater` varchar(255) DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `updater` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#######################################################
## 用户模块
#######################################################
# 用户表
drop table if exists `sys_users`;
CREATE TABLE if not exists `sys_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `enabled` tinyint(255) NOT NULL,
  `locked` tinyint(255) DEFAULT NULL,
  `last_pwd_update` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
INSERT  `sys_users`(`id`, `username`, `password`, `email`, `enabled`, `locked`, `last_pwd_update`) VALUES
 (1, 'admin', '202cb962ac59075b964b07152d234b70', 'nchufujianjian@sina.cn', 1, 0, '2018-06-07 17:29:03');

# 角色表
drop table if exists `sys_role`;
CREATE TABLE if not exists `sys_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `role_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
INSERT INTO `sys_role`(`id`, `role`, `role_name`) VALUES
 (1, 'ROLE_USER', '用户角色'),
 (2, 'ROLE_ADMIN', '管理员角色');

# 用户角色关联表
drop table if exists `sys_user_role`;
CREATE TABLE if not exists `sys_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_user_id` (`user_id`) USING BTREE,
  KEY `fk_role_id` (`role_id`) USING BTREE,
  CONSTRAINT `fk_role_id` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `sys_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
INSERT INTO `sys_user_role`(`id`, `user_id`, `role_id`) VALUES
  (1, 1, 1),
  (2, 1, 2);

#菜单表
drop table if exists `sys_menu`;
CREATE TABLE if not exists `sys_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(255) NOT NULL,
  `menu_path` varchar(255) NOT NULL,
  `orderno` int(255) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `creater` varchar(255) DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `updater` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into sys_menu(menu_name, menu_path, orderno, created_time, creater) values
  ('公告管理', '#','1', now(), 'admin'),
  ('企业管理', '#','100', now(), 'admin'),
  ('企业查询', '#','200', now(), 'admin'),
  ('基础资料管理', '#','300', now(), 'admin'),
  ('用户信息管理', '#','400', now(), 'admin'),
  ('数据管理', '#','500', now(), 'admin');

insert into sys_menu(menu_name, menu_path, orderno, parent_id, created_time, creater) values
  ('公告列表','/error/todo','10','1',now(),'admin'),
  ('企业基础资料','/enterprise/list','10','2',now(),'admin'),
  ('企业业绩维护','/enterprise/qualification/join/list','20','2',now(),'admin'),
  ('企业职称状态','/enterprise/employee/join/list','30','2',now(),'admin'),
  ('合同信息','/pro/contract/join/list','40','2',now(),'admin'),
  ('招标信息','/pro/tender/join/list','50','2',now(),'admin'),
  ('施工许可','/pro/build/join/list','60','2',now(),'admin'),
  ('竣工信息','/pro/completed/join/list','70','2',now(),'admin'),
  ('企业业绩查询','/pro/tender/list','10','3',now(),'admin'),
  ('省份资料维护','/provinces/list','10','4',now(),'admin'),
  ('市级资料维护','/citys/list','20','4',now(),'admin'),
  ('区域资料维护','/area/list','30','4',now(),'admin'),
  ('用户管理','/sys/user/list','10','5',now(),'admin'),
  ('角色管理','/sys/role/list','20','5',now(),'admin'),
  ('权限管理','/sys/menu/list','30','5',now(),'admin'),
  ('数据抓取','/error/todo','10','6',now(),'admin');


#菜单角色关联表
drop table if exists `sys_menu_role`;
CREATE TABLE if not exists `sys_menu_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `menu_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_role_menu_id` (`role_id`),
  KEY `fk_menu_role_id` (`menu_id`),
  CONSTRAINT `fk_menu_role_id` FOREIGN KEY (`menu_id`) REFERENCES `sys_menu` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_role_menu_id` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#insert into enterprise_employee(enterprise_id, emp_name, emp_sex, emp_idno, emp_type, emp_qulification_no, created_time, creater) values
#((select id from enterprise where enterprise_name='湖北鑫尧建筑工程有限公司'),'詹有乐', '男', '421122**********51','安全生产考核合格证书B证注册建造师（二级）', '鄂建安B(2016)101309161005501', now(),'admin');

#insert into enterprise_qualification(enterprise_id, qualification_name, qualification_level, qualification_no, issue_time, valid_time, created_time, creater) values
#  ((select id from enterprise where enterprise_name=''),'','','','','', now(),'admin');

#insert into pro_build(project_enter_id, project_no, project_build_no, project_contract_amount, project_contract_duration, build_scale, build_area, build_enter_id, build_man, created_time, creater) VALUES
#  ('','','','','','','','','',now(),'admin');
#insert into pro_contract(project_enter_id, project_name, project_no, project_contract_no, contract_sign_time, contract_build_scale, contract_build_amount, contract_type, tender_enter_id, created_time, creater) VALUES
#  ('','','','','','','','','',now(),'admin');
#insert into pro_completed(project_enter_id, project_name, project_no, project_completed_no, real_build_amount, real_build_area, real_build_scale, real_start_time, real_completed_time, created_time, creater) values
#  ('','','','','','','','',now(),'admin');