#!/bin/bash
# Script name:  main.bash
# Description:  -
# Author:       Ivan Zarubin
# Date:         20.06.2025
# Dependencies: this script receives {FILE_PATH}

# SCRIPT_DIR contains path to this script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"

# including fuctions
source "${SCRIPT_DIR}/get_file_type.bash"

# receive arguments
file_path="$@"

# if length of the {FILE_PATH} is zero
if [[ -z "${file_path}" ]]; then
    echo "Error: No file path provided." >&2
    exit 1
fi

# if file in {FILE_PATH} does not exist
if [[ ! -e "${file_path}" ]]; then
    echo "Error: File or directory '${file_path}' does not exist." >&2
    exit 1
fi

# get type of file
file_type=$(get_file_type "${file_path}")
echo "The ${file_path} is a ${file_type}"
