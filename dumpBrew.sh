#!/bin/bash

echo "Exporting brew packages..."

brew list -1 > ./brew-installed

echo "Saved to ./brew-installed"
