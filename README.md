# floodedmap
Use wetland value in an "OpenStreetMap Carto AJT" database to indicate currently flooded status.

## Introduction
I have some information locally along the lines of "If the value recorded at 
Environment Agency river level monitoring station X is above Y, then path Z will
be flooded".  These are all from survey.  

An example is https://www.openstreetmap.org/way/37535250 .  Currently the data
is just in scripts here, and in OSM as note tags rather than machine-readable data in OSM.  
If a path is flooded, it looks like this:

![screenshot](https://raw.githubusercontent.com/SomeoneElseOSM/floodedmap/main/files/Screenshot_20221210_232709.png)

In addition to paths, water areas that flood at predictable river levels are also shown.

## River level monitoring stations
In this example, the referenced station is 
https://www.openstreetmap.org/node/8373389773 , which corresponds to 
https://check-for-flooding.service.gov.uk/station/8235 , which 
is the downstream station.  The upstream station is 
https://check-for-flooding.service.gov.uk/station/9305 .  
Generally speaking, the upstream station will lead and downstream station will lag as water rises.
In this example it's complicated by the flood alleviation works under construction 
at https://www.openstreetmap.org/way/1080982495 .
In this example, experience suggests in this case the downstream station is the better 
indicator.

## Map Style
The map style used is a candidate for the "simplest ever renderd / mod_tile / 
carto map style".  "project.mml" contains two simple select statements (looking 
for lines and areas where "wetland=flooded") and includes one .mss file only which defines
colours and line widths for flooded lines and areas.

It's supposed to be an "in your face" overlay for a normal map, so the fact that
there's no z_order processing isn't a problem.  The colour used for the line overlay is 
designed to "look like water, but not be mistakable for the normal water colour".

Because the style is _only_ an overlay - no background land polygons or water 
polygons are displayed, and no background such as 
https://github.com/SomeoneElseOSM/openstreetmap-carto-AJT/blob/master/style.mss#L2 
is set, there's no need to make anything transparent.

## Setting "flooded" status
The "update_floods.sh" script does this.  That calls "check_way.sh" and  
"check_area.sh" several times, which use "get_station.sh" to get 
"check-for-flooding.service.gov.uk"'s OGL3 data.
Data from EA stations is cached - if data has been read within the last 15 minutes,
it will not be re-read.
