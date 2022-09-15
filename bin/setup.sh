#!/bin/bash -xe

# run ansible playbook
apt update -yqq && apt install ansible
ansible-playbook -i "localhost," -c local desktop.yml

# dotfiles repo
#DOTFILE_REPO="https://github.com/arges/dotfiles"

# clone dotfiles repo
#if [ ! -d ~/.git ]; then
#  ( cd ~ && git init && git remote add origin ${DOTFILE_REPO} && git pull && cd - )
#fi
