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

## Resources

- DataCamp provides another Git tutorial at https://github.com/datacamp/courses-introduction-to-version-control-with-git
- DataCamp's comprehensive web page for using git, including a Git cheat-sheet: https://www.datacamp.com/cheat-sheet/git-cheat-sheet
- _Pro Git_ online book: https://git-scm.com/book/en/v2
- GitHub Docs: https://docs.github.com/en
- Learn Git with Bitbucket Cloud: https://www.atlassian.com/git/tutorials/learn-git-with-bitbucket-cloud

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

# Show information about a commit; use the first 6-8 characters of the hash.
# The diff shows the differences from the previous commit.
git show 5620f0e
```

#### The Git Hash

The Git hash is a 40-character string that is the SHA-1 hash — a checksum of the content you’re storing plus a header. See https://git-scm.com/book/en/v2/Git-Internals-Git-Objects.

George states that, "It is called a hash because Git produces it using a pseudo-random number generator called a hash function." I don't think this is correct.

Hashes allow data sharing between repositories. They serve as virtually unique identifiers for a blob. This means git only needs to compare the hashes of two blobs to determine whether the blobs are identical.

#### Finding a Particular Commit

Use `git log` to view the log of commits.

    $ git log
    commit 41d14d7db4280073eddfa8c59d9043aad3de8583 (HEAD -> main, origin/main, origin/HEAD)
    Author: Conrad Halling <conrad.halling@icloud.com>
    Date:   Mon Mar 27 07:18:27 2023 -0400

        Introduction to Git.

        Finished notes for Chapter 1.

#### Showing a Particular Commit

Use `git show` to view the details of a single commit, supplying a revision identifier. See `man 7 gitrevisions` for more information about revision identifiers.

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

#### Viewing Changes (Extra)

These are my additonal notes, working with one of my own repositories, for showing differences between various commits.

```shell
# Show the diff between the commit and the current HEAD.
git diff HEAD~1 README.md
git diff HEAD~2 README.md
git diff 23e583a
git diff 4fae206

# Get the commit history for a single file.
git log --name-status README.md

# Show the diff between one commit and another.
# Relative to the current HEAD. The relative indexes change with each commit.
git diff HEAD~6 HEAD~3 README.md
# Using absolute commit hashes.
git diff 4fae206 23e583a README.md

# Show the commit details for a given commit. The diff is from the
# previous commit.
git show HEAD~1
git show HEAD~4 README.md
git show 4fae206 README.md
```

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

The `git show` command displays the differences between the commit and the previous commit for the given file.

These were the correct commands, not accepted by the course:

```shell
git log report.md
# This answer creates the requested results but was not accepted.
git diff e39ecc8..36by61e report.md
git diff e39ecc8 36b761e report.md
git diff e39ecc8 HEAD report.md
git show e39ecc8
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

#### Why Make a Repo?

The benefits of repositories are:

- you can systematically track versions
- you can collaborate with colleagues
- you can store everything

#### Creating a New Repo

Create a new (local) repository using the `git init` command.

```shell
git init mental-health-workspace
cd mental-health-workspace
git status
```

#### Converting a Project

If you have already started your project, `cd` into your directory and use the `git init` command. The `git status` command will recognize that there are uncommitted files in the new git respository.

```shell
cd mh_survey
git init
git status
git add .
git commit -m "Initial commit"
```

#### Avoid Nested Repositories

Do not create a Git repository inside another Git repository. If you do this, there will be two `.git` directories in different locations, and Git will get confused about which `.git` directory to update.

#### Setting Up a New Repo (Exercise)

Create a new Git repo named `anxiety_workplace` in the current directory (`projects`) and add a to-do list.

```shell
git init anxiety_workplace
cd anxiety_workplace
nano todo.txt
git status
```

#### Converting an Existing Project (Exercise)

You're in the `mh_survey` directory. Create a Git repository in the directory.

```shell
git init
git status
```

### Working with Remotes

A fundamental feature for collaboration is remote repositories, also known as "remotes". So far, we have worked only with local repositories. A remote repository is a repository stored in the cloud by an online repository service, such as github.com.

These are the benefits of remote repositories:

