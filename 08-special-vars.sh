#!/bin/bash
echo "all varaiables passed: $@"
echo "number of variables: $#"
echo "script name: $0"
echo "present working directory: $PWD"
echo "home directory of user: $USER"
echo "which user is running the script: $USER"
echo "process id of present script: $$"
sleep 60 &
echo "process id of last command of background: $1"