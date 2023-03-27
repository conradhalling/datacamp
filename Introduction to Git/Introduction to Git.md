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

#### What is a Version?

- Contents of a file at a given point in time.
- Metadata (information associated with the file)
    - the author of the file
    - where the file is located
    - the file type
    - when the file was last saved

#### What is Version Control?

- Version control is a group of systems and process that
    - manage changes made to documents, programs, and directories
- Version control is useful for anything that
    - changes over time
    - needs to be shared
- Version control tracks files in different states
- Version control allows simultaneous file development (continuous development)
- Version control allows us to combine different versions of files

#### Why is Version Control Important?

Version control can be used to synchronize scripts or analysis pipelines with the data used at that time. The analysis evolves as the data set changes. Version control makes it possible to rerun a particular analysis using the correct code and data.

#### Git and GitHub

Git is:

- a popular version control system for computer programming and data projects
- open source
- scalable

GitHub is:

- a cloud-based Git repository system

#### Benefits of Git

The benefits of Git are:

- Git stores everything, so nothing is lost
- Git notifies us when there is conflicting content in files
- Git can synchronize work done by different people using different computers

#### Using Git

- Git commands are run in the shell
- The shell
    - is a program for executing commands
    - can be used to view or modify files and directories (folders)

#### Useful Shell Commands

- pwd
- ls
- cd
- nano
- echo
- git --version

#### Using the Shell (Exercise)

Use the `ls` command to identify files and directories in the data directory.

```shell
ls data
```

#### Checking the Version of Git.

```shell
git --version
```

### Saving Files

#### The Repository

We'll be working with a project about mental health in tech throughout the course.

Files: `funding.doc`, `report.md`

Directories: `data`, `.git`

These files and directories are stored in a repository (a "repo"), where the metadata about the repository is stored in the `.git` directory. Do not change the files or directories in the `.git` directory.

#### Staging and Committing

Saving a draft of a file to the staging area is like placing a letter in the envelope.

Saving a file and updating the repository by committing changes from the staging area is like sealing the envelope and mailing it.

#### Accessing the .git Directory

```shell
# List all files in the current working directory.
ls -a
# List files and directories in the .git directory.
ls .git
```

#### Git Workflow

1. Modify a file one or more times
2. Repeat step 1 as desired
3. Save the draft to the staging area
4. Repeat steps 1 through 3 as desired
5. Commit the updated file to the repository
6. Repeat steps 1 through 6 as desired

#### Modifying a File

Open the file with the `nano` editor and add three lines. Save the changes with `control+o` and `control+x`.

```shell
# Modify a file.
nano report.md
# Stage the modified file.
git add report.md
# Stage all modified files.
git add .
# Commit the file's changes to the repository.
git commit -m "Updating TODO list in report.md"

# Check the status of the repo.
git status
```

#### Where Does Git Store Information? (Exercise)

The home directory `/home/repl` contains a repository called `mh_survey`, which has a directory called `data`. Where does Git store the information about the history of the files in `/home/repl/mh_survey/data`?

In `/home/repl/mh_survey/.git`.

#### The Git Workflow (Exercise)

Drag the items into the correct buckets:

- Modify
    - `nano filename`
    - `echo "code and/or data" >> filename`
- Draft
    - `git add filename`
    - `git add .`
- Save
    - `git commit -m "Commit message"`

#### Adding a File (Exercise)

You are located in the `mh_survey/data` directory, which contains the file `mental_health_survey.csv`. Add a new row of data to the end of `mental_health_survey.csv`. Place the updated file in the staging area. Commit the modified file.

```shell
nano mental_health_survey.csv
git add mental_health_survey.csv
git commit -m "Adding one new participant's data"
```

#### Adding Multiple Files (Exercise)

You've modified two files, `report.md` and `data/mental_health_survey.css`.

Check which files are in the staging area but not yet committed. Add all files in your current directory and all subdirectories into the staging area. Commit all files in the staging area.

```shell
git status
git add .
git commit -m "Added 3 participants and a new section in report."
```

### Comparing Files

We need a way to compare versions as we're making changes.

```shell
# Start by updating a file and commiting the change.
nano report.md
git add .
git commit -m "Adding tasks for references and summary statistics in report.md"

# Edit the file again.
nano report.md

# Compare the unstaged file to the last committed version.
git diff report.md

# Compare a staged file to the repository version, where -r signifies
# the revision and HEAD is a shortcut for the most recent revision.
git add report.md
git diff -r HEAD report.md

# Compare all staged files to the repository version.
git diff -r HEAD
```

#### What Has Changed? (Exercise)

