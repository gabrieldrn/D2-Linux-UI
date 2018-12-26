#!/bin/bash
# Written by Gabriel D., 2018
# This script gets the $USER variable and format it in Polybar style
# It is written for a specific rice and the output is intended to be rendered in polybar like this :
# --> "U s e r n a m e"
# Every char is separated with a gap and the first char is set to Uppercase

str="$(tr '[:lower:]' '[:upper:]' <<< ${USER:0:1})${USER:1}"
name="%{T3}"
for (( i=0 ; i < ${#str} ; i++ )) {
		name+="${str:i:1}%{O3}"
}
name+="%{T-}"
echo $name
