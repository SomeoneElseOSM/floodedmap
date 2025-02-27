#!/bin/bash
# -----------------------------------------------------------------------------
# update_floods.sh
#
# Designed to be run from cron as root.  It runs as the owner of the database
# for updates, so that the "psql" commands work.
# It assumes that cached EA flood information is in "data" below a named
# filesystem user declared below.
#
# Database assumed to be "gis".
# Tile style used for floods assumed to be "ajt4".
#
# The difference between the output from the last run and the current one is
# written to stdout (and if run from cron, mailed).
# -----------------------------------------------------------------------------
local_filesystem_user=ajtown
local_renderd_user=_renderd
tile_path=/var/cache/renderd/tiles
#
cd /home/${local_filesystem_user}/src/floodedmap/update_scripts
export PATH=.:$PATH
#
# Remove existing tiles to avoid any caching
rm -rf ${tile_path}/ajt4/??
rm -rf ${tile_path}/ajt4/?
mv /home/${local_filesystem_user}/data/ea_floods.justnow /home/${local_filesystem_user}/data/ea_floods.previously

#
# Foss at West Lilling
# https://check-for-flooding.service.gov.uk/station/9305
# n/a because works at https://www.openstreetmap.org/way/1080982495
# (see https://consult.environment-agency.gov.uk/yorkshire/yorkfas/#fact-bank-11 )
# mean that West Lilling is no longer a predictor of levels downstream of
# Strensall

#
# Flooding due to the Foss upstream of Huntington
# https://check-for-flooding.service.gov.uk/station/8235
#
check_way.sh 8235 753771968  1180 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8235 1016543808 1170 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
# check_way.sh 8235 1077540263 1070 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8235 901961338  1410 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8235 753771969  1940 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
# check_way.sh 8235 1077540264 1320 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8235 753771967  1450 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8235 39327911   1430 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8235 1106719736 1430 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8235 901963824  1410 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8235 906948645  1410 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8235 901963823  1390 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8235 1011560260 1840 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8235 1117270803 1830 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8235 1106719511 1930 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8235 252151956  2420 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8235 901963208  1840 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8235 1106968774 1930 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8235 901962648  2700 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8235 1106968773 2700 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8235 37535250   2700 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8235 906946127  1410 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8235 1106968082 1670 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8235 901962646  1670 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8235 846071720  1140 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8235 875859840  1140 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8235 1033663114 1850 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8235 65617003 1880 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
# check_way.sh 8235 1077540262 740 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8235 44539689 1660 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8235 1219373776 1930 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8235 1219373984 1930 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8235 37535257 1930 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8235 906946128 1930 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8235 37535433 1930 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8235 1219374390 1930 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8235 1219374773 1930 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8235 601815220 1930 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8235 1219375393 1930 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8235 1219375715 1930 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8235 259451478 1990 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8235 1221115478 2470 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8235 906943563 1840 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8235 37535246 1860 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8235 1119247731 1840 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8235 1221119006 1840 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8235 1224873843 2340 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8235 263900828  2360 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8235 1106719858 2360 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8235 919943368  1940 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8235 1338139493 1680 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8235 906946793  1200 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8235 906944629  1430 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8235 1230708125 2370 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8235 1233932702 2000 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8235 1349881137 2410 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8235 1349881243 2380 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8235 753771970  2380 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
#
check_area.sh 8235 1034923243 1880 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_area.sh 8235 1219373461 1840 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_area.sh 8235 1219375347 1880 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_area.sh 8235 1219376342 1960 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_area.sh 8235 1219377846 1990 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_area.sh 8235 919942781 2470 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_area.sh 8235 1037812618 1840 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_area.sh 8235 1224871538 2360 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_area.sh 8235 1224877592 2240 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow

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
check_way.sh 8184 1019781837 4020 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8184 791553265  4020 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8184 791553266  4020 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
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
check_way.sh 8184 1208140413 6030 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8184 925758087 4010 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8184 1035236428 6000 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8184 71442018   6030 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8184 781159290  6030 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8184 976483582  5340 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8184 450095808  5340 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8184 23318099   5340 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8184 1349878350 5340 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8184 1349878460 5340 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8184 1069834703 5340 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8184 1202570709 5340 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8184 1349878918 5340 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8184 1349878998 5340 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8184 152631107  5340 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8184 152631111  5340 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8184 22887908   5340 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8184 976483580  5340 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8184 976483579  5340 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8184 976483578  5340 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8184 976483577  5340 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8184 872042470  5340 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
#
check_area.sh 8184 1023804545 2460 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_area.sh 8184 1019781838 3160 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_area.sh 8184 1019785868 3160 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_area.sh 8184 1019781961 3160 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_area.sh 8184 1023804544 3570 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_area.sh 8184 1035235418 6030 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_area.sh 8184 1035236055 6030 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_area.sh 8184 1021713896 6030 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_area.sh 8184 1035238879 6030 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_area.sh 8184 1035239052 6030 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_area.sh 8184 1035238554 6030 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_area.sh 8184 1130166395 4010 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_area.sh 8184 1035237110 4010 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_area.sh 8184 1035238555 4010 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_area.sh 8184 1035238702 4010 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_area.sh 8184 875903737  4070 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_area.sh 8184 1130122698 4070 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_area.sh 8184 1130131919 4070 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_area.sh 8184 1021729709 4070 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_area.sh 8184 1130161427 4070 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_area.sh 8184 1349877382 5340 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow

