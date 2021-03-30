########################
# initial setup
########################

# open tmux
# tmux -2 attach || tmux new

# export GOPATH=$HOME/gopath
# export PATH=$PATH:$HOME/go/bin:$GOPATH/bin

# sudo service postgresql restart

# shell environment initialization {{{

if [[ ! -d ~/.dotfiles ]]; then
  git clone https://github.com/MarkWengSTR/win_dotfiles.git ~/.dotfiles

  # ln -sf ~/dotfiles/gemrc               ~/.gemrc
# ln -sf ~/win_dotfiles/inputrc             ~/.inputrc
# ln -sf ~/win_dotfiles/psqlrc              ~/.psqlrc
  ln -sf ~/win_dotfiles/tigrc               ~/.tigrc
  ln -sf ~/win_dotfiles/tmux.conf           ~/.tmux.conf
  # ln -sf ~/dotfiles/vimrc.local         ~/.vimrc.local
  # ln -sf ~/dotfiles/vimrc.bundles.local ~/.vimrc.bundles.local
fi

# if [[ ! -d ~/.maximum-awesome ]]; then
#   git clone git://github.com/square/maximum-awesome.git ~/.maximum-awesome
#   git clone https://github.com/VundleVim/Vundle.vim.git ~/.maximum-awesome/vim/bundle/Vundle.vim

#   ln -sf ~/.maximum-awesome/vim ~/.vim
#   ln -sf ~/.maximum-awesome/vimrc ~/.vimrc
#   ln -sf ~/.maximum-awesome/vimrc.bundles ~/.vimrc.bundles

#   vim +BundleInstall +qall
# fi

# }}}


########################
# Zplug
########################
### Added by Zinit's installer
# install zinit, if necessary
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

### End of Zinit's installer chunk

zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-history-substring-search
zinit light zdharma/fast-syntax-highlighting

zinit ice as="program" pick="$ZPFX/bin/(fzf|fzf-tmux)" \
  atclone="./install;cp bin/(fzf|fzf-tmux) $ZPFX/bin"
zinit light junegunn/fzf

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_TMUX=1

# Load the pure theme, with zsh-async library that's bundled with it.
# zinit ice pick"async.zsh" src"pure.zsh"
# zinit light sindresorhus/pure
zinit ice pick"async.zsh" src"lambda-pure.zsh"
zinit light marszall87/lambda-pure

# need to install svn, `sudo apt-get install subversion`
# keep git after pure, don't know why
zinit ice svn
zinit snippet PZT::modules/git

zinit snippet PZT::modules/environment
zinit snippet PZT::modules/completion
zinit snippet PZT::modules/history
zinit snippet PZT::modules/rsync
zinit snippet PZT::modules/directory

########################
# General
########################
#
# environment variables {{{
export EDITOR=nvim
export VISUAL=nvim
#}}}

# key bindings {{{
# bindkey -M vicmd '^a' beginning-of-line
# bindkey -M vicmd '^e' end-of-line
bindkey '^a' beginning-of-line
bindkey '^e' end-of-line

bindkey '^f' vi-forward-word
bindkey '^b' vi-backward-word

bindkey '^o' autosuggest-accept

bindkey '^p' history-substring-search-up
bindkey '^n' history-substring-search-down

bindkey ',,' cancel-whole-input
# }}}


# Disable flow control then we can use ctrl-s to save in vim
# Disable flow control commands (keeps C-s from freezing everything)
stty start undef
stty stop undef

# asdf setting
# . $HOME/.asdf/asdf.sh
# . $HOME/.asdf/completions/asdf.bash

# User configuration
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="$PATH:$HOME/bin"

# this setting is also affect language in Vim
# export LC_ALL=en_US.UTF-8
# export LANG=en_US.UTF-8
# export LC_CTYPE=en_US.UTF-8

# # disable START/STOP output control (<C-S>, <C-Q>)
# stty -ixon # disable XON/XOFF flow control

# . $HOME/.asdf/asdf.sh
# . $HOME/.asdf/completions/asdf.bash

# directory shortcut {{{
p()  { cd ~/proj/$1;}
h()  { cd ~/$1;}
vm() { cd ~/vagrant/$1;}

compctl -W ~/proj -/ p
compctl -W ~ -/ h
compctl -W ~/vagrant -/ vm
# }}}

# development shortcut {{{
alias pa!='bundle exec puma -C config/puma.rb -b tcp://127.0.0.1:8080'
# alias pa!='[[ -f config/puma.rb ]] && RAILS_RELATIVE_URL_ROOT=/`basename $PWD` bundle exec puma -C $PWD/config/puma.rb -b tcp://127.0.0.1:8080'
# alias pa='[[ -f config/puma.rb ]] && RAILS_RELATIVE_URL_ROOT=/`basename $PWD` bundle exec puma -C $PWD/config/puma.rb -d tcp://127.0.0.1:8080'
# alias kpa='[[ -f tmp/pids/puma.state ]] && bundle exec pumactl -S tmp/pids/puma.state stop'

