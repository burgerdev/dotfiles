#!/usr/bin/fish
#

function worklogin
    # if not ssh-add -L | grep -qxF (cat /home/burger/.ssh/id_edgeless_ed25519.pub)
        ssh-add $HOME/.ssh/id_edgeless_{ed25519,rsa} $HOME/.ssh/id_{ed25519,rsa}
    # end

    firefox -profile /home/burger/.mozilla/firefox/tx07kc26.Edgeless 2>/dev/null >/dev/null &
    # chromium --user-data-dir=/home/burger/.config/chromium-edgeless 2>/dev/null >/dev/null &
    disown $last_pid

    cd $HOME/edgeless
end
