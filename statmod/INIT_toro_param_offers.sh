#!/bin/bash

#local replica
#mysql -u$statmod_uname -p$statmod_pwd -B -e "\. ~/statmod/INIT_toroParamOffers.sql"

#product analytics_db
mysql -h$analytics_db_host -u$analytics_uname -p$analytics_pwd -B -e "\. ~/statmod/INIT_toroParamOffers.sql"
mysql -u$statmod_uname -p$statmod_pwd statmod -B -e "DELETE FROM toro_param_offers;"
mknod toro_param_offers.txt p
mysql -h$analytics_db_host -u$analytics_uname -p$analytics_pwd statmod -B -e "SELECT * FROM toro_param_offers;" > toro_param_offers.txt & mysqlimport --local --ignore-lines=1 statmod -u$statmod_uname -p$statmod_pwd toro_param_offers.txt
rm toro_param_offers.txt