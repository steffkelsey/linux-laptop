Ansible Role: awscliv2
=========

[![AWSCLIV2CI](https://github.com/steffkelsey/linux-laptop/actions/workflows/awscliv2-ci.yml/badge.svg?branch=master)](https://github.com/steffkelsey/linux-laptop/actions/workflows/awscliv2-ci.yml)

Installs AWS CLI v2 on Debian.

Requirements
------------

Currently, only tested on Ubuntu 20.04.

Role Variables
--------------

Available variables are listed below, along with default values (see `defaults/main.yml`):

Controls the AWS CLI version to install.

    awscliv2_version: 2.4.14

Controls if AWS CLI should be purged from the system completely before install.

    awscliv2_clean: false

Controls if the role should run a apt cache update. If any other play updates
the cache before this role is run, you can save a little time by keeping this
off. If no play updates the cache, the role will fail. In the molecule tests, we
have to set this to true otherwise the converge step will fail every time.

    awscliv2_apt_cache_update: false

Dependencies
------------

None.

Example Playbook
----------------

    - hosts: all
      roles:
         - awscliv2

License
-------

MIT

Author Information
------------------

Steff Kelsey  
gh: @steffkelsey  
tw: @thecodevik!ng  
