#query for new nor1 email system bookings "exposed" (sent an email)
SET @job_id = (SELECT min(`id`) FROM `nor1_upg_db1_dal_us`.`statmod_controls` WHERE `done` = 'no');
SET @min_id = (SELECT max(`min_id_x_email_queue`) FROM `nor1_upg_db1_dal_us`.`statmod_controls` WHERE `id` = @job_id+0);
SET @max_id = (SELECT max(`max_id_x_email_queue`) FROM `nor1_upg_db1_dal_us`.`statmod_controls` WHERE `id` = @job_id+0);

SELECT 
`ID`,
`MAIL_TO`,
`SUBJECT`,
NULL,
`CREATED`,
`TIME_TO_SEND`,
`TYPE`,
`SENT`,
`STATUS`,
`BOOKING_ID`,
`PROPERTY_ID`,
`CHAIN_ID`,
`OPENED`,
`OPENED_ID`,
`EXT_BOOKING_ID`
FROM `upg_archive_2010_10_26`.`x_email_queue` WHERE `id` > @min_id+0 AND `id` <= @max_id+0
AND `type` = 'g-offer' AND `status` = 'done';

SELECT 
`ID`,
`MAIL_TO`,
`SUBJECT`,
NULL,
`CREATED`,
`TIME_TO_SEND`,
`TYPE`,
`SENT`,
`STATUS`,
`BOOKING_ID`,
`PROPERTY_ID`,
`CHAIN_ID`,
`OPENED`,
`OPENED_ID`,
`EXT_BOOKING_ID`
FROM `upg_archive_2010_11_26`.`x_email_queue` WHERE `id` > @min_id+0 AND `id` <= @max_id+0
AND `type` = 'g-offer' AND `status` = 'done';

SELECT 
`ID`,
`MAIL_TO`,
`SUBJECT`,
NULL,
`CREATED`,
`TIME_TO_SEND`,
`TYPE`,
`SENT`,
`STATUS`,
`BOOKING_ID`,
`PROPERTY_ID`,
`CHAIN_ID`,
`OPENED`,
`OPENED_ID`,
`EXT_BOOKING_ID`
FROM `upg_archive_2011_05_03`.`x_email_queue` WHERE `id` > @min_id+0 AND `id` <= @max_id+0
AND `type` = 'g-offer' AND `status` = 'done';

SELECT 
`ID`,
`MAIL_TO`,
`SUBJECT`,
NULL,
`CREATED`,
`TIME_TO_SEND`,
`TYPE`,
`SENT`,
`STATUS`,
`BOOKING_ID`,
`PROPERTY_ID`,
`CHAIN_ID`,
`OPENED`,
`OPENED_ID`,
`EXT_BOOKING_ID`
FROM `nor1_upg_db1_dal_us`.`x_email_queue` WHERE `id` > @min_id+0 AND `id` <= @max_id+0
AND `type` = 'g-offer' AND `status` = 'done';