/*
SQLyog Professional v13.1.1 (64 bit)
MySQL - 8.0.42 : Database - pet_home
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`pet_home` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `pet_home`;

/*Table structure for table `adoption_post` */

DROP TABLE IF EXISTS `adoption_post`;
/* 宠物领养表 */
CREATE TABLE `adoption_post` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `title` varchar(200) NOT NULL COMMENT '标题',
  `description` varchar(2000) DEFAULT NULL COMMENT '描述',
  `pet_type` varchar(20) NOT NULL COMMENT '宠物类型：狗、猫',
  `pet_gender` varchar(10) NOT NULL COMMENT '宠物性别：公、母',
  `pet_name` varchar(50) NOT NULL COMMENT '宠物名称',
  `breed` varchar(100) NOT NULL COMMENT '品种',
  `vaccine_status` varchar(500) DEFAULT NULL COMMENT '疫苗情况',
  `photos` varchar(2000) DEFAULT NULL COMMENT '照片URL，多个用逗号分隔，最多5个',
  `adoption_requirement` varchar(1000) DEFAULT NULL COMMENT '领养要求',
  `location` varchar(200) DEFAULT NULL COMMENT '地理位置',
  `owner_info` varchar(500) DEFAULT NULL COMMENT '主人信息',
  `status` varchar(20) NOT NULL DEFAULT '寻找中' COMMENT '状态：寻找中、已结束',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='宠物领养表';

/*Data for the table `adoption_post` */

insert  into `adoption_post`(`id`,`user_id`,`title`,`description`,`pet_type`,`pet_gender`,`pet_name`,`breed`,`vaccine_status`,`photos`,`adoption_requirement`,`location`,`owner_info`,`status`,`create_time`) values 
(1,2,'可爱金毛幼犬寻找温暖的家','我家金毛生了一窝小狗狗，现在2个月大，健康活泼，非常可爱。因为家里养不了这么多，希望为它们找到负责任的主人。小狗已经做了第一针疫苗，会定期驱虫，毛色金黄，品相很好。','狗','公','小金','金毛','已接种第一针疫苗，定期驱虫','https://images.unsplash.com/photo-1601758228041-f3b2795255f1?w=600,https://images.unsplash.com/photo-1587300003388-59208cc962cb?w=600,https://images.unsplash.com/photo-1543466835-00a7907e9de1?w=600','希望领养人有稳定的住所和收入，有养狗经验优先。能够科学喂养，定期打疫苗和体检。承诺不弃养、不虐待。有独立的居住空间，家人同意养狗。可以签订领养协议。','北京市朝阳区','主人：张女士，联系方式：13800138001，微信：zhangsan2024，可随时上门看狗','寻找中','2024-02-15 10:00:00'),
(2,3,'温顺英短蓝猫找新家','因为工作调动要去国外，无法带走家里的猫咪球球。球球是纯种英短蓝猫，1岁半，公猫，已绝育，毛色纯正，圆脸大眼，性格特别温顺亲人。希望找一个有爱心的家庭收养。','猫','公','球球','英国短毛猫','已接种猫三联疫苗、狂犬疫苗，已绝育，定期驱虫','https://images.unsplash.com/photo-1574158622682-e40e69881006?w=600,https://images.unsplash.com/photo-1548802673-380ab8ebc7b7?w=600,https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba?w=600,https://images.unsplash.com/photo-1576201836106-db1758fd1c97?w=600','希望领养人真心喜欢猫，家中环境安全，能够提供优质猫粮和定期体检。不散养，家中有纱窗保护。能够定期发猫咪照片给我。愿意签订领养协议，承诺善待猫咪一生。','上海市浦东新区','主人：李先生，电话：13800138002，微信：liqiuqiu123，可视频看猫','寻找中','2024-02-16 14:30:00'),
(3,4,'泰迪犬妞妞求领养','因为家里小孩过敏，不得不为妞妞找新家。妞妞是棕色泰迪，母犬，3岁，体重5kg，性格温顺乖巧，不乱叫，很听话。会很多技能，坐下、握手、转圈都会。','狗','母','妞妞','泰迪','疫苗接种完整，每年定期体检，健康证明齐全','https://images.unsplash.com/photo-1597633425046-08f5110420b5?w=600,https://images.unsplash.com/photo-1623387641168-d9803ddd3f35?w=600','希望领养人有耐心和爱心，能够善待妞妞。有养狗经验，家中环境适合养小型犬。承诺不弃养，能够定期带妞妞体检打疫苗。希望能定期给我发妞妞的照片。','广州市天河区','主人：王女士，电话：13800138003，可随时联系看狗','寻找中','2024-02-17 09:20:00'),
(4,5,'美短虎斑猫花花寻找新主人','花花是美短虎斑母猫，2岁，花纹标准漂亮，身体健康，性格活泼。因为家里老人身体原因无法继续养猫，希望为花花找到一个好人家。花花很聪明，会用猫砂，不乱抓家具。','猫','母','花花','美国短毛猫','疫苗齐全，定期体检，健康状况良好，有完整的医疗记录','https://images.unsplash.com/photo-1581888227599-779811939961?w=600,https://images.unsplash.com/photo-1601758228041-f3b2795255f1?w=600,https://images.unsplash.com/photo-1587300003388-59208cc962cb?w=600','希望领养人有养猫经验，家中环境安全。每天清理猫砂，提供优质猫粮。不散养，做好窗户防护。能够给花花足够的关爱和陪伴。愿意签订领养协议。','深圳市南山区','主人：赵先生，微信：zhaoliu666，QQ：123456789','寻找中','2024-02-18 16:45:00'),
(5,2,'柯基犬豆豆找新家','豆豆是纯种柯基公犬，2岁半，短腿大耳，非常可爱。因为要搬到不允许养狗的小区，不得不为豆豆找新家。豆豆性格活泼友善，和小孩相处很好，会很多技能。','狗','公','豆豆','柯基','所有疫苗已接种，有健康证明和疫苗本','https://images.unsplash.com/photo-1559523161-0fc0d8b38a7a?w=600,https://images.unsplash.com/photo-1576086213369-97a306d36557?w=600','希望领养人住房宽敞，有足够的活动空间。能够每天遛狗，提供优质狗粮。有养中型犬的经验。能够善待豆豆，不弃养不虐待。可以定期回访。','北京市海淀区','主人：张先生，电话：13800138001，周末可上门看狗','寻找中','2024-02-19 11:00:00'),
(6,3,'哈士奇雪儿求收养','雪儿是纯种哈士奇母犬，3岁，蓝眼三火，品相很好。因为主人怀孕，家人不同意继续养狗，希望为雪儿找个好归宿。雪儿虽然是哈士奇但很听话，不拆家。','狗','母','雪儿','哈士奇','疫苗完整，健康体检合格，有医疗记录本','https://images.unsplash.com/photo-1614941059122-c7f8b828e5ad?w=600,https://images.unsplash.com/photo-1535930891776-0c2dfb7fda1a?w=600','希望领养人有养大型犬的经验，住房面积大，有独立的活动空间。能够每天保证足够的运动量。经济条件稳定，能够承担养狗费用。承诺善待雪儿一生。','成都市武侯区','主人：刘女士，微信：liuxue789，电话：13900139000','已结束','2024-02-10 10:30:00'),
(7,4,'布偶猫王子寻找爱心家庭','王子是纯种布偶猫，公猫，2岁，蓝双色，性格温柔粘人。因为要出国定居，无法带走王子，希望为它找到真心爱猫的家庭。王子非常亲人，会用猫砂，不乱抓。','猫','公','王子','布偶猫','疫苗齐全，定期驱虫和体检，健康状况优秀','https://images.unsplash.com/photo-1617791160536-598cf32026fb?w=600,https://images.unsplash.com/photo-1628009368231-7bb7cfcb0def?w=600,https://images.unsplash.com/photo-1583511655857-d19b40a7a54e?w=600','希望领养人非常有爱心和耐心，有养布偶猫的经验。能够提供宽敞舒适的环境，每天陪伴猫咪玩耍。提供进口猫粮，定期体检美容。家中做好防护，不散养。愿意签订领养协议并定期回访。','杭州市西湖区','主人：周先生，电话：13900139000，微信：zhouwangzi','寻找中','2024-02-20 15:20:00');

/*Table structure for table `ai_question_log` */

DROP TABLE IF EXISTS `ai_question_log`;
/*AI提问记录表*/
CREATE TABLE `ai_question_log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint DEFAULT NULL COMMENT '用户ID（可为空）',
  `username` varchar(50) NOT NULL DEFAULT 'anonymous' COMMENT '用户名',
  `question` text NOT NULL COMMENT '用户提问内容',
  `source_type` tinyint NOT NULL DEFAULT '2' COMMENT '回答来源：1=向量知识库，2=千问大模型',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '状态：1=正常，2=敏感，3=异常',
  `ip_address` varchar(45) DEFAULT NULL COMMENT 'IP地址',
  `user_agent` varchar(512) DEFAULT NULL COMMENT 'User-Agent',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_created_at` (`created_at`),
  KEY `idx_source_type` (`source_type`)
) ENGINE=InnoDB AUTO_INCREMENT=2009991346097172482 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='AI问答记录日志表';

/*Data for the table `ai_question_log` */

insert  into `ai_question_log`(`id`,`user_id`,`username`,`question`,`source_type`,`status`,`ip_address`,`user_agent`,`created_at`) values 
(2006590608230727681,2,'user001','如何给狗狗剪指甲',1,1,'0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','2026-01-01 12:57:36'),
(2006591011588554754,2,'user001','布偶猫用品推荐',2,1,'0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','2026-01-01 12:59:12'),
(2006591122536284162,2,'user001','我想给我的布偶买买一点东西，有什么推荐的没',2,1,'0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','2026-01-01 12:59:39'),
(2006599505842704386,2,'user001','如何给狗狗剪指甲',1,1,'0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','2026-01-01 13:32:58'),
(2006599687233769474,2,'user001','我家小猫咪晚上一直叫是什么原因',2,1,'0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','2026-01-01 13:33:41'),
(2006606802669170690,2,'user001','布偶猫用品推荐',2,1,'0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','2026-01-01 14:01:53'),
(2006607012636028930,2,'user001','我们家金毛最近生病了怎么办',2,1,'0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','2026-01-01 14:02:39'),
(2006609531676291074,17,'howwtt','给我推荐几款狗狗用的沐浴露',2,1,'0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','2026-01-01 14:12:44'),
(2006609657710931970,17,'howwtt','给我推荐几款狗狗用的沐浴露',2,1,'0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','2026-01-01 14:13:15'),
(2006609741735424001,17,'howwtt','我要给我家金毛买沐浴露',2,1,'0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','2026-01-01 14:13:33'),
(2006612435560755202,17,'howwtt','金毛做体验有适合推荐的项目吗',2,1,'0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','2026-01-01 14:24:11'),
(2007649404751376386,19,'zhaomin','如何给狗狗剪指甲',1,1,'0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','2026-01-04 11:04:53'),
(2007650863660318722,19,'zhaomin','如何给狗狗剪指甲',1,1,'0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','2026-01-04 11:10:33'),
(2007651703917846530,19,'zhaomin','给我推荐几款狗狗用的沐浴露',2,1,'0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','2026-01-04 11:13:55'),
(2007651829939904513,19,'zhaomin','我想给我的狗狗买一套\n保暖衣服',2,1,'0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','2026-01-04 11:14:30'),
(2007651913909870594,19,'zhaomin','狗狗保暖衣服有推荐的没',2,1,'0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','2026-01-04 11:14:50'),
(2007652081946271745,19,'zhaomin','狗狗品种是金毛、15KG、在家里穿，给我推荐一下',2,1,'0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','2026-01-04 11:15:25'),
(2009551225694621697,19,'zhaomin','如何给狗狗剪指甲',1,1,'0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','2026-01-04 11:04:53'),
(2009619813583429634,19,'zhaomin','如何给狗狗剪指甲',1,1,'0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','2026-01-04 11:04:53'),
(2009814633518075905,19,'zhaomin','我家狗狗能吃巧克力吗',1,1,'0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','2026-01-10 10:28:43'),
(2009814759598854146,19,'zhaomin','我要给我家狗狗买沐浴露',2,1,'0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','2026-01-10 10:29:06'),
(2009814927660421121,19,'zhaomin','我要买猫粮',2,1,'0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','2026-01-10 10:29:52'),
(2009991346097172481,19,'zhaomin','英短冬天穿的衣服有推荐的吗',2,1,'0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','2026-01-10 22:10:53');

