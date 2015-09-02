MARK'S WORKFLOW FOR A HEAVY REVISION THAT REWRITES THE SOLUTION:

if lab is not on local machine:

`git clone URL`

if lab is already on local machine:

`git co master`  
`git pull`  
`git log`

to get the latest commits on master, then update solution with changes to master:

`git co solution`  
`git merge master`  
`git log` // verify commits were brought over

if cocoapods need updating, do this on `solution` now, and push to the remote. This will keep cocoapods out of the PR diff.

while on `solution`, make a new `wip-revision` branch

`git co -b wip-revision`  
`git log` // verify commit history

make changes on the `wip-revision` branch, when finished, push to the remote and open a PR onto `solution` to get line notes from a reviewer.

Make edits on the `wip-revision` branch until review notes are resolved. push to the remote and merge the pull request to `solution` on Github.

DO NOT DELETE THE LOCAL `wip-revision` BRANCH YET

Locally,

`git co solution`  
`git pull`  
`git log` // verify the revision commits transferred from the remote

`git co master`  
`git merge solution`  
`git log` // verify the revision commits transferred from solution  
DO NOT PUSH

suppress the solution on the master branch with a new commit:

`git commit -am "remove solution"`

then, merge the new commit into solution

`git co solution`  
`git merge master`  
`git log` // verify that `remove solution` commit transferred to solution

now, replace the solution by copying relevant files from the `wip-revision` branch:

`git checkout wip-revision -- <filename> <filename> <filename>`
For Xcode, remember to copy over the `project.pbxproj` file. Look at the file paths from the `remove solution` commit to reverse the deletions.

While on `solution`, make a NEW commit that replaces the solution:

`git commit -am "replace solution"`

Open the project and verify that the solution branchs still builds and passes the tests.

Now delete the `wip-revision` branch:

`git branch -d wip-revision`

and push `master` and `solution` to the remote:

`git push --all`

Verify that the changes are on the remote and delete the remote `wip-revision` branch.

Look at the Network Graph, the `solution` branch should be one commit ahead of the `master` branch




Joe's bash history:

