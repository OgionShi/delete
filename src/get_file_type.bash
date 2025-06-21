#!/bin/bash 

# Type:         function
# Input:        $file -> files' name
# Output:       $result -> files' type
# DESCRIPTION:  this function defines file's type using command test -d and
#               stat. Directory and hard link files have 2 or more links.
#               Command stat can't define hard link file's type, but can
#               define number of hard links. So, if file is not a directory
#               and has 2 or more links, it is a hard link. In other cases
#               command stat can define file's type
# BAGS:         -
#
#
# ADD:          -

get_file_type() {
    local file_path="$1"
    local number_hard_linls
    local file_type


    # if file is a directory
    if [[ -d "${file_path}" ]]; then
        file_type="directory"
    # if file is a symbolic link
    elif [[ -L "${file_path}" ]]; then
        file_type="symbolic link"
    else
        # It is not a directory or symbolik link. Checking if it is a regular
        # file or hard link file. stat -c %h outputs number of hard links
        number_hard_links=$(stat -c %h "${file_path}" 2>/dev/null)
        if [[ $? -ne 0 ]]; then
            echo "Error: Could not get hard link info for '${file_path}'." >&2
            return 1
        fi

        if [[ "${number_hard_links}" -gt 1 ]]; then
            file_type="hard link file"
        else
            file_type="regular file"
        fi
    fi

    echo "${file_type}"
    return 0
}
#get_file_type "$@"
