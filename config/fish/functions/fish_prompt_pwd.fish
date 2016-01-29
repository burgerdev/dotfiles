function fish_prompt_pwd

set -l MAX_PATH_CHARS 45

if [ (pwd|wc -c) -gt (pwd|tail -c $MAX_PATH_CHARS|wc -c) ]
    set TRIM_PWD "…"(pwd|tail -c $MAX_PATH_CHARS)
else
    set TRIM_PWD (pwd)
end

printf "%s%s" (set_color $fish_color_cwd) $TRIM_PWD

end
