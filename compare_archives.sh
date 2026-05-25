#!/bin/bash


compare_paths() {
    # The telos and use of this function is as follows:
    #   The user passes it an "object" (either a file or a directory) and 2 directories in the form of path strings
    #       "object" shall be within superdir1: Ie, the file path should look like /foo/superdir1/bar/object[/] 
    #   The function will isolate the path bar/object[/] from superdir1. If superdir2/bar/object[/] exists, it returns true, else false

    # object=$1
    # superdir1=$2
    # superdir2=$3

    # 0 = True, 1 = False

    local object="$1"
    local superdir1="${2%/}"
    local superdir2="${3%/}"
    local rel

    rel=$(realpath --relative-to="$superdir1" "$object")
    [ -e "$superdir2/$rel" ]
}

get_archive_difference() { # superdir1, superdir2, output_file_path, current_location [should be superdir1 initially]
    local superdir1="${1%/}"
    local superdir2="${2%/}"
    local output_file_path="$3"
    local current_location="$4"
    local object

    if [ -z "$4" ]; then
        : > "$output_file_path"
    fi

    current_location="${current_location%/}" # remove trailing slash if present

    for object in "$current_location"/*; do
        [ -e "$object" ] || continue

        if [ -f "$object" ]; then
            if ! compare_paths "$object" "$superdir1" "$superdir2"; then
                printf '%s\n' "$object" >> "$output_file_path"
            fi
        elif [ -d "$object" ]; then
            get_archive_difference "$superdir1" "$superdir2" "$output_file_path" "$object"
        fi
    done
}

#AB A human understood every line of this code. No AI generated content was used that the human author did not completely understand. 
#   The AI was very carefully supervised, and a human was the architect. 