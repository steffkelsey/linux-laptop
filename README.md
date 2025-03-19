# Linux Development Environment

[![CI](https://github.com/steffkelsey/linux-laptop/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/steffkelsey/linux-laptop/actions/workflows/ci.yml)

An Ansible playbook to install the things I use the most when doing
software development (constantly changes).

Currently, I am running Rocky Linux 9.
Why? Because it is the only distro supported for Davinci Resolve and I want to edit video on this machine as well.

[x] Bash
[x] Custom Git prompt (git-prompt.sh base)
[x] dotfiles (use ansible galaxy role geerlingguy.dotfiles)
[x] docker (use ansible galaxy role geerlingguy.docker)
packages
 - [x] firewalld
 - [x] podman
 - [x] tmux
 - [ ] mise
 - [x] vim
[x] Open port 9418/tcp in firewalld for git protocol (to pull submodules etc) ansible.posix galaxy collection has firewalld commands

Most of the time, use containers to run stuff instead of installing directly
eg: spin up a container for the Go env rather than installing Go


## Setup

First, install Molecule, Ansible and the linters using the handy script.

```bash
./install_dependencies.sh
```

Restart your terminal for the newly installed by pip packages to show in the
path.

Second, install the dependencies for the main playbook and the roles.
```bash
ansible-galaxy install -r requirements.yml
```
in this directory

## Running

To provision all the roles in this repo for the entire linux-laptop, navigate
to the root directory of this repo and run:  
```bash
ansible-playbook main.yml --ask-become-pass
```

## Tests

To test the main playbook, go to the top level directory and run:  
```bash
molecule test
```

## FYI 

I have had problems with the geerlingguy ansible-role-docker on a clean install of Rocky Linux 9 and Ansible  where it required the ini_file module from the community.general collection.  
```bash
ansible-galaxy collection install community.general
```

## Debugging

To debug the playbook, from the project root:  

1. start the dev environment `$ molecule converge`  
2. ssh into the container `$ molecule login`  
3. rerun the playbook `$ molecule converge`  
4. run the linter `$ molecule lint`  
5. run the verify steps `$ molecule verify`  
6. clean up `$ molecule destroy`  
7. testing - see the Tests section above for running the entire cycle which includes creating, verifying, and destroying the environment

