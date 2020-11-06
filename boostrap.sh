#!/usr/bin/env bash
#
# bootstrap script, assumed to be run as root
#

set -e

if [[ "$LANG" != "zh_TW.utf8" ]]; then
  locale-gen zh_TW.utf8
  update-locale LC_ALL=zh_TW.utf8 LANG=zh_TW.utf8
fi

timedatectl set-timezone Asia/Taipei

apt update
DEBIAN_FRONTEND=noninteractive apt -y -o DPkg::options::="--force-confdef" -o DPkg::options::="--force-confold" upgrade
apt autoremove -y

apt install -y curl htop silversearcher-ag poppler-utils tree unzip wget
apt install -y autoconf build-essential default-jdk libssl1.0-dev libreadline-dev \
               libxml2-dev libxslt1-dev zlib1g-dev libpq-dev libsqlite3-dev \
              python-dev python-pip python3-dev python3-pip nginx
# apt install -y postgresql postgresql-contrib redis-server

# 2 new items need to install for ubuntu 18
apt install -y fontconfig # fc-list & fc-cache
apt install -y zip

# install zsh
apt install -y libncurses5-dev yodl
git clone git://github.com/zsh-users/zsh.git /tmp/zsh --branch zsh-5.7.1 --depth 1
cd /tmp/zsh
./Util/preconfig
./configure --with-tcsetpgrp
make && make check && sudo make install

# # install git
# apt install -y libcurl4-gnutls-dev libexpat1-dev gettext libz-dev libssl1.0-dev
# git clone git://github.com/git/git.git /tmp/git --branch v2.25.0 --depth 1
# cd /tmp/git
# make all prefix=/usr/local
# make install prefix=/usr/local

# install tmux
apt install -y pkg-config libevent-dev bison
git clone git://github.com/tmux/tmux.git /tmp/tmux --branch 3.1 --depth 1
cd /tmp/tmux
sh autogen.sh
./configure
make && make install
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# install tig
apt install -y libncursesw5-dev
git clone git://github.com/jonas/tig.git /tmp/tig --branch tig-2.3.3 --depth 1
cd /tmp/tig
make ./configure
./configure
make prefix=/usr/local
make install prefix=/usr/local

# # install vim
# apt install -y exuberant-ctags
# git clone git://github.com/vim/vim.git /tmp/vim --branch v8.1.0117 --depth 1
# cd /tmp/vim
# ./configure --with-features=big --enable-fail-if-missing
# make && make install

# install neovim
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install -y neovim
mkdir -p ~/.config/nvim
# wget https://github.com/MarkWengSTR/win_dotfiles/blob/master/init.vim ~/.config/nvim/init.vim

if [[ -r /usr/local/bin/zsh ]]; then
  chsh -s /usr/local/bin/zsh
fi

# install yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
apt update && apt install -y yarn
# remove outdated nodejs with yarn
apt remove -y --purge nodejs

# Install asdf
asdf_dir=$HOME/.asdf
cd $HOME

if [ ! -d $asdf_dir  ]; then
  echo "Installing asdf..."
  apt install jq -y # for asdf java
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.0
  . ~/.asdf/asdf.sh

  echo "asdf installation complete"
else
  echo "asdf already installed"
fi

asdf plugin-add java    ||   true
# asdf plugin-add nodejs  ||   true
# asdf plugin-add clojure ||   true
# asdf plugin-add rust    ||   true
# asdf plugin-add python  ||   true
# asdf plugin-add golang  ||   true
# asdf plugin-add ruby    ||   true

asdf install java openjdk-11 || true
asdf global java openjdk-11

exit 0
# # install libreoffice
# cd /tmp
# wget -nv http://downloadarchive.documentfoundation.org/libreoffice/old/4.2.8.2/deb/x86_64/LibreOffice_4.2.8.2_Linux_x86-64_deb.tar.gz
# tar xvf LibreOffice_4.2.8.2_Linux_x86-64_deb.tar.gz
# cd LibreOffice_4.2.8.2_Linux_x86-64_deb/DEBS
# dpkg -i *.deb
# ln -sf `readlink /usr/bin/libreoffice4.2` /usr/local/bin/libreoffice

# install phantomjs (skip this because takes very long time)
# cd /tmp
# wget -nv https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2
# tar xvjf phantomjs-2.1.1-linux-x86_64.tar.bz2
# mv -f phantomjs-2.1.1-linux-x86_64 /usr/local/share/phantomjs-2.1.1
# ln -sf /usr/local/share/phantomjs-2.1.1/bin/phantomjs /usr/local/bin/phantomjs

# # allow vagrant login by password (for pair session)
# if [[ -z $(grep 'PasswordAuthentication yes' /etc/ssh/sshd_config) ]]; then
#   echo -e "\nMatch User vagrant\n  PasswordAuthentication yes" >> /etc/ssh/sshd_config
#   sshd -t && service ssh reload
# fi

# if [[ -z $(sudo -u postgres psql -t -c '\du' | cut -d \| -f 1 | grep vagrant) ]]; then
#   sudo -u postgres createuser vagrant -s
# fi

# # install pdftk (with libpng12 dependency)
# wget -q -O /tmp/libpng12.deb https://launchpad.net/ubuntu/+archive/primary/+files/libpng12-0_1.2.54-1ubuntu1_amd64.deb
# sudo dpkg -i /tmp/libpng12.deb
# rm /tmp/libpng12.deb
# wget -q -O /tmp/pdftk-java.deb https://launchpad.net/ubuntu/+archive/primary/+files/pdftk-java_3.0.9-1_all.deb
# sudo apt --fix-broken install /tmp/pdftk-java.deb -y
# rm /tmp/pdftk-java.deb

