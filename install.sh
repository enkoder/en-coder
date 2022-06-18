#! /usr/bin/env bash

cd $HOME
sh -c "$(curl -fsLS chezmoi.io/get)" 
~/bin/chezmoi init --apply https://github.com/enkoder/dotz.git