```
[12:32:05] tmp
// ♥ mkdir test
[12:32:07] tmp
// ♥ cd test
[12:32:10] test
// ♥ vim file
[12:32:18] test
// ♥ git add .
Change the skeleton code in solution
fatal: Not a git repository (or any of the parent directories): .git
[12:32:21] test
Here are my tests from solution
// ♥ git init
Initialized empty Git repository in /private/tmp/test/.git/
[12:32:23] test
// ♥ git add .
[12:32:25] test
// ♥ git commit -m "init master"
[master (root-commit) 98a1eb4] init master
 1 file changed, 1 insertion(+)
 create mode 100644 file
[12:32:28] (master) test
// ♥ git checkout -b solution
Switched to a new branch 'solution'
[12:32:34] (solution) test
// ♥ ls
file
[12:32:34] (solution) test
// ♥ vim file
[12:32:55] (solution) test
// ♥ vim file_spec
[12:33:05] (solution) test
// ♥ git add .
[12:33:07] (solution) test
// ♥ git commit -m "Adding in solution and tests"
[solution cd70369] Adding in solution and tests
 2 files changed, 4 insertions(+), 1 deletion(-)
 create mode 100644 file_spec
[12:33:13] (solution) test
// ♥ git status
On branch solution
nothing to commit, working directory clean
[12:33:14] (solution) test
// ♥ git log
cd70369 Adding in solution and tests (markedwardmurray, 6 seconds ago)
Change the skeleton code in solution
98a1eb4 init master (markedwardmurray, 51 seconds ago)
[12:33:19] (solution) test
Here are my tests from solution
// ♥ git checkout master
Switched to branch 'master'
[12:33:24] (master) test
// ♥ ls
file
[12:33:25] (master) test
// ♥ git log
98a1eb4 init master (markedwardmurray, 59 seconds ago)
[12:33:27] (master) test
// ♥ git checkout solution -- file_spec
[12:34:06] (master) test
// ♥ ls
file		file_spec
[12:34:07] (master) test
// ♥ git checkout solution -- file
[12:34:16] (master) test
// ♥ vim file
[12:34:22] (master) test
// ♥ vim file_spec
[12:34:27] (master) test
// ♥ git commit -m "Adding in new skeleteon and tests"
[master eb4a14d] Adding in new skeleteon and tests
 2 files changed, 4 insertions(+), 1 deletion(-)
 create mode 100644 file_spec
[12:34:34] (master) test
// ♥ git status
On branch master
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

	modified:   file

no changes added to commit (use "git add" and/or "git commit -a")
[12:34:36] (master) test
// ♥ git add .
[12:34:46] (master) test
// ♥ git commit -m "fixing skeleton"
[master 80bcb24] fixing skeleton
 1 file changed, 1 deletion(-)
[12:34:52] (master) test
// ♥ git status
On branch master
nothing to commit, working directory clean
[12:34:53] (master) test
// ♥ git lgo
git: 'lgo' is not a git command. See 'git --help'.

Did you mean this?
	log
[12:34:56] (master) test
// ♥ git log
80bcb24 fixing skeleton (markedwardmurray, 5 seconds ago)
eb4a14d Adding in new skeleteon and tests (markedwardmurray, 23 seconds ago)
98a1eb4 init master (markedwardmurray, 2 minutes ago)
[12:34:57] (master) test
// ♥ git checkout solution
Switched to branch 'solution'
[12:35:05] (solution) test
// ♥ git log
cd70369 Adding in solution and tests (markedwardmurray, 2 minutes ago)
98a1eb4 init master (markedwardmurray, 3 minutes ago)
Change the skeleton code in solution
[12:35:07] (solution) test
// ♥ git merge master
Auto-merging file
CONFLICT (content): Merge conflict in file
Automatic merge failed; fix conflicts and then commit the result.
[12:35:24] (solution) test
// ♥ git status
On branch solution
You have unmerged paths.
  (fix conflicts and run "git commit")

Unmerged paths:
  (use "git add <file>..." to mark resolution)

	both modified:   file

no changes added to commit (use "git add" and/or "git commit -a")
[12:35:29] (solution) test
// ♥ vim file
[12:35:46] (solution) test
// ♥ git add .
[12:35:47] (solution) test
// ♥ git commit
[solution e9463eb] Merge branch 'master' into solution
[12:35:52] (solution) test
// ♥ git log
e9463eb Merge branch 'master' into solution (markedwardmurray, 6 seconds ago)
80bcb24 fixing skeleton (markedwardmurray, 63 seconds ago)
eb4a14d Adding in new skeleteon and tests (markedwardmurray, 81 seconds ago)
cd70369 Adding in solution and tests (markedwardmurray, 3 minutes ago)
98a1eb4 init master (markedwardmurray, 3 minutes ago)
[12:35:55] (solution) test
// ♥ git merge master
Already up-to-date.
[12:36:09] (solution) test
// ♥ git co master
Switched to branch 'master'
[12:36:14] (master) test
// ♥ ls
file		file_spec
[12:36:15] (master) test
// ♥ subl file
[12:36:20] (master) test
// ♥ gst
On branch master
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

	modified:   file

no changes added to commit (use "git add" and/or "git commit -a")
[12:36:31] (master) test
// ♥ gcam "update readme"
[master ca429f2] update readme
 1 file changed, 1 insertion(+), 1 deletion(-)
[12:36:37] (master) test
// ♥ git log
ca429f2 update readme (markedwardmurray, 3 seconds ago)
80bcb24 fixing skeleton (markedwardmurray, 2 minutes ago)
eb4a14d Adding in new skeleteon and tests (markedwardmurray, 2 minutes ago)
98a1eb4 init master (markedwardmurray, 4 minutes ago)
[12:36:40] (master) test
// ♥ git status
On branch master
nothing to commit, working directory clean
[12:36:45] (master) test
// ♥ git co solution
Switched to branch 'solution'
[12:36:49] (solution) test
// ♥ git merge master
Auto-merging file
Merge made by the 'recursive' strategy.
 file | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
[12:36:52] (solution) test
// ♥ git log
cae98b0 Merge branch 'master' into solution (markedwardmurray, 2 seconds ago)
ca429f2 update readme (markedwardmurray, 17 seconds ago)
e9463eb Merge branch 'master' into solution (markedwardmurray, 65 seconds ago)
80bcb24 fixing skeleton (markedwardmurray, 2 minutes ago)
eb4a14d Adding in new skeleteon and tests (markedwardmurray, 2 minutes ago)
cd70369 Adding in solution and tests (markedwardmurray, 4 minutes ago)
98a1eb4 init master (markedwardmurray, 4 minutes ago)
[12:36:54] (solution) test
// ♥
```

**Will this be ergonomic when working with config files changed by interface builder?**