# Control table for statmod

DROP TABLE IF EXISTS `nor1_upg_db1_dal_us`.`statmod_controls`;

CREATE TABLE `nor1_upg_db1_dal_us`.`statmod_controls` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `job_start` datetime default NULL,
    `job_end` datetime default NULL,
    `min_id_x_learn_more_image` int(11) default NULL,
    `max_id_x_learn_more_image` int(11) default NULL,
    `min_id_x_extracts_archive` int(11) default NULL,
    `max_id_x_extracts_archive` int(11) default NULL,
    `min_id_x_email_queue` int(11) default NULL,
    `max_id_x_email_queue` int(11) default NULL,
    `min_id_x_booking` int(11) default NULL,
    `max_id_x_booking` int(11) default NULL,
    `min_id_x_upgrade_request` int(11) default NULL,
    `max_id_x_upgrade_request` int(11) default NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- INSERT INTO `nor1_upg_db1_dal_us`.`statmod_controls` VALUES (1,'2011-11-10 16:02:56','2011-11-10 16:02:56',194000001,195000000,29037721,29244982,6745838,6769691,8037362,8065954,3934301,3945856);