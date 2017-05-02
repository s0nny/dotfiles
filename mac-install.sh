#!/bin/bash
# ------------------------------------------------
# Script to install additional stuffs on a clean Mac.
# ------------------------------------------------

DOTFILES_DIR="$HOME/.files"

# Source functions for all the common cross platform stuff. Alternatively we can
# split those into a common file, but since this script won't be called as
# often, we'll just keep linux-install the main script and source it.
source "$DOTFILES_DIR/linux-install.sh"

common_bin_exists 'brew' && brew update

function group_cli_install() {
  brew_install
  brew install \
      autoconf \
      automake \
      binutils \
      cmake \
      coreutils \
      ctags \
      curl \
      diff-so-fancy \
      git \
      perl \
      python \
      reattach-to-user-namespace \
      ruby \
      tmux \
      ttyrec \
      vim \
      wget \
      zsh
      # ffmpeg \
      # imagemagick \
      # youtube-dl \
  dotfiles_install
}

function group_gui_install() {
  brew_cask_install
  brew cask install \
      android-file-transfer \
      atom \
      colorpicker \
      dash \
      flux \
      franz \
      google-chrome \
      google-drive \
      iterm2 \
      jumpcut \
      keycastr \
      licecap \
      macs-fan-control \
      omnidisksweeper \
      spectacle \
      torbrowser \
      veracrypt \
      virtualbox \
      vlc
}

function brew_install() {
  local URL='https://brew.sh/'
  # test
  common_bin_exists 'brew' && return
  # install
  /usr/bin/ruby -e \
      "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
}

function brew_cask_install() {
  local URL='https://caskroom.github.io/'
  # test
  brew cask --version 2>&1 > /dev/null && return
  # deps
  brew_install
  # install
  brew tap caskroom/cask
}

function neovim_install() {
  local URL='https://neovim.io/doc/'
  # test
  command -v nvim 2>&1 > /dev/null && return
  # deps
  brew_install
  # pip
  # install
  brew install neovim/neovim/neovim
  pip install neovim
  pip3 install neovim
}

# TODO: convert stuff from the Makefile.
