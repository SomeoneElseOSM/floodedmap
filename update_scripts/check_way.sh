#!/bin/bash
# ------------------------------------------------------------------------------
# check_way.sh
#
# $1 is the test station ID
# $2 is the way ID
# $3 is the test height, in mm
# (all are integers)
#
# get_station.sh is assumed to be in the path and uses ~/data to write cache files.
# ------------------------------------------------------------------------------
cd /home/renderaccount/src/floodedmap/update_scripts
export PATH=.:$PATH
desired_station=$1
test_height=$3
current_heightm=`get_station.sh $desired_station`
current_height=`bc <<< "scale=0; ${current_heightm} * 1000/1"`
#
#echo $current_height
if [[ "$current_height" -lt "$test_height" ]]; then
    #echo "current height is less"
    psql -d gis -c "UPDATE planet_osm_line SET wetland = 'not_flooded' WHERE osm_id = '$2';"
else
    #echo "current height is the same or more"
    psql -d gis -c "UPDATE planet_osm_line SET wetland = 'flooded' WHERE osm_id = '$2';"
fi
#
