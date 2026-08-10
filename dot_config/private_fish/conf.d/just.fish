# Make the global justfile (~/.config/just/justfile) reachable from anywhere
# without adding an `import?` line to every repo. just has no auto-import and
# deliberately so, since merging justfiles raises name-conflict questions:
# see casey/just#1025 and #2422.
#
#   just <recipe>   local recipe if it exists, otherwise the global one
#   just --list     local recipes, then global ones under their own heading
#   anything else   passed straight through, including bare `just`
function just --wraps just
    # --list: show local recipes then global ones
    if test "$argv[1]" = --list; or test "$argv[1]" = -l
        if command just --summary >/dev/null 2>&1
            command just $argv
        end
        if command just --global-justfile --summary >/dev/null 2>&1
            set_color brblack
            echo "Global recipes (just -g):"
            set_color normal
            command just --global-justfile --list 2>/dev/null | tail -n +2
        end
        return 0
    end

    # no args, or any other flag: native behaviour
    if test (count $argv) -eq 0; or string match -q -- '-*' $argv[1]
        command just $argv
        return $status
    end

    # a recipe name: prefer the local justfile, fall back to the global one
    set -l local_recipes (command just --summary 2>/dev/null | string split ' ')
    if contains -- $argv[1] $local_recipes
        command just $argv
    else
        command just --global-justfile $argv
    end
end
