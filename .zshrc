# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"

alias greet='echo "Hello from alias!"'

ZSH_THEME="random"

plugins=(
    git
    archlinux
    zsh-autosuggestions
    zsh-syntax-highlighting
)

function load_silent(){ 
  tmux source-file ~/.config/tmux/.tmux.conf
  source $ZSH/oh-my-zsh.sh 
} &> /dev/null

load_silent

# Check archlinux plugin commands here
# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/archlinux

# Display Pokemon-colorscripts
# Project page: https://gitlab.com/phoneybadger/pokemon-colorscripts#on-other-distros-and-macos
# pokemon-colorscripts --no-title -s -r

pokemon-colorscripts --no-title -s -r | fastfetch -c $HOME/.config/fastfetch/config-pokemon.jsonc --logo-type file-raw --logo-height 10 --logo-width 5 --logo -

# fastfetch. Will be disabled if above colorscript was chosen to install
# fastfetch -c $HOME/.config/fastfetch/config-compact.jsonc
#fastfetch
# Set-up icons for files/folders in terminal
# alias ls='eza -a --icons'
alias ls='lsd'
alias ll='eza -al --icons'
alias lt='eza -a --tree --level=1 --icons'
alias l='ls -lah'

#change cursor color after each prompt
cursor_change_color(){
  hex=$(openssl rand -hex 3)
  echo -ne "\e]12;#$hex\a"
}

function postcmd(){
  cursor_change_color
}

precmd_functions+=(postcmd)

# Set-up FZF key bindings (CTRL R for fuzzy history finder)
source <(fzf --zsh)

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory


#setting alias for faster workflow



#snapshots
alias snapstudies='sudo btrfs subvolume snapshot /mnt/KSS/Learnings /mnt/KSS/.btrfssnapshots/Learnings/Learnings_snapshot_$(date +"%Y%m%d_%H%M%S") '
alias snapdocs='sudo btrfs subvolume snapshot /mnt/KSS/Documents /mnt/KSS/.btrfssnapshots/Documents/Documents_snapshot_$(date +"%Y%m%d_%H%M%S") '
alias snapbackups='sudo btrfs subvolume snapshot /mnt/KSS/backUps /mnt/KSS/.btrfssnapshots/backUps/backUps_snapshot_$(date +"%Y%m%d_%H%M%S") '
alias snapmedia='sudo btrfs subvolume snapshot /mnt/KSS/Media /mnt/KSS/.btrfssnapshots/Media/Media_snapshot_$(date +"%Y%m%d_%H%M%S") '
alias snapall='snapmedia && snapdocs && snapstudies && snapbackups'

#wholesome
alias lifeupdate='snapall && notify-send KSS-snapped && phoneup && notify-send phoneup && kssup && notify-send KSSUP && phoneup && notify-send life updated && notify-send upgrading system && archup'

#KSS updates
alias kssup='pc2lap && lap2pc'
alias pc2lap='rsync -avUhPz /mnt/KSS/ laptop:/mnt/KSS/ --exclude "*git*" --exclude "*myenv*" --exclude ".btrfssnapshots" --exclude "codes" '
alias lap2pc='rsync -avhUPz laptop:/mnt/KSS/ /mnt/KSS/ --exclude "*git*" --exclude "*myenv*" --exclude ".btrfssnapshots" --exclude "codes" '

