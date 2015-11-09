#!/bin/bash
parsecapps=(blackscholes bodytrack facesim ferret fluidanimate freqmine swaptions vips x264)

parseckernel=(canneal dedup streamcluster)

splash2apps=(barnes ffm ocean_np ocean_ncp radiosity volrend water_nsquared water_spatial)

splash2kernel=(cholesky fft lu_cb lu_ncb radix)

input=(test native simdev simlarge simmedium simsmall)


if [ "$1" = "help" ];
	then
		cat help.txt
fi


if [ "$1" = "uncompress-help" ];
	then
		cat htu.txt
fi

if [ "$1" = "status" ];
	then
		bin/parsecmgmt -a status
fi


if [ "$1" = "run" ];
	then
		bin/parsecmgmt -a $1 -p $2 -c $3 -i $4 $5 $6
fi

#Part that uncompress a given benchmark input workload
if [ "$1" = "use" ]
	then
		#Case of raytrace benchmark which is present in splash2(x) and parsec
		if [ "$2" = "raytrace" ] ; then
				if [ "$3" = "2" ] ; then
					if echo ${input[@]} | grep -q -w "$4" ; then
	    				unxz ext/splash2/apps/$2/inputs/input_$4.tar.xz
					elif [ "$4" = "all" ] ; then
	    				unxz ext/splash2/apps/$2/inputs/*.tar.xz
					else
							echo "this input worload does not exists"
					fi
				elif [ "$3" = "2x" ] ; then
					if echo ${input[@]} | grep -q -w "$4" ; then
	    				unxz ext/splash2x/apps/$2/inputs/input_$4.tar.xz
					elif [ "$4" = "all" ] ; then
	    				unxz ext/splash2x/apps/$2/inputs/*.tar.xz
					else
							echo "this input worload does not exists"
					fi
				else
					unxz pkgs/apps/raytrace/inputs/input_$3.tar.xz
				fi
		else
		# apps of parsec
			if echo ${parsecapps[@]} | grep -q -w "$2" ; then 
				if echo ${input[@]} | grep -q -w "$3" 
					then
	    				unxz pkgs/apps/$2/inputs/input_$3.tar.xz
				elif [ "$3" = "all" ] ; then
					unxz pkgs/apps/$2/inputs/*.tar.xz
				else
						echo "this input worload does not exists"
				fi
		# kernels of parsec
			elif echo ${parseckernel[@]} | grep -q -w "$2" ; then 
				if  echo ${input[@]} | grep -q -w "$3" 
					then
	    				unxz pkgs/kernels/$2/inputs/input_$3.tar.xz
				elif [ "$3" = "all" ] ; then
					unxz pkgs/kernels/$2/inputs/*.tar.xz
				else
						echo "this input worload does not exists"
				fi
		#apps of splash
			elif echo ${splash2apps[@]} | grep -q -w "$2"; then
				#Case splash2x
				if  [ "$3" = "x" ]
					then
						if  echo ${input[@]} | grep -q -w "$4" 
							then
	    						unxz ext/splash2x/apps/$2/inputs/input_$4.tar.xz
						elif [ "$3" = "all" ] ; then
								unxz ext/splash2x/apps/$2/inputs/*.tar.xz
						else
							echo "this input worload does not exists"
						fi
				elif  echo ${input[@]} | grep -q -w "$3" 
					then
	    				unxz ext/splash2/apps/$2/inputs/input_$3.tar.xz
				elif [ "$3" = "all" ] ; then
						unxz ext/splash2/apps/$2/inputs/*.tar.xz
				else
						echo "this input worload does not exists"
				fi
		# kernels of splash
			elif echo ${splash2kernel[@]} | grep -q -w "$2"; then
				#Case splash2x
				if  [ "$3" = "x" ]
					then
						if  echo ${input[@]} | grep -q -w "$4" 
							then
	    						unxz ext/splash2x/kernels/$2/inputs/input_$4.tar.xz
						elif [ "$4" = "all" ] ; then
								unxz ext/splash2x/kernels/$2/inputs/*.tar.xz
						else
							echo "this input worload does not exists"
						fi
				elif  echo ${input[@]} | grep -q -w "$3" 
					then
	    				unxz ext/splash2/kernels/$2/inputs/input_$3.tar.xz
				elif [ "$3" = "all" ] ; then
						unxz ext/splash2/kernels/$2/inputs/*.tar.xz
				else
						echo "this input worload does not exists"
				fi			
			else 
	    			echo "given benchmark doesn't exists"
			fi
	fi
fi



