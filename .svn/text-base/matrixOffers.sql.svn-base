#Matrix Offers table
DROP TABLE IF EXISTS `statmod`.`matrix_offers`;

CREATE TABLE `statmod`.`matrix_offers` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `property_id` int(11) NOT NULL,
    `upgrade_matrix_id` int(11) NOT NULL,
    `from_category_id` int(11) NOT NULL,
    `to_category_id` int(11) NOT NULL,
    `from_category_name` varchar(50) NOT NULL,
    `to_category_name` varchar(50) NOT NULL,
    `from_room_size` int(11) unsigned default NULL,
    `to_room_size` int(11) unsigned default NULL,
    `upg_price` float(10,2) NOT NULL,
    `from_price` float(10,2) NOT NULL,
    `to_price` float(10,2) NOT NULL,
    `implied_to_price` float(10,2) NOT NULL,
    `to_type` varchar(20) NOT NULL,
    `offer_set_size` tinyint(1),
    `created` timestamp NULL default CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `prop_upg_from` (`property_id`,`upgrade_matrix_id`,`from_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#offer set size table
DROP TABLE IF EXISTS `statmod`.`matrix_offer_set_size`;

CREATE TABLE `statmod`.`matrix_offer_set_size` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `property_id` int(11) NOT NULL,
    `upgrade_matrix_id` int(11) NOT NULL,
    `from_category_id` int(11) NOT NULL,
    `offer_set_size` tinyint(1),
    `created` timestamp NULL default CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    UNIQUE KEY `prop_upg_from` (`property_id`,`upgrade_matrix_id`,`from_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `statmod`.`matrix_offer_set_size` (
    `property_id`,
    `upgrade_matrix_id`,
    `from_category_id`,
    `offer_set_size`
) SELECT 
    `u`.`property_id`,
    `u`.`upgrade_matrix_id`,
    `u`.`from_category_id`,
    1
FROM `statmod`.`y_upgrade` AS `u`
ON DUPLICATE KEY UPDATE `offer_set_size` = `offer_set_size` + 1;

INSERT INTO `statmod`.`matrix_offers` (
    `property_id`,
    `upgrade_matrix_id`,
    `from_category_id`,
    `to_category_id`,
    `from_category_name`,
    `to_category_name`,
    `from_room_size`,
    `to_room_size`,
    `upg_price`,
    `from_price`,
    `to_price`,
    `implied_to_price`,
    `to_type`,
    `offer_set_size`
) SELECT
    `f`.`property_id`,
    `u`.`upgrade_matrix_id`,
    `f`.`id`,
    `t`.`id`,
    `f`.`name`,
    `t`.`name`,
    `f`.`room_size`,
    `t`.`room_size`,
    `u`.`price`,
    `f`.`price`,
    `t`.`price`,
    if(`u`.`save` = -1,if(`t`.`type`='room_upgrade',`t`.`price`,`f`.`price` + `t`.`price`),`f`.`price` + `u`.`price` + `u`.`save`),
    `t`.`type`,
    `s`.`offer_set_size`
FROM `statmod`.`y_upgrade` AS `u`
LEFT JOIN (`statmod`.`y_category` AS `f`, `statmod`.`y_category` AS `t`)
    ON `u`.`property_id` = `f`.`property_id`
    AND `u`.`property_id` = `t`.`property_id`
    AND `u`.`from_category_id` = `f`.`id` 
    AND `u`.`to_category_id` = `t`.`id`
LEFT JOIN `statmod`.`matrix_offer_set_size` AS `s`
    ON `u`.`property_id` = `s`.`property_id`
    AND `u`.`upgrade_matrix_id` = `s`.`upgrade_matrix_id`
    AND `u`.`from_category_id` = `s`.`from_category_id`
WHERE `u`.`status` = 'live'
    AND `f`.`status` = 'live'
    AND `t`.`status` = 'live';