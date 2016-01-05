#!/bin/sh  

(
  #PARSEC
  cd pkgs
  pkgs=$(ls)

  for pkg in $pkgs
  do
    cd $pkg
	
    benchs=$(ls) 

    #For each benchmark we write available compile configurations in a file
    for bench in $benchs
    do
      echo $bench : $(ls $bench/parsec/ | grep -v "icc" | grep '.bldconf$' | cut -d'.' -f 1) >> ../../compilConf.txt
    done
	
    cd ..
  done 

  cd ..

  #SPLASH2/SPLASH2X
  cd ext/

  splashdirs=$(ls)


  for splashdir in $splashdirs
  do
    cd $splashdir

    for pkg in $(ls -d */ | grep -v "null_macros")
    do
      benchs=$(ls $pkg/) 

      #For each benchmark we write available compile configurations in a file
      for bench in $benchs
      do
        echo $splashdir.$bench : $(ls $pkg/$bench/parsec/ | grep -v "icc" | grep '.bldconf$' | cut -d'.' -f 1) >> ../../compilConf.txt
      done

    done

  cd ..

  done
)

