function fish_greeting

switch $TERM
    case 'screen*'
        echo "This is window" (set -q WINDOW; and echo $WINDOW; or echo "?") \
            "in screen" (set -q STY; and echo $STY; or echo "<unknown>."(hostname) )
end

end
