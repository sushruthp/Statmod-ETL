#use displayed category names
DROP TABLE IF EXISTS `statmod`.`display_names`;

CREATE TABLE `statmod`.`display_names` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `category_id` int(11) NOT NULL,
    `display_name` varchar(255) NOT NULL default '',
    `room_size` int(11) unsigned default NULL,
    `created` timestamp NULL default CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    UNIQUE KEY `category_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `statmod`.`display_names` (
    `category_id`,
    `display_name`
) SELECT
    trim(substring(`key`,15)),
    `value`
FROM `statmod`.`y_dic_nor1guest`
WHERE locate('category.name.',`key`) > 0 
    AND trim(`value`) != ''
    AND `language` in('en','EN','eN','En')
ON DUPLICATE KEY UPDATE
    `display_name` = `value`;

INSERT INTO `statmod`.`display_names` (
    `category_id`,
    `room_size`
) SELECT 
    trim(substring(`key`,18)), CASE 
        WHEN substring(`value`,1,1) NOT in('0','1','2','3','4','5','6','7','8','9') THEN NULL
        WHEN substring(`value`,2,1) NOT in('0','1','2','3','4','5','6','7','8','9') THEN substring(`value`,1,1)
        WHEN substring(`value`,3,1) NOT in('0','1','2','3','4','5','6','7','8','9') THEN substring(`value`,2,1)
        WHEN substring(`value`,4,1) NOT in('0','1','2','3','4','5','6','7','8','9') THEN substring(`value`,3,1)
        WHEN substring(`value`,5,1) NOT in('0','1','2','3','4','5','6','7','8','9') THEN substring(`value`,4,1)
    ELSE NULL END
FROM `statmod`.`y_dic_nor1guest`
WHERE locate('category.nameext.',`key`) > 0 AND trim(`value`) != ''
ON DUPLICATE KEY UPDATE
    `room_size` = CASE 
        WHEN substring(`value`,1,1) NOT in('0','1','2','3','4','5','6','7','8','9') THEN NULL
        WHEN substring(`value`,2,1) NOT in('0','1','2','3','4','5','6','7','8','9') THEN substring(`value`,1,1)
        WHEN substring(`value`,3,1) NOT in('0','1','2','3','4','5','6','7','8','9') THEN substring(`value`,1,2)
        WHEN substring(`value`,4,1) NOT in('0','1','2','3','4','5','6','7','8','9') THEN substring(`value`,1,3)
        WHEN substring(`value`,5,1) NOT in('0','1','2','3','4','5','6','7','8','9') THEN substring(`value`,1,4)
    ELSE NULL END;

ALTER TABLE `statmod`.`y_category` ADD COLUMN `room_size` int(11) unsigned default NULL AFTER `name`;

UPDATE `statmod`.`y_category` AS `c`
LEFT JOIN `statmod`.`display_names` AS `d`
    ON `c`.`id` = `d`.`category_id`
SET 
    `c`.`name` = `d`.`display_name`,
    `c`.`room_size` = `d`.`room_size`
WHERE `c`.`id` = `d`.`category_id`;

ALTER TABLE `statmod`.`y_room` ADD COLUMN `room_size` int(11) unsigned default NULL AFTER `category_id`;

UPDATE `statmod`.`y_room` AS `r`
LEFT JOIN `statmod`.`display_names` AS `d`
    ON `r`.`category_id` = `d`.`category_id`
SET 
    `r`.`room_size` = `d`.`room_size`,
    `r`.`name` = `d`.`display_name`
WHERE `r`.`category_id` = `d`.`category_id`;