# ------------------------------------------------------------------------------
# check_way.sh
# $1 is the way ID
# ------------------------------------------------------------------------------
desired_station=8235
test_height=1017
current_heightm=`./get_station.sh $desired_station`
current_height=`bc <<< "scale=0; ${current_heightm} * 1000/1"`
#bc <<< "scale=0; ${current_heightm} * 1000/1"
#
#echo $current_height
if [[ "$current_height" -lt "$test_height" ]]; then
    echo "current height is less"
elif [[ "$current_height" -gt "$test_height" ]]; then
    echo "current height is more"
else
    echo "current height is the same"
fi
#
