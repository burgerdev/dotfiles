function fish_prompt_hostname

if not set -q __fish_prompt_hostname
    set -g __fish_prompt_hostname (hostname | cut -d . -f 1)
end

echo -n $__fish_prompt_hostname
end

