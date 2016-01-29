function fish_prompt_git

set GIT_BRANCH_INFO (__terlar_git_prompt|tail -c+2)

if [ "$GIT_BRANCH_INFO" != "" ]
    echo -n (set_color -o yellow)
    echo -n "git:"
    echo $GIT_BRANCH_INFO
end

end



