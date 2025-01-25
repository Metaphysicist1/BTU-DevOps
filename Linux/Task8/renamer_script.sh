#!/bin/bash

for bak_file in "$HOME"/*.bak; do
    [[ -e "$bak_file" ]] || continue 
    echo "Processing: $bak_file"   
    original_file="${bak_file%.bak}" 
    if [[ ! -e "$original_file" || "$bak_file" -nt "$original_file" ]]; then
        read -p "Rename $bak_file to $original_file? (y/n) " response
        if [[ "$response" =~ ^[yY] ]]; then
            mv "$bak_file" "$original_file"
            echo "Renamed $bak_file to $original_file."
        fi
    fi
done