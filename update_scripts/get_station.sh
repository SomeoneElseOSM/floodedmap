# ------------------------------------------------------------------------------
# get_station.sh $1
# $1 is the station ID
#
# Once station data is read there's no need to re-read it within 15 minutes.
# ------------------------------------------------------------------------------
#
if [ -e ~/data/ea_station_$1.txt ]
then
    if [  $(( (`date +%s` - `stat -L --format %Y ~/data/ea_station_$1.txt`) > (15*60) )) -gt 0 ]
    then
	#echo file exists and older
	curl -s -o - https://check-for-flooding.service.gov.uk/station-csv/$1  | tail -1 | sed "s/.*,//" > ~/data/ea_station_$1.txt
    #else
	#echo file exists and not older
    fi
else
    #echo file does not exist
    curl -s -o - https://check-for-flooding.service.gov.uk/station-csv/$1  | tail -1 | sed "s/.*,//" > ~/data/ea_station_$1.txt
fi
#
cat ~/data/ea_station_$1.txt
#
