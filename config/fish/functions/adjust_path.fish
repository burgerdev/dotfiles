#!/usr/bin/fish
function adjust_path
    if which opam 2>/dev/null >&2
        eval (opam config env)
    end

    set localpath "$HOME/.local/bin"
    if test -d "$localpath"
        set -x -g PATH "$localpath" $PATH
    end
end

