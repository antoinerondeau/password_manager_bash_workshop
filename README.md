# Workshop - Create a password manager in bash

In this workshop, you will learn how to create a bash script that allows you to securely manage and store passwords. By the end of this workshop, you will have a script that can add, list, update, and delete passwords using encryption. This script will serve as a great starting point for your own password management tool and will help you understand how to work with bash, encryption, and file manipulation. So, let's get started!

## 1. File manipulation

### Objective

Create a bash script that will create a passwords file that will be used to store encrypted passwords.
```
"passwords.txt"
```

!!! use the touch command

## 2. Adding passwords to our file

### Objective

Create a "add_password" function to add a new encrypted password to the passwords list.
The function will ask the user to enter a service, then the password

```bash
add_password() {

}
```
```shell
Example :

$ Enter the service name : twitter
$ Enter the password : twitter
# enter the encryption password
$ Password succesfully added.
```
You should have something like this in passwords.txt
```
twitter:U2FsdGVkX1+1XMP7UFv6iNISTykXg0sEJbVgLa0n708=
```

!!! use read for user inputs !
!!! use openssl to encrypt your password !

## 3. List passwords

### Objective

Create a function "list_passwords" that lists the passwords of a specific service.

```bash
list_passwords() {

}
```

```shell
Example:

$ Passwords for the service : twitter
# you will have to enter the encryption password
$ Password for twitter is : twitter
```

!!! Find the services you need in the file with "grep" !
!!! Decrypt the password with openssl !

## 4. Delete password

### Objective

Create a function "delete_password" that will delete line of the specified service.

```bash
delete_password() {

}
```
```shell
Example:

$ Enter the name of the service : twitter
$ Password succesfully deleted.
```
The passwords.txt file should now have no line with twitter in it.
```
blabla:U2FsdGVkX1+1XMP7UFv6iNISTykXg0sEJbVgLa0n708=
fufu:U2FsdGVkX1+1XMP56Fv6iNISTykXg0sEJbVgLa0n708=
```

!!! Check out "sed"

## 5. Better user interface

### Objective

Now that we have some functions to play with, instead of executing the bash file each time we need to use a function, let's make a better user interface !

```bash
Example:

$ 1. Add a password.
$ 2. List passwords for a service.
$ 3. Delete passwords from a service.
$ 4. Quit.
$ Choose an option : 2
$ Passwords for the service : twitter
# you will have to enter the encryption password
$ Password for twitter is : twitter

$ 1. Add a password.
$ 2. List passwords for a service.
$ 3. Delete passwords from a service.
$ 4. Quit.
$ Choose an option : 1
$ Enter the service name : twitter
$ Enter the password : twitter
# enter the encryption password
$ Password succesfully added.

$ 1. Add a password.
$ 2. List passwords for a service.
$ 3. Delete passwords from a service.
$ 4. Quit.
$ Choose an option : 4
$
```

!!!N Check out "case"

## 6. Generate a random password

### Objective

Create a function "generate_password" that generates a random password for a service.

```bash
Example:

$ How long do you want your password to be : 12
$ Enter the service : ignister
# you will have to enter your encryption password
$ Password for ignister is : oKguDsMARFPn
```

You will now have in your passwords.txt file :
```
ignister:U2FsdGVkX18OTgWje6D5VhuYPxjwBnSAcrbObO42Krc=
```
!!! Look how to generate a random password with openssl !
!!! Don't forget to add this function to the user interface !

## 7. Update password

### Objective

Create a function "update_password" that will allow the user to update a password from a service.

```bash
Example:

$ Enter the service : ignister
# you will have to enter your encryption password
$ Enter the new password (current : oKguDsMARFPn) : aimeetyou
# you will have to enter a new encryption password
$ Password succesfully updated.
```


## 8. Bonus

Well done for completing the workshop ! Here are some ideas you might want to add to this project :
- Add an option to see all the decrypted passwords
- Add an option to list all the passwords that are weak
- Add an option that replaces all the weak passwords by strong ones with the newest security norms

