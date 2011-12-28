#!/bin/bash
mysql -u$statmod_uname -p$statmod_pwd -B -e "\. ~/statmod.new/table_id_setup/init_control_ids_x_extract_archive.sql"