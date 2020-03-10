#!/bin/bash
set -x

# Simple gpi --help invocation nogui test
DISPLAY=localhost:1.0 xvfb-run -a bash -c "gpi --help"

# Test gpi_make 
mkdir gpi
cd gpi
wget -O - https://github.com/gpilab/core-nodes/tarball/master | tar xz --strip-components 1
cd gridding
gpi_make --all --ignore-gpirc --ignore-system-libs
