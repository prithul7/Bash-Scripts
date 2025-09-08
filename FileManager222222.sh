#!/bin/bash

cmd=$1
path=$2
name=$3

addDir() {
    mkdir -p "$path/$name"
    echo "Directory created: $path/$name"
}

deleteDir() {
    rmdir "$path/$name"
}

listFiles() {
    ls -p "$path" | grep -v /
}

listDirs() {
    ls -d "$path"/*/
}

listAll() {
    ls "$path"
}

usage() {
    echo "Invalid command!"
    echo "Usage:"
    echo "$0 addDir <path> <dirname>"
    echo "$0 deleteDir <path> <dirname>"
    echo "$0 listFiles <path>"
    echo "$0 listDirs <path>"
    echo "$0 listAll <path>"
}

if [ "$cmd" = "addDir" ]; then
    addDir
elif [ "$cmd" = "deleteDir" ]; then
    deleteDir
elif [ "$cmd" = "listFiles" ]; then
    listFiles
elif [ "$cmd" = "listDirs" ]; then
    listDirs
elif [ "$cmd" = "listAll" ]; then
    listAll
else
    usage
fi

