#!/bin/bash

echo -n "Do you want to use Githooks apply all changes after fetching the latest sources ? (Y/N) "
read use_githooks
use_githooks=$(echo "$use_githooks") | tr '[:upper:]' '[:lower:]' 

if [[ $use_githooks == 'y' ]]; then
    echo -n "Use githooks"
elif [[ $use_githooks == 'n' ]]; then
    echo -n "Don't Use githooks"
else
    echo -n "Parsing of question failed :("
    exit -1;
fi

# touch ./.installed.lock
