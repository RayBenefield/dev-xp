alias dev='cd ~/Development'
alias xp='cd ~/Development/dev-xp'
alias mxp='cd /mnt/c/msys64/home/RayBenefield/Development/dev-xp'
alias startup='cd "/mnt/c/Users/RayBenefield/AppData/Roaming/Microsoft/Windows/Start Menu/Programs/Startup"'
alias yt='cd ~/Development/youtube'
alias core='cd "/mnt/c/Users/RayBenefield/Dropbox/My PC (Ray-PC)/Documents/My Games/CORE/Saved/Maps"'
alias xpf='wherein src/node_modules/'
alias log='./dx/log'

set OS (uname)
if test "$OS" = 'Linux'
    alias vim='kak'
    alias vi='/usr/bin/vim'
end

if test "$OS" = "MINGW64_NT-10.0-19041"
    alias vim='/usr/bin/vim'
    alias vi='/usr/bin/vim'
end
