# shell environment initialization {{{

if [[ ! -d ~/.win_dotfiles ]]; then
  git clone https://github.com/MarkWengSTR/win_dotfile.git ~/.win_dotfiles

  ln -sf ~/.win_dotfiles/tigrc               ~/.tigrc
  ln -sf ~/.win_dotfiles/tmux.conf           ~/.tmux.conf
  ln -sf ~/.win_dotfiles/vimrc               ~/.vimrc
  ln -sf ~/.win_dotfiles/vimrc.local         ~/.vimrc.local
  ln -sf ~/.win_dotfiles/vimrc.bundles       ~/.vimrc.bundles
  ln -sf ~/.win_dotfiles/vimrc.bundles.local ~/.vimrc.bundles.local
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

# zplug {{{
. ~/.zplugin

# install zplug, if necessary
# if [[ ! -d ~/.zplug ]]; then
#   export ZPLUG_HOME=~/.zplug
#   git clone https://github.com/zplug/zplug $ZPLUG_HOME
# fi

# source ~/.zplug/init.zsh

# zplug "plugins/vi-mode", from:oh-my-zsh
# zplug "plugins/chruby",  from:oh-my-zsh
# zplug "plugins/bundler", from:oh-my-zsh
# zplug "plugins/rails",   from:oh-my-zsh
# zplug "plugins/asdf",    from:oh-my-zsh
# zplug "plugins/git",     from:oh-my-zsh
# zplug "plugins/utility", from:oh-my-zsh
# zplug "plugins/ssh", from:oh-my-zsh
# # zplug "plugins/zsh-history-substring-search", from:oh-my-zsh
# # zplug "plugins/zsh-syntax-highlighting", from:oh-my-zsh

# zplug "b4b4r07/enhancd", use:init.sh
# zplug "junegunn/fzf", as:command, hook-build:"./install --bin", use:"bin/{fzf-tmux,fzf}"

# # zplug "zsh-users/zsh-autosuggestions", defer:3

# zplug "zdharma/zsh-diff-so-fancy", as:command, use:bin/git-dsf

# zplug 'dracula/zsh', as:theme

# # zim {{{
# zplug "zimfw/zimfw", as:plugin, use:"init.zsh", hook-build:"ln -sf $ZPLUG_REPOS/zimfw/zimfw ~/.zim"

# zmodules=(directory environment git git-info history input ssh utility \
#           syntax-highlighting history-substring-search prompt completion)

# zhighlighters=(main brackets pattern cursor root)
# # }}}

# if ! zplug check --verbose; then
#   zplug install
# fi

# zplug load #--verbose

# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=240'

# source ~/.zplug/repos/junegunn/fzf/shell/key-bindings.zsh
# source ~/.zplug/repos/junegunn/fzf/shell/completion.zsh

# export FZF_COMPLETION_TRIGGER=';'
# export FZF_TMUX=1

# }}}

# disable START/STOP output control (<C-S>, <C-Q>)
stty -ixon # disable XON/XOFF flow control

# customization {{{

# directory shortcut {{{
p()  { cd ~/proj/$1;}
h()  { cd ~/$1;}
vm() { cd ~/vagrant/$1;}

compctl -W ~/proj -/ p
compctl -W ~ -/ h
compctl -W ~/vagrant -/ vm
# }}}

# development shortcut {{{
alias pa!='[[ -f config/puma.rb ]] && RAILS_RELATIVE_URL_ROOT=/`basename $PWD` bundle exec puma -C $PWD/config/puma.rb'
alias pa='[[ -f config/puma.rb ]] && RAILS_RELATIVE_URL_ROOT=/`basename $PWD` bundle exec puma -C $PWD/config/puma.rb -d'
alias kpa='[[ -f tmp/pids/puma.state ]] && bundle exec pumactl -S tmp/pids/puma.state stop'

alias mc='mailcatcher --http-ip 0.0.0.0'
alias kmc='pkill -fe mailcatcher'
alias sk='[[ -f config/sidekiq.yml ]] && bundle exec sidekiq -C $PWD/config/sidekiq.yml -d'
alias ksk='pkill -fe sidekiq'
alias dump_db='/vagrant/scripts/dump_db.zsh'
# alias mg_skip='rake db:migrate SKIP_PATCHING_MIGRATION='\''skip_any_patching_related_migrations'\'
alias mg='rake db:migrate'
alias rb='rake db:rollback'
alias rgm='rails generate migration'
alias g='git'
alias gs='git status'
alias gb='git branch'
alias gcom='git checkout master'
alias gdm='git diff master...'
alias gdfH='git diff HEAD'
alias gsh='git stash'
alias gc='cop master... && git commit --verbose'
alias gpcc='cop master... && gpc'
alias gda='git add .'
alias ll='ls -al'
alias eee='exit'
alias skmg="rake db:migrate SKIP_PATCHING_MIGRATION='skip_any_patching_related_migrations'"
alias ggpull='git pull origin'
alias gsh0='git stash pop stash@{0}'
alias y='yarn'
alias ys='yarn start'
alias c='clear'
alias tm='tmux -2 attach || tmux new'
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

