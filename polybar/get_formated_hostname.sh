#!/bin/bash
# Written by Gabriel D., 2018
# This line gets the hostname variable and format it in Polybar style
# It is written for a specific rice and the output is intended to be rendered in polybar like this :
# --> "// HOSTNAME"

echo "%{F#666}// $(tr '[:lower:]' '[:upper:]' <<< $(cat /proc/sys/kernel/hostname))%{T-}"
