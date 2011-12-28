#Matrix LMI price table
DROP TABLE IF EXISTS `statmod`.`matrix_lmi_price`;

CREATE TABLE `statmod`.`matrix_lmi_price` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `property_id` int(11) NOT NULL,
    `upgrade_matrix_id` int(11) NOT NULL,
    `rcc` varchar(20) NOT NULL,
    `from_category_id` int(11) NOT NULL,
    `lmi_price` float(10,2) NOT NULL,
    `created` timestamp NULL default CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `prop_upg_rcc` (`property_id`,`upgrade_matrix_id`,`rcc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `statmod`.`matrix_lmi_price` (
    `property_id`,
    `upgrade_matrix_id`,
    `rcc`,
    `from_category_id`,
    `lmi_price`
) SELECT 
    `u`.`property_id`,
    `u`.`upgrade_matrix_id`,
    `r`.`pms_cd` AS `rcc`,
    `u`.`from_category_id`,
    min(`u`.`price`) AS `lmi_price`
FROM `statmod`.`y_upgrade` AS `u`
    INNER JOIN `statmod`.`y_room` AS `r`
        ON `u`.`property_id` = `r`.`property_id`
        AND `u`.`from_category_id` = `r`.`category_id`
GROUP BY `u`.`property_id`, `u`.`upgrade_matrix_id`, `u`.`from_category_id`;

#TORO LMI price table
DROP TABLE IF EXISTS `statmod`.`toro_lmi_price`;

CREATE TABLE `statmod`.`toro_lmi_price` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `property_id` int(11) NOT NULL,
    `ext_booking_id` varchar(40) NOT NULL,
    `arrival` date NOT NULL,
    `pet` varchar(255) NOT NULL,
    `lmi_price` float(10,2) NOT NULL,
    `created` timestamp NULL default CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `prop_ext_arr_touch` (`property_id`,`ext_booking_id`,`arrival`,`pet`),
    KEY `prop_ext` (`property_id`,`ext_booking_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `statmod`.`toro_lmi_price` (
    `property_id`,
    `ext_booking_id`,
    `arrival`,
    `pet`,
    `lmi_price`
) SELECT 
    `property_id`,
    `ext_booking_id`,
    `arrival`,
    `pet`,
    min(`price`) AS `lmi_price`
FROM `analytics`.`toro_offers`
GROUP BY `property_id`, `ext_booking_id`, `arrival`, `pet`;