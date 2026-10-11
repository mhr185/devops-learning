#Git Basics - Set up & First Push

These notes will describe how I set up Git on my Ubuntu VM

I realised whilst going through my Linux Module, that to keep on top of documenting my progress I would need to learn the basics of Git to set up my repo first

## What I did
 - Check git is installed on my VM
 - Set my identity using git config commands
 - Generated ssh keys
 - Copied ssh pub key to git
 - tested the connection and cloned the repo
 - created simple file structure and pushed my first commit

## Commands I used

 ```bash
git --version # checks git version and if it gives a version number means its installed
git config --global user.name "Hamzah Rashid" # set global name
git config --global user.email "<my email>" # set global email
git config --global init.defaultBranch main # set global default branch
git config --global --list # check all previous config was set
```


```bash
ssh-keygen -t ed25519 -C "<my email>" # create a ssh key pair -  pub and private
cat ~/.ssh/id_ed25519.pub # output the pub key to terminal so i can copy it, pubkey needed only for git
ssh -T git@github.com # after pasting pubkey in github settings, test the connection to git
```

```bash
git clone git@github.com:mhr185/devops-learning.git 
cd devops-learning
git status
git remote -v
```

I used ssh address 'git@github.com' so the ssh key is used for auth

```bash
git status                     # whats changed
git add .                      # stage everything 
git commit -m "message"        # save a snapshot locally
git push                       # upload to GitHub
```

This will be the 'everyday loop'

## Notes
- Git doesn't track empty folders so I added an empty '.gitkeep' file in folders such as 'bandit\'

## Debugging


 `fatal: not in a git directory` when setting my name | I ran `git config` without `--global`, outside a repo | Added `--global` | 

