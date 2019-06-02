#!/usr/bin/fish

function adjust_env
    set -x -g EDITOR vim
    set -x -g PAGER most
    set -x -g GIT_PAGER most
    set -x -g GIT_EDITOR vim

    set -x -g LC_COLLATE C
    set -x -g LANG en_US.utf8
    set -x -g LANGUAGE en:de
end