#Phoneupdates
alias phoneup='dcim2pc && docs2pn && pndocs2pc'
alias dcim2pc='rsync -avhUPz phone:/storage/E452-4B2F/DCIM/Camera/ /mnt/KSS/backUps/poco/dcim/camera/ '
alias pnss2backups='rsync -avhUPz phone:/storage/emulated/0/DCIM/Screenshots/ /mnt/KSS/backUps/poco/dcim/screenshots/ '
alias ss2pn='rsync -avhUPz /mnt/KSS/backUps/poco/dcim/screenshots/ phone:/storage/emulated/0/DCIM/Screenshots/ '
alias sem2pn='rsync -avhUPz --delete /mnt/KSS/Learnings/rvce/6thsem/ phone:/storage/E452-4B2F/6thsem/ --exclude "*git*" --exclude "myenv" ' 
alias pndocs2pc='rsync -avhUPz  phone:/storage/E452-4B2F/Documents/ /mnt/KSS/Documents/ '
alias docs2pn='rsync -avhUPz /mnt/KSS/Documents/  phone:/storage/E452-4B2F/Documents/ --exclude "*git*" --exclude "myenv" --exclude "*.zip"' 

alias songs2pn='rsync -ahUPz /mnt/KSS/Media/songs phone:/storage/E452-4B2F/ '
alias pnsongs2pc='rsync -ahUPz phone:/storage/E452-4B2F/songs /mnt/KSS/Media/ '
alias pnsem2pc='rsync -avhUPz  phone:/storage/E452-4B2F/6thsem/ /mnt/KSS/Learnings/rvce/6thsem/ '
alias tw2pn='rsync -avhUPz /mnt/KSS/Media/towatch/* phone:/storage/E452-4B2F/towatch/'
alias pntw2pc='rsync -avhUPz phone:/storage/E452-4B2F/towatch/  /mnt/KSS/Media/towatch/ '


#.spm update
alias spm2pn='rsync -avhUPz  /mnt/KSS/.btrfssnapshots/.spm/.spiderman.jpg phone:~/.spm/'
alias spm2lap='rsync -avhUPz  /mnt/KSS/.btrfssnapshots/.spm/.spiderman.jpg laptop:/mnt/KSS/.btrfssnapshots/.spm/'
alias spm2pc='rsync -avhUPz  /mnt/KSS/.btrfssnapshots/.spm/.spiderman.jpg pc:/mnt/KSS/.btrfssnapshots/.spm/'

#sem/private/el/dbms to lab/dbms/ 


