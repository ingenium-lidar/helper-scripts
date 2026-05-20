#!/bin/bash

superdirectory_1=~/Box/LiDAR\ 2021-2023\ Archive/
superdirectory_2=~/ingenium_cartographer/

subdirectories=("Grid 23" "Grid 24" "Grid 33 Lower" "Grid 33 Upper" "Grid 92")

for subdir in "${subdirectories[@]}"; do
    echo "Comparing file counts for $subdir:"
    
    fullpath_1="$superdirectory_1$subdir"
    fullpath_2="$superdirectory_2$subdir"

    # List all the files in the first directory that are not in the second directory
    # Use -printf '%P' to produce paths relative to the starting directory so
    # identical filenames/relative paths compare correctly across the two dirs.
    echo "Files in $fullpath_1 that are not in $fullpath_2:"
    comm -23 <(find "$fullpath_1" -type f -printf '%P\n' | sort) <(find "$fullpath_2" -type f -printf '%P\n' | sort)

    # List all the files in the second directory that are not in the first directory
    echo "Files in $fullpath_2 that are not in $fullpath_1:"
    comm -13 <(find "$fullpath_1" -type f -printf '%P\n' | sort) <(find "$fullpath_2" -type f -printf '%P\n' | sort)
    
done

#AB AI Disclosure: This one was straight-up vibe coded, but it works. 
