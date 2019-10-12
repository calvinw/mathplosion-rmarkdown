#!/bin/bash
echo "curl being called" 
result=$(curl -F name=CalculateZValue.docx -F file=@CalculateZValue.docx https://uguu.se/api.php?d=upload-tool)
echo "result of curl"
echo $result
#echo "https://view.officeapps.live.com/op/embed.aspx?src=$result"
wordviewerurl="https://view.officeapps.live.com/op/embed.aspx?src=$result"
echo "url for showing word docx"
echo $wordviewerurl
xdg-open $wordviewerurl 
