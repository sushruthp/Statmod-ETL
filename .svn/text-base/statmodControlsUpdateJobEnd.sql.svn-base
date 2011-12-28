SET @job_id = (SELECT max(`id`) FROM `nor1_upg_db1_dal_us`.`statmod_controls`);
UPDATE `nor1_upg_db1_dal_us`.`statmod_controls` SET `job_end` = now() WHERE `id` = @job_id;
