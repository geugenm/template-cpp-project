#!/bin/bash

# Prompt user for input
read -p "Enter package name: " name
read -p "Enter GitHub repository (e.g., google/googletest): " github_repo
read -p "Enter Git tag (e.g., main): " git_tag

# Check if the inputs are not empty
if [ -z "$name" ]; then
  echo "Error: Package name is required."
  exit 1
fi

if [ -z "$github_repo" ]; then
  echo "Error: GitHub repository is required."
  exit 1
fi

if [ -z "$git_tag" ]; then
  echo "Error: Git tag is required."
  exit 1
fi

target_dir="../modules/cfg/CPM.cmake/packages"

# Check if the target directory exists
if [ ! -d "$target_dir" ]; then
  echo "Error: Directory '$target_dir' does not exist."
  exit 1
fi

# Create the CMake file with user-defined values
cat > "${target_dir}/${name}.cmake" << EOF
include(\${CMAKE_CURRENT_LIST_DIR}/../CPM.cmake.cmake)

CPMAddPackage(
    NAME ${name}
    GITHUB_REPOSITORY ${github_repo}
    GIT_TAG ${git_tag}
)
EOF

echo "CMake file created successfully at '${target_dir}/CPM_${name}.cmake'.
Now reload cmake to download and setup the library."