/*Table structure for table `appointment` */

DROP TABLE IF EXISTS `appointment`;
/*医院预约记录表*/
CREATE TABLE `appointment` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `hospital_id` bigint NOT NULL COMMENT '医院ID',
  `hospital_name` varchar(200) NOT NULL COMMENT '医院名称',
  `pet_name` varchar(50) NOT NULL COMMENT '宠物名称',
  `pet_type` varchar(20) NOT NULL COMMENT '宠物类型',
  `condition_description` varchar(1000) NOT NULL COMMENT '病情描述',
  `images` varchar(2000) DEFAULT NULL COMMENT '病情图片URL，多个用逗号分隔，最多5个',
  `appointment_date` date NOT NULL COMMENT '预约日期',
  `appointment_time` varchar(20) NOT NULL COMMENT '预约时间',
  `contact_phone` varchar(20) NOT NULL COMMENT '联系电话',
  `status` varchar(20) NOT NULL DEFAULT '待赴约' COMMENT '状态：待赴约、已到店、已完成',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='医院预约表';

/*Data for the table `appointment` */

insert  into `appointment`(`id`,`user_id`,`hospital_id`,`hospital_name`,`pet_name`,`pet_type`,`condition_description`,`images`,`appointment_date`,`appointment_time`,`contact_phone`,`status`,`create_time`) values 
(1,2,1,'爱宠动物医院','小白','狗','我家狗狗最近食欲不振，精神萎靡，偶尔会呕吐，希望医生帮忙检查一下。','https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/e363d119130240beb60f9e57ff440533.jpg','2024-02-10','10:00','13800138001','已完成','2024-02-08 10:00:00'),
(2,2,2,'康宁宠物医疗中心','咪咪','猫','猫咪右前腿好像受伤了，走路一瘸一拐的，不让碰，请医生帮忙看看。','https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/ba3ec11e841b42439ae1d9361359a03d.jpg','2024-02-12','14:00','13800138001','已到店','2024-02-09 14:30:00'),
(3,3,3,'瑞派宠物医院','旺财','狗','狗狗皮肤出现红疹，一直抓挠，有些地方已经抓破了，需要治疗。','https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/9e6f7bad0a5a47bf89c0c9e241a82b25.jpeg,https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/9837d47c656649878f8197251ac1fdd6.jpeg','2024-02-13','09:30','13800138002','待赴约','2024-02-10 09:00:00'),
(4,4,4,'宠颐生动物医院','大黄','狗','狗狗需要做绝育手术，希望预约手术时间。','https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/0f292653127b407dbc112114ac2ec4f5.jpg','2024-02-15','10:30','13800138003','待赴约','2024-02-10 16:00:00'),
(5,5,5,'芭比堂动物医院','花花','猫','猫咪眼睛经常流泪，有分泌物，看起来不舒服，想带来检查一下。','https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/46989f440611477bb6cf0f606b3b20a1.jpeg,https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/276f974f5b354255a3f757869af085e0.jpeg','2024-02-14','15:00','13800138004','待赴约','2024-02-11 10:30:00'),
(6,2,6,'安安宠物医院','豆豆','狗','狗狗需要体检和疫苗接种，顺便做个全面检查。','https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/c70981c05f6e478ba6d8c43d62d42e06.jpeg','2024-02-16','11:00','13800138001','已到店','2024-02-11 14:00:00'),
(7,3,1,'爱宠动物医院','球球','猫','猫咪误食了异物，现在不吃不喝，非常着急，请尽快安排。','https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/b0c92c74e0774f32b065a2f7f72e8e33.jpeg','2024-02-09','16:00','13800138002','已完成','2024-02-08 18:00:00'),
(13,2,6,'安安宠物医院','怒鼻子','猫','猫咪不想吃东西，老是打喷嚏、流鼻涕，还发热，精神也不好','https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/c29cf04594a34904bdcd3ec68208010b.jpeg','2025-11-01','15:00','17777777777','待赴约','2025-10-31 13:52:42'),
(14,17,7,'宠福鑫动物医院','多瑞咪','狗','狗狗最近拉肚子了','https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2026/01/03/ab36ea2f27cd46e18e8237c34b1cfff4.jpg','2026-01-04','10:00','18229789960','待赴约','2026-01-03 15:59:38'),
(15,19,5,'芭比堂动物医院','多瑞咪','猫','狗狗做绝育手术','https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2026/01/04/703f8a67e1334d89bbe41765cd8eb5ba.jpg','2026-01-04','12:30','18888888888','已到店','2026-01-04 11:23:45');

/*Table structure for table `breeding_post` */

DROP TABLE IF EXISTS `breeding_post`;
/*寻找配种表*/
CREATE TABLE `breeding_post` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `title` varchar(200) NOT NULL COMMENT '标题',
  `description` varchar(2000) DEFAULT NULL COMMENT '描述',
  `pet_type` varchar(20) NOT NULL COMMENT '宠物类型：狗、猫',
  `pet_gender` varchar(10) NOT NULL COMMENT '宠物性别：公、母',
  `pet_name` varchar(50) NOT NULL COMMENT '宠物名称',
  `breed` varchar(100) NOT NULL COMMENT '品种',
  `vaccine_status` varchar(500) DEFAULT NULL COMMENT '疫苗情况',
  `photos` varchar(2000) DEFAULT NULL COMMENT '照片URL，多个用逗号分隔，最多5个',
  `breeding_requirement` varchar(1000) DEFAULT NULL COMMENT '配种要求',
  `location` varchar(200) DEFAULT NULL COMMENT '地理位置',
  `owner_info` varchar(500) DEFAULT NULL COMMENT '主人信息',
  `status` varchar(20) NOT NULL DEFAULT '寻找中' COMMENT '状态：寻找中、已结束',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='寻找配种表';

/*Data for the table `breeding_post` */

insert  into `breeding_post`(`id`,`user_id`,`title`,`description`,`pet_type`,`pet_gender`,`pet_name`,`breed`,`vaccine_status`,`photos`,`breeding_requirement`,`location`,`owner_info`,`status`,`create_time`) values 
(1,2,'寻找金毛公犬配种','我家金毛母犬小白，2岁，性格温顺，品相优良，希望找一只优秀的金毛公犬配种。狗狗健康状况良好，所有疫苗齐全，已做绝育前体检。希望找到同样品相好、健康的金毛公犬。','狗','母','小白','金毛','已接种狂犬疫苗、犬瘟热疫苗、细小病毒疫苗，疫苗记录齐全','https://images.unsplash.com/photo-1601758228041-f3b2795255f1?w=600,https://images.unsplash.com/photo-1587300003388-59208cc962cb?w=600,https://images.unsplash.com/photo-1543466835-00a7907e9de1?w=600','希望公犬年龄在2-4岁之间，品相优良，性格温顺，有血统证书优先。健康状况良好，疫苗齐全。','北京市朝阳区','主人：张女士，联系方式：13800138001，养犬经验5年，家庭环境优越','寻找中','2024-02-15 10:00:00'),
(2,3,'英短蓝猫寻找配偶','纯种英短蓝猫，公猫，1岁半，毛色纯正，圆脸大眼，性格亲人，寻找品相好的母猫配种。可上门或约定地点。','猫','公','球球','英国短毛猫','已接种猫三联疫苗，狂犬疫苗，定期驱虫','https://images.unsplash.com/photo-1574158622682-e40e69881006?w=600,https://images.unsplash.com/photo-1548802673-380ab8ebc7b7?w=600,https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba?w=600,https://images.unsplash.com/photo-1576201836106-db1758fd1c97?w=600','希望母猫品种纯正，毛色标准，性格温顺，1-3岁之间。健康检查合格，疫苗齐全。可协商配种费用或小猫分配方案。','上海市浦东新区','主人：李先生，微信：liqiuqiu123，有多年养猫经验，家中环境整洁','寻找中','2024-02-16 14:30:00'),
(3,4,'泰迪母犬配种','棕色泰迪犬，母犬，3岁，体重5kg，健康活泼，希望找同品种公犬配种。','狗','母','妞妞','泰迪','疫苗接种完整，每年定期体检','https://images.unsplash.com/photo-1597633425046-08f5110420b5?w=600,https://images.unsplash.com/photo-1623387641168-d9803ddd3f35?w=600','公犬要求：体型适中（4-6kg），毛色纯正，性格温顺，健康状况良好。配种费用可商议。','广州市天河区','主人：王女士，电话：13800138003','寻找中','2024-02-17 09:20:00'),
(4,5,'美短虎斑猫寻找配偶','美短虎斑母猫，2岁，花纹标准，身体健康，性格活泼，寻找优质公猫配种。','猫','母','花花','美国短毛猫','疫苗齐全，定期体检，健康状况良好','https://images.unsplash.com/photo-1581888227599-779811939961?w=600,https://images.unsplash.com/photo-1601758228041-f3b2795255f1?w=600,https://images.unsplash.com/photo-1587300003388-59208cc962cb?w=600','希望公猫品种纯正，花纹清晰，健康状况良好。可提供小猫作为配种费用。','深圳市南山区','主人：赵先生，QQ：123456789，经验丰富的猫主','寻找中','2024-02-18 16:45:00'),
(5,2,'柯基公犬寻找母犬','纯种柯基公犬，2岁半，短腿大耳，性格活泼，希望找同品种母犬配种。','狗','公','豆豆','柯基','所有疫苗已接种，有健康证明','https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/4014cde388b240bba51ad741b4bbbf62.jpeg,https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/25933c1899154ce2b218e1ded3b2b456.jpeg,https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/ca5b757ce11f493794c138a18fb43b03.jpeg,https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/9ff2d54fd94640eb8b5b0a41d520b54b.jpeg','母犬要求2-4岁，品相标准，健康状况良好。配种方式灵活，可协商。','北京市海淀区','主人：张先生，电话：13800138001，家庭饲养','寻找中','2024-02-19 11:00:00'),
(6,3,'哈士奇母犬配种','纯种哈士奇母犬，3岁，蓝眼三火，性格温顺，寻找优秀公犬配种。','狗','母','雪儿','哈士奇','疫苗完整，健康体检合格','https://images.unsplash.com/photo-1614941059122-c7f8b828e5ad?w=600,https://images.unsplash.com/photo-1535930891776-0c2dfb7fda1a?w=600','希望公犬品相优良，眼睛颜色纯正，性格稳定。有血统证书更佳。','成都市武侯区','主人：刘女士，微信：liuxue789','已结束','2024-02-10 10:30:00'),
(7,4,'布偶猫寻找配偶','纯种布偶猫，公猫，2岁，蓝双色，性格温柔，寻找同品种母猫配种。','猫','公','王子','布偶猫','疫苗齐全，定期驱虫和体检','https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/978a9c4a554442e98a7f8ebccfa9e621.jpeg,https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/492a6549415d467583887addd6e88875.jpeg,https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/49c2dd9029b34f6b8f8015ec72a5c6b4.jpeg','母猫要求品相标准，毛色纯正，性格温顺。可提供优质的配种服务。','杭州市西湖区','主人：周先生，电话：13900139000','寻找中','2024-02-20 15:20:00');

/*Table structure for table `cart` */

DROP TABLE IF EXISTS `cart`;
/*购物车表*/
CREATE TABLE `cart` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `product_id` bigint NOT NULL COMMENT '商品ID',
  `quantity` int NOT NULL DEFAULT '1' COMMENT '数量',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='购物车表';

/*Data for the table `cart` */

