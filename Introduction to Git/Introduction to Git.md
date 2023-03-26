# Introduction to Git

These are my notes for DataCamp's [Introduction to Git](https://www.datacamp.com/courses/introduction-to-git) course.

This course is presented by George Boorman, Curriculum Manager, DataCamp. Collaborators are Jasmin Ludolf and Izzy Weber.

There is no prerequisite for this course.

This course is part of these tracks:

- Data Engineer
- Data Scientist Professional with Python
- Data Scientist Professional with R
- Python Programmer
- R Programmer

There are no datasets for this course.

## Introduction to Git

### Introduction to Version Control

#### Why is Version Control Important?

Version control can be used to synchronize scripts or analysis pipelines with the data used at that time. The analysis evolves as the data set changes. Version control makes it possible to rerun a particular analysis using the correct code and data.

#### Useful Shell Commands

- pwd
- ls
- cd
- nano
- echo
- git --version

### Saving Files

Save a draft of a file to the staging area. This is like placing a letter in the envelope.

Save a file and update the repository by committing changes from the staging area. This is like sealing the envelope and mailing it.

### Git Workflow

Repeat these steps.

```shell
# Modify a file.
nano filename
# Stage the modified file/all files and directories.
git add filename
git add .
# Commit the file's changes to the repository.
git commit -m "Commit message"

# Check the status of the repo.
git status
```

### Comparing Files

```shell
# Update a file and commit the change.
nano report.md
git add .
git commit -m "Commit message"

# Update the file again.
nano report.md

# Compare the unstaged file to the last committed version.
git diff report.md

# Compare a staged file to the repository version.
git add report.md
git diff -r HEAD report.md

# Compare all staged files to the repository version
git diff -r HEAD
```

## Making Changes

I cloned a repository for experimentation. When I was finished, I deleted the directory.

### Storing Data with Git

```shell
# View the log of commits to the repo.
git log

# Show information about a commit; use the first 6-8 characters of the hash
git show 5620f0e
```

### Viewing Changes

```shell
# Compare all staged files to the most recent commit.
git diff -r HEAD

# Compare all staged files to the second most recent commit.
git diff -r HEAD~1

# Compare all staged files the third most recent commit.
git diff -r HEAD~2

# Use HEAD or HEAD~n with show to view changes for a specific commit.
git show HEAD
git show HEAD~1

# Use the first few characters of a specific commit hash to show changes.
git show abcdef12

# Show changes between two commits. Put the older commit first.
git diff HEAD~3 HEAD
git diff 5620f0e 55dc324

# View changes per document by line.
git annotate README.md
```

### Undoing Changes before Committing

```shell
# Unstage a single file.
git restore --staged summary_statistics.csv

# Unstage all staged files.
git restore --staged

# Undo changes to an unstaged file.
# git checkout -- summary_statistics.csv
git restore summary_statistics.csv

# Undo changes to all unstaged files; run from the base directory.
# git checkout .
git restore .

# Unstage all files and undo all changes.
git reset HEAD
# git checkout .
git restore .
git add .
git commit -m "Restore repo to previous commit."
```

### Restoring and Reverting

```shell
# Customize log output to show a specified number of commits.
git log -3

# Show commits for a given file:
git log -e report.md

# Restrict the log to changes after a particular date:
git log --since "Oct 1 2022"
git log --since 2022-10-01
git log --since 2022-10-01 --until 2022-10-04

# Restore an old version of a file.
git checkout 97b99797d7e3ba605ff9d7e039739a529936a1d8 README.md
git add README.me
git commit -m "Reverse README.md"

# Restore the repository to a previous commit.
git checkout 97b99797d7e3ba605ff9d7e039739a529936a1d8

# Clean a repository by removing untracked files.
# List all untracked files
git clean -n
# Remove untracked files.
git clean -f
```

## Git Workflows

### Configuring Git

Look at the existing configuration:

```shell
git config --list
```

Look at `--global`, `--system`, and `--local` configurations.

`--local` overrides `--system` and `--global`; `--system` overrides `--global`

for `--local`, must be in a repository.

```shell
cd ~/src/datasci
git config --global --list
git config --system --list
git config --local --list

# It is good to set user.name, user.email, and core.editor.
git config --global user.email conrad.halling@icloud.com
git config --global user.name 'Conrad Halling'
git config --global core.editor nano

# Create command aliases. Use the command as:
# git ci
git config --global alias.ci 'commit -m'
git config --global alias.unstage 'reset HEAD'
# Aliases are stored in ~/.gitconfig.
# View aliases with:
git config --global --list

# Ignore files by putting patterns into .gitignore file.
#  *.log
```

#### Exercise:

```shell
git config --global alias.st status
git st
```

### Branches

```shell
# View existing branches
git branch

# Create a new branch named "report" and use it.
get checkout -b report

# Compare branches.
git diff main report
```

#### Exercise.

Do some work and create a new branch.

```shell
nano summary_statistics.txt
git add summary_statistics.txt
git commit -m "Adding age summary statistics"
git checkout -b report

# Compare branches.
git diff alter-report-title summary-statistics

# Switch to a different branch and verify the branch.
git checkout debugging
git branch
```

### Merge branches

Use `git merge source_branch destination_branch`.

#### Exercise

```shell
git checkout report
nano report.md
git add report.md
git commit -m "Add gender summary in report"
git merge report main
```

### Dealing with conflicts.

Git reports a conflict when attempting to merge two branches. Edit the file to identify the location of the conflict and to remove the conflict.

```shell
nano todo.txt
git add todo.txt
git commit -m "Resolving todo.txt conflict"
# This merge reports "Already up to date.".
git merge update main
```

## Collaborating with Git

### Creating Repos

#### Setting Up a New Rep (Exercise)

#### Converting an Existing Project (Exercise)

### Working with Remotes

#### Cloning a Repo (Exercsie)

#### Defining and Identifying Remotes

### Gathering from a Remote

#### Fetching from a Remote (Exercise)

#### Pulling from a Remote (Exercise)

### Pushing to a Remote

#### Pushing to a Remote Repo (Exercise)

#### Handling Conflicts (Exercise)

### Congratulations!

## Not Included in the Course

Show the names and status of changed files. This is useful for my personal log files.

```shell
git log --name-status
```
