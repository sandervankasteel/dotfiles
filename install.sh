#!/bin/bash

# Import functions.sh
source functions.sh

# Determine all the dotfiles that need installation, excluding githooks (since that might not me desirable all the time)
to_install=$(printf '%s\n' */ | sort -r | sed 's:/$::' | sed 's/githooks//')

# Only ask if the user, if he/she wants to use Githooks if we aren't installed already
if [ ! -f .installed.lock ]; then
    echo -n "Do you want to use Githooks apply all changes after fetching the latest sources ? (Y/n) "
    read use_githooks
    use_githooks=$(echo "$use_githooks") | tr '[:upper:]' '[:lower:]' 

    if [[ $use_githooks == 'y' ]]; then
        install_githooks
    fi
fi

# Execute the installation of the configuration files
for APPLICATION_NAME in ${to_install[@]}
do
    # Only run the install_${APPLICATION_NAME}_configuration function if that function is defined
    if [ "$(type -t install_${APPLICATION_NAME}_configuration)" = "function" ]; then
        install_${APPLICATION_NAME}_configuration 
    else
        echo "Skipping installation of ${APPLICATION_NAME}'s configuration files because a \`install_${APPLICATION_NAME}_configuration\` function isn't defined"
    fi
done

# When everything has run perfectly, create a lock file to prevent double installation
# touch ./.installed.lock
