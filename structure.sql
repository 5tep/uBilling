-- --------------------------------------------------------
-- Хост:                         10.29.14.2
-- Версия сервера:               8.0.39-0ubuntu0.22.04.1 - (Ubuntu)
-- Операционная система:         Linux
-- HeidiSQL Версия:              12.0.0.6468
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb3 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Дамп структуры базы данных testtest
CREATE DATABASE IF NOT EXISTS `testtest` /*!40100 DEFAULT CHARACTER SET utf16 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `testtest`;

-- Дамп структуры для таблица testtest.adcomments
CREATE TABLE IF NOT EXISTS `adcomments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `scope` varchar(255) NOT NULL,
  `item` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `admin` varchar(40) NOT NULL,
  `text` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `scope` (`scope`),
  KEY `item` (`item`),
  KEY `date` (`date`)
) ENGINE=MyISAM AUTO_INCREMENT=499 DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.address
CREATE TABLE IF NOT EXISTS `address` (
  `id` int NOT NULL AUTO_INCREMENT,
  `login` varchar(45) NOT NULL,
  `aptid` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `login` (`login`),
  KEY `aptid` (`aptid`)
) ENGINE=MyISAM AUTO_INCREMENT=3771 DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.address_extended
CREATE TABLE IF NOT EXISTS `address_extended` (
  `id` int NOT NULL AUTO_INCREMENT,
  `login` varchar(50) NOT NULL,
  `postal_code` varchar(10) NOT NULL DEFAULT '',
  `town_district` varchar(150) NOT NULL DEFAULT '',
  `address_exten` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.admacquainted
CREATE TABLE IF NOT EXISTS `admacquainted` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `admin` varchar(40) NOT NULL,
  `annid` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `date` (`date`,`admin`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.admannouncements
CREATE TABLE IF NOT EXISTS `admannouncements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `text` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.admins
CREATE TABLE IF NOT EXISTS `admins` (
  `login` varchar(40) NOT NULL DEFAULT '',
  `password` varchar(150) DEFAULT '*',
  `ChgConf` tinyint DEFAULT '0',
  `ChgPassword` tinyint DEFAULT '0',
  `ChgStat` tinyint DEFAULT '0',
  `ChgCash` tinyint DEFAULT '0',
  `UsrAddDel` tinyint DEFAULT '0',
  `ChgTariff` tinyint DEFAULT '0',
  `ChgAdmin` tinyint DEFAULT '0',
  PRIMARY KEY (`login`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.ahenassign
CREATE TABLE IF NOT EXISTS `ahenassign` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ahenid` int NOT NULL,
  `streetname` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.ahenassignstrict
CREATE TABLE IF NOT EXISTS `ahenassignstrict` (
  `id` int NOT NULL AUTO_INCREMENT,
  `agentid` int NOT NULL,
  `login` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `login` (`login`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.apt
CREATE TABLE IF NOT EXISTS `apt` (
  `id` int NOT NULL AUTO_INCREMENT,
  `buildid` int NOT NULL,
  `entrance` varchar(15) DEFAULT NULL,
  `floor` varchar(15) DEFAULT NULL,
  `apt` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `apt` (`apt`),
  KEY `buildid` (`buildid`)
) ENGINE=MyISAM AUTO_INCREMENT=3771 DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.askcalls
CREATE TABLE IF NOT EXISTS `askcalls` (
  `id` int NOT NULL AUTO_INCREMENT,
  `filename` varchar(250) DEFAULT NULL,
  `login` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.banksta2
CREATE TABLE IF NOT EXISTS `banksta2` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `hash` varchar(255) NOT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `admin` varchar(255) NOT NULL,
  `contract` varchar(255) DEFAULT NULL,
  `summ` varchar(42) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `realname` varchar(255) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `pdate` varchar(42) DEFAULT NULL,
  `ptime` varchar(42) DEFAULT NULL,
  `processed` tinyint NOT NULL,
  `canceled` tinyint NOT NULL,
  `service_type` varchar(100) NOT NULL DEFAULT '',
  `payid` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.banksta2_presets
CREATE TABLE IF NOT EXISTS `banksta2_presets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `presetname` varchar(80) NOT NULL,
  `col_realname` varchar(20) DEFAULT '',
  `col_address` varchar(20) DEFAULT '',
  `col_paysum` varchar(20) DEFAULT '',
  `sum_in_coins` tinyint DEFAULT '0',
  `col_paypurpose` varchar(20) DEFAULT '',
  `col_paydate` varchar(20) DEFAULT '',
  `col_paytime` varchar(20) DEFAULT '',
  `col_contract` varchar(20) DEFAULT '',
  `col_srvidents` varchar(20) DEFAULT '',
  `guess_contract` tinyint DEFAULT '0',
  `srvidents_preffered` tinyint DEFAULT '0',
  `contract_delim_start` varchar(40) DEFAULT '',
  `contract_delim_end` varchar(40) DEFAULT '',
  `contract_min_len` tinyint DEFAULT '0',
  `contract_max_len` tinyint DEFAULT '0',
  `service_type` varchar(100) NOT NULL DEFAULT '',
  `inet_srv_start_delim` varchar(40) DEFAULT '',
  `inet_srv_end_delim` varchar(40) DEFAULT '',
  `inet_srv_keywords` varchar(200) DEFAULT '',
  `noesc_inet_srv_keywords` tinyint DEFAULT '0',
  `ukv_srv_start_delim` varchar(40) DEFAULT '',
  `ukv_srv_end_delim` varchar(40) DEFAULT '',
  `ukv_srv_keywords` varchar(200) DEFAULT '',
  `noesc_ukv_srv_keywords` tinyint DEFAULT '0',
  `skip_row` tinyint DEFAULT '0',
  `col_skiprow` varchar(100) DEFAULT '',
  `skip_row_keywords` varchar(200) DEFAULT '',
  `noesc_skip_row_keywords` tinyint DEFAULT '0',
  `replace_strs` tinyint DEFAULT '0',
  `col_replace_strs` varchar(100) DEFAULT '',
  `strs_to_replace` varchar(200) DEFAULT '',
  `strs_to_replace_with` varchar(200) DEFAULT '',
  `replacements_cnt` tinyint DEFAULT '1',
  `noesc_replace_keywords` tinyint DEFAULT '0',
  `remove_strs` tinyint DEFAULT '0',
  `col_remove_strs` varchar(100) DEFAULT '',
  `strs_to_remove` varchar(200) DEFAULT '',
  `noesc_remove_keywords` tinyint DEFAULT '0',
  `payment_type_id` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `presetname` (`presetname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.bankstamd
CREATE TABLE IF NOT EXISTS `bankstamd` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `hash` varchar(255) NOT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `admin` varchar(255) NOT NULL,
  `contract` varchar(255) DEFAULT NULL,
  `summ` varchar(42) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `realname` varchar(255) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `pdate` varchar(42) DEFAULT NULL,
  `ptime` varchar(42) DEFAULT NULL,
  `processed` tinyint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.bankstaparsed
CREATE TABLE IF NOT EXISTS `bankstaparsed` (
  `id` int NOT NULL AUTO_INCREMENT,
  `hash` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `row` int NOT NULL,
  `realname` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `summ` float NOT NULL,
  `state` int NOT NULL,
  `login` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.bankstaraw
CREATE TABLE IF NOT EXISTS `bankstaraw` (
  `id` int NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) NOT NULL,
  `rawdata` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.branches
CREATE TABLE IF NOT EXISTS `branches` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.branchesadmins
CREATE TABLE IF NOT EXISTS `branchesadmins` (
  `id` int NOT NULL AUTO_INCREMENT,
  `branchid` int NOT NULL,
  `admin` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.branchescities
CREATE TABLE IF NOT EXISTS `branchescities` (
  `id` int NOT NULL AUTO_INCREMENT,
  `branchid` int NOT NULL,
  `cityid` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.branchesservices
CREATE TABLE IF NOT EXISTS `branchesservices` (
  `id` int NOT NULL AUTO_INCREMENT,
  `branchid` int NOT NULL,
  `serviceid` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.branchestariffs
CREATE TABLE IF NOT EXISTS `branchestariffs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `branchid` int NOT NULL,
  `tariff` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.branchesusers
CREATE TABLE IF NOT EXISTS `branchesusers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `branchid` int NOT NULL,
  `login` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.build
CREATE TABLE IF NOT EXISTS `build` (
  `id` int NOT NULL AUTO_INCREMENT,
  `streetid` int NOT NULL,
  `buildnum` varchar(10) NOT NULL,
  `geo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `buildnum` (`buildnum`),
  KEY `streetid` (`streetid`)
) ENGINE=MyISAM AUTO_INCREMENT=690 DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.buildpassport
CREATE TABLE IF NOT EXISTS `buildpassport` (
  `id` int NOT NULL AUTO_INCREMENT,
  `buildid` int NOT NULL,
  `owner` varchar(255) DEFAULT NULL,
  `ownername` varchar(255) DEFAULT NULL,
  `ownerphone` varchar(255) DEFAULT NULL,
  `ownercontact` varchar(255) DEFAULT NULL,
  `keys` tinyint DEFAULT NULL,
  `accessnotices` varchar(255) DEFAULT NULL,
  `floors` int DEFAULT NULL,
  `apts` int DEFAULT NULL,
  `entrances` int DEFAULT NULL,
  `notes` text,
  `contract` tinyint DEFAULT NULL,
  `mediator` tinyint DEFAULT NULL,
  `anthill` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `buildid` (`buildid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.callmeback
CREATE TABLE IF NOT EXISTS `callmeback` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `number` varchar(250) DEFAULT NULL,
  `state` varchar(40) DEFAULT NULL,
  `statedate` datetime DEFAULT NULL,
  `admin` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.callshist
CREATE TABLE IF NOT EXISTS `callshist` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `number` varchar(120) NOT NULL,
  `login` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `login` (`login`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.capab
CREATE TABLE IF NOT EXISTS `capab` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `stateid` int NOT NULL DEFAULT '0',
  `notes` text,
  `price` varchar(255) DEFAULT NULL,
  `employeeid` int DEFAULT NULL,
  `donedate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `date` (`date`),
  KEY `state` (`stateid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.capabhist
CREATE TABLE IF NOT EXISTS `capabhist` (
  `id` int NOT NULL AUTO_INCREMENT,
  `capabid` int NOT NULL,
  `admin` varchar(40) NOT NULL,
  `date` datetime NOT NULL,
  `type` varchar(40) NOT NULL,
  `event` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.capabstates
CREATE TABLE IF NOT EXISTS `capabstates` (
  `id` int NOT NULL AUTO_INCREMENT,
  `state` varchar(255) NOT NULL,
  `color` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.capdata
CREATE TABLE IF NOT EXISTS `capdata` (
  `id` int NOT NULL AUTO_INCREMENT,
  `login` varchar(255) NOT NULL,
  `date` datetime DEFAULT NULL,
  `days` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `login` (`login`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.cardbank
CREATE TABLE IF NOT EXISTS `cardbank` (
  `id` int NOT NULL AUTO_INCREMENT,
  `serial` varchar(255) NOT NULL,
  `cash` varchar(45) NOT NULL,
  `admin` varchar(45) NOT NULL,
  `date` datetime NOT NULL,
  `active` tinyint(1) NOT NULL,
  `used` tinyint(1) NOT NULL,
  `usedate` datetime DEFAULT NULL,
  `usedlogin` varchar(45) NOT NULL,
  `usedip` varchar(45) DEFAULT NULL,
  `part` varchar(255) DEFAULT NULL,
  `receipt_date` datetime DEFAULT NULL,
  `selling_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6001 DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.cardbrute
CREATE TABLE IF NOT EXISTS `cardbrute` (
  `id` int NOT NULL AUTO_INCREMENT,
  `serial` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `login` varchar(45) NOT NULL,
  `ip` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1204 DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.cashtype
CREATE TABLE IF NOT EXISTS `cashtype` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cashtype` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cashtype` (`cashtype`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.catv_activity
CREATE TABLE IF NOT EXISTS `catv_activity` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userid` int NOT NULL,
  `state` tinyint NOT NULL,
  `date` datetime NOT NULL,
  `admin` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.catv_bankstaparsed
CREATE TABLE IF NOT EXISTS `catv_bankstaparsed` (
  `id` int NOT NULL AUTO_INCREMENT,
  `hash` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `row` int NOT NULL,
  `realname` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `summ` float NOT NULL,
  `state` int NOT NULL,
  `login` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.catv_bankstaraw
CREATE TABLE IF NOT EXISTS `catv_bankstaraw` (
  `id` int NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) NOT NULL,
  `rawdata` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.catv_decoders
CREATE TABLE IF NOT EXISTS `catv_decoders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `userid` int NOT NULL,
  `decoder` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.catv_fees
CREATE TABLE IF NOT EXISTS `catv_fees` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `userid` int NOT NULL,
  `summ` float NOT NULL,
  `balance` float DEFAULT NULL,
  `month` int NOT NULL,
  `year` int NOT NULL,
  `admin` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.catv_payments
CREATE TABLE IF NOT EXISTS `catv_payments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `userid` int NOT NULL,
  `summ` float NOT NULL,
  `from_month` int NOT NULL,
  `from_year` int NOT NULL,
  `to_month` int NOT NULL,
  `to_year` int NOT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `admin` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.catv_paymentscorr
CREATE TABLE IF NOT EXISTS `catv_paymentscorr` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `userid` int NOT NULL,
  `summ` float NOT NULL,
  `from_month` int NOT NULL,
  `from_year` int NOT NULL,
  `to_month` int NOT NULL,
  `to_year` int NOT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `admin` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.catv_signups
CREATE TABLE IF NOT EXISTS `catv_signups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `userid` int NOT NULL,
  `admin` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.catv_tariffs
CREATE TABLE IF NOT EXISTS `catv_tariffs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `price` float NOT NULL,
  `chans` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.catv_users
CREATE TABLE IF NOT EXISTS `catv_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `contract` varchar(255) DEFAULT NULL,
  `realname` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `build` varchar(15) DEFAULT NULL,
  `apt` varchar(15) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `tariff` int DEFAULT NULL,
  `tariff_nm` int DEFAULT NULL,
  `cash` float NOT NULL,
  `discount` float DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `decoder` int DEFAULT NULL,
  `inetlink` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.cemetery
CREATE TABLE IF NOT EXISTS `cemetery` (
  `id` int NOT NULL AUTO_INCREMENT,
  `login` varchar(255) NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.cfitems
CREATE TABLE IF NOT EXISTS `cfitems` (
  `id` int NOT NULL AUTO_INCREMENT,
  `typeid` int NOT NULL,
  `login` varchar(255) NOT NULL,
  `content` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `login` (`login`),
  KEY `login_2` (`login`)
) ENGINE=MyISAM AUTO_INCREMENT=324 DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.cftypes
CREATE TABLE IF NOT EXISTS `cftypes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(15) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.city
CREATE TABLE IF NOT EXISTS `city` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cityname` varchar(255) NOT NULL,
  `cityalias` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cityname` (`cityname`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.condet
CREATE TABLE IF NOT EXISTS `condet` (
  `id` int NOT NULL AUTO_INCREMENT,
  `login` varchar(255) DEFAULT NULL,
  `seal` varchar(40) DEFAULT NULL,
  `length` varchar(40) DEFAULT NULL,
  `price` varchar(40) DEFAULT NULL,
  `term` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `login` (`login`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.contacts
CREATE TABLE IF NOT EXISTS `contacts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `phone` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.contractdates
CREATE TABLE IF NOT EXISTS `contractdates` (
  `id` int NOT NULL AUTO_INCREMENT,
  `contract` varchar(255) NOT NULL,
  `date` date DEFAULT NULL,
  `from` date DEFAULT NULL,
  `till` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1903 DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.contracts
CREATE TABLE IF NOT EXISTS `contracts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `login` varchar(45) NOT NULL,
  `contract` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `login` (`login`),
  KEY `login_2` (`login`)
) ENGINE=MyISAM AUTO_INCREMENT=3551 DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.contrahens
CREATE TABLE IF NOT EXISTS `contrahens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `bankacc` varchar(255) DEFAULT NULL,
  `bankname` varchar(255) DEFAULT NULL,
  `bankcode` varchar(255) DEFAULT NULL,
  `edrpo` varchar(255) DEFAULT NULL,
  `ipn` varchar(255) DEFAULT NULL,
  `licensenum` varchar(255) DEFAULT NULL,
  `juraddr` varchar(255) DEFAULT NULL,
  `phisaddr` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `contrname` varchar(255) NOT NULL,
  `agnameabbr` varchar(255) DEFAULT NULL,
  `agsignatory` varchar(255) DEFAULT NULL,
  `agsignatory2` varchar(255) DEFAULT NULL,
  `agbasis` varchar(255) DEFAULT NULL,
  `agmail` varchar(100) DEFAULT NULL,
  `siteurl` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.contrahens_extinfo
CREATE TABLE IF NOT EXISTS `contrahens_extinfo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `agentid` int NOT NULL,
  `service_type` varchar(50) NOT NULL DEFAULT '',
  `internal_paysys_name` varchar(50) NOT NULL DEFAULT '',
  `internal_paysys_id` varchar(50) NOT NULL DEFAULT '',
  `internal_paysys_srv_id` varchar(50) NOT NULL DEFAULT '',
  `paysys_token` varchar(255) NOT NULL DEFAULT '',
  `paysys_secret_key` varchar(255) NOT NULL DEFAULT '',
  `paysys_password` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.cpe
CREATE TABLE IF NOT EXISTS `cpe` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cpemodelid` int NOT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `desc` varchar(255) NOT NULL,
  `location` varchar(255) DEFAULT NULL,
  `snmp` varchar(45) DEFAULT NULL,
  `netid` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.cpetypes
CREATE TABLE IF NOT EXISTS `cpetypes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cpemodel` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.crm_activities
CREATE TABLE IF NOT EXISTS `crm_activities` (
  `id` int NOT NULL AUTO_INCREMENT,
  `leadid` int NOT NULL,
  `date` datetime NOT NULL,
  `admin` varchar(64) DEFAULT NULL,
  `employeeid` int DEFAULT NULL,
  `state` tinyint(1) DEFAULT '0',
  `notes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `leadid` (`leadid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.crm_leads
CREATE TABLE IF NOT EXISTS `crm_leads` (
  `id` int NOT NULL AUTO_INCREMENT,
  `address` varchar(255) NOT NULL,
  `realname` varchar(255) NOT NULL,
  `phone` varchar(32) DEFAULT NULL,
  `mobile` varchar(32) NOT NULL,
  `extmobile` varchar(32) DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  `branch` int DEFAULT NULL,
  `tariff` varchar(64) DEFAULT NULL,
  `login` varchar(64) DEFAULT NULL,
  `employeeid` int DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `login` (`login`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.crm_stateslog
CREATE TABLE IF NOT EXISTS `crm_stateslog` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `admin` varchar(64) DEFAULT NULL,
  `scope` varchar(64) DEFAULT NULL,
  `itemid` varchar(128) NOT NULL,
  `action` varchar(32) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `scope` (`scope`),
  KEY `itemid` (`itemid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.cudiscounts
CREATE TABLE IF NOT EXISTS `cudiscounts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `login` varchar(255) NOT NULL,
  `discount` double DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `days` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `login` (`login`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.custmaps
CREATE TABLE IF NOT EXISTS `custmaps` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.custmapsitems
CREATE TABLE IF NOT EXISTS `custmapsitems` (
  `id` int NOT NULL AUTO_INCREMENT,
  `mapid` int DEFAULT NULL,
  `type` varchar(40) DEFAULT NULL,
  `geo` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mapid` (`mapid`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.ddt_options
CREATE TABLE IF NOT EXISTS `ddt_options` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tariffname` varchar(40) NOT NULL,
  `period` varchar(10) NOT NULL,
  `startnow` tinyint NOT NULL,
  `duration` int NOT NULL,
  `chargefee` tinyint NOT NULL,
  `chargeuntilday` int DEFAULT NULL,
  `setcredit` tinyint DEFAULT NULL,
  `tariffmove` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.ddt_users
CREATE TABLE IF NOT EXISTS `ddt_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `login` varchar(32) NOT NULL,
  `active` tinyint NOT NULL,
  `startdate` datetime NOT NULL,
  `curtariff` varchar(40) NOT NULL,
  `enddate` date NOT NULL,
  `nexttariff` varchar(40) NOT NULL,
  `dwiid` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.dealwithit
CREATE TABLE IF NOT EXISTS `dealwithit` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `login` varchar(45) NOT NULL,
  `action` varchar(45) NOT NULL,
  `param` varchar(45) DEFAULT NULL,
  `note` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5756 DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.dealwithithist
CREATE TABLE IF NOT EXISTS `dealwithithist` (
  `id` int NOT NULL AUTO_INCREMENT,
  `originalid` int NOT NULL,
  `mtime` datetime NOT NULL,
  `date` date NOT NULL,
  `datetimedone` datetime DEFAULT NULL,
  `login` varchar(45) NOT NULL,
  `action` varchar(45) NOT NULL,
  `param` varchar(45) DEFAULT NULL,
  `note` varchar(45) DEFAULT NULL,
  `admin` varchar(50) DEFAULT NULL,
  `done` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5756 DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.deathtime
CREATE TABLE IF NOT EXISTS `deathtime` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ip` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1435 DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.dhcp
CREATE TABLE IF NOT EXISTS `dhcp` (
  `id` int NOT NULL AUTO_INCREMENT,
  `netid` int NOT NULL,
  `dhcpconfig` text,
  `confname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.directions
CREATE TABLE IF NOT EXISTS `directions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rulenumber` int NOT NULL,
  `rulename` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rulenumber` (`rulenumber`),
  KEY `rulename` (`rulename`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.discounts
CREATE TABLE IF NOT EXISTS `discounts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `login` varchar(64) NOT NULL,
  `percent` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `login` (`login`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.districtdata
CREATE TABLE IF NOT EXISTS `districtdata` (
  `id` int NOT NULL AUTO_INCREMENT,
  `districtid` int NOT NULL,
  `cityid` int DEFAULT NULL,
  `streetid` int DEFAULT NULL,
  `buildid` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.districtnames
CREATE TABLE IF NOT EXISTS `districtnames` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.docxdocuments
CREATE TABLE IF NOT EXISTS `docxdocuments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `login` varchar(255) DEFAULT NULL,
  `public` tinyint DEFAULT NULL,
  `templateid` int DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `public` (`public`),
  KEY `path` (`path`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.docxtemplates
CREATE TABLE IF NOT EXISTS `docxtemplates` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `admin` varchar(255) DEFAULT NULL,
  `public` tinyint DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `path` (`path`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.dreamkas_banksta2_relations
CREATE TABLE IF NOT EXISTS `dreamkas_banksta2_relations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `bs2_rec_id` int NOT NULL,
  `operation_id` varchar(255) NOT NULL,
  `receipt_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bs2_rec_id` (`bs2_rec_id`),
  UNIQUE KEY `operation_id` (`operation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.dreamkas_operations
CREATE TABLE IF NOT EXISTS `dreamkas_operations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `operation_id` varchar(255) NOT NULL,
  `date_create` datetime NOT NULL,
  `date_finish` datetime NOT NULL,
  `date_resend` datetime NOT NULL,
  `status` varchar(255) NOT NULL,
  `error_code` varchar(255) NOT NULL,
  `error_message` varchar(255) NOT NULL,
  `receipt_id` varchar(255) NOT NULL,
  `operation_body` text NOT NULL,
  `repeated_fiscop_id` varchar(255) NOT NULL,
  `repeat_count` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `operation_id` (`operation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.dreamkas_services_relations
CREATE TABLE IF NOT EXISTS `dreamkas_services_relations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `service` varchar(42) NOT NULL,
  `goods_id` varchar(255) NOT NULL,
  `goods_name` varchar(255) NOT NULL,
  `goods_type` varchar(255) NOT NULL,
  `goods_price` double NOT NULL,
  `goods_tax` varchar(255) NOT NULL,
  `goods_vendorcode` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `service` (`service`,`goods_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.dshape_time
CREATE TABLE IF NOT EXISTS `dshape_time` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tariff` varchar(255) NOT NULL,
  `threshold1` time NOT NULL,
  `threshold2` time NOT NULL,
  `speed` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.emails
CREATE TABLE IF NOT EXISTS `emails` (
  `id` int NOT NULL AUTO_INCREMENT,
  `login` varchar(45) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `login` (`login`)
) ENGINE=MyISAM AUTO_INCREMENT=3551 DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.employee
CREATE TABLE IF NOT EXISTS `employee` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `appointment` varchar(255) NOT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  `telegram` varchar(40) DEFAULT NULL,
  `admlogin` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL,
  `tagid` int DEFAULT NULL,
  `amountLimit` varchar(45) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.envydata
CREATE TABLE IF NOT EXISTS `envydata` (
  `id` int NOT NULL AUTO_INCREMENT,
  `switchid` int NOT NULL,
  `date` datetime NOT NULL,
  `config` mediumtext,
  PRIMARY KEY (`id`),
  KEY `switchid` (`switchid`)
) ENGINE=MyISAM AUTO_INCREMENT=448 DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.envydevices
CREATE TABLE IF NOT EXISTS `envydevices` (
  `id` int NOT NULL AUTO_INCREMENT,
  `switchid` int NOT NULL,
  `active` tinyint DEFAULT '1',
  `login` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `enablepassword` varchar(255) DEFAULT NULL,
  `custom1` varchar(255) DEFAULT NULL,
  `cutstart` int DEFAULT NULL,
  `cutend` int DEFAULT NULL,
  `port` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.envyscripts
CREATE TABLE IF NOT EXISTS `envyscripts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `modelid` int NOT NULL,
  `data` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.exhorse
CREATE TABLE IF NOT EXISTS `exhorse` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `u_totalusers` int DEFAULT NULL,
  `u_activeusers` int DEFAULT NULL,
  `u_inactiveusers` int DEFAULT NULL,
  `u_frozenusers` int DEFAULT NULL,
  `u_complextotal` int DEFAULT NULL,
  `u_complexactive` int DEFAULT NULL,
  `u_complexinactive` int DEFAULT NULL,
  `u_signups` int DEFAULT NULL,
  `u_citysignups` text,
  `f_totalmoney` double DEFAULT NULL,
  `f_paymentscount` int DEFAULT NULL,
  `f_cashmoney` double DEFAULT NULL,
  `f_cashcount` int DEFAULT NULL,
  `f_arpu` double DEFAULT NULL,
  `f_arpau` double DEFAULT NULL,
  `c_totalusers` int DEFAULT NULL,
  `c_activeusers` int DEFAULT NULL,
  `c_inactiveusers` int DEFAULT NULL,
  `c_illegal` int DEFAULT NULL,
  `c_complex` int DEFAULT NULL,
  `c_social` int DEFAULT NULL,
  `c_totalmoney` double DEFAULT NULL,
  `c_paymentscount` int DEFAULT NULL,
  `c_arpu` double DEFAULT NULL,
  `c_arpau` double DEFAULT NULL,
  `c_totaldebt` double DEFAULT NULL,
  `c_signups` int DEFAULT NULL,
  `a_totalcalls` int DEFAULT NULL,
  `a_totalanswered` int DEFAULT NULL,
  `a_totalcallsduration` int DEFAULT NULL,
  `a_averagecallduration` int DEFAULT NULL,
  `e_switches` int DEFAULT NULL,
  `e_pononu` int DEFAULT NULL,
  `e_docsis` int DEFAULT NULL,
  `a_recallunsuccess` double DEFAULT NULL,
  `a_recalltrytime` int DEFAULT NULL,
  `e_deadswintervals` int DEFAULT NULL,
  `t_sigreq` int DEFAULT NULL,
  `t_tickets` int DEFAULT NULL,
  `t_tasks` int DEFAULT NULL,
  `t_capabtotal` int DEFAULT NULL,
  `t_capabundone` int DEFAULT NULL,
  `a_outtotalcalls` int DEFAULT NULL,
  `a_outtotalanswered` int DEFAULT NULL,
  `a_outtotalcallsduration` int DEFAULT NULL,
  `a_outaveragecallduration` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1385 DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.extcontras
CREATE TABLE IF NOT EXISTS `extcontras` (
  `id` int NOT NULL AUTO_INCREMENT,
  `contras_id` int NOT NULL,
  `contract_id` int NOT NULL,
  `address_id` int NOT NULL,
  `period_id` int NOT NULL,
  `payday` tinyint DEFAULT NULL,
  `date_create` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `contras_id` (`contras_id`),
  KEY `contract_id` (`contract_id`),
  KEY `address_id` (`address_id`),
  KEY `period_id` (`period_id`),
  KEY `payday` (`payday`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.extcontras_address
CREATE TABLE IF NOT EXISTS `extcontras_address` (
  `id` int NOT NULL AUTO_INCREMENT,
  `address` varchar(255) NOT NULL,
  `summ` double DEFAULT '0',
  `contract_notes` varchar(255) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.extcontras_contracts
CREATE TABLE IF NOT EXISTS `extcontras_contracts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `contract` varchar(150) DEFAULT NULL,
  `date_start` date NOT NULL,
  `date_end` date DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `full_sum` double DEFAULT '0',
  `autoprolong` tinyint DEFAULT '1',
  `notes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contract` (`contract`),
  KEY `date_start` (`date_start`),
  KEY `date_end` (`date_end`),
  KEY `subject` (`subject`),
  KEY `full_sum` (`full_sum`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.extcontras_invoices
CREATE TABLE IF NOT EXISTS `extcontras_invoices` (
  `id` int NOT NULL AUTO_INCREMENT,
  `contras_rec_id` int NOT NULL,
  `internal_number` varchar(150) DEFAULT '',
  `invoice_number` varchar(150) NOT NULL,
  `date` date NOT NULL,
  `summ` double DEFAULT '0',
  `summ_vat` double DEFAULT '0',
  `notes` varchar(250) DEFAULT '',
  `incoming` tinyint(1) DEFAULT '0',
  `outgoing` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `contras_rec_id` (`contras_rec_id`),
  KEY `invoice_number` (`invoice_number`),
  KEY `date` (`date`),
  KEY `summ` (`summ`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.extcontras_missed_payms
CREATE TABLE IF NOT EXISTS `extcontras_missed_payms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `contras_rec_id` int NOT NULL,
  `profile_id` int NOT NULL,
  `contract_id` int DEFAULT NULL,
  `address_id` int DEFAULT NULL,
  `period_id` int NOT NULL,
  `payday` tinyint DEFAULT NULL,
  `date_payment` date NOT NULL,
  `date_expired` datetime NOT NULL,
  `date_payed` datetime DEFAULT NULL,
  `summ_payment` double DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `contras_rec_id` (`contras_rec_id`),
  KEY `profile_id` (`profile_id`),
  KEY `contract_id` (`contract_id`),
  KEY `address_id` (`address_id`),
  KEY `period_id` (`period_id`),
  KEY `date_payment` (`date_payment`),
  KEY `date_payed` (`date_payed`),
  KEY `summ_payment` (`summ_payment`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.extcontras_money
CREATE TABLE IF NOT EXISTS `extcontras_money` (
  `id` int NOT NULL AUTO_INCREMENT,
  `profile_id` int NOT NULL,
  `contract_id` int DEFAULT NULL,
  `address_id` int DEFAULT NULL,
  `accrual_id` int DEFAULT NULL,
  `invoice_id` int DEFAULT NULL,
  `purpose` varchar(255) NOT NULL DEFAULT '',
  `date` datetime NOT NULL,
  `date_edit` datetime NOT NULL,
  `summ_accrual` double DEFAULT '0',
  `summ_payment` double DEFAULT '0',
  `date_payment` date DEFAULT NULL,
  `incoming` tinyint(1) DEFAULT '0',
  `outgoing` tinyint(1) DEFAULT '0',
  `paynotes` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `profile_id` (`profile_id`),
  KEY `contract_id` (`contract_id`),
  KEY `address_id` (`address_id`),
  KEY `accrual_id` (`accrual_id`),
  KEY `purpose` (`purpose`),
  KEY `date` (`date`),
  KEY `date_edit` (`date_edit`),
  KEY `summ_accrual` (`summ_accrual`),
  KEY `summ_payment` (`summ_payment`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.extcontras_periods
CREATE TABLE IF NOT EXISTS `extcontras_periods` (
  `id` int NOT NULL AUTO_INCREMENT,
  `period_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.extcontras_profiles
CREATE TABLE IF NOT EXISTS `extcontras_profiles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `edrpo` varchar(100) DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `edrpo` (`edrpo`),
  KEY `contact` (`contact`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.fdbarchive
CREATE TABLE IF NOT EXISTS `fdbarchive` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `devid` int DEFAULT NULL,
  `devip` varchar(64) DEFAULT NULL,
  `data` longtext,
  `datavlan` longtext,
  `dataportdescr` longtext,
  `pon` tinyint DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `devid` (`devid`,`devip`),
  KEY `pon` (`pon`)
) ENGINE=MyISAM AUTO_INCREMENT=147854 DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.fees
CREATE TABLE IF NOT EXISTS `fees` (
  `id` int NOT NULL AUTO_INCREMENT,
  `hash` varchar(42) NOT NULL,
  `login` varchar(64) NOT NULL,
  `date` datetime NOT NULL,
  `admin` varchar(64) DEFAULT NULL,
  `from` double DEFAULT NULL,
  `to` double DEFAULT NULL,
  `summ` double DEFAULT NULL,
  `note` varchar(200) DEFAULT NULL,
  `cashtype` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `login` (`login`),
  KEY `date` (`date`)
) ENGINE=MyISAM AUTO_INCREMENT=46767 DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.filestorage
CREATE TABLE IF NOT EXISTS `filestorage` (
  `id` int NOT NULL AUTO_INCREMENT,
  `scope` varchar(255) NOT NULL,
  `item` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `admin` varchar(40) NOT NULL,
  `filename` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `scope` (`scope`),
  KEY `item` (`item`),
  KEY `date` (`date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.friendship
CREATE TABLE IF NOT EXISTS `friendship` (
  `id` int NOT NULL AUTO_INCREMENT,
  `friend` varchar(255) NOT NULL,
  `parent` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `friend` (`friend`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.frozen_charge_days
CREATE TABLE IF NOT EXISTS `frozen_charge_days` (
  `id` int NOT NULL AUTO_INCREMENT,
  `login` varchar(255) NOT NULL,
  `freeze_days_amount` smallint NOT NULL DEFAULT '0',
  `freeze_days_used` smallint NOT NULL DEFAULT '0',
  `last_freeze_charge_dt` datetime NOT NULL,
  `work_days_restore` smallint NOT NULL DEFAULT '0',
  `days_worked` smallint NOT NULL DEFAULT '0',
  `last_workdays_upd_dt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.garage_cars
CREATE TABLE IF NOT EXISTS `garage_cars` (
  `id` int NOT NULL AUTO_INCREMENT,
  `vendor` varchar(40) NOT NULL,
  `model` varchar(40) NOT NULL,
  `number` varchar(20) DEFAULT NULL,
  `vin` varchar(40) DEFAULT NULL,
  `year` int DEFAULT NULL,
  `power` int DEFAULT NULL,
  `engine` int DEFAULT NULL,
  `fuelconsumption` double DEFAULT NULL,
  `fueltype` varchar(16) DEFAULT NULL,
  `gastank` int DEFAULT NULL,
  `weight` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.garage_drivers
CREATE TABLE IF NOT EXISTS `garage_drivers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `employeeid` int NOT NULL,
  `carid` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.garage_mapon
CREATE TABLE IF NOT EXISTS `garage_mapon` (
  `id` int NOT NULL AUTO_INCREMENT,
  `carid` int NOT NULL,
  `unitid` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.garage_mileage
CREATE TABLE IF NOT EXISTS `garage_mileage` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `carid` int NOT NULL,
  `mileage` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.genocide
CREATE TABLE IF NOT EXISTS `genocide` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tariff` varchar(255) NOT NULL,
  `speed` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.ins_homereq
CREATE TABLE IF NOT EXISTS `ins_homereq` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `login` varchar(64) DEFAULT NULL,
  `address` varchar(200) NOT NULL,
  `realname` varchar(200) NOT NULL,
  `mobile` varchar(64) NOT NULL,
  `email` varchar(64) NOT NULL,
  `state` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.invoices
CREATE TABLE IF NOT EXISTS `invoices` (
  `id` int NOT NULL AUTO_INCREMENT,
  `login` varchar(50) NOT NULL,
  `invoice_num` varchar(40) NOT NULL DEFAULT '',
  `invoice_date` datetime NOT NULL,
  `invoice_sum` double NOT NULL DEFAULT '0',
  `invoice_body` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `invoice_num` (`invoice_num`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.ipauth_denied
CREATE TABLE IF NOT EXISTS `ipauth_denied` (
  `id` int NOT NULL AUTO_INCREMENT,
  `login` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `login` (`login`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.jobs
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `jobid` int NOT NULL,
  `workerid` int NOT NULL,
  `login` varchar(45) NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3703 DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.jobtypes
CREATE TABLE IF NOT EXISTS `jobtypes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `jobname` varchar(255) NOT NULL,
  `jobcolor` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `jobcolor` (`jobcolor`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.ldap_groups
CREATE TABLE IF NOT EXISTS `ldap_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.ldap_queue
CREATE TABLE IF NOT EXISTS `ldap_queue` (
  `id` int NOT NULL AUTO_INCREMENT,
  `task` varchar(255) NOT NULL,
  `param` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.ldap_users
CREATE TABLE IF NOT EXISTS `ldap_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `login` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `groups` text,
  `changed` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.logs_10_2024
CREATE TABLE IF NOT EXISTS `logs_10_2024` (
  `unid` int unsigned NOT NULL AUTO_INCREMENT,
  `login` varchar(40) DEFAULT NULL,
  `text` text,
  PRIMARY KEY (`unid`)
) ENGINE=MyISAM AUTO_INCREMENT=56032 DEFAULT CHARSET=latin1;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.lousytariffs
CREATE TABLE IF NOT EXISTS `lousytariffs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tariff` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.messages
CREATE TABLE IF NOT EXISTS `messages` (
  `login` varchar(40) DEFAULT '',
  `id` bigint DEFAULT NULL,
  `type` int DEFAULT NULL,
  `lastSendTime` int DEFAULT NULL,
  `creationTime` int DEFAULT NULL,
  `showTime` int DEFAULT NULL,
  `stgRepeat` int DEFAULT NULL,
  `repeatPeriod` int DEFAULT NULL,
  `text` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.mg_credentials
CREATE TABLE IF NOT EXISTS `mg_credentials` (
  `id` int NOT NULL AUTO_INCREMENT,
  `isdn` varchar(255) NOT NULL,
  `login` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.mg_history
CREATE TABLE IF NOT EXISTS `mg_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `login` varchar(255) NOT NULL,
  `tariffid` int NOT NULL,
  `actdate` datetime NOT NULL,
  `freeperiod` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.mg_queue
CREATE TABLE IF NOT EXISTS `mg_queue` (
  `id` int NOT NULL AUTO_INCREMENT,
  `login` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `action` varchar(45) NOT NULL,
  `tariffid` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.mg_subscribers
CREATE TABLE IF NOT EXISTS `mg_subscribers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `login` varchar(255) NOT NULL,
  `tariffid` int NOT NULL,
  `actdate` datetime NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `primary` tinyint(1) NOT NULL DEFAULT '0',
  `freeperiod` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.mg_tariffs
CREATE TABLE IF NOT EXISTS `mg_tariffs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `fee` double DEFAULT NULL,
  `serviceid` varchar(45) DEFAULT NULL,
  `primary` tinyint(1) NOT NULL DEFAULT '0',
  `freeperiod` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.mlg_clients
CREATE TABLE IF NOT EXISTS `mlg_clients` (
  `nasname` tinyint NOT NULL,
  `shortname` tinyint NOT NULL,
  `type` tinyint NOT NULL,
  `ports` tinyint NOT NULL,
  `secret` tinyint NOT NULL,
  `server` tinyint NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf16;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.mlg_culpas
CREATE TABLE IF NOT EXISTS `mlg_culpas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `login` varchar(64) NOT NULL,
  `culpa` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `login` (`login`),
  KEY `culpa` (`culpa`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.mlg_ishimura
CREATE TABLE IF NOT EXISTS `mlg_ishimura` (
  `login` varchar(50) DEFAULT NULL,
  `month` tinyint DEFAULT NULL,
  `year` smallint DEFAULT NULL,
  `U0` bigint DEFAULT NULL,
  `D0` bigint DEFAULT NULL,
  `cash` double DEFAULT NULL,
  KEY `login` (`login`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.mlg_nascustom
CREATE TABLE IF NOT EXISTS `mlg_nascustom` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ip` varchar(32) NOT NULL,
  `name` varchar(64) NOT NULL,
  `secret` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.mobileext
CREATE TABLE IF NOT EXISTS `mobileext` (
  `id` int NOT NULL AUTO_INCREMENT,
  `login` varchar(64) NOT NULL,
  `mobile` varchar(64) NOT NULL,
  `notes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `login` (`login`,`mobile`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.modems
CREATE TABLE IF NOT EXISTS `modems` (
  `id` int NOT NULL AUTO_INCREMENT,
  `maclan` varchar(255) NOT NULL,
  `macusb` varchar(255) NOT NULL,
  `date` date DEFAULT NULL,
  `ip` varchar(25) NOT NULL,
  `conftemplate` varchar(20) NOT NULL,
  `userbind` varchar(100) DEFAULT NULL,
  `nic` varchar(100) NOT NULL,
  `note` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.modem_templates
CREATE TABLE IF NOT EXISTS `modem_templates` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `body` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.mtnasifaces
CREATE TABLE IF NOT EXISTS `mtnasifaces` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nasid` int NOT NULL,
  `iface` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.nas
CREATE TABLE IF NOT EXISTS `nas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `netid` int NOT NULL,
  `nasip` varchar(255) NOT NULL,
  `nasname` varchar(255) NOT NULL,
  `nastype` varchar(45) DEFAULT NULL,
  `bandw` varchar(255) DEFAULT NULL,
  `options` text,
  PRIMARY KEY (`id`),
  KEY `netid` (`netid`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.nastemplates
CREATE TABLE IF NOT EXISTS `nastemplates` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nasid` int NOT NULL,
  `template` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.netextips
CREATE TABLE IF NOT EXISTS `netextips` (
  `id` int NOT NULL AUTO_INCREMENT,
  `poolid` int NOT NULL,
  `ip` varchar(40) NOT NULL,
  `nas` varchar(255) DEFAULT NULL,
  `iface` varchar(40) DEFAULT NULL,
  `mac` varchar(40) DEFAULT NULL,
  `switchid` int DEFAULT NULL,
  `port` varchar(40) DEFAULT NULL,
  `vlan` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.netextpools
CREATE TABLE IF NOT EXISTS `netextpools` (
  `id` int NOT NULL AUTO_INCREMENT,
  `netid` int NOT NULL,
  `pool` varchar(255) NOT NULL,
  `netmask` varchar(255) NOT NULL,
  `gw` varchar(255) DEFAULT NULL,
  `clientip` varchar(255) DEFAULT NULL,
  `broadcast` varchar(255) DEFAULT NULL,
  `vlan` varchar(255) DEFAULT NULL,
  `login` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.nethosts
CREATE TABLE IF NOT EXISTS `nethosts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `netid` int NOT NULL,
  `ip` varchar(45) NOT NULL,
  `mac` varchar(45) DEFAULT NULL,
  `option` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `net-ip` (`netid`,`ip`),
  KEY `netid` (`netid`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM AUTO_INCREMENT=4090 DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.networks
CREATE TABLE IF NOT EXISTS `networks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `startip` varchar(45) NOT NULL,
  `endip` varchar(45) NOT NULL,
  `desc` varchar(45) NOT NULL,
  `nettype` varchar(20) NOT NULL,
  `use_radius` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.notes
CREATE TABLE IF NOT EXISTS `notes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `login` varchar(255) NOT NULL,
  `note` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `login` (`login`)
) ENGINE=MyISAM AUTO_INCREMENT=1275 DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.olt_qinq
CREATE TABLE IF NOT EXISTS `olt_qinq` (
  `id` int NOT NULL AUTO_INCREMENT,
  `swid` int NOT NULL,
  `port` int NOT NULL,
  `svlan_id` int NOT NULL,
  `cvlan` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `svlan_id` (`svlan_id`),
  KEY `cvlan` (`cvlan`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.om_queue
CREATE TABLE IF NOT EXISTS `om_queue` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customerid` bigint NOT NULL,
  `tariffid` int DEFAULT NULL,
  `action` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.om_suspend
CREATE TABLE IF NOT EXISTS `om_suspend` (
  `id` int NOT NULL AUTO_INCREMENT,
  `login` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.om_tariffs
CREATE TABLE IF NOT EXISTS `om_tariffs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tariffid` int NOT NULL,
  `tariffname` varchar(255) NOT NULL,
  `type` varchar(64) NOT NULL,
  `fee` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.om_users
CREATE TABLE IF NOT EXISTS `om_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `login` varchar(255) NOT NULL,
  `customerid` bigint NOT NULL,
  `basetariffid` int DEFAULT NULL,
  `bundletariffs` varchar(255) DEFAULT NULL,
  `active` int DEFAULT NULL,
  `actdate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.ophtraff
CREATE TABLE IF NOT EXISTS `ophtraff` (
  `id` int NOT NULL AUTO_INCREMENT,
  `login` varchar(50) NOT NULL,
  `month` tinyint NOT NULL,
  `year` smallint NOT NULL,
  `U0` bigint DEFAULT NULL,
  `D0` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `login` (`login`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.op_customers
CREATE TABLE IF NOT EXISTS `op_customers` (
  `realid` tinyint NOT NULL,
  `virtualid` tinyint NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf16;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.op_customers2
CREATE TABLE IF NOT EXISTS `op_customers2` (
  `realid` tinyint NOT NULL,
  `virtualid` tinyint NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf16;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.op_denied
CREATE TABLE IF NOT EXISTS `op_denied` (
  `id` int NOT NULL AUTO_INCREMENT,
  `login` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `login` (`login`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.op_sms_notifications
CREATE TABLE IF NOT EXISTS `op_sms_notifications` (
  `id` int NOT NULL AUTO_INCREMENT,
  `payment_id` int NOT NULL,
  `date` datetime NOT NULL,
  `login` varchar(255) NOT NULL,
  `balance` double NOT NULL DEFAULT '0',
  `summ` double NOT NULL DEFAULT '0',
  `processed` tinyint unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `payment_id` (`payment_id`),
  KEY `login` (`login`),
  KEY `date` (`date`),
  KEY `summ` (`summ`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.op_static
CREATE TABLE IF NOT EXISTS `op_static` (
  `id` int NOT NULL AUTO_INCREMENT,
  `realid` varchar(255) NOT NULL,
  `virtualid` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `realid` (`realid`),
  KEY `virtualid` (`virtualid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.op_transactions
CREATE TABLE IF NOT EXISTS `op_transactions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `hash` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `summ` double NOT NULL,
  `customerid` varchar(255) NOT NULL,
  `paysys` varchar(255) NOT NULL,
  `processed` tinyint(1) NOT NULL,
  `note` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hash` (`hash`)
) ENGINE=MyISAM AUTO_INCREMENT=16767 DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.ot_tariffs
CREATE TABLE IF NOT EXISTS `ot_tariffs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `alias` varchar(128) NOT NULL,
  `fee` double NOT NULL,
  `period` varchar(8) DEFAULT NULL,
  `percent` double DEFAULT NULL,
  `main` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.ot_users
CREATE TABLE IF NOT EXISTS `ot_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `remoteid` int NOT NULL,
  `login` varchar(64) NOT NULL,
  `email` varchar(64) DEFAULT NULL,
  `phone` varchar(32) DEFAULT NULL,
  `code` varchar(64) DEFAULT NULL,
  `tariffid` int DEFAULT NULL,
  `addtariffid` int DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `login` (`login`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.passportdata
CREATE TABLE IF NOT EXISTS `passportdata` (
  `id` int NOT NULL AUTO_INCREMENT,
  `login` varchar(255) NOT NULL,
  `birthdate` date DEFAULT NULL,
  `passportnum` varchar(255) DEFAULT NULL,
  `passportdate` date DEFAULT NULL,
  `passportwho` varchar(255) DEFAULT NULL,
  `pcity` varchar(255) DEFAULT NULL,
  `pstreet` varchar(255) DEFAULT NULL,
  `pbuild` varchar(10) DEFAULT NULL,
  `papt` varchar(10) DEFAULT NULL,
  `pinn` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `login` (`login`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.payments
CREATE TABLE IF NOT EXISTS `payments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `login` varchar(45) NOT NULL,
  `date` datetime NOT NULL,
  `admin` varchar(255) DEFAULT NULL,
  `balance` varchar(45) NOT NULL,
  `summ` varchar(45) NOT NULL,
  `cashtypeid` int NOT NULL,
  `note` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `login` (`login`),
  KEY `date` (`date`)
) ENGINE=MyISAM AUTO_INCREMENT=104873 DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.paymentscorr
CREATE TABLE IF NOT EXISTS `paymentscorr` (
  `id` int NOT NULL AUTO_INCREMENT,
  `login` varchar(45) NOT NULL,
  `date` datetime NOT NULL,
  `admin` varchar(255) DEFAULT NULL,
  `balance` varchar(45) NOT NULL,
  `summ` varchar(45) NOT NULL,
  `cashtypeid` int NOT NULL,
  `note` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `login` (`login`),
  KEY `date` (`date`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.paymeuz_transactions
CREATE TABLE IF NOT EXISTS `paymeuz_transactions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_create` datetime NOT NULL,
  `transact_id` varchar(255) NOT NULL,
  `op_transact_id` varchar(255) NOT NULL,
  `op_customer_id` varchar(255) NOT NULL,
  `amount` double NOT NULL DEFAULT '0',
  `state` tinyint NOT NULL DEFAULT '0',
  `payme_transact_timestamp` bigint unsigned NOT NULL DEFAULT '0',
  `create_timestamp` bigint unsigned NOT NULL DEFAULT '0',
  `perform_timestamp` bigint unsigned NOT NULL DEFAULT '0',
  `cancel_timestamp` bigint unsigned NOT NULL DEFAULT '0',
  `cancel_reason` varchar(255) NOT NULL DEFAULT '',
  `receivers` text,
  PRIMARY KEY (`id`),
  KEY `date_create` (`date_create`),
  KEY `transact_id` (`transact_id`),
  KEY `op_transact_id` (`op_transact_id`),
  KEY `op_customer_id` (`op_customer_id`),
  KEY `payme_transact_timestamp` (`payme_transact_timestamp`),
  KEY `create_timestamp` (`create_timestamp`),
  KEY `perform_timestamp` (`perform_timestamp`),
  KEY `cancel_timestamp` (`cancel_timestamp`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.phones
CREATE TABLE IF NOT EXISTS `phones` (
  `id` int NOT NULL AUTO_INCREMENT,
  `login` varchar(45) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `phone` (`phone`),
  KEY `mobile` (`mobile`),
  KEY `login` (`login`),
  KEY `login_2` (`login`)
) ENGINE=MyISAM AUTO_INCREMENT=3551 DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.photostorage
CREATE TABLE IF NOT EXISTS `photostorage` (
  `id` int NOT NULL AUTO_INCREMENT,
  `scope` varchar(255) NOT NULL,
  `item` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `admin` varchar(40) NOT NULL,
  `filename` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `scope` (`scope`),
  KEY `item` (`item`),
  KEY `date` (`date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.policedog
CREATE TABLE IF NOT EXISTS `policedog` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `mac` varchar(40) NOT NULL,
  `notes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `date` (`date`,`mac`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.policedogalerts
CREATE TABLE IF NOT EXISTS `policedogalerts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `mac` varchar(40) NOT NULL,
  `login` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `date` (`date`,`mac`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.polls
CREATE TABLE IF NOT EXISTS `polls` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `start_date` datetime NOT NULL,
  `end_date` datetime DEFAULT NULL,
  `params` text NOT NULL,
  `admin` varchar(255) NOT NULL DEFAULT '',
  `voting` varchar(255) NOT NULL DEFAULT 'Users',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.polls_options
CREATE TABLE IF NOT EXISTS `polls_options` (
  `id` int NOT NULL AUTO_INCREMENT,
  `poll_id` int NOT NULL DEFAULT '0',
  `text` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `poll_id` (`id`,`poll_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.polls_votes
CREATE TABLE IF NOT EXISTS `polls_votes` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `option_id` int NOT NULL DEFAULT '0',
  `poll_id` int NOT NULL DEFAULT '0',
  `login` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_poll` (`poll_id`,`login`) USING BTREE,
  UNIQUE KEY `login_poll_option` (`option_id`,`poll_id`,`login`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.ponboxes
CREATE TABLE IF NOT EXISTS `ponboxes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `geo` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.ponboxeslinks
CREATE TABLE IF NOT EXISTS `ponboxeslinks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `boxid` int NOT NULL,
  `login` varchar(64) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `onuid` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.ponifdesc
CREATE TABLE IF NOT EXISTS `ponifdesc` (
  `id` int NOT NULL AUTO_INCREMENT,
  `oltid` int NOT NULL,
  `iface` varchar(64) DEFAULT NULL,
  `desc` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oltid` (`oltid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.pononu
CREATE TABLE IF NOT EXISTS `pononu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `onumodelid` int DEFAULT NULL,
  `oltid` int DEFAULT NULL,
  `ip` varchar(20) DEFAULT NULL,
  `mac` varchar(20) DEFAULT NULL,
  `serial` varchar(255) DEFAULT NULL,
  `login` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `login` (`login`)
) ENGINE=MyISAM AUTO_INCREMENT=113 DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.pononuextusers
CREATE TABLE IF NOT EXISTS `pononuextusers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `onuid` int NOT NULL,
  `login` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.print_card
CREATE TABLE IF NOT EXISTS `print_card` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `field` varchar(255) NOT NULL,
  `color` varchar(255) DEFAULT '',
  `font_size` int DEFAULT NULL,
  `top` int DEFAULT NULL,
  `left` int DEFAULT NULL,
  `text` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`),
  UNIQUE KEY `title_2` (`title`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.ptv_subscribers
CREATE TABLE IF NOT EXISTS `ptv_subscribers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `subscriberid` int NOT NULL,
  `login` varchar(64) NOT NULL,
  `maintariff` int DEFAULT NULL,
  `addtariffs` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.ptv_tariffs
CREATE TABLE IF NOT EXISTS `ptv_tariffs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `serviceid` int NOT NULL,
  `main` tinyint(1) NOT NULL,
  `name` varchar(64) NOT NULL,
  `chans` varchar(42) DEFAULT NULL,
  `fee` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.pt_log
CREATE TABLE IF NOT EXISTS `pt_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `login` varchar(64) NOT NULL,
  `tariff` varchar(40) NOT NULL,
  `day` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.pt_tariffs
CREATE TABLE IF NOT EXISTS `pt_tariffs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tariff` varchar(40) NOT NULL,
  `fee` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.pt_users
CREATE TABLE IF NOT EXISTS `pt_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `login` varchar(64) NOT NULL,
  `day` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.punchscripts
CREATE TABLE IF NOT EXISTS `punchscripts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `alias` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content` text,
  PRIMARY KEY (`id`),
  KEY `alias` (`alias`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.qinq_bindings
CREATE TABLE IF NOT EXISTS `qinq_bindings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `login` varchar(45) DEFAULT NULL,
  `svlan_id` int NOT NULL,
  `cvlan` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.qinq_svlan
CREATE TABLE IF NOT EXISTS `qinq_svlan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `realm_id` int NOT NULL,
  `svlan` int NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `realm_id` (`realm_id`),
  KEY `svlan` (`svlan`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.radattr
CREATE TABLE IF NOT EXISTS `radattr` (
  `id` int NOT NULL AUTO_INCREMENT,
  `login` varchar(255) NOT NULL,
  `attr` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.realms
CREATE TABLE IF NOT EXISTS `realms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `realm` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `realm` (`realm`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.realname
CREATE TABLE IF NOT EXISTS `realname` (
  `id` int NOT NULL AUTO_INCREMENT,
  `login` varchar(45) DEFAULT NULL,
  `realname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `login` (`login`),
  KEY `realname` (`realname`)
) ENGINE=MyISAM AUTO_INCREMENT=3552 DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.salary_jobprices
CREATE TABLE IF NOT EXISTS `salary_jobprices` (
  `id` int NOT NULL AUTO_INCREMENT,
  `jobtypeid` int NOT NULL,
  `price` double NOT NULL,
  `unit` varchar(255) NOT NULL,
  `time` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.salary_jobs
CREATE TABLE IF NOT EXISTS `salary_jobs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `taskid` int DEFAULT NULL,
  `employeeid` int NOT NULL,
  `jobtypeid` int NOT NULL,
  `factor` double DEFAULT NULL,
  `overprice` double DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `taskid` (`taskid`),
  KEY `taskid_2` (`taskid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.salary_paid
CREATE TABLE IF NOT EXISTS `salary_paid` (
  `id` int NOT NULL AUTO_INCREMENT,
  `jobid` int NOT NULL,
  `employeeid` int NOT NULL,
  `paid` double DEFAULT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.salary_timesheets
CREATE TABLE IF NOT EXISTS `salary_timesheets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `employeeid` int NOT NULL,
  `hours` int NOT NULL DEFAULT '0',
  `holiday` tinyint(1) NOT NULL DEFAULT '0',
  `hospital` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.salary_wages
CREATE TABLE IF NOT EXISTS `salary_wages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `employeeid` int NOT NULL,
  `wage` double NOT NULL,
  `bounty` double NOT NULL,
  `worktime` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.selling
CREATE TABLE IF NOT EXISTS `selling` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `geo` varchar(255) DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `count_cards` int DEFAULT NULL,
  `comment` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.services
CREATE TABLE IF NOT EXISTS `services` (
  `id` int NOT NULL AUTO_INCREMENT,
  `netid` int NOT NULL,
  `desc` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `netid` (`netid`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.servtariff
CREATE TABLE IF NOT EXISTS `servtariff` (
  `id` int NOT NULL AUTO_INCREMENT,
  `serviceid` int NOT NULL,
  `tariffs` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.signup_prices_tariffs
CREATE TABLE IF NOT EXISTS `signup_prices_tariffs` (
  `tariff` varchar(40) NOT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`tariff`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.signup_prices_users
CREATE TABLE IF NOT EXISTS `signup_prices_users` (
  `login` varchar(50) NOT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`login`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.sigreq
CREATE TABLE IF NOT EXISTS `sigreq` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `state` tinyint NOT NULL,
  `ip` varchar(40) NOT NULL,
  `street` varchar(255) NOT NULL,
  `build` varchar(40) NOT NULL,
  `apt` varchar(40) NOT NULL,
  `realname` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `service` varchar(255) NOT NULL,
  `notes` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.sigreqconf
CREATE TABLE IF NOT EXISTS `sigreqconf` (
  `id` int NOT NULL AUTO_INCREMENT,
  `key` varchar(255) DEFAULT NULL,
  `value` text,
  PRIMARY KEY (`id`),
  KEY `key` (`key`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.sms_history
CREATE TABLE IF NOT EXISTS `sms_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `smssrvid` int NOT NULL DEFAULT '0',
  `login` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `srvmsgself_id` varchar(255) NOT NULL,
  `srvmsgpack_id` varchar(255) NOT NULL,
  `date_send` datetime NOT NULL,
  `date_statuschk` datetime NOT NULL,
  `delivered` tinyint unsigned DEFAULT '0',
  `no_statuschk` tinyint unsigned DEFAULT '0',
  `send_status` varchar(255) NOT NULL DEFAULT '',
  `msg_text` varchar(500) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `login` (`login`) USING BTREE,
  KEY `phone` (`phone`) USING BTREE,
  KEY `date_send` (`date_send`) USING BTREE,
  KEY `smssrvid` (`smssrvid`),
  KEY `smssrvid_2` (`smssrvid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.sms_services
CREATE TABLE IF NOT EXISTS `sms_services` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `login` varchar(255) NOT NULL,
  `passwd` varchar(255) NOT NULL,
  `url_addr` varchar(255) NOT NULL,
  `api_key` varchar(255) NOT NULL,
  `alpha_name` varchar(40) NOT NULL,
  `default_service` tinyint unsigned DEFAULT '0',
  `api_file_name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.sms_services_relations
CREATE TABLE IF NOT EXISTS `sms_services_relations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sms_srv_id` int NOT NULL,
  `user_login` varchar(255) DEFAULT NULL,
  `employee_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_login` (`user_login`),
  UNIQUE KEY `employee_id` (`employee_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.smz_excl
CREATE TABLE IF NOT EXISTS `smz_excl` (
  `id` int NOT NULL AUTO_INCREMENT,
  `mobile` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.smz_filters
CREATE TABLE IF NOT EXISTS `smz_filters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `filters` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.smz_lists
CREATE TABLE IF NOT EXISTS `smz_lists` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.smz_nums
CREATE TABLE IF NOT EXISTS `smz_nums` (
  `id` int NOT NULL AUTO_INCREMENT,
  `numid` int NOT NULL,
  `mobile` varchar(40) NOT NULL,
  `notes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.smz_templates
CREATE TABLE IF NOT EXISTS `smz_templates` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `text` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.speeds
CREATE TABLE IF NOT EXISTS `speeds` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tariff` varchar(45) DEFAULT NULL,
  `speeddown` varchar(45) DEFAULT NULL,
  `speedup` varchar(45) DEFAULT NULL,
  `burstdownload` varchar(45) DEFAULT NULL,
  `burstupload` varchar(45) DEFAULT NULL,
  `bursttimedownload` varchar(45) DEFAULT NULL,
  `burstimetupload` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tariff` (`tariff`),
  KEY `speeddown` (`speeddown`),
  KEY `speedup` (`speedup`)
) ENGINE=MyISAM AUTO_INCREMENT=597 DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.stat
CREATE TABLE IF NOT EXISTS `stat` (
  `login` varchar(50) DEFAULT NULL,
  `month` tinyint DEFAULT NULL,
  `year` smallint DEFAULT NULL,
  `U0` bigint DEFAULT NULL,
  `D0` bigint DEFAULT NULL,
  `U1` bigint DEFAULT NULL,
  `D1` bigint DEFAULT NULL,
  `U2` bigint DEFAULT NULL,
  `D2` bigint DEFAULT NULL,
  `U3` bigint DEFAULT NULL,
  `D3` bigint DEFAULT NULL,
  `U4` bigint DEFAULT NULL,
  `D4` bigint DEFAULT NULL,
  `U5` bigint DEFAULT NULL,
  `D5` bigint DEFAULT NULL,
  `U6` bigint DEFAULT NULL,
  `D6` bigint DEFAULT NULL,
  `U7` bigint DEFAULT NULL,
  `D7` bigint DEFAULT NULL,
  `U8` bigint DEFAULT NULL,
  `D8` bigint DEFAULT NULL,
  `U9` bigint DEFAULT NULL,
  `D9` bigint DEFAULT NULL,
  `cash` double DEFAULT NULL,
  KEY `login` (`login`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.stealthtariffs
CREATE TABLE IF NOT EXISTS `stealthtariffs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tariff` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.stickynotes
CREATE TABLE IF NOT EXISTS `stickynotes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `owner` varchar(255) NOT NULL,
  `createdate` datetime NOT NULL,
  `reminddate` date DEFAULT NULL,
  `remindtime` time DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `text` text,
  PRIMARY KEY (`id`),
  KEY `owner` (`owner`),
  KEY `reminddate` (`reminddate`),
  KEY `active` (`active`),
  KEY `remindtime` (`remindtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.stickyrevelations
CREATE TABLE IF NOT EXISTS `stickyrevelations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `owner` varchar(255) NOT NULL,
  `showto` text,
  `createdate` datetime NOT NULL,
  `dayfrom` int DEFAULT NULL,
  `dayto` int DEFAULT NULL,
  `dayweek` int DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `text` text,
  PRIMARY KEY (`id`),
  KEY `owner` (`owner`),
  KEY `dayfrom` (`dayfrom`),
  KEY `dayto` (`dayto`),
  KEY `active` (`active`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.stigma
CREATE TABLE IF NOT EXISTS `stigma` (
  `id` int NOT NULL AUTO_INCREMENT,
  `scope` varchar(64) DEFAULT NULL,
  `itemid` varchar(128) NOT NULL,
  `state` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `admin` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `scope` (`scope`),
  KEY `itemid` (`itemid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.street
CREATE TABLE IF NOT EXISTS `street` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cityid` int NOT NULL,
  `streetname` varchar(255) NOT NULL,
  `streetalias` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cityid` (`cityid`),
  KEY `streetname` (`streetname`)
) ENGINE=MyISAM AUTO_INCREMENT=193 DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.swcash
CREATE TABLE IF NOT EXISTS `swcash` (
  `id` int NOT NULL AUTO_INCREMENT,
  `switchid` int NOT NULL,
  `placecontract` varchar(200) DEFAULT NULL,
  `placeprice` double NOT NULL DEFAULT '0',
  `powercontract` varchar(200) DEFAULT NULL,
  `powerprice` double NOT NULL DEFAULT '0',
  `transportcontract` varchar(200) DEFAULT NULL,
  `transportprice` double NOT NULL DEFAULT '0',
  `switchprice` double NOT NULL DEFAULT '0',
  `switchdate` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `switchid` (`switchid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.switchdeadlog
CREATE TABLE IF NOT EXISTS `switchdeadlog` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `timestamp` int NOT NULL,
  `swdead` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `date` (`date`,`timestamp`)
) ENGINE=MyISAM AUTO_INCREMENT=16907 DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.switches
CREATE TABLE IF NOT EXISTS `switches` (
  `id` int NOT NULL AUTO_INCREMENT,
  `modelid` int NOT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `desc` varchar(255) NOT NULL,
  `location` varchar(255) DEFAULT NULL,
  `snmp` varchar(45) DEFAULT NULL,
  `geo` varchar(255) DEFAULT NULL,
  `parentid` int DEFAULT NULL,
  `swid` varchar(32) DEFAULT NULL,
  `snmpwrite` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parentid` (`parentid`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.switches_qinq
CREATE TABLE IF NOT EXISTS `switches_qinq` (
  `switchid` int NOT NULL,
  `svlan_id` int NOT NULL,
  `cvlan` int NOT NULL,
  PRIMARY KEY (`switchid`),
  KEY `svlan_id` (`svlan_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.switchmodels
CREATE TABLE IF NOT EXISTS `switchmodels` (
  `id` int NOT NULL AUTO_INCREMENT,
  `modelname` varchar(255) NOT NULL,
  `ports` int DEFAULT NULL,
  `snmptemplate` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.switchportassign
CREATE TABLE IF NOT EXISTS `switchportassign` (
  `id` int NOT NULL AUTO_INCREMENT,
  `login` varchar(255) NOT NULL,
  `switchid` int NOT NULL,
  `port` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.switchuplinks
CREATE TABLE IF NOT EXISTS `switchuplinks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `switchid` int NOT NULL,
  `media` varchar(10) DEFAULT NULL,
  `port` int DEFAULT NULL,
  `speed` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `switchid` (`switchid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.switch_groups
CREATE TABLE IF NOT EXISTS `switch_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupname` varchar(255) NOT NULL,
  `groupdescr` varchar(500) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `groupname` (`groupname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.switch_groups_relations
CREATE TABLE IF NOT EXISTS `switch_groups_relations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `switch_id` int NOT NULL,
  `sw_group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `switch_id` (`switch_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.switch_login
CREATE TABLE IF NOT EXISTS `switch_login` (
  `id` int NOT NULL AUTO_INCREMENT,
  `swid` int DEFAULT NULL,
  `swlogin` varchar(50) DEFAULT NULL,
  `swpass` varchar(50) DEFAULT NULL,
  `method` varchar(10) DEFAULT NULL,
  `community` varchar(50) DEFAULT NULL,
  `enable` varchar(3) DEFAULT NULL,
  `snmptemplate` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.tags
CREATE TABLE IF NOT EXISTS `tags` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tagid` int NOT NULL,
  `login` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.tagtypes
CREATE TABLE IF NOT EXISTS `tagtypes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tagname` varchar(255) NOT NULL,
  `tagcolor` varchar(15) NOT NULL,
  `tagsize` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.tariffs
CREATE TABLE IF NOT EXISTS `tariffs` (
  `name` varchar(40) NOT NULL DEFAULT '',
  `PriceDayA0` double DEFAULT '0',
  `PriceDayB0` double DEFAULT '0',
  `PriceNightA0` double DEFAULT '0',
  `PriceNightB0` double DEFAULT '0',
  `Threshold0` int DEFAULT '0',
  `Time0` varchar(15) DEFAULT '0:0-0:0',
  `NoDiscount0` int DEFAULT '0',
  `SinglePrice0` int DEFAULT '0',
  `PriceDayA1` double DEFAULT '0',
  `PriceDayB1` double DEFAULT '0',
  `PriceNightA1` double DEFAULT '0',
  `PriceNightB1` double DEFAULT '0',
  `Threshold1` int DEFAULT '0',
  `Time1` varchar(15) DEFAULT '0:0-0:0',
  `NoDiscount1` int DEFAULT '0',
  `SinglePrice1` int DEFAULT '0',
  `PriceDayA2` double DEFAULT '0',
  `PriceDayB2` double DEFAULT '0',
  `PriceNightA2` double DEFAULT '0',
  `PriceNightB2` double DEFAULT '0',
  `Threshold2` int DEFAULT '0',
  `Time2` varchar(15) DEFAULT '0:0-0:0',
  `NoDiscount2` int DEFAULT '0',
  `SinglePrice2` int DEFAULT '0',
  `PriceDayA3` double DEFAULT '0',
  `PriceDayB3` double DEFAULT '0',
  `PriceNightA3` double DEFAULT '0',
  `PriceNightB3` double DEFAULT '0',
  `Threshold3` int DEFAULT '0',
  `Time3` varchar(15) DEFAULT '0:0-0:0',
  `NoDiscount3` int DEFAULT '0',
  `SinglePrice3` int DEFAULT '0',
  `PriceDayA4` double DEFAULT '0',
  `PriceDayB4` double DEFAULT '0',
  `PriceNightA4` double DEFAULT '0',
  `PriceNightB4` double DEFAULT '0',
  `Threshold4` int DEFAULT '0',
  `Time4` varchar(15) DEFAULT '0:0-0:0',
  `NoDiscount4` int DEFAULT '0',
  `SinglePrice4` int DEFAULT '0',
  `PriceDayA5` double DEFAULT '0',
  `PriceDayB5` double DEFAULT '0',
  `PriceNightA5` double DEFAULT '0',
  `PriceNightB5` double DEFAULT '0',
  `Threshold5` int DEFAULT '0',
  `Time5` varchar(15) DEFAULT '0:0-0:0',
  `NoDiscount5` int DEFAULT '0',
  `SinglePrice5` int DEFAULT '0',
  `PriceDayA6` double DEFAULT '0',
  `PriceDayB6` double DEFAULT '0',
  `PriceNightA6` double DEFAULT '0',
  `PriceNightB6` double DEFAULT '0',
  `Threshold6` int DEFAULT '0',
  `Time6` varchar(15) DEFAULT '0:0-0:0',
  `NoDiscount6` int DEFAULT '0',
  `SinglePrice6` int DEFAULT '0',
  `PriceDayA7` double DEFAULT '0',
  `PriceDayB7` double DEFAULT '0',
  `PriceNightA7` double DEFAULT '0',
  `PriceNightB7` double DEFAULT '0',
  `Threshold7` int DEFAULT '0',
  `Time7` varchar(15) DEFAULT '0:0-0:0',
  `NoDiscount7` int DEFAULT '0',
  `SinglePrice7` int DEFAULT '0',
  `PriceDayA8` double DEFAULT '0',
  `PriceDayB8` double DEFAULT '0',
  `PriceNightA8` double DEFAULT '0',
  `PriceNightB8` double DEFAULT '0',
  `Threshold8` int DEFAULT '0',
  `Time8` varchar(15) DEFAULT '0:0-0:0',
  `NoDiscount8` int DEFAULT '0',
  `SinglePrice8` int DEFAULT '0',
  `PriceDayA9` double DEFAULT '0',
  `PriceDayB9` double DEFAULT '0',
  `PriceNightA9` double DEFAULT '0',
  `PriceNightB9` double DEFAULT '0',
  `Threshold9` int DEFAULT '0',
  `Time9` varchar(15) DEFAULT '0:0-0:0',
  `NoDiscount9` int DEFAULT '0',
  `SinglePrice9` int DEFAULT '0',
  `PassiveCost` double DEFAULT '0',
  `Fee` double DEFAULT '0',
  `Free` double DEFAULT '0',
  `TraffType` varchar(10) DEFAULT '',
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.taskman
CREATE TABLE IF NOT EXISTS `taskman` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `address` varchar(255) NOT NULL,
  `login` varchar(255) DEFAULT NULL,
  `jobtype` int NOT NULL,
  `jobnote` text,
  `phone` varchar(255) DEFAULT NULL,
  `employee` int NOT NULL,
  `employeedone` int DEFAULT NULL,
  `donenote` text,
  `startdate` date NOT NULL,
  `starttime` time DEFAULT NULL,
  `enddate` date DEFAULT NULL,
  `admin` varchar(255) DEFAULT NULL,
  `status` int NOT NULL,
  `smsdata` text,
  `change_admin` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `status` (`status`),
  KEY `login` (`login`),
  KEY `starttime` (`starttime`),
  KEY `address` (`address`),
  KEY `startdate` (`startdate`)
) ENGINE=MyISAM AUTO_INCREMENT=8327 DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.taskmandone
CREATE TABLE IF NOT EXISTS `taskmandone` (
  `id` int NOT NULL AUTO_INCREMENT,
  `taskid` int DEFAULT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3483 DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.taskmanlogs
CREATE TABLE IF NOT EXISTS `taskmanlogs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `taskid` int NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `admin` varchar(45) DEFAULT NULL,
  `ip` varchar(64) DEFAULT NULL,
  `event` varchar(255) NOT NULL,
  `logs` text,
  PRIMARY KEY (`id`),
  KEY `taskid` (`taskid`) USING BTREE,
  KEY `date` (`date`)
) ENGINE=MyISAM AUTO_INCREMENT=12558 DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.taskmantrack
CREATE TABLE IF NOT EXISTS `taskmantrack` (
  `id` int NOT NULL AUTO_INCREMENT,
  `taskid` int NOT NULL,
  `admin` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `taskid` (`taskid`,`admin`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.taskstates
CREATE TABLE IF NOT EXISTS `taskstates` (
  `id` int NOT NULL AUTO_INCREMENT,
  `taskid` int NOT NULL,
  `state` varchar(42) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `taskid` (`taskid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.ticketing
CREATE TABLE IF NOT EXISTS `ticketing` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `replyid` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  `from` varchar(255) DEFAULT NULL,
  `to` varchar(255) DEFAULT NULL,
  `text` text,
  `admin` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=961 DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.traptypes
CREATE TABLE IF NOT EXISTS `traptypes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `match` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `color` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.trinitytv_devices
CREATE TABLE IF NOT EXISTS `trinitytv_devices` (
  `id` int NOT NULL AUTO_INCREMENT,
  `login` varchar(255) DEFAULT NULL,
  `subscriber_id` int DEFAULT NULL,
  `mac` varchar(128) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.trinitytv_subscribers
CREATE TABLE IF NOT EXISTS `trinitytv_subscribers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `login` varchar(255) NOT NULL,
  `contracttrinity` bigint DEFAULT NULL,
  `tariffid` int NOT NULL,
  `actdate` datetime NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.trinitytv_suspend
CREATE TABLE IF NOT EXISTS `trinitytv_suspend` (
  `id` int NOT NULL AUTO_INCREMENT,
  `login` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.trinitytv_tariffs
CREATE TABLE IF NOT EXISTS `trinitytv_tariffs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(128) DEFAULT NULL,
  `fee` double DEFAULT '0',
  `serviceid` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.ubstats
CREATE TABLE IF NOT EXISTS `ubstats` (
  `id` int NOT NULL AUTO_INCREMENT,
  `key` varchar(40) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.ubstorage
CREATE TABLE IF NOT EXISTS `ubstorage` (
  `id` int NOT NULL AUTO_INCREMENT,
  `key` varchar(255) DEFAULT NULL,
  `value` longtext,
  PRIMARY KEY (`id`),
  KEY `key` (`key`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=922419 DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.ub_im
CREATE TABLE IF NOT EXISTS `ub_im` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `from` varchar(255) NOT NULL,
  `to` varchar(255) NOT NULL,
  `text` text NOT NULL,
  `read` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=136 DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.uhw_brute
CREATE TABLE IF NOT EXISTS `uhw_brute` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `password` varchar(255) NOT NULL,
  `login` varchar(255) NOT NULL,
  `mac` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.uhw_log
CREATE TABLE IF NOT EXISTS `uhw_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `password` varchar(255) NOT NULL,
  `login` varchar(255) NOT NULL,
  `ip` varchar(255) NOT NULL,
  `nhid` int NOT NULL,
  `oldmac` varchar(255) DEFAULT NULL,
  `newmac` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.ukv_banksta
CREATE TABLE IF NOT EXISTS `ukv_banksta` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `hash` varchar(255) NOT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `admin` varchar(255) NOT NULL,
  `contract` varchar(255) DEFAULT NULL,
  `summ` varchar(42) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `realname` varchar(255) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `pdate` varchar(42) DEFAULT NULL,
  `ptime` varchar(42) DEFAULT NULL,
  `processed` tinyint NOT NULL,
  `payid` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.ukv_fees
CREATE TABLE IF NOT EXISTS `ukv_fees` (
  `id` int NOT NULL AUTO_INCREMENT,
  `yearmonth` varchar(42) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `yearmonth` (`yearmonth`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.ukv_payments
CREATE TABLE IF NOT EXISTS `ukv_payments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userid` int NOT NULL,
  `date` datetime NOT NULL,
  `admin` varchar(255) DEFAULT NULL,
  `balance` varchar(45) NOT NULL,
  `summ` varchar(45) NOT NULL,
  `visible` tinyint NOT NULL,
  `cashtypeid` int NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`,`date`,`visible`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.ukv_tags
CREATE TABLE IF NOT EXISTS `ukv_tags` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tagtypeid` int NOT NULL,
  `userid` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.ukv_tariffs
CREATE TABLE IF NOT EXISTS `ukv_tariffs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tariffname` varchar(255) NOT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.ukv_users
CREATE TABLE IF NOT EXISTS `ukv_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `contract` varchar(40) DEFAULT NULL,
  `tariffid` int DEFAULT NULL,
  `tariffnmid` int DEFAULT NULL,
  `cash` double NOT NULL,
  `active` tinyint NOT NULL,
  `realname` varchar(255) DEFAULT NULL,
  `passnum` varchar(40) DEFAULT NULL,
  `passwho` varchar(255) DEFAULT NULL,
  `passdate` date DEFAULT NULL,
  `paddr` varchar(255) DEFAULT NULL,
  `ssn` varchar(40) DEFAULT NULL,
  `phone` varchar(40) DEFAULT NULL,
  `mobile` varchar(40) DEFAULT NULL,
  `regdate` datetime NOT NULL,
  `city` varchar(40) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `build` varchar(40) DEFAULT NULL,
  `apt` varchar(20) DEFAULT NULL,
  `inetlogin` varchar(40) DEFAULT NULL,
  `cableseal` varchar(40) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contract` (`contract`),
  KEY `tariffid` (`tariffid`),
  KEY `cash` (`cash`),
  KEY `active` (`active`),
  KEY `regdate` (`regdate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.userreg
CREATE TABLE IF NOT EXISTS `userreg` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `admin` varchar(45) NOT NULL,
  `login` varchar(45) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `date` (`date`),
  KEY `login` (`login`)
) ENGINE=MyISAM AUTO_INCREMENT=3551 DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.users
CREATE TABLE IF NOT EXISTS `users` (
  `login` varchar(50) NOT NULL DEFAULT '',
  `Password` varchar(150) NOT NULL DEFAULT '*',
  `Passive` int DEFAULT '0',
  `Down` int DEFAULT '0',
  `DisabledDetailStat` int DEFAULT '0',
  `AlwaysOnline` int DEFAULT '0',
  `Tariff` varchar(40) NOT NULL DEFAULT '',
  `Address` varchar(254) NOT NULL DEFAULT '',
  `Phone` varchar(128) NOT NULL DEFAULT '',
  `Email` varchar(50) NOT NULL DEFAULT '',
  `Note` text NOT NULL,
  `RealName` varchar(254) NOT NULL DEFAULT '',
  `StgGroup` varchar(40) NOT NULL DEFAULT '',
  `Credit` double DEFAULT '0',
  `TariffChange` varchar(40) NOT NULL DEFAULT '',
  `Userdata0` varchar(254) NOT NULL,
  `Userdata1` varchar(254) NOT NULL,
  `Userdata2` varchar(254) NOT NULL,
  `Userdata3` varchar(254) NOT NULL,
  `Userdata4` varchar(254) NOT NULL,
  `Userdata5` varchar(254) NOT NULL,
  `Userdata6` varchar(254) NOT NULL,
  `Userdata7` varchar(254) NOT NULL,
  `Userdata8` varchar(254) NOT NULL,
  `Userdata9` varchar(254) NOT NULL,
  `CreditExpire` int DEFAULT '0',
  `IP` varchar(254) DEFAULT '*',
  `D0` bigint DEFAULT '0',
  `U0` bigint DEFAULT '0',
  `D1` bigint DEFAULT '0',
  `U1` bigint DEFAULT '0',
  `D2` bigint DEFAULT '0',
  `U2` bigint DEFAULT '0',
  `D3` bigint DEFAULT '0',
  `U3` bigint DEFAULT '0',
  `D4` bigint DEFAULT '0',
  `U4` bigint DEFAULT '0',
  `D5` bigint DEFAULT '0',
  `U5` bigint DEFAULT '0',
  `D6` bigint DEFAULT '0',
  `U6` bigint DEFAULT '0',
  `D7` bigint DEFAULT '0',
  `U7` bigint DEFAULT '0',
  `D8` bigint DEFAULT '0',
  `U8` bigint DEFAULT '0',
  `D9` bigint DEFAULT '0',
  `U9` bigint DEFAULT '0',
  `Cash` double DEFAULT '0',
  `FreeMb` double DEFAULT '0',
  `LastCashAdd` double DEFAULT '0',
  `LastCashAddTime` int DEFAULT '0',
  `PassiveTime` int DEFAULT '0',
  `LastActivityTime` int DEFAULT '0',
  `NAS` varchar(17) NOT NULL,
  PRIMARY KEY (`login`),
  KEY `AlwaysOnline` (`AlwaysOnline`),
  KEY `IP` (`IP`),
  KEY `Address` (`Address`),
  KEY `Tariff` (`Tariff`),
  KEY `Phone` (`Phone`),
  KEY `Email` (`Email`),
  KEY `RealName` (`RealName`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.userspeeds
CREATE TABLE IF NOT EXISTS `userspeeds` (
  `id` int NOT NULL AUTO_INCREMENT,
  `login` varchar(255) NOT NULL,
  `speed` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `speed` (`speed`),
  KEY `login` (`login`)
) ENGINE=MyISAM AUTO_INCREMENT=4393 DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.user_dataexport_allowed
CREATE TABLE IF NOT EXISTS `user_dataexport_allowed` (
  `id` int NOT NULL AUTO_INCREMENT,
  `login` varchar(100) NOT NULL,
  `export_allowed` tinyint DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.vcash
CREATE TABLE IF NOT EXISTS `vcash` (
  `id` int NOT NULL AUTO_INCREMENT,
  `login` varchar(255) NOT NULL,
  `cash` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.vcashlog
CREATE TABLE IF NOT EXISTS `vcashlog` (
  `id` int NOT NULL AUTO_INCREMENT,
  `login` varchar(45) NOT NULL,
  `date` datetime NOT NULL,
  `balance` varchar(45) NOT NULL,
  `summ` varchar(45) NOT NULL,
  `cashtypeid` int NOT NULL,
  `note` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `login` (`login`),
  KEY `date` (`date`),
  KEY `login_2` (`login`),
  KEY `date_2` (`date`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.visor_cams
CREATE TABLE IF NOT EXISTS `visor_cams` (
  `id` int NOT NULL AUTO_INCREMENT,
  `visorid` int NOT NULL,
  `login` varchar(250) NOT NULL,
  `primary` tinyint NOT NULL,
  `camlogin` varchar(250) DEFAULT NULL,
  `campassword` varchar(250) DEFAULT NULL,
  `port` int DEFAULT NULL,
  `dvrid` int DEFAULT NULL,
  `dvrlogin` varchar(250) DEFAULT NULL,
  `dvrpassword` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.visor_chans
CREATE TABLE IF NOT EXISTS `visor_chans` (
  `id` int NOT NULL AUTO_INCREMENT,
  `visorid` int NOT NULL,
  `dvrid` int NOT NULL,
  `chan` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.visor_dvrs
CREATE TABLE IF NOT EXISTS `visor_dvrs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ip` varchar(250) NOT NULL,
  `port` int DEFAULT NULL,
  `login` varchar(250) DEFAULT NULL,
  `password` varchar(250) DEFAULT NULL,
  `apiurl` varchar(255) DEFAULT NULL,
  `apikey` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(40) DEFAULT NULL,
  `camlimit` int DEFAULT '0',
  `customurl` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.visor_secrets
CREATE TABLE IF NOT EXISTS `visor_secrets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `visorid` int NOT NULL,
  `login` varchar(64) NOT NULL,
  `password` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.visor_users
CREATE TABLE IF NOT EXISTS `visor_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `regdate` datetime NOT NULL,
  `realname` varchar(250) DEFAULT NULL,
  `phone` varchar(40) DEFAULT NULL,
  `chargecams` tinyint NOT NULL,
  `primarylogin` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `primarylogin` (`primarylogin`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.vlanhosts
CREATE TABLE IF NOT EXISTS `vlanhosts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `vlanpoolid` int NOT NULL,
  `login` varchar(32) DEFAULT '*',
  `vlan` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.vlanhosts_qinq
CREATE TABLE IF NOT EXISTS `vlanhosts_qinq` (
  `id` int NOT NULL AUTO_INCREMENT,
  `vlanpoolid` int NOT NULL,
  `login` varchar(32) DEFAULT '*',
  `svlan` int DEFAULT NULL,
  `cvlan` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.vlan_mac_history
CREATE TABLE IF NOT EXISTS `vlan_mac_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `login` varchar(45) DEFAULT NULL,
  `vlan` int DEFAULT NULL,
  `mac` varchar(45) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.vlan_pools
CREATE TABLE IF NOT EXISTS `vlan_pools` (
  `id` int NOT NULL AUTO_INCREMENT,
  `desc` varchar(32) DEFAULT '*',
  `firstvlan` int DEFAULT NULL,
  `endvlan` int DEFAULT NULL,
  `qinq` int DEFAULT NULL,
  `svlan` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.vlan_terminators
CREATE TABLE IF NOT EXISTS `vlan_terminators` (
  `id` int NOT NULL AUTO_INCREMENT,
  `netid` int DEFAULT NULL,
  `vlanpoolid` int DEFAULT NULL,
  `ip` varchar(20) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `remote-id` varchar(50) DEFAULT NULL,
  `interface` varchar(50) DEFAULT NULL,
  `relay` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.vservices
CREATE TABLE IF NOT EXISTS `vservices` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tagid` int NOT NULL,
  `price` double NOT NULL DEFAULT '0',
  `cashtype` varchar(40) NOT NULL,
  `priority` int NOT NULL,
  `fee_charge_always` tinyint(1) NOT NULL DEFAULT '1',
  `charge_period_days` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.watchdog
CREATE TABLE IF NOT EXISTS `watchdog` (
  `id` int NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `checktype` varchar(255) NOT NULL,
  `param` varchar(255) NOT NULL,
  `operator` varchar(255) NOT NULL,
  `condition` varchar(255) DEFAULT NULL,
  `action` varchar(255) NOT NULL,
  `oldresult` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `active` (`active`),
  KEY `name` (`name`),
  KEY `oldresult` (`oldresult`),
  KEY `param` (`param`)
) ENGINE=MyISAM AUTO_INCREMENT=160 DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.wcpedevices
CREATE TABLE IF NOT EXISTS `wcpedevices` (
  `id` int NOT NULL AUTO_INCREMENT,
  `modelid` int NOT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `mac` varchar(45) DEFAULT NULL,
  `snmp` varchar(45) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `bridge` tinyint NOT NULL DEFAULT '0',
  `uplinkapid` int DEFAULT NULL,
  `uplinkcpeid` int DEFAULT NULL,
  `geo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.wcpeusers
CREATE TABLE IF NOT EXISTS `wcpeusers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cpeid` int NOT NULL,
  `login` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.wdycinfo
CREATE TABLE IF NOT EXISTS `wdycinfo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `missedcount` int DEFAULT NULL,
  `recallscount` int DEFAULT NULL,
  `unsucccount` int DEFAULT NULL,
  `missednumbers` text,
  `totaltrytime` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.weblogs
CREATE TABLE IF NOT EXISTS `weblogs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `admin` varchar(45) DEFAULT NULL,
  `ip` varchar(64) DEFAULT NULL,
  `event` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `date` (`date`),
  KEY `date_2` (`date`),
  KEY `date_3` (`date`)
) ENGINE=MyISAM AUTO_INCREMENT=769018 DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.whiteboard
CREATE TABLE IF NOT EXISTS `whiteboard` (
  `id` int NOT NULL AUTO_INCREMENT,
  `categoryid` int NOT NULL,
  `admin` varchar(255) NOT NULL,
  `employeeid` int DEFAULT NULL,
  `createdate` datetime NOT NULL,
  `donedate` datetime DEFAULT NULL,
  `priority` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `text` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.wh_categories
CREATE TABLE IF NOT EXISTS `wh_categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.wh_contractors
CREATE TABLE IF NOT EXISTS `wh_contractors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.wh_in
CREATE TABLE IF NOT EXISTS `wh_in` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `itemtypeid` int NOT NULL,
  `contractorid` int NOT NULL,
  `count` double NOT NULL,
  `barcode` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `storageid` int NOT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `admin` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `date` (`date`,`itemtypeid`,`contractorid`,`storageid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.wh_itemtypes
CREATE TABLE IF NOT EXISTS `wh_itemtypes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `categoryid` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `unit` varchar(40) NOT NULL,
  `reserve` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categoryid` (`categoryid`,`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.wh_out
CREATE TABLE IF NOT EXISTS `wh_out` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `desttype` varchar(40) NOT NULL,
  `destparam` varchar(255) NOT NULL,
  `storageid` int NOT NULL,
  `itemtypeid` int NOT NULL,
  `count` double NOT NULL,
  `price` double DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `admin` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `date` (`date`,`storageid`,`itemtypeid`),
  KEY `desttype` (`desttype`),
  KEY `destparam` (`destparam`),
  KEY `desttype_2` (`desttype`),
  KEY `destparam_2` (`destparam`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.wh_reserve
CREATE TABLE IF NOT EXISTS `wh_reserve` (
  `id` int NOT NULL AUTO_INCREMENT,
  `storageid` int NOT NULL,
  `itemtypeid` int NOT NULL,
  `count` double NOT NULL,
  `employeeid` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `storageid` (`storageid`),
  KEY `itemtypeid` (`itemtypeid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.wh_reshist
CREATE TABLE IF NOT EXISTS `wh_reshist` (
  `id` int NOT NULL AUTO_INCREMENT,
  `resid` int DEFAULT NULL,
  `date` datetime NOT NULL,
  `type` varchar(40) NOT NULL,
  `storageid` int DEFAULT NULL,
  `itemtypeid` int DEFAULT NULL,
  `count` double DEFAULT NULL,
  `employeeid` int DEFAULT NULL,
  `admin` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `date` (`date`,`storageid`,`itemtypeid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.wh_returns
CREATE TABLE IF NOT EXISTS `wh_returns` (
  `id` int NOT NULL AUTO_INCREMENT,
  `outid` int NOT NULL,
  `storageid` int NOT NULL,
  `itemtypeid` int NOT NULL,
  `count` double NOT NULL,
  `price` double NOT NULL,
  `date` datetime NOT NULL,
  `admin` varchar(64) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `outid` (`outid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.wh_salesitems
CREATE TABLE IF NOT EXISTS `wh_salesitems` (
  `id` int NOT NULL AUTO_INCREMENT,
  `reportid` int NOT NULL,
  `itemtypeid` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `reportid` (`reportid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.wh_salesreports
CREATE TABLE IF NOT EXISTS `wh_salesreports` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.wh_storages
CREATE TABLE IF NOT EXISTS `wh_storages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.youtv_subscribers
CREATE TABLE IF NOT EXISTS `youtv_subscribers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `subscriberid` int NOT NULL,
  `login` varchar(64) NOT NULL,
  `maintariff` int DEFAULT NULL,
  `addtariffs` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.youtv_tariffs
CREATE TABLE IF NOT EXISTS `youtv_tariffs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `serviceid` int NOT NULL,
  `main` tinyint(1) NOT NULL,
  `name` varchar(64) NOT NULL,
  `chans` varchar(42) DEFAULT NULL,
  `fee` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.zbsannhist
CREATE TABLE IF NOT EXISTS `zbsannhist` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `annid` int NOT NULL,
  `login` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `annid` (`annid`)
) ENGINE=MyISAM AUTO_INCREMENT=12341 DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.zbsannouncements
CREATE TABLE IF NOT EXISTS `zbsannouncements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `public` tinyint DEFAULT '0',
  `type` varchar(20) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `text` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `public` (`public`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.zbssclog
CREATE TABLE IF NOT EXISTS `zbssclog` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `login` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `date` (`date`)
) ENGINE=MyISAM AUTO_INCREMENT=9683 DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица testtest.zte_qinq
CREATE TABLE IF NOT EXISTS `zte_qinq` (
  `id` int NOT NULL AUTO_INCREMENT,
  `swid` int NOT NULL,
  `slot_number` int NOT NULL,
  `port` int NOT NULL,
  `svlan_id` int NOT NULL,
  `cvlan` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `svlan_id` (`svlan_id`),
  KEY `cvlan` (`cvlan`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
