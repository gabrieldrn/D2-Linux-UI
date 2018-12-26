#!/bin/bash

#FULL=▓
#EMPTY=░
FULL=━
#EMPTY=━
#EMPTY=─
#FULL=┅
EMPTY=┄

draw()
{
  perc=$1
  size=$2
  inc=$(( perc * size / 100 ))
  out=
  if [ -z $3 ]
  then
    color="36"
  else
    color="$3"
  fi
  for v in `seq 0 $(( size - 1 ))`; do
    test "$v" -le "$inc"   \
    && out="${out}\e[1;${color}m${FULL}" \
    || out="${out}\e[0;${color}m${EMPTY}"
  done
  printf $out
}

vol=`amixer get Master | awk '$0~/%/{print $4}' | tr -d '[]%'`
if amixer get Master | grep -q '\[off\]'
then
	color='31'
else
        color='36'
fi  
printf `draw $vol 15 $color`
