#!/bin/bash
# Restores yazi's flavor and plugins from the pins in yazi/package.toml.
# Those artifacts are chezmoiignored, since package.toml is the manifest.

set -eu

command -v ya >/dev/null 2>&1 || {
	echo "ya not found, skipping yazi packages" >&2
	exit 0
}

ya pkg install
