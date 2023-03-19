#!/usr/bin/env bash
set -euo pipefail

# cut -d " " -f 2
# splits the string using the " " character and outputs field 2.
# cut -d " " -f 1 returns:
#   magpie,
#   emu,
#   etc.
# The -d flag sets the single character delimiter instead of the tab
# character.
# Call sort before calling uniq since uniq assumes a sorted file.
# The -c flag counts the number of unique lines.
cat data/animals.txt | cut -d " " -f 2 | sort | uniq -c
