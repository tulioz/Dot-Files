Install
=======
1. First clone the repository:

    `git clone git://github.com/tulioz/Dot-Files.git ~/Dot-Files`

* Next update all the submodules:

    `cd ~/Dot-Files && git submodule update --init --recursive`

## vim
1. Symlink .vim by doing:

    `ln -s ~/Dot-Files/Vim/vim ~/.vim`

* Symlink .vimrc by doing:

    `ln -s ~/Dot-Files/Vim/vimrc ~/.vimrc`

* Once that is complete run Vim and type the following to install all the plugins:

    `:BundleInstall`

Some plugins will require some extra configuration.

### For Command-T:

1. `cd ~/.vim/bundle/Command-T/ruby/command-t`
* `rvm use system`
* `ruby extconf.rb`
* `make`

### For TagBar:
In `Dot-Files/Vim/vimrc` confirm that `g:tagbar_ctags_bin` points to exuberant ctags on the
system, or remove the current line if your ctags is in your PATH.

## git
1. Symlink .gitignore_global by doing:

    `ln -s ~/Dot-Files/git/gitignore_global ~/.gitignore_global`

* Configure the global git ignore:

    `git config --global core.excludesfile ~/.gitignore_global`

## zsh
1. Symlink .zshrc by doing:

    `ln -s ~/Dot-Files/zsh/zshrc ~/.zshrc`

* Symlink .oh-my-zsh by doing:

    `ln -s ~/Dot-Files/zsh/oh-my-zsh ~/.oh-my-zsh`

### oh-my-zsh
1. Set Zsh as your default shell:

    `chsh -s /bin/zsh`

You will have to open up a new terminal to see the changes, you might also have to log out and log back in.

#### Mac OS X

If you have administrator privileges, you must fix an Apple misconfiguration
in Mac OS X 10.7 Lion by renaming `/etc/zshenv` to `/etc/zprofile`, or Zsh will
have the wrong `PATH` when executed non-interactively by scripts.

#### Troubleshooting

For real troubleshooting check [this](https://github.com/sorin-ionescu/oh-my-zsh#troubleshooting) out.

#### Usage

For oh-my-zsh usage instructions go [here](https://github.com/sorin-ionescu/oh-my-zsh#usage).