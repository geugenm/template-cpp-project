#!/bin/bash
set -euo pipefail


SCRIPT_DIR="$( cd "$( dirname "\${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

echo "Enter Git submodule URL:"
read -r submodule_url

repo_name=$(echo "$submodule_url" | sed -e 's/.*\/\([^\/]*\)\.git$/\1/')

if [ -d "$SCRIPT_DIR/../modules/$repo_name" ]; then
  echo "The submodule already exists in '../modules/$repo_name'. Do you want to update it? (y/n)"
  read -r update_submodule
  if [ "$update_submodule" == "y" ]; then
    git submodule update --init --remote "$SCRIPT_DIR/../modules/$repo_name"
  else
    echo "Submodule not updated(Discarded by user)."
    exit 0
  fi
else
  git submodule add "$submodule_url" "$SCRIPT_DIR/../modules/$repo_name"
  git submodule update --init "$SCRIPT_DIR/../modules/$repo_name"
fi

if [ ! -d "$SCRIPT_DIR/../modules/cfg" ]; then
  mkdir "$SCRIPT_DIR/../modules/cfg"
else
  echo "Config for the $repo_name already exists"
  exit 0
fi
if [ ! -f "$SCRIPT_DIR/../modules/cfg/$repo_name/$repo_name.cmake" ]; then
  mkdir -p "$SCRIPT_DIR/../modules/cfg/$repo_name"
  echo "project($repo_name)" > "$SCRIPT_DIR/../modules/cfg/$repo_name/$repo_name.cmake"
  echo "add_subdirectory(../$repo_name)" >> "$SCRIPT_DIR/../modules/cfg/$repo_name/$repo_name.cmake"
fi
