Ansible Role: go_dev
=========

[![GODEV2CI](https://github.com/steffkelsey/linux-laptop/actions/workflows/go-dev-ci.yml/badge.svg?branch=main)](https://github.com/steffkelsey/linux-laptop/actions/workflows/go-dev-ci.yml)

Installs Golang on Debian.

Requirements
------------

Currently, only tested on Ubuntu 20.04

Role Variables
--------------

Available variables are listed below, along with default values (see `defaults/main.yml`):

Controls the Go version to install.

    go_version: 1.20.2

Controls the temporary folder where the role stashes files during install. 

    go_temporary_dir: /tmp

Dependencies
------------

None.

Example Playbook
----------------

    - hosts: all
      roles:
         - go_dev

License
-------

MIT

Author Information
------------------

Steff Kelsey  
gh: @steffkelsey  
tw: @thecodevik!ng  