#commoners
alias tmp='cd ~/tmp'
alias scron='hyprctl dispatch dpms on'
alias prep='cd /mnt/KSS/Learnings/rvce/placementprep/'
alias open='xdg-open'
#alias scroff='hyprctl dispatch dpms off'
alias yt='cd ~/yt/'
alias cpu='watch cpupower frequency-info'
alias project='cd /mnt/KSS/Learnings/projects/ '
alias cwh='cd /mnt/KSS/Learnings/projects/fsd/cwh/ '
alias pushtomain="gph && gck main && gm dev && gph && gck dev" 
alias cyber='cd /mnt/KSS/Learnings/cyber/'
alias diaryd='cd /mnt/KSS/Learnings/site/futurediary/'
alias site='cd /mnt/KSS/Learnings/site/ '
alias tdu='rsync -avhUPz /mnt/KSS/Learnings/todo/ phone:~/sdc/todo/ '
alias tdd='rsync -avhUPz phone:~/sdc/todo/ /mnt/KSS/Learnings/todo/ '
alias fzf='fzf --multi '
alias el='cd /mnt/KSS/Learnings/rvce/6thsem/private/el/'
alias lab='cd /mnt/KSS/Learnings/rvce/6thsem/lab/'
alias label='cd /mnt/KSS/Learnings/rvce/6thsem/private/label/'
alias hms='cd /mnt/KSS/Learnings/hms/ '
alias dsa='cd /mnt/KSS/Learnings/dsa/dsawcbook/'
alias lan='cd /mnt/KSS/Learnings/languages/'
alias chrome=google-chrome-stable
alias lrn='cd /mnt/KSS/Learnings/ '
alias clips='cd /mnt/KSS/Media/clips/ '
alias todo='nvim /mnt/KSS/Learnings/todo/todo'
alias todod='cd /mnt/KSS/Learnings/todo/'
alias spm='cd /mnt/KSS/.btrfssnapshots/.spm/'
alias rvce='cd /mnt/KSS/Learnings/rvce/'
alias sem='cd /mnt/KSS/Learnings/rvce/6thsem'
alias backups='cd /mnt/KSS/backUps'
alias docs='cd /mnt/KSS/Documents/'
alias scripts='cd ~/scripts'
alias media='cd /mnt/KSS/Media/'
alias songs='cd /mnt/KSS/Media/songs/'
alias playsongs='mpv /mnt/KSS/Media/songs/ --shuffle'
alias psongs='songs && mpv "$(fzf)" '
alias hypr='cd ~/.config/hypr'
alias zsh='nvim ~/.zshrc'
alias gs='git status'
alias gph='git push'
alias gpl='git pull'
alias gl='git log'
alias gck='git checkout'
alias gmg='git merge'
alias towatch='mpv /mnt/KSS/Media/towatch/* --shuffle --fullscreen'
alias towatchd='cd /mnt/KSS/Media/towatch'
alias tolisten='mpv /mnt/KSS/Media/tolisten/* --shuffle'
alias tolistend='cd /mnt/KSS/Media/tolisten/'
alias enco='bluetoothctl scan on && bluetoothctl connect 2C:FD:B4:7E:65:6A '
alias onbz='pactl set-default-sink bluez_output.2C_FD_B4_7E_65_6A.1'
alias onpc='pactl set-default-sink alsa_output.pci-0000_00_1f.3.hdmi-stereo'
alias speaker='bluetoothctl connect B4:20:53:C3:09:A4'
alias poco='bluetoothctl connect 10:3F:44:8B:06:F2'
alias down='cd ~/Downloads'
alias wallpaper='cd /mnt/KSS/Media/wallpapers/'
alias waldown='find ~/Downloads -type f \( -name "*.mp4" -o -name "*.jpeg" -o -name "*.jpg" -o -name "*.png" \) -exec mv {} /mnt/KSS/Media/wallpapers/ \;'
alias zshup='cp ~/.zshrc ~/dot-files/.zshrc'
alias ran='ranger'
alias calc='deepin-calculator'
alias archup='yay -Scc && sudo pacman -Scc && sudo pacman -Syu && notify-send -u critical "Pacman-Update [pwd required]" && yay -Syu && notify-send "yay-Updated" || notify-send -u critical "password-required" '
alias cod='nvim /mnt/KSS/.btrfssnapshots/.spm/.codes'
alias ref='sudo reflector --country 'India' --latest 5 --sort rate --save /etc/pacman.d/mirrorlist && sudo pacman -Syy'
alias lkey='gpg --list-keys --keyid-format long'
alias lskey='gpg --list-secret-keys --keyid-format long'
alias de='bash de'
alias en='bash en'
alias dotpush='cd ~/dot-files && ac  && git push -f dots main'
alias dotpull='cd ~/dot-files && git pull dots main'
alias zshdown='cp ~/dot-files/.zshrc ~/.zshrc && source ~/.zshrc'
alias chgit=" git config --global user.name "Surajk013" && git config --global user.email "surajsinghk013@gmail.com" "
alias cve='rvce && cd CVE'
alias lap='mosh laptop'
alias pn='mosh phone'
alias pc='mosh pc'
alias neo='neofetch'
alias uwu='uwufetch'
alias fast='fastfetch'
alias pf='pfetch'
alias ac=" git commit -am "Auto-commit" "
alias gc=" git commit -am "
alias garuda='nmcli connection up "Garuda 2.4Ghz"'
alias ss='scrot -s /mnt/KSS/Media/screenshots/screenshot_%Y-%m-%d_%H-%M-%S.png'
alias sss='cd /mnt/KSS/backUps/poco/dcim/screenshots/ '
alias nl='newlook'
alias pnl='pkill newlook'
alias nv=nvim
alias gift='cd ~/gift && ./takegift' 

# Created by `pipx` on 2024-12-29 05:42:19
export PATH="$PATH:/home/suraj/.local/bin"
