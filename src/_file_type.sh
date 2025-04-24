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

_file_type() {
    local file="$1"
    local number_hard_linls
    local result

    number_hard_links=$(stat -c %h "$file")
    if [ ! -d "$file" ] && [ "$number_hard_links" -gt 1 ]; then
        result="hard link file"
    else
        result=$(stat -c %F "$file")
    fi

    # return
    echo "$result"
}
