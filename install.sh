#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# git
ln -s ${BASEDIR}/gitconfig ~/.gitconfig

# vim
ln -s ${BASEDIR}/vimrc ~/.vimrc
ln -s ${BASEDIR}/vim ~/.vim

# tmux
if [ `uname` == 'Darwin' ]; then
  ln -s ${BASEDIR}/tmux.conf ~/.tmux.conf
fi

# ipython
if [ `uname` == 'Linux' ]; then
  echo "c.InteractiveShellApp.exec_lines.extend(['import matplotlib', 'matplotlib.use(\"TkAgg\")', 'import matplotlib.pyplot as plt'])" >> ${BASEDIR}/ipython/profile_default/ipython_config.py
fi
ln -s ${BASEDIR}/ipython ~/.ipython
