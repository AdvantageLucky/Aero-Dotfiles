#!/bin/bash
set -e

# Colores para la salida
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

print_step()   { echo -e "${BLUE}==>${NC} ${GREEN}$1${NC}"; }
print_warning(){ echo -e "${YELLOW}==> ADVERTENCIA:${NC} $1"; }

print_step "Actualizando el sistema..."
sudo pacman -Syu --noconfirm

# @AUR Helper (yay)
if ! command -v yay &>/dev/null; then
    print_step "Instalando yay (AUR helper)..."
    sudo pacman -S --needed --noconfirm git base-devel
    git clone https://aur.archlinux.org/yay.git /tmp/yay
    cd /tmp/yay && makepkg -si --noconfirm
    cd -
fi

# @Drivers y Hardware
print_step "Instalando Drivers y Gestión de Energía (Intel)..."
sudo pacman -S --needed --noconfirm \
    intel-ucode mesa vulkan-intel intel-media-driver libva-intel-driver \
    sof-firmware tlp
sudo systemctl enable --now tlp

# @Fuentes
print_step "Instalando Fuentes..."
sudo pacman -S --needed --noconfirm \
    ttf-inter \
    ttf-liberation \
    noto-fonts noto-fonts-cjk noto-fonts-emoji \
    ttf-nerd-fonts-symbols-mono otf-geist-mono-nerd

# @Lenguajes y Runtimes
print_step "Instalando Runtimes y Lenguajes..."
sudo pacman -S --needed --noconfirm \
    python python-pip \
    clang \
    rust cargo \
    lua luarocks \
    go \
    nodejs npm \
    jdk-openjdk

# @Entorno de Ventanas (SwayFX)
print_step "Instalando SwayFX y componentes de interfaz..."
yay -S --needed --noconfirm swayfx
sudo pacman -S --needed --noconfirm \
    swaybg swayidle waybar fuzzel mako autotiling-rs wlsunset \
    xorg-xwayland wl-clipboard polkit-gnome \
    grim slurp swappy \
    brightnessctl papirus-icon-theme oxygen-cursors

# @Audio y Red
print_step "Instalando Audio y Red..."
sudo pacman -S --needed --noconfirm \
    pipewire pipewire-pulse pipewire-alsa pipewire-jack wireplumber pavucontrol playerctl \
    mpd mpdscribble rmpc \
    networkmanager nm-connection-editor bluez bluez-utils blueman
sudo systemctl enable --now NetworkManager
sudo systemctl enable --now bluetooth
systemctl --user enable mpd.socket
systemctl --user enable mpdscribble

# @Terminal y Shell
print_step "Instalando Terminal, Shell y utilidades CLI..."
sudo pacman -S --needed --noconfirm \
    foot fish eza fzf fd bat ripgrep zoxide btop git-delta \
    wget unzip zip p7zip fortune-mod

# @Editores y Aplicaciones
print_step "Instalando Editores y Apps principales..."
sudo pacman -S --needed --noconfirm \
    neovim vim nano tree-sitter tree-sitter-cli \
    nautilus gvfs gvfs-mtp \
    imv mpv zathura zathura-pdf-mupdf obsidian

# @AUR Packages
print_step "Instalando paquetes desde AUR..."
yay -S --needed --noconfirm \
    zen-browser-bin \
    swaylock-effects \
    eww \
    phinger-cursors \
    wlogout \
    pinfo timg

# @Mantenimiento
print_step "Configurando limpieza automatica de cache de pacman..."
sudo pacman -S --needed --noconfirm pacman-contrib
sudo systemctl enable paccache.timer
sudo systemctl enable fstrim.timer

# Shell
print_step "Configurando Fish como shell predeterminada..."
if [ "$SHELL" != "/usr/bin/fish" ]; then
    chsh -s /usr/bin/fish
fi

print_step "Instalacion completa, reinicia para aplicar cambios"
