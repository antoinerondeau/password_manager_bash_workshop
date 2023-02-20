#!/bin/bash

# Step 1
file="passwords.txt"
if [ ! -f "$file" ]; then
  touch "$file"
fi

# Step 2
add_password() {
  read -p "Enter the service name : " service
  read -p "Entrez the password : " password
  encrypted_password=$(echo "$password" | openssl enc -aes-256-cbc -a -pbkdf2)
  echo "$service:$encrypted_password" >> "$file"
  echo "Password succesfully added."
}