- Everything is backed up in the cloud
- People can collaborate regardless of location

#### Cloning Locally

We can clone a local repository. To do this, we use the `git clone` command followed by the path to the project directory.

```shell
# Clone a local repository. This creates a directory named repo
# in your current working directory.
git clone /home/john/repo
# Clone a local repository but into a directory with the specified name.
git clone /home/john/repo new_repo.
```

#### Cloning a Remote Repository

Remote repositories are stored in an online hosting service (e.g., GitHub, Bitbucket, or Gitlab).

If we have a GitHub account, we can clone a remote repository to our local computer. This requires a GitHub URL, which can be obtained from the GitHub webpage for the remote repository. The repository in this example does not exist, but there are 184 other repositories for https://github.com/datacamp.

```shell
git clone https://github.com/datacamp/project.git
```

#### Identifying a Remote

When cloning a remote repository, Git remembers where the original remote repository was. Git stores a remote tag in the new repository's configuration.

```shell
git remote
git remote -v
```

#### Creating a Remote

When cloning, Git will automatically name the remote `origin`.

Add a remote to a repository using this example:

```shell
git remote add george https://github.com/george_datacamp/repo
```

Defining remote names is useful for merging branches.

#### Cloning a Repo (Exercise)

Clone a repository from `/home/john/repo` into your current directory, `projects`, naming the cloned repository `john_anxiety_project`.

```shell
git clone /home/john/repo john_anxiety_project
```

#### Defining and Identifying Remotes

You are in the directory `projects`, which contains `john_anxiety_project`. Name the repository as `john` to serve as a shortcut when working between branches going forward.

```shell
git remote add john /home/john/repo
git remote -v
```

I didn't think this was a good example because directory `projects` contained a Git repository with no remote repository at the beginning of the exercise, and `projects/john_anxiety_project` also contained a Git repository.

For managing remote repositories, see https://git-scm.com/book/en/v2/Git-Basics-Working-with-Remotes.

### Gathering from a Remote

Collaborators pull data from a remote repository into a local repository, work in their local repositories, and later synchronize their local repositories with the remote repository. This means the remote repository is the source of truth for the collaborators.

#### Remove vs. Local

Say we have been working in a branch of our local repo, but others have been working in the remote. It is clear that there are additional files and subdirectories in the remote. The unspoken assumption in this scenario is that the local repository was cloned from the remote repository and time has passed since then, so that new files have been added to the remote repository that are not in the local repository.

#### Fetching from a Remote

Fetch data from branch `main` of the remote repository.

```shell
git fetch origin main
```

#### Synchronizing Content

Synchronize the data from the remote repository with your local repository.

```shell
git merge origin main
```

#### Pulling from a Remote

The workflow of `fetch` and `merge` is common; these are combined into the `pull` command.

```shell
git pull origin main
```

#### Pulling with Unsaved Local Changes

Git will not allow you to `pull` or `merge` if that will overwrite unsaved changes in your local repository. You must commit your local changes first.

#### Fetching from a Remote (Exercise)

The instructions for step 1 are: Run a command to find out the name(s) of remote repos linked to your project.

The instructions for step 2 are: Gather contents from the remote `origin` repo into your local `main` branch. When you execute the `git fetch origin main` command, this is *not* what actually happens. The contents of the remote `origin` repo are fetched, but they are not fetched into your local `main` branch; that requires a `merge` command.

The instructions for step 3 are: Compare the remote repo with your local `main` branch.

```shell
git remote
git fetch origin main
git diff origin main
```

#### Pulling from a Remote (Exercise)

Fetching is useful, but if you want to bring your local repo's main branch in line with a remote repo, origin, this is possible with a single command!

In this exercise, you'll work on a file while synchronizing between local and remote repos.

    $ git pull origin mainremote: Counting objects: 3, done.
    remote: Compressing objects: 100% (2/2), done.remote: Total 3 (delta 0), reused 0 (delta 0)
    Unpacking objects: 100% (3/3), done.
    From /home/john/repo
    * branch            main       -> FETCH_HEAD
    ebcea98..3b84962  main       -> origin/main
    Updating ebcea98..3b84962
    Fast-forward
    protocol.md | 2 ++
    1 file changed, 2 insertions(+)
    create mode 100644 protocol.md
    $ nano protocol.md
    $ git add protocol.md
    $ git commit -m "Updating eligibility criteria"
    [main bb8a0dc] Updating eligibility criteria
    1 file changed, 1 insertion(+)
    $

