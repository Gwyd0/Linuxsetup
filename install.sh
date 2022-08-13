#!/bin/bash
set -eu -o pipefail

sudo true
test $? -eq 0 || exit 1 "[error] You should have sudo privilege to run this script"

printf '===========================================================\nLinux Rice Install Script (only for ubuntu and arch)\nBy Gwyd\n==========================================================='


printf '\nOptions are\n A for arch \n U for ubuntu\n'
read -p "What distro: " distro_input


git_eww () { # this should work for ubuntu and arch?
    echo '[setup] Installing eww...'
    if ! [[ -x "$(command eww -V)" ]]; then
        echo '[setup] Eww already installed.'
        return
    else
        cd ~
        if ! [[ -x "$(command git clone https://github.com/elkowar/eww -q)" ]]; then 
            echo '[setup] Eww already cloned remove ~/eww if this keeps happening'
        fi
        cd ~/eww

        echo '[setup] Cloned Eww... Building...'

        if ! [[ -x "$(command -v cargo)" ]] && [[ -x "$(command -v rustc)" ]]; then
            echo '[error] cargo is not installed. You need the nightly toolchain.' >&2
            exit 1
        else
            echo '[building] Prerequisites installed'
            if cargo build --release ; then
                cd target/release
                chmod +x ./eww
                sudo cp eww /usr/local/bin/
                if ! [[ -x "$(command ./eww -V)" ]]; then
                    echo '[setup] Eww is installed.'
                    rm -rf ~/eww 
                else 
                    echo '[error] Eww did not install.'
                    return
                fi
            fi
        fi
    fi
}

git_configs () {
    echo '[config] Installing Configs.'

    mkdir ~/.config/Linuxsetup
    cd ~/.config/Linuxsetup

    if ! [[ -x "$(command git clone https://github.com/Gwyd0/Linuxsetup . -q) " ]]; then 
        echo '[setup] configs already cloned'
    fi

    echo '[config] Copying i3 config' && cp -R ~/.config/Linuxsetup/i3 ~/.config
    echo '[config] Copying dunst config' && cp -R ~/.config/Linuxsetup/dunst ~/.config
    echo '[config] Copying rofi config' && cp -R ~/.config/Linuxsetup/rofi ~/.config
    echo '[config] Copying alacritty config' && cp -R ~/.config/Linuxsetup/alacritty ~/.config
    echo '[config] Copying eww config' && cp -R ~/.config/Linuxsetup/eww ~/.config

    echo '[config] Installed Configs.'
    return
}

git_picom () {
    echo '[picom] Installing picom...'
    if ! [[ -x "$(command -v picom)" ]]; then
        echo '[setup] Picom already installed.'
        return
    else
        if sudo apt-get -qq -y install libxext-dev libxcb1-dev libxcb-damage0-dev libxcb-xfixes0-dev libxcb-shape0-dev libxcb-render-util0-dev libxcb-render0-dev libxcb-randr0-dev libxcb-composite0-dev libxcb-image0-dev libxcb-present-dev libxcb-xinerama0-dev libxcb-glx0-dev libpixman-1-dev libdbus-1-dev libconfig-dev libgl1-mesa-dev libpcre2-dev libpcre3-dev libevdev-dev uthash-dev libev-dev libx11-xcb-dev meson; then 
            echo '[picom] Dependencies installed.'
            cd ~
            if ! [[ -x "$(command git clone https://github.com/yshui/picom -q)" ]]; then 
                echo '[setup] Picom already cloned remove ~/picom if this keeps happening'
            fi
            cd ~/picom
            sudo meson --buildtype=release . build >NUL
            # may have to put picom binary in bin
            if sudo ninja -C build install >NUL; then
                echo '[picom] Installed picom (rounded corners)'
                return
            else 
                echo '[error] picom install failed. read picom logs.'
                return
            fi
        else
            echo '[error] Failed to install picom dependencies. Try doing it manually https://github.com/yshui/picom'
            exit 1
        fi
    fi
}

# todo: auto detect distro
if  [ $distro_input == "U" ]; then
    echo '[setup] Install Type: Ubuntu (apt-get and sudo)'
    git_eww     # installs and builds eww
    git_picom   # installs picom
    git_configs # installs configs

    echo '[setup] Installing Nerd Font...'

    wget -q "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Cousine.zip"
    sudo unzip -q -o Cousine.zip -d ~/.fonts
    echo '[setup] Installed Nerd font.' && sudo fc-cache -fv >NUL

    echo '[setup] Installing Config Dependencies' 
    #sudo apt-get -qq -y update 
    if sudo apt-get -qq -y install i3-gaps-wm feh rofi dunst alacritty playerctl ; then
        echo '[setup] Installed Config Dependencies' 
        echo '[setup] Clearing tmp files'
        rm -rf ~/eww
        rm -rf ~/.config/Linuxsetup
        sudo rm -rf ~/picom

        i3-msg reload -q
        if eww open bar; then 
            printf '\n[setup] You should see a bar.\n[setup] Setup Done.\n[setup] You can see keybinds + other options on github https://github.com/Gwyd0/Linuxsetup'
        fi
        eww reload
        rm -rf ~/install.sh
    else 
        echo '[error] Failed to install dependencies. Try installing manually.'
    fi
 
elif [ $distro_input == "A" ]; then
    echo '[setup] Install Type: Arch Linux (using pacman and sudo)'
    git_eww
    echo '[setup] Install Script is incomplete. Exiting.'
    exit 1
else 
    echo '[error] invalid argument'
    exit 1
fi