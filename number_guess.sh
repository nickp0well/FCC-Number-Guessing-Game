#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=number_guess --tuples-only -c"
RANDOM_NUMBER=$((1+RANDOM%1000))
echo "Enter your username:"
read USERNAME
USERNAME_CHECK=$($PSQL "SELECT user_id FROM number_guess WHERE username = '$USERNAME'")
if [[ -z $USERNAME_CHECK ]]
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  echo "Guess the secret number between 1 and 1000:"
  COUNTER=1
  read GUESS
  if ! [[ $GUESS =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
    ((COUNTER++))
    read GUESS
  fi
  while [ $GUESS -ne $RANDOM_NUMBER ]; do
    if [[ $GUESS -lt $RANDOM_NUMBER ]]
    then
      echo "It's higher than that, guess again:"
      ((COUNTER++))
      read GUESS
      if ! [[ $GUESS =~ ^[0-9]+$ ]]
      then
        echo "That is not an integer, guess again:"
        ((COUNTER++))
        read GUESS
      fi
    fi
    if [[ $GUESS -gt $RANDOM_NUMBER ]]
    then
      echo "It's lower than that, guess again:"
      ((COUNTER++))
      read GUESS
      if ! [[ $GUESS =~ ^[0-9]+$ ]]
      then
        echo "That is not an integer, guess again:"
        ((COUNTER++))
        read GUESS
      fi
    fi
  done
  echo "You guessed it in $COUNTER tries. The secret number was $RANDOM_NUMBER. Nice job!"
  INSERT_DATA=$($PSQL "INSERT INTO number_guess(username, games_played, best_game) VALUES('$USERNAME', 1, $COUNTER)")
else
  DATA=$($PSQL "SELECT * FROM number_guess WHERE username = '$USERNAME'")
  echo $DATA | while read USERNAME BAR GAMES_PLAYED BAR BEST_GAME BAR USER_ID
  do
    echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  done
  echo "Guess the secret number between 1 and 1000:"
  COUNTER=1
  read GUESS
  if ! [[ $GUESS =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
    ((COUNTER++))
    read GUESS
  fi
  while [ $GUESS -ne $RANDOM_NUMBER ]; do
    if [[ $GUESS -lt $RANDOM_NUMBER ]]
    then
      echo "It's higher than that, guess again:"
      ((COUNTER++))
      read GUESS
       if ! [[ $GUESS =~ ^[0-9]+$ ]]
       then
         echo "That is not an integer, guess again:"
         ((COUNTER++))
         read GUESS
      fi
    fi
    if [[ $GUESS -gt $RANDOM_NUMBER ]]
    then
      echo "It's lower than that, guess again:"
      ((COUNTER++))
      read GUESS
       if ! [[ $GUESS =~ ^[0-9]+$ ]]
       then
         echo "That is not an integer, guess again:"
         ((COUNTER++))
         read GUESS
      fi
    fi
  done
  echo "You guessed it in $COUNTER tries. The secret number was $RANDOM_NUMBER. Nice job!"
  USER_GAMES_PLAYED=$($PSQL "SELECT games_played FROM number_guess WHERE username = '$USERNAME'")
  USER_BEST_GAME=$($PSQL "SELECT best_game FROM number_guess WHERE username = '$USERNAME'")
  if [[ $COUNTER -lt $USER_BEST_GAME ]]
  then
    INSERT_BEST_GAME=$($PSQL "UPDATE number_guess SET best_game = $COUNTER WHERE username = '$USERNAME'")
    INSERT_GAMES_PLAYED=$($PSQL "UPDATE number_guess SET games_played = $USER_GAMES_PLAYED + 1 WHERE username = '$USERNAME'")
  else
    INSERT_GAMES_PLAYED=$($PSQL "UPDATE number_guess SET games_played = $USER_GAMES_PLAYED + 1 WHERE username = '$USERNAME'")
  fi
fi
