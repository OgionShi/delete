#!/bin/bash 

# Type:         function
# Input:        file -> files' name
# Output:       result -> files' type
# DESCRIPTION:  this finction defines file's type using command ls -ld. If
#               the file isn't a simple file, hard link file directory, symbol
#               link, symbolic file, fifo file, block file, socket, file's type will define as
#               unknown and script will be stopped with an error. 
#               Command stat returns using specified format (-c option) number
#               of hard links (%h option). If number of hard links more than
#               file is a hard link.
#
# BAGS:         
#
#
# ADD:          add exit with an error in main file, maybe flag or else?

function fileType {
    local result

    num_hlink=$(stat -c %h "$file") 
    if [ ${num_hlink} -gt 1 ]; then
        result="hard link file"
    fi
    result=$(stat -c %F ${file})
    echo ${result}
}
