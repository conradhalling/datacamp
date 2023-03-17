# datacamp

## Introduction

This repository contains my code from DataCamp tutorials. These instructions assume
Python 3.11.1 was installed using pyenv.

## Setting Up

- clone the repository
- create a virtual environment and install the required packages
- initialize the virtual environment
- start Jupyter Lab

```shell
# Clone the repository.
cd ~/src
git clone https://github.com/conradhalling/datacamp.git

# Create a virtual environment.
pyenv global 3.11.1
cd datacamp
python3 -m venv venv

# Activate the virtual environment.
source venv/bin/activate

# Install required packages.
pip3 install -U -r requirements.txt
```

## Using the Notebooks

- initialize the virtual environment
- start Jupyter lab

```shell
cd ~/src/datacamp
source venv/bin/activate
python3 -Xfrozen_modules=off -m jupyterlab
```

## Saving a Notebook

Before committing notebook changes to the git repository, in the Jupyter Lab
window, click on Edit > Clear All Outputs.

## Courses

- Introduction to Databases in Python