The course provided this comment when the exercise was complete:

> Perfect pulling! Notice you received the output 1 file changed, 1 insertion(+), highlighting that the remote was ahead of your local repo!

That was inaccurate. This message indicated the changes that were made to the local repository, which is now one commit ahead of the remote repository. A `git push` command will synchronize the change in the local repository to the remote repository.

I am frustrated by the inaccuracies in this course.

In summary, the commands were:

```shell
git pull origin main
nano protocol.md
git add protocol.md
git commit -m "Updating eligibility criteria"
```

### Pushing to a Remote

#### git push

Use the `git push` command to synchronize the remote repository with the changes we have made in the local repository.

```shell
git push origin main
```

#### Push/Pull Workflow

- pull changes from the remote repo into the local repo
- make and commit changes in the local repo
- push changes from the local repo to the remote repo

#### Remote/Local Conflicts

Git protects us by making sure we have pulled changes from the remote repository before we push local changes to the remote repository.

#### Resolving a Conflict

When Git must make a merge using the "recursive" strategy, Git requires a commit message for the merge. The course call this "resolving a conflict", but it's not resolving a conflict the way I think of it.

#### Pushing to a Remote Repo (Exercise)

>You've noticed that the budget tracker has some errors, so you decide this needs to be added to the issue_log.txt file, along with adding an action to report.md. You want to push the updated files to John's remote repo called origin so he is aware of the issue and the next steps.

    $ git add issue_log.txt report.md

    $ git commit -m "Budget inaccuracy added to the issue log and report"
    [main 9ca6454] Budget inaccuracy added to the issue log and report
     2 files changed, 4 insertions(+)
     create mode 100644 issue_log.txt

    $ git push origin main
    Counting objects: 4, done.
    Delta compression using up to 8 threads.
    Compressing objects: 100% (4/4), done.
    Writing objects: 100% (4/4), 527 bytes | 527.00 KiB/s, done.Total 4 (delta 1), reused 0 (delta 0)
    To /home/john/repo
        3b84962..9ca6454  main -> main

#### Handling Conflicts (Exercise)

>Remote repos enable collaboration in Git, but it is important to regularly synchronize your local repo. In this exercise, you'll see what happens when they aren't aligned, and how to deal with this scenario.

Step 2 required entering a commit message; I used the default message.

    $ git push origin main
    To /home/john/repo
     ! [rejected]        main -> main (fetch first)
    error: failed to push some refs to '/home/john/repo'
    hint: Updates were rejected because the remote contains work that you do
    hint: not have locally. This is usually caused by another repository pushing
    hint: to the same ref. You may want to first integrate the remote changes
    hint: (e.g., 'git pull ...') before pushing again.
    hint: See the 'Note about fast-forwards' in 'git push --help' for details.

    $ git pull origin main
    remote: Counting objects: 3, done.
    remote: Compressing objects: 100% (3/3), done.
    remote: Total 3 (delta 0), reused 0 (delta 0)
    Unpacking objects: 100% (3/3), done.
    From /home/john/repo
     * branch            main       -> FETCH_HEAD
       ebcea98..e8f3386  main       -> origin/main
    Merge made by the 'recursive' strategy.
     proposal.md | 2 ++
     1 file changed, 2 insertions(+)
     create mode 100644 proposal.md

    $ git push origin main
    Counting objects: 5, done.
    Delta compression using up to 8 threads.
    Compressing objects: 100% (4/4), done.
    Writing objects: 100% (5/5), 597 bytes | 597.00 KiB/s, done.
    Total 5 (delta 1), reused 0 (delta 0)
    To /home/john/repo
    e8f3386..5c41bfb  main -> main

### Congratulations!

Git cheat sheet: https://www.datacamp.com/cheat-sheet/git-cheat-sheet
