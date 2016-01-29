function fish_prompt

set OLD_STATUS $status

echo -n (set_color $fish_color_host)
echo -n $USER
echo -n "@"
echo -n (fish_prompt_hostname)
echo -n " "
echo -n (fish_prompt_pwd)
echo -n " "
echo -n (fish_prompt_git)
echo ""
echo -n (fish_prompt_status $OLD_STATUS)
echo -n (set_color normal)
echo -n "> "

end
