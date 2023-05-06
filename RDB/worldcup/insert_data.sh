#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
$PSQL "TRUNCATE games, teams"
cat games.csv | while IFS=',' read year round winner opponent wgoals ogoals
do
  if [[ $year != year ]]
  then
    #is winner there
    winner_id=$($PSQL "SELECT team_id FROM teams WHERE name='$winner'")
    #if not there
    if [[ -z $winner_id ]]
    then
    #insert and getid
    { read -r winner_id ; } < <($PSQL "INSERT INTO teams(name) VALUES('$winner') RETURNING team_id")
    fi
    opponent_id=$($PSQL "SELECT team_id FROM teams WHERE name='$opponent'")
    #is opponent there
    #if not there
    if [[ -z $opponent_id ]]
    then
    #insert and getid
    { read -r opponent_id ; } < <($PSQL "INSERT INTO teams(name) VALUES('$opponent') RETURNING team_id")
    fi
    #insert game
    $PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($year, '$round', $winner_id, $opponent_id, $wgoals, $ogoals)"
  fi
done
