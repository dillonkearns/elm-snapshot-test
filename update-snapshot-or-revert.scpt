display dialog "Update snapshot?" default answer "" buttons {"Revert", "Commit Snapshot"} default button 2
text returned of the result
do shell script "npx jest -u && git add -A && git commit -m '" & result & "'"
