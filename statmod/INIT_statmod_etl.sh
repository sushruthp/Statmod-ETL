#!/bin/bash
i=1
limit=193
echo 0 `date +%F" "%T`
while [ $i -lt $limit ]
do
  f1="INIT_etl_master_${i}.log"
  f2="INIT_table_build_master_${i}.log"
  ./INIT_etl_master.sh &> ~/statmod/logs/$f1
  ./INIT_table_build_master.sh &> ~/statmod/logs/$f2
  ./INIT_update_job_done.sh
  echo $i `date +%F" "%T`
  let i=i+1
done
