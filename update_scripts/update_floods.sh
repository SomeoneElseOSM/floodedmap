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
mv ~/data/ea_floods.justnow ~/data/ea_floods.previously
#
check_way.sh 8235 753771968  1020 >> ~/data/ea_floods.justnow
check_way.sh 8235 1016543808 1070 >> ~/data/ea_floods.justnow
check_way.sh 8235 901961338  1220 >> ~/data/ea_floods.justnow
check_way.sh 8235 753771967  1400 >> ~/data/ea_floods.justnow
check_way.sh 8235 39327911   1430 >> ~/data/ea_floods.justnow
check_way.sh 8235 901963824  1400 >> ~/data/ea_floods.justnow
check_way.sh 8235 906948645  1250 >> ~/data/ea_floods.justnow
check_way.sh 8235 901963823  1260 >> ~/data/ea_floods.justnow
check_way.sh 8235 1011560260 1430 >> ~/data/ea_floods.justnow
check_way.sh 8235 252151956  2600 >> ~/data/ea_floods.justnow
check_way.sh 8235 901963208  2700 >> ~/data/ea_floods.justnow
check_way.sh 8235 37535250   2700 >> ~/data/ea_floods.justnow
check_way.sh 8235 901962646  2500 >> ~/data/ea_floods.justnow
check_way.sh 8235 846071720  1500 >> ~/data/ea_floods.justnow
check_way.sh 8184 38355411   3650 >> ~/data/ea_floods.justnow
check_way.sh 8184 52024112   3650 >> ~/data/ea_floods.justnow
check_way.sh 8184 781159297  3650 >> ~/data/ea_floods.justnow
check_way.sh 8208 352872949  4000 >> ~/data/ea_floods.justnow
check_way.sh 8208 352872949  4000 >> ~/data/ea_floods.justnow
check_way.sh 8208 952184983  4000 >> ~/data/ea_floods.justnow
check_way.sh 8208 974445334  4000 >> ~/data/ea_floods.justnow
check_way.sh 8208 944914270  4000 >> ~/data/ea_floods.justnow
#
echo " " >> ~/data/ea_floods.justnow
echo "Flooded:" >> ~/data/ea_floods.justnow
psql -d gis -c "SELECT osm_id FROM planet_osm_line WHERE (wetland = 'flooded');"  >> ~/data/ea_floods.justnow
#
echo " " >> ~/data/ea_floods.justnow
echo "Not Flooded:" >> ~/data/ea_floods.justnow
psql -d gis -c "SELECT osm_id FROM planet_osm_line WHERE (wetland = 'not_flooded');" | grep rows >> ~/data/ea_floods.justnow
#
diff ~/data/ea_floods.justnow ~/data/ea_floods.previously
#
