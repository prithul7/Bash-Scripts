#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Usage: $0 <size> <type>"
    exit 1
fi

size=$1
type=$2

if [ "$type" == "t1" ]; then
    for ((i=1; i<=size; i++)); do
        for ((j=1; j<=i; j++)); do
            echo -n "*"
        done
        echo
    done

elif [ "$type" == "t2" ]; then
    for ((i=1; i<=size; i++)); do
        for ((j=1; j<=i; j++)); do
            echo -n "*"
        done
        echo
    done

elif [ "$type" == "t3" ]; then
    for ((i=1; i<=size; i++)); do
        for ((s=size-i; s>0; s--)); do
            echo -n " "
        done
        for ((j=1; j<=2*i-1; j++)); do
            echo -n "*"
        done
        echo
    done

elif [ "$type" == "t4" ]; then
    for ((i=size; i>=1; i--)); do
        for ((j=1; j<=i; j++)); do
            echo -n "*"
        done
        echo
    done

elif [ "$type" == "t5" ]; then
    for ((i=size; i>=1; i--)); do
        for ((s=size-i; s>0; s--)); do
            echo -n " "
        done
        for ((j=1; j<=i; j++)); do
            echo -n "*"
        done
        echo
    done

elif [ "$type" == "t6" ]; then
    for ((i=size; i>=1; i--)); do
        for ((s=size-i; s>0; s--)); do
            echo -n " "
        done
        for ((j=1; j<=2*i-1; j++)); do
            echo -n "*"
        done
        echo
    done

elif [ "$type" == "t7" ]; then
    for ((i=1; i<=size; i++)); do
        for ((s=size-i; s>0; s--)); do
            echo -n " "
        done
        for ((j=1; j<=2*i-1; j++)); do
            echo -n "*"
        done
        echo
    done
    for ((i=size-1; i>=1; i--)); do
        for ((s=size-i; s>0; s--)); do
            echo -n " "
        done
        for ((j=1; j<=2*i-1; j++)); do
            echo -n "*"
        done
        echo
    done

else
    echo "Invalid type! Choose between t1 to t7."
    exit 1
fi

