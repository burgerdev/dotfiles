#!/usr/bin/fish

function adjust_env
    set -x -g fish_color_host purple
    set -x -g LC_ALL C
    set -x -g EDITOR vim
    set -x -g PAGER most
end
