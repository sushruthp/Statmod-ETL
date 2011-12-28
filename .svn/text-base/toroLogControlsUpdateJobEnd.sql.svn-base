SET @job_id = (SELECT max(`id`) FROM `analytics`.`torolog_controls`);
UPDATE `analytics`.`torolog_controls` SET `job_end` = now() WHERE `id` = @job_id;