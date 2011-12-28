#Exposed
DROP TABLE IF EXISTS `statmod`.`exposed`;

CREATE TABLE `statmod`.`exposed` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `property_id` int(11) NOT NULL,
    `ext_booking_id` varchar(40) NOT NULL COMMENT 'pcd',
    `arrival` date NOT NULL COMMENT 'gad',
    `pet` varchar(5) NOT NULL COMMENT 'pet',
    `cumulative_exposures` int(11) unsigned NOT NULL default 0,
    `cumulative_interests` int(11) unsigned NOT NULL default 0,
    `cumulative_requests` int(11) unsigned NOT NULL default 0,
    `cumulative_awards` int(11) unsigned NOT NULL default 0,
    `last_exposure_interested` tinyint(1) default NULL COMMENT '1 = yes, 0 = no',
    `last_interest_committed` tinyint(1) default NULL COMMENT '1 = yes, 0 = no',
    `last_request_awarded` tinyint(1) default NULL COMMENT '1 = yes, 0 = no',
    `last_exposure_datetime` datetime default NULL,
    `last_interest_datetime` datetime default NULL,
    `last_committed_datetime` datetime default NULL,
    `last_awarded_date` date default NULL,
    `max_committed_spend_absolute` float(10,2) default NULL,
    `max_awarded_spend_absolute` float(10,2) default NULL,
    `loyalty_history` tinyint(1) default NULL COMMENT '1 = yes, 0 = no',
    `multiple_associated_names` tinyint(1) NOT NULL default 0 COMMENT '1 = yes, 0 = no',
    `toro_exposed_flag` tinyint(1) default 0 COMMENT '1 = toro served, 0 = not toro served',
    `upgrade_matrix_id` int(11) NOT NULL,
    `from_category_name` varchar(100) NULL,
    `from_category_code` varchar(20) NOT NULL COMMENT 'rcc',
    `from_category_id` int(11) NOT NULL,
    `from_room_size` int(11) unsigned default NULL,
    `matrix_lmi_price` float(10,2) default NULL,
    `toro_lmi_price` float(10,2) default NULL,
    `total_booking_price` float(10,2) NOT NULL COMMENT 'tbp',
    `length_of_stay` smallint(3) default NULL COMMENT 'nmn',
    `first_name` varchar(100) default NULL COMMENT 'gfn',
    `email` varchar(100) default NULL COMMENT 'gem',
    `domain` varchar(100) default NULL,
    `adult_count` tinyint(1) default NULL COMMENT 'noa',
    `child_count` tinyint(1) default NULL COMMENT 'noc',
    `room_count` tinyint(3) NOT NULL COMMENT 'gnr',
    `language` varchar(2) NOT NULL COMMENT 'lng',
    `loyalty` varchar(3) NOT NULL COMMENT 'plc',
    `rate_code` varchar(12) default NULL COMMENT 'srp',
    `rate_tier` varchar(12) default NULL COMMENT 'prt',
    `property_booking_date` datetime default NULL COMMENT 'pts',
    `exposure_timestamp` datetime NOT NULL COMMENT 'created field in lmi table',
    `created` timestamp NULL default CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `booking` (`property_id`,`ext_booking_id`,`arrival`),
    KEY `email` (`email`),
    UNIQUE KEY `touchpoint` (`property_id`,`ext_booking_id`,`arrival`,`pet`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#get lmi records, ignore duplicates on the unique key `touchpoint`
INSERT IGNORE `statmod`.`exposed` (
    `property_id`,
    `ext_booking_id`,
    `arrival`,
    `pet`,
    #begin guest history features
    `cumulative_exposures`,
    `cumulative_interests`,
    `cumulative_requests`,
    `cumulative_awards`,
    `last_exposure_interested`,
    `last_interest_committed`,
    `last_request_awarded`,
    `last_exposure_datetime`,
    `last_interest_datetime`,
    `last_committed_datetime`,
    `last_awarded_date`,
    `max_committed_spend_absolute`,
    `max_awarded_spend_absolute`,
    `loyalty_history`,
    `multiple_associated_names`,
    #end guest history features
    `toro_exposed_flag`,
    `upgrade_matrix_id`,
    `from_category_name`,
    `from_category_code`,
    `from_category_id`,
    `from_room_size`,
    `matrix_lmi_price`,
    `toro_lmi_price`,
    `total_booking_price`,
    `length_of_stay`,
    `first_name`,
    `email`,
    `domain`,
    `adult_count`,
    `child_count`,
    `room_count`,
    `language`,
    `loyalty`,
    `rate_code`,
    `rate_tier`,
    `property_booking_date`,
    `exposure_timestamp`
) SELECT 
    `p`.`id`,
    `i`.`ebc`,
    `i`.`gad`,
    `i`.`pet`,
    #begin guest history features
    `g`.`cumulative_exposures`,
    `g`.`cumulative_interests`,
    `g`.`cumulative_requests`,
    `g`.`cumulative_awards`,
    `g`.`last_exposure_interested`,
    `g`.`last_interest_committed`,
    `g`.`last_request_awarded`,
    `g`.`last_exposure_datetime`,
    `g`.`last_interest_datetime`,
    `g`.`last_committed_datetime`,
    `g`.`last_awarded_date`,
    `g`.`max_committed_spend_absolute`,
    `g`.`max_awarded_spend_absolute`,
    `g`.`loyalty_history`,
    `g`.`multiple_associated_names`,
    #end guest history features
    if(`t`.`lmi_price` IS NOT NULL, 1, 0),
    `i`.`upgrade_matrix_id`,
    `r`.`name`,
    `i`.`rcc`,
    `m`.`from_category_id`,
    `r`.`room_size`,
    `m`.`lmi_price`,
    `t`.`lmi_price`,
    `i`.`tbp`,
    if(`i`.`nmn`+0 >= 1, `i`.`nmn`, `i`.`gdd` - `i`.`gad`),
    `i`.`gfn`,
    `i`.`gem`,
    substring(`i`.`gem`,locate('@',`i`.`gem`)+1),
    `i`.`noa`,
    `i`.`noc`,
    `i`.`gnr`,
    `i`.`lng`,
    `i`.`plc`,
    `i`.`srp`,
    `i`.`prt`,
    `i`.`pts`,
    `i`.`created`
FROM `statmod`.`x_learn_more_image` AS `i`
INNER JOIN `statmod`.`y_property` AS `p`
    ON `p`.`pms_cd` = `i`.`pcd`
LEFT JOIN `statmod`.`guest_history` AS `g`
    ON `i`.`gem` = `g`.`email`
LEFT JOIN `statmod`.`matrix_lmi_price` AS `m`
    ON `p`.`id` = `m`.`property_id` 
    AND `i`.`upgrade_matrix_id` = `m`.`upgrade_matrix_id`
    AND `i`.`rcc` = `m`.`rcc`
LEFT JOIN `statmod`.`toro_lmi_price` AS `t`
    ON `p`.`id` = `t`.`property_id`
    AND `i`.`ebc` = `t`.`ext_booking_id`
    AND `i`.`gad` = `t`.`arrival`
    AND `i`.`pet` = `t`.`pet`
LEFT JOIN `statmod`.`y_room` AS `r`
    ON `p`.`id` = `r`.`property_id`
    AND `i`.`rcc` = `r`.`pms_cd`;

#get nor1 extract records, ignore duplicates on the unique key `touchpoint`
INSERT IGNORE INTO `statmod`.`exposed` (
    `property_id`,
    `ext_booking_id`,
    `arrival`,
    `pet`,
    #begin guest history features
    `cumulative_exposures`,
    `cumulative_interests`,
    `cumulative_requests`,
    `cumulative_awards`,
    `last_exposure_interested`,
    `last_interest_committed`,
    `last_request_awarded`,
    `last_exposure_datetime`,
    `last_interest_datetime`,
    `last_committed_datetime`,
    `last_awarded_date`,
    `max_committed_spend_absolute`,
    `max_awarded_spend_absolute`,
    `loyalty_history`,
    `multiple_associated_names`,
    #end guest history features
    `toro_exposed_flag`,
    #`upgrade_matrix_id`,
    `from_category_name`,
    `from_category_code`,
    #`from_category_id`,
    `from_room_size`,
    #`matrix_lmi_price`,
    `toro_lmi_price`,
    `total_booking_price`,
    `length_of_stay`,
    `first_name`,
    `email`,
    `domain`,
    `adult_count`,
    `child_count`,
    `room_count`,
    `language`,
    `loyalty`,
    `rate_code`,
    `rate_tier`,
    `property_booking_date`,
    `exposure_timestamp`
) SELECT 
    `e`.`property_id`,
    `e`.`ext_booking_id`,
    `i`.`gad`,
    'NOR1',
    #begin guest history features
    `g`.`cumulative_exposures`,
    `g`.`cumulative_interests`,
    `g`.`cumulative_requests`,
    `g`.`cumulative_awards`,
    `g`.`last_exposure_interested`,
    `g`.`last_interest_committed`,
    `g`.`last_request_awarded`,
    `g`.`last_exposure_datetime`,
    `g`.`last_interest_datetime`,
    `g`.`last_committed_datetime`,
    `g`.`last_awarded_date`,
    `g`.`max_committed_spend_absolute`,
    `g`.`max_awarded_spend_absolute`,
    `g`.`loyalty_history`,
    `g`.`multiple_associated_names`,
    #end guest history features
    if(`t`.`lmi_price` IS NOT NULL, 1, 0),
    #`i`.`upgrade_matrix_id`,
    `r`.`name`,
    `i`.`rcc`,
    #`from_category_id`,
    `r`.`room_size`,
    #`m`.`lmi_price`,
    `t`.`lmi_price`,
    `i`.`tbp`,
    if(`i`.`nmn`+0 >= 1, `i`.`nmn`, `i`.`gdd` - `i`.`gad`),
    `i`.`gfn`,
    `e`.`mail_to`,
    substring(`e`.`mail_to`,locate('@',`e`.`mail_to`)+1),
    `i`.`noa`,
    `i`.`noc`,
    `i`.`gnr`,
    `i`.`lng`,
    `i`.`plc`,
    `i`.`srp`,
    `i`.`prt`,
    `i`.`pts`,
    `e`.`sent`
FROM `statmod`.`x_email_queue` AS `e`
INNER JOIN `statmod`.`y_property` AS `p`
    ON `e`.`property_id` = `p`.`id`
LEFT JOIN `statmod`.`guest_history` AS `g`
    ON `e`.`mail_to` = `g`.`email`
LEFT JOIN `statmod`.`x_extracts_archive` AS `i`
    ON `e`.`ext_booking_id` = `i`.`ebc` 
    AND `i`.`pcd` = `p`.`pms_cd`
LEFT JOIN `statmod`.`toro_lmi_price` AS `t`
    ON `p`.`id` = `t`.`property_id`
    AND `e`.`ext_booking_id` = `t`.`ext_booking_id`
LEFT JOIN `statmod`.`y_room` AS `r`
    ON `p`.`id` = `r`.`property_id`
    AND `i`.`rcc` = `r`.`pms_cd`
WHERE `e`.`type` = 'g-offer'
    AND `e`.`status` = 'done';
    
#delete test bookings
DELETE FROM `statmod`.`exposed` WHERE locate('test',lower(`ext_booking_id`)) > 0;

#delete bookings by filtered email
DELETE `e`.* 
FROM `statmod`.`exposed` AS `e`
LEFT JOIN `statmod`.`filtered_emails` AS `f1` ON `e`.`email`=`f1`.`value`
LEFT JOIN `statmod`.`filtered_emails` AS `f2` ON `e`.`domain`=`f2`.`value`
WHERE `f1`.`value` IS NOT NULL OR `f2`.`value` IS NOT NULL;