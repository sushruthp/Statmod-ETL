#!/bin/bash
mysql -h$sas_db_host -u$sas_db_uname -p$sas_db_pwd -B -e "\. ~/statmod/statmodControlsInsertNewJob.sql" &> ~/statmod/statmodControlsInsertNewJob.log

#toro-offline-1 analytics_db replica
#mysql -u$statmod_uname -p$statmod_pwd -B -e "\. ~/statmod/toroLogControlsInsertNewJob.sql" &> ~/statmod/toroLogControlsInsertNewJob.log

#production analytics_db
mysql -h$analytics_db_host -u$analytics_uname -p$analytics_pwd -B -e "\. ~/statmod/toroLogControlsInsertNewJob.sql" &> ~/statmod/toroLogControlsInsertNewJob.log
