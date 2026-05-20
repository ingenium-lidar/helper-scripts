#!/bin/bash

superdirectory_1=~/Box/LiDAR\ 2021-2023\ Archive/
superdirectory_2=~/ingenium_cartographer/

subdirectories=("Grid 23" "Grid 24" "Grid 33 Lower" "Grid 33 Upper" "Grid 92")

for subdir in "${subdirectories[@]}"; do
    echo "Comparing file counts for $subdir:"
    
    fullpath_1="$superdirectory_1$subdir"
    fullpath_2="$superdirectory_2$subdir"

    count_1=$(find "$fullpath_1" -type f | wc -l)
    count_2=$(find "$fullpath_2" -type f | wc -l)
    
    echo "Count in $fullpath_1: $count_1"
    echo "Count in $fullpath_2: $count_2"
    echo ""
done

#AB AI Disclosure: This script was designed by a human, but the syntax was almost entirely written by AI 
#                  (it wasn't intended that way, but the human was inexperienced in bash, and made so many 
#                  errors that AI ended up editing every line at least once).
