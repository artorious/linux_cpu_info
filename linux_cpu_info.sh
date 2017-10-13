#!/usr/bin/env bash

clear
echo
#  Header
echo -e "\E[33m--------------------------------------------------------------"
echo -e "\t\t Linux System Details"
echo -e "---------------------------------------------------------------"
echo
# Display info formatted using cut filters, pipes, and single embedding
echo -e "\E[31mKernel Name:\t `uname -r`"
echo -e "Operating Sys:\t `uname -o`"
echo -e "H/W Platform:\t `uname -i`"
echo -e "Distro:\t\t `cat /etc/issue | tail -n 2 | 
        cut --delimiter=" " -f 1,2,3`"
echo -e "Uptime:\t\t `uptime|cut --delimiter=" " -f 4,5|
        cut --delimiter="," -f 1`"
echo
# Header 
echo -e "\E[34m--------------------------------------------------------------"
echo -e "\t\t CPU Details"
echo -e "---------------------------------------------------------------"
echo
# Variable stores cpu model. 
# awk cuts out name of cpu
# head removes unnecessary duplicates
# sed removes leading whitespace (space or tab)
model_name=`awk '{FS = ":"} /^model name/ {print $2}' /proc/cpuinfo | 
            head -n 1 | sed 's/^[ t]*//'`
echo -e "\E[32mCPU 1:\t\t $model_name"
echo -e "CPU 1 Speed:\t `grep "cpu MHz" /proc/cpuinfo | 
        cut --delimiter=":" -f 2 | head -n 1 | sed 's/^[ t]*//'` mhz"
echo
echo -e "CPU 2:\t\t $model_name"
echo -e "CPU 2 Speed:\t `grep "cpu MHz" /proc/cpuinfo | 
        cut --delimiter=":" -f 2 | tail -n 1 | sed 's/^[ t]*//'` mhz"
echo
echo
# Header 
echo -e "\E[35m--------------------------------------------------------------"
echo -e "\t\t Memory Details"
echo -e "----------------------------------------------------------------"
echo
# indent program removes indentation (set level to 0 -i0 flag)
# TODO: replace indent program (not installed by default) with sed
let total_memory=`grep "MemTotal" /proc/meminfo | cut -c 12-24 | indent -i0 | 
                    tail -n 1`/1024 
let free_memory=`grep "MemFree" /proc/meminfo | cut -c 12-24 | indent -i0 | 
                    tail -n 1`/1024
let cached_memory=`grep "Cached" /proc/meminfo | head -n 1 | cut -c 12-24 | 
                    indent -i0`/1024

let cached_memory=$cached_memory/1024
let free_total_memory=$free_memory+$cached_memory
let used_memory=$total_memory-$free_total_memory

echo -e "\E[36mUsed Memory:\t $used_memory MB"
echo -e "Free Memory:\t $free_total_memory MB"
echo -e "Total Memory:\t $total_memory MB"
echo
<<<<<<< HEAD
#TODO:
=======
>>>>>>> 33c238f8416f35970517ada1d7c7e1e4306a40f3
echo -e "\E[33m--------------------------------------------------------------"
echo -e "\t\t Theme Details"
echo -e "---------------------------------------------------------------"
echo
echo -e "GTK Theme: "
echo -e "Mouse Theme: "
echo -e "Icon Theme: "

tput sgr0 # Set colors back to normal in the terminal
