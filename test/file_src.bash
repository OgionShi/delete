#!/bin/bash

# TYPE:         file
# DESCRIPTION:  this file contains several associative arrays. First massive
#               contains association between file and path to it. The second
#               massive contains association between file's name and expected
#               value for the test
# BAGS:         -
# ADD:          -

# This variable contains the path to the directory, where the test files are
# stored
declare directory="/tmp/files_for_test"

declare -gA FILES_PATHS=(
    # Directories
    ["directory_empty"]="${directory}/directory_empty"
    ["directory_content"]="${directory}/directory_content"
    ["directory_restricted"]="${directory}/directory_restricted"
    ["directory_hidden"]="${directory}/.directory_hidden"

    # Regular files
    ["regularFile_empty"]="${directory}/regularFile_empty"
    ["regularFile_content"]="${directory}/regularFile_content"
    ["regularFile_exec"]="${directory}/regularFile_exec"
    ["regularFile_hidden"]="${directory}/.regularFile_hidden"
    ["simpleFile_reffered"]="${directory}/simpleFile_reffered"

    # Links
    ["hardlink_first"]="${directory}/hardlink_first"
    ["hardlink_second"]="${directory}/hardlink_second"
    ["symlink_simpleFile"]="${directory}/symlink_simpleFile"
    ["symlink_symlink"]="${directory}/symlink_symlink"
)

declare -gA FILES_EXPECTED=(
    # Directories
    ["directory_empty"]="directory"
    ["directory_content"]="directory"
    ["directory_restricted"]="directory"
    ["directory_hidden"]="directory"

    # Regular files
    ["regularFile_empty"]="regular empty file"
    ["regularFile_content"]="regular file"
    ["regularFile_exec"]="regular file"
    ["regularFile_hidden"]="regular empty file"
    ["simpleFile_reffered"]="hard link file"

    # Links
    ["hardlink_first"]="hard link file"
    ["hardlink_second"]="hard link file"
    ["symlink_simpleFile"]="symbolic link"
    ["symlink_symlink"]="symbolic link"
)
