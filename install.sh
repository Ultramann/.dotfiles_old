#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# git
ln -s ${BASEDIR}/gitconfig ~/.gitconfig

# vim
ln -s ${BASEDIR}/vimrc ~/.vimrc
ln -s ${BASEDIR}/vim/ ~/.vim

# tmux
if [ `uname` == 'Darwin' ]; then
  ln -s ${BASEDIR}/tmux.conf ~/.tmux.conf
fi
