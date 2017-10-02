function fish_prompt

set OLD_STATUS $status

switch (uname)
    case Darwin
            echo -n (set_color normal)
    case '*'
            echo -n (set_color -o)
end

if test (whoami) = root 
    echo -n (set_color red)
else
    echo -n (set_color $fish_color_host)
    echo -n $USER
    echo -n "@"
end
echo -n (fish_prompt_hostname)
echo -n " "
echo -n (fish_prompt_pwd)
echo -n " "
echo -n (fish_prompt_git)
echo ""
echo -n (fish_prompt_status $OLD_STATUS)
echo -n (set_color normal)
if test (whoami) = root 
echo -n "# "
else
echo -n "> "
end

end
