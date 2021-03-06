;= @echo off
;= rem Call DOSKEY and use this file as the macrofile
;= %SystemRoot%\system32\doskey /listsize=1000 /macrofile=%0%
;= rem In batch mode, jump to the end of the file
;= goto:eof
;= Add aliases below here
e.=explorer .
gl=git log --oneline --all --graph --decorate  $*
ls=ls 
pwd=cd
clear=c
history=cat -n "%CMDER_ROOT%\config\.history"
unalias=alias /d $1
v=vim $*
cmderr=cd /d "%CMDER_ROOT%"
gd=git diff
gia=git add $*
gs=git status
gsh=git stash
gsh0=git stash pop stash@{0}
