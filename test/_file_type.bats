#!/usr/bin/env bats

# 1. divide test
# 2. replace a long way
# 3. join 2 test with regular emmpty file and simple file

setup() {
    load '/home/ogion/Linux.Start/delete/test/_common_setup.sh'

    # It is a directory with several empty files
    mkdir -p /tmp/directory/file{1..3}

    # This file has not any links
    touch /tmp/regular_file

    # This file has several links and some text
    # This file also is a hard link file
    echo "Some text" > /tmp/simple_file

    # This file is a hard link file
    ln /tmp/simple_file /tmp/hard_link_file

    # This file is a symbolic link file
    ln -s /tmp/simple_file /tmp/symbolic_link_file
}

teardown() {
    rm -f /tmp/regular_file /tmp/simple_file /tmp/hard_link_file /tmp/symbolic_link_file
    rm -r /tmp/directory/
}

source /home/ogion/Linux.Start/delete/src/_file_type.sh

@test "Check _file_type.sh runs and file is a directory" {
    run _file_type /tmp/directory
    [ "$status" -eq 0 ]
    [ "$output" = "directory" ]
}

@test "Check _file_type.sh runs and file is a regular empty file" {
    run _file_type /tmp/regular_file
    [ "$status" -eq 0 ]
    [ "$output" = "regular empty file" ]
}

@test "Check _file_type.sh runs and file is a regular file" {
    run _file_type /tmp/simple_file
    [ "$status" -eq 0 ]
    [ "$output" = "regular file" ]
}

@test "Check _file_type.sh runs and file is a hard link file" {
    run _file_type /tmp/hard_link_file
    [ "$status" -eq 0 ]
    [ "$output" = "hard link file" ]
}

@test "Check _file_type.sh runs and file is a symbolic link file" {
    run _file_type /tmp/symbolic_link_file
    [ "$status" -eq 0 ]
    [ "$output" = "symbolic link" ]
}
