# Trailer File Cleanup Script
This Bash script is used to search a specified directory (and its subdirectories) for files with 'trailer' in their name. Depending on the mode it's running in, it either deletes these files or does a 'dry run' where it just lists the files and calculates the total space they're using.

## How the script works
The script first sets the directory to search and whether it's a dry run or not.
It then uses the find command to search for files with 'trailer' in their filename within the specified directory and its subdirectories.
The script then calculates the total size of the found files and prints their names and total size.
If the script is not in dry-run mode, it deletes the files and logs the actions. If it's in dry-run mode, it just prints what would be deleted without actually deleting anything.

## Usage
To use the script, first ensure that the log directory exists or the script has the permissions to create it. Then, you can run it like any other bash script:

    1. Open the User Scripts plugin in Unraid.
    2. Click on "Add New Script".
    3. Name your new script.
    4. Open the trailer_cleanup.sh file and copy its content.
    5. Go back to the User Scripts plugin in Unraid and paste the content into your new script.
    6. Click "Save Changes".
    7.Before running the script, ensure to set the search_directory and dry_run variables according to your needs:
        * search_directory: This should be the path to the directory you want to search.
        * dry_run: Set this to 1 for a dry run (no files will be deleted), and 0 for an actual run (files will be deleted).

## Important Note
Please be careful when using scripts that delete files. Always make sure you have a backup of any important files and verify the search_directory and dry_run variables are set correctly before running the script.

## Configuring the script
The behavior of the script can be adjusted by modifying the following variables at the top of the script:

* ### search_directory: 
    Specifies the directory to search for files. Set this to the path of the directory you want to search.

* ### dry_run:
    Determines whether the script is running in dry-run mode or not. Set this to 1 for a dry run (no files will be deleted), and 0 for an actual run (files will be deleted).

* ### log_directory and log_file: 
    Specifies the location of the log file. You can change these to control where the log file is saved.

