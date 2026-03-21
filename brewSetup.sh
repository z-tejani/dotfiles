#!/bin/bash

# 1. Check if Homebrew is installed
if ! command -v brew &> /dev/null; then
    echo "Homebrew is not installed. Installing it now..."
    # The official Homebrew installation script
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    # Load Homebrew into the current script session so the next steps don't fail
    if [[ -x /opt/homebrew/bin/brew ]]; then
        # For Apple Silicon Macs (M1/M2/M3, etc.)
        eval "$(/opt/homebrew/bin/brew shellenv)"
    elif [[ -x /usr/local/bin/brew ]]; then
        # For older Intel Macs
        eval "$(/usr/local/bin/brew shellenv)"
    fi
else
    echo "Homebrew is already installed. Moving on..."
fi

# 2. Verify the backup file exists
FILE="./brew-installed"

if [[ ! -f "$FILE" ]]; then
    echo "Error: Could not find '$FILE' in the current directory."
    exit 1
fi

echo "Starting package installations from $FILE..."

# 3. Read the file line by line and install
while IFS= read -r package || [[ -n "$package" ]]; do
    # Skip empty lines
    if [[ -n "$package" ]]; then
        echo "--> Installing: $package"
        brew install "$package"
    fi
done < "$FILE"

echo "Success! All packages have been processed."
