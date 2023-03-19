#!/usr/bin/env bash
#
# USAGE
#   bash chapter_4.bash
#
# Settings are disabled to demonstrate errors.
set -euo pipefail

# Functions and automation.
# Basic functions in bash.
# Something I don't like about this course is that the instructor misses opportunities
# to use best practices.
# A function has the following syntax:
# function_name () {
# function function_name {
#   # function code
#   return # a status value
# }
#
# Example.
function print_hello {
    echo "Hello world!"
}

print_hello

# Convert Fahrenheit to Celsius and write the result to STDOUT.
echo
echo "Converting temperature..."
temp_f=30
function convert_temp {
    # Call bc to perform the math.
    temp_c=$(echo "scale=2; ($temp_f - 32) * 5 / 9" | bc)
    echo $temp_c
}
convert_temp

# Exercise.
# Uploading model results to the cloud.
echo
echo "Iterating through files..."
function upload_to_cloud {
    for file in data/output_dir/*results*; do
        echo "Uploading $file to the cloud... (not really)"
    done
}
upload_to_cloud

# Exercise.
# Get and print the day of the week.
echo
echo "Getting and printing the day of the week..."
function what_day_is_it {
    # Use the cut utility.
    current_day=$(date | cut -d " " -f1)
    echo $current_day

    # This is an alternative way to do this using an
    # array variable.
    declare -a date_parts
    date_parts=($(date))
    echo ${date_parts[0]}

    # Another way is to call date with the correct option
    # to output just the day of the week.
    echo $(date +%a)
    echo $(date +%A)
}
what_day_is_it

# Arguments, return values, and scope.
# Arguments in a function can be accessed with $1, ..., ${10}, ... notation.
# $@ and $* give all arguments.
# $# gives the number of arguments.

# Example: Parsing arguments.
# Improvement: allow for files with space characters in their names.
echo
echo "Printing arguments..."
function print_filename {
    echo "The first file was $1"
    for file in "$@"; do
        echo "This file has name $file"
        echo "This file has name \"$file\""
    done
}
print_filename "LOTR.txt" "mod.txt" "A.py" "This File.txt"

# Scope in programming.
# "Global" means something is accessible anywhere in the program, including
# inside FOR loops, IF statements, functions, etc.
# "Local" means something is accessible only in a certain part of the program.
# All variables in bash are global by default.

# Example.
echo
echo "Experiments with scope..."
function print_filename2 {
    first_filename=$1
}
print_filename2 "LOTR.txt" "model.txt"
echo $first_filename # "LOTR.txt"

# Global scope can be dangerous.
# How to restrict scope in bash functions.
echo
echo "Local variable in function..."
function print_filename3 {
    local first_filename3=$1
    echo $first_filename3
}

# With set -u, this is an error because the variable is unbound.
# "first_filename3: unbound variable"
# Turn off set -u for this demonstration.
# In the course's example, a blank line is printed.
echo
echo "Can't use local variable from function..."
print_filename3 "model.txt"
set +u
echo "first_filename3 = \"${first_filename3}\""
set -u

# Return values.
# The return option in bash is only meant to determine if the function
# was a success (0) or a failure (1 through 255). It is captured in the
# global variable $?.

# To return data, we can:
#   Assign it to a global variable.
#   Echo the data in the last line of the function and capture the
#   data using a subshell.

# Example.
echo
echo "Deliberate error..."
# Toggle set -e to allow this error.
set +e
echo
function function_2 {
    echlo # An error of "echo"
}
function_2
set -e

# Example
# Returning data using a subshell and echo.
echo
echo "Returning data using a subshell and echo..."
function convert_temp2 {
    # Call bc to perform the math.
    echo $(echo "scale=2; ($1 - 32) * 5 / 9" | bc)
}
converted=$(convert_temp2 30)
echo "30F in Celcius is $converted C"

# Exercise
# A bash function that calculates a percentage.
echo
echo "Return a percentage..."
echo $(echo "scale=2; 100 * 456 / 632" | bc)%

function return_percentage {
    percent=$(echo "scale=2; 100 * $1 / $2" | bc)
    echo $percent
}
return_test=$(return_percentage 456 632)
echo "456 out of 632 as a percent is $return_test%"

# Exercise
# Sports analytics function.
# egrep -v 'Winner' removes the header row.
# cut -d "," -f2 splits the line using the "," delimiter and
# extracts field 2, the Winner field.
# sort sorts the names of the teams.
# uniq -c counts the number of rows for each team
# egrep "Etar" extracts the row for "Etar".
echo
echo "Wins for Etar..."
echo $(cat data/soccer_scores_edited.csv | cut -d "," -f2 | egrep -v 'Winner' | sort | uniq -c | egrep "Etar")

# Return the count for the given team.
# This sets a global variable with the result.
function get_number_wins {
    win_stats=$(cat data/soccer_scores_edited.csv | cut -d "," -f2 | egrep -v 'Winner' | sort | uniq -c | egrep "$1")
}
get_number_wins "Etar"
echo "The aggregated stats are: $win_stats"

# Exercise
# Sum an array. The function must use local variables.
# Use bc so floating point numbers can be summed.
echo
echo "Sun an array..."
function sum_array {
    local sum=0
    for number in $@; do
        sum=$(echo "$sum + $number" | bc)
    done
    echo $sum
}

test_array=(14 12 23.5 16 19.34)
total=$(sum_array ${test_array[@]})
echo "The total sum of the test array is $total"

echo
echo "cron scripts commented out"
# Scheduling your scripts with cron.
# Reasons for using cron.

# cron is driven by the crontab, a file that contains cronjobs,
# where each cronjob indicates when to run the given command.
# Use the crontab -l command to list cronjobs.
# Formatting the crontab:
# * * * * * command to execute
# first * is minute (0-59)
# second * is hour (0-23)
# third * is day of the month (1-31)
# fourth * is month of the year (1-12)
# fifth * is day of the week (0-6 Sunday through Saturday, 7 is Sunday)
# * means run at every interval
#
# Examples:
# 5 1 * * * bash myscript.sh
# run the command bash myscript.sh at 5 minutes after the first hour (1:05 am).
# 15 14 * * 7 bash myscript.sh
# run the command bash myscript.sh at 14:15 (2:15 pm) on Sunday.
# 15,30,45 * * * *
# run the command every hour at 15, 30, and 45 minutes after the hour.
# */15 * * * * runs every 15 minutes

# Exercise
# Creating cronjobs.
# 30 2 * * * bash script1.sh
# 15,30,45 * * * * bash script2.sh
# 30 23 * * 0 bash script3.bash

# Exercise
# Scheduling cronjobs with crontab.
# Use crontab -l and crontab -e for this exercise.
# 30 2 * * * bash extract_data.sh

# Use crontab -e to edit your list of cronjobs.
# EDITOR=nano crontab -e
# 30 1 * * * extract_data.sh
# crontab -l

#####
# Extra credit.
# Identify shell programs in /usr/bin.
# Read these scripts to get ideas for scripting with bash.
# echo
# file /usr/bin/* | grep "POSIX shell"
#
# This one is interesting.
# cat /usr/bin/bashbug

echo "Script $0 completed."
