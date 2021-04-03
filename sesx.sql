-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 03, 2021 at 11:38 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sesx`
--

-- --------------------------------------------------------

--
-- Table structure for table `addon_account`
--

CREATE TABLE `addon_account` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `addon_account`
--

INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES
('bag_black_money', 'Bag Black Money ', 0),
('bag_money', 'Bag Money ', 0),
('bank_savings', 'Bank Savings', 0),
('caution', 'caution', 0),
('locker', 'Locker', 0),
('locker_black', 'Locker Zwart geld', 0),
('locker_cash', 'Locker Contant geld', 0),
('property_black_money', 'Money Sale Property', 0),
('society_ambulance', 'Ambulance', 1),
('society_banker', 'Bank', 1),
('society_cardealer', 'Car Dealer', 1),
('society_mechanic', 'Mechanic', 1),
('society_police', 'Police', 1),
('society_police_black_money', 'Police black money ', 1),
('society_police_money', 'Police money ', 1),
('society_realestateagent', 'Real Estate Company', 1),
('society_taxi', 'Taxi', 1);

-- --------------------------------------------------------

--
-- Table structure for table `addon_account_data`
--

CREATE TABLE `addon_account_data` (
  `id` int(11) NOT NULL,
  `account_name` varchar(255) DEFAULT NULL,
  `money` int(11) NOT NULL,
  `owner` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `addon_inventory`
--

CREATE TABLE `addon_inventory` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `addon_inventory`
--

INSERT INTO `addon_inventory` (`name`, `label`, `shared`) VALUES
('bag', 'Bag Inventory', 0),
('locker', 'Locker', 0),
('property', 'Property', 0),
('society_ambulance', 'Ambulance', 1),
('society_cardealer', 'Car Dealer', 1),
('society_mechanic', 'Mechanic', 1),
('society_police', 'Police', 1),
('society_taxi', 'Taxi', 1);

-- --------------------------------------------------------

--
-- Table structure for table `addon_inventory_items`
--

CREATE TABLE `addon_inventory_items` (
  `id` int(11) NOT NULL,
  `inventory_name` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `count` int(11) NOT NULL,
  `owner` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `allhousing`
--

CREATE TABLE `allhousing` (
  `id` int(11) NOT NULL,
  `owner` varchar(50) NOT NULL,
  `ownername` varchar(50) NOT NULL,
  `owned` tinyint(4) NOT NULL,
  `price` int(11) NOT NULL,
  `resalepercent` int(11) NOT NULL,
  `resalejob` varchar(50) NOT NULL,
  `entry` longtext DEFAULT NULL,
  `garage` longtext DEFAULT NULL,
  `furniture` longtext DEFAULT NULL,
  `shell` varchar(50) NOT NULL,
  `interior` varchar(50) NOT NULL,
  `shells` longtext DEFAULT NULL,
  `doors` longtext DEFAULT NULL,
  `housekeys` longtext DEFAULT NULL,
  `wardrobe` longtext DEFAULT NULL,
  `inventory` longtext DEFAULT NULL,
  `inventorylocation` longtext DEFAULT NULL,
  `mortgage_owed` int(11) NOT NULL DEFAULT 0,
  `last_repayment` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `ammunition`
--

CREATE TABLE `ammunition` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `owner` text DEFAULT NULL,
  `original_owner` text NOT NULL,
  `hash` text NOT NULL,
  `weapon_id` char(60) NOT NULL,
  `count` int(11) NOT NULL DEFAULT 0,
  `attach` text NOT NULL DEFAULT '[]'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bank_transfer`
--

