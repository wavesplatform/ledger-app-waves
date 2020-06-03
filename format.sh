#!/bin/sh

clang-format -i $(find src -name '*.h' -o -name '*.c')

