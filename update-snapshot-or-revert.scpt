display dialog "Update snapshot?" default answer "" buttons {"Cancel", "Commit Snapshot"} default button 2
text returned of the result
do shell script "npx jest --config=default-jest.config.js -u && git add -A && git commit -m '" & result & "'"
