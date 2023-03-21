# datacamp

## Introduction

This repository contains my code from DataCamp classes, projects, and
tutorials.

These instructions assume the following:

- you're running macOS 13.2.1
- you have used Homebrew to install pyenv
- you have installed Python 3.11.1 using pyenv

## Setting Up

The requirements.txt file includes all of the packages needed for the
courses included in this repository.

Use these steps to set up:

- clone this repository
- install the hdf5 library
- create a virtual environment and install the required packages

```shell
# Clone this repository.
cd ~/src/conradhalling
git clone https://github.com/conradhalling/datacamp.git

# Install the hdf5 library
brew install hdf5

# Create a virtual environment.
pyenv global 3.11.1
cd ~/src/conradhalling/datacamp
python3 -m venv venv

# Activate the virtual environment.
source venv/bin/activate

# Install required packages.
pip install --upgrade pip setuptools
pip install -r requirements.txt

# Deactivate the virtual environment if desired.
deactivate
```

## Using the Notebooks

### Starting Jupyter Lab

- initialize the virtual environment
- start Jupyter Lab

```shell
cd ~/src/conradhalling/datacamp
source venv/bin/activate
jupyter lab
```

### Saving a Notebook

Before committing Jupyter notebook changes to the git repository, click on
"Edit" > "Clear All Outputs" and save the notebook. This strips output data
from the notebook, making `git diff` results easier to understand.

## Courses and Projects

### Completed Courses

- Data Types for Data Science in Python
- Intermediate Python
- Introduction to Bash Scripting
- Introduction to Data Science in Python
- Introduction to Data Visualization with Matplotlib
- Introduction to Databases in Python
- Introduction to Importing Data in Python
- Introduction to NumPy
- Introductionn to Python
- Object-Oriented Programming in Python
- Python Data Science Toolbox Part 1
- Python Data Science Toolbox Part 2
- Statistical Thinking in Python Part 1
- Working with Dates and Times in Python

### Completed Project

- Investigating Netflix Movies

### Courses in Progress

- Data Manipulation with Pandas
- Data Processing in Shell
- Exploratory Data Analysis in Python
- Statistical Thinking in Python Part 2
- Writing Functions in Python

### Tutorial in Progress

- Principal Component Analysis in Python
