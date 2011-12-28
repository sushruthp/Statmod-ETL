#add identifier columns and indexes to tables derived from x_upgrade_request
ALTER TABLE `statmod`.`x_upgrade_request` 
    ADD COLUMN `ext_booking_id` varchar(40) NOT NULL,
    ADD COLUMN `arrival` date NOT NULL,
    ADD COLUMN `pet` varchar(5) NOT NULL,
    ADD COLUMN `email` varchar(255) default NULL,
    ADD INDEX `touchpoint` (`property_id`,`ext_booking_id`,`arrival`,`pet`),
    ADD INDEX `item` (`property_id`,`ext_booking_id`,`arrival`,`pet`,`to_category_id`),
    ADD INDEX `email` (`email`);
    
ALTER TABLE `statmod`.`x_upgrade_request_award` 
    ADD COLUMN `ext_booking_id` varchar(40) NOT NULL,
    ADD COLUMN `arrival` date NOT NULL,
    ADD COLUMN `pet` varchar(5) NOT NULL,
    ADD COLUMN `email` varchar(255) default NULL,
    ADD INDEX `touchpoint` (`property_id`,`ext_booking_id`,`arrival`,`pet`),
    ADD INDEX `item` (`property_id`,`ext_booking_id`,`arrival`,`pet`,`to_category_id`),
    ADD INDEX `email` (`email`);