#!/usr/bin/env bash
set -euo pipefail

# USAGE
#   bash chapter_2.bash
#
# Example.
# Assigning variables.
echo "Assigning variables"
firstname='Cynthia'
lastname='Liu'
echo "Hi there" $firstname $lastname
# This doesn't print the values of the variables.
echo "Hi there" firstname lastname

# Strings in single quotes are used literally.
# Strings in double quotes are processed for $ and backticks.
# Backticks create a subshell or a shell within a shell.
# Example.
# Different variable creation.
echo
echo "Variable creation"
now_var='NOW'
now_var_singlequote='$now_var'
echo $now_var_singlequote
now_var_doublequote="$now_var"
echo $now_var_doublequote

# Example
# Use of the date program.
# See https://mywiki.wooledge.org/BashFAQ/082
echo
echo "The date program"
rightnow_doublequote="The date is `date`."
echo $rightnow_doublequote
rightnow_parentheses="The date is $(date)."
echo $rightnow_parentheses

# Exercise
# Using variables in bash.
echo
yourname="Sam"
echo "Hi there $yourname, welcome to the website!"

# Exercise
# Shell within a shell.
echo
echo "Right now it is `date`"
# A more conventional way:
echo "Right now it is $(date)"

# Example
# Numerical variables in bash.
echo
expr 1 + 4
echo $(expr 1 + 4)
echo "5 + 7.5" | bc
# Show 3 places after the decimal point.
echo "scale=3; 10 / 3" | bc
# Numbers in bash scripts.
echo
dog_name='Roger'
dog_age=6
echo "My dog's name is $dog_name and he is $dog_age years old"
# Double bracket notation. These are equivalent.
# Double bracket notation is used in modern scripts.
echo
expr 5 + 7
echo $((5 + 7))
# Shell within a shell revisited.
# $() creates a subshell.
# More use of bc.
echo
model1=87.65
model2=89.20
echo "The total score is $(echo "$model1 + $model2" | bc)"
echo "The average score is $(echo "($model1 + $model2) / 2" | bc)"
echo "The average score is $(echo "scale=2; ($model1 + $model2) / 2" | bc)"

# Exercise.
# Convert Farhrenheit to Celsius.
echo
echo "Convert temperature from F to C"
bash convert_temp.bash 108

# Exercise.
# Process files in temps.
echo
echo "Process temperature files"
bash process_temps.bash

# Example
# Indexed arrays.
# Supplemented with examples from http://ostechnix.com/bash-indexed-array/.
echo
echo "Indexed arrays"

# Declare an array variable without adding elements.
declare -a my_first_array
my_first_array=(one 2 three 4 "five six")

# Or create an array variable by initializing it.
my_second_array=(1 2 3)

# Get the length of an array.
echo ${#my_second_array[@]} # Returns 3
echo ${#my_second_array}    # Returns 1
echo ${my_second_array[1]}  # Returns 2

# Manipulate array elements.
echo
sample_array=(15 20 300 42 23 2 4 33 54 67 66)
echo ${sample_array[0]}
sample_array[0]=999
echo ${sample_array[0]}

# Slicing
# array[@]:N:M -- N is starting index, M is the number of
# elements to return.
echo
echo ${sample_array[@]:3:2} # Returns 42 23

# Appending
echo
sample_array+=(10 22)
echo ${sample_array[@]}

# Create an empty array.
empty_array=()

# Create an array by intializing individual elements.
cities[0]="Somerville"
cities[1]="Cambridge"

# View elements of an array.
echo
echo ${my_first_array[*]}
echo "${my_first_array[*]}"
echo ${my_first_array[@]}
echo "${my_first_array[@]}"
echo
echo "Iterate through arrays"

# Show the difference between * and @.
# Note what happens when quoting is added.
for item in ${my_first_array[*]}; do
    echo $item
done
echo
for item in ${my_first_array[@]}; do
    echo $item
done
echo
for item in "${my_first_array[@]}"; do
    echo $item
done
echo
for item in "${my_first_array[*]}"; do
    echo $item
done

# Associative arrays.
# Key-value pairs with strings as keys.
# Declare the array and then add elements.
echo
echo "Create an associative array"
declare -A city_details
city_details=([city_name]="New York" [population]=14000000)
echo ${city_details[city_name]}
echo ${city_details[population]}

# Can combine the declaration and initialization onto a single line.
echo
declare -A city_details=([city_name]="New York" [population]=14000000)

# Get the keys.
echo keys are: ${!city_details[@]}  # return all keys
echo values are: ${city_details[@]}   # return all values
for key in ${!city_details[@]}; do
    echo ${key}: ${city_details[$key]}
done

# Exercise.
# Creating indexed arrays.
echo
capital_cities=("Sydney" "Albany" "Paris")

# Alternative method.
unset capital_cities
declare -a capital_cities
capital_cities+=("Sydney")
capital_cities+=("Albany")
capital_cities+=("Paris")
echo ${capital_cities[@]}
echo ${#capital_cities[@]}

# Exercise.
# Creating associate arrays.
echo
declare -A model_metrics
model_metrics[model_accuracy]=98
model_metrics[model_name]="knn"
model_metrics[model_f1]=0.82
echo ${model_metrics[@]}

# Create an associate array on a single line.
declare -A model_metrics=([model_accuracy]=98 [model_name]="knn" \
[model_f1]=0.82)
echo ${model_metrics[@]}

# Print the keys.
echo ${!model_metrics[@]}

# Exercise.
# Perform climate calculations in bash.
temp_b="$(cat data/temps/region_B)"
temp_c="$(cat data/temps/region_C)"
region_temps=($temp_b $temp_c)
average_temp=$(echo "scale=2; (${region_temps[0]} + ${region_temps[1]}) / 2" | bc)
region_temps+=($average_temp)
echo ${region_temps[@]}
