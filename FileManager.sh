#!/bin/bash

cmd=$1
path=$2
name=$3

if [ "$cmd" = "addDir" ]; then
    mkdir -p "$path/$name"
    echo "Directory created: $path/$name"

elif [ "$cmd" = "deleteDir" ]; then
    rmdir "$path/$name"

elif [ "$cmd" = "listFiles" ]; then
    ls -p "$path" | grep -v /

elif [ "$cmd" = "listDirs" ]; then
    ls -d "$path"/*/

elif [ "$cmd" = "listAll" ]; then
    ls "$path"

else
    echo "Invalid command!"
    echo "Usage:"
    echo "$0 addDir <path> <dirname>"
    echo "$0 deleteDir <path> <dirname>"
    echo "$0 listFiles <path>"
    echo "$0 listDirs <path>"
    echo "$0 listAll <path>"
fi
