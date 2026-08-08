#!/bin/bash
# Installs the fish plugins listed in fish_plugins.
#
# fisher itself comes from the Brewfile, so nothing is fetched or executed
# from the network here.

set -eu

command -v fish >/dev/null 2>&1 || {
	echo "fish not found, skipping fisher" >&2
	exit 0
}

if fish -c 'functions -q fisher'; then
	fish -c 'fisher update'
else
	echo "fisher not found; run 'brew bundle' first" >&2
fi
