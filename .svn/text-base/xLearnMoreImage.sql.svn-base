#query for new LMI system bookings exposed
SET @job_id = (SELECT max(`id`) FROM `nor1_upg_db1_dal_us`.`statmod_controls`);
SET @max_id = (SELECT max(`id`) FROM `nor1_upg_db1_dal_us`.`x_learn_more_image`);
SET @min_id = (SELECT max(`max_id_x_learn_more_image`) FROM `nor1_upg_db1_dal_us`.`statmod_controls`);

SELECT * FROM `nor1_upg_db1_dal_us`.`x_learn_more_image` WHERE `id` > @min_id+0 AND `id` <= @max_id+0 AND `displayed` = 1;

UPDATE `nor1_upg_db1_dal_us`.`statmod_controls` 
SET `max_id_x_learn_more_image` = @max_id+0, 
    `min_id_x_learn_more_image` = (SELECT min(`id`) FROM `nor1_upg_db1_dal_us`.`x_learn_more_image` WHERE `id` > @min_id+0)
WHERE `id` = @job_id+0;