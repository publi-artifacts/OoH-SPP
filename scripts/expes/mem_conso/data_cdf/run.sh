#!/bin/bash

Slim="/home/stella/Slimguard"
WD="$Slim/expes" #working dir
PARSEC="/home/stella/spp/evals/parsec-3.0"
LOGS="$WD/mem_conso/wss"
LIB="$WD/mem_conso"


parsec(){
	LD_PRELOAD=$LIB/lib$1.so taskset -c 3 /usr/bin/time -v parsecmgmt -a run -p $2 -i simlarge &>> $LOGS/freq_$3/$2_output 2>&1
	#echo "lib$1.so $2"
}

print(){
	printf "\n************************$1******************************\n\n" >> $LOGS/freq_$3/$2_output
#	printf "\n************************$1******************************\n\n" >> $LOGS/$2_conso
}

cd $PARSEC
. env.sh

sudo sh $WD/pin.sh
#sleep 120 #put back 120

prev=3
for freq in 2 1 #9 8 7 6 5 4 3 
do
	mkdir $LOGS/freq_$freq
	
	cd $Slim/KONE-GP-standard
	sed -i 's/#define GP '$prev'/#define GP '$freq'/g' include/slimguard.h
	make clean && make
	cp libSlimGuard.so ../expes/mem_conso/libGP.so

	cd $Slim/KONE-SPP-standard
	sed -i 's/#define SP '$prev'/#define SP '$freq'/g' include/slimguard.h
	make clean && make
	cp libSlimGuard.so ../expes/mem_conso/libGuarnary.so

	for app in blackscholes bodytrack canneal dedup freqmine streamcluster swaptions ferret fluidanimate x264
	do
		for policy in Guarnary Default Canary GP 
		do
			sudo sysctl -w vm.drop_caches=3
			parsecmgmt -a fullclean -p $app
			print $policy $app $freq
			parsec $policy $app $freq
			#
			#sleep 1
			#pid=$(pidof $app)
			#while [ -z "$pid" ] #tant que la chaine de char pid est vide
			#do
			#	pid=$(pidof $app)
			#done
			#
			#taskset -c 2 nohup $WD/wss.pl -s 0 $pid .05 >> $LOGS/$app"_conso" 2>&1
			#echo "test" >> $LOGS/$app"_conso" 2>&1
			#
			sleep 5
		done
	done
	prev=$freq
done