alias v='sudo nvim'
alias mc='mailcatcher --http-ip 0.0.0.0'
alias kmc='pkill -fe mailcatcher'
alias sk='[[ -f config/sidekiq.yml ]] && bundle exec sidekiq -C $PWD/config/sidekiq.yml -d'
alias ksk='pkill -fe sidekiq'
alias dump_db='/home/markweng/.vm/scripts/dump_db.zsh'
# alias mg_skip='rake db:migrate SKIP_PATCHING_MIGRATION='\''skip_any_patching_related_migrations'\'
alias mg='rake db:migrate'
alias rb='rake db:rollback'
alias rgm='rails generate migration'
alias gsh='git stash'
alias gia='ga'
alias gs='git status'
alias ll='ls -al'
alias eee='exit'
alias skmg="rake db:migrate SKIP_PATCHING_MIGRATION='skip_any_patching_related_migrations'"
alias ggpull='git pull origin'
alias gsh0='git stash pop stash@{0}'
alias y='yarn'
alias ys='yarn start'
alias c='clear'
alias tm='tmux attach || tmux new'
alias px='ps aux'
alias vt='vim -c :CtrlP'

alias sa='ssh-add'
alias salock='ssh-add -x'
alias saunlock='ssh-add -X'

alias agi='ag -i'
alias agr='ag --ruby'
alias agri='ag --ruby -i'

alias -g G='| ag'
alias -g P='| $PAGER'
alias -g WC='| wc -l'
alias -g RE='RESCUE=1'

# git 
alias g='git'

alias ga='git add'
alias gaa='git add --all'
alias gapa='git add --patch'
alias gau='git add --update'
alias gav='git add --verbose'
alias gap='git apply'

alias gb='git branch'
alias gba='git branch -a'
alias gbd='git branch -d'
alias gbda='git branch --no-color --merged | command grep -vE "^(\+|\*|\s*(master|develop|dev)\s*$)" | command xargs -n 1 git branch -d'
alias gbD='git branch -D'
alias gbl='git blame -b -w'
alias gbnm='git branch --no-merged'
alias gbr='git branch --remote'
alias gbs='git bisect'
alias gbsb='git bisect bad'
alias gbsg='git bisect good'
alias gbsr='git bisect reset'
alias gbss='git bisect start'

alias gc!='git commit -v --amend'
alias gcn!='git commit -v --no-edit --amend'
alias gca='git commit -v -a'
alias gca!='git commit -v -a --amend'
alias gcan!='git commit -v -a --no-edit --amend'
alias gcans!='git commit -v -a -s --no-edit --amend'
alias gcam='git commit -a -m'
alias gcsm='git commit -s -m'
alias gcb='git checkout -b'
alias gcf='git config --list'
alias gcl='git clone --recurse-submodules'
alias gclean='git clean -id'
alias gpristine='git reset --hard && git clean -dffx'
alias gcm='git checkout master'
alias gcd='git checkout develop'
alias gcmsg='git commit -m'
alias gco='git checkout'
alias gcount='git shortlog -sn'
alias gcp='git cherry-pick'
alias gcpa='git cherry-pick --abort'
alias gcpc='git cherry-pick --continue'
alias gcs='git commit -S'
alias gc='git commit --verbose'
alias gpcc='cop master... && gpc'
alias gpc='git push --set-upstream origin $(git_current_branch)'

alias gd='git diff'
alias gdca='git diff --cached'
alias gdcw='git diff --cached --word-diff'
alias gdct='git describe --tags $(git rev-list --tags --max-count=1)'
alias gds='git diff --staged'
alias gdt='git diff-tree --no-commit-id --name-only -r'
alias gdw='git diff --word-diff'
alias gdm='git diff master...'
alias gdfH='git diff HEAD'

function gdv() { git diff -w "$@" | view - }

alias gf='git fetch'
alias gfa='git fetch --all --prune'
alias gfo='git fetch origin'

alias gfg='git ls-files | grep'

alias gg='git gui citool'
alias gga='git gui citool --amend'

# goto dirt
alias sbox='cd /mnt/c/Users/bskin/Documents/sandbox'
alias docu='cd /mnt/c/Users/bskin/Documents'
alias u_rp='cd /mnt/c/Users/bskin/Documents/u_report'

# alias va=vagrant
# alias vsh='va ssh'
# alias vsf='va ssh -- -L 0.0.0.0:8080:localhost:80 -L 1080:localhost:1080'
# alias vup='va up'
# alias vsup='va suspend'
# alias vhalt='va halt'

pairg() { ssh -t $1 ssh -o 'StrictHostKeyChecking=no' -o 'UserKnownHostsFile=/dev/null' -p $2 -t vagrant@localhost 'tmux attach' }
pairh() { ssh -S none -o 'ExitOnForwardFailure=yes' -R $2\:localhost:22222 -t $1 'watch -en 10 who' }

