#query for new award modifications on x_upgrade_request
SET @job_id=(SELECT max(`id`) FROM `nor1_upg_db1_dal_us`.`statmod_controls`);
SET @prev_job_id=(SELECT max(`id`) FROM `nor1_upg_db1_dal_us`.`statmod_controls` WHERE `id` < @job_id+0);
SET @min_id = (SELECT `min_id_x_upgrade_request` FROM `nor1_upg_db1_dal_us`.`statmod_controls` WHERE `id` = @job_id+0);

SELECT `r`.*,`b`.`ext_booking_id`,`b`.`arrival`,`b`.`pet`,trim(lower(`g`.`email`))
FROM `nor1_upg_db1_dal_us`.`x_upgrade_request` AS `r`
INNER JOIN `nor1_upg_db1_dal_us`.`x_booking` AS `b`
    ON `r`.`booking_id` = `b`.`id`
LEFT JOIN `nor1_upg_db1_dal_us`.`x_guest` AS `g`
    ON `r`.`guest_id` = `g`.`id`
WHERE `r`.`id` < @min_id #to ensure mutual exclusivity from statmod.x_upgrade_request; necessary for correct arithmetic
AND `r`.`modified` > (SELECT `job_start` FROM `nor1_upg_db1_dal_us`.`statmod_controls` WHERE `id` = @prev_job_id+0)
AND `r`.`modified` <= (SELECT `job_start` FROM `nor1_upg_db1_dal_us`.`statmod_controls` WHERE `id` = @job_id+0);