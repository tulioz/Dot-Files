# Make the global justfile (~/.config/just/justfile) reachable from anywhere
# without adding an `import?` line to every repo. just has no auto-import and
# deliberately so, since merging justfiles raises name-conflict questions:
# see casey/just#1025 and #2422.
#
#   just <recipe>       local recipe if it exists, otherwise the global one
#   just / just --list  local recipes, then global ones under their own heading
#   anything else       passed straight through
function just --wraps just
    # bare `just` or `--list`: local output, then the global recipes.
    # Bare `just` still runs the local default recipe, which by convention is
    # `@just --list`; if a repo's default does real work, its output appears
    # above the global section rather than being replaced by it.
    if test (count $argv) -eq 0; or test "$argv[1]" = --list; or test "$argv[1]" = -l
        set -l had_local false
        if command just --summary >/dev/null 2>&1
            command just $argv
            set had_local true
        end
        if command just --global-justfile --summary >/dev/null 2>&1
            # Piping --list through tail makes just see a non-TTY and drop all
            # colour, so force it back on, but only when we're actually on a
            # terminal or `just > file` would capture escape codes.
            set -l colour
            isatty stdout; and set colour --color always

            $had_local; and echo
            isatty stdout; and set_color brblack
            echo "Global recipes:"
            isatty stdout; and set_color normal
            command just --global-justfile --list $colour 2>/dev/null | tail -n +2
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
