--数据库初始化脚本
---创建数据库
CREATE DATABASE hostel;

--使用数据库
use hostel;

--创建school表
--CREATE TABLE school(
--`school_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '学校主键',
--`name` varchar(20) NOT NULL COMMENT '学校名称',
--`address` varchar(30) NOT NULL COMMENT '学校地址',
--`email` varchar(20) NOT NULL COMMENT '学校邮箱',
--`grade` varchar(6) NOT NULL COMMENT '学校级别',
--`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
--`active` boolean  NOT NULL DEFAULT true COMMENT '是否显示',
--PRIMARY KEY(`school_id`),
--KEY idx_name(name),
--KEY idx_active(active)
--)ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='学校表';
--insert into 
--    school(name,address,email,grade) 
--values
--    ("嘉应学院","广东省梅州市","JYU@126.com","普通大学"),
--    ("韶关学院","广东省韶关市","shaoguan@126.com","普通大学");
    
--创建宿舍楼表
CREATE TABLE `building`(
`building_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '宿舍楼主键',
`building_name` varchar(10) NOT NULL COMMENT '宿舍楼名称',
`floors` tinyint(1) NOT NULL COMMENT '层数',
`rooms` tinyint(1) NOT NULL COMMENT '每层多少间宿舍',
`lives` tinyint(1) NOT NULL COMMENT '每间宿舍可以住多少人',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`active` boolean NOT NULL DEFAULT true COMMENT '是否显示',
primary key(building_id),
key idx_building_active(active)
)ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='宿舍楼表';

INSERT INTO 
    building(building_name,floors,rooms,lives) 
values
    ("南区二栋", 7, 15, 6),
    ("南区六栋", 7, 15, 6);
    
--创建宿舍表
CREATE TABLE `dormitory`(
`dormitory_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '宿舍主键',
`dormitory_number` int(5) NOT NULL COMMENT '宿舍门号',
`totals` tinyint(1) NOT NULL DEFAULT 0 COMMENT '已住人数',
`active` boolean NOT NULL DEFAULT true COMMENT '是否显示',
`building_id` int(4) NOT NULL COMMENT '宿舍楼外键',
primary key(dormitory_id),
key idx_dormitory_active(active),
key idx_dormitory_building(active,building_id)
)ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='宿舍表';

INSERT INTO 
    dormitory(dormitory_number,building_id) 
values
    (304, 1000),
    (314, 100);
    
--创建角色表
CREATE TABLE `role`(
`role_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '角色主键',
`symbol` varchar(15) NOT NULL COMMENT '角色标识',
`description` varchar(30) NOT NULL COMMENT '角色描述',
primary key(role_id),
key idx_role_symbol(symbol)
)ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COMMENT='角色表';

insert into 
    role(symbol, description) 
values 
    ("root","角色指派，修改密码，同时具有其他角色的所有权限"),
    ("administrator","具有对学生住宿数据进行增删改查的权限"),
    ("guest","只能查看学生住宿的数据");
    
--创建用户表
CREATE TABLE `User`(
`user_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '用户主键',
`user_name` varchar(10) NOT NULL COMMENT '用户名',
`user_pwd` varchar(32) NOT NULL COMMENT '密码',
`user_sex` tinyint(1) NOT NULL COMMENT '用户性别 0:男 1：女',
`user_phone` varchar(11) NOT NULL COMMENT '用户手机',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`active` boolean DEFAULT true COMMENT '是否显示',
`user_state` tinyint NOT NULL DEFAULT 1 COMMENT '审核状态 0：待审核， 1:审核通过  -1：审核不通过',
`role_id` int(5) NOT NULL COMMENT '角色外键',
primary key(user_id),
key idx_user_active(active),
key idx_active_roleId(active,role_id),
key idx_active_state(active,user_state)
)ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='用户表';

insert into
    User(user_name,user_pwd,user_sex,user_phone,role_id) 
values
    ("uncle","980aa49b5ffa705c408abcdee3861340",0, "18814383363",100),
    ("biao","42a26d23a735e73b606c731bb6bccfd8",0, "18814383326",100);
    
--创建学生表
CREATE TABLE `student`(
`stu_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '学生主键',
`stu_number` int(10) NOT NULL COMMENT '学生学号',
`name` varchar(10) NOT NULL COMMENT '学生名',
`sex` tinyint(1) NOT NULL COMMENT '学生性别 0:男 1：女',
`phone` varchar(11) NOT NULL COMMENT '学生手机',
`major` varchar(15) NOT NULL COMMENT '专业学科',
`class_num` int(5) NOT NULL COMMENT '班级',
`year` int(4) NOT NULL COMMENT '入学年份',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`active` boolean DEFAULT true COMMENT '是否显示',
`dormitory_id` int(4) NOT NULL COMMENT '宿舍外键',
primary key(stu_id),
unique(stu_number),
key idx_stuNum(stu_number),
key idx_stu_dormitory(active,dormitory_id)
)ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='学生表';

insert into
    student(stu_number,name,sex,phone,major,class_num,year,dormitory_id) 
values
    (141110188,"student1",0, "18814381456", "计算机网络工程",1404,2014,1000),
    (141110199,"student2",1, "18814383328", "计算机科学与技术",1401,2014,1000);