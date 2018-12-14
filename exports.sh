#!/bin/bash

export ROBOSCHOOL_PATH=$( cd "$(dirname "$BASH_SOURCE")" ; pwd -P )
export CPP_HOUSEHOLD=$ROBOSCHOOL_PATH/roboschool/cpp-household

if [ $(uname) == 'Linux' ]; then
    PYTHON_BIN=$(readlink -f $(which python))
    PYTHON_ROOT=${PYTHON_BIN%/bin/python*}
    PYTHON_VER=${PYTHON_BIN#$PYTHON_ROOT/bin/python}
    # export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$CPP_HOUSEHOLD/qt5_local_install/lib
fi
if [ $(uname) == 'Darwin' ]; then
    brew install coreutils
    PYTHON_BIN=$(greadlink -f $(which python))
    PYTHON_ROOT=${PYTHON_BIN%/bin/python*}
    PYTHON_VER=${PYTHON_BIN#$PYTHON_ROOT/bin/python}
    export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/opt/qt/lib/pkgconfig:/Library/Frameworks/Python.framework/Versions/${PYTHON_VER}/lib/pkgconfig/
    export DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:$CPP_HOUSEHOLD/bullet_local_install/lib
fi


export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:${PYTHON_ROOT}/lib/pkgconfig:$CPP_HOUSEHOLD/bullet_local_install/lib/pkgconfig/
export CPATH=$CPATH:${PYTHON_ROOT}/include/python${PYTHON_VER}m
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$CPP_HOUSEHOLD/bullet_local_install/lib