You have been placed in the `data` directory of the `mh_survey` repository. How many lines have been added to the current version of `mental_health_survey.csv` compared to the version in the latest commit?

```shell
git diff mental_health_survey.csv
```

One line has been added.

#### What's Going to Be Committed? (Exercise)

You have been put in the `mh_survey` repository, where `data/mental_health_survey.csv` has been added to the staging area. Use a command to see how *all* files differ from the last saved revision. Use a Git command to add `report.md` to the staging area. Commit all files.

```shell
git diff -r HEAD .
git add report.md
git commit -m "New participant data and reminder for analysis"
```

#### What's in the Staging Area? (Exercise)

The `report.md` file has been stored in the staging area. What single command can you use to see the changes that have been made to the `report.md` file?

```shell
git diff -r HEAD report.md
```

## Making Changes

I cloned a repository for experimentation. When I was finished, I deleted the directory.

### Storing Data with Git

#### The Commit Structure

Git commits have three parts:

- Commit
    - contains the metadata
    - each commit has a unique identifier, the hash
- Tree
    - tracks the names and locations in the repository
    - the tree points to blobs from various commits, one blob per file
- Blob
    - binary large object for each file in the tree
    - may contain data of any kind
    - compressed snapshot of a file's contents

#### View Commit Information

```shell
# View the log of commits to the repo.
# Press the spacebar to scroll through the logs. Press "q" to quit.
git log
# Show names and statuses of files changed by the commit.
git log --name-status

# Show information about a commit; use the first 6-8 characters of the hash
git show 5620f0e
```

#### The Git Hash

The Git hash is a 40-character string that is the SHA-1 hash — a checksum of the content you’re storing plus a header. See https://git-scm.com/book/en/v2/Git-Internals-Git-Objects.

George states that, "It is called a hash because Git produces it using a pseudo-random number generator called a hash function." I don't think this is correct.

Hashes allow data sharing between repositories. They serve as virtually unique identifiers for a blob. This means git only needs to compare the hashes of two blobs to determine whether the blobs are identical.

#### Finding a Particular Commit

Use `git log` to view the log of commits. Use `git show` to view the details of a single commit, supplying a revision identifier. See `man 7 gitrevisions` for more information about revision identifiers.

    $ git log
    commit 41d14d7db4280073eddfa8c59d9043aad3de8583 (HEAD -> main, origin/main, origin/HEAD)
    Author: Conrad Halling <conrad.halling@icloud.com>
    Date:   Mon Mar 27 07:18:27 2023 -0400

        Introduction to Git.

        Finished notes for Chapter 1.

    $ git show 41d14d7
    commit 41d14d7db4280073eddfa8c59d9043aad3de8583 (HEAD -> main, origin/main, origin/HEAD)
    Author: Conrad Halling <conrad.halling@icloud.com>
    Date:   Mon Mar 27 07:18:27 2023 -0400

        Introduction to Git.

        Finished notes for Chapter 1.

    diff --git a/Introduction to Git/Introduction to Git.md b/Introduction to Git/Introduction to Git.md
    index 73d535b..923e08f 100644
    --- a/Introduction to Git/Introduction to Git.md
    +++ b/Introduction to Git/Introduction to Git.md
    @@ -20,10 +20,57 @@ There are no datasets for this course.

    ### Introduction to Version Control

    +#### What is a Version?
    +
    +- Contents of a file at a given point in time.
    +- Metadata (information associated with the file)
    +    - the author of the file
    +    - where the file is located
    [more output omitted]

#### Interpreting the Commit Structure (Exercise)

What is the commit hash for the last updated version of `report.md`? The commit hash for the latest version of `report.md` is ebe93178.

#### Viewing a Repository's History (Exercise)

Use a command to find the hash of the most recent commit. The command `git log` shows that commit 7f71eade is the most recent, because `git log` returns the commits in reverse chronological order. However, the course erroneously states that 7f71eade is the earliest commit.

#### Viewing a Specific Commit (Exercise)

The second question was: "Use the hash from the second most recent commit to display the difference between report.md in that commit versus the latest version."

It turns out this is not looking for a `git diff` command but a `git show` command.

According to the `git log` output, the second most recent commit of report.md has commit ID e39ecc8, since the log is reported in reverse chronological order. The correct answer, according to the course, was:

```shell
git show 36b761
```

These are the correct commands, not accepted by the course:

```shell
git log report.md
# This answer creates the requested results but was not accepted.
git diff e39ecc8..36by61e report.md
git diff e39ecc8 36b761e report.md
git diff e39ecc8 HEAD report.md
git show e39ecc8
```

**************** I worked to this point. ***************

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
