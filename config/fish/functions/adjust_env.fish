#!/usr/bin/fish

function adjust_env
    set -x -g EDITOR vim
    set -x -g PAGER most
    set -x -g GIT_EDITOR vim
    set -x -g GIT_PAGER most

    set -x -g DO_NOT_TRACK 1

    if which patdiff-git-wrapper 2>/dev/null >&2
        set -x -g GIT_EXTERNAL_DIFF (which patdiff-git-wrapper)
        set -x -g GIT_PAGER 'less -R'
    end

    set -x -g LC_COLLATE C
    set -x -g LANG en_US.utf8
    set -x -g LANGUAGE en

    # TODO: why would this be needed?
    # set -e -g MANPATH
end
