#query for new cancellation modifications on x_booking
SET @job_id=(SELECT max(`id`) from `nor1_upg_db1_dal_us`.`statmod_controls`);
SET @prev_job_id=(SELECT max(`id`) from `nor1_upg_db1_dal_us`.`statmod_controls` WHERE `id` < @job_id);

SELECT *
FROM `nor1_upg_db1_dal_us`.`x_booking` 
WHERE `modified` >= (SELECT `job_start` FROM `nor1_upg_db1_dal_us`.`statmod_controls` WHERE `id` = @prev_job_id)
AND `modified` < (SELECT `job_start` FROM `nor1_upg_db1_dal_us`.`statmod_controls` WHERE `id` = @job_id)
AND `upgrade_status` in('upgrade_cancelled','booking_cancelled');
