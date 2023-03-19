#!/usr/bin/env bash
set -euo pipefail

# Build a small Bash script that will be useful to call in many areas of your
# data pipeline. It must take in a single argument (string of a day) into
# ARGV and use a CASE statement to print out whether the argument was a
# weekday or a weekend. You only need to account for the capitalized case for
# now.
#
# You also don't need to worry about words or letters before and after. Just
# use exact matching for this example.
case $1 in
    Monday|Tuesday|Wednesday|Thursday|Friday) echo "$1 is a Weekday!" ;;
    Saturday|Sunday) echo "$1 is a Weekend!" ;;
    *) echo "$1 is not a day!" ;;
esac
