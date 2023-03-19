#!/usr/bin/env bash
set -euo pipefail

# USAGE
#   bash chapter_1.bash
#
# NOTES
#   I have put all data files in the data subdirectory and
#   modified the exercises to use these files.
#
# Chapter 1: From Command-Line to Bash Script
#
# Video: Introduction and refresher
#
# Important shell commands:
#   grep or egrep: filters input based on regex pattern matching
#   cat: concatenates file contents line by line
#   tail / head: display only the first / last -n lines of a file
#   wc: counts words (-w) or lines (-l) of a file
#   sed: does pattern-matched string replacement
#
# Regexes
#
# Used to filter files, data within files, match arguments, and a variety
# of other uses.
#
# Use regex101.com for testing regex expressions.
#
# Examples
#
# Given a file, fruits.txt, containing 3 lines of data:
# banana
# apple
# carrot
echo "grep examples:"
grep 'a' data/fruits.txt
echo
grep 'p' data/fruits.txt
echo
grep '[pc]' data/fruits.txt
echo
grep '[^pc]' data/fruits.txt
echo
grep '[^ban]' data/fruits.txt
echo
echo "grep -v '[pc]' data/fruits.txt"
grep -v '[pc]' data/fruits.txt

# Sort and count unique values.
echo
echo "sort and count"
sort data/fruits.txt | uniq -c

# Sort, count, and get top 2 fruits.
echo
echo "sort and count"
cat data/fruits.txt | sort | uniq -c | head -n 2

# Exercise
# Find the file data/soccer_scores.csv. Find the winner in 1959.
# I have a copy of this file.
echo
echo "find winner in 1959"
soccer_file=$(find . -name soccer_scores.csv)
cat $soccer_file | grep 1959

# Exercise
# Find the number of lines in two_cities.txt containing
# "Sydney Carton" or "Charles Darnay".
# cat two_cities.txt | grep -E 'Sydney Carton|Charles Darnay' | wc -l
# The output is:
# 77

# Video: Your first bash script.
# Example
echo
bash eg.sh

# Example
# Given the file data/animals.txt, count the animals in each group.
echo
bash group.sh

# Exercise
# Use the DataCamp IDE for bash scripting.
# #!/bin/bash
# # Concatenate the file
# cat server_log_with_todays_date.txt
#
# Output is:
# 2019-01-01 | server request | windows | ping-2.000
# 2019-02-01 | server request | mac | ping-2.000
# 2019-02-01 | server request | windows | ping-12.000
# 2019-02-01 | server request | linux | ping-6.000

# Exercise
# Given the file data/soccer_scores.csv, create a bash script from a shell
# piped command which aggregates to see how many times each team has won.
echo
echo "Bulgarian team wins"
cat data/soccer_scores.csv | cut -d "," -f 2 | tail -n +2 | sort | uniq -c
# A better way (IMHO):
echo
echo "Do it a better way"
tail -n +2 < data/soccer_scores.csv | cut -d "," -f 2 | sort | uniq -c

# Exercise
# Repeat the above exercise, but use sed to change the name of
# Cherno to Cherno City and Arda to Arda United.
echo
echo "Fix team names"
cat data/soccer_scores.csv | sed 's/Cherno/Cherno City/g' | \
sed 's/Arda/Arda United/g' > soccer_scores_edited.csv
tail -n +2 < soccer_scores_edited.csv | cut -d "," -f 2 | sort | uniq -c
# Do it in a single command.
echo
echo "Do it a better way"
cat data/soccer_scores.csv | sed 's/Cherno/Cherno City/g' | \
sed 's/Arda/Arda United/g' | tail -n +2 | cut -d "," -f 2 | sort | uniq -c

# Standard streams and arguments.
# Three streams:
# STDIN
# STDOuT
# STDERR
# Arguments:
# ARGV is the array of all the arguments given to the program.
# Use $1, $2, etc.
# $@ and $* return all the arguments in ARGV.
# $# is the number of arguments.

# Example
echo
echo "arguments example"
bash args.sh one two three four five

# Exercise
echo
echo "using arguments in bash scripts"
bash script.sh Bird Fish Rabbit

# Exercise
echo
echo "Hiring data"
bash get_salaries_for_city.sh Seoul
bash get_salaries_for_city.sh Tallinn

# To Do
#   sed tutorial: https://www.grymoire.com/Unix/Sed.html
#   awk tutorial: https://www.grymoire.com/Unix/Awk.html
#       only 8-bit character sets are handled
#       I will use Python instead
