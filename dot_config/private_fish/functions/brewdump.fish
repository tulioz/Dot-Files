function brewdump --description "refresh the Brewfile from what's installed, then sync it to chezmoi"
    brew bundle dump --no-vscode --file="$HOME/.Brewfile" --force
    chezmoi re-add "$HOME/.Brewfile"
end
