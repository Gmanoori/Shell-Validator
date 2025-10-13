#!/bin/bash

# Function to run a single test case
run_test_case() {
    local exercise_number=$1
    local script_name=$2
    local test_case_number=$3

    # Paths
    local input_file="inp/input${exercise_number}.txt"
    local expected_output="originalSolution/solution${exercise_number}.txt"
    local user_output="userSolution/solution${exercise_number}.txt"

    # Pass exercise number and script name to the grader
    ./INIT.sh "$exercise_number" "$script_name"

    # Check the result
    if diff -q "$user_output" "$expected_output" > /dev/null; then
        echo "Test Case $test_case_number for Exercise $exercise_number: PASSED"
    else
        echo "Test Case $test_case_number for Exercise $exercise_number: FAILED"
        echo "Differences:"
        diff "$user_output" "$expected_output"
    fi
}

# Run all test cases
main() {
    local exercises=9
    local test_cases=3

    for exercise_number in $(seq 1 $exercises); do
        for test_case_number in $(seq 1 $test_cases); do
            echo "Running Test Case $test_case_number for Exercise $exercise_number..."
            run_test_case "$exercise_number" "exercise${exercise_number}" "$test_case_number"
        done
    done
}

main
