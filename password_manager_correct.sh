#!/bin/bash

# Step 1
file="passwords.txt"
if [ ! -f "$file" ]; then
  touch "$file"
fi

# Step 2
add_password() {
  read -p "Enter the service name : " service
  read -p "Enter the password : " password
  encrypted_password=$(echo "$password" | openssl enc -aes-256-cbc -a -pbkdf2)
  echo "$service:$encrypted_password" >> "$file"
  echo "Password succesfully added."
}

# Step 3
list_passwords() {
  read -p "Passwords for the service :" service
  lines=$(grep "$service" $file)
  while read line; do
    username=$(echo "$line" | cut -d ":" -f1)
    encrypted_password=$(echo "$line" | cut -d ":" -f2)
    password=$(echo "$encrypted_password" | openssl enc -d -aes-256-cbc -a -pbkdf2)
    echo "password for $username is : $password"
  done <<< "$lines"
}