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

# Step 4
delete_password() {
  read -p "Entrez le nom du service : " service
  sed -i "/$service/d" "$file"
  echo "Mot de passe supprimé avec succès."
}

update_password() {
  read -p "Entrez le nom du service : " service
  encrypted_password=$(grep "$service" "$file" | cut -d ":" -f 2 -pbkdf2)
  password=$(echo "$encrypted_password" | openssl enc -d -aes-256-cbc -a -pbkdf2)
  read -p "Entrez le nouveau mot de passe (actuel : $password) : " password
  encrypted_password=$(echo "$password" | openssl enc -aes-256-cbc -a -pbkdf2)
  sed -i "/$service/c\$service:$encrypted_password" "$file"
  echo "Mot de passe mis à jour avec succès."
}


# Fonction pour générer un mot de passe aléatoire
generate_password() {
  read -p "Entrez la longueur souhaitée du mot de passe : " length
  read -p "Entrez le nom du service : " service
  password=$(openssl rand -base64 48 | cut -c1-$length)
  encrypted_password=$(echo "$password" | openssl enc -aes-256-cbc -a -pbkdf2)
  echo "$service:$encrypted_password" >> $file
  echo "Le mot de passe pour $service est : $password"
}

# Boucle principale
while true; do
  echo "1. Ajouter un mot de passe"
  echo "2. Lister les mots de passe pour un service"
  echo "3. Mettre à jour un mot de passe"
  echo "4. Supprimer un mot de passe"
  echo "5. Générer un mot de passe"
  echo "6. Quitter"
  read -p "Choisissez une option : " option
  case $option in
    1) add_password ;;
    2) list_passwords ;;
    3) update_password ;;
    4) delete_password ;;
    5) generate_password ;;
    6) exit 0 ;;
    *) echo "Option non valide." ;;
  esac
done