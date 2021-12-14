# ------------------------------------------------------------------------------
# get_station.sh $1
# $1 is the station ID
#
# Initially just as a proof of concept this reads the station data every time.
# There's no need to do that since it'd be easy to cache and the station data
# doesn't change more often than every 15 minutes.
# ------------------------------------------------------------------------------
curl -s -o - https://check-for-flooding.service.gov.uk/station-csv/$1  | tail -1 | sed "s/.*,//"
#
