#!/usr/bin/fish

function docker-attach

docker exec -it "$argv[1]" /bin/bash

end
