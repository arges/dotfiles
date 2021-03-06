#!/bin/bash -xe
#
# (C) 2013-2017
# Written by Chris J Arges <christopherarges@gmail.com>
#

USER="arges"
BZR_WHOAMI="Chris J Arges <chris.j.arges@ubuntu.com>"

# gsettings to set
GSETTINGS=(
"org.gnome.desktop.interface gtk-theme \"Radiance\""
"org.gnome.desktop.interface icon-theme \"ubuntu-mono-light\""
"com.canonical.indicator.appmenu.hud store-usage-data false"
"com.canonical.indicator.datetime show-date true"
"com.canonical.indicator.datetime show-day true"
"com.canonical.Unity.Lenses remote-content-search none"
"com.canonical.unity.webapps integration-allowed false"
"com.canonical.unity-greeter play-ready-sound false"
)

GCONF_SETTINGS=(
"--type bool /apps/gnome-terminal/profiles/Default/use_theme_colors false"
"--type bool /apps/gnome-terminal/profiles/Default/default_show_menubar false"
"--type float /schemas/apps/gnome-terminal/profiles/Default/background_darkness 0.9"
"--type string /schemas/apps/gnome-terminal/profiles/Default/background_type transparent"
)

# distribution series / arches
DISTS="trusty xenial"
ARCH="amd64"

# dotfiles repo
DOTFILE_REPO="https://github.com/arges/dotfiles"

# run ansible playbook
sudo ansible-playbook -i "localhost," -c local desktop.yml

# clone dotfiles repo
if [ ! -d ~/.git ]; then
  ( cd ~ && git init && git remote add origin ${DOTFILE_REPO} && git pull && cd - )
fi

# gsettings for unity
for s in  "${GSETTINGS[@]}"; do
  gsettings set $s
done

# gconftool-2 settings
for s in  "${GCONF_SETTINGS[@]}"; do
	gconftool-2 --set $s
done

# setup directories
mkdir -p ~/src
mkdir -p ~/src/projects
mkdir -p ~/src/kernel

# clone relevant kernel trees
cd ~/src/kernel
if [ ! -d ~/src/kernel/linux ]; then
  git clone git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
fi
for d in $DISTS; do
  if [ ! -d ~/src/kernel/ubuntu-$d ]; then
    git clone --reference ./linux https://git.launchpad.net/~ubuntu-kernel/ubuntu/+source/linux/+git/${d} ubuntu-${d}
    cd ubuntu-$d
    git remote add up \
      git+ssh://git.launchpad.net/~arges/ubuntu/+source/linux/+git/${d}
    cd -
  fi
done
cd -

# setup archive tools
if [ ! -d ~/src/projects/ubuntu-archive-tools ]; then
  ( cd ~/src/projects && bzr branch lp:ubuntu-archive-tools && cd - )
fi
