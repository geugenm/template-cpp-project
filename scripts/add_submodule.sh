#!/bin/bash

# Get the directory containing this script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Prompt the user for a Git submodule URL
echo "Enter Git submodule URL:"
read -r submodule_url

# Extract the repository name from the Git submodule URL
repo_name=$(echo "$submodule_url" | sed -e 's/.*\/\([^\/]*\)\.git$/\1/')

# Check if the submodule already exists
if [ -d "$SCRIPT_DIR/../modules/$repo_name" ]; then
  # Prompt the user to update the submodule if it already exists
  echo "The submodule already exists in '../modules/$repo_name'. Do you want to update it? (y/n)"
  read -r update_submodule
  if [ "$update_submodule" == "y" ]; then
    git submodule update --init --remote "$SCRIPT_DIR/../modules/$repo_name"
  else
    echo "Submodule not updated."
    exit 1
  fi
else
  # Add the submodule to a folder with the same name as the repository in the "../modules/" folder
  git submodule add "$submodule_url" "$SCRIPT_DIR/../modules/$repo_name"
  git submodule update --init "$SCRIPT_DIR/../modules/$repo_name"
fi

# Create a CMakeLists.txt file in the "../modules/cfg/" folder with the package name
if [ ! -d "$SCRIPT_DIR/../modules/cfg" ]; then
  mkdir "$SCRIPT_DIR/../modules/cfg"
fi
if [ ! -f "$SCRIPT_DIR/../modules/cfg/$repo_name/$repo_name.cmake" ]; then
  mkdir -p "$SCRIPT_DIR/../modules/cfg/$repo_name"
  echo "project($repo_name)" > "$SCRIPT_DIR/../modules/cfg/$repo_name/$repo_name.cmake"
  echo "add_subdirectory(../$repo_name)" >> "$SCRIPT_DIR/../modules/cfg/$repo_name/$repo_name.cmake"
fi