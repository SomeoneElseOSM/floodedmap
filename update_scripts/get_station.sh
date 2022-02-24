#!/bin/bash
# ------------------------------------------------------------------------------
# get_station.sh $1
# $1 is the station ID
#
# Once station data is read there's no need to re-read it within 15 minutes.
# Some stations have an extra "observed/forecast" column - we remove forecast
# entries and remove ",observed" from the CSV.
# ------------------------------------------------------------------------------
#
local_filesystem_user=$2
local_renderd_user=$3
#
if [ -e /home/${local_filesystem_user}/data/ea_station_$1.txt ]
then
    if [  $(( (`date +%s` - `stat -L --format %Y /home/${local_filesystem_user}/data/ea_station_$1.txt`) > (15*60) )) -gt 0 ]
    then
	#echo file exists and older
	sudo -u ${local_filesystem_user} curl -s -o - https://check-for-flooding.service.gov.uk/station-csv/$1  | grep -v forecast | tail -1 | sed "s/,observed//" | sed "s/.*,//" > /home/${local_filesystem_user}/data/ea_station_$1.txt
    #else
	#echo file exists and not older
    fi
else
    #echo file does not exist
    sudo -u ${local_filesystem_user} curl -s -o - https://check-for-flooding.service.gov.uk/station-csv/$1  | grep -v forecast | tail -1 | sed "s/,observed//" | sed "s/.*,//" > /home/${local_filesystem_user}/data/ea_station_$1.txt
fi
#
cat /home/${local_filesystem_user}/data/ea_station_$1.txt
#
