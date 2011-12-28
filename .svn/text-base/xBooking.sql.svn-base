#query for new interests
SET @job_id = (SELECT max(`id`) FROM `nor1_upg_db1_dal_us`.`statmod_controls`);
SET @max_id = (SELECT max(`id`) FROM `nor1_upg_db1_dal_us`.`x_booking`);
SET @min_id = (SELECT max(`max_id_x_booking`) FROM `nor1_upg_db1_dal_us`.`statmod_controls`);

SELECT `b`.*,trim(lower(`g`.`email`)) 
FROM `nor1_upg_db1_dal_us`.`x_booking` AS `b` 
LEFT JOIN `nor1_upg_db1_dal_us`.`x_guest` AS `g`
    ON `b`.`guest_id` = `g`.`id`
WHERE `b`.`id` > @min_id+0 AND `b`.`id` <= @max_id+0;

UPDATE `nor1_upg_db1_dal_us`.`statmod_controls` 
SET `max_id_x_booking` = @max_id+0, 
    `min_id_x_booking` = (SELECT min(`id`) FROM `nor1_upg_db1_dal_us`.`x_booking` WHERE `id` > @min_id+0)
WHERE `id` = @job_id+0;