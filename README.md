Install
=======
1. First clone the repository:

    `git clone git://github.com/tulioz/Dot-Files.git ~/Dot-Files`

2. Next update all the submodules:

    `cd ~/Dot-Files && git submodule update --init --recursive`

3. Install Homebrew:

    `ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`
    
## brew
1. Brew install key tools

    `brew install $(<brew-packages.txt)`

## vim
1. Symlink .vim by doing:

    `ln -s ~/Dot-Files/Vim/vim ~/.vim`

2. Symlink .vimrc by doing:

    `ln -s ~/Dot-Files/Vim/vimrc ~/.vimrc`

3. Once that is complete run Vim and type the following to install all the plugins:

    `:BundleInstall`

Some plugins will require some extra configuration.

### For TagBar:
In `Dot-Files/Vim/vimrc` confirm that `g:tagbar_ctags_bin` points to exuberant ctags on the
system, or remove the current line if your ctags is in your PATH.

## git
1. Symlink .gitignore_global by doing:

    `ln -s ~/Dot-Files/git/gitignore_global ~/.gitignore_global`

2. Configure the global git ignore:

    `git config --global core.excludesfile ~/.gitignore_global`

3. Set git Push default

    `git config --global push.default simple`

4. Set up git username

    `git config --global user.name "Your Name Here"`

5. Set up git email

    `git config --global user.email "your_email@youremail.com"`

6. Default to git merege --no-ff

    `git config --global merge.ff no`


## zsh with prezto
1. Symlink .prezto by doing:

    `ln -s ~/Dot-Files/zsh/prezto ~/.zprezto`

2. Launch zsh:

    `zsh`

3. Run the following lines:

    ```
    setopt EXTENDED_GLOB
    for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
        ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
    done
    ```

4. Symlink in zshrc:

    `ln -fs ~/Dot-Files/zsh/preztozshrc ~/.zshrc`

5. Symlink in zpreztorc:

    `ln -fs ~/Dot-Files/zsh/zpreztorc ~/.zpreztorc`

6. Set Zsh as your default shell:

    `chsh -s /bin/zsh`

You will have to open up a new terminal to see the changes, you might also have to log out and log back in.

#### Mac OS X
If you have administrator privileges, you must fix an Apple misconfiguration
in Mac OS X 10.7 Lion by renaming `/etc/zshenv` to `/etc/zprofile`, or Zsh will
have the wrong `PATH` when executed non-interactively by scripts.

#### Troubleshooting
For real troubleshooting check [this](https://github.com/sorin-ionescu/prezto#troubleshooting) out.

#### Usage
For oh-my-zsh usage instructions go [here](https://github.com/sorin-ionescu/prezto#usage).

### virtualenvwrapper
zshrc comes with variables necessary for the use of virtualenvwrapper. To set up your full Python environment do the following:

1. Install pip:

    `sudo easy_install pip`

2. Install virtualenv:

    `sudo pip install virtualenv`

3. Install virtualenvwrapper:

    `sudo pip install virtualenvwrapper`

4. Ensure that ~/dev is created or change the PROJECT_HOME directory. This is done so that `mkproject` works properly.

### Powerline
To use Powerline properly you'll need to install Inconsolata for Powerline,
follow instructions on how to do so [here](https://powerline.readthedocs.org/en/master/installation.html#patched-fonts).
