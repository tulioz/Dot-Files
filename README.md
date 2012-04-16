Install
=======
First clone the repository `git clone git://github.com/tulioz/Vim-Files.git ~/.vim`.
Symlink .vim/vimrc properly by doing `ln -s ~/.vim/vimrc ~/.vimrc`.
Once that is complete run Vim and type `:BundleInstall` to install all the
plugins.

Some plugins will require some extra configuration.

###For Command-T:
* `cd ~/.vim/bundle/Command-T/ruby/command-t`
* `rvm use system`
* `ruby extconf.rb`
* `make`

###For TagBar:
In `vimrc` confirm that `g:tagbar_ctags_bin` points to exuberant ctags on the
system, or remove the current line if your ctags is in your PATH.