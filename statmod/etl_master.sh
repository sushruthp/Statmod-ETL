#!/bin/bash
cd ~/statmod
./dump_table_structures.sh
./controls_insert_new_job.sh
#1
echo Start at `date`
echo x_learn_more_image
mknod x_learn_more_image.txt p
./x_learn_more_image.sh > x_learn_more_image.txt & mysqlimport --local --ignore-lines=1 statmod -u$statmod_uname -p$statmod_pwd x_learn_more_image.txt
rm x_learn_more_image.txt
echo Done at `date`
#2
echo x_extracts_archive
mknod x_extracts_archive.txt p
./x_extracts_archive.sh > x_extracts_archive.txt & mysqlimport --local --ignore-lines=1 statmod -u$statmod_uname -p$statmod_pwd x_extracts_archive.txt
rm x_extracts_archive.txt
echo Done at `date`
#3
echo x_email_queue
mknod x_email_queue.txt p
./x_email_queue.sh > x_email_queue.txt & mysqlimport --local --ignore-lines=1 statmod -u$statmod_uname -p$statmod_pwd x_email_queue.txt
rm x_email_queue.txt
echo Done at `date`
#4
echo x_booking
mknod x_booking.txt p
./x_booking.sh > x_booking.txt & mysqlimport --local --ignore-lines=1 statmod -u$statmod_uname -p$statmod_pwd x_booking.txt
rm x_booking.txt
echo Done at `date`
#5
echo x_booking_cancellations
mknod x_booking_cancellations.txt p
./x_booking_cancellations.sh > x_booking_cancellations.txt & mysqlimport --local --ignore-lines=1 statmod -u$statmod_uname -p$statmod_pwd x_booking_cancellations.txt
rm x_booking_cancellations.txt
echo Done at `date`
#6
echo x_upgrade_request
mknod x_upgrade_request.txt p
./x_upgrade_request.sh > x_upgrade_request.txt & mysqlimport --local --ignore-lines=1 statmod -u$statmod_uname -p$statmod_pwd x_upgrade_request.txt
rm x_upgrade_request.txt
echo Done at `date`
#7
echo x_upgrade_request_award
mknod x_upgrade_request_award.txt p
./x_upgrade_request_award.sh > x_upgrade_request_award.txt & mysqlimport --local --ignore-lines=1 statmod -u$statmod_uname -p$statmod_pwd x_upgrade_request_award.txt
rm x_upgrade_request_award.txt
echo Done at `date`
#8
echo y_category
mknod y_category.txt p
./y_category.sh > y_category.txt & mysqlimport --local --ignore-lines=1 statmod -u$statmod_uname -p$statmod_pwd y_category.txt
rm y_category.txt
echo Done at `date`
#9
echo y_upgrade
mknod y_upgrade.txt p
./y_upgrade.sh > y_upgrade.txt & mysqlimport --local --ignore-lines=1 statmod -u$statmod_uname -p$statmod_pwd y_upgrade.txt
rm y_upgrade.txt
echo Done at `date`
#10
echo y_property
mknod y_property.txt p
./y_property.sh > y_property.txt & mysqlimport --local --ignore-lines=1 statmod -u$statmod_uname -p$statmod_pwd y_property.txt
rm y_property.txt
echo Done at `date`
#11
echo y_room
mknod y_room.txt p
./y_room.sh > y_room.txt & mysqlimport --local --ignore-lines=1 statmod -u$statmod_uname -p$statmod_pwd y_room.txt
rm y_room.txt
echo Done at `date`
#12
echo y_dic_nor1guest
mknod y_dic_nor1guest.txt p
./y_dic_nor1guest.sh > y_dic_nor1guest.txt & mysqlimport --local --ignore-lines=1 statmod -u$statmod_uname -p$statmod_pwd y_dic_nor1guest.txt
rm y_dic_nor1guest.txt
echo Done at `date`
#13
echo email reformatting
./email_reformatting.sh >> etl_master.log 2>&1
echo Done at `date`
#14
./controls_update_job_end.sh