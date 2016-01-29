function fish_prompt_status

if [ $argv[1] -gt 0 ]
    set STATUS_FMT (set_color -o red)"("$argv[1]")"
else
    set STATUS_FMT ""
end
echo -n $STATUS_FMT

end