insert  into `cart`(`id`,`user_id`,`product_id`,`quantity`,`create_time`) values 
(1,2,1,2,'2024-01-20 10:00:00'),
(2,2,3,1,'2024-01-20 11:00:00'),
(3,2,6,1,'2024-01-20 12:00:00'),
(4,3,2,1,'2024-01-21 10:00:00'),
(5,3,4,2,'2024-01-21 11:00:00'),
(6,4,1,1,'2024-01-22 10:00:00'),
(7,4,7,2,'2024-01-22 11:00:00'),
(9,17,15,1,'2025-12-06 14:23:58'),
(11,19,15,2,'2026-01-04 11:20:53'),
(12,19,2,2,'2026-01-10 10:30:15');

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;
/*商品分类表*/
CREATE TABLE `category` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(50) NOT NULL COMMENT '分类名称',
  `description` varchar(500) DEFAULT NULL COMMENT '分类描述',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='商品分类表';

/*Data for the table `category` */

insert  into `category`(`id`,`name`,`description`,`create_time`) values 
(1,'宠物食品','各类宠物的主粮、零食、营养品等','2024-01-01 10:00:00'),
(2,'宠物用品','宠物日常使用的各类用品，如玩具、窝垫等','2024-01-01 11:00:00'),
(3,'宠物医疗','宠物医疗用品、保健品、药品等','2024-01-01 12:00:00'),
(4,'宠物清洁','宠物洗护、清洁、除臭等用品','2024-01-01 13:00:00'),
(5,'宠物服饰','宠物衣服、配饰、装扮用品等','2024-01-01 14:00:00'),
(6,'宠物出行','宠物外出用品，如背包、牵引绳等','2024-01-01 15:00:00'),
(7,'宠物训练','宠物训练用品和辅助工具','2024-01-01 16:00:00');

/*Table structure for table `forum_post` */

DROP TABLE IF EXISTS `forum_post`;
/*论坛帖子表*/
CREATE TABLE `forum_post` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `title` varchar(200) NOT NULL COMMENT '标题',
  `description` varchar(500) DEFAULT NULL COMMENT '描述',
  `content` text NOT NULL COMMENT '正文',
  `images` varchar(2000) DEFAULT NULL COMMENT '图片URL，多个用逗号分隔，最多5个',
  `keywords` varchar(200) DEFAULT NULL COMMENT '关键词',
  `user_id` bigint NOT NULL COMMENT '发布者ID',
  `username` varchar(50) NOT NULL COMMENT '发布者用户名',
  `like_count` int NOT NULL DEFAULT '0' COMMENT '点赞数',
  `comment_count` int NOT NULL DEFAULT '0' COMMENT '评论数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='论坛帖子表';

/*Data for the table `forum_post` */

insert  into `forum_post`(`id`,`title`,`description`,`content`,`images`,`keywords`,`user_id`,`username`,`like_count`,`comment_count`,`create_time`) values 
(1,'分享我家金毛的日常训练心得','通过科学的训练方法，让金毛变得更加听话懂事','大家好！我家金毛小白现在2岁了，从小狗到现在的乖巧懂事，我总结了一些训练心得分享给大家。\n\n首先是基础口令训练：坐下、趴下、握手这些基本动作一定要在幼犬时期就开始训练。每次训练时间不要太长，10-15分钟为宜，用零食作为奖励效果最好。\n\n其次是社会化训练：要经常带狗狗出门，接触不同的人和环境，这样狗狗长大后不会胆小或者过度兴奋。\n\n最后是耐心和坚持：训练狗狗不是一蹴而就的，需要主人有足够的耐心，坚持每天训练，才能看到效果。\n\n希望我的经验能帮到大家！','https://images.unsplash.com/photo-1601758228041-f3b2795255f1?w=600,https://images.unsplash.com/photo-1587300003388-59208cc962cb?w=600,https://images.unsplash.com/photo-1543466835-00a7907e9de1?w=600','金毛,训练,经验分享',2,'宠物爱好者小王',26,9,'2024-02-20 10:00:00'),
(2,'猫咪挑食怎么办？实用方法分享','针对猫咪挑食问题的解决方案和预防措施','最近很多猫友问我猫咪挑食的问题，我家球球之前也经历过这个阶段，现在分享一下我的解决方法：\n\n1. 定时定量喂食：每天固定时间喂食，每次放下食物30分钟后就收走，不管吃没吃完。这样可以培养猫咪的饥饿感。\n\n2. 不要频繁换粮：有些主人看到猫咪不吃就换粮，这样反而会让猫咪越来越挑食。选定一款优质猫粮后要坚持喂食。\n\n3. 减少零食：零食给太多会影响正餐食欲，建议零食只在训练或者特殊情况下给予。\n\n4. 增加运动量：多陪猫咪玩耍，增加运动量可以提高食欲。\n\n5. 适当添加罐头或冻干：如果猫咪实在不吃，可以在猫粮中混入少量罐头或冻干，慢慢减少比例。\n\n希望对大家有帮助！','https://images.unsplash.com/photo-1574158622682-e40e69881006?w=600,https://images.unsplash.com/photo-1548802673-380ab8ebc7b7?w=600','猫咪,挑食,喂养经验',3,'猫咪达人小李',42,15,'2024-02-21 14:30:00'),
(3,'新手养狗必备物品清单','给准备养狗的新手朋友们整理的物品清单','作为一个养狗5年的老铲屎官，今天给大家整理一份新手养狗必备物品清单：\n\n【饮食类】\n- 狗粮：选择适合狗狗年龄和体型的优质狗粮\n- 食盆水盆：不锈钢材质最好，易清洗\n- 自动饮水器：保证狗狗随时有干净的水喝\n\n【日用品】\n- 狗窝/狗垫：给狗狗一个舒适的休息空间\n- 牵引绳：外出必备，保证安全\n- 项圈/胸背带：根据狗狗体型选择\n- 玩具：磨牙玩具、互动玩具等\n\n【清洁用品】\n- 宠物沐浴露：温和配方\n- 梳子：根据毛发类型选择\n- 指甲剪：定期修剪指甲\n- 宠物湿巾：日常清洁\n\n【医疗保健】\n- 体外驱虫药：预防寄生虫\n- 体内驱虫药：定期驱虫\n- 宠物急救箱：碘伏、纱布等\n\n希望能帮到准备养狗的朋友们！','https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba?w=600,https://images.unsplash.com/photo-1576201836106-db1758fd1c97?w=600','新手养狗,物品清单,经验分享',2,'宠物爱好者小王',38,12,'2024-02-22 09:00:00'),
(4,'猫咪呕吐的常见原因和应对方法','详细分析猫咪呕吐的各种情况和处理方式','猫咪呕吐是比较常见的问题，但很多新手铲屎官会很紧张。今天我来科普一下猫咪呕吐的常见原因：\n\n【正常情况的呕吐】\n1. 吐毛球：猫咪舔毛后会吐出毛球，这是正常现象。可以喂化毛膏或猫草帮助排出。\n2. 吃太快：有些猫咪进食太快会呕吐未消化的食物，这种情况可以少食多餐。\n\n【需要注意的呕吐】\n1. 肠胃炎：如果呕吐物带血或呈黄绿色，需要立即就医。\n2. 食物过敏：更换猫粮后频繁呕吐，可能是食物过敏。\n3. 误食异物：如果猫咪精神萎靡且持续呕吐，可能是误食异物。\n\n【应对方法】\n- 轻微呕吐：禁食4-6小时，观察情况\n- 频繁呕吐：立即就医\n- 预防措施：定期驱虫、选择优质猫粮、避免突然换粮\n\n希望大家的猫咪都健健康康的！','https://images.unsplash.com/photo-1614941059122-c7f8b828e5ad?w=600','猫咪健康,呕吐,医疗知识',5,'宠物医生小刘',56,20,'2024-02-23 16:00:00'),
(5,'分享我家泰迪的美容造型','专业美容师给泰迪做的几种造型分享','大家好！我家泰迪妞妞最近去做了美容，美容师给推荐了几种造型，效果都很棒，分享给大家：\n\n【泰迪装】\n最经典的造型，头部修成圆形，身体毛发留长，四肢修剪整齐。适合毛量丰富的泰迪。\n\n【运动装】\n整体毛发剪短，清爽利落，适合夏天。打理方便，不容易打结。\n\n【羊羔装】\n身体毛发留长，头部、四肢修剪短，看起来像小羊一样可爱。\n\n【日式造型】\n耳朵留长，身体修剪成圆润的形状，非常萌。\n\n美容小贴士：\n- 建议1-2个月做一次美容\n- 日常要经常梳毛，防止打结\n- 洗澡后一定要吹干，避免皮肤病\n- 定期修剪指甲和脚底毛\n\n大家也可以分享自己家宠物的造型哦！','https://images.unsplash.com/photo-1535930891776-0c2dfb7fda1a?w=600,https://images.unsplash.com/photo-1617791160536-598cf32026fb?w=600','泰迪,美容,造型分享',4,'萌宠小管家小赵',31,10,'2024-02-24 11:30:00'),
(6,'宠物保险真的有必要买吗？','分析宠物保险的利弊和适用情况','最近考虑给家里的狗狗买保险，研究了一番后跟大家分享一下：\n\n【宠物保险的优势】\n1. 降低医疗费用：宠物看病很贵，保险可以报销大部分费用\n2. 意外保障：涵盖意外伤害、骨折等突发情况\n3. 疾病保障：慢性病、传染病等治疗费用\n4. 责任险：宠物伤人可以赔付\n\n【需要注意的点】\n1. 等待期：一般有30-90天等待期\n2. 免赔额：单次理赔可能有免赔额\n3. 年龄限制：老年宠物可能无法投保\n4. 既往病史：之前的疾病不予理赔\n\n【个人建议】\n- 品种狗、易生病的宠物建议购买\n- 年轻健康的宠物可以考虑\n- 注意看清保险条款，选择正规公司\n- 日常预防比治疗更重要\n\n大家有什么看法欢迎讨论！','https://images.unsplash.com/photo-1628009368231-7bb7cfcb0def?w=600','宠物保险,保障,讨论',3,'猫咪达人小李',46,19,'2024-02-25 15:00:00'),
(7,'夏天如何给宠物降温？','分享夏季宠物防暑降温的实用方法','随着天气越来越热，宠物也容易中暑，今天分享一些降温方法：\n\n【物理降温】\n1. 冰垫、凉席：给宠物准备凉爽的休息地\n2. 冰块玩具：在玩具里放冰块，让宠物玩\n3. 湿毛巾：用湿毛巾擦拭宠物身体\n4. 风扇、空调：保持室内凉爽\n\n【饮食调节】\n1. 充足饮水：多处放水盆，保证随时能喝到水\n2. 适量水果：西瓜、苹果等含水量高的水果\n3. 湿粮：适当增加湿粮比例\n\n【注意事项】\n1. 避免在最热的时段遛狗（11:00-16:00）\n2. 不要把宠物留在车里\n3. 剃毛要适度，不要剃光\n4. 注意观察中暑症状：喘气急促、流口水、体温升高\n\n【中暑急救】\n如果发现中暑，立即转移到阴凉处，用冷水降温，及时就医！\n\n希望所有毛孩子都能安全度夏！','https://images.unsplash.com/photo-1583511655857-d19b40a7a54e?w=600,https://images.unsplash.com/photo-1625316708582-7c38734be31d?w=600','夏季护理,降温,健康',2,'宠物爱好者小王',54,16,'2024-02-26 10:30:00'),
(8,'多猫家庭如何避免猫咪打架？','多猫家庭和谐相处的秘诀','我家现在养了三只猫，从最初的打架到现在和平相处，总结了一些经验：\n\n【新猫进家的正确方式】\n1. 隔离期：新猫单独隔离1-2周，让它们闻到对方气味\n2. 交换气味：用毛巾擦拭不同的猫，交换给对方闻\n3. 视觉接触：用笼子或门缝让它们互相看到\n4. 短暂接触：在监督下短暂接触，有攻击倾向立即分开\n5. 逐步融合：慢慢增加接触时间\n\n【资源分配】\n1. 猫砂盆：数量 = 猫数量 + 1\n2. 食盆水盆：每只猫单独的食盆\n3. 猫爬架：提供足够的垂直空间\n4. 藏身处：每只猫都要有自己的藏身之所\n\n【日常管理】\n1. 公平对待：不要偏心某只猫\n2. 分散注意力：用玩具、零食转移注意力\n3. 绝育：未绝育的猫更容易打架\n\n【打架应对】\n轻微打闹：不用干预，这是在建立等级\n激烈打架：用水枪、声音制止，隔离冷静\n\n希望大家的多猫家庭都能和谐相处！','https://images.unsplash.com/photo-1548681528-6a5c45b66b42?w=600,https://images.unsplash.com/photo-1598387181032-a3103a2db5b3?w=600,https://images.unsplash.com/photo-1603147627908-79013d8e3be1?w=600','多猫家庭,相处,经验分享',3,'猫咪达人小李',44,16,'2024-02-27 13:00:00');

