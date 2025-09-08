#!/bin/bash

cmd=$1
path=$2
name=$3

addDir() {
    if [ -z "$path" ] || [ -z "$name" ]; then
        echo " Path or directory name missing!"
        echo "Usage: $0 addDir <path> <dirname>"
        exit 1
    fi

    mkdir -p "$path/$name" 
    if [ $? -eq 0 ]; then
        echo " Directory created: $path/$name"
    else
        echo " Failed to create directory: $path/$name"
    fi
}

deleteDir() {
    if [ -z "$path" ] || [ -z "$name" ]; then
        echo " Path or directory name missing!"
        echo "Usage: $0 deleteDir <path> <dirname>"
        exit 1
    fi

    if [ -d "$path/$name" ]; then
        rmdir "$path/$name" 
        if [ $? -eq 0 ]; then
            echo " Directory deleted: $path/$name"
        else
            echo " Failed to delete directory (not empty?): $path/$name"
        fi
    else
        echo " Directory does not exist: $path/$name"
    fi
}

listFiles() {
    if [ -z "$path" ]; then
        echo " Path missing!"
        echo "Usage: $0 listFiles <path>"
        exit 1
    fi

    if [ -d "$path" ]; then
        echo " Files in $path:"
        ls -p "$path" | grep -v / || echo "No files found."
    else
        echo " Path does not exist: $path"
    fi
}

listDirs() {
    if [ -z "$path" ]; then
        echo " Path missing!"
        echo "Usage: $0 listDirs <path>"
        exit 1
    fi

    if [ -d "$path" ]; then
        echo " Directories in $path:"
        ls -d "$path"/*/ || echo "No directories found."
    else
        echo " Path does not exist: $path"
    fi
}

listAll() {
    if [ -z "$path" ]; then
        echo " Path missing!"
        echo "Usage: $0 listAll <path>"
        exit 1
    fi

    if [ -d "$path" ]; then
        echo " Contents of $path:"
        ls "$path" || echo "Empty directory."
    else
        echo " Path does not exist: $path"
    fi
}

usage() {
    echo " Invalid command!"
    echo "Usage:"
    echo "$0 addDir <path> <dirname>"
    echo "$0 deleteDir <path> <dirname>"
    echo "$0 listFiles <path>"
    echo "$0 listDirs <path>"
    echo "$0 listAll <path>"
    exit 1
}
case "$cmd" in
    addDir) addDir ;;
    deleteDir) deleteDir ;;
    listFiles) listFiles ;;
    listDirs) listDirs ;;
    listAll) listAll ;;
    *) usage ;;
esac

