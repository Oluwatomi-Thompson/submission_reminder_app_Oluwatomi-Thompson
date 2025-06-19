# Submission Reminder App

This is a shell-based project that helps remind students that have not submitted thier assignments.


#Project Description

The Submissio Remainder App is a command-line based tool that was built to :
- Organize important files in a directory
- Display a list of students who have not submittes their assignments
- Allow assignment name to be changed using the copilot script

## Installation

To get started woth the Submission Reminder App, run this in your terminal:

```bash
git clone https://github.com/Oluwatomi-Thompson/submission_reminder_app_Oluwatomi-Thompson.git
cd submission_reminder_app_Oluwatomi-Thompson
```

Then run this command

```bash
bash create_envirnment.sh
```

You will then to enter your name, and the script will create thefull app directory structure for you with your name

## Usage
After the environemt is created, navigate into the newly created directory and run:

```bash
./startup.sh
```

This will load the current assignment due date from the .config/env file and Display a reminder for the students who haven't submitted their assignment.

To change the assigment being tracked run:

```bash
bash copilot_shell_script.sh
```

After that, enter the new assignment name when asked and the app will change the config flle and recheck for non-submissions.

## Contributors

Developed by: Oluwatomi Thompson
Course: Introduction to linux and it tools

## License
Pull requests are welcome. For major changes, please open an issue first
to discuss what you would like to change.

Please make sure to update tests as appropriate.

[MIT](https://choosealicense.com/licenses/mit/)
