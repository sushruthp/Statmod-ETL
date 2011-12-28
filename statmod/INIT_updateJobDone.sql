SET @job_id = (SELECT min(`id`) FROM `nor1_upg_db1_dal_us`.`statmod_controls` WHERE `done` = 'no');
UPDATE `nor1_upg_db1_dal_us`.`statmod_controls` SET `done` = 'yes' WHERE `id` = @job_id+0;