#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"
fcitx

xset r rate 200 50
xset +fp /usr/share/fonts/local
xset +fp $HOME/.fonts/misc
xset +fp $HOME/.fonts/ohsnap
xset +fp $HOME/.fonts/terminesspoerline
xset +fp $HOME/.fonts/tewi

# xrandr --output DP1 --auto --primary --output DP2 --auto --right-of DP1 --output eDP1 --off
xrandr --output DP1 --off --output DP2 --off --output eDP1 --auto --primary

# start some nice programs

exec i3 -V >> ~/.log/i3-$(date +'%F-%k-%M-%S') 2>&1
