#!/usr/bin/fish
function adjust_path
    set localpath "$HOME/.local/bin"
    if test -d "$localpath"
        set -x -g PATH $PATH "$localpath"
    end

    if which opam 2>/dev/null >&2
        eval (opam config env)
    end
end

