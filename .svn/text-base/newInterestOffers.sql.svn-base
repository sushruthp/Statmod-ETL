DROP TABLE IF EXISTS `statmod`.`new_interests`;

CREATE TABLE `statmod`.`new_interests` (
    `property_id` int(11) NOT NULL,
    `ext_booking_id` varchar(40) NOT NULL COMMENT 'pcd',
    `arrival` date NOT NULL COMMENT 'gad',
    `pet` varchar(5) NOT NULL COMMENT 'pet',
    `toro_interested_flag` tinyint(1) default 0 COMMENT '1 = toro interested, 0 = not toro interested',
    `upgrade_matrix_id` int(11) NOT NULL,
    `from_category_id` int(11) NOT NULL,
    KEY `booking` (`property_id`,`ext_booking_id`,`arrival`),
    UNIQUE KEY `touchpoint` (`property_id`,`ext_booking_id`,`arrival`,`pet`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT IGNORE `statmod`.`new_interests` SELECT 
    `property_id`,
    `ext_booking_id`,
    `arrival`,
    `pet`,
    if(`upgrade_matrix_type` = 'toro', 1, 0),
    `upgrade_matrix_id`,
    `category_id`
FROM `statmod`.`x_booking`;

DROP TABLE IF EXISTS `statmod`.`new_interest_matrix_offers`;
CREATE TABLE `statmod`.`new_interest_matrix_offers` LIKE `statmod`.`new_interests`;
ALTER TABLE `statmod`.`new_interest_matrix_offers`
    ADD COLUMN `to_category_id` int(11) NOT NULL,
    ADD COLUMN `from_category_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
    ADD COLUMN `to_category_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
    ADD COLUMN `from_room_size` int(11) unsigned default NULL,
    ADD COLUMN `to_room_size` int(11) unsigned default NULL,
    ADD COLUMN `upg_price` float(10,2) NOT NULL,
    ADD COLUMN `from_price` float(10,2) NOT NULL,
    ADD COLUMN `to_price` float(10,2) NOT NULL,
    ADD COLUMN `implied_to_price` float(10,2) NOT NULL,
    ADD COLUMN `to_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
    ADD COLUMN `offer_set_size` tinyint(1),
    DROP INDEX `touchpoint`,
    ADD INDEX `prop_upg_from` (`property_id`,`upgrade_matrix_id`,`from_category_id`),
    ADD UNIQUE INDEX `upgrade_item` (`property_id`,`ext_booking_id`,`arrival`,`pet`,`to_category_id`);

INSERT IGNORE `statmod`.`new_interest_matrix_offers` SELECT 
    `n`.`property_id`,
    `n`.`ext_booking_id`,
    `n`.`arrival`,
    `n`.`pet`,
    `n`.`toro_interested_flag`,
    `n`.`upgrade_matrix_id`,
    `n`.`from_category_id`,
    `m`.`to_category_id`,
    `m`.`from_category_name`,
    `m`.`to_category_name`,
    `m`.`from_room_size`,
    `m`.`to_room_size`,
    `m`.`upg_price`,
    `m`.`from_price`,
    `m`.`to_price`,
    `m`.`implied_to_price`,
    `m`.`to_type`,
    `m`.`offer_set_size`
FROM `statmod`.`new_interests` AS `n`
LEFT JOIN `statmod`.`matrix_offers` AS `m`
    ON `n`.`property_id` = `m`.`property_id`
    AND `n`.`upgrade_matrix_id` = `m`.`upgrade_matrix_id`
    AND `n`.`from_category_id` = `m`.`from_category_id`
WHERE `toro_interested_flag` = 0;

DROP TABLE IF EXISTS `statmod`.`new_interest_toro_offers`;
CREATE TABLE `statmod`.`new_interest_toro_offers` LIKE `statmod`.`new_interests`;
ALTER TABLE `statmod`.`new_interest_toro_offers`
    ADD COLUMN `to_category_id` int(11) NOT NULL,
    ADD COLUMN `from_category_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
    ADD COLUMN `to_category_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
    ADD COLUMN `from_room_size` int(11) unsigned default NULL,
    ADD COLUMN `to_room_size` int(11) unsigned default NULL,
    ADD COLUMN `upg_price` float(10,2) NOT NULL,
    ADD COLUMN `from_price` float(10,2) NOT NULL,
    ADD COLUMN `to_price` float(10,2) NOT NULL,
    ADD COLUMN `implied_to_price` float(10,2) NOT NULL,
    ADD COLUMN `to_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
    ADD COLUMN `offer_set_size` tinyint(1),
    DROP INDEX `touchpoint`,
    ADD INDEX `prop_upg_from` (`property_id`,`upgrade_matrix_id`,`from_category_id`),
    ADD UNIQUE INDEX `upgrade_item` (`property_id`,`ext_booking_id`,`arrival`,`pet`,`to_category_id`);
   
INSERT IGNORE `statmod`.`new_interest_toro_offers` SELECT
    `n`.`property_id`,
    `n`.`ext_booking_id`,
    `n`.`arrival`,
    `n`.`pet`,
    `n`.`toro_interested_flag`,
    `n`.`upgrade_matrix_id`,
    `n`.`from_category_id`,
    `t`.`to_category`,
    `cf`.`name`,
    `ct`.`name`,
    `cf`.`room_size`,
    `ct`.`room_size`,
    `t`.`price`,
    `t`.`p0`,
    `t`.`tk`,
    `t`.`tk`,
    `ct`.`type`,
    `t`.`setsize`
FROM `statmod`.`new_interests` AS `n`
LEFT JOIN `statmod`.`y_category` AS `cf`
    ON `n`.`from_category_id` = `cf`.`id`
LEFT JOIN `statmod`.`toro_param_offers` AS `t`
    ON `n`.`property_id` = `t`.`property_id`
    AND `n`.`ext_booking_id` = `t`.`ext_booking_id`
    AND `n`.`arrival` = `t`.`arrival`
    AND `n`.`pet` = `t`.`pet`
LEFT JOIN `statmod`.`y_category` AS `ct`
    ON `t`.`to_category` = `ct`.`id`
WHERE `toro_interested_flag` = 1;

DROP TABLE IF EXISTS `statmod`.`new_interest_offers`;
CREATE TABLE `statmod`.`new_interest_offers` LIKE `statmod`.`new_interest_toro_offers`;
ALTER TABLE `statmod`.`new_interest_offers` 
    ADD COLUMN `id` int(11) NOT NULL AUTO_INCREMENT FIRST,
    ADD PRIMARY KEY (`id`);
INSERT INTO `statmod`.`new_interest_offers` SELECT NULL,`t`.* FROM `statmod`.`new_interest_matrix_offers` AS `t`;
INSERT INTO `statmod`.`new_interest_offers` SELECT NULL,`t`.* FROM `statmod`.`new_interest_toro_offers` AS `t`;
ALTER TABLE `statmod`.`new_interest_offers`
    ADD COLUMN `toro_committed_flag` tinyint(1) default 0 COMMENT '1 = toro committed, 0 = not toro committed',
    ADD COLUMN `toro_awarded_flag` tinyint(1) default 0 COMMENT '1 = toro awarded, 0 = not toro awarded',
    ADD COLUMN `committed` tinyint(1) default 0 COMMENT '1 = committed, 0 = not committed',
    ADD COLUMN `awarded` tinyint(1) default 0 COMMENT '1 = awarded, 0 = not awarded',
    ADD COLUMN `upg_total_revenue` float(10,2) default 0;

DROP TABLE IF EXISTS `statmod`.`new_interests`;
DROP TABLE IF EXISTS `statmod`.`new_interest_matrix_offers`;
DROP TABLE IF EXISTS `statmod`.`new_interest_toro_offers`;