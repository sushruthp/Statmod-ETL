#Email filter table
DROP TABLE IF EXISTS `statmod`.`filtered_emails`;

CREATE TABLE `statmod`.`filtered_emails` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `key` enum('email','domain') NOT NULL,
    `value` varchar(100) NOT NULL,
    `created` timestamp NULL default CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `key` (`key`),
    KEY `value` (`value`),
    KEY `key_value` (`key`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `statmod`.`filtered_emails` (`key`, `value`) VALUES 
('domain','nor1.com'),
('email','onyougo@gmail.com'),
('email','weaverl@ihg.com'),
('email','qa.automated.test@ihg.com'),
('email','qa.automated@ihg.com'),
('email','sonicdeath99@hotmail.com'),
('email','cowloadtest@strongmail.ihg.com'),
('email','swahi@mangoriver.com'),
('email','wahi1@yahoo.com'),
('email','test@gmail.com'),
('email','global.web.testing@hilton.com'),
('domain','testing.com'),
('domain','loadtest.com'),
('domain','test.com'),
('domain','prueba.com')
;

-- from 2011-10-07 sasprod D:\Prod\SASCode\Reporting_MySQL_Extract_Rename_Prod2.sas:
-- if guest_email ne "qa.automated.test@ihg.com";
-- if guest_email ne "qa.automated@ihg.com";
-- if guest_email ne "weaverl@ihg.com";
-- if guest_email ne "sonicdeath99@hotmail.com";
-- if guest_email ne "cowloadtest@strongmail.ihg.com";
-- if upcase(trim(guest_email)) ne "SWAHI@MANGORIVER.COM";
-- if upcase(trim(guest_email)) ne "WAHI1@YAHOO.COM";
-- if upcase(trim(guest_email)) ne "ONYOUGO@GMAIL.COM";
-- if index(upcase(EXT_BOOKING_ID),"TEST") = 0;
-- if index(upcase(guest_email),"NOR1.COM") = 0;
-- if guest_email ne "test@gmail.com";
-- if guest_email ne "global.web.testing@hilton.com";
-- if guest_email ne "TEST1975@TESTING.COM";
-- if index(guest_email,"@loadtest.com") = 0;
-- if index(guest_email,"@test.com") = 0;
-- if index(guest_email,"@prueba.com") = 0;
-- if upcase(guest_first_name) ne "TEST";
-- if upcase(guest_last_name) ne "TEST";