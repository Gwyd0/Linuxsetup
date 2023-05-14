# Linux Setup 
My current **I3** daily arch Linux/Ubuntu setup.

**This is my personal setup, so some things may not work.**

# Screenshots
Desktop and sidebar <br>
![screenshot1](https://github.com/Gwyd0/Linuxsetup/blob/main/screenshots/screenshot1.png?raw=true) <br>
Mutitasking <br>
![screenshot2](https://github.com/Gwyd0/Linuxsetup/blob/main/screenshots/screenshot3.png?raw=true) <br>
# Features
* Rounded Corners (picom)
* A sidebar
* a dashboard
* A widgets bar 
![screenshot3](https://github.com/Gwyd0/Linuxsetup/blob/main/screenshots/screenshot4.png?raw=true) <br>


**for weather to work you need to change the $location var in eww/scripts/weather.sh**

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
All the default I3 keybinds + 
| Keybind       | Action        
| ------------- |:-------------:
| Mod+Shift+z   | Opens Sidebar     
| Mod+Shift+r   | Reloads Config
| Ctrl+Space    | Clears the newest notification
| Ctrl+Shift+Space   | Clears all notifications

# Known Issues 
I will fix these when I have time…
* When opening the sidebar quickly, the Spotify widget will bug out, resulting in you not being able to close the sidebar. This can be solved by reloading the config but is very annoying. This seems to only happen on Ubuntu.
