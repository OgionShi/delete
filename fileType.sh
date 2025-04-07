#!/bin/bash 

# Type:         function
# Input:        file -> files' name
# Output:       result -> files' type
# DESCRIPTION:  this finction defines file's type using command ls -ld. If
#               the file isn't a simple file, hard link file, directory, symbol
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
    local type

    type=$(ls -ld ${file} | awk '{print $1}' | head -c 1)
    case ${type} in
        -)
            local num_hlink
            
            num_hlink=$(stat -c %h "$file")
            if [ ${num_hlink} -gt 1 ]; then
                result="hard link file"
            else
                result="simple file"
            fi
            ;;
        d)
            result="directory file"
            ;;
        l)
            result="symbolic link file"
            ;;
        b)
            result="block file"
            ;;
        c)
            result="character file"
            ;;
        s)
            result="socket file"
            ;;
        p)
            result="fifo file"
            ;;
        *)
            echo "${file} has unknown type"
            exit 1
            ;;
    esac
    echo ${result}
}
