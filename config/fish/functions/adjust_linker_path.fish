#!/usr/bin/fish

function adjust_linker_path
    set -x -g LD_LIBRARY_PATH $LD_LIBRARY_PATH /usr/lib
    set -x -g LD_LIBRARY_PATH $LD_LIBRARY_PATH /usr/local/lib
end
