#!/usr/bin/fish

function adjust_completions
    complete -c xpdf -x -a "(__fish_complete_suffix .PDF)"
end
