#!/usr/bin/env bash

clear
echo
#  Header
echo -e "\E[33m-------------------------------------------------------------"
echo -e "\t\t Linux System Details"
echo -e "-------------------------------------------------------------"
echo
# Display info formatted using cut filters, pipes, and single embedding
echo -e "\E[31mKernel Name:\t `uname -r`"
echo -e "Operating Sys:\t `uname -o`"
echo -e "H/W Platform:\t `uname -i`"
echo -e "Distro:\t\t `cat /etc/issue | tail -n 2 | 
        cut --delimiter=" " -f 1,2,3`"
echo -e "Uptime:\t\t `uptime|cut --delimiter=" " -f 4,5|
        cut --delimiter="," -f 1`"



tput sgr0 # Set colors back to normal in the terminal
