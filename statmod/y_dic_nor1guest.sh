#!/bin/bash
mysql -h$sas_db_host -u$sas_db_uname -p$sas_db_pwd -B -e "\. ~/statmod/yDicNor1guest.sql"