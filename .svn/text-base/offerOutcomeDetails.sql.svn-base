SET @max_id = (SELECT max(`id`) FROM `statmod`.`offer_outcome_details`);

INSERT INTO `statmod`.`offer_outcome_details` (
    `property_id`,
    `ext_booking_id`,
    `arrival`,
    `pet`,
    #begin guest history features
    `cumulative_exposures`,
    `cumulative_interests`,
    `cumulative_requests`,
    `cumulative_awards`,
    `last_exposure_interested`,
    `last_interest_committed`,
    `last_request_awarded`,
    `last_exposure_datetime`,
    `last_interest_datetime`,
    `last_committed_datetime`,
    `last_awarded_date`,
    `max_committed_spend_absolute`,
    `max_awarded_spend_absolute`,
    `loyalty_history`,
    `multiple_associated_names`,
    #end guest history features
    `cancelled`,
    `toro_interested_flag`,
    `toro_committed_flag`,
    `toro_awarded_flag`,
    `upgrade_matrix_id`,
    `from_category_code`,
    `from_category_id`,
    `to_category_id`,
    `from_category_name`,
    `to_category_name`,
    `from_room_size`,
    `to_room_size`,
    `upg_price`,
    `from_price`,
    `to_price`,
    `to_type`,
    `committed`,
    `awarded`,
    `upg_total_revenue`,
    `total_booking_price`,
    `length_of_stay`,
    `first_name`,
    `email`,
    `domain`,
    `adult_count`,
    `child_count`,
    `room_count`,
    `language`,
    `loyalty`,
    `rate_code`,
    `rate_tier`,
    `offer_set_size`,
    `property_booking_date`,
    `exposure_timestamp`,
    `modified`,
    `modified_after_id`
) SELECT
    `n`.`property_id`,
    `n`.`ext_booking_id`,
    `n`.`arrival`,
    `n`.`pet`,
    #begin guest history features
    `e`.`cumulative_exposures`,
    `e`.`cumulative_interests`,
    `e`.`cumulative_requests`,
    `e`.`cumulative_awards`,
    `e`.`last_exposure_interested`,
    `e`.`last_interest_committed`,
    `e`.`last_request_awarded`,
    `e`.`last_exposure_datetime`,
    `e`.`last_interest_datetime`,
    `e`.`last_committed_datetime`,
    `e`.`last_awarded_date`,
    `e`.`max_committed_spend_absolute`,
    `e`.`max_awarded_spend_absolute`,
    `e`.`loyalty_history`,
    `e`.`multiple_associated_names`,
    #end guest history features
    0, #cancelled
    `n`.`toro_interested_flag`,
    `n`.`toro_committed_flag`,
    `n`.`toro_awarded_flag`,
    `n`.`upgrade_matrix_id`,
    `e`.`from_category_code`,
    `n`.`from_category_id`,
    `n`.`to_category_id`,
    `n`.`from_category_name`,
    `n`.`to_category_name`,
    `n`.`from_room_size`,
    `n`.`to_room_size`,
    `n`.`upg_price`,
    `e`.`total_booking_price`/if(`e`.`length_of_stay`<=0,1,`e`.`length_of_stay`), #from_price
    `e`.`total_booking_price`/if(`e`.`length_of_stay`<=0,1,`e`.`length_of_stay`) + `n`.`implied_to_price`-`n`.`from_price`, #to_price
    `n`.`to_type`,
    `n`.`committed`,
    `n`.`awarded`,
    `n`.`upg_total_revenue`,
    `e`.`total_booking_price`,
    `e`.`length_of_stay`,
    `e`.`first_name`,
    `e`.`email`,
    `e`.`domain`,
    `e`.`adult_count`,
    `e`.`child_count`,
    `e`.`room_count`,
    `e`.`language`,
    `e`.`loyalty`,
    `e`.`rate_code`,
    `e`.`rate_tier`,
    `n`.`offer_set_size`,
    `e`.`property_booking_date`,
    `e`.`exposure_timestamp`,
    now(),
    @max_id+0
FROM `statmod`.`new_interest_offers` AS `n`
LEFT JOIN `statmod`.`exposed` AS `e`
    ON `n`.`property_id` = `e`.`property_id`
    AND `n`.`ext_booking_id` = `e`.`ext_booking_id`
    AND `n`.`arrival` = `e`.`arrival`
    AND `n`.`pet` = `e`.`pet`
ON DUPLICATE KEY UPDATE
    `toro_interested_flag` = `n`.`toro_interested_flag`,
    `toro_committed_flag` = `n`.`toro_committed_flag`,
    `toro_awarded_flag` = `n`.`toro_awarded_flag`,
    `committed` = `n`.`committed`,
    `awarded` = `n`.`awarded`,
    `upg_total_revenue` = `n`.`upg_total_revenue`,
    `modified` = now(),
    `modified_after_id` = @max_id+0;
    
#request updates
UPDATE `statmod`.`offer_outcome_details` AS `o`
LEFT JOIN `x_upgrade_request` AS `r`
    ON `o`.`property_id` = `r`.`property_id`
    AND `o`.`ext_booking_id` = `r`.`ext_booking_id`
    AND `o`.`arrival` = `r`.`arrival`
    AND `o`.`pet` = `r`.`pet`
    AND `o`.`to_category_id` = `r`.`to_category_id`
SET `o`.`toro_committed_flag` = if(`r`.`upgrade_type` = 'toro', 1, 0),
    `o`.`toro_awarded_flag` = if(`r`.`upgrade_type` = 'toro', 1, 0)*if(`r`.`awarded` = 'yes', 1, 0),
    `o`.`committed` = 1,
    `o`.`awarded` = if(`r`.`awarded` = 'yes', 1, 0),
    `o`.`upg_price` = `r`.`price`, #update with actual price requested (applies to matrix offers only)
    `o`.`upg_total_revenue` = `r`.`total`,
    `o`.`modified` = now(),
    `o`.`modified_after_id` = @max_id+0
WHERE `r`.`property_id` IS NOT NULL;

#award updates
UPDATE `statmod`.`offer_outcome_details` AS `o`
LEFT JOIN `statmod`.`x_upgrade_request_award` AS `a`
    ON `o`.`property_id` = `a`.`property_id`
    AND `o`.`ext_booking_id` = `a`.`ext_booking_id`
    AND `o`.`arrival` = `a`.`arrival`
    AND `o`.`pet` = `a`.`pet`
    AND `o`.`to_category_id` = `a`.`to_category_id`
SET `o`.`awarded` = if(`a`.`awarded` = 'yes', 1, 0),
    `o`.`modified` = now(),
    `o`.`modified_after_id` = @max_id+0
WHERE `a`.`property_id` IS NOT NULL;

#cancellations
UPDATE `statmod`.`offer_outcome_details` AS `o`
LEFT JOIN `statmod`.`x_booking_cancellations` AS `c`
    ON `o`.`property_id` = `c`.`property_id`
    AND `o`.`ext_booking_id` = `c`.`ext_booking_id`
    AND `o`.`arrival` = `c`.`arrival`
    AND `o`.`pet` = `c`.`pet`
SET `o`.`cancelled` = if(`c`.`upgrade_status` = 'upgrade_cancelled',1,2)
WHERE `c`.`property_id` IS NOT NULL;