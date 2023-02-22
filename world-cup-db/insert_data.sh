#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $WINNER != "winner" ]]
  then
    team_id=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    if [[ -z $team_id ]]
    then
      INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
    fi 
  fi
done
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $OPPONENT != "opponent" ]]
  then
    team_id=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'") 
    if [[ -z $team_id ]]
    then
      INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
    fi 
  fi
done

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $YEAR != "year" ]]
  then
    game_id="$($PSQL "SELECT game_id FROM games WHERE round='$ROUND' AND year='$YEAR' AND winner_id='$($PSQL"SELECT team_id from teams where name='$WINNER'")'")"
    if [[ -z $game_id ]]
    then
      winner_id="$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")"
      opponent_id="$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")"

      INSERT_GAME_RESULT="$($PSQL "INSERT INTO games(year,round,winner_goals,opponent_goals,winner_id,opponent_id) VALUES($YEAR,'$ROUND',$WINNER_GOALS,$OPPONENT_GOALS,$winner_id,$opponent_id)")"
    fi 
  fi
done