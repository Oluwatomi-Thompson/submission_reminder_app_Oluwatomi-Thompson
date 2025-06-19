#!/bin/bash

#Ask for user input
echo "Enter your name: "
read name

#Creates the base directory
echo "Creating environemt......"
dir_name="submission_remainder_${name}"

if [ -d "$dir_name" ]; then
	echo "Directory $dir_name already exists"
	exit 1
else
	mkdir $dir_name
fi


#Creates app directory structure
mkdir -p $dir_name/app
touch $dir_name/app/remainder.sh
chmod +x $dir_name/app/remainder.sh

#Populating remainder.sh file
{
	echo '#!/bin/bash'
	echo ''
	echo '# Source environment variables and helper functions'
	echo 'source ./config/config.env'
	echo 'source ./modules/functions.sh'
	echo ''
	echo '# Path to the submissions file'
	echo 'submissions_file="./assets/submissions.txt"'

	echo '# Print remaining time and run the reminder function'
	echo 'echo "Assignment: $ASSIGNMENT"'
	echo 'echo "Days remaining to submit: $DAYS_REMAINING days"'
	echo 'echo "--------------------------------------------"'

	echo 'check_submissions $submissions_file'
} >> $dir_name/app/remainder.sh


#Creates modules directory structure
mkdir -p $dir_name/modules
touch $dir_name/modules/functions.sh
chmod +x $dir_name/modules/functions.sh

#Populating the functions.sh file
{
    echo '#!/bin/bash'
    echo ''
    echo '# Function to read submissions file and output students who have not submitted'
    echo 'function check_submissions {'
    echo '    local submissions_file=$1'
    echo '    echo "Checking submissions in $submissions_file"'
    echo ''
    echo '    # Skip the header and iterate through the lines'
    echo '    while IFS=, read -r student assignment status; do'
    echo '        # Remove leading and trailing whitespace'
    echo '        student=$(echo "$student" | xargs)'
    echo '        assignment=$(echo "$assignment" | xargs)'
    echo '        status=$(echo "$status" | xargs)'
    echo ''
    echo '        # Check if assignment matches and status is "not submitted"'
    echo '        if [[ "$assignment" == "$ASSIGNMENT" && "$status" == "not submitted" ]]; then'
    echo '            echo "Reminder: $student has not submitted the $ASSIGNMENT assignment!"'
    echo '        fi'
    echo '    done < <(tail -n +2 "$submissions_file") # Skip the header'
    echo '}'
} >> $dir_name/modules/functions.sh


#Creates assests directory structure
mkdir -p $dir_name/assets
touch $dir_name/assets/submissions.txt

#Populating the submissions.txt file
{
        echo 'student, assignment, submission status'
        echo 'Chinemerem, Shell Navigation, not submitted'
        echo 'Chiagoziem, Git, submitted'
        echo 'Divine, Shell Navigation, not submitted'
        echo 'Anissa, Shell Basics, submitted'
	echo 'Thompson, Git, submitted'
	echo 'Esther, Shell Basics, not submitted'
        echo 'Tochi, Shell Navigation, submitted'
        echo 'Adaeze, Git, submitted'
        echo 'Emeka, Shell Basics, not submitted'
} >> $dir_name/assets/submissions.txt

#Creates config directory structure
mkdir -p $dir_name/config
touch  $dir_name/config/config.env

#Populating the config.env file
{
        echo '# This is the config file'
        echo 'ASSIGNMENT="Shell Navigation"'
        echo 'DAYS_REMAINING=2'
} >> $dir_name/config/config.env

#Creates startup.sh
touch $dir_name/startup.sh
chmod +x $dir_name/startup.sh

#Populating startup.sh
{
echo '#!/bin/bash'

echo 'source ./config/config.env'
echo 'source ./modules/functions.sh'
echo './app/remainder.sh'
} >> $dir_name/startup.sh

echo "Environment sucessful created"
