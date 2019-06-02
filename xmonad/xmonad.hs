import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.SetWMName
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageHelpers
import XMonad.Layout.NoBorders
import XMonad.Layout.PerWorkspace (onWorkspace)
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

main = do
    xmproc <- spawnPipe "/usr/bin/xmobar /home/burger/.xmobarrc"
    xmonad =<< xmobar defaultConfig
        { workspaces = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
        , manageHook = manageDocks <+> manageHook defaultConfig
        , layoutHook = smartBorders . avoidStruts $ layoutHook defaultConfig
        , logHook = dynamicLogWithPP xmobarPP
            { ppOutput = hPutStrLn xmproc
            , ppTitle = xmobarColor "green" "" . shorten 50
            }
        , terminal = "alacritty"
-- for Java Swing apps
        , startupHook = setWMName "LG3D"
        }

