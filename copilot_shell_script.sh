#!/bin/bash

# Ask user input for new assignment name
echo "Enter the new assignment name: "
read new_assignment

#It looks for config.env, and stores what it found in a file
find . -name "config.env" > found_files.txt

if [ ! -s found_files.txt ]; then
    echo "No config.env files found!"
    rm found_files.txt
    exit 1
fi


# It then updates the second line of the file_path that it found
while read config_file
do
    echo "Changing $config_file"
    
    
    sed -i "2s/ASSIGNMENT=.*/ASSIGNMENT=\"$new_assignment\"/" "$config_file"
    
    
    # To search for the startup.sh file
    folder=$(dirname "$config_file")
    parent_folder="$folder/.."
    
    
    if [ -f "$parent_folder/startup.sh" ]; then
        cd "$parent_folder"
        ./startup.sh
        cd - > /dev/null  
    else
        echo "startup.sh file not found"
    fi
    
    echo "Successfully changed  the $config_file file"
    
done < found_files.txt

#To remove the file
rm found_files.txt
