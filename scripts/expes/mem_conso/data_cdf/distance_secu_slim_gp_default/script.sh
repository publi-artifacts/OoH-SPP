lib="/mnt/tmp/SlimGuard/libSlimGuard.so"
source="/mnt/tmp/SlimGuard/"
old=1
file="include/slimguard.h"


parsec="/mnt/tmp/parsec-3.0"



for freq in 2 3 5 10 15 20 50
do
	cd $source
	old_string=$(echo "#define GP ("$old")")
	new_string=$(echo "#define GP ("$freq")")
        sed -i -e "s|$old_string|$new_string|g" $file
	make clean && make
	
	old=$freq
	cd $parsec
	source env.sh
	parsecmgmt -a fullclean -p blackscholes
        parsecmgmt -a build -p blackscholes
	LD_PRELOAD="$lib" parsecmgmt -a run -p blackscholes -i simlarge > $source"expe_distance/blackscholes_freq"$freq"_distance" 2>&1
done

