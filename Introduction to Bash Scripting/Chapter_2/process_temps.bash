#!/usr/bin/env bash
#
# USAGE
#    bash process_temps.bash
#
# DESCRIPTION
#    Read temperatures from files in the data/temps subfolder.
#    Each region file contains a single line with a single temperature.
set -euo pipefail

temp_a=$(cat data/temps/region_A)
temp_b=$(cat data/temps/region_B)
temp_c=$(cat data/temps/region_C)
echo "The three temperatures were $temp_a, $temp_b, and $temp_c"

# Try it a different way to avoid using a subshell to call cat.
temp_a2=$(< data/temps/region_A)
temp_b2=$(< data/temps/region_B)
temp_c2=$(< data/temps/region_C)
echo "The three temperatures were $temp_a2, $temp_b2, and $temp_c2"
