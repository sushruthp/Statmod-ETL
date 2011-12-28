#!/bin/bash
cd ~/statmod
echo Start at `date`
#
echo Building filtered_emails table...
./filtered_emails.sh >> table_build_master.log 2>&1
echo Done at `date`
#
echo Building display_names table...
./displayed_category_names.sh >> table_build_master.log 2>&1
echo Done at `date`
#
echo Building lmi_price tables...
./lmi_price.sh >> table_build_master.log 2>&1
echo Done at `date`
#
echo Building exposed table...
./exposed.sh >> table_build_master.log 2>&1
echo Done at `date`
#
echo Building matrix_offers table...
./matrix_offers.sh >> table_build_master.log 2>&1
echo Done at `date`
#
echo Building toro_param_offers table...
./toro_param_offers.sh >> table_build_master.log 2>&1
echo Done at `date`
#
echo Building new_interest_offers table...
./new_interest_offers.sh >> table_build_master.log 2>&1
echo Done at `date`
#
echo Updating offer_outcome_details table...
./offer_outcome_details.sh >> table_build_master.log 2>&1
echo Done at `date`
#
echo Updating offer_outcome_summary table...
./offer_outcome_summary.sh >> table_build_master.log 2>&1
echo Done at `date`
# 
echo Updating guest_history table...
./guest_history.sh >> table_build_master.log 2>&1
echo Done at `date`