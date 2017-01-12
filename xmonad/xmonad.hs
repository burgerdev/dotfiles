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

moveAppsToWorkspaces = composeAll
    [ className =? "Firefox" --> doShift "2:web"
    , className =? "Thunderbird" --> doShift "2:web"
    , className =? "chromium" --> doShift "2:web"
    , className =? "Unreal Editor" --> doShift "5"
    , title =? "Unreal" --> doShift "5"
--    , title =? "Figure 1" --> doShift "4:app"
    ]
-- get className via xprop

main = do
    xmproc <- spawnPipe "/usr/bin/xmobar /home/burger/.xmobarrc"
    xmonad $ ewmh defaultConfig
        { workspaces = ["1:dev", "2:web", "3:script", "4:code", "5", "6:ssh", "7", "8", "9:root"]
        , manageHook = moveAppsToWorkspaces <+> manageDocks <+> (isFullscreen --> doFullFloat) <+> manageHook defaultConfig
        , layoutHook = smartBorders . avoidStruts $ onWorkspace "2:web" Full $ layoutHook defaultConfig
        , logHook = dynamicLogWithPP xmobarPP
            { ppOutput = hPutStrLn xmproc
            , ppTitle = xmobarColor "green" "" . shorten 50
            }
--        , modMask = mod4Mask
--        , terminal = "konsole"
        , terminal = "lilyterm"
-- for Java Swing apps
        , startupHook = setWMName "LG3D"
        }

