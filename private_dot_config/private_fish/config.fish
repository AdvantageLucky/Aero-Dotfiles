if status is-login
  if test (tty) = /dev/tty1
    test -f ~/.config/fish/sway.log; and mv ~/.config/fish/sway.log ~/.config/fish/sway.log.old
    exec sway -V > ~/.config/fish/sway.log 2>&1
  end
end

# greetings
set -U fish_greeting

# alias 
alias ls 'exa -l --git --icons --group-directories-first'
alias info 'pinfo'

# abbreviatures
abbr q 'exit'
abbr n 'nvim'
abbr c 'clear'
abbr cdd 'cd ..'
abbr u 'sudo pacman -Syu'
abbr nvimconfig 'cd ~/.config/nvim'
abbr swayconfig 'cd ~/.config/sway'
abbr waybarconfig 'cd ~/.config/waybar/'
abbr fuzzelconfig 'cd ~/.config/fuzzel/'
abbr makoconfig 'nvim ~/.config/mako/config'
abbr footconfig 'nvim ~/.config/foot/foot.ini'
abbr fishconfig 'nvim ~/.config/fish/config.fish'
abbr kittyconfig 'nvim ~/.config/kitty/kitty.conf'

# @Plugins
set -U fish_autosuggestion_strategy history
set -U fzf_complete 1
set -U fzf_preview_dir_cmd 'ls -la'

# @Variables
set -Ux EDITOR nvim
set -Ux TERMINAL kitty

# man pages con colores (bat como pager)
set -gx MANPAGER "sh -c 'col -bx | bat -l man -p'"
set -gx MANROFFOPT "-c"

set -gx VIRTUAL_ENV_DISABLE_PROMPT 1

# WAYLAND & SWAY VARIABLES
set -Ux XDG_CURRENT_DESKTOP sway
set -Ux XDG_SESSION_DESKTOP sway
set -Ux XDG_SESSION_TYPE wayland
set -Ux GDK_BACKEND wayland,x11
set -Ux CLUTTER_BACKEND wayland
set -Ux MOZ_ENABLE_WAYLAND 1
set -Ux LIBVA_DRIVER_NAME iHD
set -Ux GST_VAAPI_ALL_DRIVERS 1
set -Ux NODE_OPTIONS "--no-warnings"
set -Ux PREFER_LOW_POWER 1
set -Ux QT_QPA_PLATFORM "wayland;xcb"
set -Ux _JAVA_AWT_WM_NONREPARENTING 1
set -Ux GRIM_DISABLE_DMABUF 1
set -Ux SDL_VIDEODRIVER wayland

# ssh
set -Ux SSH_AUTH_SOCK "$XDG_RUNTIME_DIR/ssh-agent.socket"

# Added by Antigravity CLI installer
set -gx PATH "/home/microbread/.local/bin" $PATH

# Flutter
set -gx PATH "$HOME/flutter/bin" $PATH

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
