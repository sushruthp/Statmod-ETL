#!/bin/bash
cd ~/statmod/table_id_setup
./init_control_ids_x_extracts_archive.sh > init_control_ids_x_extracts_archive.tab
./init_control_ids_x_email_queue.sh > init_control_ids_x_email_queue.tab
./init_control_ids_x_booking.sh > init_control_ids_x_booking.tab
./init_control_ids_x_upgrade_request.sh > init_control_ids_x_upgrade_request.tab