# Use this file to run your own startup commands

## Prompt Customization
<#
.SYNTAX
    <PrePrompt><CMDER DEFAULT>
    λ <PostPrompt> <repl input>
.EXAMPLE
    <PrePrompt>N:\Documents\src\cmder [master]
    λ <PostPrompt> |
#>

[ScriptBlock]$PrePrompt = {

}

# Replace the cmder prompt entirely with this.
# [ScriptBlock]$CmderPrompt = {}

Set-PSReadLineOption -EditMode Emacs
Import-Module posh-git
Import-Module oh-my-posh
# Set-PoshPrompt honukai
Set-PoshPrompt -Theme ~/.ohmyposhv3-will.omp.json

If (Test-Path Alias:curl) {Remove-Item Alias:curl}
If (Test-Path Alias:wget) {Remove-Item Alias:wget}

# function hosts { nvim c:\windows\system32\drivers\etc\hosts }

$sandbox = "C://Users//TWMAWEN//Documents//sandbox"
$profile_cmder = "C://Users//TWMAWEN//Documents//cmder//config//user_profile.ps1"
$nvim_init = "C://Users//TWMAWEN//AppData//Local//nvim//init.vim"
$azure_port = "MarkWengSTR@52.187.150.44"
# Add-PoshGitToProfile -AllHosts

[ScriptBlock]$PostPrompt = {

}

## <Continue to add your own>

# # Delete default powershell aliases that conflict with bash commands
# if (get-command git) {
#     del -force alias:cat
#     del -force alias:clear
#     del -force alias:cp
#     del -force alias:diff
#     del -force alias:echo
#     del -force alias:kill
#     del -force alias:ls
#     del -force alias:mv
#     del -force alias:ps
#     del -force alias:pwd
#     del -force alias:rm
#     del -force alias:sleep
#     del -force alias:tee
# }
