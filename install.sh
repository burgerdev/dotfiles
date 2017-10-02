#!/bin/bash

set -e

if (( "${#DOTFILES_FETCH[*]}" < 1 ))
then
    DOTFILES_FETCH=(cat)
fi

if (( "${#DOTFILES_LOCATION[*]}" < 1 ))
then
    DOTFILES_LOCATION=`dirname "${BASH_SOURCE[0]}"`
fi

if [[ ! -z "${DOTFILES_REMOTE}" ]]
then
    DOTFILES_FETCH=(curl -sL)
    DOTFILES_LOCATION="https://raw.githubusercontent.com/burgerdev/dotfiles/master"
fi


function install {
    "${DOTFILES_FETCH[@]}" "${DOTFILES_LOCATION}/$1" > "$2"
}


echo "*** installing top-level rc files"

for rc in `"${DOTFILES_FETCH[@]}" "${DOTFILES_LOCATION}/.autogenerated/toplevelrcfiles"`
do
    install "${rc}" "${HOME}/.${rc}"
done

echo '*** installing ${HOME}/.config'

configdir="config" 

echo '  --- installing ${HOME}/.config/fish'

fishdir="${configdir}/fish"
fishtargetdir="${HOME}/.${fishdir}"

mkdir -p "${fishtargetdir}/functions"

for f in `"${DOTFILES_FETCH[@]}" "${DOTFILES_LOCATION}/.autogenerated/fish.functions"`
do
   install "$f" "${HOME}/.$f" 
done
