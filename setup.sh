#!/bin/bash -ex

for file in `find $HOME/dotfiles -type f | grep -v -e 'dotfiles/.git' -e 'README.md' -e 'setup.sh' | perl -nle 'm!dotfiles/(.+)$! and print $1'`; do
    dir=$(dirname $file)
    if [[ "$dir" != "." ]]; then
        mkdir -p $HOME/$dir
    fi
    if [ ! -e $HOME/$file ]; then
        ln -s $HOME/dotfiles/$file $HOME/$file
    fi
done
