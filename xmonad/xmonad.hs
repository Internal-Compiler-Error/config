import XMonad
import XMonad.Config.Desktop

-- make XMonad DWMH compatible, make somes apps more happy
import XMonad.Hooks.EwmhDesktops  -- make XMonad DWMH compatible, make somes apps more happy

-- xmobar stuff
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP
import XMonad.Hooks.ManageDocks

-- try resize window using a mouse
import XMonad.Actions.MouseResize
import XMonad.Layout.WindowArranger

import XMonad.Util.SpawnOnce

main :: IO ()
main = xmonad
     . ewmhFullscreen
     . ewmh
     . xmobarProp  
     $ myConfig


myConfig = desktopConfig
	{ terminal     = myTerminal
	, modMask      = myModMask
	, layoutHook   = avoidStruts (myLayout)
	, startupHook  = myStartupHook
     	, borderWidth  = myBorderWidth
     }

myModMask     = mod4Mask
myTerminal    = "alacritty"
myLayout      = mouseResize $ windowArrange $ layoutHook def
myBorderWidth = 2

myStartupHook :: X ()
myStartupHook = do
     -- outputed by arandr, just bother trying to understand it, just use arandr to change it to what you want
     spawnOnce "xrandr --output HDMI-0 --mode 2560x2880 --pos 0x0 --rotate normal --output DP-0 --primary --mode 3840x2160 --pos 2560x720 --rotate normal --output DP-1 --off --output DP-2 --off --output DP-3 --off --output DP-4 --off --output DP-5 --off"
     -- maybe this should spawn always actually
     spawnOnce "dunst"
     spawnOnce "picom --vsync -b"
     spawnOnce "easyeffects --gapplication-service"
