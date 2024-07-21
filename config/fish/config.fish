if status is-interactive
    # Commands to run in interactive sessions can go here
end
# ~/.config/fish/config.fish

# disable welcome message
set fish_greeting


# set PATH so it includes user's private ~/.local/bin if it exists
if test -d "$HOME/.local/bin"
    set -gx PATH "$HOME/.local/bin" $PATH
end

### ALIASES ###
# fuzzy cd
function cdf
    function fcd
        cd (find "$HOME" -type d | fzf --bind=tab:down,btab:up --reverse --header="jump to location")
        pwd
        functions -e fcd
    end
    fcd
end

# lf
abbr -a lf 'lfcd'

# ll
abbr -a ll 'ls -alF --color=auto'

# ls
abbr -a ls 'ls --color=auto'

# Update
abbr -a update '[ -f ~/dotfiles/arch_package_sync.sh ]; and sh ~/dotfiles/arch_package_sync.sh; or (echo "Warning: arch_package_sync.sh not found."; yay -Syu)'

# get fastest mirrors in your neighborhood
abbr -a mirror 'sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist'
abbr -a mirrord 'sudo reflector --latest 30 --number 10 --sort delay --save /etc/pacman.d/mirrorlist'
abbr -a mirrors 'sudo reflector --latest 30 --number 10 --sort score --save /etc/pacman.d/mirrorlist'
abbr -a mirrora 'sudo reflector --latest 30 --number 10 --sort age --save /etc/pacman.d/mirrorlist'
