#add index to tables derived from x_booking
ALTER TABLE `statmod`.`x_booking` 
    ADD COLUMN `email` varchar(255) default NULL,
    ADD INDEX `touchpoint` (`property_id`,`ext_booking_id`,`arrival`,`pet`),
    ADD INDEX `email` (`email`);

ALTER TABLE `statmod`.`x_booking_cancellations` ADD INDEX `touchpoint` (`property_id`,`ext_booking_id`,`arrival`,`pet`);