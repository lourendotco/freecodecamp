#! /bin/bash
secret_number=$[RANDOM % 1000 + 1]
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align --csv -q -c"

echo "Enter your username:"
read username
IFS=',' read user_id games_played best_game <<<$($PSQL "SELECT user_id, COUNT(game_id), MIN(guesses) FROM users LEFT JOIN games USING(user_id) GROUP BY user_id HAVING username='$username'")
if [[ $user_id ]]
then
echo "Welcome back, $username! You have played $games_played games, and your best game took $best_game guesses."
else
user_id=$($PSQL "INSERT INTO users(username) VALUES('$username') RETURNING user_id")
echo "Welcome, $username! It looks like this is your first time here."
fi

game(){
echo $1
read guess
((number_of_guesses+=1))
if [[ $guess =~ ^[0-9]+$ ]]
then

if [[ $guess > $secret_number ]]
then
game "It's lower than that, guess again:"
fi
if [[ $guess < $secret_number ]]
then
game "It's higher than that, guess again:"
fi

else
game "That is not an integer, guess again:"
fi
}
game "Guess the secret number between 1 and 1000:"
$($PSQL "INSERT INTO games(user_id, guesses, number) VALUES($user_id, $number_of_guesses, $secret_number)")
echo "You guessed it in $number_of_guesses tries. The secret number was $secret_number. Nice job!"
