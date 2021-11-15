#!/bin/bash


#This is the declaration first query that will be run after we access the MySQL environment. It will allow us to automatically access the 'hypercars' database:

mainquery="USE hypercars;" 


#The output prompts for the user to input details are the following:
echo Hi, please input your First Name and press ENTER...
read FirstName

echo Please input your last Name and press ENTER...
read LastName

echo Please input your ID number and press ENTER...
read ID

echo PLease input your Email and press ENTER...
read Email

echo Please input your phone number and press ENTER...
read Phone

echo Please input your purchase amount in USD and press ENTER...
read Amount


#Below is the declaration of the functions that create a tabulated collection of the user's input and save the content in a .csv file:

function Pagani {

        echo -e "$FirstName\t$LastName\t$ID\t$Email\t$Phone\t$Amount" >> Pagani.csv


}

function McLaren {

        echo -e "$FirstName\t$LastName\t$ID\t$Email\t$Phone\t$Amount" >> McLaren.csv


}

function Bugatti {

        echo -e "$FirstName\t$LastName\t$ID\t$Email\t$Phone\t$Amount" >> Bugatti.csv


}

function Koenigsegg {

        echo -e "$FirstName\t$LastName\t$ID\t$Email\t$Phone\t$Amount" >> Koenigsegg.csv


}

function Ferrari {

        echo -e "$FirstName\t$LastName\t$ID\t$Email\t$Phone\t$Amount" >> Ferrari.csv


}


#Below is the declaration of the queries that will be run after we access the 'hypercars' database and will allow the database to fetch the .csv files containing user input.

query1="LOAD DATA LOCAL INFILE '/home/emmanuelmuturia/Documents/Class Notes/Unix For Telecommunications/Bash Scripts/Pagani.csv' INTO TABLE pagani;"
query2="LOAD DATA LOCAL INFILE '/home/emmanuelmuturia/Documents/Class Notes/Unix For Telecommunications/Bash Scripts/McLaren.csv' INTO TABLE mclaren;"
query3="LOAD DATA LOCAL INFILE '/home/emmanuelmuturia/Documents/Class Notes/Unix For Telecommunications/Bash Scripts/Bugatti.csv' INTO TABLE bugatti;"
query4="LOAD DATA LOCAL INFILE '/home/emmanuelmuturia/Documents/Class Notes/Unix For Telecommunications/Bash Scripts/Koenigsegg.csv' INTO TABLE koenigsegg;"
query5="LOAD DATA LOCAL INFILE '/home/emmanuelmuturia/Documents/Class Notes/Unix For Telecommunications/Bash Scripts/Ferrari.csv' INTO TABLE ferrari;"



#After user enters their input, we run them through the following conditional statement to filter invalid input:

if  [[ $FirstName =~ ^[a-zA-Z]+$ ]] && [[ $LastName =~ ^[a-zA-Z]+$ ]] && [[ $ID =~ ^[0-9]+$ ]] && [[ $Phone =~ ^[0-9]+$ ]] && [[ $Amount =~ ^[0-9]+$ ]] ; then


echo "Please choose your car brand below for confirmation of purchase:"

fi


#Below is the sequential execution of the prompts, queries and conditional statements to choose a vehicle (table) in which the user input will be     saved into: 

OPTIONS="Pagani McLaren Bugatti Koenigsegg Ferrari"

select opt in $OPTIONS; do

if [ "$opt" = "Pagani" ]; then
Pagani	
#printf "$FirstName\t$LastName\t$ID\t$Email\t$Phone\t$Amount" >> Pagani.csv	
/usr/bin/mysql --local-infile=1 -u emmanuelmuturia -p << eof
$mainquery
$query1
eof
exit

elif [ "$opt" = "McLaren" ]; then
McLaren	
#printf "$FirstName\t$LastName\t$ID\t$Email\t$Phone\t$Amount" >> McLaren.csv
/usr/bin/mysql --local-infile=1 -u emmanuelmuturia -p << eof
$mainquery
$query2
eof

elif [ "$opt" = "Bugatti" ]; then
Bugatti	
#printf "$FirstName\t$LastName\t$ID\t$Email\t$Phone\t$Amount" >> Bugatti.csv
/usr/bin/mysql --local-infile=1 -u emmanuelmuturia -p << eof
$mainquery
$query3
eof

elif [ "$opt" = "Koenigsegg" ]; then
Koenigsegg	
#printf "$FirstName\t$LastName\t$ID\t$Email\t$Phone\t$Amount" >> Koenigsegg.csv
/usr/bin/mysql --local-infile=1 -u emmanuelmuturia -p << eof
$mainquery
$query4
eof

elif [ "$opt" = "Ferrari" ]; then
Ferrari	
#printf "$FirstName\t$LastName\t$ID\t$Email\t$Phone\t$Amount" >> Ferrari.csv
/usr/bin/mysql --local-infile=1 -u emmanuelmuturia -p << eof
$mainquery
$query5
eof

else
clear
echo bad option
fi


done


            
