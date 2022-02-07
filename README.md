# Linux Development Environment

[![CI](https://github.com/steffkelsey/linux-laptop/actions/workflows/ci.yml/badge.svg?branch=master)](https://github.com/steffkelsey/linux-laptop/actions/workflows/ci.yml)
[![AWSCLIV2CI](https://github.com/steffkelsey/linux-laptop/actions/workflows/awscliv2-ci.yml/badge.svg?branch=master)](https://github.com/steffkelsey/linux-laptop/actions/workflows/awscliv2-ci.yml)
[![GODEV2CI](https://github.com/steffkelsey/linux-laptop/actions/workflows/go-dev-ci.yml/badge.svg?branch=master)](https://github.com/steffkelsey/linux-laptop/actions/workflows/go-dev-ci.yml)

An Ansible playbook to install the things I use the most when doing
software development (constantly changes).

Currently, I am running Ubuntu 20.04 either as the primary OS or
in the Windows Subsystem for Linux (WSL2) on Windows 11.
Why? Because I abandoned Mac after they ruined the MacBook Pro (damn you
Touchbar) and had been burned a few times too many by Homebrew messing with
my Python3 setup. Why WSL2 - I am an Adobe CS user and switching OS's during the
day was a pain, so I'm living in the subsystem world for right now when working
on my own projects. SRE work at ezCater is all Linux all day - no need for photoshop.

## Setup

First, install Molecule, Ansible and the linters using the handy script.

`$ ./install_dependencies.sh` 

Second, install the dependencies for the main playbook and the roles.
2. `$ ansible-galaxy install -r requirements.yml` in this directory  

## Running

To provision all the roles in this repo for the entire linux-laptop, navigate
to the root directory of this repo and run:  
`$ ansible-playbook main.yml --extra-vars=asdf_user=$(whoami) --ask-become-pass`

The `asdf_user` variable is required for asdf to work since it operates out of
the home directory.

## Creating Roles

To create a new role:  

1. navigate to the roles directory `$ cd roles`  
2. use molecule to init a new role `$ molecule init role <role_name> --driver-name docker`

Now, you have a new folder inside the roles directory using your role name and all the
associated sub-folders.

## Tests

To test the main playbook, go to the top level directory and run:  
`$ molecule test`  

Each role has tests that are run via Github Actions (check the .github/workflows folder).
To run the tests locally, go to each role and run:  
`$ molecule test`  

## Debugging

To debug a role, go to the desired role within the roles folder:

1. start the dev environment `$ molecule converge`
2. ssh into the container `$ molecule login`
3. rerun the playbook `$ molecule converge`
4. run the linter `$ molecule lint`
5. run the verify steps `$ molecule verify`
6. clean up `$ molecule destroy`
7. testing - see the Tests section above for running the entire cycle which includes creating, verifying, and destroying the environment

## TODO
- [ ] Vagrant
- [ ] Virtualbox
