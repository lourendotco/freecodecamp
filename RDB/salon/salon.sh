#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=salon --tuples-only --no-align --csv --quiet -c"

MENU() {
if [[ ! $1 ]]
then
echo -e "\nWelcome to the salon, which service would you like to use?"
else
echo -e "\n$1 Would you like to book a service?"
fi
while IFS=',' read number name
do
echo "$number) $name"
options+=("$number")
options_names+=("$name")
done < <(echo "$($PSQL "SELECT * FROM services")")
read SERVICE_ID_SELECTED
for i in "${!options[@]}"; do
   if [[ "${options[$i]}" = "${SERVICE_ID_SELECTED}" ]]; then
       SERVICE_NAME_SELECTED=${options_names[i]}
       break
   fi
done
if [[ ! $SERVICE_NAME_SELECTED ]]; then
MENU "I didn't recognize your choice."
else
echo -e "\nSure, let's book you a $SERVICE_NAME_SELECTED!\nWhat's your phone number?"
read CUSTOMER_PHONE
IFS=',' read CUSTOMER_NAME CUSTOMER_ID <<<$($PSQL "SELECT name, customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
if [[ -z $CUSTOMER_NAME ]]; then
echo -e "\nI don't recognize your number. I'll create a new record for you.\nWhat's your name?"
read CUSTOMER_NAME
CUSTOMER_ID=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE') RETURNING customer_id")
fi
echo -e "\nAt what time would you like your $SERVICE_NAME_SELECTED, $CUSTOMER_NAME?"
read SERVICE_TIME
$PSQL "INSERT INTO appointments(service_id, customer_id, time) VALUES($SERVICE_ID_SELECTED, $CUSTOMER_ID, '$SERVICE_TIME')"
echo "I have put you down for a $SERVICE_NAME_SELECTED at $SERVICE_TIME, $CUSTOMER_NAME."
fi
}

MENU
