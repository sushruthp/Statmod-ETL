#!/bin/bash
mysql -u$statmod_uname -p$statmod_pwd -B -e "\. ~/statmod.new/table_id_setup/dropCreateInitIdTables.sql"