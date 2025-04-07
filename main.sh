#!/bin/bash

# Type:     script
# Input:    file

# This script  is a main file. It recieves one or more arguments and calles
# several functions

# include
source ./fileType.sh

# Recieve arguments
declare file=$@

# Check file existence
if [ -e ${file} ]; then
    echo "Файл существует."
else
    echo "Файл не существует."
    exit 1
fi

# Get file's type
file_type=$(fileType)
echo ${file_type}
