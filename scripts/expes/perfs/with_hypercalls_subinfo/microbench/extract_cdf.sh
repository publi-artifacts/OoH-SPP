#!/bin/bash

for pool in 0 1 3 5 7 9 
do
	file="Xen_optimized/$1/$pool"
	cat $file | awk '{print $1}' | sort -n | uniq -c | awk '{ sum+=$1; print $2*1.0/1000,sum/tot }' tot=$(cat $file | wc -l) > Xen_optimized/$1/cdf/$pool"_cdf"

done
