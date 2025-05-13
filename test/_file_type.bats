#!/usr/bin/env bats

# TYPE:         test
# DESCRIPTION:  this script tests  _file_type function. This test uses several
#               functions:
#               1. _common_setup
#               2. _create_files
#               3. _delete_files
#               4. _file_type
# BAGS:         -
# ADD:          solve problem for sudo in hidden directory

source "/home/ogion/Linux.Start/delete/test/file_src.bash"

setup(){
    # Common settings for tests
    source "/home/ogion/Linux.Start/delete/test/_common_setup.bash"
    _common_setup

    # Create files for tests
    source "/home/ogion/Linux.Start/delete/test/_create_files.bash"
    _create_files >&3

    # Testing function
    source "/home/ogion/Linux.Start/delete/src/_file_type.bash"
}

teardown() {
    # Delete files for tests
    source "/home/ogion/Linux.Start/delete/test/_delete_files.bash"
    _delete_files >&3
}


@test "Test file's type" {
    echo "Start testing ..." >&3
    for file in "${!FILES_PATHS[@]}"; do
        run _file_type "${FILES_PATHS[${file}]}"
        [ "${status}" -eq 0 ] || {
            echo "Failed for ${FILES_PATHS[$file]}" >&2
            echo "Output: $output" >&2
            false
        }
        [ "$output" == "${FILES_EXPECTED[$file]}" ] && {
            echo "Tested file: ${file} is a ${output}" >&3
            } || {
             echo "Mismatch for ${FILES_PATHS[$file]}" >&2
             echo "Expected: ${FILES_EXPECTED[$file]}" >&2
             echo "Got: $output" >&2
             false
            }
    done
}
