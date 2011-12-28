#query for new nor1 email system bookings "exposed" (sent an email)
SET @job_id = (SELECT max(`id`) FROM `nor1_upg_db1_dal_us`.`statmod_controls`);
SET @max_id = (SELECT max(`id`) FROM `nor1_upg_db1_dal_us`.`x_email_queue`);
SET @min_id = (SELECT max(`max_id_x_email_queue`) FROM `nor1_upg_db1_dal_us`.`statmod_controls`);

SELECT * FROM `nor1_upg_db1_dal_us`.`x_email_queue` WHERE `id` > @min_id+0 AND `id` <= @max_id+0 AND `type` = 'g-offer' AND `status` = 'done';

UPDATE `nor1_upg_db1_dal_us`.`statmod_controls` 
SET `max_id_x_email_queue` = @max_id+0, 
    `min_id_x_email_queue` = (SELECT min(`id`) FROM `nor1_upg_db1_dal_us`.`x_email_queue` WHERE `id` > @min_id+0)
WHERE `id` = @job_id+0;