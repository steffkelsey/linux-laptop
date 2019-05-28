# Linux Development Environment

An Ansible playbook to install the things I use the most when doing
software development (constantly changes) 

Currently, I am running Linux via Terminal only either off a Chromebook
with Crostini or in the Windows Subsystem for Linux (WSL) on Windows 10.
Why? Because I abandoned Mac after they ruined the MacBook Pro (damn you
Touchbar) and had been burned a few times too many by Homebrew messing with
my Python3 setup. I also boot right to Linux, but I am an Adobe CS user
and switching OS's during the day is a pain.

## Install

First, install Ansible 

`$ ./install_ansible.sh` 

## Running

`$ sudo ansible-pull -U https://github.com/steffkelsey/linux-laptop.git`
