#!/bin/bash
#Uncomment the next line to enter debug mode
#set -x

#echo "Enter a number:"
#read user_number

log() {
    echo -e "$(date '+%Y-%m-%d %H:%M:%S') - $1"
}

# Check if command-line arguments are passed
if [ $# -ne 2 ]; then
    echo "Usage: $0 <number> <filename>"
    exit 1
fi

<<com

# Validating the input
if ! [[ "$user_number" =~ ^[0-9]+$ ]]; then
  echo "Invalid input. Please enter a valid number."
  exit 1
fi

|colordiff |diff-highlight
com

user_number=$1

figlet "WELCOME TO BASH CODE GRADER"
echo -e "\nProcessing Inputs..."

# Remove this to automate script for docker(setting pwd)
pwd
cd app
pwd

# Define file names
input="inp/input${user_number}.txt"
description="desc/description${user_number}.txt"
output="out/output${user_number}.txt"

sleep 3

# Display the contents of the files
echo -e "\n"
log "--- Exercise $user_number ---\n"
input_content=$(cat "$input")
log "$input_content\n"
log "--- Task Description for Exercise $user_number ---\n"
desc_content=$(cat "$description")
log "$desc_content\n"
log "--- Sample Output ---\n"
output_content=$(cat "$output")
log "$output_content\n"
log "--- End Of Contents ---\n"

sleep 3

#pwd
# Read File Name
#log "Enter Your Filename:"
#read name
name=$2
#cd scr
chmod +x $name.sh
#Run the script and place the output in a file.
if [[ $user_number -le 7 ]];
then
log "first"
./$name.sh $(cat $input) | cat > userSolution/solution$user_number.txt
else
log "second"
#./$name.sh $(cat $input) | cat > userSolution/solution$user_number.txt
fi

character_difference=$(diff -u -i userSolution/solution$user_number.txt $output| wc -c )
#character_difference=$(diff -u userSolution/solution$user_number.txt originalSolution/solution$user_number.txt | colordiff | diff-highlight | wc -c)
output_difference=$(diff -i userSolution/solution$user_number.txt $output)


if [[ character_difference -eq 0 ]];
then
log "Correct Solution. Good Job."
log "Run The Script Again To Try Another Task.\n"
# Add ./test_case.sh here
./test_case.sh "$user_number" "$name"
else
log "Wrong Solution. Try Again."
log "Your Output:"
YOutput=$(cat "userSolution/solution$user_number.txt")
log "$YOutput"
log "Expected Output:"
EOutput=$(cat $output)
log "$EOutput"
log "$output_difference"
fi   