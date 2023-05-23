#
# ~/.bashrc
#

# Set Prompt
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
PS1="\e[0m\W\[\e[35m\]\$(parse_git_branch)\e[34m\] \e[0m "

# set PATH so it includes user's private ~/.local/bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi
if [ -d "$HOME/.local/bin/scripts/" ] ; then
    PATH="$HOME/.local/bin/scripts/:$PATH"
fi



# change working directory after leaving lf
LFCD="$HOME/.config/lf/lfcd"
if [ -f "$LFCD" ]; then
    source "$LFCD"
fi
alias lf='lfcd'

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#ignore upper and lowercase when TAB completion
bind "set completion-ignore-case on"

### ALIASES ###
#ff
alias ff='find_file'
# fuzzy cd
alias cdf='fcd() { cd "$(find "$HOME" -type d | fzf --bind=tab:down,btab:up --reverse --header="jump to location")" && pwd; unset -f fcd; }; fcd'
#ll
alias ll='ls -alF --color=auto'
#ls
alias ls='ls --color=auto'
# Update
alias update='[ -f ~/dotfiles/arch_package_sync.sh ] && sh ~/dotfiles/arch_package_sync.sh || (echo "Warning: arch_package_sync.sh not found."; yay -Syu)'
#get fastest mirrors in your neighborhood
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --latest 30 --number 10 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 30 --number 10 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --latest 30 --number 10 --sort age --save /etc/pacman.d/mirrorlist"