/*Table structure for table `forum_post_comment` */

DROP TABLE IF EXISTS `forum_post_comment`;
/*论坛帖子评论表*/
CREATE TABLE `forum_post_comment` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `post_id` bigint NOT NULL COMMENT '帖子ID',
  `content` varchar(1000) NOT NULL COMMENT '评论内容',
  `user_id` bigint NOT NULL COMMENT '评论者ID',
  `username` varchar(50) NOT NULL COMMENT '评论者用户名',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='论坛帖子评论表';

/*Data for the table `forum_post_comment` */

insert  into `forum_post_comment`(`id`,`post_id`,`content`,`user_id`,`username`,`create_time`) values 
(1,1,'非常实用的训练方法！我也要试试这样训练我家狗狗。',3,'猫咪达人小李','2024-02-20 11:30:00'),
(2,1,'请问训练的时候用什么零食比较好？',4,'萌宠小管家小赵','2024-02-20 14:00:00'),
(3,1,'我家金毛也是这样训练的，确实很有效果！',5,'宠物医生小刘','2024-02-20 15:30:00'),
(4,2,'我家猫咪也挑食，试试你的方法！',2,'宠物爱好者小王','2024-02-21 15:30:00'),
(5,2,'定时定量真的很重要，我家猫咪就是这样改过来的。',4,'萌宠小管家小赵','2024-02-21 16:30:00'),
(6,2,'感谢分享！非常有帮助。',5,'宠物医生小刘','2024-02-21 17:30:00'),
(7,3,'清单很全面，已收藏！',3,'猫咪达人小李','2024-02-22 10:30:00'),
(8,3,'请问有推荐的狗粮品牌吗？',4,'萌宠小管家小赵','2024-02-22 11:30:00'),
(9,3,'新手养狗必看！',5,'宠物医生小刘','2024-02-22 13:00:00'),
(10,4,'专业！学到了很多知识。',2,'宠物爱好者小王','2024-02-23 17:30:00'),
(11,4,'我家猫咪前几天也吐了，还好不严重。',3,'猫咪达人小李','2024-02-23 18:30:00'),
(12,4,'宠物医生的科普就是专业，点赞！',4,'萌宠小管家小赵','2024-02-23 19:30:00'),
(13,5,'泰迪装最可爱了！',2,'宠物爱好者小王','2024-02-24 12:30:00'),
(14,5,'我家泰迪也是这个造型，很萌。',3,'猫咪达人小李','2024-02-24 13:30:00'),
(15,5,'请问美容大概多少钱？',5,'宠物医生小刘','2024-02-24 14:30:00'),
(16,1,'非常不错的分享，效果很好',2,'user001','2025-10-31 16:00:05'),
(17,6,'有必要购买，这是一道保障',2,'user001','2025-12-10 17:13:41'),
(18,7,'非常有用的经验分享',18,'xiaoming','2026-01-04 09:23:58'),
(19,7,'太棒了，感谢楼主分享',19,'zhaomin','2026-01-10 22:10:00');

/*Table structure for table `forum_post_like` */

DROP TABLE IF EXISTS `forum_post_like`;
/*论坛帖子收藏表*/
CREATE TABLE `forum_post_like` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `post_id` bigint NOT NULL COMMENT '帖子ID',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='论坛帖子点赞表';

/*Data for the table `forum_post_like` */

insert  into `forum_post_like`(`id`,`post_id`,`user_id`,`create_time`) values 
(1,1,3,'2024-02-20 11:00:00'),
(2,1,4,'2024-02-20 12:00:00'),
(3,1,5,'2024-02-20 13:00:00'),
(4,2,2,'2024-02-21 15:00:00'),
(5,2,4,'2024-02-21 16:00:00'),
(6,2,5,'2024-02-21 17:00:00'),
(7,3,3,'2024-02-22 10:00:00'),
(8,3,4,'2024-02-22 11:00:00'),
(9,3,5,'2024-02-22 12:00:00'),
(10,4,2,'2024-02-23 17:00:00'),
(11,4,3,'2024-02-23 18:00:00'),
(12,4,4,'2024-02-23 19:00:00'),
(13,5,2,'2024-02-24 12:00:00'),
(14,5,3,'2024-02-24 13:00:00'),
(15,5,5,'2024-02-24 14:00:00'),
(16,1,2,'2025-10-31 15:59:28'),
(18,6,2,'2025-12-10 17:13:28'),
(19,7,18,'2026-01-04 09:23:37'),
(20,7,19,'2026-01-10 22:09:50'),
(27,8,2,'2026-01-19 14:33:28');

/*Table structure for table `foster_post` */

DROP TABLE IF EXISTS `foster_post`;
/*宠物领养表*/
CREATE TABLE `foster_post` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `title` varchar(200) NOT NULL COMMENT '标题',
  `description` varchar(2000) DEFAULT NULL COMMENT '描述',
  `pet_type` varchar(20) NOT NULL COMMENT '宠物类型：狗、猫',
  `pet_gender` varchar(10) NOT NULL COMMENT '宠物性别：公、母',
  `pet_name` varchar(50) NOT NULL COMMENT '宠物名称',
  `breed` varchar(100) NOT NULL COMMENT '品种',
  `vaccine_status` varchar(500) DEFAULT NULL COMMENT '疫苗情况',
  `photos` varchar(2000) DEFAULT NULL COMMENT '照片URL，多个用逗号分隔，最多5个',
  `foster_requirement` varchar(1000) DEFAULT NULL COMMENT '寄养要求',
  `location` varchar(200) DEFAULT NULL COMMENT '地理位置',
  `owner_info` varchar(500) DEFAULT NULL COMMENT '主人信息',
  `status` varchar(20) NOT NULL DEFAULT '寻找中' COMMENT '状态：寻找中、已结束',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='寻找寄养表';

/*Data for the table `foster_post` */

insert  into `foster_post`(`id`,`user_id`,`title`,`description`,`pet_type`,`pet_gender`,`pet_name`,`breed`,`vaccine_status`,`photos`,`foster_requirement`,`location`,`owner_info`,`status`,`create_time`) values 
(1,2,'金毛寻找寄养家庭','我家金毛小白，2岁，性格温顺乖巧，不吵不闹，因工作原因需要出差一个月，希望找一个有爱心有经验的家庭临时寄养。狗狗健康状况良好，所有疫苗齐全，有良好的生活习惯，会定时定点排便。','狗','母','小白','金毛','已接种狂犬疫苗、犬瘟热疫苗、细小病毒疫苗，疫苗记录齐全，定期驱虫','https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/0a4ab2c37dc54103bf1b124c2c79f2de.jpeg,https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/1f8fcba16f8e472585ab25b610260c03.jpeg,https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/5dd9ae2caabf4b1b9b46813dd6708fce.jpeg,https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/24aac4c63af74d278828d1e5a675d720.jpeg','希望寄养家庭有养狗经验，家中环境干净整洁，有足够的活动空间。能够每天遛狗两次，提供优质狗粮和充足的水。有独立的休息区域，能够定期和主人反馈狗狗的情况。寄养费用可协商。','北京市朝阳区','主人：张女士，联系方式：13800138001，微信：zhangsan2024，养犬经验5年','寻找中','2024-02-15 10:00:00'),
(2,3,'英短蓝猫寄养','纯种英短蓝猫球球，公猫，1岁半，毛色纯正，圆脸大眼，性格亲人温顺。因为要回老家过年一个月，需要找靠谱的家庭寄养。猫咪很乖，不会乱抓家具，会使用猫砂盆，吃猫粮不挑食。','猫','公','球球','英国短毛猫','已接种猫三联疫苗，狂犬疫苗，定期驱虫，有疫苗本','https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/3a1bd13402a64b6ba5a3638ba1fa5661.jpg,https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/7753796e360f4306af096cd80ad99889.jpg,https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/42f99f0a25cf401ebdcd8b68caac4f64.jpg','希望寄养家庭有养猫经验，家中无其他宠物或宠物性格温和。能够提供安静的环境，保证猫咪安全，不要让猫咪外出。每天铲屎两次，提供优质猫粮和干净的水。能够每天拍照发给主人看猫咪情况。寄养费用面议。','上海市浦东新区','主人：李先生，电话：13800138002，微信：liqiuqiu123，有5年养猫经验','寻找中','2024-02-16 14:30:00'),
(3,4,'泰迪犬短期寄养','棕色泰迪妞妞，母犬，3岁，体重5kg，健康活泼，性格开朗。因家中装修需要寄养两周时间。狗狗很听话，不乱叫，和人类小孩相处很好。','狗','母','妞妞','泰迪','疫苗接种完整，每年定期体检，健康证明齐全','https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/220a0c844ea94eb296dbce1f95406e7e.jpeg,https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/2a3b7c04c98f44f794e8e6610a2c23e8.jpeg,https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/251c3df694c64c64bcb3851f5079df2f.jpeg','希望寄养家庭有耐心，能够每天遛狗1-2次。提供小型犬专用狗粮，保持环境卫生。不要让狗狗单独在家超过4小时。如有问题及时联系主人。按天计费，费用合理。','广州市天河区','主人：王女士，电话：13800138003，可随时联系','寻找中','2024-02-17 09:20:00'),
(4,5,'美短虎斑猫求寄养','美短虎斑母猫花花，2岁，花纹标准，身体健康，性格活泼但不闹腾。主人要出国学习3个月，需要找长期可靠的寄养家庭。猫咪适应能力强，和其他猫也能相处。','猫','母','花花','美国短毛猫','疫苗齐全，定期体检，健康状况良好，有完整的医疗记录','https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/52eb63e0ab5c4c03a3389727f659ed93.jpeg,https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/b592b2c8414b4c6896e0ca890d16f3c8.jpeg,https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/5a617b03c3134d6f89b501dd394c73be.jpeg','希望寄养家庭有养猫经验，家中环境安全。每天清理猫砂，提供优质猫粮和零食。有猫爬架等娱乐设施更佳。定期拍视频发给主人。长期寄养可按月付费，价格好商量。','深圳市南山区','主人：赵先生，微信：zhaoliu666，QQ：123456789','寻找中','2024-02-18 16:45:00'),
(5,2,'柯基犬寻找临时寄养','纯种柯基豆豆，公犬，2岁半，短腿大耳，性格活泼友善。因家中有事需要回老家一周，希望找个临时寄养的地方。狗狗非常乖巧，不会随地大小便。','狗','公','豆豆','柯基','所有疫苗已接种，有健康证明和疫苗本','https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/3b8f06af4b09433080de3f018107db94.jpeg,https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/34c448f8fdcd4343b36d4c8825a5e0b6.jpeg,https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/e93894e012314709884f818aa8c0ab8a.jpeg','希望寄养家庭住在北京，交通方便。每天遛狗2次，提供狗粮和零食（主人提供）。能够保证狗狗安全，不要让狗狗和陌生狗接触。价格面议，可以当面详谈。','北京市海淀区','主人：张先生，电话：13800138001，随时可联系','寻找中','2024-02-19 11:00:00'),
(6,3,'波斯猫寄养求助','纯白波斯猫雪儿，母猫，3岁，性格温顺安静。主人因工作调动需要寄养2个月。猫咪很安静，喜欢睡觉，不会乱叫。需要每天梳毛。','猫','母','雪儿','波斯猫','疫苗完整，健康体检合格，有医疗记录本','https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/0d783455b3a24126941a92b814f3feea.jpeg,https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/3e1d07cd78f44cd3a7b1a997c45b1759.jpeg,https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/373ba2f6858f406aaa5fe91b84ee53ab.jpeg','希望寄养家庭有养长毛猫的经验，能够每天梳毛。保持环境干净，提供优质猫粮。定期清理猫砂，保持猫咪整洁。能够定期拍照反馈。寄养费用可按月结算。','成都市武侯区','主人：刘女士，微信：liuxue789，电话：13900139000','已结束','2024-02-10 10:30:00'),
(7,4,'布偶猫长期寄养','纯种布偶猫王子，公猫，2岁，蓝双色，性格温柔粘人。因主人要出国工作一年，需要找长期寄养家庭。猫咪很听话，喜欢和人互动。','猫','公','王子','布偶猫','疫苗齐全，定期驱虫和体检，健康状况优秀','https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/0db67ac4ee0d4fa1902fd8222d4c68b4.jpeg,https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/19fef6980f984fe490728ea0d02744e0.jpeg,https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/c316b877f94f4510a07f1cf36e1bf934.jpeg','希望寄养家庭非常有爱心和耐心，有养布偶猫的经验。能够提供宽敞舒适的环境，每天陪伴猫咪玩耍。提供进口猫粮，保持猫咪毛发光泽。定期视频通话让主人看到猫咪。长期寄养费用优厚，可月付或季付。','杭州市西湖区','主人：周先生，电话：188888888，微信：zhouwangzi','寻找中','2024-02-20 15:20:00');

