display dialog "Commit all " default answer "" buttons {"Cancel", "Commit"} default button 2
text returned of the result
do shell script "git add -A && git commit -m '" & result & "'"