alias va=vagrant
alias vsh='va ssh'
alias vsf='va ssh -- -L 0.0.0.0:8080:localhost:80 -L 1080:localhost:1080'
alias vup='va up'
alias vsup='va suspend'
alias vhalt='va halt'

alias gws=gwS
alias gba='gb -a'

pairg() { ssh -t $1 ssh -o 'StrictHostKeyChecking=no' -o 'UserKnownHostsFile=/dev/null' -p $2 -t vagrant@localhost 'tmux attach' }
pairh() { ssh -S none -o 'ExitOnForwardFailure=yes' -R $2\:localhost:22222 -t $1 'watch -en 10 who' }

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
# rpy() {
#   if bundle show pry-remote > /dev/null 2>&1; then
#     bundle exec pry-remote
#   else
#     rpu pry
#   fi
# }

# 重啟 puma/unicorn
#
# - rpu       → 啟動或重啟（如果已有 pid）
# - rpu kill  → 殺掉 process，不重啟
# - rpu xxx   → xxx 參數會被丟給 pumactl（不支援 unicorn）
# rpu() {
#   emulate -L zsh
#   if [[ -d tmp ]]; then
#     local action=$1
#     local pid
#     local animal

#     if [[ -f config/puma.rb ]]; then
#       animal='puma'
#     elif [[ -f config/unicorn.rb ]]; then
#       animal='unicorn'
#     else
#       echo "No puma/unicorn directory, aborted."
#       return 1
#     fi

#     if [[ -r tmp/pids/$animal.pid && -n $(ps h -p `cat tmp/pids/$animal.pid` | tr -d ' ') ]]; then
#       pid=`cat tmp/pids/$animal.pid`
#     fi

#     if [[ -n $action ]]; then
#       case "$action" in
#         pry)
#           if [[ -n $pid ]]; then
#             kill -9 $pid && echo "Process killed ($pid)."
#           fi
#           rserver_restart $animal
#           ;;
#         kill)
#           if [[ -n $pid ]]; then
#             kill -9 $pid && echo "Process killed ($pid)."
#           else
#             echo "No process found."
#           fi
#           ;;
#         *)
#           if [[ -n $pid ]]; then
#             # TODO: control unicorn
#             pumactl -p $pid $action
#           else
#             echo 'ERROR: "No running PID (tmp/pids/puma.pid).'
#           fi
#       esac
#     else
#       if [[ -n $pid ]]; then
#         # Alternatives:
#         # pumactl -p $pid restart
#         # kill -USR2 $pid && echo "Process killed ($pid)."

#         # kill -9 (SIGKILL) for force kill
#         kill -9 $pid && echo "Process killed ($pid)."
#         rserver_restart $animal $([[ "$animal" == 'puma' ]] && echo '-d' || echo '-D')
#       else
#         rserver_restart $animal $([[ "$animal" == 'puma' ]] && echo '-d' || echo '-D')
#       fi
#     fi
#   else
#     echo 'ERROR: "tmp" directory not found.'
#   fi
# }

# 這是 rpu 會用到的 helper function
# rserver_restart() {
#   local app=${$(pwd):t}
#   [[ ! $app =~ '^(amoeba|cam|angel|nerv_ck)' ]] && app='nerv' # support app not named 'nerv' (e.g., nerv2)

#   case "$1" in
#     puma)
#       shift
#       RAILS_RELATIVE_URL_ROOT=/$app bundle exec puma -C config/puma.rb config.ru $*
#       ;;
#     unicorn)
#       shift
#       RAILS_RELATIVE_URL_ROOT=/$app bundle exec unicorn -c config/unicorn.rb $* && echo 'unicorn running'
#       ;;
#     *)
#       echo 'invalid argument'
#   esac
# }

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

# aliases {{{
# }}}

# environment variables {{{
export EDITOR=vim
export VISUAL=vim
#}}}

# key bindings {{{
bindkey -M vicmd '^a' beginning-of-line
bindkey -M vicmd '^e' end-of-line

bindkey '^f' vi-forward-word
bindkey '^b' vi-backward-word

bindkey '^o' autosuggest-accept

bindkey '^p' history-substring-search-up
bindkey '^n' history-substring-search-down

bindkey ',,' cancel-whole-input
# }}}

# }}}