/*Table structure for table `hospital` */

DROP TABLE IF EXISTS `hospital`;
/*宠物医院表*/
CREATE TABLE `hospital` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `images` varchar(2000) DEFAULT NULL COMMENT '医院图片URL，多个用逗号分隔，最多5个',
  `name` varchar(200) NOT NULL COMMENT '医院名称',
  `introduction` varchar(2000) DEFAULT NULL COMMENT '医院介绍',
  `services` varchar(500) DEFAULT NULL COMMENT '服务项目，多个标签用逗号分隔',
  `address` varchar(500) NOT NULL COMMENT '医院地址',
  `phone` varchar(50) NOT NULL COMMENT '联系电话',
  `business_hours` varchar(200) NOT NULL COMMENT '营业时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='宠物医院表';

/*Data for the table `hospital` */

insert  into `hospital`(`id`,`images`,`name`,`introduction`,`services`,`address`,`phone`,`business_hours`,`create_time`) values 
(1,'https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/2c2a4eb515a7489dadb5a80cd287ce45.jpg,https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/5736e90b6b99430e9375f611cc049892.jpg,https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/0a4f4d5bc21444b183174739c77aff9b.jpg','爱宠动物医院','爱宠动物医院是一家集宠物医疗、美容、寄养为一体的综合性宠物医院。医院拥有先进的医疗设备和专业的医疗团队，致力于为每一位宠物提供优质的医疗服务。我们秉承\"用心呵护每一个生命\"的服务理念，为宠物健康保驾护航。配备有数字X光机、彩色B超、血液生化分析仪、心电监护仪等先进设备，可进行各类疾病的精准诊断和治疗。','疾病诊疗,疫苗接种,体检,手术,美容,寄养','北京市朝阳区建国路88号宠物大厦3层','010-12345678','周一至周日 08:00-20:00','2024-01-10 09:00:00'),
(2,'https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/6809a13356dc451fb4ab56f1e39a5687.jpeg,https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/bdda9742da344a05a87cc4ac3c4e038d.jpg,https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/fd6bd46dae6a46b1a4c1f1b4b948c126.jpg,https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/b6945b59b3dc4110b93ccd7bc43097e6.jpg','康宁宠物医疗中心','康宁宠物医疗中心是上海知名的宠物医疗机构，拥有20年的行业经验。医院配备了国际领先的宠物医疗设备，包括DR数字影像系统、全自动生化分析仪、血球计数仪、尿液分析仪等，能够为宠物提供全方位的医疗服务。我们的专家团队均有海外留学背景，医疗技术精湛，在骨科、眼科、皮肤科等专科领域有深入研究。医院环境整洁舒适，候诊区设有独立的犬猫候诊室，手术室达到洁净手术室标准。','内科,外科,骨科,眼科,牙科,影像诊断,实验室检查','上海市浦东新区世纪大道100号','021-87654321','周一至周日 24小时营业','2024-01-11 10:00:00'),
(3,'https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/b1e910238f0f4293868539458ee16998.jpeg,https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/703205c5548a4bc596574b43e7cd41ad.jpeg','瑞派宠物医院','瑞派宠物医院是中国领先的宠物医疗连锁品牌，致力于为宠物提供高品质的医疗服务。医院环境舒适，设施齐全，拥有专业的医疗团队和完善的医疗设备。我们提供从预防保健到疾病治疗的全流程服务，让您的爱宠得到最好的照顾。医院提供24小时急诊服务，配备专业的急诊医生和设备，随时为您的爱宠提供紧急救治。还开设中兽医科室，采用针灸、中药等传统疗法，为宠物提供更多治疗选择。','疾病诊疗,预防保健,手术,住院,急诊,中兽医','广州市天河区天河路123号','020-55556666','周一至周日 08:30-21:00','2024-01-12 11:00:00'),
(4,'https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/05c0f135262e47998c30d8acecd7f992.png,https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/34fd97fe904c4138be95b016b367d2a7.jpeg,https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/0f81fa2da4bc441a9622a00780461f0c.jpeg,https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/25d91e24d1974886a9cf5c36a84d424a.jpeg','宠颐生动物医院','宠颐生动物医院专注于宠物健康管理和疾病治疗，拥有多名执业兽医师和专业护理团队。医院设有独立的诊疗室、手术室、住院部，为宠物提供安全、舒适的医疗环境。我们注重医疗质量和服务品质，赢得了众多宠物主人的信赖。医院特别注重术后护理，住院部配备24小时监护系统，专业护理人员全天候照看住院宠物，确保宠物得到最好的康复护理。','内科,外科,绝育手术,疫苗,驱虫,洗牙','深圳市南山区科技园路666号','0755-33334444','周一至周日 09:00-19:00','2024-01-13 12:00:00'),
(5,'https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/b34df2559b844a05b8a611724fcdb7d0.jpg,https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/9da56a6cf4fe4a72b1adeaa712d229e0.jpg,https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/ad407aa7d23f47cba1a6fd720d9b9126.jpg,https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/190a9c8890d442318a0a942d4431ab83.jpg','芭比堂动物医院','芭比堂动物医院是一家专注于犬猫医疗的专科医院，拥有先进的诊疗设备和资深的医疗团队。医院提供全面的宠物医疗服务，包括内科、外科、皮肤科、眼科等多个科室。我们坚持\"专业、专注、专心\"的服务理念，为您的爱宠提供最优质的医疗保障。皮肤科配备皮肤镜、真菌培养设备等专业仪器，可精准诊断各类皮肤病。眼科配备眼压计、眼底镜等设备，为眼科疾病提供专业诊疗。','内科,外科,皮肤科,眼科,耳科,化验检查,住院观察','成都市武侯区人民南路四段888号','028-88889999','周一至周日 08:00-22:00','2024-01-14 13:00:00'),
(6,'https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/f871dcc3718a4d60b8339eefa78b31e2.jpg,https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/5353787d83264c6a96106c6bfb665189.jpeg,https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/08a28a55177e4279a5c347661549a580.jpg,https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/34a45a2f73ee421ea602529596221202.jpeg','安安宠物医院','安安宠物医院是一家温馨的社区型宠物医院，为周边居民的爱宠提供便捷的医疗服务。医院虽小但设备齐全，医生经验丰富，对每一位宠物都像对待家人一样细心呵护。我们提供免费的健康咨询，让您的宠物健康成长。医院坚持亲民价格，让更多普通家庭的宠物也能享受到优质的医疗服务。定期举办宠物健康知识讲座，帮助宠物主人学习科学养宠知识。','疾病诊疗,疫苗接种,体检,美容护理,健康咨询','杭州市西湖区文二路200号','0571-77778888','周一至周六 09:00-18:00','2024-01-15 14:00:00'),
(7,'https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/ace0c67e2b8a4d4f9baf72b15e104596.jpeg,https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/3f91442ca1bb472fa65f1fcf6d19293e.jpg,https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/2a7566a8dc2e40d7a822e6820ded9525.jpg','宠福鑫动物医院','宠福鑫动物医院是一家专业的宠物医疗机构，拥有现代化的医疗设施和温馨的就诊环境。医院提供全科诊疗、专科手术、住院护理等多项服务。我们的医疗团队具有丰富的临床经验，能够快速准确地诊断和治疗各类宠物疾病，让您的爱宠尽快康复。医院特设康复理疗中心，引进宠物水疗设备、激光治疗仪等康复设备，为术后恢复、关节疾病、肌肉损伤等提供专业的康复治疗服务。','全科诊疗,专科手术,住院护理,影像检查,实验室检测,康复理疗','武汉市江汉区解放大道500号','027-66665555','周一至周日 24小时营业','2024-01-16 15:00:00');

/*Table structure for table `insurance` */

DROP TABLE IF EXISTS `insurance`;
/*宠物保险表*/
CREATE TABLE `insurance` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(200) NOT NULL COMMENT '保险名称',
  `detail` varchar(2000) DEFAULT NULL COMMENT '保险详情',
  `price` decimal(10,2) NOT NULL COMMENT '价格/年',
  `coverage` varchar(1000) DEFAULT NULL COMMENT '保险范围',
  `claim_notice` varchar(2000) DEFAULT NULL COMMENT '理赔须知',
  `claim_limit` varchar(200) DEFAULT NULL COMMENT '理赔限额',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='宠物保险表';

/*Data for the table `insurance` */

