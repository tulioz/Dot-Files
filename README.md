Install
=======
1. First clone the repository:

    `git clone git://github.com/tulioz/Dot-Files.git ~/Dot-Files`

2. Next update all the submodules:

    `cd ~/Dot-Files && git submodule update --init --recursive`

3. Install Homebrew:

    `/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`

4. Create ~/dev directory:

    `mkdir ~/dev`
    
## brew
1. Brew install key tools

    `cd ~/Dot-Files && brew bundle`
    
## python packages
1. pip install important global packages

    `pip install -r ~/Dot-Files/pip-packages.txt`

## vim
1. Symlink .vim by doing:

    `ln -s ~/Dot-Files/Vim/vim ~/.vim`

2. Symlink .vimrc by doing:

    `ln -s ~/Dot-Files/Vim/vimrc ~/.vimrc`

3. Set up custom font

    `cp ~/Dot-Files/Inconsolata\ for\ Powerline.otf ~/Library/Font`

Some plugins will require some extra configuration.

### TagBar
In `Dot-Files/Vim/vimrc` confirm that `g:tagbar_ctags_bin` points to exuberant ctags on the
system, or remove the current line if your ctags is in your PATH.

## git
1. Symlink .gitignore_global by doing:

    `ln -s ~/Dot-Files/git/gitignore_global ~/.gitignore_global`

2. Configure the global git ignore:

    `git config --global core.excludesfile ~/.gitignore_global`

3. Set up git username

    `git config --global user.name "Your Name Here"`

4. Set up git email

    `git config --global user.email "your_email@youremail.com"`

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

5. Symlink in powerlevel10k config:

    `ln -fs ~/Dot-Files/powerlevel10k-config ~/.p10k.zsh`

6. Set Zsh as your default shell:

    `chsh -s /bin/zsh`

You will have to open up a new terminal to see the changes, you might also have to log out and log back in.

#### Troubleshooting
For real troubleshooting check [this](https://github.com/sorin-ionescu/prezto#troubleshooting) out.

#### Usage
For prezto usage instructions go [here](https://github.com/sorin-ionescu/prezto#usage).

## Set Up github
1. Generate and store ssh key for github

    `https://help.github.com/articles/generating-ssh-keys/`
    
## List of Mac Apps

### App Store
* Amphetamine
* Xcode
* Reeder 4
* Sonos
* Microsoft To Do
* 1Password

### Non-App Store
* PyCharm
* Scroll Reverser
* iStat Menus