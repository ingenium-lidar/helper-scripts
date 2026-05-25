#!/bin/bash

source compare_archives.sh

superdirectory_1="/home/lidar/Box/LiDAR 2021-2023 Archive/"
superdirectory_2="$HOME/ingenium_cartographer/"
output_file_path="/tmp/index_of_copied_files.txt"
output_directory="$HOME/Box/Omen Data Archive/"

# superdirectory_1=$(pwd)/test_directory/subdir1/
# superdirectory_2=$(pwd)/test_directory/subdir2/
# output_file_path=$(pwd)/files_in_1_not_in_2.txt
# output_directory=$(pwd)/test_directory/output/

# Remove previous output file if it exists and create a new blank one
mkdir -p "$(dirname "$output_file_path")"
rm -f "$output_file_path"
touch "$output_file_path"

# Compute the difference between the two directories and write to output file
get_archive_difference "$superdirectory_1" "$superdirectory_2" "$output_file_path" "$superdirectory_1"

# Iterate through the output file and copy the missing files to the output directory
while IFS= read -r object; do 
    rel=$(realpath --relative-to="$superdirectory_1" "$object")
    mkdir -p "$(dirname "$output_directory$rel")"
    cp -r "$object" "$output_directory$rel"

done < "$output_file_path"

mv "$output_file_path" "$output_directory"


echo "Done!"


# compare_archives.sh: line 43: ~/Box/Omen Data Archive/index_of_copied_files.txt: No such file or directory

#AB A human understood every line of this code. No AI generated content was used that the human author did not completely understand. 
#   No AI wrote more than 1 line of code at any given time. 