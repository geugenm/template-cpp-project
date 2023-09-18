#!/bin/bash

# Confirmation
echo "This script will delete the ../cache ../build and ../.idea folders."
echo "Are you sure you want to continue? (y/n)"
read -r confirm

if [ "$confirm" != "y" ]; then
    exit 0
fi

# Deleting files
echo "Deleting files in ../cache ../build and ../.idea folders..."
find ../cache ../build ../.idea -type f -exec rm -f {} + 2>/dev/null || true

# Deleting directories
echo "Deleting ../cache ../build and ../.idea folders..."
find ../cache ../build ../.idea -type d -empty -delete 2>/dev/null || true
find ../cache ../build ../.idea -type d -mindepth 1 -delete 2>/dev/null || true

# Status painting
echo "Deletion complete."