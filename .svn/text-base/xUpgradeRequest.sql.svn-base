#query for new requests
SET @job_id = (SELECT max(`id`) FROM `nor1_upg_db1_dal_us`.`statmod_controls`);
SET @max_id = (SELECT max(`id`) FROM `nor1_upg_db1_dal_us`.`x_upgrade_request`);
SET @min_id = (SELECT max(`max_id_x_upgrade_request`) FROM `nor1_upg_db1_dal_us`.`statmod_controls`);

SELECT `r`.*,`b`.`ext_booking_id`,`b`.`arrival`,`b`.`pet`,trim(lower(`g`.`email`))
FROM `nor1_upg_db1_dal_us`.`x_upgrade_request` AS `r`
INNER JOIN `nor1_upg_db1_dal_us`.`x_booking` AS `b`
    ON `r`.`booking_id` = `b`.`id`
LEFT JOIN `nor1_upg_db1_dal_us`.`x_guest` AS `g`
    ON `r`.`guest_id` = `g`.`id`
WHERE `r`.`id` >= @min_id+0 AND `r`.`id` < @max_id+0;

UPDATE `nor1_upg_db1_dal_us`.`statmod_controls` 
SET `max_id_x_upgrade_request` = @max_id+0, 
    `min_id_x_upgrade_request` = (SELECT min(`id`) FROM `nor1_upg_db1_dal_us`.`x_upgrade_request` WHERE `id` > @min_id+0)
WHERE `id` = @job_id+0;