#!/bin/bash

# Include the .env file
if [[ -f .env ]]; then
    source .env
fi

# Check if the build/docs directory exists
if [ ! -d "$DOCS_PATH" ]; then
    echo "Error: docs directory not found. Building the project documentation..."
    # Check if Doxygen is installed
    if ! command -v doxygen &> /dev/null; then
        echo "Error: Doxygen is not installed. Please install Doxygen and try again."
        exit 1
    fi

    # Attempt to build the documentation
    doxygen .doxygen

    # Check if the build/docs directory now exists
    if [ ! -d "$DOCS_PATH" ]; then
        echo "Error: failed to build documentation in $DOCS_PATH."
        exit 1
    fi
fi

cd "$DOCS_HTML_PATH" || exit 1

# Check if the index.html file exists
if [ ! -f "$INDEX_FILE" ]; then
    echo "Error: $INDEX_FILE not found."
    exit 1
fi

# Check if any of the supported browsers are available and open the index file
if command -v firefox > /dev/null; then
    firefox "$INDEX_FILE"
elif command -v edge > /dev/null; then
    edge "$INDEX_FILE"
elif command -v google-chrome > /dev/null; then
    google-chrome "$INDEX_FILE"
elif command -v brave > /dev/null; then
    brave-browser "$INDEX_FILE"
elif command -v vivaldi > /dev/null; then
    vivaldi "$INDEX_FILE"
elif command -v xdg-open > /dev/null; then
    xdg-open "$INDEX_FILE"
elif command -v open > /dev/null; then
    open "$INDEX_FILE"
else
    echo "Error: could not detect any supported web browser."
    exit 1
fi