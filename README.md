Install
=======
First clone the repository `git clone git://github.com/tulioz/Dot-Files.git`.

## Vim
1. Symlink .vim by doing

    `ln -s ~/Dot-Files/Vim/ ~/.vim`

* Symlink .vimrc by doing:

    `ln -s ~/Dot-Files/Vim/vimrc ~/.vimrc`

* Once that is complete run Vim and type the following to install all the plugins:

    `:BundleInstall`

Some plugins will require some extra configuration.

#### For Command-T:

1. `cd ~/.vim/bundle/Command-T/ruby/command-t`
* `rvm use system`
* `ruby extconf.rb`
* `make`

#### For TagBar:
In `vimrc` confirm that `g:tagbar_ctags_bin` points to exuberant ctags on the
system, or remove the current line if your ctags is in your PATH.

## Git
1. Symlink .gitignore_global by doing:

    `ln -s ~/Dot-Files/git/gitignore_global ~/.gitignore_global`

* Configure the global git ignore:

    `git config --global core.excludesfile ~/.gitignore_global`

## zsh
### oh-my-zsh
1. Initialize the submodules:

    `cd ~/.oh-my-zsh && git submodule update --init --recursive`

* Set Zsh as your default shell:

    `chsh -s /bin/zsh`