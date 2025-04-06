#!/bin/bash 

# Type:         function
# Input:        FILE -> files' name
# Output:       result -> files' type
# Description:  this finction defines files' type using command test ( [ ). If
#               the file isn't a simple file, hard link file directory, symbol
#               link, symbolic file, fifo file, block file, socket, files' type will define as
#               unknown and script will be stopped with an error. 
#               Command stat returns using specified format (-c option) number
#               of hard links (%h option). If number of hard links more than
#               file is a hard link.
#
# Bags:         let the file be a symbolic link. Let also [ -f ... ] is in the
#               first place. Then file will be difined as simple file.
#               SOLUTION: move [ -L ... ] check in the first place
#
# ADD:          add exit with an error in main file, maybe flag or else?

function fileType {
    local result
    if [ -L ${FILE} ]; then
        result="symbolic link file"
    elif [ -f ${FILE} ]; then
        result="simple file"

        # Check: hardlink file
        if [ "$(stat -c %h ${FILE})" -gt 1 ]; then
            result="hard link file"
        fi
    elif [ -d ${FILE} ]; then
        result="directory"
    elif [ -c ${FILE} ]; then
        result="character file"
    elif [ -p ${FILE} ]; then
        result="fifo-file"
    elif [ -b ${FILE} ]; then
        result="block file"
    elif [ -S ${FILE} ]; then
        result="socket file"
    else
        echo "${FILE} has unknown type"
        exit 1
    fi
    echo ${result}