#
# Flooding due to the Ouse downstream of Clifton Ings Outfall
# https://check-for-flooding.service.gov.uk/station/9347
# n/a

#
# Potential flooding downstream and just upstream of Viking Recorder
# https://check-for-flooding.service.gov.uk/station/8208
#
check_way.sh 8208 1010016224 4350 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8208 1010016226 4350 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8208 1034923971 3230 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8208 1034924719 3230 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8208 1041669749 0790 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8208 1185121214 3840 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8208 1185121215 3840 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8208 1185121216 3840 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8208 1226347411 3840 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8208 128011228  3840 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8208 133317874  3840 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8208 133317875  0740 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8208 133317876  3840 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8208 180848944  3840 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8208 180848947  3840 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8208 233738687  3050 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8208 245666499  3840 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8208 25950308   2950 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8208 314934003  3840 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8208 352872949  3840 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8208 4474156    3840 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8208 450095809  3840 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8208 471280135  3430 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8208 641079622  3840 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8208 641079634  3840 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8208 672094683  3840 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8208 684039718  3840 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8208 759476780  3840 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8208 84039718   3640 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8208 92162932   3640 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8208 944914270  4000 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8208 952184983  4000 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8208 974445334  4000 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8208 4486181    3840 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8208 54992809   3840 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8208 25950306   3840 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8208 1020646883 3840 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8208 1348390886 3840 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8208 1348390953 3840 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8208 151610538  3840 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8208 151610522  3840 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8208 151610535  3840 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8208 151610533  3840 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
#
check_area.sh 8208 281131445  3530 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_area.sh 8208 1034925077 3230 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_area.sh 8208 1034925321 3230 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_area.sh 8208 1064721928 3230 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow

#
# Potential flooding on the Derwent just upstream of Stamford Bridge
# https://check-for-flooding.service.gov.uk/station/8280
#
check_way.sh 8280 1238985279 8780 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
check_way.sh 8280 1238998434 8780 ${local_filesystem_user} ${local_renderd_user} >> /home/${local_filesystem_user}/data/ea_floods.justnow
#

echo " " >> /home/${local_filesystem_user}/data/ea_floods.justnow
echo "Flooded:" >> /home/${local_filesystem_user}/data/ea_floods.justnow
sudo -u ${local_renderd_user} psql -d gis -c '\pset format csv' -c "SELECT osm_id FROM planet_osm_line WHERE (wetland = 'flooded');" | sort | sed "s/^/http:\/\/osm.org\/way\//" >> /home/${local_filesystem_user}/data/ea_floods.justnow
#
echo " " >> /home/${local_filesystem_user}/data/ea_floods.justnow
echo "Not Flooded:" >> /home/${local_filesystem_user}/data/ea_floods.justnow
sudo -u ${local_renderd_user} psql -d gis -c "SELECT osm_id FROM planet_osm_line WHERE (wetland = 'not_flooded');" | grep rows >> /home/${local_filesystem_user}/data/ea_floods.justnow
#
diff /home/${local_filesystem_user}/data/ea_floods.previously /home/${local_filesystem_user}/data/ea_floods.justnow
#
