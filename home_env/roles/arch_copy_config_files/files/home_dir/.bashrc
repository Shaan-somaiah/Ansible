# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

## Automatically startup hyprland if the tty is 1
## To get into regular tty , either login as root or change tty to 2-6 (ctrl + alt + F2-F6, 7 reserved for display server)
if [ "$(tty)" == "/dev/tty1" ]; then
    exec Hyprland
fi

## alias ssh to include kitty plugin when terminal is kitty
[ "$TERM" = "xterm-kitty" ] && alias ssh="kitty +kitten ssh"

## ALIAS AND EXPORTS
export EDITOR=nvim
alias ls='ls -lrth --color=auto'
alias vim='nvim'
alias cmaked='cmake -DCMAKE_BUILD_TYPE=Debug ..'    # cmake debug build
alias cmaker='cmake -DCMAKE_BUILD_TYPE=Release ..'  # cmake release build
alias cmakeb='cmake --build .'                      # cmake build

fastfetch
