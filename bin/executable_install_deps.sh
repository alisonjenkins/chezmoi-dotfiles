#!/usr/bin/env bash

test -d ~/.asdf || git clone https://github.com/asdf-vm/asdf.git ~/.asdf
test -f ~/.asdf/asdf.sh && source ~/.asdf/asdf.sh

PACKAGES=(
  alacritty
  aws-vault
  discord
  freeplane
  gopls
  neovim
  nerd-fonts-complete
  nnn
  python-pip
  slack
  steam
  tmux
  zoxide
)

ASDF_PLUGINS=(
  awscli
  direnv
  java
  just
  kubectl
  kubectx
  maven
  terraform
  tflint
  tfsec
)

INSTALLED_PACKAGES=($(pacman -Q | awk '{ print $1 }'))
TO_INSTALL=()

for package in "${PACKAGES[@]}"; do
  if ! echo "${INSTALLED_PACKAGES[@]}" | grep -q "$package" > /dev/null; then
    TO_INSTALL+=("${package}")
  fi
done

paru -S --noconfirm "${TO_INSTALL[@]}"

ASDF_PLUGINS_INSTALLED=$(asdf plugin list)
ASDF_PLUGINS_TO_INSTALL=$()

echo "${ASDF_PLUGINS_INSTALLED[@]}"
for plugin in "${ASDF_PLUGINS[@]}"; do
  echo "Checking $plugin"
  if ! echo "${ASDF_PLUGINS_INSTALLED[@]}" | grep -q "$plugin" > /dev/null; then
    echo "Attempting to install plugin: $plugin"
    asdf plugin add "$plugin"
  fi
done

# install latest versions of asdf tools
ASDF_PLUGINS_INSTALLED=$(asdf plugin list)

for plugin in "${ASDF_PLUGINS_INSTALLED[@]}"; do
  LATEST_VERSION=$(asdf list all "$plugin" | tail -n1)
  asdf install "$plugin" "$LATEST_VERSION"
  asdf global "$plugin" "$LATEST_VERSION"
done

# ensure tmux plugin manager is setup
test -d ~/.tmux/plugins/tpm || git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# ensure codecommit grc is install
pip install git-remote-codecommit
