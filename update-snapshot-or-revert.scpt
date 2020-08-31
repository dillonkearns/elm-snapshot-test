try
    display dialog "Update snapshot?" default answer "" buttons {"Cancel", "Commit Snapshot"} default button 2
    text returned of the result
    do shell script "npx jest --no-cache -u && git add -A && git commit -m '" & result & "'"
on error
    do shell script "git checkout ."
end