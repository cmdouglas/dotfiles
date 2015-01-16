#!/usr/bin/env zsh

set -e

echo 'updating submodules'
git submodule update --init

echo 'linking stuff'
local here=$(dirname $0)
for file in .gitconfig .psqlrc .screenrc .tmux.conf .vimrc .vim .zshenv .zshrc; do
    if [[ $(readlink -f $HOME/$file) != $(readlink -f $here/$file) ]]; then
        ln -i -s -T $here/$file $HOME/$file
            echo "linked $file"
    fi
done

# install flake8 with default python
if whence pip > /dev/null; then
    echo 'installing jedi'
    pip install --user --upgrade jedi
else
    echo 'no pip found; skipping jedi (jedi-vim will probably not work!)'
fi
