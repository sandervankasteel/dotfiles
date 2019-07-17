#!/bin/bash

function install_kitty_configuration() {
    KITTY_FOUND=$(which kitty)
    
    #&& -h ~/.nanorc
    if [ ! -z $KITTY_FOUND ]; then
        echo 'Installing kitty configuration...'
    else
        echo 'Skipping kitty configuration'
    fi
}

function install_nano_configuration() {
    echo "Installing nano configuration..."
}

function install_zsh_configuration() {
    echo "Installing zsh configuration..."
}

function install_githooks() {
    echo "Installing githooks..."

    echo $(pwd)
}