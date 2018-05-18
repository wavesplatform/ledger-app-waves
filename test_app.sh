#!/usr/bin/env bash

RAM_USED=$(grep '0x300 00' debug/app.map | awk '{print $2}');
if [[ "$RAM_USED" > "0x20002100" ]]; then
    echo "Ram limit reached in a compiled app ($RAM_USED) !. Fix it!";
    exit -1;
fi;