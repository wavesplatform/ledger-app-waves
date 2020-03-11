#!/bin/sh

clang-format -i $(find src -name '*.h' -o -name '*.cpp'|/usr/bin/egrep -v src/test)

