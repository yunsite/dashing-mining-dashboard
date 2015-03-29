#!/bin/bash
# Dashing service [only needed if you are hosting your own dashing server]
# Add this file to /etc/init.d/
# $ sudo cp dashboard /etc/init.d/
# Update variables DASHING_DIR, GEM_HOME, & PATH to suit your installation
# $ sudo nano /etc/init.d/dashboard
# Make executable
# $ sudo chmod 755 /etc/init.d/dashboard
# Update rc.d
# $ sudo update-rc.d dashboard defaults
# Dashboard will start at boot. Check out the boot log for trouble shooting "/var/log/boot.log"
# USAGE: start|stop|status|logs
 
### BEGIN INIT INFO
# Provides:          dashboard
# Required-Start:    $remote_fs $syslog
# Required-Stop:     $remote_fs $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Start daemon at boot time
# Description:       Enable service provided by daemon.
### END INIT INFO
 
# Gregology <greg@gho.st>
# https://gist.github.com/gregology/5313326
# Based on  Faraz Haider's LifeRay Startup Service script
# https://gist.github.com/haiderfaraz/2773431
 
DASHING_DIR=/opt/dashing-mining-dashboard/
GEM_HOME=/var/lib/gems/1.9.1
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games
 
case "$1" in
start)
echo "Starting Dashing."
cd $DASHING_DIR; dashing start -d
;;
stop)
echo "Stopping Dashing."
killall thin
;;
logs)
echo "See the logs of the Dashing."
tail -f $DASHING_DIR'log/thin.log'
;;
status)
# Check to see if the process is running
ps aux|grep -i dashing
;;
 
*)
echo “Dashing”
echo $”Usage: $0 {start|stop|status|logs}”
exit 1
esac
exit 0
