# datacamp

## Introduction

This repository contains my code from DataCamp classes, projects, and
tutorials.

These instructions were tested with:

- macOS 13.2.1
- Homebrew-installed pyenv 2.3.16
- pyenv-installed Python 3.11.2

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

# Install the hdf5 library.
brew install hdf5

# Create a virtual environment.
cd ~/src/conradhalling/datacamp
pyenv local 3.11.2
python -m venv venv --upgrade-deps

# Activate the virtual environment.
source venv/bin/activate

# Install required packages.
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

- [Data Types for Data Science in Python](Data%20Types%20for%20Data%20Science%20in%20Python)
- [Intermediate Python](Intermediate%20Python)
- [Introduction to Bash Scripting](Introduction%20to%20Bash%20Scripting)
- [Introduction to Data Science in Python](Introduction%20to%20Data%20Science%20in%20Python)
- [Introduction to Data Visualization with Matplotlib](Introduction%20to%20Data%20Visualization%20with%20Matplotlib)
- [Introduction to Databases in Python](Introduction%20to%20Databases%20in%20Python)
- [Introduction to Importing Data in Python](Introduction%20to%20Importing%20Data%20in%20Python)
- [Introduction to NumPy](Introduction%20to%20NumPy)
- [Introduction to Python](Introduction%20to%20Python)
- [Object-Oriented Programming in Python](Object-Oriented%20Programming%20in%20Python)
- [Python Data Science Toolbox Part 1](Python%20Data%20Science%20Toolbox%20Part%201)
- [Python Data Science Toolbox Part 2](Python%20Data%20Science%20Toolbox%20Part%202)
- [Statistical Thinking in Python Part 1](Statistical%20Thinking%20in%20Python%20Part%201)
- [Working with Dates and Times in Python](Working%20with%20Dates%20and%20Times%20in%20Python)

### Completed Project

- [Investigating Netflix Movies](Investigating%20Netflix%20Movies)

### Courses in Progress

- [Data Manipulation with Pandas](Data%20Manipulation%20with%20Pandas)
- [Data Processing in Shell](Data%20Processing%20in%20Shell)
- [Exploratory Data Analysis in Python](Exploratory%20Data%20Analysis%20in%20Python)
- [Statistical Thinking in Python Part 2](Statistical%20Thinking%20in%20Python%20Part%202)
- [Writing Functions in Python](Writing%20Functions%20in%20Python)

### Tutorial in Progress

- [Principal Component Analysis in Python](Principal%20Component%20Analysis%20in%20Python)
