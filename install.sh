#!/usr/bin/env zsh

set -e

if [[ $(uname) = 'Darwin' ]]; then
	# OSX doesn't come with gnu versions of stuff.  
	if [[ -x `which greadlink` ]]; then
		alias readlink='greadlink';
		alias ln='gln';
	else
		echo "Please install the GNU coreutils:  brew install coreutils."
		exit 1
	fi
fi

echo 'updating submodules'
git submodule update --init

echo 'linking stuff'

pushd `dirname $0`
local here=`pwd`
popd

for file in .gitconfig .psqlrc .tmux.conf .vimrc .vim .zshenv .zshrc .zsh; do
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
