#!/bin/bash
# Simple setup.sh for configuring Ubuntu 12.04 LTS EC2 instance
# for headless setup. 

# Install nvm: node-version manager
# https://github.com/creationix/nvm
sudo apt-get install -y git
sudo apt-get install -y curl
curl https://raw.github.com/creationix/nvm/master/install.sh | sh

# Load nvm and install latest production node
source $HOME/.nvm/nvm.sh
nvm install v0.10.12
nvm use v0.10.12

# Install jshint to allow checking of JS code within emacs
# http://jshint.com/
npm install -g jshint

# Install rlwrap to provide libreadline features with node
# See: http://nodejs.org/api/repl.html#repl_repl
sudo apt-get install -y rlwrap

# Install emacs24
# https://launchpad.net/~cassou/+archive/emacs
#sudo apt-add-repository -y ppa:cassou/emacs
#sudo apt-get -qq update
#sudo apt-get install -y emacs24-nox emacs24-el emacs24-common-non-dfsg

# Install Heroku toolbelt
# https://toolbelt.heroku.com/debian
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh

# Install vim
sudo apt-get install -y vim

#install screen
sudo apt-get install -y screen

#install cmake
sudo apt-get install -y cmake

#install g++ compiler
sudo apt-get install -y g++

# git pull and install dotfiles as well
cd $HOME
if [ -d ./linux_config/ ]; then
    mv linux_config linux_config.old
fi
#if [ -d .vim/ ]; then
#    mv .vim .vim.old
#fi
#git clone https://github.com/startup-class/dotfiles.git
git clone https://github.com/nitthilan/linux_config.git
ln -sb linux_config/.screenrc .
ln -sb linux_config/.bash_profile .
ln -sb linux_config/.bashrc .
ln -sb linux_config/.bashrc_custom .
ln -sf linux_config/.vim .
ln -sf linux_config/.vimrc .

