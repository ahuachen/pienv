#!/bin/bash
if /sbin/ifconfig wlan0 | grep -q "inet addr:" ; then
      echo `date` "Network OKOKOKOKOKOKOK!" | tee -a /tmp/network-moniter.log
      exit
else
      echo `date` "Network connection down! Attempting reconnection." | tee -a /tmp/network-moniter.log
      /sbin/ifconfig wlan0 | tee -a /tmp/network-moniter.log
      /sbin/ifup --force wlan0
fi

#crontab -u root -e
#*/2 * * * * bash /home/pi/pienv/network-monitor.sh #每2分钟执行一次
#ifup 需要root权限, 非root用户执行脚本会失败
