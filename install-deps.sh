#!/bin/bash

# List of required packages
packages=(
  aspell
  diction
  python3-proselint
  pandoc
  linkchecker
)

echo "🔧 Checking required packages..."

for pkg in "${packages[@]}"; do
  if ! dpkg -s "$pkg" >/dev/null 2>&1; then
    echo "📦 Installing $pkg..."
    sudo apt install -y "$pkg"
  else
    echo "✅ $pkg already installed."
  fi
done

sudo cp plist.per /usr/lib/aspell

echo "🎉 All required packages are ready!"
