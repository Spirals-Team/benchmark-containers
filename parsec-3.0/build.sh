#!/bin/sh  

while read line
do
	bench=$(echo $line | cut -d':' -f 1)
	configs=$(echo $line | cut -d':' -f 2)

	for config in $configs
	do
		bin/parsecmgmt -a build -p $bench -c $config
	done

done < compilConf.txt
