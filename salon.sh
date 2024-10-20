#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"

echo -e "Welcome to My Salon, how can I help you?\n"
MAIN_MENU() {
  echo -e "1) cut\n2) color\n3) perm\n4) style\n5) trim"
  read SERVICE_ID_SELECTED
  case $SERVICE_ID_SELECTED in
  1) CUT_FUNCTION ;;
  2) COLOR_FUNCTION ;;
  3) PERM_FUNCTION ;;
  4) STYLE_FUNCTION ;;
  5) TRIM_FUNCTION ;;
  *) RETRY_FUNCTION ;;
  esac
}

CUT_FUNCTION()
{
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers where phone = '$CUSTOMER_PHONE'")

  if [[ -z $CUSTOMER_ID ]]
  then
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
    echo -e "\nWhat time would you like your cut, $CUSTOMER_NAME?"
    read SERVICE_TIME
    INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, 1, '$SERVICE_TIME')")
    UPDATE_CUSTOMER_APPOINTMENT_RESULT=$($PSQL "UPDATE customers SET service_id = 1 WHERE customer_id = $CUSTOMER_ID")
    echo -e "\nI have put you down for a cut at $SERVICE_TIME, $CUSTOMER_NAME."
  else
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE customer_id = $CUSTOMER_ID")
    echo -e "\nWhat time would you like your cut,$CUSTOMER_NAME?"
    read SERVICE_TIME
    INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, 1, '$SERVICE_TIME')")
    UPDATE_CUSTOMER_APPOINTMENT_RESULT=$($PSQL "UPDATE customers SET service_id = 1 WHERE customer_id = $CUSTOMER_ID")
    echo -e "\nI have put you down for a color at $SERVICE_TIME,$CUSTOMER_NAME."
  fi
}

COLOR_FUNCTION()
{
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers where phone = '$CUSTOMER_PHONE'")

  if [[ -z $CUSTOMER_ID ]]
  then
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
    echo -e "What time would you like your color, $CUSTOMER_NAME?"
    read SERVICE_TIME
    INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, 2, '$SERVICE_TIME')")
    UPDATE_CUSTOMER_APPOINTMENT_RESULT=$($PSQL "UPDATE customers SET service_id = 2 WHERE customer_id = $CUSTOMER_ID")
    echo -e "\nI have put you down for a cut at $SERVICE_TIME,$CUSTOMER_NAME."
  else
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE customer_id = $CUSTOMER_ID")
    echo -e "\nWhat time would you like your color,$CUSTOMER_NAME?"
    read SERVICE_TIME
    INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, 2, '$SERVICE_TIME')")
    UPDATE_CUSTOMER_APPOINTMENT_RESULT=$($PSQL "UPDATE customers SET service_id = 2 WHERE customer_id = $CUSTOMER_ID")
    echo -e "\nI have put you down for a color at $SERVICE_TIME,$CUSTOMER_NAME."
  fi
}

PERM_FUNCTION()
{
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers where phone = '$CUSTOMER_PHONE'")

  if [[ -z $CUSTOMER_ID ]]
  then
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
    echo -e "\nWhat time would you like your perm, $CUSTOMER_NAME?"
    read SERVICE_TIME
    INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, 3, '$SERVICE_TIME')")
    UPDATE_CUSTOMER_APPOINTMENT_RESULT=$($PSQL "UPDATE customers SET service_id = 3 WHERE customer_id = $CUSTOMER_ID")
    echo -e "\nI have put you down for a perm at $SERVICE_TIME,$CUSTOMER_NAME."
  else
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE customer_id = $CUSTOMER_ID")
    echo -e "\nWhat time would you like your color,$CUSTOMER_NAME?"
    read SERVICE_TIME
    INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, 3, '$SERVICE_TIME')")
    UPDATE_CUSTOMER_APPOINTMENT_RESULT=$($PSQL "UPDATE customers SET service_id = 3 WHERE customer_id = $CUSTOMER_ID")
    echo -e "\nI have put you down for a perm at $SERVICE_TIME,$CUSTOMER_NAME."
  fi
}

STYLE_FUNCTION()
{
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers where phone = '$CUSTOMER_PHONE'")

  if [[ -z $CUSTOMER_ID ]]
  then
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
    echo -e "\nWhat time would you like your style, $CUSTOMER_NAME?"
    read SERVICE_TIME
    INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, 4, '$SERVICE_TIME')")
    UPDATE_CUSTOMER_APPOINTMENT_RESULT=$($PSQL "UPDATE customers SET service_id = 4 WHERE customer_id = $CUSTOMER_ID")
    echo -e "\nI have put you down for a style at $SERVICE_TIME,$CUSTOMER_NAME."
  else
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE customer_id = $CUSTOMER_ID")
    echo -e "\nWhat time would you like your style,$CUSTOMER_NAME?"
    read SERVICE_TIME
    INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, 4, '$SERVICE_TIME')")
    UPDATE_CUSTOMER_APPOINTMENT_RESULT=$($PSQL "UPDATE customers SET service_id = 4 WHERE customer_id = $CUSTOMER_ID")
    echo -e "\nI have put you down for a style at $SERVICE_TIME,$CUSTOMER_NAME."
  fi
}

TRIM_FUNCTION()
{
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers where phone = '$CUSTOMER_PHONE'")

  if [[ -z $CUSTOMER_ID ]]
  then
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
    echo -e "\nWhat time would you like your trim, $CUSTOMER_NAME?"
    read SERVICE_TIME
    CUSTOMER
    INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, 5, '$SERVICE_TIME')")
    UPDATE_CUSTOMER_APPOINTMENT_RESULT=$($PSQL "UPDATE customers SET service_id = 5 WHERE customer_id = $CUSTOMER_ID")
    echo -e "\nI have put you down for a trim at $SERVICE_TIME,$CUSTOMER_NAME."
  else
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE customer_id = $CUSTOMER_ID")
    echo -e "\nWhat time would you like your trim,$CUSTOMER_NAME?"
    read SERVICE_TIME
    INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, 5, '$SERVICE_TIME')")
    UPDATE_CUSTOMER_APPOINTMENT_RESULT=$($PSQL "UPDATE customers SET service_id = 5 WHERE customer_id = $CUSTOMER_ID")
    echo -e "\nI have put you down for a trim at $SERVICE_TIME,$CUSTOMER_NAME."
  fi
}

RETRY_FUNCTION()
{
  echo -e "\nI could not find that service. What would you like today?"
  MAIN_MENU
}
MAIN_MENU
