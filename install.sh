#! /usr/bin/env bash

cd $HOME
sh -c "$(curl -fsLS chezmoi.io/get)"
~/bin/chezmoi --force init --apply https://github.com/enkoder/dotz.git
