#!/bin/bash

# Step 1
file="passwords.txt"
if [ ! -f "$file" ]; then
  touch "$file"
fi