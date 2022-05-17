# Git Branch

Ideally all work should be done on branches and only merged back when definately working. By convention no work should be done on the main branch - this should remain fully working at all times. 

### How to add a branch

```
git branch mybranch     
```

### Switch to the branch

```
git checkout mybranch
```

### Switch back to main

```
git checkout main
```

### List local branches

```
git branch
```

### List all branches

Using the -a flag means that you will see all the branches, even the ones that are not on you local workspace.

```
git branch -a
```

### Pushing a branch

```
git push origin mybranch
```

### Merging a branch

However we probably need to do this on Github as we are wanting to create pull requests and check the work first

```
git checkout main   (first switch to the main branch)
git merge mybranch    (merge all changes from mybranch into the main branch)
gid add <file>        (fix and add any conflicts)
git commit -m 'merged changes'
```

### Deleting a Branch

```
git branch -d mybranch
```

### Deleting a Remote Branch

```
git push origin :mybranch
```

### How to remove a remote origin

```
git branch -d -r origin/name_of_origin_to_remove
```

`-d` means delete a branch
`-r` means remotes

### Documentation

https://git-scm.com/docs/git-branch

