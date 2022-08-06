#!/bin/bash
set -eu -o pipefail

sudo true
test $? -eq 0 || exit 1 "[error] You should have sudo privilege to run this script"

echo '==========================================================='
echo 'Linux Rice Install Script (only for ubuntu and arch)'
echo 'By Gwyd'
echo '==========================================================='


if [[ "$1" == "--ubuntu" ]]; then

    echo '[setup] Install Type: Ubuntu'
    echo '[setup] Installing Eww'

    cd ~
    if ! [[ -x "$(command git clone https://github.com/elkowar/eww -q)" ]]; then 
        echo '[git] eww already cloned'
    fi
    cd ~/eww

    echo '[setup] Cloned Eww... Building...'

    if ! [[ -x "$(command -v cargo)" ]] && [[ -x "$(command -v rustc)" ]]; then
        echo '[error] cargo is not installed. You need the nightly toolchain.' >&2
        exit 1
    else
        echo '[building] Prerequisites installed'
        if echo 'cargo build --release' ; then 
            cd target/release
            chmod +x ./eww
            sudo cp eww /usr/local/bin/
            if ! [[ -x "$(command ./eww -V)" ]]; then
                echo '[setup] Eww is installed.' 
                
                #install picom

                echo '[setup] Installing Dependencies' 
                #sudo apt-get -qq -y update 
                if sudo apt-get -qq -y install i3-gaps-wm feh rofi dunst alacritty playerctl ; then
                    echo '[setup] Installed Dependencies' 
                    echo '[config] Installing Configs.'

                    mkdir ~/.config/Linuxsetup
                    cd ~/.config/Linuxsetup

                    if ! [[ -x "$(command git clone https://github.com/Gwyd0/Linuxsetup . -q) " ]]; then 
                        echo '[git] configs already cloned'
                    fi

                    echo '[config] Copying i3 config' && cp -R ~/.config/Linuxsetup/i3 ~/.config
                    echo '[config] Copying dunst config' && cp -R ~/.config/Linuxsetup/dunst ~/.config
                    echo '[config] Copying rofi config' && cp -R ~/.config/Linuxsetup/rofi ~/.config
                    echo '[config] Copying alacritty config' && cp -R ~/.config/Linuxsetup/alacritty ~/.config
                    echo '[config] Copying eww config' && cp -R ~/.config/Linuxsetup/eww ~/.config

                    echo '[setup] Clearing tmp files'
                    rm -rf ~/.config/Linuxsetup
                    rm -rf ~/eww

                    if eww open bar; then
                        echo "[setup] You should see a bar."
                    fi
                    eww reload
                else 
                    echo '[error] Dependencies did not install correctly. Install manually. https://github.com/Gwyd0/Linuxsetup#dependencies'
                    exit 1
                fi
            else
                echo '[error] Eww did not install correctly. Install manually https://elkowar.github.io/eww/eww.html'
                exit 1
            fi
        else 
            echo '[error] error while building eww. install eww manually.'
            exit 1
        fi
    fi
elif [[ "$1" == "--arch" ]]; then
    echo '[setup] Install Type: Arch Linux'
else 
    echo '[setup] invalid argument --arch or --ubuntu'
fi
