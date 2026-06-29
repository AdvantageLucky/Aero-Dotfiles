<h1 align="center">
  My personal dotfiles
</h1>

A minimalist configuration for SwayFX WM focused on the **Frutiger Aero / Aqua Crystal** aesthetic.

---
<img width="1920" height="1080" alt="rice" src="https://github.com/user-attachments/assets/80fc8e37-b496-4822-b5d8-11c95a3be593" />

<img width="1920" height="1080" alt="rice2" src="https://github.com/user-attachments/assets/9d0bfb4b-3c7c-488f-b7ea-785cb4d42009" />

---

## Components
*   **WM:** SwayFX (Wayland)
*   **Bar:** Waybar (transparent with glass gradients)
*   **Terminal:** Foot (GeistMono Nerd Font)
*   **Shell:** Fish (Eza, Zoxide, Fzf)
*   **Launcher:** Fuzzel
*   **Browser:** Zen Browser
*   **File Manager:** Nautilus (GTK4)
*   **Notifications:** Mako
*   **Widgets:** Eww (cat, senna, fortune)
*   **Lock screen:** Swaylock-effects
*   **Power menu:** Wlogout

## Installation
**chezmoi** is used to manage the configuration:

1.  **Install chezmoi:**
    ```bash
    sh -c "$(curl -fsLS get.chezmoi.io)"
    ```
2.  **Apply dotfiles:**
    ```bash
    chezmoi init --apply https://github.com/tu-usuario/dotfiles.git
    ```
3.  **Install dependencies:**
    The script runs automatically after the first `chezmoi apply`, or manually:
    ```bash
    ~/.local/share/chezmoi/run_once_install-dependencies.sh
    ```

## Keybinds
Super = ⊞
*   `Super + T` → Open terminal (Foot)
*   `Super + F` → Open browser (Zen)
*   `Super + D` → Open files (Nautilus)
*   `Super + A` → App launcher (Fuzzel)
*   `Super + Esc` → Lock screen (Swaylock)
*   `Super + Shift + E` → Power menu (Wlogout)
*   `Super + Q` → Close window
*   `Super + Shift + C` → Reload SwayFX
*   `Print` → Full screenshot
*   `Super + Shift + S` → Area screenshot (slurp)

## Theming
*   **GTK:** Windows Longhorn Plex
*   **Icons:** Adwaita / Papirus
*   **Cursors:** Phinger Cursors Dark
*   **Fonts:** Inter Variable / GeistMono Nerd Font
