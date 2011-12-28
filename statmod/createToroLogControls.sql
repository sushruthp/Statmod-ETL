# Control table for statmod

DROP TABLE IF EXISTS `analytics`.`torolog_controls`;

CREATE TABLE `analytics`.`torolog_controls` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `job_start` datetime default '0000-00-00 00:00:00',
    `job_end` datetime default '0000-00-00 00:00:00',
    `min_id_toro_params` int(11) default 0,
    `max_id_toro_params` int(11) default 0,
    `min_id_toro_offers` int(11) default 0,
    `max_id_toro_offers` int(11) default 0,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- #insert a default entry
-- INSERT INTO `analytics`.`torolog_controls` (`job_start`,`job_end`,`min_id_toro_params`,`max_id_toro_params`,`min_id_toro_offers`,`max_id_toro_offers`)
-- VALUES ('0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,0);