insert  into `insurance`(`id`,`name`,`detail`,`price`,`coverage`,`claim_notice`,`claim_limit`,`create_time`) values 
(1,'宠物健康综合保险','为您的宠物提供全面的健康保障，涵盖意外伤害、疾病治疗、住院费用等多项保障内容。投保简单，理赔快捷，让您和爱宠无忧。',699.00,'意外伤害医疗、疾病医疗、住院津贴、手术费用、药品费用','需提供正规医院就诊证明和发票；意外事故需在48小时内报案；疾病治疗需等待期30天；理赔材料需完整真实；单次理赔金额超过5000元需提供详细医疗记录','年度累计赔付限额50000元，单次赔付不超过20000元','2024-01-10 09:00:00'),
(2,'宠物意外伤害保险','专门针对宠物意外伤害设计的保险产品，保障范围包括跌落、碰撞、咬伤、烧伤等各类意外事故造成的医疗费用。',399.00,'意外伤害医疗、意外骨折治疗、意外烧烫伤、误食中毒治疗','意外事故需在24小时内报案；需提供事故现场照片或证明；医疗费用凭正规发票报销；等待期7天','年度累计赔付限额30000元，单次赔付不超过10000元','2024-01-11 10:00:00'),
(3,'宠物疾病医疗保险','针对宠物常见疾病提供医疗保障，涵盖呼吸道疾病、消化系统疾病、皮肤病、传染病等多种疾病的治疗费用。',899.00,'疾病门诊、疾病住院、疾病手术、传染病治疗、慢性病治疗','等待期60天；需在指定医院就诊；提供完整病历和检查报告；预防性治疗不在保障范围；既往病史不予赔付','年度累计赔付限额80000元，单次赔付不超过30000元','2024-01-12 11:00:00'),
(4,'宠物责任险','为宠物造成的第三方人身伤害或财产损失提供赔偿保障，让宠物主人免除后顾之忧，安心养宠。',299.00,'第三方人身伤害、第三方财产损失、法律诉讼费用、紧急医疗费用','事故发生后立即报案；配合保险公司调查；提供事故证明材料；不包含故意行为造成的损失','年度累计赔付限额100000元，单次赔付不超过50000元','2024-01-13 12:00:00'),
(5,'宠物手术费用保险','专门保障宠物手术费用的保险产品，涵盖各类外科手术、骨科手术、绝育手术等医疗费用。',599.00,'外科手术、骨科手术、绝育手术、肿瘤切除手术、麻醉费用、术后护理','需在指定医院进行手术；提供手术通知单和费用清单；等待期90天；美容性手术不在保障范围','年度累计赔付限额60000元，单次手术赔付不超过25000元','2024-01-14 13:00:00'),
(6,'宠物全面保障计划','集健康、意外、责任于一体的全方位保险方案，为您的爱宠提供最全面的保护，是宠物主人的最佳选择。',1299.00,'意外伤害、疾病医疗、手术费用、住院津贴、第三方责任、宠物走失找寻','全面保障需提供宠物健康证明；等待期30天；理赔时需提供完整材料；特殊疾病需额外审核；走失需在24小时内报案','年度累计赔付限额150000元，单次赔付不超过50000元','2024-01-15 14:00:00'),
(7,'宠物门诊保险','针对宠物日常门诊就医费用提供保障，包括疫苗接种、体检、常规治疗等费用，降低养宠成本。',499.00,'门诊治疗、疫苗接种、健康体检、药品费用、化验检查','需在保险公司指定医院就诊；提供门诊发票和病历；单次门诊费用超过500元需提前报备；保健品不在保障范围','年度累计赔付限额15000元，单次门诊赔付不超过2000元','2024-01-16 15:00:00');

/*Table structure for table `insurance_claim` */

DROP TABLE IF EXISTS `insurance_claim`;
/*申保记录表*/
CREATE TABLE `insurance_claim` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `claim_no` varchar(50) NOT NULL COMMENT '理赔编号',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `order_id` bigint NOT NULL COMMENT '保险订单ID',
  `insurance_name` varchar(200) NOT NULL COMMENT '保险名称',
  `pet_name` varchar(50) NOT NULL COMMENT '宠物名称',
  `reason` varchar(500) NOT NULL COMMENT '申请原因',
  `description` varchar(2000) NOT NULL COMMENT '情况描述',
  `evidence_images` varchar(2000) DEFAULT NULL COMMENT '佐证图片URL，多个用逗号分隔，最多5个',
  `claim_amount` decimal(10,2) DEFAULT NULL COMMENT '理赔金额',
  `status` varchar(20) NOT NULL DEFAULT '待审核' COMMENT '状态：待审核、审核通过、审核拒绝、已打款',
  `reject_reason` varchar(500) DEFAULT NULL COMMENT '拒绝原因',
  `admin_remark` varchar(500) DEFAULT NULL COMMENT '管理员备注',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='理赔申请表';

/*Data for the table `insurance_claim` */

insert  into `insurance_claim`(`id`,`claim_no`,`user_id`,`order_id`,`insurance_name`,`pet_name`,`reason`,`description`,`evidence_images`,`claim_amount`,`status`,`reject_reason`,`admin_remark`,`create_time`) values 
(1,'CLM202402010001',2,1,'宠物健康综合保险','小白','宠物意外受伤需要治疗','我的狗狗小白在公园玩耍时不慎摔伤，导致前腿骨折，已在宠物医院进行了手术治疗，花费医疗费用8500元。现申请理赔，附上医院诊断证明、手术记录和费用发票。','https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/b355999f1d6e4872ac386d94613a4db0.jpeg,https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/9c8f9ebec05e44ad8ae812b850132945.jpeg',8500.00,'已打款',NULL,'审核通过，理赔金额8500元已打款至您的账户','2024-02-01 10:00:00'),
(2,'CLM202402020001',3,3,'宠物疾病医疗保险','旺财','宠物生病住院治疗','我的狗狗旺财患上了肠胃炎，在医院住院治疗5天，产生医疗费用3200元。现申请理赔，附上住院病历、检查报告和费用清单。','https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/a81ed52957564ddc9a00bf54a4a4f950.jpg,https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/cd644dd7fb3241d3b3fd4773432a1893.jpg',3200.00,'审核通过',NULL,'审核通过，待打款','2024-02-02 09:30:00'),
(3,'CLM202402030001',2,2,'宠物意外伤害保险','咪咪','宠物意外烫伤','我的猫咪咪咪不小心被热水烫伤，已在医院进行治疗，花费1500元。现申请理赔。','https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/e2d399383a5042df87ae865874b96d31.jpeg,https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/26ad8623825f4ebead0866958060b249.png',0.00,'审核拒绝','请完善发票相关信息之后重新发起理赔','拒绝','2024-02-03 14:20:00'),
(4,'CLM202402040001',4,4,'宠物责任险','大黄','宠物咬伤他人','我的狗狗大黄不小心咬伤了邻居，对方产生医疗费用2000元。现申请理赔，附上事故证明和医疗发票。','https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/f4d7afd4df6142a293e288829db36f7b.jpeg,https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/3298607f76374d95bfb652908f1f4dc1.jpeg',NULL,'审核拒绝','经核实，事故发生时您的宠物未佩戴牵引绳，不符合理赔条件','不符合理赔条件','2024-02-04 11:00:00'),
(5,'CLM202402050001',5,5,'宠物手术费用保险','花花','宠物绝育手术','我的猫咪花花进行了绝育手术，产生手术费用1200元。现申请理赔，附上手术记录和费用清单。','https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/1de4376c1e344c9183b3d3f4997e349d.jpg,https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/3e7d7b1cb9944b009914b98b16c5b92a.jpg',1200.00,'已打款',NULL,'审核通过，待打款','2024-02-05 16:30:00');

/*Table structure for table `insurance_order` */

DROP TABLE IF EXISTS `insurance_order`;
/*我的宠物保单表*/
CREATE TABLE `insurance_order` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `order_no` varchar(50) NOT NULL COMMENT '订单编号',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `insurance_id` bigint NOT NULL COMMENT '保险ID',
  `insurance_name` varchar(200) NOT NULL COMMENT '保险名称',
  `price` decimal(10,2) NOT NULL COMMENT '保险价格',
  `pet_name` varchar(50) NOT NULL COMMENT '宠物名称',
  `pet_type` varchar(20) NOT NULL COMMENT '宠物类型',
  `pet_age` int NOT NULL COMMENT '宠物年龄',
  `pet_breed` varchar(50) DEFAULT NULL COMMENT '宠物品种',
  `payee_name` varchar(50) NOT NULL COMMENT '收款人姓名',
  `payee_phone` varchar(20) NOT NULL COMMENT '收款人电话',
  `payee_account` varchar(100) NOT NULL COMMENT '收款账号',
  `start_date` date NOT NULL COMMENT '保险生效日期',
  `end_date` date NOT NULL COMMENT '保险到期日期',
  `status` varchar(20) NOT NULL DEFAULT '生效中' COMMENT '订单状态：生效中、已过期',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='保险订单表';

/*Data for the table `insurance_order` */

insert  into `insurance_order`(`id`,`order_no`,`user_id`,`insurance_id`,`insurance_name`,`price`,`pet_name`,`pet_type`,`pet_age`,`pet_breed`,`payee_name`,`payee_phone`,`payee_account`,`start_date`,`end_date`,`status`,`create_time`) values 
(1,'INS202401280001',2,1,'宠物健康综合保险',699.00,'小白','狗',3,'金毛','张三','13800138001','6222021234567890123','2024-01-28','2025-01-27','已过期','2024-01-28 10:00:00'),
(2,'INS202401280002',2,2,'宠物意外伤害保险',399.00,'咪咪','猫',2,'英短','张三','13800138001','6222021234567890123','2024-01-28','2025-01-27','已过期','2024-01-28 11:00:00'),
(3,'INS202401290001',3,3,'宠物疾病医疗保险',899.00,'旺财','狗',5,'泰迪','李四','13800138002','6222028765432109876','2024-01-29','2025-01-28','生效中','2024-01-29 09:30:00'),
(4,'INS202401290002',4,4,'宠物责任险',299.00,'大黄','狗',4,'中华田园犬','王五','13800138003','6222025555666677778','2024-01-29','2025-01-28','生效中','2024-01-29 14:20:00'),
(5,'INS202401300001',5,5,'宠物手术费用保险',599.00,'花花','猫',1,'美短','赵六','13800138004','6222029999888877776','2024-01-30','2025-01-29','生效中','2024-01-30 08:45:00'),
(6,'INS202312150001',2,6,'宠物全面保障计划',1299.00,'豆豆','狗',6,'柯基','张三','13800138001','6222021234567890123','2023-12-15','2024-12-14','已过期','2023-12-15 10:00:00'),
(7,'INS202510311258209146',2,6,'宠物全面保障计划',1299.00,'多瑞咪','狗',2,'','许多多','18888888888','888888','2025-10-31','2026-10-31','生效中','2025-10-31 12:58:20'),
(8,'INS202601041121534976',19,4,'宠物责任险',299.00,'多瑞咪','猫',2,'英短','赵敏','18888888888','7483723827535385','2026-01-04','2027-01-04','生效中','2026-01-04 11:21:54');

/*Table structure for table `order_detail` */

