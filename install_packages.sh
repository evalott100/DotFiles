#!/bin/bash

echo "Installing packages..."

while read pkg; do yay -S --needed $pkg; done <aur_package_list.txt

echo "Installing oh-my-zsh..."

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
