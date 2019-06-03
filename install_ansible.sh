#!/bin/bash
# Installs Ansible
# https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#latest-releases-via-apt-debian

# Grab the distro ID from lsb_release
id=$(lsb_release -si)

if [ "$id" == "Ubuntu" ]; then
  # ubuntu setup
  sudo apt install software-properties-common
  sudo apt-add-repository --yes --update ppa:ansible/ansible
elif [ "$id" == "Debian" ]; then
  # debian setup
  sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367
else
  echo "Not setup for distro: $id"
  echo "EXITING WITHOUT INSTALLING ANSIBLE"
  exit 1
fi

# update the new repos and install
sudo apt update

# install git first (is a dependency for `ansible-pull)
sudo apt install git
sudo apt install ansible

