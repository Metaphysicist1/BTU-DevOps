#!/bin/bash

# Generate multiple random passwords with specified length
generate_passwords() {


    local num_passwords=$1
    local length=$2

    for ((i = 1; i <= num_passwords; i++)); do
        tr -dc 'a-zA-Z0-9!@#$%^&*()_+-=[]{}|;:,.<>?/~' </dev/urandom | head -c $length
        echo
    done
}

# Main execution
generate_passwords "$@"