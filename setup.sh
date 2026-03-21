#!/bin/bash

# Flag vars for OSs
OS_LINUX=false
OS_MAC=false

usage() {
    echo "Usage: $0 [-l|--linux] [-m|--mac]"
    exit 1
}

while [[ $# -gt 0 ]]; do
  case $1 in
    -l|--linux)
      OS_LINUX=true
      shift
      ;;
    -m|--mac)
      OS_MAC=true
      shift
      ;;
    -h|--help)
      usage
      ;;
    *)
      echo "Error: Invalid option $1"
      usage
      ;;
  esac
done


if [ "$OS_LINUX" = true ]; then
    echo "Configuring for Linux..."
    cd linux
    stow -t ~ */
    cd ..
fi

if [ "$OS_MAC" = true ]; then
    echo "Configuring for Mac..."
    cd mac
    stow -t ~ */
    cd ..
fi
