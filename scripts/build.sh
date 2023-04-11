#!/bin/bash

# Prompt the user to enter the name of the project directory
read -r -p "Enter the name of the project directory (cd to): " project_directory

# Move up one level to the root directory of the project
cd "$project_directory" || { echo "Error: Project directory not found."; exit 1; }

# Check if the CMakePresets.json file exists
if [ ! -f "CMakePresets.json" ]; then
  echo "Error: CMakePresets.json file not found in ${project_directory}."
  exit 1
fi

# Get list of available presets from CMakePresets.json
presets=$(grep -oP '(?<="name": ")[^"]*' CMakePresets.json)
if [[ -z "$presets" ]]; then
  echo "Error: no presets found in CMakePresets.json"
  exit 1
fi

# Display the available presets to the user and prompt for input
echo "Available presets:"
for preset in $presets; do
  echo " - $preset"
done
read -r -p "Enter the name of the preset you want to build: " chosen_preset

# Check if the chosen preset exists in the CMakePresets.json file
if ! echo "$presets" | grep -q "$chosen_preset"; then
  echo "Error: Chosen preset does not exist."
  exit 1
fi


# Build the chosen preset
cmake --preset="$chosen_preset" .
cd build/"${chosen_preset,,}" || { echo "Error: Failed to change directory."; exit 1; }
cmake --build . --config "$chosen_preset"
