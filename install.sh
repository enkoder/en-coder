#! /usr/bin/env fish

source home/.config/fish/conf.d/helpers.fish

set FISHER_PLUGINS = ilancosman/tide jethrokuan/z

sudo add-apt-repository ppa:jonathonf/vim
sudo apt update 
sudo apt install --yes gcc tree fish xutils-dev python3.7 unzip vim

if ! type -q nvim
    sudo add-apt-repository ppa:neovim-ppa/stable
    sudo apt-get update
    sudo apt-get install neovim
end

# vimplug
if ! test -e ~/.vim/autoload/plug.vim
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
end

print_step "Setting default shell to fish"
sudo chsh -s /usr/bin/fish (whoami)

print_step "Symlinking home files"
pushd $HOME
lndir (pwd)/dotfiles/home
popd

if ! type -q fisher
    print_step "Installing fisher"
    curl -sL https://git.io/fisher | source
    fisher install jorgebucaran/fisher
end

print_step "Installing fisher plugins"
for p in $FISHER_PLUGINS
    echo "Installing $p"
    fisher install  $p
end


python3.7 -m pip install virtualfish
vf install

if ! type -q op
    pushd /tmp
    wget https://cache.agilebits.com/dist/1P/op/pkg/v1.10.3/op_linux_amd64_v1.10.3.zip
    unzip op_linux_amd64_v1.10.3.zip
    mkdir -p $HOME/.local/bin
    mv op $HOME/.local/bin
end

