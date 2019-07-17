#!/bin/bash

# quite_mode = $@

# Import functions.sh
source functions.sh

# Determine all the dotfiles that need installation, excluding githooks (since that might not me desirable all the time)
TO_INSTALL=$(printf '%s\n' */ | sort -r | sed 's:/$::' | sed 's/githooks//')


if [ ! -f .installed.lock ]; then
    echo -n "Do you want to use Githooks apply all changes after fetching the latest sources ? (Y/n) "
    read use_githooks
    use_githooks=$(echo "$use_githooks") | tr '[:upper:]' '[:lower:]' 

    if [[ $use_githooks == 'y' ]]; then
        install_githooks
    fi
fi

# Execute the installation

for DIR in ${TO_INSTALL[@]}
do
    install_${DIR}_configuration 
done

# When everything has run perfectly, create a lock file to prevent double installation
# touch ./.installed.lock
