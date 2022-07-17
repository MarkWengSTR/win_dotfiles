# Linux - ubuntu 環境設定
## Initial bootstrap
1. git clone https://github.com/MarkWengSTR/win_dotfiles.git  & cd win_dotfiles
    - sudo sh boostrap.sh
2. Zsh
    - cp ~/win_dotfiles/zshrc ~/.zshrc
3. Tmux
    - cp ~/win_dotfiles/tmux.conf ~/.tmux.conf
4. Neovim
    - cd ~/.config/nvim 
    - cp ~/win_dotfiles/init.vim init.vim
    - (如果沒有autoload資料夾的話先 mkdir autoload ) & cd autoload  &
```
curl -fLo plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

# Window 設定
## Cmder

1. 先下載 cmder
2.
  - 到我的dotfile中找出 cmder 裡的 user_aliases.cmd, user_profile.ps1
  - 把vimrc放進 ~ 目錄
  - user_aliases.cmd, user_profile.ps1 放進 C:\Users\bskin\cmder\config
  - 把ohmyposhv3-will.omp.json 複製到 ~/.ohmyposhv3-will.omp.json
  - 開啟powershell

## vim

-  vimrc 裡 先安裝plug套件 ( 通常home目錄是C:\Users\bskin )
```
curl -fLo
C:\Users\bskin/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
4. 開啟vim, 輸入 :PlugInstall

## 灌choco

- 以 "系統管理員身分" 進入 命令提示字元 , 輸入
```
@powershell -NoProfile -ExecutionPolicy unrestricted -Command "iex ((new-object net.webclient).DownloadString(‘https://chocolatey.org/install.ps1‘))" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin
```

## neovim

1. 以 "系統管理員身分" 進入 PowerShell , 輸入  
```
choco install neovim -y
```
2. 在 C:\Users\bskin\AppData\Local\ 下新增 nvim/ 資料夾
3. nvim/ 裡面 新增 autoload/資料夾，放入plug.vim
```
curl -fLo
plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
4. 跳回 nvim/ ，放入 我的dotfile中裡面的init.vim

5. 開啟 nvim 輸入 :PlugInstall

## map caps lock to control

  - Powershell in admin
```
$hexified = "00,00,00,00,00,00,00,00,02,00,00,00,1d,00,3a,00,00,00,00,00".Split(',') | % { "0x$_" };
$kbLayout = 'HKLM:\System\CurrentControlSet\Control\Keyboard Layout';
New-ItemProperty -Path $kbLayout -Name "Scancode Map" -PropertyType Binary -Value ([byte[]]$hexified);
```
  - 重開機

# SSH with Github
- `ssh-keygen -t ed25519 -C "bskin0330@gmail.com"`
- `nvim .ssh/id_ed25519.pub` 複製至github內
- `ssh -T git@github.com` 測試看是否有連上
