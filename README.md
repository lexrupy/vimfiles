
This is a simple ~/.vim dir to use on remote servers

Installation Unix Like (Linux/MacOS)
====================================

Clone the repo:
`git clone https://github.com/lexrupy/vimfiles.git ~/.vim`


Features
========

Leader Key set to \<space\>

  * \<leader\>ff: Find Files (Fuzzy) thanks to path +=\*\*
  * \<leader\>fw: Find Word (using ripgrep, so you need to install ripgrep sudo apt install ripgrep)
  * \<leader\>e: Toggle file Netrw file explorer. it is customized and simplified
  * \<leader\>c: Close current buffer
  * \<tab\>/\<shift-tab\>: Cycle fowward and backwards on open buffers
  * gd: Go to definition. please uset MakeTags command to generate ctags (require exuberant-ctags sudo apt install exuberant-ctags)
  * Automatically remove trailing spaces on save on a variety of file types


other usefull features. please read de vimrc file to understand what is going on
