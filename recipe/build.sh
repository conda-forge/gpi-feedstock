#!/bin/bash
# Check the OS b/c of differences in 'cp' (BSD vs GNU).

cp -R bin/* $PREFIX/bin/
cp -R lib/* $SP_DIR
cp -R include/* $PREFIX/include/

## The following lines are a holdover from .app style packaging.
## They are left as a reference for re-implementation outside of this noarch package.
# OSX
#if [ "$(uname)" == "Darwin" ]; then
#    # ".command" script is required for terminal.app launcher
#    cp launch/gpi.command $PREFIX/bin/
#    # terminal.app launcher script, the target for GPI.app
#    cp launch/gpi.app $PREFIX/bin/
#fi

# Linux
#if [ "$(uname)" == "Linux" ]; then
#    # launcher
#    LAUNCHER_PATH=$PREFIX/share/gpi
#    mkdir -p $LAUNCHER_PATH
#    cp launch/GPI.desktop $LAUNCHER_PATH/
#    cp lib/gpi/graphics/iclogo.png $LAUNCHER_PATH/
#fi

# copy and rename 'gpi.command' to 'gpi'
cp launch/gpi.command $PREFIX/bin/gpi
# for Windows, indlude a batch script version
cp launch/gpi_cmd.bat $PREFIX/bin/gpi.cmd
cp launch/gpi_make.cmd $PREFIX/bin/gpi_make.cmd
# (The shell should automatically pick up on the correct option)

# copy licenses to lib dir
cp LICENSE $SP_DIR/gpi/
cp COPYING $SP_DIR/gpi/
cp COPYING.LESSER $SP_DIR/gpi/
cp AUTHORS $SP_DIR/gpi/

# drop a version file with parseable info
VERSION_FPATH=$SP_DIR/gpi/VERSION
echo "PKG_NAME: $PKG_NAME" > $VERSION_FPATH
echo "PKG_VERSION: $PKG_VERSION" >> $VERSION_FPATH
echo "GIT_FULL_HASH: $GIT_FULL_HASH" >> $VERSION_FPATH
BUILD_DATE=`date +%Y-%m-%d`
echo "BUILD_DATE: $BUILD_DATE" >> $VERSION_FPATH
