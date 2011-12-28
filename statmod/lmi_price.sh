#!/bin/bash
mysql -u$statmod_uname -p$statmod_pwd -B -e "\. ~/statmod/lmiPrice.sql"
