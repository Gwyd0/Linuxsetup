# Linux Setup 
My current **I3** daily arch linux setup.

**this is my personal setup so some things may not work.**

# Screenshots
Desktop and sidebar <br>
![screenshot1](https://github.com/Gwyd0/Linuxsetup/blob/main/screenshots/screenshot1.png?raw=true) <br>
Dashboard (unfinished)
![screenshot2](https://github.com/Gwyd0/Linuxsetup/blob/main/screenshots/screenshot5.png?raw=true) <br>
# Features
* Rounded Corners (picom)
* A sidebar
* a dashboard
* A widgets bar 
![screenshot3](https://github.com/Gwyd0/Linuxsetup/blob/main/screenshots/screenshot4.png?raw=true) <br>

# Installation
* Install dependncies
* Clone these files and put them in ~/.config
* choose a wallpaper from /wallpapers and put it in ~/Pictures named wallpaper.jpg or just change the i3 config $wallpaper var
* Thats it. Enjoy.

**for weather too work you need to change the $location var in eww/scripts/weather.sh**

# Dependencies
UI - [Eww](https://github.com/elkowar/eww) <br />
WM (i3) - [I3](https://wiki.archlinux.org/title/I3) <br />
Background - [Feh](https://wiki.archlinux.org/title/Feh) <br />
Terminal - [Alacritty](https://wiki.archlinux.org/title/Alacritty) <br />
Compositor - [Picom](https://aur.archlinux.org/packages/picom-rounded-corners) (this fork allows rounded corners + other features)<br />
Notifications - [Dunst](https://wiki.archlinux.org/title/Dunst) <br />
App Launcher - [Rofi](https://github.com/davatorium/rofi) <br />
Music Controller - [Playerctl](https://archlinux.org/packages/community/x86_64/playerctl/) <br />
Font - [Nerdfonts](https://www.nerdfonts.com/) <br />
Lockscreen - [betterlockscreen](https://github.com/betterlockscreen/betterlockscreen) <br />

# Keybinds
all the default i3 keybinds + 
| Keybind       | Action        
| ------------- |:-------------:
| Mod+Shift+z   | Opens Sidebar 
| Mod+Shift+x   | Opens Dashboard      
| Mod+Shift+r   | Reloads Config
| Ctrl+Space    | Clears the newest notification
| Ctrl+Shift+Space   | Clears all notifications

# Known Issues / Future features
i will fix these when i have time..
* lots of small bugs such as the weather not updating.
* finish dashboard
* Make a install script. (prob for arch and ubuntu)
