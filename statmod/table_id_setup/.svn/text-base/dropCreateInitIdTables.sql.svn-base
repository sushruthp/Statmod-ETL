DROP TABLE IF EXISTS `statmod`.`init_x_extracts_archive`;
CREATE TABLE `statmod`.`init_x_extracts_archive` (
    `database` varchar(40) NOT NULL,
    `id` int(11) NOT NULL,
    `created` datetime
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `nor1_upg_db1_dal_us`.`init_x_extracts_archive` 
SELECT 'upg_archive_2010_10_26', `id`, `created` FROM upg_archive_2010_10_26.x_extracts_archive;

INSERT INTO `nor1_upg_db1_dal_us`.`init_x_extracts_archive` 
SELECT 'upg_archive_2010_11_26', `id`, `created` FROM upg_archive_2010_11_26.x_extracts_archive;

INSERT INTO `nor1_upg_db1_dal_us`.`init_x_extracts_archive` 
SELECT 'upg_archive_2011_05_03', `id`, `created` FROM upg_archive_2011_05_03.x_extracts_archive;

INSERT INTO `nor1_upg_db1_dal_us`.`init_x_extracts_archive` 
SELECT 'nor1_upg_db1_dal_us', `id`, `created` FROM nor1_upg_db1_dal_us.x_extracts_archive;

ALTER TABLE `nor1_upg_db1_dal_us`.`init_x_extracts_archive`  ADD INDEX `created` (`created`);

DROP TABLE IF EXISTS `nor1_upg_db1_dal_us`.`init_x_email_queue`;
CREATE TABLE `nor1_upg_db1_dal_us`.`init_x_email_queue` (
    `database` varchar(40) NOT NULL,
    `id` int(11) NOT NULL,
    `created` datetime
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `nor1_upg_db1_dal_us`.`init_x_email_queue` 
SELECT 'upg_archive_2010_10_26', `id`, `created` FROM upg_archive_2010_10_26.x_email_queue;

INSERT INTO `nor1_upg_db1_dal_us`.`init_x_email_queue` 
SELECT 'upg_archive_2010_11_26', `id`, `created` FROM upg_archive_2010_11_26.x_email_queue;

INSERT INTO `nor1_upg_db1_dal_us`.`init_x_email_queue` 
SELECT 'upg_archive_2011_05_03', `id`, `created` FROM upg_archive_2011_05_03.x_email_queue;

INSERT INTO `nor1_upg_db1_dal_us`.`init_x_email_queue` 
SELECT 'nor1_upg_db1_dal_us', `id`, `created` FROM nor1_upg_db1_dal_us.x_email_queue;

ALTER TABLE `nor1_upg_db1_dal_us`.`init_x_email_queue`  ADD INDEX `created` (`created`);

DROP TABLE IF EXISTS `statmod`.`init_x_booking`;
CREATE TABLE `statmod`.`init_x_booking` (
    `database` varchar(40) NOT NULL,
    `id` int(11) NOT NULL,
    `created` datetime
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `nor1_upg_db1_dal_us`.`init_x_booking` 
SELECT 'upg_archive_2010_10_26', `id`, `created` FROM upg_archive_2010_10_26.x_booking;

INSERT INTO `nor1_upg_db1_dal_us`.`init_x_booking` 
SELECT 'upg_archive_2010_11_26', `id`, `created` FROM upg_archive_2010_11_26.x_booking;

INSERT INTO `nor1_upg_db1_dal_us`.`init_x_booking` 
SELECT 'upg_archive_2011_05_03', `id`, `created` FROM upg_archive_2011_05_03.x_booking;

INSERT INTO `nor1_upg_db1_dal_us`.`init_x_booking` 
SELECT 'nor1_upg_db1_dal_us', `id`, `created` FROM nor1_upg_db1_dal_us.x_booking;

ALTER TABLE `nor1_upg_db1_dal_us`.`init_x_booking`  ADD INDEX `created` (`created`);

DROP TABLE IF EXISTS `statmod`.`init_x_upgrade_request`;
CREATE TABLE `statmod`.`init_x_upgrade_request` (
    `database` varchar(40) NOT NULL,
    `id` int(11) NOT NULL,
    `created` datetime
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `nor1_upg_db1_dal_us`.`init_x_upgrade_request` 
SELECT 'upg_archive_2010_10_26', `id`, `created` FROM upg_archive_2010_10_26.x_upgrade_request;

INSERT INTO `nor1_upg_db1_dal_us`.`init_x_upgrade_request` 
SELECT 'upg_archive_2010_11_26', `id`, `created` FROM upg_archive_2010_11_26.x_upgrade_request;

INSERT INTO `nor1_upg_db1_dal_us`.`init_x_upgrade_request` 
SELECT 'upg_archive_2011_05_03', `id`, `created` FROM upg_archive_2011_05_03.x_upgrade_request;

INSERT INTO `nor1_upg_db1_dal_us`.`init_x_upgrade_request` 
SELECT 'nor1_upg_db1_dal_us', `id`, `created` FROM nor1_upg_db1_dal_us.x_upgrade_request;

ALTER TABLE `nor1_upg_db1_dal_us`.`init_x_upgrade_request`  ADD INDEX `created` (`created`);