
This is my ~/.vim dir

Installation
============

Unix Like (Linux/MacOS)
=======================

Clone the repo:
`git clone https://github.com/lexrupy/vimfiles.git ~/.vim`

Get Submodules:
`cd ~/.vim`

`git submodule update --init`

Make sure vim finds the vimrc file by either symlinking it:
`ln -s ~/.vim/vimrc ~/.vimrc`

Windows
=======

Clone the repo:
`git clone https://github.com/lexrupy/vimfiles.git ~/vimfiles`

Get Submodules:
cd ~/vimfiles

`git submodule update --init`

Copy the vimrc file to home directory

`cp vimrc ..\_vimrc`

Keep in mind that all modifications you do in the ~\_vimrc file will
not be tracket to ~\vimriles\vimrc

