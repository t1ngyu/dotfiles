#!/bin/sh

cd `dirname $0`


install_dir=installed_files


setup_vim () {
    echo setup vim...
    # Get vundle
    git clone https://github.com/VundleVim/Vundle.vim.git $install_dir/vim/bundle/Vundle.vim
    # Use vimfiles in current directory
    if [ -e ~/.vimrc ]
    then
        rm ~/.vimrc
    fi
    if [ -e ~/.vim ]
    then
        rm ~/.vim
    fi
    ln -sf `pwd`/vim/vimrc ~/.vimrc
    ln -sf `pwd`/$install_dir/vim ~/.vim

    # Install plugins
    #vim +PluginInstall +qall
}

setup_tmux () {
    echo setup tmux...
    if [ -e ~/.tmux.conf ]
    then
        rm ~/.tmux.conf
    fi
    ln -sf `pwd`/tmux/tmux.conf ~/.tmux.conf
}

setup_bash () {
    echo setup bash...
    echo . `pwd`/bash/bashrc >> ~/.bashrc
}


if [ -e $install_dir ]
then
    if [ $# -gt 0 ] && [ "$1" = "force" ]
    then
        echo force reinstall.
        rm -rf $install_dir
    else
        echo The dotfiles has been installed!
        exit 1    
    fi
fi


mkdir $install_dir
setup_vim
setup_tmux
setup_bash

