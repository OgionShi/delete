#!/bin/bash

# Type:     script
# Input:    file's name
# Output:   read README.md

# This script  is a main file. It recieves one or more arguments and calles
# several functions

# include
source ./_file_type.sh

# variables
local file_type

# Recieve arguments
declare file="$@"

# Get file's type
file_type=$(_file_type "$file")
echo ${file_type}