CREATE TABLE `bank_transfer` (
  `id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `identifier` varchar(50) NOT NULL,
  `price` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `billing`
--

CREATE TABLE `billing` (
  `id` int(11) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `sender` varchar(40) NOT NULL,
  `target_type` varchar(50) NOT NULL,
  `target` varchar(40) NOT NULL,
  `label` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `datastore`
--

CREATE TABLE `datastore` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `datastore`
--

INSERT INTO `datastore` (`name`, `label`, `shared`) VALUES
('bag', 'Bag Datastore', 0),
('locker', 'Locker', 0),
('property', 'Property', 0),
('society_ambulance', 'Ambulance', 1),
('society_mechanic', 'Mechanic', 1),
('society_police', 'Police', 1),
('society_taxi', 'Taxi', 1),
('user_ears', 'Ears', 0),
('user_glasses', 'Glasses', 0),
('user_helmet', 'Helmet', 0),
('user_mask', 'Mask', 0);

-- --------------------------------------------------------

--
-- Table structure for table `datastore_data`
--

CREATE TABLE `datastore_data` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `owner` varchar(255) DEFAULT NULL,
  `data` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `dpkeybinds`
--

CREATE TABLE `dpkeybinds` (
  `id` varchar(50) NOT NULL,
  `keybind1` varchar(50) DEFAULT 'num4',
  `emote1` varchar(255) DEFAULT '',
  `keybind2` varchar(50) DEFAULT 'num5',
  `emote2` varchar(255) DEFAULT '',
  `keybind3` varchar(50) DEFAULT 'num6',
  `emote3` varchar(255) DEFAULT '',
  `keybind4` varchar(50) DEFAULT 'num7',
  `emote4` varchar(255) DEFAULT '',
  `keybind5` varchar(50) DEFAULT 'num8',
  `emote5` varchar(255) DEFAULT '',
  `keybind6` varchar(50) DEFAULT 'num9',
  `emote6` varchar(255) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `fine_types`
--

CREATE TABLE `fine_types` (
  `id` int(11) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `fine_types`
--

INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
(1, 'Misuse of a horn', 30, 0),
(2, 'Illegally Crossing a continuous Line', 40, 0),
(3, 'Driving on the wrong side of the road', 250, 0),
(4, 'Illegal U-Turn', 250, 0),
(5, 'Illegally Driving Off-road', 170, 0),
(6, 'Refusing a Lawful Command', 30, 0),
(7, 'Illegally Stopping a Vehicle', 150, 0),
(8, 'Illegal Parking', 70, 0),
(9, 'Failing to Yield to the right', 70, 0),
(10, 'Failure to comply with Vehicle Information', 90, 0),
(11, 'Failing to stop at a Stop Sign ', 105, 0),
(12, 'Failing to stop at a Red Light', 130, 0),
(13, 'Illegal Passing', 100, 0),
(14, 'Driving an illegal Vehicle', 100, 0),
(15, 'Driving without a License', 1500, 0),
(16, 'Hit and Run', 800, 0),
(17, 'Exceeding Speeds Over < 5 mph', 90, 0),
(18, 'Exceeding Speeds Over 5-15 mph', 120, 0),
(19, 'Exceeding Speeds Over 15-30 mph', 180, 0),
(20, 'Exceeding Speeds Over > 30 mph', 300, 0),
(21, 'Impeding traffic flow', 110, 1),
(22, 'Public Intoxication', 90, 1),
(23, 'Disorderly conduct', 90, 1),
(24, 'Obstruction of Justice', 130, 1),
(25, 'Insults towards Civilans', 75, 1),
(26, 'Disrespecting of an LEO', 110, 1),
(27, 'Verbal Threat towards a Civilan', 90, 1),
(28, 'Verbal Threat towards an LEO', 150, 1),
(29, 'Providing False Information', 250, 1),
(30, 'Attempt of Corruption', 1500, 1),
(31, 'Brandishing a weapon in city Limits', 120, 2),
(32, 'Brandishing a Lethal Weapon in city Limits', 300, 2),
(33, 'No Firearms License', 600, 2),
(34, 'Possession of an Illegal Weapon', 700, 2),
(35, 'Possession of Burglary Tools', 300, 2),
(36, 'Grand Theft Auto', 1800, 2),
(37, 'Intent to Sell/Distrube of an illegal Substance', 1500, 2),
(38, 'Frabrication of an Illegal Substance', 1500, 2),
(39, 'Possession of an Illegal Substance ', 650, 2),
(40, 'Kidnapping of a Civilan', 1500, 2),
(41, 'Kidnapping of an LEO', 2000, 2),
(42, 'Robbery', 650, 2),
(43, 'Armed Robbery of a Store', 650, 2),
(44, 'Armed Robbery of a Bank', 1500, 2),
(45, 'Assault on a Civilian', 2000, 3),
(46, 'Assault of an LEO', 2500, 3),
(47, 'Attempt of Murder of a Civilian', 3000, 3),
(48, 'Attempt of Murder of an LEO', 5000, 3),
(49, 'Murder of a Civilian', 10000, 3),
(50, 'Murder of an LEO', 30000, 3),
(51, 'Involuntary manslaughter', 1800, 3),
(52, 'Fraud', 2000, 2);

-- --------------------------------------------------------

--
-- Table structure for table `insto_accounts`
--

CREATE TABLE `insto_accounts` (
  `id` int(11) NOT NULL,
  `forename` varchar(50) COLLATE utf8mb4_bin NOT NULL DEFAULT '0',
  `surname` varchar(50) COLLATE utf8mb4_bin NOT NULL DEFAULT '0',
  `username` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `password` varchar(50) COLLATE utf8mb4_bin NOT NULL DEFAULT '0',
  `avatar_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `insto_instas`
--

CREATE TABLE `insto_instas` (
  `id` int(11) NOT NULL,
  `authorId` int(11) NOT NULL,
  `realUser` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filters` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `likes` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `insto_likes`
--

CREATE TABLE `insto_likes` (
  `id` int(11) NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  `inapId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `inventory_glovebox`
--

CREATE TABLE `inventory_glovebox` (
  `id` int(11) NOT NULL,
  `plate` varchar(8) NOT NULL,
  `data` text NOT NULL,
  `owned` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `inventory_hotbar`
--

CREATE TABLE `inventory_hotbar` (
  `id` int(11) NOT NULL,
  `owner` varchar(80) NOT NULL,
  `item` varchar(80) NOT NULL,
  `slot` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `inventory_lockers`
--

CREATE TABLE `inventory_lockers` (
  `owner` varchar(50) NOT NULL,
  `lockerName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `inventory_trunk`
--

CREATE TABLE `inventory_trunk` (
  `id` int(11) NOT NULL,
  `plate` varchar(8) NOT NULL,
  `data` text NOT NULL,
  `owned` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `weight` int(11) NOT NULL DEFAULT 1,
  `rare` tinyint(4) NOT NULL DEFAULT 0,
  `can_remove` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
('accesscard', 'Access Card', 10, 0, 1),
('acetone', '丙酮', 500, 0, 1),
('alive_chicken', 'Living chicken', 1, 0, 1),
('ammunition_fireextinguisher', '灭火器', 2000, 0, 1),
('ammunition_pistol', '手枪弹药', 300, 0, 1),
('ammunition_pistol_large', '大量手枪弹药', 600, 0, 1),
('ammunition_rifle', '步枪弹药', 500, 0, 1),
('ammunition_rifle_large', '大量步枪弹药', 1000, 0, 1),
('ammunition_shotgun', '霰弹枪弹药', 500, 0, 1),
('ammunition_shotgun_large', '大量霰弹枪弹药', 1000, 0, 1),
('ammunition_smg', '冲锋枪弹药', 300, 0, 1),
('ammunition_smg_large', '大量冲锋枪弹药', 600, 0, 1),
('ammunition_snp', '狙击枪弹药', 500, 0, 1),
('ammunition_snp_large', '大量狙击枪弹药', 1000, 0, 1),
('appleempanada', '焦糖苹果馅饼', 300, 0, 1),
('applejuice', '苹果汁', 500, 0, 1),
('armor', '防弹衣', 3200, 0, 1),
('aspirin', '阿司匹林', 1, 0, 1),
('baconcheeseburger', '培根芝士堡', 300, 0, 1),
('baconking', '培根牛肉国王堡', 300, 0, 1),
('bacon_clubhouse_burger', '培根牛堡', 300, 0, 1),
('bag', 'Bag', 1, 0, 1),
('bag100g', '密封塑料袋(100克)', 100, 0, 1),
('bag1g', '密封塑料袋(1克)', 1, 0, 1),
('bag50g', '密封塑料袋(50克)', 50, 0, 1),
('bag5g', '密封塑料袋(5克)', 5, 0, 1),
('bagdogfoor', '一包狗粮', 800, 0, 1),
('bag_bread', '一袋面包', 500, 0, 1),
('bag_water', '一箱矿泉水', 14400, 0, 1),
('bandage', '绷带', 20, 0, 1),
('beefyfritosburrito', '牛肉墨西哥卷饼', 300, 0, 1),
('beefyminiquesadilla', '牛肉迷你玉米饼', 300, 0, 1),
('beer', '啤酒', 600, 0, 1),
('beer2', '一提啤酒', 3600, 0, 1),
('beijingbeef', '北京牛肉', 500, 0, 1),
('bigmac', '巨无霸', 300, 0, 1),
('binocular', '双筒望远镜', 100, 0, 1),
('bkshakes', '汉堡王沙冰', 500, 0, 1),
('blowpipe', '喷灯', 2000, 0, 1),
('book', 'Book', -1, 0, 1),
('boxcig', '一包香烟', 100, 0, 1),
('bread', '面包', 80, 0, 1),
('broccolibeef', '西兰花牛肉', 500, 0, 1),
('cannabis', '大麻', 500, 0, 1),
('carokit', '车身套件', 2000, 0, 1),
('carotool', '工具', 2000, 0, 1),
('carparts', 'Car Parts', -1, 0, 1),
('cheeseburgers', '吉士堡', 300, 0, 1),
('cheeserollup', '芝士卷', 300, 0, 1),
('cheesybean_riceburrito', '芝士豆米煎饼', 300, 0, 1),
('chickenclubsalad', '鸡肉小沙拉', 300, 0, 1),
('chickenminiquesadilla', '鸡丝迷你玉米饼', 300, 0, 1),
('chickennugget', '麦乐鸡', 300, 0, 1),
('chicken_nuggets', '嫩香鸡块', 300, 0, 1),
('chips', '薯片', 300, 0, 1),
('chocolate', 'M&M巧克力豆', 80, 0, 1),
('chomein', '炒面', 400, 0, 1),
('chopsuey', '李鸿章杂碎', 500, 0, 1),
('cigarette', '香烟', 0, 0, 1),
('cigarette2', '小雪茄', 10, 0, 1),
('cinnamontwists', '肉桂卷', 300, 0, 1),
('clip', '弹药箱', 5000, 0, 1),
('clothe', 'Cloth', 1, 0, 1),
('coco', '可卡因', 500, 0, 1),
('coco_leaf', '可卡因叶', 500, 0, 1),
('coffee', '咖啡', 250, 0, 1),
('coke', '可乐', 300, 0, 1),
('coke_pooch', 'Coke', 1, 0, 1),
('copper', '铜', 500, 0, 1),
('corn_chips', '玉米片', 150, 0, 1),
('crispy_chicken_deluxe', '麦麦脆汁鸡', 300, 0, 1),
('cuffs', '手铐', 50, 0, 1),
('cuff_keys', '手铐钥匙', 1, 0, 1),
('cutted_wood', 'Cut wood', 1, 0, 1),
('diamond', '钻石', 500, 0, 1),
('dogfood', '狗粮', 80, 0, 1),
('drill', '钻头', 500, 0, 1),
('drpeppervanilla', '香草味胡椒博士', 500, 0, 1),
('drummag', 'Drum Magazine', 2, 0, 1),
('eggplanttofu', '茄子豆腐', 300, 0, 1),
('egg_mcmuffin', '麦满分', 300, 0, 1),
('emerald', '翡翠', 500, 0, 1),
('essence', 'Gas', 1, 0, 1),
('fabric', 'Fabric', 1, 0, 1),
('fanta', '芬达', 300, 0, 1),
('filet_o_fish', '麦香鱼', 300, 0, 1),
('firecrackerchickenbreast', '爆炒鸡胸', 500, 0, 1),
('firecrackershrimp', '黄金炸虾卷', 500, 0, 1),
('firstaid', '急救箱', 900, 0, 1),
('fish', 'Fish', 1, 0, 1),
('fiveflavorshrimp', '五香虾', 500, 0, 1),
('fixkit', '维修工具', 3000, 0, 1),
('fixtool', 'Repair Tools', 2, 0, 1),
('flashlight', 'Flashlight', 2, 0, 1),
('fortunecookies', '幸运饼干', 10, 0, 1),
('fountain', '喷泉烟火', 100, 0, 1),
('french_fries', '薯条', 80, 0, 1),
('friedrice', '炒饭', 400, 0, 1),
('gadget_parachute', '降落伞', 2000, 0, 1),
('gazbottle', 'Gas Bottle', 2, 0, 1),
('generaltso_chicken', '左宗棠鸡', 500, 0, 1),
('gold', '黄金', 500, 0, 1),
('goldbar', '金条', 500, 0, 1),
('goldnecklace', 'Gold Necklace', 150, 0, 1),
('goldwatch', 'Gold Watch', 200, 0, 1),
('gps', '全球定位系统', 100, 0, 1),
('grilledteriyakichicken', '照烧鸡肉', 500, 0, 1),
('grip', 'Grip', 2, 0, 1),
('hackerDevice', 'Hacker Device', 10, 0, 1),
('hammerwirecutter', 'Hammer And Wire Cutter', 10, 0, 1),
('hifi', '音响系统', 2000, 0, 1),
('highgradefert', '肥料(高)', 500, 0, 1),
('honeysesamechickenbreast', '蜂蜜芝麻鸡胸肉', 500, 0, 1),
('honeywalnutshrimp', '蜂蜜核桃虾', 500, 0, 1),
('hotchocolate', '热可可', 300, 0, 1),
('hot_dogs', '热狗', 50, 0, 1),
('icedmocha', '冰摩卡', 200, 0, 1),
('impossiblewhopper', '人造肉皇堡', 300, 0, 1),
('ipad', 'iPad', -1, 0, 1),
('iron', '铁', 500, 0, 1),
('jelly_beans', '彩虹糖', 300, 0, 1),
('jewels', '一袋珠宝', 1000, 0, 1),
('joint', '大块的生肉', 1000, 0, 1),
('kungpaochicken', '宫保鸡丁', 500, 0, 1),
('largefries', '大薯条', 300, 0, 1),
('lighter', '火机', 100, 0, 1),
('lithium', '锂电池', 10, 0, 1),
('lockpick', '撬锁工具', 20, 0, 1),
('lokalizator', '全球定位系统', 1, 0, 1),
('lowgradefert', '肥料(低)', 500, 0, 1),
('mag', 'Magazine', 2, 0, 1),
('marijuana', '大麻', 500, 0, 1),
('mccafe_shakes', '奶昔', 500, 0, 1),
('meat', '生肉', 500, 0, 1),
('medikit', '医疗箱', 1000, 0, 1),
('medkit', '医疗包', 500, 0, 1),
('meth', '冰毒', 500, 0, 1),
('methlab', '便携式毒品检测仪', 500, 0, 1),
('meth_pooch', 'Meth', 1, 0, 1),
('microchip', '芯片', 1, 0, 1),
('milk', '牛奶', 250, 0, 1),
('milktea', '奶茶', 250, 0, 1),
('morphine', '吗啡', 1, 0, 1),
('mtn_dew', '百事激浪', 500, 0, 1),
('net_cracker', '黑客破解工具', 300, 0, 1),
('nuts', '坚果', 100, 0, 1),
('onionrings', '超值洋葱圈', 300, 0, 1),
('opium', 'Opiate', 1, 0, 1),
('opium_pooch', 'Opium', 1, 0, 1),
('orangechicken', '陈皮鸡', 500, 0, 1),
('orangejuice', '橙汁', 500, 0, 1),
('orange_juice', '橙汁', 500, 0, 1),
('oreo_mcflurry', '奥利奥麦旋风', 150, 0, 1),
('originalchickensandwich', '原味鸡肉堡', 300, 0, 1),
('oxygen_mask', '氧气面罩', 500, 0, 1),
('packaged_chicken', 'Chicken fillet', 1, 0, 1),
('packaged_plank', 'Packaged wood', 1, 0, 1),
('pdbadge', '警徽', 10, 0, 1),
('pendrive', '笔式破解工具', 200, 0, 1),
('petrol', 'Oil', 1, 0, 1),
('petrol_raffin', 'Processed oil', 1, 0, 1),
('phone', '手机', 200, 0, 1),
('pies', '派', 100, 0, 1),
('pistachio', '开心果', 100, 0, 1),
('plantpot', '盆栽植物', 100, 0, 1),
('plato', 'Meal trays', -1, 0, 1),
('potato', '土豆', 10, 0, 1),
('pouch', 'Pouch', 1, 0, 1),
('premium_mcwrap', '美味鸡肉烙饼', 300, 0, 1),
('radio', '对讲机', 100, 0, 1),
('raw', 'RAW Rolling Papers', 1, 0, 1),
('red_bull', '红牛', 300, 0, 1),
('rolex', '劳力士', 10, 0, 1),
('rollingpaper', '滚纸', 1, 0, 1),
('rum', '朗姆', 750, 0, 1),
('sandwich', '三明治', 80, 0, 1),
('scope', 'Scope', 2, 0, 1),
('scubagear', '水下呼吸器', 1000, 0, 1),
('shanghaiangussteak', '上海安格斯牛排', 500, 0, 1),
('shotburst', '突发焰火', 100, 0, 1),
('sichuanhotchicken', '四川辣子鸡', 500, 0, 1),
('sim', 'Sim卡', 1, 0, 1),
('skin', 'Stock weapon spray', 2, 0, 1),
('skin1', 'Dark green weapon spray', 2, 0, 1),
('skin2', 'Gold weapon spray', 2, 0, 1),
('skin3', 'Pink and white weapon spray', 2, 0, 1),
('skin4', 'Beige weapon spray', 2, 0, 1),
('skin5', 'Dark blue weapon spray', 2, 0, 1),
('skin6', 'Orange and black weapon spray', 2, 0, 1),
('skin7', 'Light grey weapon spray', 2, 0, 1),
('slaughtered_chicken', 'Slaughtered chicken', 1, 0, 1),
('smoothies', '思慕雪', 300, 0, 1),
('snickers', '士力架', 30, 0, 1),
('soda', '苏打水', 300, 0, 1),
('softdrink', '软饮料', 500, 0, 1),
('spicypotatosofttaco', '香辣土豆玉米饼', 300, 0, 1),
('spicytostada', '辣味炸玉米粉圆饼', 300, 0, 1),
('starburst', '星爆烟花', 100, 0, 1),
('starburstcherry', '星爆樱桃', 500, 0, 1),
('starburststrawberry', '星爆草莓', 500, 0, 1),
('steel', '钢', 500, 0, 1),
('stone', '石头', 500, 0, 1),
('sundae', '圣代', 150, 0, 1),
('sundaepie', '好时圣代派', 200, 0, 1),
('suppressor', 'Suppressor', 2, 0, 1),
('sweetfirechickenbreast', '甜烧鸡胸', 500, 0, 1),
('tequila', '龙舌兰酒', 750, 0, 1),
('texasdoublewhopper', '双层皇堡', 300, 0, 1),
('thermite', '铝热剂炸弹', 500, 0, 1),
('ticket', 'Jail Tickets', -1, 0, 1),
('trailburst', '爆竹', 100, 0, 1),
('trapphone', 'Trap Phone', 1, 0, 1),
('triplelayernachos', '三重美味玉米片', 300, 0, 1),
('tylenol', '感冒药', 1, 0, 1),
('up_axon_001', 'body3下绕1', 500, 0, 1),
('up_axon_002', 'body3上绕2', 500, 0, 1),
('up_axon_003', 'body2下绕3', 500, 0, 1),
('up_axon_004', 'body3记录仪4', 500, 0, 1),
('up_axon_005', 'body2记录仪5', 500, 0, 1),
('up_axon_006', 'body2下绕6', 500, 0, 1),
('up_axon_007', '下绕肩咪7', 500, 0, 1),
('up_axon_008', 'body2上饶8', 500, 0, 1),
('up_axon_009', 'body3下饶9', 500, 0, 1),
('up_axon_010', '下饶手咪10', 500, 0, 1),
('up_badge_001', '市警警徽1', 200, 0, 1),
('up_badge_002', '县警警徽2', 200, 0, 1),
('up_badge_003', '鱼猎局警徽3', 200, 0, 1),
('up_badge_004', '州警警徽4', 200, 0, 1),
('up_badge_005', '消防员徽章5', 200, 0, 1),
('up_badge_006', '学员警徽6', 200, 0, 1),
('up_belt_001', '5.56弹匣腰带1', 3000, 0, 1),
('up_belt_002', '斜9mm腰带2', 3000, 0, 1),
('up_belt_003', '皮质腰带3', 3000, 0, 1),
('up_belt_004', '记录仪腰带4', 3000, 0, 1),
('up_belt_005', '蓝手机套腰带5', 3000, 0, 1),
('up_belt_006', '5.56弹匣腰带6', 3000, 0, 1),
('up_belt_007', '斜9mm腰带7', 3000, 0, 1),
('up_belt_008', '黑手机套腰带8', 3000, 0, 1),
('up_belt_009', '教官腰带9', 3000, 0, 1),
('up_belt_010', '新款腰带10', 3000, 0, 1),
('up_belt_011', '前置铐腰带11', 3000, 0, 1),
('up_belt_012', 'FR腰带12', 3000, 0, 1),
('up_belt_013', '无泰瑟腰带13', 3000, 0, 1),
('up_belt_014', '新款手机腰带14', 3000, 0, 1),
('up_belt_015', '新款腰带15', 3000, 0, 1),
('up_belt_016', '斜置泰瑟腰带16', 3000, 0, 1),
('up_belt_017', '腰间对讲机17', 3000, 0, 1),
('up_belt_018', '附包尼龙腰带18', 3000, 0, 1),
('up_belt_019', '大泰瑟腰带19', 3000, 0, 1),
('up_belt_020', '斜置泰瑟腰带20', 3000, 0, 1),
('up_belt_021', '三联9mm腰带21', 3000, 0, 1),
('up_belt_022', '右斜9mm腰带22', 3000, 0, 1),
('up_belt_023', '横置装备腰带23', 3000, 0, 1),
('up_belt_024', '战术腰带24', 3000, 0, 1),
('up_belt_025', '战术腰带25', 3000, 0, 1),
('up_belt_026', '市空中腰带26', 3000, 0, 1),
('up_belt_027', '县空中腰带27', 3000, 0, 1),
('up_belt_028', '大泰瑟腰带28', 3000, 0, 1),
('up_belt_029', '战术腰带29', 3000, 0, 1),
('up_belt_030', '轻量化腰带31', 3000, 0, 1),
('up_belt_031', '腰间对讲机32', 3000, 0, 1),
('up_belt_032', '横9mm腰带33', 3000, 0, 1),
('up_belt_033', '纯尼龙腰带34', 3000, 0, 1),
('up_belt_034', '纯尼龙腰带35', 3000, 0, 1),
('up_belt_035', '前置拷腰带36', 3000, 0, 1),
('up_belt_036', '学员腰带37', 3000, 0, 1),
('up_belt_037', '皮质腰带38', 3000, 0, 1),
('up_belt_038', '皮质腰带39', 3000, 0, 1),
('up_belt_039', '黑手机套腰带40', 3000, 0, 1),
('up_belt_040', '蓝手机套腰带41', 3000, 0, 1),
('up_belt_041', '长泰瑟腰带42', 3000, 0, 1),
('up_belt_042', 'T字棍皮腰带43', 3000, 0, 1),
('up_belt_043', '皮制腰带44', 3000, 0, 1),
('up_belt_044', '皮制腰带45', 3000, 0, 1),
('up_belt_045', '皮制腰带47', 3000, 0, 1),
('up_belt_046', '无泰瑟腰带48', 3000, 0, 1),
('up_belt_047', '右置9mm腰带49', 3000, 0, 1),
('up_belt_048', '腰间对讲机50', 3000, 0, 1),
('up_belt_049', '对讲机加手咪51', 3000, 0, 1),
('up_belt_050', '皮制腰带52', 3000, 0, 1),
('up_hat_001', '州警大盘帽1', 50, 0, 1),
('up_hat_002', '州警骑警盔2', 50, 0, 1),
('up_hat_003', '市警骑警盔3', 50, 0, 1),
('up_hat_004', '县警抓绒帽4', 50, 0, 1),
('up_hat_005', '反光抓绒帽5', 50, 0, 1),
('up_hat_006', '市警抓绒帽6', 50, 0, 1),
('up_hat_007', '市警抓绒帽7', 50, 0, 1),
('up_hat_008', '市反戴棒球帽8', 50, 0, 1),
('up_hat_009', 'ESU反棒球帽9', 50, 0, 1),
('up_hat_010', '县反棒球帽10', 50, 0, 1),
('up_hat_011', '州警蓝小盘帽11', 50, 0, 1),
('up_hat_012', '市警棒球帽12', 50, 0, 1),
('up_hat_013', '县警棒球帽13', 50, 0, 1),
('up_hat_014', '州警棒球帽14', 50, 0, 1),
('up_hat_015', '学员棒球帽15', 50, 0, 1),
('up_hat_016', 'ESU棒球帽16', 50, 0, 1),
('up_hat_017', '鱼猎局棒球帽17', 50, 0, 1),
('up_hat_018', '县警棒球帽18', 50, 0, 1),
('up_hat_019', 'ESU棒球帽19', 50, 0, 1),
('up_hat_020', '市警旧棒球帽20', 50, 0, 1),
('up_hat_021', '县警盘帽21', 50, 0, 1),
('up_hat_022', '县警牛仔帽22', 50, 0, 1),
('up_hat_023', 'ESU战术盔23', 50, 0, 1),
('up_hat_024', '礼帽24', 50, 0, 1),
('up_hat_025', '州警盘帽25', 50, 0, 1),
('up_hat_026', '自行车盔26', 50, 0, 1),
('up_hat_027', '市轻量战术盔27', 1500, 0, 1),
('up_hat_028', '县轻量战术盔28', 1500, 0, 1),
('up_hat_029', '教官盘帽29', 50, 0, 1),
('up_hat_030', 'ESU战术盔30', 1500, 0, 1),
('up_hat_031', 'ESU战术盔31', 1500, 0, 1),
('up_hat_032', '市警飞行盔32', 1500, 0, 1),
('up_hat_033', '县警飞行盔33', 1500, 0, 1),
('up_hat_034', '巡逻战术盔34', 1500, 0, 1),
('up_hat_035', 'FR头盔35', 1500, 0, 1),
('up_hat_036', 'EMS防护盔36', 1500, 0, 1),
('up_hat_037', '防暴头盔37', 1500, 0, 1),
('up_holster_1', '腰间枪套1', 500, 0, 1),
('up_holster_10', '腰间快拔枪套10', 500, 0, 1),
('up_holster_2', '腿部枪套2', 500, 0, 1),
('up_holster_3', '皮制腰间枪套3', 500, 0, 1),
('up_holster_4', '腰间枪套4', 500, 0, 1),
('up_holster_5', '腰间偏下枪套5', 500, 0, 1),
('up_holster_6', '腰间枪套6', 500, 0, 1),
('up_holster_7', '腰间快拔枪套7', 500, 0, 1),
('up_holster_8', '腿部枪套8', 500, 0, 1),
('up_holster_9', '腿部泰瑟枪套9', 500, 0, 1),
('up_mask_001', '防毒面具1', 200, 0, 1),
('up_mask_002', '市警口罩2', 200, 0, 1),
('up_mask_003', '州警口罩3', 200, 0, 1),
('up_mask_004', '县警口罩4', 200, 0, 1),
('up_mask_005', '纯黑口罩5', 200, 0, 1),
('up_mask_006', '纯白口罩6', 200, 0, 1),
('up_mask_007', '医用蓝口罩7', 200, 0, 1),
('up_mask_008', '国旗口罩8', 200, 0, 1),
('up_mask_009', '医用蓝口罩9', 200, 0, 1),
('up_mask_010', '市警口罩10', 200, 0, 1),
('up_mask_011', '半脸面罩11', 200, 0, 1),
('up_vest_001', '电台版JPC背心1', 5000, 0, 1),
('up_vest_002', '电台版JPC县警背心2', 5000, 0, 1),
('up_vest_003', '电台版JPC州警背心3', 5000, 0, 1),
('up_vest_004', '电台版JPC州警彩背心4', 5000, 0, 1),
('up_vest_005', '电台版JPC县警彩背心5', 5000, 0, 1),
('up_vest_006', '无电台JPC市警背心6', 5000, 0, 1),
('up_vest_007', '无电台JPC县警背心7', 5000, 0, 1),
('up_vest_008', '无电台JPC州警背心8', 5000, 0, 1),
('up_vest_009', '无电台JPC州警彩背心9', 5000, 0, 1),
('up_vest_010', '无电台JPC县警彩背心10', 5000, 0, 1),
('up_vest_011', '镇暴背心11', 5000, 0, 1),
('up_vest_012', '6094轻量市警背心12', 5000, 0, 1),
('up_vest_013', '6094轻量县警背心13', 5000, 0, 1),
('up_vest_014', '6094轻量州警背心14', 5000, 0, 1),
('up_vest_015', 'ESU轻量背心15', 5000, 0, 1),
('up_vest_016', '县警轻量背心16', 5000, 0, 1),
('up_vest_017', '市警轻量背心17', 5000, 0, 1),
('up_vest_018', '镇暴轻量背心18', 5000, 0, 1),
('up_vest_019', '学员轻量背心19', 5000, 0, 1),
('up_vest_020', '市警重型巡逻背心20', 5000, 0, 1),
('up_vest_021', '县警重型巡逻背心21', 5000, 0, 1),
('up_vest_022', '州警重型巡逻背心22', 5000, 0, 1),
('up_vest_023', 'ESU重型背心23', 5000, 0, 1),
('up_vest_024', '市警重型巡逻背心24', 5000, 0, 1),
('up_vest_025', '县警重型巡逻背心25', 5000, 0, 1),
('up_vest_026', '州警重型巡逻背心26', 5000, 0, 1),
('up_vest_027', '县警重型巡逻彩背心27', 5000, 0, 1),
('up_vest_028', '市警反光背心28', 5000, 0, 1),
('up_vest_029', '州警反光背心29', 5000, 0, 1),
('up_vest_030', '县警反光背心30', 5000, 0, 1),
('up_vest_031', '工作人员背心31', 5000, 0, 1),
('up_vest_032', '重型JPC州警背心32', 5000, 0, 1),
('up_vest_033', '重型JPC市警背心33', 5000, 0, 1),
('up_vest_034', '重型JPC县警背心34', 5000, 0, 1),
('up_vest_035', '重型JPC县警彩背心35', 5000, 0, 1),
('up_vest_036', 'VICE市警背心36', 5000, 0, 1),
('up_vest_037', 'VICE市警背心37', 5000, 0, 1),
('up_vest_038', 'VICE市警彩背心38', 5000, 0, 1),
('up_vest_039', 'VICE市警背心39', 5000, 0, 1),
('up_vest_040', 'VICE市警背心40', 5000, 0, 1),
('up_vest_041', '重型6094州警背心41', 5000, 0, 1),
('up_vest_042', '重型6094州警背心42', 5000, 0, 1),
('up_vest_043', '重型6094县警背心43', 5000, 0, 1),
('up_vest_044', '重型6094县警背心44', 5000, 0, 1),
('up_vest_045', 'ESU重型背心2 45', 5000, 0, 1),
('up_vest_046', 'SAHP重型背心46', 5000, 0, 1),
('up_vest_047', '市警重型背心47', 5000, 0, 1),
('up_vest_048', '市警软质背心48', 5000, 0, 1),
('up_vest_049', '县警软质彩背心49', 5000, 0, 1),
('up_vest_050', '县警软质绿背心50', 5000, 0, 1),
('up_vest_051', 'VICE软质背心51', 5000, 0, 1),
('up_vest_052', 'SAHP软质背心52', 5000, 0, 1),
('up_vest_053', '市警重型背心2 53', 5000, 0, 1),
('up_vest_054', '县警重型背心2 54', 5000, 0, 1),
('up_vest_055', '州警重型背心2 55', 5000, 0, 1),
('up_vest_056', '市警重型背心3 56', 5000, 0, 1),
('up_vest_057', '县警重型背心3 57', 5000, 0, 1),
('up_vest_058', '州警重型背心3 58', 5000, 0, 1),
('up_vest_059', '州警重型背心3 59', 5000, 0, 1),
('up_vest_060', '市警重型攻坚背心60', 5000, 0, 1),
('up_vest_061', '县警重型攻坚背心61', 5000, 0, 1),
('up_vest_062', '州警重型攻坚背心62', 5000, 0, 1),
('up_vest_063', '市警重型背心4 63', 5000, 0, 1),
('up_vest_064', '县警重型背心4 64', 5000, 0, 1),
('up_vest_065', '州警重型背心4 65', 5000, 0, 1),
('up_vest_066', '市警巡逻背心66', 5000, 0, 1),
('up_vest_067', '州警巡逻背心67', 5000, 0, 1),
('up_vest_068', 'ESU重型背心68', 5000, 0, 1),
('up_vest_069', 'VICE UNIT背心69', 5000, 0, 1),
('up_vest_070', '县警绿重型背心70', 5000, 0, 1),
('up_vest_071', 'ESU重型攻坚背心71', 5000, 0, 1),
('up_vest_072', '保安背心72', 5000, 0, 1),
('valuefries', '超值大薯条', 300, 0, 1),
('veggiespringroll', '蔬菜春卷', 300, 0, 1),
('vodka', '威士忌', 750, 0, 1),
('washed_stone', 'Washed stone', 1, 0, 1),
('water', '矿泉水', 600, 0, 1),
('weapon_advancedrifle', '塔沃尔TAR-21自动步枪', 3500, 0, 1),
('weapon_appistol', '格洛克手枪3', 1000, 0, 1),
('weapon_assaultrifle', 'AK47自动步枪', 4600, 0, 1),
('weapon_assaultrifle_mk2', 'AK升级型自动步枪', 4000, 0, 1),
('weapon_assaultshotgun', 'AA-12霰弹枪', 6000, 0, 1),
('weapon_assaultsmg', 'P90冲锋枪', 3200, 0, 1),
('weapon_autoshotgun', 'Armsel-Striker霰弹枪', 8500, 0, 1),
('weapon_ball', '棒球', 100, 0, 1),
('weapon_bat', '棒球棍', 900, 0, 1),
('weapon_battleaxe', '战斗手斧', 3000, 0, 1),
('weapon_bottle', '碎酒瓶', 100, 0, 1),
('weapon_bullpuprifle', 'QBZ97自动步枪', 3500, 0, 1),
('weapon_bullpuprifle_mk2', 'QBZ97升级型自动步枪', 3400, 0, 1),
('weapon_bullpupshotgun', 'Kel-Tec-KSG霰弹枪', 8500, 0, 1),
('weapon_bzgas', '催泪瓦斯', 250, 0, 1),
('weapon_carbinerifle', 'AR自动步枪', 4400, 0, 1),
('weapon_carbinerifle_mk2', 'HK416自动步枪', 3020, 0, 1),
('weapon_ceramicpistol', '工程塑料手枪', 500, 0, 1),
('weapon_combatmg', 'M249轻机枪', 10700, 0, 1),
('weapon_combatmg_mk2', 'M249升级型轻机枪', 10900, 0, 1),
('weapon_combatpdw', '消音冲锋枪', 3000, 0, 1),
('weapon_combatpistol', '格洛克手枪', 900, 0, 1),
('weapon_compactrifle', 'AK（锯短型）自动步枪', 3000, 0, 1),
('weapon_crowbar', '撬棍', 8000, 0, 1),
('weapon_dagger', '军礼刀', 400, 0, 1),
('weapon_dbshotgun', '双管猎枪', 2000, 0, 1),
('weapon_doubleaction', '转轮手枪', 1300, 0, 1),
('weapon_fireextinguisher', '灭火器', 2000, 0, 1),
('weapon_firework', '烟花发射器', 12000, 0, 1),
('weapon_flare', '信号弹', 200, 0, 1),
('weapon_flaregun', '信号枪', 400, 0, 1),
('weapon_flashlight', '手电筒', 100, 0, 1),
('weapon_golfclub', '高尔夫球棍', 600, 0, 1),
('weapon_grenade', '手榴弹', 390, 0, 1),
('weapon_grenadelauncher', '烟雾发生器', 10000, 0, 1),
('weapon_gusenberg', '汤姆逊冲锋枪', 3860, 0, 1),
('weapon_hammer', '锤子', 300, 0, 1),
('weapon_hatchet', '斧头', 3000, 0, 1),
('weapon_hazardcan', '有害汽油桶', 3000, 0, 1),
('weapon_heavypistol', 'M1911手枪', 1130, 0, 1),
('weapon_heavyshotgun', 'Saiga-12K霰弹枪', 6000, 0, 1),
('weapon_heavysniper', '巴雷特反器材狙击步枪', 14000, 0, 1),
('weapon_heavysniper_mk2', '巴雷特反器材狙击步枪改进型', 15000, 0, 1),
('weapon_knife', '军用匕首', 240, 0, 1),
('weapon_knuckle', '指虎', 50, 0, 1),
('weapon_machete', '大砍刀', 400, 0, 1),
('weapon_machinepistol', 'Tec-9冲锋枪', 1400, 0, 1),
('weapon_marksmanpistol', '运动手枪', 2500, 0, 1),
('weapon_marksmanrifle', 'M14精准射手步枪', 4500, 0, 1),
('weapon_marksmanrifle_mk2', 'M14精准射手步枪改进型', 4300, 0, 1),
('weapon_mg', 'PKM轻机枪', 9500, 0, 1),
('weapon_microsmg', 'UZI冲锋枪', 1000, 0, 1),
('weapon_minismg', '蝎式冲锋枪', 1390, 0, 1),
('weapon_molotov', '莫洛托夫鸡尾酒', 750, 0, 1),
('weapon_musket', '火绳枪', 9000, 0, 1),
('weapon_nightstick', '警棍', 320, 0, 1),
('weapon_petrolcan', '汽油桶', 3000, 0, 1),
('weapon_pipebomb', '土制炸弹', 500, 0, 1),
('weapon_pistol', 'P226手枪', 1100, 0, 1),
('weapon_pistol50', '沙漠之鹰', 3000, 0, 1),
('weapon_pistol_mk2', '格洛克手枪2', 900, 0, 1),
('weapon_poolcue', '桌球棍', 3200, 0, 1),
('weapon_pumpshotgun', '雷明顿霰弹枪', 3600, 0, 1),
('weapon_pumpshotgun_mk2', '雷明顿霰弹枪改进型', 3600, 0, 1),
('weapon_revolver', '0.5转轮', 2320, 0, 1),
('weapon_revolver_mk2', '0.5转轮改进型', 2500, 0, 1),
('weapon_sawnoffshotgun', '豆弹枪', 3000, 0, 1),
('weapon_smg', 'MP5冲锋枪', 3000, 0, 1),
('weapon_smg_mk2', 'MP5冲锋枪改进型', 3000, 0, 1),
('weapon_smokegrenade', '烟雾弹', 250, 0, 1),
('weapon_sniperrifle', '精准狙击步枪', 6800, 0, 1),
('weapon_snowball', '板砖', 2630, 0, 1),
('weapon_snspistol', '小口径转轮手枪', 840, 0, 1),
('weapon_snspistol_mk2', '自卫手枪', 900, 0, 1),
('weapon_specialcarbine', 'G36C自动步枪', 3000, 0, 1),
('weapon_specialcarbine_mk2', 'G36C升级型自动步枪', 3000, 0, 1),
('weapon_stone_hatchet', '石斧', 5000, 0, 1),
('weapon_stungun', 'X26电击枪', 380, 0, 1),
('weapon_switchblade', '折叠刀', 100, 0, 1),
('weapon_vintagepistol', '老式手枪', 600, 0, 1),
('weapon_wrench', '扳手', 1000, 0, 1),
('weed', '未处理的大麻', 500, 0, 1),
('weed_in_pooch', 'Weed in pouch', 1, 0, 1),
('whisky', '伏特加', 750, 0, 1),
('whopper', '皇堡', 300, 0, 1),
('whopper_jr', '迷你皇堡', 300, 0, 1),
('wine', '葡萄酒', 750, 0, 1),
('wood', '木头', 500, 0, 1),
('wool', 'Wool', 1, 0, 1),
('yogurt', '酸奶', 100, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) DEFAULT NULL,
  `whitelisted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
('ambulance', 'Ambulance', 0),
('banker', 'Banker', 0),
('cardealer', 'Car Dealer', 0),
('fisherman', 'Fisherman', 0),
('fueler', 'Fueler', 0),
('lumberjack', 'Lumberjack', 0),
('mechanic', 'Mechanic', 0),
('miner', 'Miner', 0),
('police', 'Police', 0),
('realestateagent', 'Realtor', 0),
('reporter', 'Reporter', 0),
('slaughterer', 'Butcher', 0),
('tailor', 'Tailor', 0),
('taxi', 'Taxi', 0),
('unemployed', 'Unemployed', 0);

-- --------------------------------------------------------

--
-- Table structure for table `job_grades`
--

CREATE TABLE `job_grades` (
  `id` int(11) NOT NULL,
  `job_name` varchar(50) DEFAULT NULL,
  `grade` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `salary` int(11) NOT NULL,
  `skin_male` longtext NOT NULL,
  `skin_female` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `job_grades`
--

INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
(1, 'unemployed', 0, 'unemployed', 'Unemployed', 200, '{}', '{}'),
(6, 'police', 0, 'recruit', 'Recruit', 20, '{}', '{}'),
(7, 'police', 1, 'officer', 'Officer', 40, '{}', '{}'),
(8, 'police', 2, 'sergeant', 'Sergeant', 60, '{}', '{}'),
(9, 'police', 3, 'lieutenant', 'Lieutenant', 85, '{}', '{}'),
(10, 'police', 4, 'boss', 'Chief', 100, '{}', '{}'),
(11, 'ambulance', 0, 'ambulance', 'Ambulancier', 20, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(12, 'ambulance', 1, 'doctor', 'Medecin', 40, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(13, 'ambulance', 2, 'chief_doctor', 'Medecin-chef', 60, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(14, 'ambulance', 3, 'boss', 'Chirurgien', 80, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(15, 'banker', 0, 'advisor', 'Advisor', 10, '{}', '{}'),
(16, 'banker', 1, 'banker', 'Banker', 20, '{}', '{}'),
(17, 'banker', 2, 'business_banker', 'Business Banker', 30, '{}', '{}'),
(18, 'banker', 3, 'trader', 'Trader', 40, '{}', '{}'),
(19, 'banker', 4, 'boss', 'Lead Banker', 0, '{}', '{}'),
(20, 'realestateagent', 0, 'location', 'Renting Agent', 10, '{}', '{}'),
(21, 'realestateagent', 1, 'vendeur', 'Agent', 25, '{}', '{}'),
(22, 'realestateagent', 2, 'gestion', 'Management', 40, '{}', '{}'),
(23, 'realestateagent', 3, 'boss', 'Broker', 0, '{}', '{}'),
(24, 'mechanic', 0, 'recrue', 'Recruit', 12, '{}', '{}'),
(25, 'mechanic', 1, 'novice', 'Novice', 24, '{}', '{}'),
(26, 'mechanic', 2, 'experimente', 'Experienced', 36, '{}', '{}'),
(27, 'mechanic', 3, 'chief', 'Leader', 48, '{}', '{}'),
(28, 'mechanic', 4, 'boss', 'Boss', 0, '{}', '{}'),
(29, 'lumberjack', 0, 'employee', 'Employee', 0, '{}', '{}'),
(30, 'fisherman', 0, 'employee', 'Employee', 0, '{}', '{}'),
(31, 'fueler', 0, 'employee', 'Employee', 0, '{}', '{}'),
(32, 'reporter', 0, 'employee', 'Employee', 0, '{}', '{}'),
(33, 'tailor', 0, 'employee', 'Employee', 0, '{\"mask_1\":0,\"arms\":1,\"glasses_1\":0,\"hair_color_2\":4,\"makeup_1\":0,\"face\":19,\"glasses\":0,\"mask_2\":0,\"makeup_3\":0,\"skin\":29,\"helmet_2\":0,\"lipstick_4\":0,\"sex\":0,\"torso_1\":24,\"makeup_2\":0,\"bags_2\":0,\"chain_2\":0,\"ears_1\":-1,\"bags_1\":0,\"bproof_1\":0,\"shoes_2\":0,\"lipstick_2\":0,\"chain_1\":0,\"tshirt_1\":0,\"eyebrows_3\":0,\"pants_2\":0,\"beard_4\":0,\"torso_2\":0,\"beard_2\":6,\"ears_2\":0,\"hair_2\":0,\"shoes_1\":36,\"tshirt_2\":0,\"beard_3\":0,\"hair_1\":2,\"hair_color_1\":0,\"pants_1\":48,\"helmet_1\":-1,\"bproof_2\":0,\"eyebrows_4\":0,\"eyebrows_2\":0,\"decals_1\":0,\"age_2\":0,\"beard_1\":5,\"shoes\":10,\"lipstick_1\":0,\"eyebrows_1\":0,\"glasses_2\":0,\"makeup_4\":0,\"decals_2\":0,\"lipstick_3\":0,\"age_1\":0}', '{\"mask_1\":0,\"arms\":5,\"glasses_1\":5,\"hair_color_2\":4,\"makeup_1\":0,\"face\":19,\"glasses\":0,\"mask_2\":0,\"makeup_3\":0,\"skin\":29,\"helmet_2\":0,\"lipstick_4\":0,\"sex\":1,\"torso_1\":52,\"makeup_2\":0,\"bags_2\":0,\"chain_2\":0,\"ears_1\":-1,\"bags_1\":0,\"bproof_1\":0,\"shoes_2\":1,\"lipstick_2\":0,\"chain_1\":0,\"tshirt_1\":23,\"eyebrows_3\":0,\"pants_2\":0,\"beard_4\":0,\"torso_2\":0,\"beard_2\":6,\"ears_2\":0,\"hair_2\":0,\"shoes_1\":42,\"tshirt_2\":4,\"beard_3\":0,\"hair_1\":2,\"hair_color_1\":0,\"pants_1\":36,\"helmet_1\":-1,\"bproof_2\":0,\"eyebrows_4\":0,\"eyebrows_2\":0,\"decals_1\":0,\"age_2\":0,\"beard_1\":5,\"shoes\":10,\"lipstick_1\":0,\"eyebrows_1\":0,\"glasses_2\":0,\"makeup_4\":0,\"decals_2\":0,\"lipstick_3\":0,\"age_1\":0}'),
(34, 'miner', 0, 'employee', 'Employee', 0, '{\"tshirt_2\":1,\"ears_1\":8,\"glasses_1\":15,\"torso_2\":0,\"ears_2\":2,\"glasses_2\":3,\"shoes_2\":1,\"pants_1\":75,\"shoes_1\":51,\"bags_1\":0,\"helmet_2\":0,\"pants_2\":7,\"torso_1\":71,\"tshirt_1\":59,\"arms\":2,\"bags_2\":0,\"helmet_1\":0}', '{}'),
(35, 'slaughterer', 0, 'employee', 'Employee', 0, '{\"age_1\":0,\"glasses_2\":0,\"beard_1\":5,\"decals_2\":0,\"beard_4\":0,\"shoes_2\":0,\"tshirt_2\":0,\"lipstick_2\":0,\"hair_2\":0,\"arms\":67,\"pants_1\":36,\"skin\":29,\"eyebrows_2\":0,\"shoes\":10,\"helmet_1\":-1,\"lipstick_1\":0,\"helmet_2\":0,\"hair_color_1\":0,\"glasses\":0,\"makeup_4\":0,\"makeup_1\":0,\"hair_1\":2,\"bproof_1\":0,\"bags_1\":0,\"mask_1\":0,\"lipstick_3\":0,\"chain_1\":0,\"eyebrows_4\":0,\"sex\":0,\"torso_1\":56,\"beard_2\":6,\"shoes_1\":12,\"decals_1\":0,\"face\":19,\"lipstick_4\":0,\"tshirt_1\":15,\"mask_2\":0,\"age_2\":0,\"eyebrows_3\":0,\"chain_2\":0,\"glasses_1\":0,\"ears_1\":-1,\"bags_2\":0,\"ears_2\":0,\"torso_2\":0,\"bproof_2\":0,\"makeup_2\":0,\"eyebrows_1\":0,\"makeup_3\":0,\"pants_2\":0,\"beard_3\":0,\"hair_color_2\":4}', '{\"age_1\":0,\"glasses_2\":0,\"beard_1\":5,\"decals_2\":0,\"beard_4\":0,\"shoes_2\":0,\"tshirt_2\":0,\"lipstick_2\":0,\"hair_2\":0,\"arms\":72,\"pants_1\":45,\"skin\":29,\"eyebrows_2\":0,\"shoes\":10,\"helmet_1\":-1,\"lipstick_1\":0,\"helmet_2\":0,\"hair_color_1\":0,\"glasses\":0,\"makeup_4\":0,\"makeup_1\":0,\"hair_1\":2,\"bproof_1\":0,\"bags_1\":0,\"mask_1\":0,\"lipstick_3\":0,\"chain_1\":0,\"eyebrows_4\":0,\"sex\":1,\"torso_1\":49,\"beard_2\":6,\"shoes_1\":24,\"decals_1\":0,\"face\":19,\"lipstick_4\":0,\"tshirt_1\":9,\"mask_2\":0,\"age_2\":0,\"eyebrows_3\":0,\"chain_2\":0,\"glasses_1\":5,\"ears_1\":-1,\"bags_2\":0,\"ears_2\":0,\"torso_2\":0,\"bproof_2\":0,\"makeup_2\":0,\"eyebrows_1\":0,\"makeup_3\":0,\"pants_2\":0,\"beard_3\":0,\"hair_color_2\":4}'),
(36, 'taxi', 0, 'recrue', 'Recruit', 12, '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":32,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":31,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":0,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":27,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":0,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":0,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":10,\"pants_1\":24}', '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":57,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":38,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":1,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":21,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":1,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":5,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":49,\"pants_1\":11}'),
(37, 'taxi', 1, 'novice', 'Cabby', 24, '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":32,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":31,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":0,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":27,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":0,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":0,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":10,\"pants_1\":24}', '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":57,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":38,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":1,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":21,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":1,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":5,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":49,\"pants_1\":11}'),
(38, 'taxi', 2, 'experimente', 'Experienced', 36, '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":26,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":57,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":4,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":11,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":0,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":0,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":0,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":10,\"pants_1\":24}', '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":57,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":38,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":1,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":21,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":1,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":5,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":49,\"pants_1\":11}'),
(39, 'taxi', 3, 'uber', 'Uber Cabby', 48, '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":26,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":57,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":4,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":11,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":0,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":0,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":0,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":10,\"pants_1\":24}', '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":57,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":38,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":1,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":21,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":1,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":5,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":49,\"pants_1\":11}'),
(40, 'taxi', 4, 'boss', 'Lead Cabby', 0, '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":29,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":31,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":4,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":1,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":0,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":0,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":0,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":4,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":10,\"pants_1\":24}', '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":57,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":38,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":1,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":21,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":1,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":5,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":49,\"pants_1\":11}'),
(45, 'cardealer', 0, 'recruit', 'Recruit', 10, '{}', '{}'),
(46, 'cardealer', 1, 'novice', 'Novice', 25, '{}', '{}'),
(47, 'cardealer', 2, 'experienced', 'Experienced', 40, '{}', '{}'),
(48, 'cardealer', 3, 'boss', 'Boss', 0, '{}', '{}');

-- --------------------------------------------------------

--
-- Table structure for table `licenses`
--

CREATE TABLE `licenses` (
  `type` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `licenses`
--

INSERT INTO `licenses` (`type`, `label`) VALUES
('aircraft', 'Aircraft License'),
('boating', 'Boating License'),
('dmv', 'Driving Permit'),
('drive', 'Drivers License'),
('drive_bike', 'Motorcycle License'),
('drive_truck', 'Commercial Drivers License'),
('weapon', 'Weapons license'),
('weed_processing', 'Weed Processing License');

-- --------------------------------------------------------

--
-- Table structure for table `m3_uber_points`
--

CREATE TABLE `m3_uber_points` (
  `id` int(11) NOT NULL,
  `identifier` varchar(255) DEFAULT NULL,
  `point` int(11) DEFAULT NULL,
  `money` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `owned_properties`
--

CREATE TABLE `owned_properties` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `rented` int(11) NOT NULL,
  `owner` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `owned_vehicles`
--

CREATE TABLE `owned_vehicles` (
  `owner` varchar(255) NOT NULL,
  `plate` varchar(12) NOT NULL,
  `vehicle` longtext DEFAULT NULL,
  `type` varchar(20) NOT NULL DEFAULT 'car',
  `job` varchar(20) NOT NULL DEFAULT 'civ',
  `category` varchar(50) DEFAULT NULL,
  `name` varchar(60) NOT NULL DEFAULT 'Unknown',
  `fuel` int(11) NOT NULL DEFAULT 100,
  `stored` tinyint(1) NOT NULL DEFAULT 0,
  `date` varchar(255) DEFAULT NULL,
  `paidprice` int(11) NOT NULL DEFAULT 0,
  `finance` int(32) NOT NULL DEFAULT 0,
  `repaytime` int(32) NOT NULL DEFAULT 0,
  `model` varchar(60) NOT NULL,
  `storedhouse` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `phone_app_chat`
--

CREATE TABLE `phone_app_chat` (
  `id` int(11) NOT NULL,
  `channel` varchar(20) NOT NULL,
  `message` varchar(255) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `phone_calls`
--

CREATE TABLE `phone_calls` (
  `id` int(11) NOT NULL,
  `owner` varchar(255) NOT NULL COMMENT 'Num tel proprio',
  `num` varchar(10) NOT NULL COMMENT 'Num reférence du contact',
  `incoming` int(11) NOT NULL COMMENT 'Défini si on est à l''origine de l''appels',
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `accepts` int(11) NOT NULL COMMENT 'Appels accepter ou pas'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `phone_ch_reddit`
--

CREATE TABLE `phone_ch_reddit` (
  `id` int(11) NOT NULL,
  `redgkit` varchar(20) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `phone_messages`
--

CREATE TABLE `phone_messages` (
  `id` int(11) NOT NULL,
  `transmitter` varchar(10) NOT NULL,
  `receiver` varchar(10) NOT NULL,
  `message` varchar(255) NOT NULL DEFAULT '0',
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `isRead` int(11) NOT NULL DEFAULT 0,
  `owner` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `phone_reddit`
--

CREATE TABLE `phone_reddit` (
  `id` int(11) NOT NULL,
  `redgkit` varchar(20) DEFAULT NULL,
  `reditsage` varchar(255) DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `phone_shops`
--

CREATE TABLE `phone_shops` (
  `id` int(11) NOT NULL,
  `store` varchar(255) NOT NULL,
  `item` varchar(100) NOT NULL,
  `price` int(11) NOT NULL,
  `label` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `phone_users_contacts`
--

CREATE TABLE `phone_users_contacts` (
  `id` int(11) NOT NULL,
  `identifier` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `number` varchar(10) CHARACTER SET utf8mb4 DEFAULT NULL,
  `display` varchar(64) CHARACTER SET utf8mb4 NOT NULL DEFAULT '-1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `properties`
--

CREATE TABLE `properties` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `entering` varchar(255) DEFAULT NULL,
  `exit` varchar(255) DEFAULT NULL,
  `inside` varchar(255) DEFAULT NULL,
  `outside` varchar(255) DEFAULT NULL,
  `ipls` varchar(255) DEFAULT '[]',
  `gateway` varchar(255) DEFAULT NULL,
  `is_single` int(11) DEFAULT NULL,
  `is_room` int(11) DEFAULT NULL,
  `is_gateway` int(11) DEFAULT NULL,
  `room_menu` varchar(255) DEFAULT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `properties`
--

INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`) VALUES
(1, 'WhispymoundDrive', '2677 Whispymound Drive', '{\"y\":564.89,\"z\":182.959,\"x\":119.384}', '{\"x\":117.347,\"y\":559.506,\"z\":183.304}', '{\"y\":557.032,\"z\":183.301,\"x\":118.037}', '{\"y\":567.798,\"z\":182.131,\"x\":119.249}', '[]', NULL, 1, 1, 0, '{\"x\":118.748,\"y\":566.573,\"z\":175.697}', 1500000),
(2, 'NorthConkerAvenue2045', '2045 North Conker Avenue', '{\"x\":372.796,\"y\":428.327,\"z\":144.685}', '{\"x\":373.548,\"y\":422.982,\"z\":144.907},', '{\"y\":420.075,\"z\":145.904,\"x\":372.161}', '{\"x\":372.454,\"y\":432.886,\"z\":143.443}', '[]', NULL, 1, 1, 0, '{\"x\":377.349,\"y\":429.422,\"z\":137.3}', 1500000),
(3, 'RichardMajesticApt2', 'Richard Majestic, Apt 2', '{\"y\":-379.165,\"z\":37.961,\"x\":-936.363}', '{\"y\":-365.476,\"z\":113.274,\"x\":-913.097}', '{\"y\":-367.637,\"z\":113.274,\"x\":-918.022}', '{\"y\":-382.023,\"z\":37.961,\"x\":-943.626}', '[]', NULL, 1, 1, 0, '{\"x\":-927.554,\"y\":-377.744,\"z\":112.674}', 1700000),
(4, 'NorthConkerAvenue2044', '2044 North Conker Avenue', '{\"y\":440.8,\"z\":146.702,\"x\":346.964}', '{\"y\":437.456,\"z\":148.394,\"x\":341.683}', '{\"y\":435.626,\"z\":148.394,\"x\":339.595}', '{\"x\":350.535,\"y\":443.329,\"z\":145.764}', '[]', NULL, 1, 1, 0, '{\"x\":337.726,\"y\":436.985,\"z\":140.77}', 1500000),
(5, 'WildOatsDrive', '3655 Wild Oats Drive', '{\"y\":502.696,\"z\":136.421,\"x\":-176.003}', '{\"y\":497.817,\"z\":136.653,\"x\":-174.349}', '{\"y\":495.069,\"z\":136.666,\"x\":-173.331}', '{\"y\":506.412,\"z\":135.0664,\"x\":-177.927}', '[]', NULL, 1, 1, 0, '{\"x\":-174.725,\"y\":493.095,\"z\":129.043}', 1500000),
(6, 'HillcrestAvenue2862', '2862 Hillcrest Avenue', '{\"y\":596.58,\"z\":142.641,\"x\":-686.554}', '{\"y\":591.988,\"z\":144.392,\"x\":-681.728}', '{\"y\":590.608,\"z\":144.392,\"x\":-680.124}', '{\"y\":599.019,\"z\":142.059,\"x\":-689.492}', '[]', NULL, 1, 1, 0, '{\"x\":-680.46,\"y\":588.6,\"z\":136.769}', 1500000),
(7, 'LowEndApartment', 'Basic apartment', '{\"y\":-1078.735,\"z\":28.4031,\"x\":292.528}', '{\"y\":-1007.152,\"z\":-102.002,\"x\":265.845}', '{\"y\":-1002.802,\"z\":-100.008,\"x\":265.307}', '{\"y\":-1078.669,\"z\":28.401,\"x\":296.738}', '[]', NULL, 1, 1, 0, '{\"x\":265.916,\"y\":-999.38,\"z\":-100.008}', 562500),
(8, 'MadWayneThunder', '2113 Mad Wayne Thunder', '{\"y\":454.955,\"z\":96.462,\"x\":-1294.433}', '{\"x\":-1289.917,\"y\":449.541,\"z\":96.902}', '{\"y\":446.322,\"z\":96.899,\"x\":-1289.642}', '{\"y\":455.453,\"z\":96.517,\"x\":-1298.851}', '[]', NULL, 1, 1, 0, '{\"x\":-1287.306,\"y\":455.901,\"z\":89.294}', 1500000),
(9, 'HillcrestAvenue2874', '2874 Hillcrest Avenue', '{\"x\":-853.346,\"y\":696.678,\"z\":147.782}', '{\"y\":690.875,\"z\":151.86,\"x\":-859.961}', '{\"y\":688.361,\"z\":151.857,\"x\":-859.395}', '{\"y\":701.628,\"z\":147.773,\"x\":-855.007}', '[]', NULL, 1, 1, 0, '{\"x\":-858.543,\"y\":697.514,\"z\":144.253}', 1500000),
(10, 'HillcrestAvenue2868', '2868 Hillcrest Avenue', '{\"y\":620.494,\"z\":141.588,\"x\":-752.82}', '{\"y\":618.62,\"z\":143.153,\"x\":-759.317}', '{\"y\":617.629,\"z\":143.153,\"x\":-760.789}', '{\"y\":621.281,\"z\":141.254,\"x\":-750.919}', '[]', NULL, 1, 1, 0, '{\"x\":-762.504,\"y\":618.992,\"z\":135.53}', 1500000),
(11, 'TinselTowersApt12', 'Tinsel Towers, Apt 42', '{\"y\":37.025,\"z\":42.58,\"x\":-618.299}', '{\"y\":58.898,\"z\":97.2,\"x\":-603.301}', '{\"y\":58.941,\"z\":97.2,\"x\":-608.741}', '{\"y\":30.603,\"z\":42.524,\"x\":-620.017}', '[]', NULL, 1, 1, 0, '{\"x\":-622.173,\"y\":54.585,\"z\":96.599}', 1700000),
(12, 'MiltonDrive', 'Milton Drive', '{\"x\":-775.17,\"y\":312.01,\"z\":84.658}', NULL, NULL, '{\"x\":-775.346,\"y\":306.776,\"z\":84.7}', '[]', NULL, 0, 0, 1, NULL, 0),
(13, 'Modern1Apartment', 'Modern Apartment 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_01_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-766.661,\"y\":327.672,\"z\":210.396}', 1300000),
(14, 'Modern2Apartment', 'Modern Apartment 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_01_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.735,\"y\":326.757,\"z\":186.313}', 1300000),
(15, 'Modern3Apartment', 'Modern Apartment 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_01_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.386,\"y\":330.782,\"z\":195.08}', 1300000),
(16, 'Mody1Apartment', 'Mody Apartment 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_02_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-766.615,\"y\":327.878,\"z\":210.396}', 1300000),
(17, 'Mody2Apartment', 'Mody Apartment 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_02_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.297,\"y\":327.092,\"z\":186.313}', 1300000),
(18, 'Mody3Apartment', 'Mody Apartment 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_02_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.303,\"y\":330.932,\"z\":195.085}', 1300000),
(19, 'Vibrant1Apartment', 'Vibrant Apartment 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_03_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.885,\"y\":327.641,\"z\":210.396}', 1300000),
(20, 'Vibrant2Apartment', 'Vibrant Apartment 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_03_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.607,\"y\":327.344,\"z\":186.313}', 1300000),
(21, 'Vibrant3Apartment', 'Vibrant Apartment 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_03_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.525,\"y\":330.851,\"z\":195.085}', 1300000),
(22, 'Sharp1Apartment', 'Sharp Apartment 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_04_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-766.527,\"y\":327.89,\"z\":210.396}', 1300000),
(23, 'Sharp2Apartment', 'Sharp Apartment 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_04_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.642,\"y\":326.497,\"z\":186.313}', 1300000),
(24, 'Sharp3Apartment', 'Sharp Apartment 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_04_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.503,\"y\":331.318,\"z\":195.085}', 1300000),
(25, 'Monochrome1Apartment', 'Monochrome Apartment 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_05_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-766.289,\"y\":328.086,\"z\":210.396}', 1300000),
(26, 'Monochrome2Apartment', 'Monochrome Apartment 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_05_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.692,\"y\":326.762,\"z\":186.313}', 1300000),
(27, 'Monochrome3Apartment', 'Monochrome Apartment 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_05_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.094,\"y\":330.976,\"z\":195.085}', 1300000),
(28, 'Seductive1Apartment', 'Seductive Apartment 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_06_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-766.263,\"y\":328.104,\"z\":210.396}', 1300000),
(29, 'Seductive2Apartment', 'Seductive Apartment 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_06_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.655,\"y\":326.611,\"z\":186.313}', 1300000),
(30, 'Seductive3Apartment', 'Seductive Apartment 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_06_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.3,\"y\":331.414,\"z\":195.085}', 1300000),
(31, 'Regal1Apartment', 'Regal Apartment 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_07_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.956,\"y\":328.257,\"z\":210.396}', 1300000),
(32, 'Regal2Apartment', 'Regal Apartment 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_07_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.545,\"y\":326.659,\"z\":186.313}', 1300000),
(33, 'Regal3Apartment', 'Regal Apartment 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_07_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.087,\"y\":331.429,\"z\":195.123}', 1300000),
(34, 'Aqua1Apartment', 'Aqua Apartment 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_08_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-766.187,\"y\":328.47,\"z\":210.396}', 1300000),
(35, 'Aqua2Apartment', 'Aqua Apartment 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_08_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.658,\"y\":326.563,\"z\":186.313}', 1300000),
(36, 'Aqua3Apartment', 'Aqua Apartment 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_08_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.287,\"y\":331.084,\"z\":195.086}', 1300000),
(37, 'IntegrityWay', '4 Integrity Way', '{\"x\":-47.804,\"y\":-585.867,\"z\":36.956}', NULL, NULL, '{\"x\":-54.178,\"y\":-583.762,\"z\":35.798}', '[]', NULL, 0, 0, 1, NULL, 0),
(38, 'IntegrityWay28', '4 Integrity Way - Apt 28', NULL, '{\"x\":-31.409,\"y\":-594.927,\"z\":79.03}', '{\"x\":-26.098,\"y\":-596.909,\"z\":79.03}', NULL, '[]', 'IntegrityWay', 0, 1, 0, '{\"x\":-11.923,\"y\":-597.083,\"z\":78.43}', 1700000),
(39, 'IntegrityWay30', '4 Integrity Way - Apt 30', NULL, '{\"x\":-17.702,\"y\":-588.524,\"z\":89.114}', '{\"x\":-16.21,\"y\":-582.569,\"z\":89.114}', NULL, '[]', 'IntegrityWay', 0, 1, 0, '{\"x\":-26.327,\"y\":-588.384,\"z\":89.123}', 1700000),
(40, 'DellPerroHeights', 'Dell Perro Heights', '{\"x\":-1447.06,\"y\":-538.28,\"z\":33.74}', NULL, NULL, '{\"x\":-1440.022,\"y\":-548.696,\"z\":33.74}', '[]', NULL, 0, 0, 1, NULL, 0),
(41, 'DellPerroHeightst4', 'Dell Perro Heights - Apt 28', NULL, '{\"x\":-1452.125,\"y\":-540.591,\"z\":73.044}', '{\"x\":-1455.435,\"y\":-535.79,\"z\":73.044}', NULL, '[]', 'DellPerroHeights', 0, 1, 0, '{\"x\":-1467.058,\"y\":-527.571,\"z\":72.443}', 1700000),
(42, 'DellPerroHeightst7', 'Dell Perro Heights - Apt 30', NULL, '{\"x\":-1451.562,\"y\":-523.535,\"z\":55.928}', '{\"x\":-1456.02,\"y\":-519.209,\"z\":55.929}', NULL, '[]', 'DellPerroHeights', 0, 1, 0, '{\"x\":-1457.026,\"y\":-530.219,\"z\":55.937}', 1700000),
(43, 'MazeBankBuilding', 'Maze Bank Building', '{\"x\":-79.18,\"y\":-795.92,\"z\":43.35}', NULL, NULL, '{\"x\":-72.50,\"y\":-786.92,\"z\":43.40}', '[]', NULL, 0, 0, 1, NULL, 0),
(44, 'OldSpiceWarm', 'Old Spice Warm', NULL, '{\"x\":-75.69,\"y\":-827.08,\"z\":242.43}', '{\"x\":-75.51,\"y\":-823.90,\"z\":242.43}', NULL, '[\"ex_dt1_11_office_01a\"]', 'MazeBankBuilding', 0, 1, 0, '{\"x\":-71.81,\"y\":-814.34,\"z\":242.39}', 5000000),
(45, 'OldSpiceClassical', 'Old Spice Classical', NULL, '{\"x\":-75.69,\"y\":-827.08,\"z\":242.43}', '{\"x\":-75.51,\"y\":-823.90,\"z\":242.43}', NULL, '[\"ex_dt1_11_office_01b\"]', 'MazeBankBuilding', 0, 1, 0, '{\"x\":-71.81,\"y\":-814.34,\"z\":242.39}', 5000000),
(46, 'OldSpiceVintage', 'Old Spice Vintage', NULL, '{\"x\":-75.69,\"y\":-827.08,\"z\":242.43}', '{\"x\":-75.51,\"y\":-823.90,\"z\":242.43}', NULL, '[\"ex_dt1_11_office_01c\"]', 'MazeBankBuilding', 0, 1, 0, '{\"x\":-71.81,\"y\":-814.34,\"z\":242.39}', 5000000),
(47, 'ExecutiveRich', 'Executive Rich', NULL, '{\"x\":-75.69,\"y\":-827.08,\"z\":242.43}', '{\"x\":-75.51,\"y\":-823.90,\"z\":242.43}', NULL, '[\"ex_dt1_11_office_02b\"]', 'MazeBankBuilding', 0, 1, 0, '{\"x\":-71.81,\"y\":-814.34,\"z\":242.39}', 5000000),
(48, 'ExecutiveCool', 'Executive Cool', NULL, '{\"x\":-75.69,\"y\":-827.08,\"z\":242.43}', '{\"x\":-75.51,\"y\":-823.90,\"z\":242.43}', NULL, '[\"ex_dt1_11_office_02c\"]', 'MazeBankBuilding', 0, 1, 0, '{\"x\":-71.81,\"y\":-814.34,\"z\":242.39}', 5000000),
(49, 'ExecutiveContrast', 'Executive Contrast', NULL, '{\"x\":-75.69,\"y\":-827.08,\"z\":242.43}', '{\"x\":-75.51,\"y\":-823.90,\"z\":242.43}', NULL, '[\"ex_dt1_11_office_02a\"]', 'MazeBankBuilding', 0, 1, 0, '{\"x\":-71.81,\"y\":-814.34,\"z\":242.39}', 5000000),
(50, 'PowerBrokerIce', 'Power Broker Ice', NULL, '{\"x\":-75.69,\"y\":-827.08,\"z\":242.43}', '{\"x\":-75.51,\"y\":-823.90,\"z\":242.43}', NULL, '[\"ex_dt1_11_office_03a\"]', 'MazeBankBuilding', 0, 1, 0, '{\"x\":-71.81,\"y\":-814.34,\"z\":242.39}', 5000000),
(51, 'PowerBrokerConservative', 'Power Broker Conservative', NULL, '{\"x\":-75.69,\"y\":-827.08,\"z\":242.43}', '{\"x\":-75.51,\"y\":-823.90,\"z\":242.43}', NULL, '[\"ex_dt1_11_office_03b\"]', 'MazeBankBuilding', 0, 1, 0, '{\"x\":-71.81,\"y\":-814.34,\"z\":242.39}', 5000000),
(52, 'PowerBrokerPolished', 'Power Broker Polished', NULL, '{\"x\":-75.69,\"y\":-827.08,\"z\":242.43}', '{\"x\":-75.51,\"y\":-823.90,\"z\":242.43}', NULL, '[\"ex_dt1_11_office_03c\"]', 'MazeBankBuilding', 0, 1, 0, '{\"x\":-71.81,\"y\":-814.34,\"z\":242.39}', 5000000),
(53, 'LomBank', 'Lom Bank', '{\"x\":-1581.36,\"y\":-558.23,\"z\":34.07}', NULL, NULL, '{\"x\":-1583.60,\"y\":-555.12,\"z\":34.07}', '[]', NULL, 0, 0, 1, NULL, 0),
(54, 'LBOldSpiceWarm', 'LB Old Spice Warm', NULL, '{\"x\":-1579.53,\"y\":-564.89,\"z\":107.62}', '{\"x\":-1576.42,\"y\":-567.57,\"z\":107.62}', NULL, '[\"ex_sm_13_office_01a\"]', 'LomBank', 0, 1, 0, '{\"x\":-1571.26,\"y\":-575.76,\"z\":107.52}', 3500000),
(55, 'LBOldSpiceClassical', 'LB Old Spice Classical', NULL, '{\"x\":-1579.53,\"y\":-564.89,\"z\":107.62}', '{\"x\":-1576.42,\"y\":-567.57,\"z\":107.62}', NULL, '[\"ex_sm_13_office_01b\"]', 'LomBank', 0, 1, 0, '{\"x\":-1571.26,\"y\":-575.76,\"z\":107.52}', 3500000),
(56, 'LBOldSpiceVintage', 'LB Old Spice Vintage', NULL, '{\"x\":-1579.53,\"y\":-564.89,\"z\":107.62}', '{\"x\":-1576.42,\"y\":-567.57,\"z\":107.62}', NULL, '[\"ex_sm_13_office_01c\"]', 'LomBank', 0, 1, 0, '{\"x\":-1571.26,\"y\":-575.76,\"z\":107.52}', 3500000),
(57, 'LBExecutiveRich', 'LB Executive Rich', NULL, '{\"x\":-1579.53,\"y\":-564.89,\"z\":107.62}', '{\"x\":-1576.42,\"y\":-567.57,\"z\":107.62}', NULL, '[\"ex_sm_13_office_02b\"]', 'LomBank', 0, 1, 0, '{\"x\":-1571.26,\"y\":-575.76,\"z\":107.52}', 3500000),
(58, 'LBExecutiveCool', 'LB Executive Cool', NULL, '{\"x\":-1579.53,\"y\":-564.89,\"z\":107.62}', '{\"x\":-1576.42,\"y\":-567.57,\"z\":107.62}', NULL, '[\"ex_sm_13_office_02c\"]', 'LomBank', 0, 1, 0, '{\"x\":-1571.26,\"y\":-575.76,\"z\":107.52}', 3500000),
(59, 'LBExecutiveContrast', 'LB Executive Contrast', NULL, '{\"x\":-1579.53,\"y\":-564.89,\"z\":107.62}', '{\"x\":-1576.42,\"y\":-567.57,\"z\":107.62}', NULL, '[\"ex_sm_13_office_02a\"]', 'LomBank', 0, 1, 0, '{\"x\":-1571.26,\"y\":-575.76,\"z\":107.52}', 3500000),
(60, 'LBPowerBrokerIce', 'LB Power Broker Ice', NULL, '{\"x\":-1579.53,\"y\":-564.89,\"z\":107.62}', '{\"x\":-1576.42,\"y\":-567.57,\"z\":107.62}', NULL, '[\"ex_sm_13_office_03a\"]', 'LomBank', 0, 1, 0, '{\"x\":-1571.26,\"y\":-575.76,\"z\":107.52}', 3500000),
(61, 'LBPowerBrokerConservative', 'LB Power Broker Conservative', NULL, '{\"x\":-1579.53,\"y\":-564.89,\"z\":107.62}', '{\"x\":-1576.42,\"y\":-567.57,\"z\":107.62}', NULL, '[\"ex_sm_13_office_03b\"]', 'LomBank', 0, 1, 0, '{\"x\":-1571.26,\"y\":-575.76,\"z\":107.52}', 3500000),
(62, 'LBPowerBrokerPolished', 'LB Power Broker Polished', NULL, '{\"x\":-1579.53,\"y\":-564.89,\"z\":107.62}', '{\"x\":-1576.42,\"y\":-567.57,\"z\":107.62}', NULL, '[\"ex_sm_13_office_03c\"]', 'LomBank', 0, 1, 0, '{\"x\":-1571.26,\"y\":-575.76,\"z\":107.52}', 3500000),
(63, 'MazeBankWest', 'Maze Bank West', '{\"x\":-1379.58,\"y\":-499.63,\"z\":32.22}', NULL, NULL, '{\"x\":-1378.95,\"y\":-502.82,\"z\":32.22}', '[]', NULL, 0, 0, 1, NULL, 0),
(64, 'MBWOldSpiceWarm', 'MBW Old Spice Warm', NULL, '{\"x\":-1392.74,\"y\":-480.18,\"z\":71.14}', '{\"x\":-1389.43,\"y\":-479.01,\"z\":71.14}', NULL, '[\"ex_sm_15_office_01a\"]', 'MazeBankWest', 0, 1, 0, '{\"x\":-1390.76,\"y\":-479.22,\"z\":72.04}', 2700000),
(65, 'MBWOldSpiceClassical', 'MBW Old Spice Classical', NULL, '{\"x\":-1392.74,\"y\":-480.18,\"z\":71.14}', '{\"x\":-1389.43,\"y\":-479.01,\"z\":71.14}', NULL, '[\"ex_sm_15_office_01b\"]', 'MazeBankWest', 0, 1, 0, '{\"x\":-1390.76,\"y\":-479.22,\"z\":72.04}', 2700000),
(66, 'MBWOldSpiceVintage', 'MBW Old Spice Vintage', NULL, '{\"x\":-1392.74,\"y\":-480.18,\"z\":71.14}', '{\"x\":-1389.43,\"y\":-479.01,\"z\":71.14}', NULL, '[\"ex_sm_15_office_01c\"]', 'MazeBankWest', 0, 1, 0, '{\"x\":-1390.76,\"y\":-479.22,\"z\":72.04}', 2700000),
(67, 'MBWExecutiveRich', 'MBW Executive Rich', NULL, '{\"x\":-1392.74,\"y\":-480.18,\"z\":71.14}', '{\"x\":-1389.43,\"y\":-479.01,\"z\":71.14}', NULL, '[\"ex_sm_15_office_02b\"]', 'MazeBankWest', 0, 1, 0, '{\"x\":-1390.76,\"y\":-479.22,\"z\":72.04}', 2700000),
(68, 'MBWExecutiveCool', 'MBW Executive Cool', NULL, '{\"x\":-1392.74,\"y\":-480.18,\"z\":71.14}', '{\"x\":-1389.43,\"y\":-479.01,\"z\":71.14}', NULL, '[\"ex_sm_15_office_02c\"]', 'MazeBankWest', 0, 1, 0, '{\"x\":-1390.76,\"y\":-479.22,\"z\":72.04}', 2700000),
(69, 'MBWExecutive Contrast', 'MBW Executive Contrast', NULL, '{\"x\":-1392.74,\"y\":-480.18,\"z\":71.14}', '{\"x\":-1389.43,\"y\":-479.01,\"z\":71.14}', NULL, '[\"ex_sm_15_office_02a\"]', 'MazeBankWest', 0, 1, 0, '{\"x\":-1390.76,\"y\":-479.22,\"z\":72.04}', 2700000),
(70, 'MBWPowerBrokerIce', 'MBW Power Broker Ice', NULL, '{\"x\":-1392.74,\"y\":-480.18,\"z\":71.14}', '{\"x\":-1389.43,\"y\":-479.01,\"z\":71.14}', NULL, '[\"ex_sm_15_office_03a\"]', 'MazeBankWest', 0, 1, 0, '{\"x\":-1390.76,\"y\":-479.22,\"z\":72.04}', 2700000),
(71, 'MBWPowerBrokerConvservative', 'MBW Power Broker Convservative', NULL, '{\"x\":-1392.74,\"y\":-480.18,\"z\":71.14}', '{\"x\":-1389.43,\"y\":-479.01,\"z\":71.14}', NULL, '[\"ex_sm_15_office_03b\"]', 'MazeBankWest', 0, 1, 0, '{\"x\":-1390.76,\"y\":-479.22,\"z\":72.04}', 2700000),
(72, 'MBWPowerBrokerPolished', 'MBW Power Broker Polished', NULL, '{\"x\":-1392.74,\"y\":-480.18,\"z\":71.14}', '{\"x\":-1389.43,\"y\":-479.01,\"z\":71.14}', NULL, '[\"ex_sm_15_office_03c\"]', 'MazeBankWest', 0, 1, 0, '{\"x\":-1390.76,\"y\":-479.22,\"z\":72.04}', 2700000),
(100, 'MedEndApartment1', 'Medium Apartment 1', '{\"y\":3107.56,\"z\":41.49,\"x\":240.6}', '{\"y\":-1012.27,\"z\":-100.2,\"x\":346.49}', '{\"y\":-1000.09,\"z\":-100.2,\"x\":347.06}', '{\"y\":3100.77,\"z\":41.49,\"x\":240.21}', '[]', NULL, 1, 1, 0, '{\"x\":345.3,\"y\":-995.24,\"z\":-100.2}', 500000),
(101, 'MedEndApartment2', 'Medium Apartment 2', '{\"y\":3169.1,\"z\":41.81,\"x\":246.7}', '{\"y\":-1012.27,\"z\":-100.2,\"x\":346.49}', '{\"y\":-1000.09,\"z\":-100.2,\"x\":347.06}', '{\"y\":3163.97,\"z\":41.82,\"x\":245.83}', '[]', NULL, 1, 1, 0, '{\"x\":345.3,\"y\":-995.24,\"z\":-100.2}', 500000),
(102, 'MedEndApartment3', 'Medium Apartment 3', '{\"y\":2667.22,\"z\":39.06,\"x\":980.38}', '{\"y\":-1012.27,\"z\":-100.2,\"x\":346.49}', '{\"y\":-1000.09,\"z\":-100.2,\"x\":347.06}', '{\"y\":2668.77,\"z\":39.06,\"x\":986.38}', '[]', NULL, 1, 1, 0, '{\"x\":345.3,\"y\":-995.24,\"z\":-100.2}', 500000),
(103, 'MedEndApartment4', 'Medium Apartment 4', '{\"y\":3031.08,\"z\":42.89,\"x\":195.85}', '{\"y\":-1012.27,\"z\":-100.2,\"x\":346.49}', '{\"y\":-1000.09,\"z\":-100.2,\"x\":347.06}', '{\"y\":3031.39,\"z\":42.27,\"x\":200.68}', '[]', NULL, 1, 1, 0, '{\"x\":345.3,\"y\":-995.24,\"z\":-100.2}', 500000),
(104, 'MedEndApartment5', 'Medium Apartment 5', '{\"y\":4642.17,\"z\":42.88,\"x\":1724.43}', '{\"y\":-1012.27,\"z\":-100.2,\"x\":346.49}', '{\"y\":-1000.09,\"z\":-100.2,\"x\":347.06}', '{\"y\":4637.34,\"z\":42.31,\"x\":1724.27}', '[]', NULL, 1, 1, 0, '{\"x\":345.3,\"y\":-995.24,\"z\":-100.2}', 500000),
(105, 'MedEndApartment6', 'Medium Apartment 6', '{\"y\":4739.73,\"z\":40.99,\"x\":1664.98}', '{\"y\":-1012.27,\"z\":-100.2,\"x\":346.49}', '{\"y\":-1000.09,\"z\":-100.2,\"x\":347.06}', '{\"y\":4740.93,\"z\":41.08,\"x\":1670.92}', '[]', NULL, 1, 1, 0, '{\"x\":345.3,\"y\":-995.24,\"z\":-100.2}', 500000),
(106, 'MedEndApartment7', 'Medium Apartment 7', '{\"y\":6577.19,\"z\":31.74,\"x\":12.57}', '{\"y\":-1012.27,\"z\":-100.2,\"x\":346.49}', '{\"y\":-1000.09,\"z\":-100.2,\"x\":347.06}', '{\"y\":6572.61,\"z\":31.72,\"x\":16.93}', '[]', NULL, 1, 1, 0, '{\"x\":345.3,\"y\":-995.24,\"z\":-100.2}', 500000),
(107, 'MedEndApartment8', 'Medium Apartment 8', '{\"y\":6190.84,\"z\":30.73,\"x\":-374.31}', '{\"y\":-1012.27,\"z\":-100.2,\"x\":346.49}', '{\"y\":-1000.09,\"z\":-100.2,\"x\":347.06}', '{\"y\":6186.58,\"z\":30.52,\"x\":-372.65}', '[]', NULL, 1, 1, 0, '{\"x\":345.3,\"y\":-995.24,\"z\":-100.2}', 500000),
(108, 'MedEndApartment9', 'Medium Apartment 9', '{\"y\":6597.56,\"z\":30.86,\"x\":-27.06}', '{\"y\":-1012.27,\"z\":-100.2,\"x\":346.49}', '{\"y\":-1000.09,\"z\":-100.2,\"x\":347.06}', '{\"y\":6601.55,\"z\":30.44,\"x\":-30.55}', '[]', NULL, 1, 1, 0, '{\"x\":345.3,\"y\":-995.24,\"z\":-100.2}', 500000),
(109, 'MedEndApartment10', 'Medium Apartment 10', '{\"y\":6340.1,\"z\":28.84,\"x\":-367.33}', '{\"y\":-1012.27,\"z\":-100.2,\"x\":346.49}', '{\"y\":-1000.09,\"z\":-100.2,\"x\":347.06}', '{\"y\":6336.97,\"z\":28.84,\"x\":-371.3}', '[]', NULL, 1, 1, 0, '{\"x\":345.3,\"y\":-995.24,\"z\":-100.2}', 500000);

-- --------------------------------------------------------

--
-- Table structure for table `rented_vehicles`
--

CREATE TABLE `rented_vehicles` (
  `vehicle` varchar(60) NOT NULL,
  `plate` varchar(12) NOT NULL,
  `player_name` varchar(255) NOT NULL,
  `base_price` int(11) NOT NULL,
  `rent_price` int(11) NOT NULL,
  `owner` varchar(22) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `shops`
--

CREATE TABLE `shops` (
  `id` int(11) NOT NULL,
  `store` varchar(100) NOT NULL,
  `item` varchar(100) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shops`
--

INSERT INTO `shops` (`id`, `store`, `item`, `price`) VALUES
(1, 'TwentyFourSeven', 'bread', 30),
(2, 'TwentyFourSeven', 'water', 15),
(3, 'RobsLiquor', 'bread', 30),
(4, 'RobsLiquor', 'water', 15),
(5, 'LTDgasoline', 'bread', 30),
(6, 'LTDgasoline', 'water', 15),
(7, 'TwentyFourSeven', 'beer', 45),
(8, 'RobsLiquor', 'beer', 45),
(9, 'LTDgasoline', 'beer', 45);

-- --------------------------------------------------------

--
-- Table structure for table `society_moneywash`
--

CREATE TABLE `society_moneywash` (
  `id` int(11) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `society` varchar(60) NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `trunk_inventory`
--

CREATE TABLE `trunk_inventory` (
  `id` int(11) NOT NULL,
  `plate` varchar(8) NOT NULL,
  `data` text NOT NULL,
  `owned` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `twitter_accounts`
--

CREATE TABLE `twitter_accounts` (
  `id` int(11) NOT NULL,
  `username` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `password` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '0',
  `avatar_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `twitter_likes`
--

CREATE TABLE `twitter_likes` (
  `id` int(11) NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  `tweetId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `twitter_tweets`
--

CREATE TABLE `twitter_tweets` (
  `id` int(11) NOT NULL,
  `authorId` int(11) NOT NULL,
  `realUser` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `likes` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `accounts` longtext DEFAULT NULL,
  `group` varchar(50) DEFAULT 'user',
  `inventory` longtext DEFAULT NULL,
  `job` varchar(20) DEFAULT 'unemployed',
  `job_grade` int(11) DEFAULT 0,
  `loadout` longtext DEFAULT NULL,
  `position` varchar(255) DEFAULT '{"x":-269.4,"y":-955.3,"z":31.2,"heading":205.8}',
  `status` longtext DEFAULT NULL,
  `skin` longtext DEFAULT NULL,
  `is_dead` tinyint(1) DEFAULT 0,
  `last_property` varchar(255) DEFAULT NULL,
  `firstname` varchar(16) DEFAULT NULL,
  `lastname` varchar(16) DEFAULT NULL,
  `dateofbirth` varchar(10) DEFAULT NULL,
  `sex` varchar(1) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `phone_number` varchar(10) DEFAULT NULL,
  `jail_time` int(11) NOT NULL DEFAULT 0,
  `jail_loc` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user_lastcharacter`
--

CREATE TABLE `user_lastcharacter` (
  `id` int(11) NOT NULL,
  `license` varchar(255) NOT NULL,
  `charid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_licenses`
--

CREATE TABLE `user_licenses` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

CREATE TABLE `vehicles` (
  `name` varchar(60) NOT NULL,
  `model` varchar(60) NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) DEFAULT NULL,
  `stock` int(11) NOT NULL DEFAULT 10
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vehicles`
--

INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
('Adder', 'adder', 900000, 'super', 10),
('Akuma', 'AKUMA', 7500, 'motorcycles', 10),
('Alpha', 'alpha', 60000, 'sports', 10),
('Ardent', 'ardent', 1150000, 'sportsclassics', 10),
('Asea', 'asea', 5500, 'sedans', 10),
('Autarch', 'autarch', 1955000, 'super', 10),
('Avarus', 'avarus', 18000, 'motorcycles', 10),
('Bagger', 'bagger', 13500, 'motorcycles', 10),
('Baller', 'baller2', 40000, 'suvs', 10),
('Baller Sport', 'baller3', 60000, 'suvs', 10),
('Banshee', 'banshee', 70000, 'sports', 10),
('Banshee 900R', 'banshee2', 255000, 'super', 10),
('Bati 801', 'bati', 12000, 'motorcycles', 10),
('Bati 801RR', 'bati2', 19000, 'motorcycles', 10),
('Bestia GTS', 'bestiagts', 55000, 'sports', 10),
('BF400', 'bf400', 6500, 'motorcycles', 10),
('Bf Injection', 'bfinjection', 16000, 'offroad', 10),
('Bifta', 'bifta', 12000, 'offroad', 10),
('Bison', 'bison', 45000, 'vans', 10),
('Blade', 'blade', 15000, 'muscle', 10),
('Blazer', 'blazer', 6500, 'offroad', 10),
('Blazer Sport', 'blazer4', 8500, 'offroad', 10),
('blazer5', 'blazer5', 1755600, 'offroad', 10),
('Blista', 'blista', 8000, 'compacts', 10),
('BMX (velo)', 'bmx', 160, 'bicycles', 10),
('Bobcat XL', 'bobcatxl', 32000, 'vans', 10),
('Brawler', 'brawler', 45000, 'offroad', 10),
('Brioso R/A', 'brioso', 18000, 'compacts', 10),
('Btype', 'btype', 62000, 'sportsclassics', 10),
('Btype Hotroad', 'btype2', 155000, 'sportsclassics', 10),
('Btype Luxe', 'btype3', 85000, 'sportsclassics', 10),
('Buccaneer', 'buccaneer', 18000, 'muscle', 10),
('Buccaneer Rider', 'buccaneer2', 24000, 'muscle', 10),
('Buffalo', 'buffalo', 12000, 'sports', 10),
('Buffalo S', 'buffalo2', 20000, 'sports', 10),
('Bullet', 'bullet', 90000, 'super', 10),
('Burrito', 'burrito3', 19000, 'vans', 10),
('Camper', 'camper', 42000, 'vans', 10),
('Carbonizzare', 'carbonizzare', 75000, 'sports', 10),
('Carbon RS', 'carbonrs', 18000, 'motorcycles', 10),
('Casco', 'casco', 30000, 'sportsclassics', 10),
('Cavalcade', 'cavalcade2', 55000, 'suvs', 10),
('Cheetah', 'cheetah', 375000, 'super', 10),
('Chimera', 'chimera', 38000, 'motorcycles', 10),
('Chino', 'chino', 15000, 'muscle', 10),
('Chino Luxe', 'chino2', 19000, 'muscle', 10),
('Cliffhanger', 'cliffhanger', 9500, 'motorcycles', 10),
('Cognoscenti Cabrio', 'cogcabrio', 55000, 'coupes', 10),
('Cognoscenti', 'cognoscenti', 55000, 'sedans', 10),
('Comet', 'comet2', 65000, 'sports', 10),
('Comet 5', 'comet5', 1145000, 'sports', 10),
('Contender', 'contender', 70000, 'suvs', 10),
('Coquette', 'coquette', 65000, 'sports', 10),
('Coquette Classic', 'coquette2', 40000, 'sportsclassics', 10),
('Coquette BlackFin', 'coquette3', 55000, 'muscle', 10),
('Cruiser (velo)', 'cruiser', 510, 'bicycles', 10),
('Cyclone', 'cyclone', 1890000, 'super', 10),
('Daemon', 'daemon', 11500, 'motorcycles', 10),
('Daemon High', 'daemon2', 13500, 'motorcycles', 10),
('Defiler', 'defiler', 9800, 'motorcycles', 10),
('Deluxo', 'deluxo', 4721500, 'sportsclassics', 10),
('Dominator', 'dominator', 35000, 'muscle', 10),
('Double T', 'double', 28000, 'motorcycles', 10),
('Dubsta', 'dubsta', 45000, 'suvs', 10),
('Dubsta Luxuary', 'dubsta2', 60000, 'suvs', 10),
('Bubsta 6x6', 'dubsta3', 120000, 'offroad', 10),
('Dukes', 'dukes', 28000, 'muscle', 10),
('Dune Buggy', 'dune', 8000, 'offroad', 10),
('Elegy', 'elegy2', 38500, 'sports', 10),
('Emperor', 'emperor', 8500, 'sedans', 10),
('Enduro', 'enduro', 5500, 'motorcycles', 10),
('Entity XF', 'entityxf', 425000, 'super', 10),
('Esskey', 'esskey', 4200, 'motorcycles', 10),
('Exemplar', 'exemplar', 32000, 'coupes', 10),
('F620', 'f620', 40000, 'coupes', 10),
('Faction', 'faction', 20000, 'muscle', 10),
('Faction Rider', 'faction2', 30000, 'muscle', 10),
('Faction XL', 'faction3', 40000, 'muscle', 10),
('Faggio', 'faggio', 1900, 'motorcycles', 10),
('Vespa', 'faggio2', 2800, 'motorcycles', 10),
('Felon', 'felon', 42000, 'coupes', 10),
('Felon GT', 'felon2', 55000, 'coupes', 10),
('Feltzer', 'feltzer2', 55000, 'sports', 10),
('Stirling GT', 'feltzer3', 65000, 'sportsclassics', 10),
('Fixter (velo)', 'fixter', 225, 'bicycles', 10),
('Tow Truck', 'flatbed', 625000, 'utility', 10),
('FMJ', 'fmj', 185000, 'super', 10),
('Fhantom', 'fq2', 17000, 'suvs', 10),
('Fugitive', 'fugitive', 12000, 'sedans', 10),
('Furore GT', 'furoregt', 45000, 'sports', 10),
('Fusilade', 'fusilade', 40000, 'sports', 10),
('Gargoyle', 'gargoyle', 16500, 'motorcycles', 10),
('Gauntlet', 'gauntlet', 30000, 'muscle', 10),
('Gang Burrito', 'gburrito', 45000, 'vans', 10),
('Burrito', 'gburrito2', 29000, 'vans', 10),
('Glendale', 'glendale', 6500, 'sedans', 10),
('Grabger', 'granger', 50000, 'suvs', 10),
('Gresley', 'gresley', 47500, 'suvs', 10),
('GT 500', 'gt500', 785000, 'sportsclassics', 10),
('Guardian', 'guardian', 45000, 'offroad', 10),
('Hakuchou', 'hakuchou', 31000, 'motorcycles', 10),
('Hakuchou Sport', 'hakuchou2', 55000, 'motorcycles', 10),
('Hermes', 'hermes', 535000, 'muscle', 10),
('Hexer', 'hexer', 12000, 'motorcycles', 10),
('Hotknife', 'hotknife', 125000, 'muscle', 10),
('Huntley S', 'huntley', 40000, 'suvs', 10),
('Hustler', 'hustler', 625000, 'muscle', 10),
('Infernus', 'infernus', 180000, 'super', 10),
('Innovation', 'innovation', 23500, 'motorcycles', 10),
('Intruder', 'intruder', 7500, 'sedans', 10),
('Issi', 'issi2', 10000, 'compacts', 10),
('Jackal', 'jackal', 38000, 'coupes', 10),
('Jester', 'jester', 65000, 'sports', 10),
('Jester(Racecar)', 'jester2', 135000, 'sports', 10),
('Journey', 'journey', 6500, 'vans', 10),
('Kamacho', 'kamacho', 345000, 'offroad', 10),
('Khamelion', 'khamelion', 38000, 'sports', 10),
('Kuruma', 'kuruma', 30000, 'sports', 10),
('Landstalker', 'landstalker', 35000, 'suvs', 10),
('RE-7B', 'le7b', 325000, 'super', 10),
('Lynx', 'lynx', 40000, 'sports', 10),
('Mamba', 'mamba', 70000, 'sports', 10),
('Manana', 'manana', 12800, 'sportsclassics', 10),
('Manchez', 'manchez', 5300, 'motorcycles', 10),
('Massacro', 'massacro', 65000, 'sports', 10),
('Massacro(Racecar)', 'massacro2', 130000, 'sports', 10),
('Mesa', 'mesa', 16000, 'suvs', 10),
('Mesa Trail', 'mesa3', 40000, 'suvs', 10),
('Minivan', 'minivan', 13000, 'vans', 10),
('Monroe', 'monroe', 55000, 'sportsclassics', 10),
('The Liberator', 'monster', 210000, 'offroad', 10),
('Moonbeam', 'moonbeam', 18000, 'vans', 10),
('Moonbeam Rider', 'moonbeam2', 35000, 'vans', 10),
('Nemesis', 'nemesis', 5800, 'motorcycles', 10),
('Neon', 'neon', 1500000, 'sports', 10),
('Nightblade', 'nightblade', 35000, 'motorcycles', 10),
('Nightshade', 'nightshade', 65000, 'muscle', 10),
('9F', 'ninef', 65000, 'sports', 10),
('9F Cabrio', 'ninef2', 80000, 'sports', 10),
('Omnis', 'omnis', 35000, 'sports', 10),
('Oppressor', 'oppressor', 3524500, 'super', 10),
('Oracle XS', 'oracle2', 35000, 'coupes', 10),
('Osiris', 'osiris', 160000, 'super', 10),
('Panto', 'panto', 10000, 'compacts', 10),
('Paradise', 'paradise', 19000, 'vans', 10),
('Pariah', 'pariah', 1420000, 'sports', 10),
('Patriot', 'patriot', 55000, 'suvs', 10),
('PCJ-600', 'pcj', 6200, 'motorcycles', 10),
('Penumbra', 'penumbra', 28000, 'sports', 10),
('Pfister', 'pfister811', 85000, 'super', 10),
('Phoenix', 'phoenix', 12500, 'muscle', 10),
('Picador', 'picador', 18000, 'muscle', 10),
('Pigalle', 'pigalle', 20000, 'sportsclassics', 10),
('Prairie', 'prairie', 12000, 'compacts', 10),
('Premier', 'premier', 8000, 'sedans', 10),
('Primo Custom', 'primo2', 14000, 'sedans', 10),
('X80 Proto', 'prototipo', 2500000, 'super', 10),
('Radius', 'radi', 29000, 'suvs', 10),
('raiden', 'raiden', 1375000, 'sports', 10),
('Rapid GT', 'rapidgt', 35000, 'sports', 10),
('Rapid GT Convertible', 'rapidgt2', 45000, 'sports', 10),
('Rapid GT3', 'rapidgt3', 885000, 'sportsclassics', 10),
('Reaper', 'reaper', 150000, 'super', 10),
('Rebel', 'rebel2', 35000, 'offroad', 10),
('Regina', 'regina', 5000, 'sedans', 10),
('Retinue', 'retinue', 615000, 'sportsclassics', 10),
('Revolter', 'revolter', 1610000, 'sports', 10),
('riata', 'riata', 380000, 'offroad', 10),
('Rocoto', 'rocoto', 45000, 'suvs', 10),
('Ruffian', 'ruffian', 6800, 'motorcycles', 10),
('Ruiner 2', 'ruiner2', 5745600, 'muscle', 10),
('Rumpo', 'rumpo', 15000, 'vans', 10),
('Rumpo Trail', 'rumpo3', 19500, 'vans', 10),
('Sabre Turbo', 'sabregt', 20000, 'muscle', 10),
('Sabre GT', 'sabregt2', 25000, 'muscle', 10),
('Sanchez', 'sanchez', 5300, 'motorcycles', 10),
('Sanchez Sport', 'sanchez2', 5300, 'motorcycles', 10),
('Sanctus', 'sanctus', 25000, 'motorcycles', 10),
('Sandking', 'sandking', 55000, 'offroad', 10),
('Savestra', 'savestra', 990000, 'sportsclassics', 10),
('SC 1', 'sc1', 1603000, 'super', 10),
('Schafter', 'schafter2', 25000, 'sedans', 10),
('Schafter V12', 'schafter3', 50000, 'sports', 10),
('Scorcher (velo)', 'scorcher', 280, 'bicycles', 10),
('Seminole', 'seminole', 25000, 'suvs', 10),
('Sentinel', 'sentinel', 32000, 'coupes', 10),
('Sentinel XS', 'sentinel2', 40000, 'coupes', 10),
('Sentinel3', 'sentinel3', 650000, 'sports', 10),
('Seven 70', 'seven70', 39500, 'sports', 10),
('ETR1', 'sheava', 220000, 'super', 10),
('Shotaro Concept', 'shotaro', 320000, 'motorcycles', 10),
('Slam Van', 'slamvan3', 11500, 'muscle', 10),
('Sovereign', 'sovereign', 22000, 'motorcycles', 10),
('Stinger', 'stinger', 80000, 'sportsclassics', 10),
('Stinger GT', 'stingergt', 75000, 'sportsclassics', 10),
('Streiter', 'streiter', 500000, 'sports', 10),
('Stretch', 'stretch', 90000, 'sedans', 10),
('Stromberg', 'stromberg', 3185350, 'sports', 10),
('Sultan', 'sultan', 15000, 'sports', 10),
('Sultan RS', 'sultanrs', 65000, 'super', 10),
('Super Diamond', 'superd', 130000, 'sedans', 10),
('Surano', 'surano', 50000, 'sports', 10),
('Surfer', 'surfer', 12000, 'vans', 10),
('T20', 't20', 300000, 'super', 10),
('Tailgater', 'tailgater', 30000, 'sedans', 10),
('Tampa', 'tampa', 16000, 'muscle', 10),
('Drift Tampa', 'tampa2', 80000, 'sports', 10),
('Thrust', 'thrust', 24000, 'motorcycles', 10),
('Tri bike (velo)', 'tribike3', 520, 'bicycles', 10),
('Trophy Truck', 'trophytruck', 60000, 'offroad', 10),
('Trophy Truck Limited', 'trophytruck2', 80000, 'offroad', 10),
('Tropos', 'tropos', 40000, 'sports', 10),
('Turismo R', 'turismor', 350000, 'super', 10),
('Tyrus', 'tyrus', 600000, 'super', 10),
('Vacca', 'vacca', 120000, 'super', 10),
('Vader', 'vader', 7200, 'motorcycles', 10),
('Verlierer', 'verlierer2', 70000, 'sports', 10),
('Vigero', 'vigero', 12500, 'muscle', 10),
('Virgo', 'virgo', 14000, 'muscle', 10),
('Viseris', 'viseris', 875000, 'sportsclassics', 10),
('Visione', 'visione', 2250000, 'super', 10),
('Voltic', 'voltic', 90000, 'super', 10),
('Voltic 2', 'voltic2', 3830400, 'super', 10),
('Voodoo', 'voodoo', 7200, 'muscle', 10),
('Vortex', 'vortex', 9800, 'motorcycles', 10),
('Warrener', 'warrener', 4000, 'sedans', 10),
('Washington', 'washington', 9000, 'sedans', 10),
('Windsor', 'windsor', 95000, 'coupes', 10),
('Windsor Drop', 'windsor2', 125000, 'coupes', 10),
('Woflsbane', 'wolfsbane', 9000, 'motorcycles', 10),
('XLS', 'xls', 32000, 'suvs', 10),
('Yosemite', 'yosemite', 485000, 'muscle', 10),
('Youga', 'youga', 10800, 'vans', 10),
('Youga Luxuary', 'youga2', 14500, 'vans', 10),
('Z190', 'z190', 900000, 'sportsclassics', 10),
('Zentorno', 'zentorno', 1500000, 'super', 10),
('Zion', 'zion', 36000, 'coupes', 10),
('Zion Cabrio', 'zion2', 45000, 'coupes', 10),
('Zombie', 'zombiea', 9500, 'motorcycles', 10),
('Zombie Luxuary', 'zombieb', 12000, 'motorcycles', 10),
('Z-Type', 'ztype', 220000, 'sportsclassics', 10);

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_categories`
--

CREATE TABLE `vehicle_categories` (
  `name` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vehicle_categories`
--

INSERT INTO `vehicle_categories` (`name`, `label`) VALUES
('bicycles', 'Bikes'),
('compacts', 'Compacts'),
('coupes', 'Coupes'),
('motorcycles', 'Motorcycles'),
('muscle', 'Muscle'),
('offroad', 'Off Road'),
('sedans', 'Sedans'),
('sports', 'Sports'),
('sportsclassics', 'Sports Classics'),
('super', 'Super'),
('suvs', 'SUVs'),
('utility', 'Utility'),
('vans', 'Vans');

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_display`
--

CREATE TABLE `vehicle_display` (
  `id` int(11) NOT NULL,
  `model` varchar(60) NOT NULL,
  `name` varchar(60) NOT NULL,
  `commission` int(11) NOT NULL DEFAULT 10,
  `downpayment` int(11) NOT NULL DEFAULT 25
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vehicle_display`
--

INSERT INTO `vehicle_display` (`id`, `model`, `name`, `commission`, `downpayment`) VALUES
(1, 'panto', 'Panto', 10, 25),
(2, 'carbonrs', 'Carbon RS', 10, 25),
(3, 'ardent', 'Ardent', 10, 25),
(4, 'zentorno', 'Zentorno', 10, 25),
(5, 'exemplar', 'Exemplar', 10, 25),
(6, 'emperor', 'Emperor', 10, 25),
(7, 'baller2', 'Baller', 10, 25),
(8, 'fixter', 'Fixter (velo)', 10, 25),
(9, 'trophytruck', 'Trophy Truck', 10, 25);

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_parking`
--

CREATE TABLE `vehicle_parking` (
  `plate` varchar(8) NOT NULL,
  `modifications` text NOT NULL,
  `posX` float NOT NULL,
  `posY` float NOT NULL,
  `posZ` float NOT NULL,
  `rotX` float NOT NULL,
  `rotY` float NOT NULL,
  `rotZ` float NOT NULL,
  `lastUpdate` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `vs_aircrafts`
--

CREATE TABLE `vs_aircrafts` (
  `name` varchar(60) NOT NULL,
  `model` varchar(60) NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vs_aircrafts`
--

INSERT INTO `vs_aircrafts` (`name`, `model`, `price`, `category`) VALUES
('Alpha Z1', 'alphaz1', 1121000, 'planes'),
('Besra', 'besra', 1000000, 'planes'),
('Buzzard', 'buzzard2', 500000, 'helis'),
('Cuban 800', 'cuban800', 240000, 'planes'),
('Dodo', 'dodo', 500000, 'planes'),
('Duster', 'duster', 175000, 'planes'),
('Frogger', 'frogger', 800000, 'helis'),
('Havok', 'havok', 250000, 'helis'),
('Howard NX25', 'howard', 975000, 'planes'),
('Luxor', 'luxor', 1500000, 'planes'),
('Luxor Deluxe ', 'luxor2', 1750000, 'planes'),
('Mammatus', 'mammatus', 300000, 'planes'),
('Maverick', 'maverick', 750000, 'helis'),
('Ultra Light', 'microlight', 50000, 'planes'),
('Nimbus', 'nimbus', 900000, 'planes'),
('Rogue', 'rogue', 1000000, 'planes'),
('Sea Breeze', 'seabreeze', 850000, 'planes'),
('Sea Sparrow', 'seasparrow', 815000, 'helis'),
('Shamal', 'shamal', 1150000, 'planes'),
('Mallard', 'stunt', 250000, 'planes'),
('SuperVolito', 'supervolito', 1000000, 'helis'),
('SuperVolito Carbon', 'supervolito2', 1250000, 'helis'),
('Swift', 'swift', 1000000, 'helis'),
('Swift Deluxe', 'swift2', 1250000, 'helis'),
('Velum', 'velum2', 450000, 'planes'),
('Vestra', 'vestra', 950000, 'planes'),
('Volatus', 'volatus', 1250000, 'helis');

-- --------------------------------------------------------

--
-- Table structure for table `vs_aircraft_categories`
--

CREATE TABLE `vs_aircraft_categories` (
  `name` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vs_aircraft_categories`
--

INSERT INTO `vs_aircraft_categories` (`name`, `label`) VALUES
('helis', 'Helicopters'),
('planes', 'Planes');

-- --------------------------------------------------------

--
-- Table structure for table `vs_ambulance`
--

CREATE TABLE `vs_ambulance` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `model` varchar(60) NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vs_ambulance`
--

INSERT INTO `vs_ambulance` (`id`, `name`, `model`, `price`, `category`) VALUES
(1, 'Ambulance', 'ambulance', 500, 'ambulance'),
(2, 'Fire Truck', 'firetruk', 750, 'ambulance'),
(3, 'Ambulance', 'ambulance', 500, 'doctor'),
(4, 'Fire Truck', 'firetruk', 750, 'doctor'),
(5, 'Ambulance', 'ambulance', 500, 'chief_doctor'),
(6, 'Fire Truck', 'firetruk', 750, 'chief_doctor'),
(7, 'Ambulance', 'ambulance', 500, 'boss'),
(8, 'Fire Truck', 'firetruk', 750, 'boss');

-- --------------------------------------------------------

--
-- Table structure for table `vs_ambulance_categories`
--

CREATE TABLE `vs_ambulance_categories` (
  `name` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vs_ambulance_categories`
--

INSERT INTO `vs_ambulance_categories` (`name`, `label`) VALUES
('ambulance', 'Jr. EMT'),
('boss', 'EMT Supervisor'),
('chief_doctor', 'Sr. EMT'),
('doctor', 'EMT');

-- --------------------------------------------------------

--
-- Table structure for table `vs_boats`
--

CREATE TABLE `vs_boats` (
  `name` varchar(60) NOT NULL,
  `model` varchar(60) NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vs_boats`
--

INSERT INTO `vs_boats` (`name`, `model`, `price`, `category`) VALUES
('Dinghy 4Seat', 'dinghy', 25000, 'boats'),
('Dinghy 2Seat', 'dinghy2', 20000, 'boats'),
('Dinghy Yacht', 'dinghy4', 25000, 'boats'),
('Jetmax', 'jetmax', 30000, 'boats'),
('Marquis', 'marquis', 45000, 'boats'),
('Seashark', 'seashark', 10000, 'boats'),
('Seashark Yacht', 'seashark3', 10000, 'boats'),
('Speeder', 'speeder', 40000, 'boats'),
('Squalo', 'squalo', 32000, 'boats'),
('Submarine', 'submersible', 29000, 'subs'),
('Kraken', 'submersible2', 31000, 'subs'),
('Suntrap', 'suntrap', 34000, 'boats'),
('Toro', 'toro', 38000, 'boats'),
('Toro Yacht', 'toro2', 38000, 'boats'),
('Tropic', 'tropic', 27000, 'boats'),
('Tropic Yacht', 'tropic2', 27000, 'boats');

-- --------------------------------------------------------

--
-- Table structure for table `vs_boat_categories`
--

CREATE TABLE `vs_boat_categories` (
  `name` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vs_boat_categories`
--

INSERT INTO `vs_boat_categories` (`name`, `label`) VALUES
('boats', 'Boats'),
('subs', 'Submersibles');

-- --------------------------------------------------------

--
-- Table structure for table `vs_cars`
--

CREATE TABLE `vs_cars` (
  `name` varchar(60) NOT NULL,
  `model` varchar(60) NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vs_cars`
--

INSERT INTO `vs_cars` (`name`, `model`, `price`, `category`) VALUES
('Adder', 'adder', 900000, 'supers'),
('Akuma', 'akuma', 7500, 'motorcycles'),
('Alpha', 'alpha', 60000, 'sports'),
('Ardent', 'ardent', 1150000, 'sportsclassics'),
('Asea', 'asea', 5500, 'sedans'),
('Autarch', 'autarch', 1955000, 'supers'),
('Avarus', 'avarus', 18000, 'motorcycles'),
('Bagger', 'bagger', 13500, 'motorcycles'),
('Baller', 'baller2', 40000, 'suvs'),
('Baller Sport', 'baller3', 60000, 'suvs'),
('Banshee', 'banshee', 70000, 'sports'),
('Banshee 900R', 'banshee2', 255000, 'supers'),
('Bati 801', 'bati', 12000, 'motorcycles'),
('Bati 801RR', 'bati2', 19000, 'motorcycles'),
('Bestia GTS', 'bestiagts', 55000, 'sports'),
('BF400', 'bf400', 6500, 'motorcycles'),
('Bf Injection', 'bfinjection', 16000, 'offroads'),
('Bifta', 'bifta', 12000, 'offroads'),
('Bison', 'bison', 45000, 'vans'),
('Blade', 'blade', 15000, 'muscles'),
('Blazer', 'blazer', 6500, 'offroads'),
('Blazer Sport', 'blazer4', 8500, 'offroads'),
('blazer5', 'blazer5', 1755600, 'offroads'),
('Blista', 'blista', 8000, 'compacts'),
('BMX (velo)', 'bmx', 160, 'motorcycles'),
('Bobcat XL', 'bobcatxl', 32000, 'vans'),
('Brawler', 'brawler', 45000, 'offroads'),
('Brioso R/A', 'brioso', 18000, 'compacts'),
('Btype', 'btype', 62000, 'sportsclassics'),
('Btype Hotroad', 'btype2', 155000, 'sportsclassics'),
('Btype Luxe', 'btype3', 85000, 'sportsclassics'),
('Buccaneer', 'buccaneer', 18000, 'muscles'),
('Buccaneer Rider', 'buccaneer2', 24000, 'muscles'),
('Buffalo', 'buffalo', 12000, 'sports'),
('Buffalo S', 'buffalo2', 20000, 'sports'),
('Bullet', 'bullet', 90000, 'supers'),
('Burrito', 'burrito3', 19000, 'vans'),
('Camper', 'camper', 42000, 'vans'),
('Carbonizzare', 'carbonizzare', 75000, 'sports'),
('Carbon RS', 'carbonrs', 18000, 'motorcycles'),
('Casco', 'casco', 30000, 'sportsclassics'),
('Cavalcade', 'cavalcade2', 55000, 'suvs'),
('Cheetah', 'cheetah', 375000, 'supers'),
('Chimera', 'chimera', 38000, 'motorcycles'),
('Chino', 'chino', 15000, 'muscles'),
('Chino Luxe', 'chino2', 19000, 'muscles'),
('Cliffhanger', 'cliffhanger', 9500, 'motorcycles'),
('Cognoscenti Cabrio', 'cogcabrio', 55000, 'coupes'),
('Cognoscenti', 'cognoscenti', 55000, 'sedans'),
('Comet', 'comet2', 65000, 'sports'),
('Comet 5', 'comet5', 1145000, 'sports'),
('Contender', 'contender', 70000, 'suvs'),
('Coquette', 'coquette', 65000, 'sports'),
('Coquette Classic', 'coquette2', 40000, 'sportsclassics'),
('Coquette BlackFin', 'coquette3', 55000, 'muscles'),
('Cruiser (velo)', 'cruiser', 510, 'motorcycles'),
('Cyclone', 'cyclone', 1890000, 'supers'),
('Daemon', 'daemon', 11500, 'motorcycles'),
('Daemon High', 'daemon2', 13500, 'motorcycles'),
('Defiler', 'defiler', 9800, 'motorcycles'),
('Deluxo', 'deluxo', 4721500, 'sportsclassics'),
('Dominator', 'dominator', 35000, 'muscles'),
('Double T', 'double', 28000, 'motorcycles'),
('Dubsta', 'dubsta', 45000, 'suvs'),
('Dubsta Luxuary', 'dubsta2', 60000, 'suvs'),
('Bubsta 6x6', 'dubsta3', 120000, 'offroads'),
('Dukes', 'dukes', 28000, 'muscles'),
('Dune Buggy', 'dune', 8000, 'offroads'),
('Elegy', 'elegy2', 38500, 'sports'),
('Emperor', 'emperor', 8500, 'sedans'),
('Enduro', 'enduro', 5500, 'motorcycles'),
('Entity XF', 'entityxf', 425000, 'supers'),
('Esskey', 'esskey', 4200, 'motorcycles'),
('Exemplar', 'exemplar', 32000, 'coupes'),
('F620', 'f620', 40000, 'coupes'),
('Faction', 'faction', 20000, 'muscles'),
('Faction Rider', 'faction2', 30000, 'muscles'),
('Faction XL', 'faction3', 40000, 'muscles'),
('Faggio', 'faggio', 1900, 'motorcycles'),
('Vespa', 'faggio2', 2800, 'motorcycles'),
('Felon', 'felon', 42000, 'coupes'),
('Felon GT', 'felon2', 55000, 'coupes'),
('Feltzer', 'feltzer2', 55000, 'sports'),
('Stirling GT', 'feltzer3', 65000, 'sportsclassics'),
('Fixter (velo)', 'fixter', 225, 'motorcycles'),
('FMJ', 'fmj', 185000, 'supers'),
('Fhantom', 'fq2', 17000, 'suvs'),
('Fugitive', 'fugitive', 12000, 'sedans'),
('Furore GT', 'furoregt', 45000, 'sports'),
('Fusilade', 'fusilade', 40000, 'sports'),
('Gargoyle', 'gargoyle', 16500, 'motorcycles'),
('Gauntlet', 'gauntlet', 30000, 'muscles'),
('Gang Burrito', 'gburrito', 45000, 'vans'),
('Burrito', 'gburrito2', 29000, 'vans'),
('Glendale', 'glendale', 6500, 'sedans'),
('Grabger', 'granger', 50000, 'suvs'),
('Gresley', 'gresley', 47500, 'suvs'),
('GT 500', 'gt500', 785000, 'sportsclassics'),
('Guardian', 'guardian', 45000, 'offroads'),
('Hakuchou', 'hakuchou', 31000, 'motorcycles'),
('Hakuchou Sport', 'hakuchou2', 55000, 'motorcycles'),
('Hermes', 'hermes', 535000, 'muscles'),
('Hexer', 'hexer', 12000, 'motorcycles'),
('Hotknife', 'hotknife', 125000, 'muscles'),
('Huntley S', 'huntley', 40000, 'suvs'),
('Hustler', 'hustler', 625000, 'muscles'),
('Infernus', 'infernus', 180000, 'supers'),
('Innovation', 'innovation', 23500, 'motorcycles'),
('Intruder', 'intruder', 7500, 'sedans'),
('Issi', 'issi2', 10000, 'compacts'),
('Jackal', 'jackal', 38000, 'coupes'),
('Jester', 'jester', 65000, 'sports'),
('Jester(Racecar)', 'jester2', 135000, 'sports'),
('Journey', 'journey', 6500, 'vans'),
('Kamacho', 'kamacho', 345000, 'offroads'),
('Khamelion', 'khamelion', 38000, 'sports'),
('Kuruma', 'kuruma', 30000, 'sports'),
('Landstalker', 'landstalker', 35000, 'suvs'),
('RE-7B', 'le7b', 325000, 'supers'),
('Lynx', 'lynx', 40000, 'sports'),
('Mamba', 'mamba', 70000, 'sports'),
('Manana', 'manana', 12800, 'sportsclassics'),
('Manchez', 'manchez', 5300, 'motorcycles'),
('Massacro', 'massacro', 65000, 'sports'),
('Massacro(Racecar)', 'massacro2', 130000, 'sports'),
('Mesa', 'mesa', 16000, 'suvs'),
('Mesa Trail', 'mesa3', 40000, 'suvs'),
('Minivan', 'minivan', 13000, 'vans'),
('Monroe', 'monroe', 55000, 'sportsclassics'),
('The Liberator', 'monster', 210000, 'offroads'),
('Moonbeam', 'moonbeam', 18000, 'vans'),
('Moonbeam Rider', 'moonbeam2', 35000, 'vans'),
('Nemesis', 'nemesis', 5800, 'motorcycles'),
('Neon', 'neon', 1500000, 'sports'),
('Nightblade', 'nightblade', 35000, 'motorcycles'),
('Nightshade', 'nightshade', 65000, 'muscles'),
('9F', 'ninef', 65000, 'sports'),
('9F Cabrio', 'ninef2', 80000, 'sports'),
('Omnis', 'omnis', 35000, 'sports'),
('Oppressor', 'oppressor', 3524500, 'supers'),
('Oracle XS', 'oracle2', 35000, 'coupes'),
('Osiris', 'osiris', 160000, 'supers'),
('Panto', 'panto', 10000, 'compacts'),
('Paradise', 'paradise', 19000, 'vans'),
('Pariah', 'pariah', 1420000, 'sports'),
('Patriot', 'patriot', 55000, 'suvs'),
('PCJ-600', 'pcj', 6200, 'motorcycles'),
('Penumbra', 'penumbra', 28000, 'sports'),
('Pfister', 'pfister811', 85000, 'supers'),
('Phoenix', 'phoenix', 12500, 'muscles'),
('Picador', 'picador', 18000, 'muscles'),
('Pigalle', 'pigalle', 20000, 'sportsclassics'),
('Prairie', 'prairie', 12000, 'compacts'),
('Premier', 'premier', 8000, 'sedans'),
('Primo Custom', 'primo2', 14000, 'sedans'),
('X80 Proto', 'prototipo', 2500000, 'supers'),
('Radius', 'radi', 29000, 'suvs'),
('Raiden', 'raiden', 1375000, 'sports'),
('Rapid GT', 'rapidgt', 35000, 'sports'),
('Rapid GT Convertible', 'rapidgt2', 45000, 'sports'),
('Rapid GT3', 'rapidgt3', 885000, 'sportsclassics'),
('Reaper', 'reaper', 150000, 'supers'),
('Rebel', 'rebel2', 35000, 'offroads'),
('Regina', 'regina', 5000, 'sedans'),
('Retinue', 'retinue', 615000, 'sportsclassics'),
('Revolter', 'revolter', 1610000, 'sports'),
('Riata', 'riata', 380000, 'offroads'),
('Rocoto', 'rocoto', 45000, 'suvs'),
('Ruffian', 'ruffian', 6800, 'motorcycles'),
('Ruiner 2', 'ruiner2', 5745600, 'muscles'),
('Rumpo', 'rumpo', 15000, 'vans'),
('Rumpo Trail', 'rumpo3', 19500, 'vans'),
('Sabre Turbo', 'sabregt', 20000, 'muscles'),
('Sabre GT', 'sabregt2', 25000, 'muscles'),
('Sanchez', 'sanchez', 5300, 'motorcycles'),
('Sanchez Sport', 'sanchez2', 5300, 'motorcycles'),
('Sanctus', 'sanctus', 25000, 'motorcycles'),
('Sandking', 'sandking', 55000, 'offroads'),
('Savestra', 'savestra', 990000, 'sportsclassics'),
('SC 1', 'sc1', 1603000, 'supers'),
('Schafter', 'schafter2', 25000, 'sedans'),
('Schafter V12', 'schafter3', 50000, 'sports'),
('Scorcher (velo)', 'scorcher', 280, 'motorcycles'),
('Seminole', 'seminole', 25000, 'suvs'),
('Sentinel', 'sentinel', 32000, 'coupes'),
('Sentinel XS', 'sentinel2', 40000, 'coupes'),
('Sentinel3', 'sentinel3', 650000, 'sports'),
('Seven 70', 'seven70', 39500, 'sports'),
('ETR1', 'sheava', 220000, 'supers'),
('Shotaro Concept', 'shotaro', 320000, 'motorcycles'),
('Slam Van', 'slamvan3', 11500, 'muscles'),
('Sovereign', 'sovereign', 22000, 'motorcycles'),
('Stinger', 'stinger', 80000, 'sportsclassics'),
('Stinger GT', 'stingergt', 75000, 'sportsclassics'),
('Streiter', 'streiter', 500000, 'sports'),
('Stretch', 'stretch', 90000, 'sedans'),
('Stromberg', 'stromberg', 3185350, 'sports'),
('Sultan', 'sultan', 15000, 'sports'),
('Sultan RS', 'sultanrs', 65000, 'supers'),
('Super Diamond', 'superd', 130000, 'sedans'),
('Surano', 'surano', 50000, 'sports'),
('Surfer', 'surfer', 12000, 'vans'),
('T20', 't20', 300000, 'supers'),
('Tailgater', 'tailgater', 30000, 'sedans'),
('Tampa', 'tampa', 16000, 'muscles'),
('Drift Tampa', 'tampa2', 80000, 'sports'),
('Thrust', 'thrust', 24000, 'motorcycles'),
('Tri bike (velo)', 'tribike3', 520, 'motorcycles'),
('Trophy Truck', 'trophytruck', 60000, 'offroads'),
('Trophy Truck Limited', 'trophytruck2', 80000, 'offroads'),
('Tropos', 'tropos', 40000, 'sports'),
('Turismo R', 'turismor', 350000, 'supers'),
('Tyrus', 'tyrus', 600000, 'supers'),
('Vacca', 'vacca', 120000, 'supers'),
('Vader', 'vader', 7200, 'motorcycles'),
('Verlierer', 'verlierer2', 70000, 'sports'),
('Vigero', 'vigero', 12500, 'muscles'),
('Virgo', 'virgo', 14000, 'muscles'),
('Viseris', 'viseris', 875000, 'sportsclassics'),
('Visione', 'visione', 2250000, 'supers'),
('Voltic', 'voltic', 90000, 'supers'),
('Voltic 2', 'voltic2', 3830400, 'supers'),
('Voodoo', 'voodoo', 7200, 'muscles'),
('Vortex', 'vortex', 9800, 'motorcycles'),
('Warrener', 'warrener', 4000, 'sedans'),
('Washington', 'washington', 9000, 'sedans'),
('Windsor', 'windsor', 95000, 'coupes'),
('Windsor Drop', 'windsor2', 125000, 'coupes'),
('Woflsbane', 'wolfsbane', 9000, 'motorcycles'),
('XLS', 'xls', 32000, 'suvs'),
('Yosemite', 'yosemite', 485000, 'muscles'),
('Youga', 'youga', 10800, 'vans'),
('Youga Luxuary', 'youga2', 14500, 'vans'),
('Z190', 'z190', 900000, 'sportsclassics'),
('Zentorno', 'zentorno', 1500000, 'supers'),
('Zion', 'zion', 36000, 'coupes'),
('Zion Cabrio', 'zion2', 45000, 'coupes'),
('Zombie', 'zombiea', 9500, 'motorcycles'),
('Zombie Luxuary', 'zombieb', 12000, 'motorcycles'),
('Z-Type', 'ztype', 220000, 'sportsclassics');

-- --------------------------------------------------------

--
-- Table structure for table `vs_car_categories`
--

CREATE TABLE `vs_car_categories` (
  `name` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vs_car_categories`
--

INSERT INTO `vs_car_categories` (`name`, `label`) VALUES
('compacts', 'Compacts'),
('coupes', 'Coupes'),
('motorcycles', 'Motorcycles'),
('muscles', 'Muscles'),
('offroads', 'Off-Roads'),
('sedans', 'Sedans'),
('sports', 'Sports'),
('sportsclassics', 'Sports Classics'),
('supers', 'Supers'),
('suvs', 'SUVs'),
('vans', 'Vans');

-- --------------------------------------------------------

--
-- Table structure for table `vs_divisions`
--

CREATE TABLE `vs_divisions` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `model` varchar(60) NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vs_divisions`
--

INSERT INTO `vs_divisions` (`id`, `name`, `model`, `price`, `category`) VALUES
(1, 'Maverick', 'polmav', 1000, 'aviation');

-- --------------------------------------------------------

--
-- Table structure for table `vs_division_categories`
--

CREATE TABLE `vs_division_categories` (
  `name` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vs_division_categories`
--

INSERT INTO `vs_division_categories` (`name`, `label`) VALUES
('aviation', 'Aviation');

-- --------------------------------------------------------

--
-- Table structure for table `vs_mecano`
--

CREATE TABLE `vs_mecano` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `model` varchar(60) NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vs_mecano`
--

INSERT INTO `vs_mecano` (`id`, `name`, `model`, `price`, `category`) VALUES
(1, 'Flatbed', 'flatbed', 500, 'recrue'),
(2, 'Tow Truck', 'towtruck2', 750, 'recrue'),
(3, 'Flatbed', 'flatbed', 500, 'novice'),
(4, 'Tow Truck', 'towtruck2', 750, 'novice'),
(5, 'Flatbed', 'flatbed', 500, 'experimente'),
(6, 'Tow Truck', 'towtruck2', 750, 'experimente'),
(7, 'Flatbed', 'flatbed', 500, 'chief'),
(8, 'Tow Truck', 'towtruck2', 750, 'chief'),
(9, 'Flatbed', 'flatbed', 500, 'boss'),
(10, 'Tow Truck', 'towtruck2', 750, 'boss');

-- --------------------------------------------------------

--
-- Table structure for table `vs_mecano_categories`
--

CREATE TABLE `vs_mecano_categories` (
  `name` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vs_mecano_categories`
--

INSERT INTO `vs_mecano_categories` (`name`, `label`) VALUES
('boss', 'Boss'),
('chief', 'Chief'),
('experimente', 'Experienced'),
('novice', 'Novice'),
('recrue', 'Recruit');

-- --------------------------------------------------------

--
-- Table structure for table `vs_police`
--

CREATE TABLE `vs_police` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `model` varchar(60) NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vs_police`
--

INSERT INTO `vs_police` (`id`, `name`, `model`, `price`, `category`) VALUES
(1, 'Police Cruiser', 'police', 500, 'recruit'),
(2, 'Police Cruiser', 'police2', 750, 'recruit'),
(3, 'Police Cruiser', 'police', 500, 'officer'),
(4, 'Police Cruiser', 'police2', 750, 'officer'),
(5, 'Police Cruiser', 'police', 500, 'sergeant'),
(6, 'Police Cruiser', 'police2', 750, 'sergeant'),
(7, 'Police Cruiser', 'police', 500, 'lieutenant'),
(8, 'Police Cruiser', 'police2', 750, 'lieutenant'),
(9, 'Police Cruiser', 'police', 500, 'boss'),
(10, 'Police Cruiser', 'police2', 750, 'boss');

-- --------------------------------------------------------

--
-- Table structure for table `vs_police_categories`
--

CREATE TABLE `vs_police_categories` (
  `name` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vs_police_categories`
--

INSERT INTO `vs_police_categories` (`name`, `label`) VALUES
('boss', 'Chief'),
('lieutenant', 'Lieutenant'),
('officer', 'Officer'),
('recruit', 'Recruit'),
('sergeant', 'Sergeant');

-- --------------------------------------------------------

--
-- Table structure for table `vs_trucks`
--

CREATE TABLE `vs_trucks` (
  `name` varchar(60) NOT NULL,
  `model` varchar(60) NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vs_trucks`
--

INSERT INTO `vs_trucks` (`name`, `model`, `price`, `category`) VALUES
('Airport Bus', 'airbus', 50000, 'trans'),
('Benson', 'benson', 55000, 'box'),
('Biff', 'biff', 30000, 'other'),
('Boxville 1', 'boxville', 45000, 'box'),
('Boxville 2', 'boxville2', 45000, 'box'),
('Boxville 3', 'boxville3', 45000, 'box'),
('Boxville 4', 'boxville4', 45000, 'box'),
('Dozer', 'bulldozer', 20000, 'other'),
('Bus', 'bus', 50000, 'trans'),
('Dashound', 'coach', 50000, 'trans'),
('Hauler', 'hauler', 100000, 'haul'),
('Mixer 1', 'mixer', 30000, 'other'),
('Mixer 2', 'mixer2', 30000, 'other'),
('Mule 1', 'mule', 40000, 'box'),
('Mule 2', 'mule2', 40000, 'box'),
('Mule 3', 'mule3', 40000, 'box'),
('Packer', 'packer', 100000, 'haul'),
('Festival Bus', 'pbus2', 125000, 'trans'),
('Phantom', 'phantom', 105000, 'haul'),
('Phantom Custom', 'phantom3', 110000, 'haul'),
('Pounder', 'pounder', 55000, 'box'),
('Rental Bus', 'rentalbus', 35000, 'trans'),
('Rubble', 'rubble', 30000, 'other'),
('Scrap Truck', 'scrap', 10000, 'other'),
('Tipper 1', 'tiptruck', 30000, 'other'),
('Tipper 2', 'tiptruck2', 30000, 'other'),
('Tour Bus', 'tourbus', 35000, 'trans'),
('Field Master', 'tractor2', 15000, 'other');

-- --------------------------------------------------------

--
-- Table structure for table `vs_truck_categories`
--

CREATE TABLE `vs_truck_categories` (
  `name` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vs_truck_categories`
--

INSERT INTO `vs_truck_categories` (`name`, `label`) VALUES
('box', 'Boxed Trucks'),
('haul', 'Haulers'),
('other', 'Other Trucks'),
('trans', 'Transport Trucks');

-- --------------------------------------------------------

--
-- Table structure for table `vs_vipboats`
--

CREATE TABLE `vs_vipboats` (
  `name` varchar(60) NOT NULL,
  `model` varchar(60) NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vs_vipboats`
--

INSERT INTO `vs_vipboats` (`name`, `model`, `price`, `category`) VALUES
('Tropic Yacht', 'tropic2', 27000, 'boats');

-- --------------------------------------------------------

--
-- Table structure for table `vs_vipboat_categories`
--

CREATE TABLE `vs_vipboat_categories` (
  `name` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vs_vipboat_categories`
--

INSERT INTO `vs_vipboat_categories` (`name`, `label`) VALUES
('boats', 'Boats');

-- --------------------------------------------------------

--
-- Table structure for table `vs_vips`
--

CREATE TABLE `vs_vips` (
  `name` varchar(60) NOT NULL,
  `model` varchar(60) NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vs_vips`
--

INSERT INTO `vs_vips` (`name`, `model`, `price`, `category`) VALUES
('Shotaro', 'shotaro', 30000, 'motorcycles');

-- --------------------------------------------------------

--
-- Table structure for table `vs_vip_categories`
--

CREATE TABLE `vs_vip_categories` (
  `name` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vs_vip_categories`
--

INSERT INTO `vs_vip_categories` (`name`, `label`) VALUES
('motorcycles', 'Motos');

-- --------------------------------------------------------

--
-- Table structure for table `weashops`
--

CREATE TABLE `weashops` (
  `id` int(11) NOT NULL,
  `zone` varchar(255) NOT NULL,
  `item` varchar(255) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `weashops`
--

INSERT INTO `weashops` (`id`, `zone`, `item`, `price`) VALUES
(1, 'GunShop', 'WEAPON_PISTOL', 300),
(2, 'BlackWeashop', 'WEAPON_PISTOL', 500),
(3, 'GunShop', 'WEAPON_FLASHLIGHT', 60),
(4, 'BlackWeashop', 'WEAPON_FLASHLIGHT', 70),
(5, 'GunShop', 'WEAPON_MACHETE', 90),
(6, 'BlackWeashop', 'WEAPON_MACHETE', 110),
(7, 'GunShop', 'WEAPON_NIGHTSTICK', 150),
(8, 'BlackWeashop', 'WEAPON_NIGHTSTICK', 150),
(9, 'GunShop', 'WEAPON_BAT', 100),
(10, 'BlackWeashop', 'WEAPON_BAT', 100),
(11, 'GunShop', 'WEAPON_STUNGUN', 50),
(12, 'BlackWeashop', 'WEAPON_STUNGUN', 50),
(13, 'GunShop', 'WEAPON_MICROSMG', 1400),
(14, 'BlackWeashop', 'WEAPON_MICROSMG', 1700),
(15, 'GunShop', 'WEAPON_PUMPSHOTGUN', 3400),
(16, 'BlackWeashop', 'WEAPON_PUMPSHOTGUN', 3500),
(17, 'GunShop', 'WEAPON_ASSAULTRIFLE', 10000),
(18, 'BlackWeashop', 'WEAPON_ASSAULTRIFLE', 11000),
(19, 'GunShop', 'WEAPON_SPECIALCARBINE', 15000),
(20, 'BlackWeashop', 'WEAPON_SPECIALCARBINE', 16500),
(21, 'GunShop', 'WEAPON_SNIPERRIFLE', 22000),
(22, 'BlackWeashop', 'WEAPON_SNIPERRIFLE', 24000),
(23, 'GunShop', 'WEAPON_FIREWORK', 18000),
(24, 'BlackWeashop', 'WEAPON_FIREWORK', 20000),
(25, 'GunShop', 'WEAPON_GRENADE', 500),
(26, 'BlackWeashop', 'WEAPON_GRENADE', 650),
(27, 'GunShop', 'WEAPON_BZGAS', 200),
(28, 'BlackWeashop', 'WEAPON_BZGAS', 350),
(29, 'GunShop', 'WEAPON_FIREEXTINGUISHER', 100),
(30, 'BlackWeashop', 'WEAPON_FIREEXTINGUISHER', 100),
(31, 'GunShop', 'WEAPON_BALL', 50),
(32, 'BlackWeashop', 'WEAPON_BALL', 50),
(33, 'GunShop', 'WEAPON_SMOKEGRENADE', 100),
(34, 'BlackWeashop', 'WEAPON_SMOKEGRENADE', 100),
(35, 'BlackWeashop', 'WEAPON_APPISTOL', 1100),
(36, 'BlackWeashop', 'WEAPON_CARBINERIFLE', 12000),
(37, 'BlackWeashop', 'WEAPON_HEAVYSNIPER', 30000),
(38, 'BlackWeashop', 'WEAPON_MINIGUN', 45000),
(39, 'BlackWeashop', 'WEAPON_RAILGUN', 50000),
(40, 'BlackWeashop', 'WEAPON_STICKYBOMB', 500);

-- --------------------------------------------------------

--
-- Table structure for table `yellow_tweets`
--

CREATE TABLE `yellow_tweets` (
  `id` int(11) NOT NULL,
  `phone_number` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `firstname` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addon_account`
--
ALTER TABLE `addon_account`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `addon_account_data`
--
ALTER TABLE `addon_account_data`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `index_addon_account_data_account_name_owner` (`account_name`,`owner`),
  ADD KEY `index_addon_account_data_account_name` (`account_name`);

--
-- Indexes for table `addon_inventory`
--
ALTER TABLE `addon_inventory`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `addon_inventory_items`
--
ALTER TABLE `addon_inventory_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_addon_inventory_items_inventory_name_name` (`inventory_name`,`name`),
  ADD KEY `index_addon_inventory_items_inventory_name_name_owner` (`inventory_name`,`name`,`owner`),
  ADD KEY `index_addon_inventory_inventory_name` (`inventory_name`);

--
-- Indexes for table `ammunition`
--
ALTER TABLE `ammunition`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `weapon_id` (`weapon_id`);

--
-- Indexes for table `bank_transfer`
--
ALTER TABLE `bank_transfer`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `billing`
--
ALTER TABLE `billing`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `datastore`
--
ALTER TABLE `datastore`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `datastore_data`
--
ALTER TABLE `datastore_data`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `index_datastore_data_name_owner` (`name`,`owner`),
  ADD KEY `index_datastore_data_name` (`name`);

--
-- Indexes for table `dpkeybinds`
--
ALTER TABLE `dpkeybinds`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fine_types`
--
ALTER TABLE `fine_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `insto_accounts`
--
ALTER TABLE `insto_accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `insto_instas`
--
ALTER TABLE `insto_instas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_insto_instas_insto_accounts` (`authorId`);

--
-- Indexes for table `insto_likes`
--
ALTER TABLE `insto_likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_insto_likes_insto_accounts` (`authorId`),
  ADD KEY `FK_insto_likes_insto_instas` (`inapId`);

--
-- Indexes for table `inventory_glovebox`
--
ALTER TABLE `inventory_glovebox`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `plate` (`plate`);

--
-- Indexes for table `inventory_hotbar`
--
ALTER TABLE `inventory_hotbar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inventory_trunk`
--
ALTER TABLE `inventory_trunk`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `plate` (`plate`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `job_grades`
--
ALTER TABLE `job_grades`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `licenses`
--
ALTER TABLE `licenses`
  ADD PRIMARY KEY (`type`);

--
-- Indexes for table `m3_uber_points`
--
ALTER TABLE `m3_uber_points`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `owned_properties`
--
ALTER TABLE `owned_properties`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `owned_vehicles`
--
ALTER TABLE `owned_vehicles`
  ADD PRIMARY KEY (`plate`);

--
-- Indexes for table `phone_app_chat`
--
ALTER TABLE `phone_app_chat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `phone_calls`
--
ALTER TABLE `phone_calls`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `phone_ch_reddit`
--
ALTER TABLE `phone_ch_reddit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `phone_messages`
--
ALTER TABLE `phone_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `phone_reddit`
--
ALTER TABLE `phone_reddit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `phone_shops`
--
ALTER TABLE `phone_shops`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `phone_users_contacts`
--
ALTER TABLE `phone_users_contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `properties`
--
ALTER TABLE `properties`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rented_vehicles`
--
ALTER TABLE `rented_vehicles`
  ADD PRIMARY KEY (`plate`);

--
-- Indexes for table `shops`
--
ALTER TABLE `shops`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `society_moneywash`
--
ALTER TABLE `society_moneywash`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trunk_inventory`
--
ALTER TABLE `trunk_inventory`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `plate` (`plate`);

--
-- Indexes for table `twitter_accounts`
--
ALTER TABLE `twitter_accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `twitter_likes`
--
ALTER TABLE `twitter_likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_twitter_likes_twitter_accounts` (`authorId`),
  ADD KEY `FK_twitter_likes_twitter_tweets` (`tweetId`);

--
-- Indexes for table `twitter_tweets`
--
ALTER TABLE `twitter_tweets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_twitter_tweets_twitter_accounts` (`authorId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_lastcharacter`
--
ALTER TABLE `user_lastcharacter`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_licenses`
--
ALTER TABLE `user_licenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`model`);

--
-- Indexes for table `vehicle_categories`
--
ALTER TABLE `vehicle_categories`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `vehicle_display`
--
ALTER TABLE `vehicle_display`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vehicle_parking`
--
ALTER TABLE `vehicle_parking`
  ADD PRIMARY KEY (`plate`);

--
-- Indexes for table `vs_aircrafts`
--
ALTER TABLE `vs_aircrafts`
  ADD PRIMARY KEY (`model`);

--
-- Indexes for table `vs_aircraft_categories`
--
ALTER TABLE `vs_aircraft_categories`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `vs_ambulance`
--
ALTER TABLE `vs_ambulance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vs_ambulance_categories`
--
ALTER TABLE `vs_ambulance_categories`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `vs_boats`
--
ALTER TABLE `vs_boats`
  ADD PRIMARY KEY (`model`);

--
-- Indexes for table `vs_boat_categories`
--
ALTER TABLE `vs_boat_categories`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `vs_cars`
--
ALTER TABLE `vs_cars`
  ADD PRIMARY KEY (`model`);

--
-- Indexes for table `vs_car_categories`
--
ALTER TABLE `vs_car_categories`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `vs_divisions`
--
ALTER TABLE `vs_divisions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vs_division_categories`
--
ALTER TABLE `vs_division_categories`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `vs_mecano`
--
ALTER TABLE `vs_mecano`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vs_mecano_categories`
--
ALTER TABLE `vs_mecano_categories`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `vs_police`
--
ALTER TABLE `vs_police`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vs_police_categories`
--
ALTER TABLE `vs_police_categories`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `vs_trucks`
--
ALTER TABLE `vs_trucks`
  ADD PRIMARY KEY (`model`);

--
-- Indexes for table `vs_truck_categories`
--
ALTER TABLE `vs_truck_categories`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `vs_vipboats`
--
ALTER TABLE `vs_vipboats`
  ADD PRIMARY KEY (`model`);

--
-- Indexes for table `vs_vipboat_categories`
--
ALTER TABLE `vs_vipboat_categories`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `vs_vips`
--
ALTER TABLE `vs_vips`
  ADD PRIMARY KEY (`model`);

--
-- Indexes for table `vs_vip_categories`
--
ALTER TABLE `vs_vip_categories`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `weashops`
--
ALTER TABLE `weashops`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `yellow_tweets`
--
ALTER TABLE `yellow_tweets`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addon_account_data`
--
ALTER TABLE `addon_account_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;

--
-- AUTO_INCREMENT for table `addon_inventory_items`
--
ALTER TABLE `addon_inventory_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ammunition`
--
ALTER TABLE `ammunition`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `bank_transfer`
--
ALTER TABLE `bank_transfer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `billing`
--
ALTER TABLE `billing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `datastore_data`
--
ALTER TABLE `datastore_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=173;

--
-- AUTO_INCREMENT for table `fine_types`
--
ALTER TABLE `fine_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `insto_accounts`
--
ALTER TABLE `insto_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `insto_instas`
--
ALTER TABLE `insto_instas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=222;

--
-- AUTO_INCREMENT for table `insto_likes`
--
ALTER TABLE `insto_likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=189;

--
-- AUTO_INCREMENT for table `inventory_glovebox`
--
ALTER TABLE `inventory_glovebox`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `inventory_hotbar`
--
ALTER TABLE `inventory_hotbar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `inventory_trunk`
--
ALTER TABLE `inventory_trunk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `job_grades`
--
ALTER TABLE `job_grades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `m3_uber_points`
--
ALTER TABLE `m3_uber_points`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `owned_properties`
--
ALTER TABLE `owned_properties`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phone_app_chat`
--
ALTER TABLE `phone_app_chat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `phone_calls`
--
ALTER TABLE `phone_calls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;

--
-- AUTO_INCREMENT for table `phone_ch_reddit`
--
ALTER TABLE `phone_ch_reddit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `phone_messages`
--
ALTER TABLE `phone_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `phone_reddit`
--
ALTER TABLE `phone_reddit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `phone_shops`
--
ALTER TABLE `phone_shops`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `phone_users_contacts`
--
ALTER TABLE `phone_users_contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `properties`
--
ALTER TABLE `properties`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT for table `shops`
--
ALTER TABLE `shops`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `society_moneywash`
--
ALTER TABLE `society_moneywash`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `trunk_inventory`
--
ALTER TABLE `trunk_inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `twitter_accounts`
--
ALTER TABLE `twitter_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `twitter_likes`
--
ALTER TABLE `twitter_likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=138;

--
-- AUTO_INCREMENT for table `twitter_tweets`
--
ALTER TABLE `twitter_tweets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=170;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_lastcharacter`
--
ALTER TABLE `user_lastcharacter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_licenses`
--
ALTER TABLE `user_licenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `vehicle_display`
--
ALTER TABLE `vehicle_display`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `vs_ambulance`
--
ALTER TABLE `vs_ambulance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `vs_divisions`
--
ALTER TABLE `vs_divisions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `vs_mecano`
--
ALTER TABLE `vs_mecano`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `vs_police`
--
ALTER TABLE `vs_police`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `weashops`
--
ALTER TABLE `weashops`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `twitter_likes`
--
ALTER TABLE `twitter_likes`
  ADD CONSTRAINT `FK_twitter_likes_twitter_accounts` FOREIGN KEY (`authorId`) REFERENCES `twitter_accounts` (`id`),
  ADD CONSTRAINT `FK_twitter_likes_twitter_tweets` FOREIGN KEY (`tweetId`) REFERENCES `twitter_tweets` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `twitter_tweets`
--
ALTER TABLE `twitter_tweets`
  ADD CONSTRAINT `FK_twitter_tweets_twitter_accounts` FOREIGN KEY (`authorId`) REFERENCES `twitter_accounts` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
