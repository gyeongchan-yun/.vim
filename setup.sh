#!/bin/bash

if [ -f ~/.vimrc ]; then
  echo "[WARNING] .vimrc already exists."
  mv ~/.vimrc ~/.vimrc_temp
  echo "[INFO] Rename .vimrc to .vimrc_temp"
fi

echo "Vim Vundle installing.."
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
echo "Vim Vundle install completion."

echo "[INFO] Colorterm of terminal and tmux should be same."
if [ -f ~/.tmux.conf ]; then
  tmux_term=`cat ~/.tmux.conf | grep 'default-terminal'`
  if [[ -z $tmux_term ]]; then   
    echo set -g default-terminal $TERM >> ~/.tmux.conf
    tmux source ~/.tmux.conf
  else  
    echo "[INFO] Already colorterm is registered in .tmux.conf."
  fi
else
  echo set -g default-terminal $TERM > ~/.tmux.conf
  tmux source ~/.tmux.conf
fi

if [ -f ~/.bashrc ]; then
  tmux_alias=`cat ~/.bashrc | grep 'alias tmux='`
  if [[ -z $tmux_alias ]]; then
    echo "[INFO] Configuration of alias for tmux in bashrc"
    echo alias tmux=\'tmux -2u\' >> ~/.bashrc
    source ~/.bashrc
  else
    echo "[INFO] Already alias for tmux is registered in bashrc."
  fi
fi

vim +PluginInstall +qall
echo "[INFO] Plugin install is done."

# To solve the recent issue for vim-polyglot
#cd $HOME/.vim/bundle/vim-polyglot
#git checkout 7673a61990d4062adebbe49f71067b0aad90382a

cd $HOME
echo "[INFO] VIM setup done."
