#!/bin/bash

date=$(/bin/date)

memory_info=$(/bin/free -h)

cpu_info=$(/usr/bin/top -b -n 1 | /usr/bin/awk '/^(Tasks|%Cpu).+/ { print $0 }')
disk_info=$(/usr/bin/df -h)

/bin/echo -e "[$date]:\n${memory_info}\n${cpu_info}/${disk_info}" >> /home/valentyn/memory-log.log
