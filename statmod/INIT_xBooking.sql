#query for new interests
SET @job_id = (SELECT min(`id`) FROM `nor1_upg_db1_dal_us`.`statmod_controls` WHERE `done` = 'no');
SET @min_id = (SELECT max(`min_id_x_booking`) FROM `nor1_upg_db1_dal_us`.`statmod_controls` WHERE `id` = @job_id+0);
SET @max_id = (SELECT max(`max_id_x_booking`) FROM `nor1_upg_db1_dal_us`.`statmod_controls` WHERE `id` = @job_id+0);

SELECT
`b`.`ID`,
`b`.`SESSION_ID`,
`b`.`GUEST_ID`,
`b`.`GUEST_MODIFIED`,
`b`.`MANAGER_MODIFIED`,
`b`.`CREATED`,
`b`.`MODIFIED`,
`b`.`CREATED_USER_ID`,
`b`.`MODIFIED_USER_ID`,
`b`.`EXT_BOOKING_ID`,
`b`.`SOURCE_ID`,
`b`.`CHAIN_ID`,
`b`.`PROPERTY_ID`,
`b`.`CATEGORY_ID`,
`b`.`ROOM_ID`,
`b`.`EXT_ROOM_CD`,
`b`.`UPGRADE_MATRIX_ID`,
'standard',
`b`.`CONDITION_ID`,
`b`.`CURRENCY`,
`b`.`PRICE`,
`b`.`ARRIVAL`,
`b`.`DEPARTURE`,
`b`.`NIGHTS`,
`b`.`ADULTS`,
`b`.`CHILDREN`,
`b`.`LOY_CD`,
`b`.`RATE_CD`,
`b`.`TIER_CD`,
`b`.`CHANNEL_CD`,
`b`.`REMINDER_EMAIL`,
`b`.`TESTFLAG`,
`b`.`UPGRADE_STATUS`,
`b`.`NO_OFFER`,
`b`.`HAS_AGENCY`,
`b`.`COMMENTS`,
`b`.`changed_by_user_id`,
`b`.`changed_date`,
`b`.`PID`,
`b`.`PET`,
`b`.`ROOMS`,
`b`.`SENT_ALERT_REMINDER`,
trim(lower(`g`.`email`))
FROM `upg_archive_2010_10_26`.`x_booking` AS `b`
LEFT JOIN `upg_archive_2010_10_26`.`x_guest` AS `g`
    ON `b`.`guest_id` = `g`.`id`
WHERE `b`.`id` > @min_id+0 AND `b`.`id` <= @max_id+0;

SELECT
`b`.`ID`,
`b`.`SESSION_ID`,
`b`.`GUEST_ID`,
`b`.`GUEST_MODIFIED`,
`b`.`MANAGER_MODIFIED`,
`b`.`CREATED`,
`b`.`MODIFIED`,
`b`.`CREATED_USER_ID`,
`b`.`MODIFIED_USER_ID`,
`b`.`EXT_BOOKING_ID`,
`b`.`SOURCE_ID`,
`b`.`CHAIN_ID`,
`b`.`PROPERTY_ID`,
`b`.`CATEGORY_ID`,
`b`.`ROOM_ID`,
`b`.`EXT_ROOM_CD`,
`b`.`UPGRADE_MATRIX_ID`,
'standard',
`b`.`CONDITION_ID`,
`b`.`CURRENCY`,
`b`.`PRICE`,
`b`.`ARRIVAL`,
`b`.`DEPARTURE`,
`b`.`NIGHTS`,
`b`.`ADULTS`,
`b`.`CHILDREN`,
`b`.`LOY_CD`,
`b`.`RATE_CD`,
`b`.`TIER_CD`,
`b`.`CHANNEL_CD`,
`b`.`REMINDER_EMAIL`,
`b`.`TESTFLAG`,
`b`.`UPGRADE_STATUS`,
`b`.`NO_OFFER`,
`b`.`HAS_AGENCY`,
`b`.`COMMENTS`,
`b`.`changed_by_user_id`,
`b`.`changed_date`,
`b`.`PID`,
`b`.`PET`,
`b`.`ROOMS`,
`b`.`SENT_ALERT_REMINDER`,
trim(lower(`g`.`email`))
FROM `upg_archive_2010_11_26`.`x_booking` AS `b`
LEFT JOIN `upg_archive_2010_11_26`.`x_guest` AS `g`
    ON `b`.`guest_id` = `g`.`id`
WHERE `b`.`id` > @min_id+0 AND `b`.`id` <= @max_id+0;

SELECT
`b`.`ID`,
`b`.`SESSION_ID`,
`b`.`GUEST_ID`,
`b`.`GUEST_MODIFIED`,
`b`.`MANAGER_MODIFIED`,
`b`.`CREATED`,
`b`.`MODIFIED`,
`b`.`CREATED_USER_ID`,
`b`.`MODIFIED_USER_ID`,
`b`.`EXT_BOOKING_ID`,
`b`.`SOURCE_ID`,
`b`.`CHAIN_ID`,
`b`.`PROPERTY_ID`,
`b`.`CATEGORY_ID`,
`b`.`ROOM_ID`,
`b`.`EXT_ROOM_CD`,
`b`.`UPGRADE_MATRIX_ID`,
'standard',
`b`.`CONDITION_ID`,
`b`.`CURRENCY`,
`b`.`PRICE`,
`b`.`ARRIVAL`,
`b`.`DEPARTURE`,
`b`.`NIGHTS`,
`b`.`ADULTS`,
`b`.`CHILDREN`,
`b`.`LOY_CD`,
`b`.`RATE_CD`,
`b`.`TIER_CD`,
`b`.`CHANNEL_CD`,
`b`.`REMINDER_EMAIL`,
`b`.`TESTFLAG`,
`b`.`UPGRADE_STATUS`,
`b`.`NO_OFFER`,
`b`.`HAS_AGENCY`,
`b`.`COMMENTS`,
`b`.`changed_by_user_id`,
`b`.`changed_date`,
`b`.`PID`,
`b`.`PET`,
`b`.`ROOMS`,
`b`.`SENT_ALERT_REMINDER`,
trim(lower(`g`.`email`))
FROM `upg_archive_2011_05_03`.`x_booking` AS `b`
LEFT JOIN `upg_archive_2011_05_03`.`x_guest` AS `g`
    ON `b`.`guest_id` = `g`.`id`
WHERE `b`.`id` > @min_id+0 AND `b`.`id` <= @max_id+0;

SELECT `b`.*,trim(lower(`g`.`email`)) 
FROM `nor1_upg_db1_dal_us`.`x_booking` AS `b` 
LEFT JOIN `nor1_upg_db1_dal_us`.`x_guest` AS `g`
    ON `b`.`guest_id` = `g`.`id`
WHERE `b`.`id` > @min_id+0 AND `b`.`id` <= @max_id+0;