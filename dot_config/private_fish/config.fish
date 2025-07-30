# homebrew first
/opt/homebrew/bin/brew shellenv | source

set -gx XDG_CONFIG_HOME $HOME/.config

set fish_greeting

abbr --add brewu 'brew update && brew upgrade'

alias claude="/Users/ofergoldstein/.claude/local/claude"

set -gx EDITOR "code --wait"
set -gx VISUAL "code --wait"

string match -q "$TERM_PROGRAM" "vscode"
and . (code --locate-shell-integration-path fish)

if status is-interactive
    # Commands to run in interactive sessions can go here
    atuin init fish | source
end

thefuck --alias | source

starship init fish | source

direnv hook fish | source

# adds alias for "kubectl" to "kubecolor" with completions
function kubectl --wraps kubectl
  command kubecolor $argv
end

# reuse "kubectl" completions on "kubecolor"
function kubecolor --wraps kubectl
  command kubecolor $argv
end

alias ls='eza --all --long --group-directories-first --icons --git --header --no-user --hyperlink'

abbr --add k 'kubectl'

abbr --add dev 'cd ~/dev'

abbr --add python "ipython"
abbr --add python3 "ipython"

abbr --add htopu 'htop -u (whoami)'

abbr --add cat 'bat'

zoxide init fish | source
