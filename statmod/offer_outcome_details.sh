#!/bin/bash
mysql -u$statmod_uname -p$statmod_pwd statmod -B -e "\. ~/statmod/offerOutcomeDetails.sql"
