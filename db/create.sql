# orders table
CREATE TABLE `orders` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(50) NOT NULL,
  `chose` tinyint(3) NOT NULL,
  `date` varchar(50) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ip` (`ip`),
  KEY `chose` (`chose`),
  KEY `date` (`date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


-- # ipaddress
-- CREATE TABLE `ipaddress` (
--   `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
--   `ip` varchar(50) NOT NULL,
--   `name` varchar(50) NOT NULL,
--   PRIMARY KEY (`id`),
--   KEY `ip` (`ip`),
--   KEY `name` (`name`)
-- ) ENGINE=MyISAM DEFAULT CHARSET=utf8;


# menu
CREATE TABLE `menus` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `text` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
