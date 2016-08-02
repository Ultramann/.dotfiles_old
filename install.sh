#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# git
ln -s ${BASEDIR}/gitconfig ~/.gitconfig

# vim
ln -s ${BASEDIR}/vimrc ~/.vimrc
ln -s ${BASEDIR}/vim/ ~/.vim
git submodule init && git submodule update

# tmux
if [ `uname` == 'Darwin' ]; then
  ln -s ${BASEDIR}/tmux.conf ~/.tmux.conf
fi

# ipython
ln -s ${BASEDIR}/ipython/ ~/.ipython
