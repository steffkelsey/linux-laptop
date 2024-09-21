#!/bin/bash
# Installs Molecule for docker (which also installs ansible)
# https://molecule.readthedocs.io/en/latest/installation.html

# Grab the distro ID from lsb_release
id=$(lsb_release -si)

# First we setup python 3 because we can only get Molecule from there.
# And may as well get ansible from there as well

if [ "$id" == "Ubuntu" ]; then
  # make sure venv will work
  apt install python3.12-venv

  # Setup using a virtual env
  python3 -m venv venv
  # activate the env
  source venv/bin/activate

  # Install the ansible developer tool (ADT)


else
  echo "Not setup for distro: $id"
  echo "EXITING WITHOUT INSTALLING ANSIBLE"
  exit 1
fi
