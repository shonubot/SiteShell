#!/bin/bash

# Prompt for the app name
read -p "Enter the name of the app to uninstall: " app_name

# Set paths
app_dir="$HOME/$app_name"
desktop_file="$HOME/.local/share/applications/$app_name.desktop"

# Confirm before deletion
echo "This will remove:"
echo "$app_dir"
echo "desktop_file"
read -p "Are you sure you want to uninstall $app_name? [y/N]: " confirm

# Convert to lowercase
confirm=$(echo "$confirm" | tr '[:upper:]' '[:lower:]')

if [[ "$confirm" == "y" || "$confirm" == "yes" ]]; then
    # Remove app directory
    if [ -d "$app_dir" ]; then
        rm -rf "$app_dir"
        echo "Removed app directory."
    else
        echo "pp directory not found."
    fi

    # Remove .desktop file
    if [ -f "$desktop_file" ]; then
        rm "$desktop_file"
        echo "Removed .desktop launcher."
    else
        echo "desktop file not found."
    fi

    echo "$app_name has been uninstalled."
else
    echo "Uninstall cancelled."
fi
