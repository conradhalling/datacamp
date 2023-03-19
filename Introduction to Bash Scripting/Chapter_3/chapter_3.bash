#!/usr/bin/env bash
set -euo pipefail

# USAGE
#   bash chapter_3.bash
#
# Example.
# IF statement and strings.
x="Queen"
if [ $x == "King" ]; then
    echo "$x is a King!"
else
    echo "$x is not a King!"
fi

# Arithmetic IF statements (option 1).
echo
x=10
if (($x > 5)); then
    echo "$x is more than 5!"
fi
if (( x > 5 )); then
    echo "$x is more than 5!"
fi

# Arithmetic IF statements (option 2).
# -eq equal to
# -ne not equal to
# -lt less than
# -le less than or equal to
# -gt greater than
# -ge greater than or equal to
echo
x=10
if [ $x -gt 5 ]; then
    echo "$x is more than 5!"
fi

# Bash file conditional flags.
# -e if the file exists
# -s if the file exists and has a size greater than 0
# -r if the file exists and is readable
# -w if the file exists and is writable

# Bash AND and OR.
# && and
# || or
# Note that -gt and -lt must be used instead of < and > here.
echo
x=10
if [[ $x -gt 5 ]] && [[ $x -lt 11 ]]; then
    echo "$x is more than 5 and less than 11!"
fi

# Is this string comparison here?
if [[ $x > 5 ]] && [[ $x < 11 ]]; then
    echo "$x is more than 5 and less than 11!"
else
    echo "fail"
fi

# Can use < and > if the expressions are quoted.
if [[ "$x > 5" ]] && [[ "$x < 11" ]]; then
    echo "$x is more than 5 and less than 11!"
else
    echo "fail"
fi

if [[ ($x -gt 5) && ($x -lt 11) ]]; then
    echo "$x is more than 5 and less than 11!"
fi

# > and < work OK here.
if (( x > 5 )) && (( x < 11 )); then
    echo "$x is more than 5 and less than 11!"
fi

# grep -q is quiet mode; grep returns true if there is a match.
echo
if grep -q Hello data/words.txt; then
    echo "Hello is inside!"
fi

# Using a subshell.
if $(grep -q Hello data/words.txt); then
    echo "Hello is inside!"
fi

# Exercise.
# Given four files, log.csv, log1.txt, logdays.txt, and logfiles8.txt,
# identify files containing "SVRM_" and "vpt" and copy them into the
# good_logs subdirectory.
# For this exercise, I changed "move" to "copy" to make it a
# nondestructive exercise.
echo
echo "Copying good log file(s)..."

# Delete the old directory if it exists and create a new one.
rm -rf good_logs
mkdir good_logs
bash copy_log_file_if_good.bash data/log.csv
bash copy_log_file_if_good.bash data/log1.txt
bash copy_log_file_if_good.bash data/logdays.txt
bash copy_log_file_if_good.bash data/logfiles8.txt
ls good_logs

# FOR loops and WHILE statements
# Why is WHILE a statement and not a loop?
echo
echo "for loops..."
for x in 1 2 3; do
    echo $x
done

echo
for x in {1..10}; do
    echo $x
done

echo
for x in {1..12..3}; do
    echo $x
done

# C-like FOR loop (three expression syntax).
echo
for (( x = 2; x <= 12; x += 2 )); do
    echo $x
done

# Glob expansions.
echo
echo "Glob expressions..."
for script in *.bash; do
    echo "$script"
done

# A different way to do this:
echo
declare -a scripts=*.bash
for script in ${scripts[@]}; do
    echo $script
done

echo
scripts2=*.bash
for script in ${scripts2[@]}; do
    echo $script
done

# Using a subshell.
echo
for script in $(ls *.bash | grep -i 'chap'); do
    echo $script
done

# Do this a different way.
echo
for script in *chap*; do
    echo $script
done

# WHILE statement example. Can use [ ... ] or (( ... )).
echo
echo "while statement..."
x=1
while [[ $x -le 3 ]]; do
    echo $x
    (( x += 1 ))
done

# Exercise.
echo
echo "Exercise: for loop with glob..."
for file in data/inherited_folder/*.R; do
    echo $file
done

# Exercise.
# Write a script that loops through each file in the data/robs_files/ directory
# to see if it is a Python file (ends in .py) AND contains
# RandomForestClassifier. If so, copy it into the to_keep/ directory.

echo
echo "Preparing data files..."
cd data
rm -rf robs_files
rm -rf __MACOSX
unzip robs_files.zip
cd ..

rm -rf to_keep
mkdir to_keep

echo
echo "Copy good files..."
for file in data/robs_files/*.py; do
    if grep -q 'RandomForestClassifier' $file ; then
        cp $file to_keep/
    fi
done
ls to_keep

# Examples.
# CASE statements.
# Replace the following if then statements with a case statement.
# if grep -q 'sydney' $1; then
#     mv $1 sydney/
# fi
# if grep -q 'melbourne|brisbane' $1; then
#     rm $1
# fi
# if grep -q 'canberra' $1; then
#     m $1 "IMPORTANT_$1"
# fi

# case 'stringvar' in
#   pattern1)
#   command1;;
#   pattern2)
#   command2;;
#   *)
#   default_command;;
# esac
#
# A pattern can be a regex, such as "Air*" or "*hat*".
#
# This is the code where we use case instead of if.
# This code behaves very differently.
# case $(cat $1) in
#     *sydney*) mv $1 sydney/ ;;
#     *melbourne*|*brisbane*) rm $1 ;;
#     *canberra*) mv $1 "IMPORTANT_$!" ;;

# Exercise.
# Build a small Bash script that will be useful to call in many areas of your
# data pipeline. It must take in a single argument (string of a day) into
# ARGV and use a CASE statement to print out whether the argument was a
# weekday or a weekend. You only need to account for the capitalized case for
# now.
#
# You also don't need to worry about words or letters before and after. Just
# use exact matching for this example.
echo
echo "Using case..."
bash day_to_day_type.bash Wednesday
bash day_to_day_type.bash Saturday
bash day_to_day_type.bash today


# Exercise.
# Move model files.
# the unzip utility also creates a __MACOSX directory for some reason.
echo
echo "Preparing data files..."
cd data
rm -rf model_out
rm -rf __MACOSX
unzip model_out.zip
cd ..
echo "Moving model files..."
bash move_models.bash
