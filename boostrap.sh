#!/usr/bin/env bash
#
# bootstrap script, assumed to be run as root
#
# to used it as vagrant provision shell script, invoke with parameter 'vagrant'
#

# update package list
sed -i 's/archive\.ubuntu\.com/ftp\.cuhk\.edu\.hk\/pub\/Linux/g' /etc/apt/sources.list
sed -i 's/security\.ubuntu\.com/ftp\.cuhk\.edu\.hk\/pub\/Linux/g' /etc/apt/sources.list
apt-get update
apt-get upgrade

apt-get -y install python-software-properties

# setup proper locale
locale-gen en_HK.utf8 zh_TW.utf8
update-locale LC_ALL=zh_TW.utf8 LANG=zh_TW.utf8
export LANG=zh_TW.UTF8

# install required packages
apt-get -y install build-essential git-core git-extras tig wget curl htop tmux \
  exuberant-ctags vim-gtk silversearcher-ag zsh ntp

git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

# install git-extras
#
if [ ! -d ~/src/git-extras ]; then
  git clone git://github.com/tj/git-extras ~/src/git-extras
  cd ~/src/git-extras
  git checkout $(git describe --tags $(git rev-list --tags --max-count=1))
  make install
fi

# install lein
sudo apt install openjdk-11-jdk
sudo apt install ca-certificates-java
sudo update-ca-certificates -f

wget https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein
lein

sudo chmod a+x /usr/local/bin/lein
sudo lein upgrade

# install python3
sudo apt upgrade python3
sudo apt install python3-pip
sudo apt install python3-venv

# others
apt-get install silversearcher-ag

sudo apt-get install tig
sudo apt-get install htop

exit 0

