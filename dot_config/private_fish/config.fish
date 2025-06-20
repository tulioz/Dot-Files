abbr --add brewu 'brew update && brew upgrade'

alias claude="/Users/ofergoldstein/.claude/local/claude"

string match -q "$TERM_PROGRAM" "vscode"
and . (code --locate-shell-integration-path fish)

if status is-interactive
    # Commands to run in interactive sessions can go here
    atuin init fish | source
end

thefuck --alias | source

zoxide init fish | source

starship init fish | source