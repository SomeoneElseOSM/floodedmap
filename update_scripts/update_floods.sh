#!/bin/bash
# ------------------------------------------------------------------------------
# update_floods.sh
#
# Designed to be run from cron
# ------------------------------------------------------------------------------
cd /home/renderaccount/src/floodedmap/update_scripts
export PATH=.:$PATH
#
# Remove existing tiles to avoid any caching
rm -rf /var/lib/mod_tile/ajt4/??
rm -rf /var/lib/mod_tile/ajt4/?
#
check_way.sh 8235 753771968  1020
check_way.sh 8235 1016543808 1070
check_way.sh 8235 901961338  1220
check_way.sh 8235 753771967  1400
check_way.sh 8235 39327911   1430
check_way.sh 8235 901963824  1400
check_way.sh 8235 906948645  1250
check_way.sh 8235 901963823  1260
check_way.sh 8235 1011560260 1430
check_way.sh 8235 252151956  2600
check_way.sh 8235 901963208  2700
check_way.sh 8235 37535250   2700
check_way.sh 8235 901962646  2500
check_way.sh 8235 846071720  1500
check_way.sh 8184 38355411   3650
check_way.sh 8184 52024112   3650
check_way.sh 8184 781159297  3650
#check_way.sh 8208 352872949  4000
#check_way.sh 8208 352872949  4000
#check_way.sh 8208 952184983  4000
#check_way.sh 8208 974445334  4000
#check_way.sh 8208 944914270  4000
#
psql -d gis -c "SELECT osm_id FROM planet_osm_line WHERE (wetland = 'flooded');"
#
