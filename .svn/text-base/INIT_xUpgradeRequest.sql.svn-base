#query for new requests
SET @job_id = (SELECT min(`id`) FROM `nor1_upg_db1_dal_us`.`statmod_controls` WHERE `done` = 'no');
SET @min_id = (SELECT max(`min_id_x_upgrade_request`) FROM `nor1_upg_db1_dal_us`.`statmod_controls` WHERE `id` = @job_id+0);
SET @max_id = (SELECT max(`max_id_x_upgrade_request`) FROM `nor1_upg_db1_dal_us`.`statmod_controls` WHERE `id` = @job_id+0);

SELECT
`r`.`ID`,
`r`.`BOOKING_ID`,
`r`.`PROPERTY_ID`,
`r`.`FROM_ROOM_ID`,
`r`.`FROM_CATEGORY_ID`,
`r`.`TO_CATEGORY_ID`,
`r`.`UPGRADE_ID`,
'standard',
`r`.`AWARDED`,
`r`.`PRICE`,
`r`.`TOTAL`,
NULL,
`r`.`CREATED`,
`r`.`MODIFIED`,
`r`.`CREATED_USER_ID`,
`r`.`MODIFIED_USER_ID`,
`r`.`GUEST_MODIFIED`,
`r`.`MANAGER_MODIFIED`,
`r`.`GUEST_ID`,
`r`.`DISPL_POS`,
`r`.`changed_by_user_id`,
`r`.`changed_date`,
`b`.`ext_booking_id`,`b`.`arrival`,`b`.`pet`,
trim(lower(`g`.`email`))
FROM `upg_archive_2010_10_26`.`x_upgrade_request` AS `r`
INNER JOIN `upg_archive_2010_10_26`.`x_booking` AS `b` ON `r`.`booking_id` = `b`.`id`
LEFT JOIN `upg_archive_2010_10_26`.`x_guest` AS `g` ON `r`.`guest_id` = `g`.`id`
WHERE `r`.`id` > @min_id+0 AND `r`.`id` <= @max_id+0;

SELECT
`r`.`ID`,
`r`.`BOOKING_ID`,
`r`.`PROPERTY_ID`,
`r`.`FROM_ROOM_ID`,
`r`.`FROM_CATEGORY_ID`,
`r`.`TO_CATEGORY_ID`,
`r`.`UPGRADE_ID`,
'standard',
`r`.`AWARDED`,
`r`.`PRICE`,
`r`.`TOTAL`,
NULL,
`r`.`CREATED`,
`r`.`MODIFIED`,
`r`.`CREATED_USER_ID`,
`r`.`MODIFIED_USER_ID`,
`r`.`GUEST_MODIFIED`,
`r`.`MANAGER_MODIFIED`,
`r`.`GUEST_ID`,
`r`.`DISPL_POS`,
`r`.`changed_by_user_id`,
`r`.`changed_date`,
`b`.`ext_booking_id`,`b`.`arrival`,`b`.`pet`,
trim(lower(`g`.`email`))
FROM `upg_archive_2010_11_26`.`x_upgrade_request` AS `r`
INNER JOIN `upg_archive_2010_11_26`.`x_booking` AS `b` ON `r`.`booking_id` = `b`.`id`
LEFT JOIN `upg_archive_2010_11_26`.`x_guest` AS `g` ON `r`.`guest_id` = `g`.`id`
WHERE `r`.`id` > @min_id+0 AND `r`.`id` <= @max_id+0;

SELECT 
`r`.`ID`,
`r`.`BOOKING_ID`,
`r`.`PROPERTY_ID`,
`r`.`FROM_ROOM_ID`,
`r`.`FROM_CATEGORY_ID`,
`r`.`TO_CATEGORY_ID`,
`r`.`UPGRADE_ID`,
'standard',
`r`.`AWARDED`,
`r`.`PRICE`,
`r`.`TOTAL`,
NULL,
`r`.`CREATED`,
`r`.`MODIFIED`,
`r`.`CREATED_USER_ID`,
`r`.`MODIFIED_USER_ID`,
`r`.`GUEST_MODIFIED`,
`r`.`MANAGER_MODIFIED`,
`r`.`GUEST_ID`,
`r`.`DISPL_POS`,
`r`.`changed_by_user_id`,
`r`.`changed_date`,
`b`.`ext_booking_id`,`b`.`arrival`,`b`.`pet`,
trim(lower(`g`.`email`))
FROM `upg_archive_2011_05_03`.`x_upgrade_request` AS `r`
INNER JOIN `upg_archive_2011_05_03`.`x_booking` AS `b` ON `r`.`booking_id` = `b`.`id`
LEFT JOIN `upg_archive_2011_05_03`.`x_guest` AS `g` ON `r`.`guest_id` = `g`.`id`
WHERE `r`.`id` > @min_id+0 AND `r`.`id` <= @max_id+0;

SELECT `r`.*,
`b`.`ext_booking_id`,`b`.`arrival`,`b`.`pet`,
trim(lower(`g`.`email`))
FROM `nor1_upg_db1_dal_us`.`x_upgrade_request` AS `r`
INNER JOIN `nor1_upg_db1_dal_us`.`x_booking` AS `b` ON `r`.`booking_id` = `b`.`id`
LEFT JOIN `nor1_upg_db1_dal_us`.`x_guest` AS `g` ON `r`.`guest_id` = `g`.`id`
WHERE `r`.`id` > @min_id+0 AND `r`.`id` <= @max_id+0;