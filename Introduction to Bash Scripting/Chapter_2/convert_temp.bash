#!/usr/bin/env bash
#
# USAGE
#    convert_temp.bash temp_in_F
#
# DESCRIPTION
#   Convert a temperature in Fahrenheit degrees to Celsius degrees,
#   and show two decimal places. Use bc to make the calculations.
#   C = (F - 32) * 5 / 9
set -euo pipefail

temp_f=$1
temp_f2=$(echo "scale=2; $temp_f - 32" | bc)
temp_c=$(echo "scale=2; $temp_f2 * 5 / 9" | bc)
echo "$temp_f F equals $temp_c C"