DROP TABLE IF EXISTS `order_detail`;
/*商品订单详情表*/
CREATE TABLE `order_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `order_id` bigint NOT NULL COMMENT '订单ID',
  `product_id` bigint NOT NULL COMMENT '商品ID',
  `product_name` varchar(200) NOT NULL COMMENT '商品名称',
  `product_image` varchar(500) DEFAULT NULL COMMENT '商品图片URL',
  `price` decimal(10,2) NOT NULL COMMENT '商品单价',
  `quantity` int NOT NULL DEFAULT '1' COMMENT '购买数量',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='订单详情表';

/*Data for the table `order_detail` */

insert  into `order_detail`(`id`,`order_id`,`product_id`,`product_name`,`product_image`,`price`,`quantity`,`create_time`) values 
(1,1,1,'皇家狗粮中型犬成犬粮10kg','https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/be5a3d847de44a2eaad3c756ef9a0207.jpg',368.00,2,'2024-01-25 10:00:00'),
(2,1,6,'雪貂宠物沐浴露猫咪专用除菌去异味500ml','https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/03122ada875841b18792e6a77e9720c8.jpg',49.00,3,'2024-01-25 10:00:00'),
(3,2,2,'渴望猫咪天然粮海洋鱼味5kg','https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/c86772290c2144af8ae8a5594da451fd.jpg',299.00,1,'2024-01-25 11:30:00'),
(4,3,4,'爱丽思猫砂盆全封闭式防外溅加大号','https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/435697fe1d9d4493bcb37cadb35f09b6.jpg',159.00,2,'2024-01-25 14:20:00'),
(5,4,1,'皇家狗粮中型犬成犬粮10kg','https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/be5a3d847de44a2eaad3c756ef9a0207.jpg',368.00,1,'2024-01-26 09:15:00'),
(6,5,3,'小佩宠物自动饮水器猫狗通用2L大容量','https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/4f981eedf6d747ef92a31760b959afdd.jpeg',128.00,1,'2024-01-26 15:45:00'),
(7,5,2,'渴望猫咪天然粮海洋鱼味5kg','https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/c86772290c2144af8ae8a5594da451fd.jpg',299.00,1,'2024-01-26 15:45:00'),
(8,6,7,'Touchdog狗狗衣服冬季保暖加厚四脚衣','https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/880d04f71c86491ba32ef99a95140083.jpeg',89.00,1,'2024-01-27 10:30:00'),
(9,6,3,'小佩宠物自动饮水器猫狗通用2L大容量','https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/4f981eedf6d747ef92a31760b959afdd.jpeg',128.00,1,'2024-01-27 10:30:00'),
(10,7,8,'PETKIT宠物外出包猫咪背包太空舱透气便携','https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/27c763857b7945818ee0a22bc974e96e.jpeg',138.00,1,'2024-01-27 16:00:00'),
(11,8,16,'猫砂膨润土除臭无尘猫沙10kg','https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/d65a43495ae34a0396154b0cb78548ec.jpg',45.00,2,'2025-10-31 12:59:34');

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;
/*商品订单表*/
CREATE TABLE `orders` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `order_no` varchar(50) NOT NULL COMMENT '订单编号',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `total_amount` decimal(10,2) NOT NULL COMMENT '订单总金额',
  `receiver_name` varchar(50) NOT NULL COMMENT '收货人姓名',
  `receiver_phone` varchar(20) NOT NULL COMMENT '收货人电话',
  `receiver_address` varchar(500) NOT NULL COMMENT '收货地址',
  `status` varchar(20) NOT NULL DEFAULT '待发货' COMMENT '订单状态：待发货、已发货、已收货',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='订单表';

/*Data for the table `orders` */

insert  into `orders`(`id`,`order_no`,`user_id`,`total_amount`,`receiver_name`,`receiver_phone`,`receiver_address`,`status`,`create_time`) values 
(1,'ORD202401250001',2,883.00,'张三','13800138001','北京市朝阳区建国路88号','已收货','2024-01-25 10:00:00'),
(2,'ORD202401250002',2,299.00,'张三','13800138001','北京市朝阳区建国路88号','已收货','2024-01-25 11:30:00'),
(3,'ORD202401250003',3,318.00,'李四','13800138002','上海市浦东新区世纪大道100号','待发货','2024-01-25 14:20:00'),
(4,'ORD202401260001',4,368.00,'王五','13800138003','广州市天河区天河路123号','已发货','2024-01-26 09:15:00'),
(5,'ORD202401260002',5,425.00,'赵六','13800138004','深圳市南山区科技园路666号','待发货','2024-01-26 15:45:00'),
(6,'ORD202401270001',2,217.00,'张三','13800138001','北京市朝阳区建国路88号','已收货','2024-01-27 10:30:00'),
(7,'ORD202401270002',3,138.00,'李四','13800138002','上海市浦东新区世纪大道100号','已发货','2024-01-27 16:00:00'),
(8,'ORD202510318856',2,90.00,'许多多','18888888888','南京艾瑞','待发货','2025-10-31 12:59:34');

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;
/*商品表*/
CREATE TABLE `product` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `images` varchar(2000) DEFAULT NULL COMMENT '商品图片URL，多个用逗号分隔，最多5个',
  `name` varchar(200) NOT NULL COMMENT '商品名称',
  `category_id` bigint NOT NULL COMMENT '商品分类ID',
  `description` varchar(1000) DEFAULT NULL COMMENT '商品描述',
  `brand` varchar(100) DEFAULT NULL COMMENT '品牌',
  `pet_type` varchar(20) NOT NULL COMMENT '适用宠物类型：狗、猫',
  `price` decimal(10,2) NOT NULL COMMENT '价格',
  `status` varchar(20) NOT NULL DEFAULT '上架' COMMENT '状态：上架、下架',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='商品表';

/*Data for the table `product` */

insert  into `product`(`id`,`images`,`name`,`category_id`,`description`,`brand`,`pet_type`,`price`,`status`,`create_time`) values 
(1,'https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/be5a3d847de44a2eaad3c756ef9a0207.jpg,https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/85e28fd5c4e142cd854115a1776219a7.jpg','皇家狗粮中型犬成犬粮10kg',1,'皇家中型犬成犬粮专为1-7岁的中型犬（11-25kg）研制，采用科学配方，富含优质动物蛋白和L-肉碱，帮助维持理想体重和肌肉质量。添加EPA/DHA和多种维生素，促进皮肤健康和毛发亮泽。独特的颗粒形状设计，鼓励犬只充分咀嚼，有助于口腔健康。不含人工色素、香料和防腐剂，安全可靠，是千万宠物家庭的信赖之选。','皇家','狗',368.00,'上架','2024-01-10 09:00:00'),
(2,'https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/c86772290c2144af8ae8a5594da451fd.jpg,https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/5bd02843fc3141e4af98ee80984a2336.jpg','渴望猫咪天然粮海洋鱼味5kg',1,'渴望海洋鱼味猫粮采用生物学适当配方，含85%优质动物原料，15%蔬菜水果，0谷物添加。精选新鲜深海鱼（包括三文鱼、鲱鱼、比目鱼）作为主要蛋白质来源，富含Omega-3和Omega-6脂肪酸，促进皮肤健康和毛发光泽。添加天然益生菌和益生元，支持消化系统健康。冷冻干燥技术保留营养成分，WDJ推荐品牌，适合全阶段猫咪食用，让您的猫咪享受自然美味的同时获得全面营养。','渴望','猫',299.00,'上架','2024-01-11 10:00:00'),
(3,'https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/4f981eedf6d747ef92a31760b959afdd.jpeg,https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/5db0ed340d1e4bed8bb1bbd11d5c1b92.jpg','小佩宠物自动饮水器猫狗通用2L大容量',2,'小佩智能宠物饮水器采用循环过滤系统，通过三重过滤（PP棉+活性炭+离子交换树脂）净化水质，去除杂质、异味和重金属，为宠物提供新鲜健康的饮用水。流动活水设计模拟自然泉水，吸引宠物主动饮水，有效预防泌尿系统疾病。超静音水泵（<40分贝），24小时运行不扰民。2L大容量适合多宠家庭和外出2-3天使用。透明水箱可视化设计，方便观察水量。可拆卸结构，清洗方便。省电节能，功率仅2W。','小佩','狗',128.00,'上架','2024-01-12 11:00:00'),
(4,'https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/435697fe1d9d4493bcb37cadb35f09b6.jpg,https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/c44d2bcdeb2e4f9baeda38ef673bc115.jpg','爱丽思猫砂盆全封闭式防外溅加大号',2,'爱丽思全封闭猫砂盆采用人性化设计，顶部进出方式有效防止猫砂外溅，保持家居清洁。加大内部空间（53x40x43cm），适合大型猫咪使用，让猫咪有足够空间转身和掩埋。双层过滤踏板设计，猫咪走出时自动清理脚底猫砂，减少猫砂浪费。全封闭结构有效控制异味扩散，配合活性炭除臭盒使用效果更佳。顶盖可完全打开，方便日常清理。优质PP材质，安全无毒，耐用易清洗。多色可选，简约设计融入各种家居风格。','爱丽思','猫',159.00,'上架','2024-01-13 12:00:00'),
(5,'https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/81e4e47e60344f7a95c6e2a2e494ce69.jpeg,https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/6117db2b9e2c4a65ac7987f9fd7a3fb1.png','谷登狗狗营养膏幼犬成犬补钙增强免疫120g',3,'谷登宠物营养膏专为狗狗研发，富含50多种营养成分，包括复合维生素、矿物质、氨基酸、牛磺酸等。特别添加钙、磷、维生素D3，促进骨骼和牙齿发育，预防佝偻病和软骨症。添加益生菌和益生元，调理肠胃，改善消化吸收。增强免疫力配方，帮助幼犬健康成长，助力成犬保持活力。适口性极佳，狗狗爱吃。适用于幼犬、怀孕哺乳期母犬、体弱犬、术后恢复期犬只。每天2-3次，每次3-5cm，可直接喂食或拌入食物中。','谷登','狗',68.00,'下架','2024-01-14 13:00:00'),
(6,'https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/03122ada875841b18792e6a77e9720c8.jpg,https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/12a42b2ad98a44749643c0354c776560.jpg','雪貂宠物沐浴露猫咪专用除菌去异味500ml',4,'雪貂猫咪专用沐浴露采用温和低敏配方，PH值接近猫咪皮肤，不刺激眼睛和皮肤。天然植物提取成分（芦荟精华、洋甘菊、茶树油），深层清洁毛发和皮肤，有效去除油脂、污垢和异味。添加抑菌因子，预防皮肤病和寄生虫。含丝蛋白和维生素E，滋养毛发，修复受损毛鳞片，洗后毛发柔顺亮泽，蓬松飘逸。清新花果香味，留香持久不刺鼻。易冲洗不残留，适合长毛猫和短毛猫使用。500ml大容量，一瓶可用3-4个月。','雪貂','猫',49.00,'上架','2024-01-15 14:00:00'),
(7,'https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/880d04f71c86491ba32ef99a95140083.jpeg,https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/35b02d58576b4b90a838b0fbfc64b45b.jpeg','Touchdog狗狗衣服冬季保暖加厚四脚衣',5,'Touchdog冬季保暖四脚衣采用双层夹棉设计，外层防风防水面料，内层柔软抓绒，温暖舒适。四脚设计全方位保暖，保护狗狗四肢不受寒。背部加宽加厚，重点保护胸腹部等敏感部位。松紧袖口设计，防风保暖的同时不勒腿。魔术贴+按扣双重固定，穿脱方便不易脱落。背部预留牵引绳孔，外出散步更便捷。精致车工，走线细密，耐穿耐洗不变形。多种尺码可选，适合泰迪、比熊、雪纳瑞、柯基等中小型犬。多色可选，时尚保暖两不误。','Touchdog','狗',89.00,'上架','2024-01-16 15:00:00'),
(8,'https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/27c763857b7945818ee0a22bc974e96e.jpeg,https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/68418fe8c5554c20ba9961dce3e00705.jpeg','PETKIT宠物外出包猫咪背包太空舱透气便携',6,'PETKIT太空舱宠物背包融合时尚与实用，半球形透明舱设计，视野开阔，缓解宠物焦虑。优质PC材质舱体，坚固耐用，透光通风。环绕透气孔+透气网布，多方位通风系统，即使长时间外出也保持空气流通。人体工学肩带，加宽加厚，分散压力，背负舒适。内置安全扣，防止宠物中途逃脱。底部防滑耐磨，放置稳固。内置可拆卸软垫，可机洗，保持清洁卫生。多个收纳袋设计，可放置零食、水瓶、玩具等。承重约8kg，适合猫咪和小型犬。时尚外观，出街回头率超高。','PETKIT','猫',138.00,'上架','2024-01-17 16:00:00'),
(9,'https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/a28a2b2087e34e48b48dbf6d44deda06.jpg,https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/90f153f76a09468b9728d32f01fbd24b.jpeg','比瑞吉狗粮泰迪贵宾专用小型犬成犬粮3kg',1,'比瑞吉泰迪贵宾专用粮针对小型犬特点研发，小颗粒设计易于咀嚼和消化。精选鸡肉、鸭肉作为优质蛋白来源，蛋白质含量≥25%，满足小型犬高代谢需求。添加深海鱼油和卵磷脂，美毛亮毛，改善泪痕问题。富含膳食纤维，促进肠道蠕动，便便成型不臭。添加软骨素和葡萄糖胺，保护关节健康。含丝兰提取物，减少粪便异味。无谷物配方，降低过敏风险。适合10个月以上泰迪、比熊、博美等小型犬食用。','比瑞吉','狗',158.00,'上架','2024-01-18 09:00:00'),
(10,'https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/13984deb0ee94842a88e8c36238679be.jpeg,https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/d14a69eb06e3467fab4cf300d71eecdc.jpeg','网易严选冻干猫粮双拼鸡肉鱼肉全阶段1.8kg',1,'网易严选冻干双拼猫粮采用创新工艺，将冻干生骨肉与烘焙粮完美结合。80%动物原料（鸡肉+鱼肉），高蛋白低碳水，符合猫咪天然饮食习惯。冷冻干燥技术最大程度保留肉质营养和风味，适口性极佳，挑食猫也爱吃。添加12种维生素和矿物质，营养全面均衡。含牛磺酸、DHA，促进视力和大脑发育。益生元+益生菌组合，呵护肠胃健康。无谷配方，低敏配方，适合肠胃敏感猫咪。全阶段适用，幼猫成猫老年猫都可以吃。','网易严选','猫',228.00,'上架','2024-01-18 10:00:00'),
(11,'https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/ca85d3116bbf4c09aa9ec65cca123394.jpg,https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/452eec74e61f47e1a85102779fc6f35e.jpg','福来恩猫狗体外驱虫药跳蚤蜱虫滴剂3支装',3,'福来恩是法国进口的体外驱虫药，有效成分为非泼罗尼。一次使用可持续杀灭跳蚤、蜱虫、虱子等体外寄生虫长达30天。24小时内杀灭100%跳蚤，48小时内杀灭蜱虫。防水配方，洗澡游泳不影响药效。滴在颈部皮肤即可，操作简单，宠物无感。安全性高，怀孕哺乳期也可使用。单独包装，每月一支，使用方便。适合8周龄以上、体重≥1kg的猫犬使用。预防优于治疗，定期驱虫让宠物远离寄生虫困扰，保护全家健康。','福来恩','狗',198.00,'上架','2024-01-19 11:00:00'),
(12,'https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/9e7f2d0d99f7491390b83c886e8c6f9c.jpeg,https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/5a2250a960a44a019b90809e6c0add7c.jpg','宠物益生菌猫狗通用调理肠胃腹泻呕吐30包',3,'宠物专用益生菌含10种活性益生菌菌株（120亿CFU/包），包括乳酸菌、双歧杆菌、枯草芽孢杆菌等，调节肠道菌群平衡。添加益生元（果寡糖、低聚木糖），促进有益菌增殖。含消化酶（蛋白酶、淀粉酶、纤维素酶），帮助分解食物，提高营养吸收率。有效改善腹泻、便秘、呕吐、食欲不振、便臭等肠胃问题。适用于换粮期、打疫苗后、服用抗生素后、应激反应等情况。粉末状，适口性好，拌入食物或直接喂食均可。独立小包装，每天1-2包，携带方便。适合全年龄段猫狗使用。','宠儿香','狗',78.00,'上架','2024-01-19 14:00:00'),
(13,'https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/7de69a4688eb4d05b6ea6f2eebcecad7.jpg','宠物指甲剪猫狗专用指甲刀磨甲器套装',2,'宠物专用指甲护理套装包含指甲剪+指甲锉+止血粉。指甲剪采用优质不锈钢刀头，锋利耐用，斜角设计精准修剪不劈裂。人体工学防滑手柄，省力舒适，新手也能轻松操作。安全护罩设计，防止剪到血线。赠送指甲锉，打磨指甲边缘，避免刮伤人和家具。配备止血粉，万一剪到血线可快速止血。适用于猫、狗、兔、龙猫等小型宠物。定期修剪指甲可防止指甲过长刺入肉垫，预防感染和行走不适，也能保护家具不被抓花。','洛克优品','狗',35.00,'上架','2024-01-20 09:00:00'),
(14,'https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/a5ba67db505140a4a6bf6d0d922fece4.jpg,https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/dfbebc0c1c42412e87300711083f09bc.jpg','猫咪玩具套装逗猫棒羽毛铃铛球逗猫猫10件套',2,'猫咪玩具豪华10件套，满足猫咪多样化玩耍需求。包含逗猫棒2支（羽毛款+铃铛款）、弹簧鼠、毛绒球、响纸球、轨道球、猫薄荷玩具等。多种材质和玩法，激发猫咪狩猎天性，增加运动量，预防肥胖。逗猫棒可伸缩设计，长度可调，增加互动乐趣，增进主人与猫咪感情。轨道球可单猫自嗨，主人不在家也不无聊。猫薄荷玩具让猫咪兴奋放松，缓解压力。所有玩具采用安全无毒材质，可放心让猫咪玩耍。丰富猫咪生活，让猫咪快乐健康成长。','多格漫','猫',45.00,'上架','2024-01-20 10:00:00'),
(15,'https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/606cb5263b2c499b96bf0fea13730fa7.jpg,https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/c0692ee57a904324875b1ca0c31ff460.jpg','狗狗零食鸡肉干训练奖励磨牙棒500g',1,'纯鸡胸肉制作的狗狗零食，无添加防腐剂、色素、香精。选用新鲜鸡胸肉，经过低温烘干处理，最大程度保留肉质营养和天然风味。高蛋白低脂肪，健康营养。条状设计，大小适中，既可作为训练奖励，也能作为磨牙零食，清洁牙齿，预防牙结石。适口性极佳，挑食狗也爱吃。独立包装，保持新鲜，携带方便，外出训练必备。适合3个月以上所有犬种食用。每天喂食量不超过正餐的10%，避免影响主食摄入。让训练变得更有趣，让狗狗更听话。','宠幸','狗',58.00,'上架','2024-01-20 15:00:00'),
(16,'https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/d65a43495ae34a0396154b0cb78548ec.jpg,https://wangtaobucket.oss-cn-beijing.aliyuncs.com/2025/10/31/8222ea91343d4e40a81a8fb5d10a6e2e.jpg','猫砂膨润土除臭无尘猫沙10kg',2,'优质膨润土猫砂，采用纳米级膨润土原料，吸水性强，瞬间结团。3秒快速结团，紧实不散，易于清理，减少浪费。99%除尘工艺，粉尘极少，保护猫咪和主人呼吸健康。添加活性炭和天然植物除臭因子，强效锁臭，保持室内空气清新。颗粒大小适中（2-4mm），脚感舒适，猫咪喜欢。包裹性好，带出少，保持家居清洁。10kg大容量，单猫可用1-2个月。性价比高，是养猫家庭的经济实惠之选。建议每天清理结团，每周全部更换一次，保持猫砂盆清洁。','喵洁客','猫',45.00,'上架','2024-01-21 09:00:00');

/*Table structure for table `review` */

DROP TABLE IF EXISTS `review`;
/*我的商品订单评论表*/
CREATE TABLE `review` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `order_id` bigint NOT NULL COMMENT '订单ID',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `product_id` bigint NOT NULL COMMENT '商品ID',
  `content` varchar(1000) NOT NULL COMMENT '评价内容',
  `rating` int NOT NULL COMMENT '评分：1-5星',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='评价表';

/*Data for the table `review` */

insert  into `review`(`id`,`order_id`,`user_id`,`product_id`,`content`,`rating`,`create_time`) values 
(1,1,2,1,'狗粮质量很好，我家狗狗很喜欢吃，营养也很丰富，会继续购买！',5,'2024-01-26 10:00:00'),
(2,1,2,6,'沐浴露味道很清新，洗完毛发很柔顺，去污能力强，物有所值！',4,'2024-01-26 10:05:00'),
(3,6,2,7,'衣服质量不错，做工精细，保暖性好，尺码也合适，狗狗穿上很可爱！',5,'2024-01-28 11:00:00'),
(4,6,2,3,'饮水器设计很人性化，过滤效果好，声音也很小，猫咪很喜欢喝水了！',5,'2024-01-28 11:05:00'),
(5,4,4,1,'狗粮还可以，但是感觉颗粒有点大，不太适合小型犬，但质量是不错的。',3,'2024-01-27 09:00:00'),
(6,2,2,2,'小猫咪非常喜欢吃，下次还来回购',5,'2025-10-31 13:00:42');

/*Table structure for table `system_config` */

DROP TABLE IF EXISTS `system_config`;
/*系统配置表*/
CREATE TABLE `system_config` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `system_name` varchar(100) NOT NULL COMMENT '系统名称',
  `carousel_images` varchar(2000) DEFAULT NULL COMMENT '轮播图URL列表，JSON格式',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统配置表';

/*Data for the table `system_config` */

insert  into `system_config`(`id`,`system_name`,`carousel_images`,`create_time`) values 
(1,'伴侣宠物之家系统','[\"https://images.unsplash.com/photo-1601758228041-f3b2795255f1?w=1200\",\"https://images.unsplash.com/photo-1543466835-00a7907e9de1?w=1200\",\"https://images.unsplash.com/photo-1574158622682-e40e69881006?w=1200\"]','2024-01-01 09:00:00');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;
/*用户信息表*/
CREATE TABLE `user` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码',
  `role` varchar(20) NOT NULL COMMENT '角色：管理员、普通用户',
  `nickname` varchar(50) NOT NULL COMMENT '昵称',
  `avatar` varchar(500) DEFAULT NULL COMMENT '头像URL',
  `phone` varchar(20) DEFAULT NULL COMMENT '手机号',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `status` varchar(20) NOT NULL DEFAULT '正常' COMMENT '状态：正常、禁用',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '账户余额',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户表';

/*Data for the table `user` */

insert  into `user`(`id`,`username`,`password`,`role`,`nickname`,`avatar`,`phone`,`email`,`status`,`create_time`,`money`) values 
(1,'admin','$2a$10$L.H8qCqjRdqMziIs6Cn3DOs72s6gQz.aSOCg7YcDxHqVlC.PcKUQW','管理员','系统管理员','https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=400','13800138000','admin@pet.com','正常','2024-01-01 10:00:00',0.00),
(2,'caocao','$2a$10$a2xZVJt9bYh2hhh9byjDT.D8zQIaKCX7zhfgXyqRmtxMwSQwAxl.m','普通用户','曹操','https://q6.itc.cn/q_70/images03/20250306/355fba6a5cb049f5b98c2ed9f03cc5e1.jpeg','13333333333','wangtao208@126.com','正常','2026-01-13 21:42:20',0.00);

/*Table structure for table `user_recharge_record` */

DROP TABLE IF EXISTS `user_recharge_record`;
/*用户充值记录表*/
CREATE TABLE `user_recharge_record` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `order_id` varchar(64) NOT NULL COMMENT '充值订单号',
  `amount` decimal(10,2) NOT NULL COMMENT '充值金额',
  `bonus_amount` decimal(10,2) DEFAULT '0.00' COMMENT '赠送金额',
  `total_amount` decimal(10,2) NOT NULL COMMENT '实际到账金额',
  `pay_method` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'alipay' COMMENT '支付方式：alipay-支付宝, wechat-微信',
  `pay_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '支付状态：0-待支付, 1-支付成功, 2-支付失败, 3-已取消',
  `trade_no` varchar(64) DEFAULT NULL COMMENT '支付宝/微信交易号',
  `subject` varchar(200) NOT NULL COMMENT '订单标题',
  `body` varchar(500) DEFAULT NULL COMMENT '订单描述',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `pay_time` datetime DEFAULT NULL COMMENT '支付时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_order_id` (`order_id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_create_time` (`create_time`),
  KEY `idx_pay_status` (`pay_status`)
) ENGINE=InnoDB AUTO_INCREMENT=2009997309407559683 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户充值记录表';

