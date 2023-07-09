#!/bin/bash

# Define the log Directory
log_directory="/mnt/user/Temp/logs/"

# Create the directory if it doesn't exist
mkdir -p "$log_directory"

# Define the directory to search
search_directory="/mnt/user/data/media/movies"

# Define whether this is a dry run (1 for dry run, 0 for actual run)
dry_run=1

# Define the log file
log_file="${log_directory}log_file.log"

# Initialize size variable
total_size=0

# Calculate total size and print file names
echo "The following files will be deleted:" | tee -a $log_file
while IFS= read -r -d '' file; do
    echo "$(basename "$file")" | tee -a $log_file
    file_size=$(du -b "$file" | cut -f1) # Get file size in bytes
    total_size=$((total_size + file_size)) # Add file size to total size
done < <(find "$search_directory" -type f -iname "*trailer*" -print0)

# Convert total size to human-readable format
human_readable_size=$(numfmt --to=iec-i --suffix=B $total_size)

echo "Total size of files to be deleted: $human_readable_size" | tee -a $log_file

# Check if this is a dry-run
if [[ $dry_run -ne 1 ]]; then
    # This is not a dry-run, so delete the files
    echo "Deleting files..." | tee -a $log_file
    while IFS= read -r -d '' file; do
        rm "$file"
    done < <(find "$search_directory" -type f -iname "*trailer*" -print0)
    echo "Files deleted." | tee -a $log_file
else
    echo "Dry-run completed. No files were deleted." | tee -a $log_file
fi
