#!/bin/bash
mysql -h$sas_db_host -u$sas_db_uname -p$sas_db_pwd --skip-column-names -B -e "\. ~/statmod/INIT_xUpgradeRequest.sql"