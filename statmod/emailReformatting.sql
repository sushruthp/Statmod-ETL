#emailReformatting
UPDATE `statmod`.`x_learn_more_image` SET `gem` = trim(lower(`gem`));
UPDATE `statmod`.`x_email_queue` SET `mail_to` = trim(lower(`mail_to`));

ALTER TABLE `statmod`.`x_learn_more_image` ADD KEY `email` (`gem`);
ALTER TABLE `statmod`.`x_email_queue` ADD KEY `email` (mail_to(100));