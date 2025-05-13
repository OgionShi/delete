#!/bin/bash

# TYPE:         function
# DESCRIPTION:  this function deletes directory and its content specified in
#               file_src.bash to clean after test execution
# BAGS:
# ADD:

source ./file_src.bash

_delete_files () {
   # for file in "${FILES_PATHS[@]}"; do
   #     echo $file
   #     rm -rf "${file}"
   # done
   # 
   # echo "Environment for tests is cleaned"
   rm -rf "${directory}"

   echo "Files are deleted"
}

#_delete_files
