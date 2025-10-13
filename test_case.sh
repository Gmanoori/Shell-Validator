#!/bin/bash

#set -x

log() {
    echo -e "$(date '+%Y-%m-%d %H:%M:%S') - $1"
}

user_number=$1
name=$2
test_case_number=1
	
# Pass exercise number and script name to the grader
#./INIT.sh "$user_number" "$name"


exercise=test_cases/exercise$user_number/test_case*

    for exercise_number in $exercise; do
        test_input="$exercise_number/input.txt"
        test_output="$exercise_number/output.txt"
		expected_output="$exercise_number/expected_output.txt"
                        
			./$name.sh $(cat $test_input) | cat > $test_output
			# Checking Output With Expected Output
			difference=$(diff -w -i $test_output $expected_output | wc -c)
			log "Running Test Case $test_case_number"
			if [[ difference -eq 0 ]]; then
			#echo -e "\n"
				log "Test Case $test_case_number: PASSED"
				echo ""
			else
				log "Test Case $test_case_number: FAILED"
				#echo ""
				log "Differences:"
				#echo ""
				diff "$test_output" "$expected_output"
				echo ""
			fi

			
			test_case_number=$((test_case_number+1))
    done
	
	
     <<com
  exercise=9
  test_cases=3

	for test_case_number in $(seq 1 $test_cases); do
	done
	com

#run_test_case "$exercise_number" "$name"
#pwd
<<com
"$exercise_number" "exercise${exercise_number}" "$test_case_number"
| colordiff | diff-highlight 
com
