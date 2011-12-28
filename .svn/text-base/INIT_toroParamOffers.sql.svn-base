# toro param offers
INSERT INTO `analytics`.`torolog_controls` (`job_start`,`job_end`,`min_id_toro_params`,`max_id_toro_params`,`min_id_toro_offers`,`max_id_toro_offers`)
    VALUES (now(),now(),0,0,0,0);
SET @job_id = (SELECT max(`id`) FROM `analytics`.`torolog_controls`);
SET @prev_job_id = (SELECT max(`id`) FROM `analytics`.`torolog_controls` WHERE `id` < @job_id);
SET @min_id_params = (SELECT `max_id_toro_params` FROM `analytics`.`torolog_controls` WHERE `id` = @prev_job_id);
SET @max_id_params = (SELECT max(`id`) FROM `analytics`.`toro_params`);
SET @min_id_offers = (SELECT `max_id_toro_offers` FROM `analytics`.`torolog_controls` WHERE `id` = @prev_job_id);
SET @max_id_offers = (SELECT max(`id`) FROM `analytics`.`toro_offers`);

DROP TABLE IF EXISTS `statmod`.`toro_param_offers`;

CREATE TABLE `statmod`.`toro_param_offers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ext_booking_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `log_timestamp` datetime NOT NULL,
  `property_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `booked_price` float(10,2) DEFAULT NULL,
  `src_price_cal` float(10,2) DEFAULT NULL,
  `arrival` date DEFAULT NULL,
  `children` tinyint(3) DEFAULT NULL,
  `firstname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `guest_id` int(11) DEFAULT NULL,
  `nights` tinyint(3) DEFAULT NULL,
  `pet` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `adults` tinyint(3) DEFAULT NULL,
  `loyalty_cd` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rooms` tinyint(3) DEFAULT NULL,
  `mode` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 = live, 2 = shadow',
  `timing` float(10,2) DEFAULT NULL,
  `offer_set_size` int(11) DEFAULT NULL,
  `log_filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `parsed_utc_timestamp` datetime NOT NULL,
  `setsize` tinyint(3) NOT NULL,
  `to_category` int(11) NOT NULL,
  `p0` float(10,2) DEFAULT NULL,
  `b0` tinyint(1) DEFAULT NULL,
  `tk` float(10,2) DEFAULT NULL,
  `rk` float(10,2) DEFAULT NULL,
  `ak` float(10,2) DEFAULT NULL,
  `bk` float(10,2) DEFAULT NULL,
  `fin` tinyint(3) DEFAULT NULL,
  `CTR` float(10,2) DEFAULT NULL,
  `b11` tinyint(3) DEFAULT NULL,
  `b12` tinyint(3) DEFAULT NULL,
  `g1` tinyint(3) DEFAULT NULL,
  `g2` tinyint(3) DEFAULT NULL,
  `g4` tinyint(3) DEFAULT NULL,
  `b5b6` tinyint(3) DEFAULT NULL,
  `b8` tinyint(3) DEFAULT NULL,
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `price` float(10,2) DEFAULT NULL,
  `save` float(10,2) DEFAULT NULL,
  `display_order` tinyint(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `property_id` (`property_id`),
  UNIQUE KEY `item` (`property_id`,`ext_booking_id`,`arrival`,`pet`,`to_category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT IGNORE `statmod`.`toro_param_offers` 
SELECT `p`.*, `o`.`price`, `o`.`save`, `o`.`display_order`
FROM `analytics`.`toro_offers` AS `o`
    INNER JOIN `analytics`.`toro_params` AS `p`
        ON `p`.`property_id` = `o`.`property_id`
        AND `p`.`ext_booking_id` = `o`.`ext_booking_id`
        AND `p`.`arrival` = `o`.`arrival`
        AND `p`.`pet` = `o`.`pet`
        AND `p`.`log_timestamp` = `o`.`log_timestamp`
        AND `p`.`to_category` = `o`.`to_category`
WHERE `p`.`id` > @min_id_params AND `p`.`id` <= @max_id_params
AND `o`.`id` > @min_id_offers AND `o`.`id` <= @max_id_offers
AND `p`.`mode` = 1;

UPDATE `analytics`.`torolog_controls`
SET `min_id_toro_params` = (SELECT min(`id`) FROM `analytics`.`toro_params` WHERE `id` > @min_id_params),
    `max_id_toro_params` = @max_id_params,
    `min_id_toro_offers` = (SELECT min(`id`) FROM `analytics`.`toro_offers` WHERE `id` > @min_id_offers),
    `max_id_toro_offers` = @max_id_offers
WHERE `id` = @job_id;

UPDATE `analytics`.`torolog_controls`
SET `min_id_toro_params` = if(`min_id_toro_params` IS NULL, `max_id_toro_params`, `min_id_toro_params`),
    `min_id_toro_offers` = if(`min_id_toro_offers` IS NULL, `max_id_toro_offers`, `min_id_toro_offers`)
WHERE `id` = @job_id;