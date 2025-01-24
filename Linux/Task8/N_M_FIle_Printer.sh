#!/bin/bash

N=$1
M=$2
FILE=$3


sed -n "${N},$((N + M - 1))p" "$FILE"