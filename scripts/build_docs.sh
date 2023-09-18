#!/bin/bash

# Variables from .env file
INDEX_FILE="index.html"
LATEX_MAKE_FILE="Makefile"
DOXYGEN_FILE=".doxygen"
PROJECT_ROOT=".."
DOCS_HTML_PATH="docs/html"
DOCS_LATEX_PATH="docs/latex"

# Function to generate documentation
generate_docs() {
  echo "Generating documentation using Doxygen..."
  cd ..
  if ! doxygen "${DOXYGEN_FILE}" ; then
    echo "Error: failed to generate documentation using Doxygen."
    exit 1
  fi
  echo "Documentation generated successfully."
  echo "You can find the web version documentation at ${PROJECT_ROOT}/${DOCS_HTML_PATH}/${INDEX_FILE}"
  echo "Also you can build latex at ${PROJECT_ROOT}/${DOCS_LATEX_PATH}/${LATEX_MAKE_FILE}"
}

# Interactive prompt
while true; do
  read -r -p "Do you want to generate documentation? [Y/n]: " yn
  case $yn in
    [Yy]* ) generate_docs; break;;
    [Nn]* ) echo "Documentation generation skipped."; break;;
    * ) echo "Please answer Y (Yes) or n (No).";;
  esac
done

