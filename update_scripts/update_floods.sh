#!/bin/bash
# ------------------------------------------------------------------------------
# update_floods.sh
#
# Designed to be run from cron as the owner of the database so that the
# "psql" commands work.  It assumes that cached EA flood information is in
# ~/data , so it isn't currently compatible with Debian 11 / Ubuntu 21.04
# and above, where the psql user and filesystem owner will be different.
#
# Database assumed to be "gis".
# Tile style used for floods assumed to be "ajt4".
#
# The difference between the output from the last run and the current one is
# written to stdout (and if run from cron, mailed).
# ------------------------------------------------------------------------------
local_filesystem_user=renderaccount
local_renderd_user=renderaccount
#local_renderd_user=_renderd
tile_path=/var/lib/mod_tile
#tile_path=/var/cache/renderd/tiles
#
cd /home/${local_filesystem_user}/src/floodedmap/update_scripts
export PATH=.:$PATH
#
# Remove existing tiles to avoid any caching
rm -rf ${tile_path}/ajt4/??
rm -rf ${tile_path}/ajt4/?
mv /home/${local_filesystem_user}/data/ea_floods.justnow /home/${local_filesystem_user}/data/ea_floods.previously
#
# Flooding due to the Foss upstream of Huntington
# https://check-for-flooding.service.gov.uk/station/8235
#
check_way.sh 8235 753771968  1020 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8235 1016543808 1070 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8235 901961338  1220 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8235 753771967  1400 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8235 39327911   1430 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8235 901963824  1400 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8235 906948645  1250 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8235 901963823  1260 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8235 1011560260 1430 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8235 252151956  2600 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8235 901963208  2700 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8235 37535250   2700 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8235 901962646  2500 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8235 846071720  1360 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8235 1033663114 1350 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8235 65617003 1880 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8235 1077540262 679 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
#
check_area.sh 8235 1034923243 1880 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
#
# Flooding due to the Ouse et al upstream of Skelton
# https://check-for-flooding.service.gov.uk/station/8184
#
# Note that rain upstream of way 486955585 can also cause 
# flooding on way 781159297 etc., but there are no gauges
# there.
#
check_way.sh 8184 38355411   3410 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8184 52024112   3390 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8184 781159297  3650 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8184 1019778914 3180 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8184 1019778913 3650 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8184 1019779681 3210 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8184 925755180  3500 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8184 1019781837 3650 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8184 791553265  3650 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8184 791553266  3650 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8184 1019782706 4110 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8184 1019783152 4110 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8184 1019783358 4650 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8184 1019784225 4160 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8184 1019784980 2960 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8184 1035233906 6030 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8184 71439862 6030 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8184 471280137 6030 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8184 1035235571 6030 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8184 493140294 6030 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8184 493140295 6030 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8184 303552960 6030 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8184 450232008 6030 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8184 1019783359 6030 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8184 1035235871 6030 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8184 1035236243 6030 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8184 450232010 6030 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8184 953825808 6030 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8184 1035236781 6030 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8184 925758087 4010 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8184 1035236428 4010 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8184 71442018 6030 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
#
check_area.sh 8184 1023804545 2460 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_area.sh 8184 1019781838 3160 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_area.sh 8184 1019785868 3160 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_area.sh 8184 1019781961 3160 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_area.sh 8184 1023804544 3650 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_area.sh 8184 1035235418 6030 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_area.sh 8184 1035236055 6030 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_area.sh 8184 1021713896 6030 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_area.sh 8184 1035238879 6030 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_area.sh 8184 1035239052 6030 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_area.sh 8184 1035238554 6030 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_area.sh 8184 1035236505 4010 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_area.sh 8184 1035237110 4010 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_area.sh 8184 1035238555 4010 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_area.sh 8184 1035238702 4010 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
#
# Flooding due to the Ouse downstream of Clifton Ings Outfall
# https://check-for-flooding.service.gov.uk/station/9347
# n/a
#
# Potential flooding downstream and just upstream of Viking Recorder
# https://check-for-flooding.service.gov.uk/station/8208
#
check_way.sh 8208 133317875 0740 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8208 1041669749 0790 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8208 352872949  4000 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8208 952184983  4000 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8208 974445334  4000 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8208 944914270  4000 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8208 1034923971 3230 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8208 25950308 3230 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8208 1034924719 3230 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
#
check_area.sh 8208 281131445 3530 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_area.sh 8208 1034925077 3230 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_area.sh 8208 1034925321 3230 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_area.sh 8208 1064721928 3230 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
#
echo " " >> /home/${local_filesystem_user}/data/ea_floods.justnow
echo "Flooded:" >> /home/${local_filesystem_user}/data/ea_floods.justnow
sudo -u ${local_renderd_user} psql -d gis -c "SELECT osm_id FROM planet_osm_line WHERE (wetland = 'flooded');" | sort >> /home/${local_filesystem_user}/data/ea_floods.justnow
#
echo " " >> /home/${local_filesystem_user}/data/ea_floods.justnow
echo "Not Flooded:" >> /home/${local_filesystem_user}/data/ea_floods.justnow
sudo -u ${local_renderd_user} psql -d gis -c "SELECT osm_id FROM planet_osm_line WHERE (wetland = 'not_flooded');" | grep rows >> /home/${local_filesystem_user}/data/ea_floods.justnow
#
diff /home/${local_filesystem_user}/data/ea_floods.justnow /home/${local_filesystem_user}/data/ea_floods.previously
#
