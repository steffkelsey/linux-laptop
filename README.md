# Linux Development Environment

An Ansible playbook to install the things I use the most when doing
software development (constantly changes) 

Currently, I am running Linux via Terminal only either off a Chromebook
with Crostini or in the Windows Subsystem for Linux (WSL) on Windows 10.
Why? Because I abandoned Mac after they ruined the MacBook Pro (damn you
Touchbar) and had been burned a few times too many by Homebrew messing with
my Python3 setup. I also was booting right to Linux, but I am an Adobe CS user
and switching OS's during the day was a pain, so I'm living in the subsystem
world for right now.

## Install

First, install Ansible 

`$ ./install_ansible.sh` 

Second, create a read-only PAT in GitHub. Then, put the PAT in an env var 

`$ export OAUTH_TOKEN=1234`

This step exists because the user has 2FA on (just like everyone should)

## Running

`$ sudo ansible-pull -U https://$OAUTH_TOKEN:x-oauth-basic@github.com/steffkelsey/linux-laptop.git`

### One off

`$ ansible-playbook --sudo-ask-pass local.yml`

## References
Found some great stuff here on getting docker to work with WSL: 
https://nickjanetakis.com/blog/setting-up-docker-for-windows-and-wsl-to-work-flawlessly

