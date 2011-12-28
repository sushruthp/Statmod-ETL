#query for new extract system bookings received
SET @job_id = (SELECT max(`id`) FROM `nor1_upg_db1_dal_us`.`statmod_controls`);
SET @max_id = (SELECT max(`id`) FROM `nor1_upg_db1_dal_us`.`x_extracts_archive`);
SET @min_id = (SELECT max(`max_id_x_extracts_archive`) FROM `nor1_upg_db1_dal_us`.`statmod_controls`);

SELECT * FROM `nor1_upg_db1_dal_us`.`x_extracts_archive` WHERE `id` > @min_id+0 AND `id` <= @max_id+0;

UPDATE `nor1_upg_db1_dal_us`.`statmod_controls` 
SET `max_id_x_extracts_archive` = @max_id+0, 
    `min_id_x_extracts_archive` = (SELECT min(`id`) FROM `nor1_upg_db1_dal_us`.`x_extracts_archive` WHERE `id` > @min_id+0)
WHERE `id` = @job_id+0;