# ZSH_DISABLE_COMPFIX = true

# cop() {
#   local exts=('rb,thor,jbuilder')
#   local excludes=':(top,exclude)db/schema.rb'
#   local extra_options='--display-cop-names --rails'

#   if [[ $# -gt 0 ]]; then
#     local files=$(eval "git diff $@ --diff-filter=d --name-only -- \*.{$exts} '$excludes'")
#   else
#     local files=$(eval "git status --porcelain -- \*.{$exts} '$excludes' | sed -e '/^\s\?[DRC] /d' -e 's/^.\{3\}//g'")
#   fi
#   # local files=$(eval "git diff --name-only -- \*.{$exts} '$excludes'")

#   if [[ -n "$files" ]]; then
#     echo $files | xargs bundle exec rubocop `echo $extra_options`
#   else
#     echo "Nothing to check. Write some *.{$exts} to check.\nYou have 20 seconds to comply."
#   fi
# }
# }}}

# 重啟 puma/unicorn（非 daemon 模式，用於 pry debug）
rpy() {
  if bundle show pry-remote > /dev/null 2>&1; then
    bundle exec pry-remote
  else
    rpu pry
  fi
}

# 重啟 puma/unicorn
#
# - rpu       → 啟動或重啟（如果已有 pid）
# - rpu kill  → 殺掉 process，不重啟
# - rpu xxx   → xxx 參數會被丟給 pumactl（不支援 unicorn）
rpu() {
  emulate -L zsh
  if [[ -d tmp ]]; then
    local action=$1
    local pid
    local animal

    if [[ -f config/puma.rb ]]; then
      animal='puma'
    elif [[ -f config/unicorn.rb ]]; then
      animal='unicorn'
    else
      echo "No puma/unicorn directory, aborted."
      return 1
    fi

    if [[ -r tmp/pids/$animal.pid && -n $(ps h -p `cat tmp/pids/$animal.pid` | tr -d ' ') ]]; then
      pid=`cat tmp/pids/$animal.pid`
    fi

    if [[ -n $action ]]; then
      case "$action" in
        pry)
          if [[ -n $pid ]]; then
            kill -9 $pid && echo "Process killed ($pid)."
          fi
          rserver_restart $animal
          ;;
        kill)
          if [[ -n $pid ]]; then
            kill -9 $pid && echo "Process killed ($pid)."
          else
            echo "No process found."
          fi
          ;;
        *)
          if [[ -n $pid ]]; then
            # TODO: control unicorn
            pumactl -p $pid $action
          else
            echo 'ERROR: "No running PID (tmp/pids/puma.pid).'
          fi
      esac
    else
      if [[ -n $pid ]]; then
        # Alternatives:
        # pumactl -p $pid restart
        # kill -USR2 $pid && echo "Process killed ($pid)."

        # kill -9 (SIGKILL) for force kill
        kill -9 $pid && echo "Process killed ($pid)."
        rserver_restart $animal $([[ "$animal" == 'puma' ]] && echo '-d' || echo '-D')
      else
        rserver_restart $animal $([[ "$animal" == 'puma' ]] && echo '-d' || echo '-D')
      fi
    fi
  else
    echo 'ERROR: "tmp" directory not found.'
  fi
}

# 這是 rpu 會用到的 helper function
rserver_restart() {
  local app=${$(pwd):t}
  [[ ! $app =~ '^(amoeba|cam|angel|nerv_ck)' ]] && app='nerv' # support app not named 'nerv' (e.g., nerv2)

  case "$1" in
    puma)
      shift
      RAILS_RELATIVE_URL_ROOT=/$app bundle exec puma -C config/puma.rb config.ru $*
      ;;
    unicorn)
      shift
      RAILS_RELATIVE_URL_ROOT=/$app bundle exec unicorn -c config/unicorn.rb $* && echo 'unicorn running'
      ;;
    *)
      echo 'invalid argument'
  esac
}

# tmux shortcut {{{
tx() {
  if ! tmux has-session -t work 2> /dev/null; then
    tmux new -s work -d;
    # tmux splitw -h -p 40 -t work;
    # tmux select-p -t 1;
  fi
  tmux attach -t work;
}
txtest() {
  if ! tmux has-session -t test 2> /dev/null; then
    tmux new -s test -d;
  fi
  tmux attach -t test;
}
txpair() {
  SOCKET=/home/share/tmux-pair/default
  if ! tmux -S $SOCKET has-session -t pair 2> /dev/null; then
    tmux -S $SOCKET new -s pair -d;
    # tmux -S $SOCKET send-keys -t pair:1.1 "chmod 1777 " $SOCKET C-m "clear" C-m;
  fi
  tmux -S $SOCKET attach -t pair;
}
fixssh() {
  if [ "$TMUX" ]; then
    export $(tmux showenv SSH_AUTH_SOCK)
  fi
}
# }}}

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
