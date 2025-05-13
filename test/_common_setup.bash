#!/bin/bash
# TYPE:         function
# DESCRIPTION:  this function ...
# BAGS:         -
# ADD:          -

_common_setup() {
    DIR="$(cd "$(dirname "$BATS_TEST_FILENAME")" > /dev/null 2>&1 && pwd )"
    PATH="$DIR/../src:$PATH"
}
