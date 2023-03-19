#!/usr/bin/env bash

# Usage:
#  bash get_salaries_for_city.sh Seoul
#
# In this exercise, you are working as a data scientist in the HR department of
# a large IT company. You need to extract salary figures for recent hires;
# however, the HR IT system simply spits out hundreds of files into the folder
# data/hire_data.

# Each file is comma-delimited in the format COUNTRY,CITY,JOBTITLE,SALARY such
# as Estonia,Tallinn,Javascript Developer,118286

# Your job is to create a Bash script to extract the information needed.
# Depending on the task at hand, you may need to go back and extract data for a
# different city. Therefore, your script will need to take in a city (an
# argument) as a variable, filter all the files by this city and output to a
# new CSV with the city name. This file can then form part of your analytics
# work.
echo $1
cat data/hire_data/*.csv | grep "$1" > "$1".csv
