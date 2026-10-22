#!/bin/bash

# This script will perform basic addition, subtraction, multiplication and division of two user input numbers
# It will also handle division by zero and display an appropriate message.

#set -ux

echo "Please enter the first number:" # Prompt the user to enter the first number
read number1                          # Read the first number from user input and store it in the variable 'number1'
echo "Please enter the second number:" # Prompt the user to enter the second number
read number2               # Read the second number from user input and store it in the variable 'number2'

Addition=$((number1 + number2)) # adds both numbers and stores the result in the variable 'Addition'

Subtraction=$((number1 - number2)) # subtracts the second number from the first and stores the result in the variable 'Subtraction'

Multiplication=$((number1 * number2)) # multiplies both numbers and stores the result in the variable 'Multiplication'

if [ "$number2" -ne 0 ]; then # if number2 is not equal to zero then perform division 
    Division=$(echo "scale=2; $number1 / $number2" | bc) # divides the first number by the second and stores the result in the variable 'Division'
   
else #if number2 is equal to zero then display an error message and set Division to undefined
    echo "Division by zero is not allowed."
    Division="undefined"
fi
# display the results of the calculations
echo "Results:" 
echo "$number1 + $number2 = $Addition" 
echo "$number1 - $number2 = $Subtraction" 
echo "$number1 * $number2 = $Multiplication" 
echo "$number1 / $number2 = $Division"