/*Data for the table `user_recharge_record` */

insert  into `user_recharge_record`(`id`,`user_id`,`order_id`,`amount`,`bonus_amount`,`total_amount`,`pay_method`,`pay_status`,`trade_no`,`subject`,`body`,`create_time`,`pay_time`,`update_time`) values 
(2009982627305172994,19,'RECHARGE_1768052151896_7OEHLNKEI',100.00,0.00,100.00,'alipay',1,'AUTO_RECHARGE_1768052151896_7OEHLNKEI','账户充值','用户赵敏账户充值100元','2026-01-10 21:36:16','2026-01-10 21:36:45','2026-01-10 21:36:44'),
(2009990002661601281,19,'RECHARGE_1768053909937_AK2MOJGM1',500.00,20.00,520.00,'alipay',1,'AUTO_RECHARGE_1768053909937_AK2MOJGM1','账户充值','用户赵敏账户充值500元','2026-01-10 22:05:35','2026-01-10 22:06:03','2026-01-10 22:06:03'),
(2009997309407559682,19,'RECHARGE_1768055603248_LWC750OG4',200.00,5.00,205.00,'alipay',1,'AUTO_RECHARGE_1768055603248_LWC750OG4','账户充值','用户赵敏账户充值200元','2026-01-10 22:34:37','2026-01-10 22:35:10','2026-01-10 22:35:10');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
