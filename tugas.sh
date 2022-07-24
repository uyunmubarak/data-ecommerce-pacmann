#!/bin/bash

csvstack 2019-Oct-sample.csv 2019-Nov-sample.csv > data_merge.csv

awk '{gsub(/\r/,"")}; NR==1 {print $0,"category"}; NR>1 {print $0,$8}' FS="[,. ]" OFS="," data_merge.csv > data_add_category.csv

awk '{gsub(/\r/,"")}; NR==1 {print $0,"product_name"}; NR>1 {print $0,$(NF-6)}' FS="[,. ]" OFS="," data_add_category.csv > data_add_pname.csv

csvcut -c 2,3,4,5,7,8,11,12 data_add_pname.csv > data_filter.csv

csvgrep -c "event_type" -m purchase data_filter.csv > data_clean.csv
