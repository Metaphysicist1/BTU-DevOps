#!/bin/bash

disk_usage() {
    echo "Disk usage (only physical file systems):"
    df -h --type=ext4 --type=xfs --type=btrfs
}


home_dir_size() {
    echo "Sizes of directories in \$HOME:"
    du -sh $HOME/* 2>/dev/null
}

conf_file_count() {
    echo "Number of .conf files in /etc:"
    find /etc -type f -name "*.conf" | wc -l
}


largest_file_in_home() {
    echo "Largest file in \$HOME:"
    find $HOME -type f -exec du -h {} + 2>/dev/null | sort -hr | head -n 1
}

while true; do
    echo "\nSelect an operation:"
    echo "1) Disk usage (only physical, not virtual file systems)"
    echo "2) Size of HOME directories"
    echo "3) Number of .conf files in /etc"
    echo "4) Largest file in \$HOME"
    echo "5) Exit"
    read -p "Enter your choice: " choice

    case $choice in
        1)
            disk_usage
            ;;
        2)
            home_dir_size
            ;;
        3)
            conf_file_count
            ;;
        4)
            largest_file_in_home
            ;;
        5)
            echo "Exiting the program. Goodbye!"
            exit 0
            ;;
        *)
            echo "Invalid choice. Please select a valid option."
            ;;
    esac

done
