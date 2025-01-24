#!/bin/bash

FILENAME_LIST="$HOME/fichier"
DIRNAME_LIST="$HOME/repertoire"

> "$FILENAME_LIST"
> "$DIRNAME_LIST"


name_writer(){

    for i in "$1"/*; do
        if [ -f "$i" ]; then
            echo "$i" >> "$FILENAME_LIST"
        elif [ -d "$i" ]; then
            echo "$i" >> "$DIRNAME_LIST"
            name_writer "$i"
        fi
    done
}

name_writer "/home/metaphysicist/Coding/Interview_Prep"> "$DIRNAME_LIST"


name_writer(){

    for i in "$1"/*; do
        if [ -f "$i" ]; then
            echo "$i" >> "$FILENAME_LIST"
        elif [ -d "$i" ]; then
            echo "$i" >> "$DIRNAME_LIST"
            name_writer "$i"
        fi
    done
}

name_writer "/home/metaphysicist/Coding/Interview_Prep"