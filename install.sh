#! /usr/bin/env fish

source home/.config/fish/conf.d/helpers.fish

set FISHER_PLUGINS = ilancosman/tide jethrokuan/z

sudo apt update 
sudo apt install tree fish xutils-dev python3.7

print_step "Setting default shell to fish"
sudo chsh -s /usr/bin/fish (whoami)

print_step "Symlinking home files"
pushd $HOME
lndir (pwd)/dotfiles/home
popd

if ! type -q fisher
    print_step "Installing fisher"
    curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
end

print_step "Installing fisher plugins"
for p in $FISHER_PLUGINS
    echo "Installing $p"
    fisher install  $p
end


pip3.7 install --user virtualfish
vf install

if ! type -q op
    pushd /tmp
    wget https://cache.agilebits.com/dist/1P/op/pkg/v1.10.3/op_linux_amd64_v1.10.3.zip
    unzip op_linux_amd64_v1.10.3.zip
    mkdir -p $HOME/.local/bin
    mv op $HOME/.local/bin
end

