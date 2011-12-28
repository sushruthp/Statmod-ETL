#query for new extract system bookings received
SET @job_id = (SELECT min(`id`) FROM `nor1_upg_db1_dal_us`.`statmod_controls` WHERE `done` = 'no');
SET @min_id = (SELECT max(`min_id_x_extracts_archive`) FROM `nor1_upg_db1_dal_us`.`statmod_controls` WHERE `id` = @job_id+0);
SET @max_id = (SELECT max(`max_id_x_extracts_archive`) FROM `nor1_upg_db1_dal_us`.`statmod_controls` WHERE `id` = @job_id+0);

SELECT * FROM `upg_archive_2010_10_26`.`x_extracts_archive` WHERE `id` > @min_id+0 AND `id` <= @max_id+0;
SELECT * FROM `upg_archive_2010_11_26`.`x_extracts_archive` WHERE `id` > @min_id+0 AND `id` <= @max_id+0;
SELECT * FROM `upg_archive_2011_05_03`.`x_extracts_archive` WHERE `id` > @min_id+0 AND `id` <= @max_id+0;
SELECT * FROM `nor1_upg_db1_dal_us`.`x_extracts_archive` WHERE `id` > @min_id+0 AND `id` <= @max_id+0;