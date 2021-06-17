#! /usr/bin/env fish

source .config/fish/conf.d/helpers.fish

set FISHER_PLUGINS = ilancosman/tide jethrokuan/z

sudo apt update 
sudo apt install tree fish

print_step "Setting default shell to fish"
sudo chsh -s /usr/bin/fish (whoami)

print_step "Symlinking .config files"
for f in (find .config -type f)
    echo $f
    mkdir -p (dirname $f)
    ln -sf (pwd)/$f ~/$f
end 

if ! type -q fisher
    print_step "Installing fisher"
    curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
end

print_step "Installing fisher plugins"
for p in $plugins
    echo "Installing $p"
    fisher install 
end


