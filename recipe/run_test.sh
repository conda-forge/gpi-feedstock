#!/bin/bash
set -x

# Simple gpi --help invocation nogui test
DISPLAY=localhost:1.0 xvfb-run -a bash -c "gpi --help"

# Test gpi_make 
mkdir gpi
cd gpi
wget https://github.com/gpilab/core-nodes/releases/latest
cd gridding
gpi_make --all --ignore-gpirc --ignore-system-libs
