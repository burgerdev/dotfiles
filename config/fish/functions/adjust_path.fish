#!/usr/bin/fish
function adjust_path
    set -x -g PATH $PATH $HOME/.local/bin
end

