#!/bin/bash

cd $HOME
if [ ! -d $HOME/vim-profiler ]; then
  git clone https://github.com/gyeongchan-yun/vim-profiler.git
fi
if [ -d $HOME/vim-profiler ]; then
  cd vim-profiler/
  python vim-profiler.py
fi

