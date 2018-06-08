#!/bin/bash

#sleep 5        
WINID=$(xdotool search --name 'Google Chrome' | head -n 1)
#echo "Google Chrome WINID is this:"
#echo $WINID
CUR_WID=$(xdotool getwindowfocus)
xdotool windowactivate $WINID
count=0
while true
do
	#echo "Here is xwininfo:" 
	#xwininfo -id $WINID
	xwininfo -id $WINID | grep "localhost" 
	# if $? is 0 we have found our tab! 
	if [ "$?" -ne 0 ]
	then
		#echo "This is not our tab"
		((count++))
		xdotool key --window $WINID 'ctrl+Tab'
	else
		#echo "Found our tab"
		break
	fi
	#sleep 2        
done
echo "Refreshing Chrome"
# we should have found our tab now 
xdotool key --window $WINID 'ctrl+r'
#echo "Count is:" 
#echo $count
#counter=1
#while [ $counter -le $count ]
#do
#	#echo "Tabbing back!" 
#	#echo $counter
#	xdotool key --window $WINID 'ctrl+Shift+Tab'
#	((counter++))
#	#sleep 2        
#done
xdotool windowactivate $CUR_WID
