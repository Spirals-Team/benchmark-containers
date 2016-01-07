#!/bin/sh

# Initialize our own variables:
parsec_home='pkgs'
splash2_home='ext/splash2'
splash2x_home='ext/splash2x'

cmd='bin/parsecmgmt '
input='test'

while getopts ":S:a:p:c:d:i:n:s:x:km:t:r:lh" opt; do
  case $opt in
    S)
      suite=$OPTARG
      ;;
    a)
      if [ "$OPTARG" = "run" ];
      then
        action=true
      fi
      cmd="$cmd -a $OPTARG"
      ;;
    p)
      package=$OPTARG
      ;;
    c)
      cmd="$cmd -c $OPTARG"
      ;;
    d)
      cmd="$cmd -d $OPTARG"
      ;;
    i)
      input=$OPTARG
      cmd="$cmd -i $input"
      ;;
    n)
      cmd="$cmd -n $OPTARG"
      ;;
    s)
      cmd="$cmd -s $OPTARG"
      ;;
    x)
      cmd="$cmd -x $OPTARG"
      ;;
    k)
      cmd="$cmd -k"
      ;;
    m)
      cmd="$cmd -m $OPTARG"
      ;;
    t)
      cmd="$cmd -t $OPTARG"
      ;;
    r)
      cmd="$cmd -r $OPTARG"
      ;;
    l)
      cmd="$cmd -l"
      ;;
    h)
      cmd="$cmd -h"
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
  esac
done

shift $(($OPTIND - 1))

case "$package" in
  *parsec\.*)
    suite="parsec"
    package=${package#"${suite}."}
    ;;
  *splash2\.*)
    suite="splash2"
    package=${package#"${suite}."}
    ;;
  *splash2x\.*)
    suite="splash2x"
    package=${package#"${suite}."}
    ;;
esac

if [ \( -n "${action+x}" -a \( -z "${suite+x}" -o -z "${package+x}" \) \) ];
then
    echo "A suite (-S parsec|splash2|splash2x) and a package (-p) should be specified, or specify the fullname of the package." >&2
    exit 1
elif [ \( -n "${action+x}" \) -a \( -n "${suite+x}" \) -a \( -n "${package+x}" \) ]
then
  case "$suite" in
    'parsec')
      path=$(find $parsec_home -maxdepth 2 -name $package)
      ;;
    'splash2')
      path=$(find $splash2_home -maxdepth 2 -name $package)
      ;;
    'splash2x')
      path=$(find $splash2x_home -maxdepth 2 -name $package)
      ;;
    *)
      echo "Invalid suite: -S (has to be parsec, splash2 or splash2x)" >&2
      exit 1
      ;;
  esac

  if [ -d "$path/inputs" -a -e "$path/inputs/input_${input}.tar.xz" ];
  then
    echo "Decompressing input $input for ${suite}.${package}..." >&2
    unxz $path/inputs/input_${input}.tar.xz
  elif [ -d "$path/inputs" ]
  then 
    echo "Input $input not available for ${suite}.${package}." >&2
    exit 1
  fi

  echo "Launching ${suite}.${package}..." >&2

  cmd="$cmd -p ${suite}.${package}"

  $cmd
else
  $cmd
fi

