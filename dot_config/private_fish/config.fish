# homebrew first
/opt/homebrew/bin/brew shellenv | source

fish_add_path (go env GOPATH)/bin

set fish_greeting

set -gx XDG_CONFIG_HOME $HOME/.config

set -gx EDITOR "code --wait"
set -gx VISUAL "code --wait"

set -gx HOMEBREW_NO_ASK 1

string match -q "$TERM_PROGRAM" "vscode"
and . (code --locate-shell-integration-path fish)

# adds alias for "kubectl" to "kubecolor" with completions
function kubectl --wraps kubectl
  command kubecolor $argv
end

# reuse "kubectl" completions on "kubecolor"
function kubecolor --wraps kubectl
  command kubecolor $argv
end

# yazi wrapper to change directory after running yazi
function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	command yazi $argv --cwd-file="$tmp"
	if read -z cwd < "$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end

alias ls='eza --all --long --group-directories-first --icons --git --header --no-user --hyperlink=auto'

abbr --add dev 'cd ~/dev'

abbr --add brewu 'brew update && brew upgrade'

abbr --add k 'kubectl'

abbr --add python "ipython"
abbr --add python3 "ipython"

abbr --add cat 'bat'

if status is-interactive
    # Commands to run in interactive sessions can go here
    atuin init fish | source
end

starship init fish | source

direnv hook fish | source

zoxide init fish | source

set -gx PATH "$HOME/.local/bin" $PATH

# updates PATH for the Google Cloud SDK
if test -f "$HOME/dev/google-cloud-sdk/path.fish.inc"
    source "$HOME/dev/google-cloud-sdk/path.fish.inc"
end
