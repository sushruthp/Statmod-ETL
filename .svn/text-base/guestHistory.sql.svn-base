#update guest history table

#exposure inserts and updates
INSERT INTO `statmod`.`guest_history` (
    `email`,
    `domain`,
    `cumulative_exposures`,
    `loyalty_history`,
    `first_name_at_last_exposure`,
    `last_exposure_datetime`,
    `last_exposure_property_id`,
    `last_exposure_ext_booking_id`
) SELECT
    `e`.`email`,
    `e`.`domain`,
    1,
    `e`.`loyalty`,
    `e`.`first_name`,
    `e`.`exposure_timestamp`,
    `e`.`property_id`,
    `e`.`ext_booking_id`
FROM `statmod`.`exposed` AS `e`
ON DUPLICATE KEY UPDATE
    `statmod`.`guest_history`.`cumulative_exposures` = if(`e`.`property_id`=`statmod`.`guest_history`.`last_exposure_property_id`,if(`e`.`ext_booking_id`=`statmod`.`guest_history`.`last_exposure_ext_booking_id`,`statmod`.`guest_history`.`cumulative_exposures`,`statmod`.`guest_history`.`cumulative_exposures`+1),`statmod`.`guest_history`.`cumulative_exposures`+1),
    `statmod`.`guest_history`.`loyalty_history` = if(`statmod`.`guest_history`.`loyalty_history`=1,1,if(trim(`e`.`loyalty`)='',0,1)),
    `statmod`.`guest_history`.`first_name_at_last_exposure` = if(trim(`e`.`first_name`)='',`statmod`.`guest_history`.`first_name_at_last_exposure`,`e`.`first_name`),
    `statmod`.`guest_history`.`last_exposure_datetime` = if(`e`.`property_id`=`statmod`.`guest_history`.`last_exposure_property_id`,if(`e`.`ext_booking_id`=`statmod`.`guest_history`.`last_exposure_ext_booking_id`,`statmod`.`guest_history`.`last_exposure_datetime`,`e`.`exposure_timestamp`),`e`.`exposure_timestamp`),
    `statmod`.`guest_history`.`last_exposure_property_id` = `e`.`property_id`,
    `statmod`.`guest_history`.`last_exposure_ext_booking_id` = `e`.`ext_booking_id`,
    `statmod`.`guest_history`.`multiple_associated_names` = if(`e`.`first_name` = `statmod`.`guest_history`.`first_name_at_last_exposure`,0,1)
;

#interest updates
UPDATE `statmod`.`guest_history` AS `h`
RIGHT JOIN `statmod`.`x_booking` AS `b`
    ON `b`.`email` = `h`.`email`
SET
    `h`.`cumulative_interests` = `h`.`cumulative_interests` + 1,
    `h`.`last_interest_datetime` = `b`.`created`,
    `h`.`last_interested_property_id` = `b`.`property_id`,
    `h`.`last_interested_ext_booking_id` = `b`.`ext_booking_id`,
    `h`.`last_exposure_interested` = if(`b`.`property_id`=`h`.`last_exposure_property_id`,if(`b`.`ext_booking_id`=`h`.`last_exposure_ext_booking_id`,1,0),0)
WHERE `b`.`email` = `h`.`email`
    AND (`h`.`last_interested_property_id` != `b`.`property_id` OR `h`.`last_interested_ext_booking_id` != `b`.`ext_booking_id`)
;

#commit updates
UPDATE `statmod`.`guest_history` AS `h`
RIGHT JOIN `statmod`.`x_upgrade_request` AS `r`
    ON `r`.`email` = `h`.`email`
SET
    `h`.`cumulative_requests` = `h`.`cumulative_requests` + 1,
    `h`.`last_committed_datetime` = `r`.`created`,
    `h`.`last_committed_property_id` = `r`.`property_id`,
    `h`.`last_committed_ext_booking_id` = `r`.`ext_booking_id`,
    `h`.`last_interest_committed` = if(`r`.`property_id`=`h`.`last_interested_property_id`,if(`r`.`ext_booking_id`=`h`.`last_interested_ext_booking_id`,1,0),0),
    `h`.`max_committed_spend_absolute` = if(`h`.`max_committed_spend_absolute` IS NULL, `r`.`total`, if(`r`.`total` < `h`.`max_committed_spend_absolute`,`h`.`max_committed_spend_absolute`,`r`.`total`))
WHERE `r`.`email` = `h`.`email`
    AND (`h`.`last_committed_property_id` != `r`.`property_id` OR `h`.`last_committed_ext_booking_id` != `r`.`ext_booking_id`)
;

#award updates
UPDATE `statmod`.`guest_history` AS `h`
RIGHT JOIN `statmod`.`x_upgrade_request` AS `r`
    ON `r`.`email` = `h`.`email`
SET
    `h`.`cumulative_awards` = `h`.`cumulative_awards`+1,
    `h`.`last_awarded_date` = `r`.`arrival`,
    `h`.`last_awarded_property_id` = `r`.`property_id`,
    `h`.`last_awarded_ext_booking_id` = `r`.`ext_booking_id`,
    `h`.`last_request_awarded` = if(`r`.`property_id`=`h`.`last_committed_property_id`,if(`r`.`ext_booking_id`=`h`.`last_committed_ext_booking_id`,1,0),0),
    `h`.`max_awarded_spend_absolute` = if(`h`.`max_awarded_spend_absolute` IS NULL, `r`.`total`, if(`r`.`total` < `h`.`max_awarded_spend_absolute`,`h`.`max_awarded_spend_absolute`,`r`.`total`))
WHERE `r`.`email` = `h`.`email`
    AND `r`.`awarded` = 'yes'
    AND (`h`.`last_awarded_property_id` != `r`.`property_id` OR `h`.`last_awarded_ext_booking_id` != `r`.`ext_booking_id`)
;

#additional award updates
UPDATE `statmod`.`guest_history` AS `h`
RIGHT JOIN `statmod`.`x_upgrade_request_award` AS `r`
    ON `r`.`email` = `h`.`email`
SET
    `h`.`cumulative_awards` = `h`.`cumulative_awards`+1,
    `h`.`last_awarded_date` = `r`.`arrival`,
    `h`.`last_awarded_property_id` = `r`.`property_id`,
    `h`.`last_awarded_ext_booking_id` = `r`.`ext_booking_id`,
    `h`.`last_request_awarded` = if(`r`.`property_id`=`h`.`last_committed_property_id`,if(`r`.`ext_booking_id`=`h`.`last_committed_ext_booking_id`,1,0),0),
    `h`.`max_awarded_spend_absolute` = if(`h`.`max_awarded_spend_absolute` IS NULL, `r`.`total`, if(`r`.`total` < `h`.`max_awarded_spend_absolute`,`h`.`max_awarded_spend_absolute`,`r`.`total`))
WHERE `r`.`email` = `h`.`email`
    AND `r`.`awarded` = 'yes'
    AND (`h`.`last_awarded_property_id` != `r`.`property_id` OR `h`.`last_awarded_ext_booking_id` != `r`.`ext_booking_id`)
;