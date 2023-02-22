#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=worldcup --no-align --tuples-only -c"

# Do not change code above this line. Use the PSQL variable above to query your database.

echo -e "\nTotal number of goals in all games from winning teams:"
echo "$($PSQL "SELECT SUM(winner_goals) FROM games")"

echo -e "\nTotal number of goals in all games from both teams combined:"
echo "$($PSQL "SELECT sum(winner_goals + opponent_goals) from games")"

echo -e "\nAverage number of goals in all games from the winning teams:"
echo "$($PSQL "SELECT AVG(winner_goals)FROM games")"

echo -e "\nAverage number of goals in all games from the winning teams rounded to two decimal places:"
echo "$($PSQL "SELECT round(AVG(winner_goals),2)FROM games")"

echo -e "\nAverage number of goals in all games from both teams:"
echo "$($PSQL "SELECT AVG(winner_goals + opponent_goals) from games")"

echo -e "\nMost goals scored in a single game by one team:"
echo  "$($PSQL "SELECT max(winner_goals) from games")"

echo -e "\nNumber of games where the winning team scored more than two goals:"
echo "$($PSQL "SELECT COUNT(*) FROM games WHERE winner_goals > 2")"

echo -e "\nWinner of the 2018 tournament team name:"
echo "$($PSQL "SELECT name from teams where team_id = (SELECT winner_id from games where year='2018' AND round = 'Final')")"

echo -e "\nList of teams who played in the 2014 'Eighth-Final' round:"
echo  "$($PSQL"SELECT name from teams left join games on teams.team_id=games.winner_id  where round='Eighth-Final' AND year='2014' union select name from teams left join games on teams.team_id=games.opponent_id where round='Eighth-Final' AND year='2014' order by name")"

echo -e "\nList of unique winning team names in the whole data set:"
echo "$($PSQL "SELECT distinct(name) from teams left join games on teams.team_id=games.winner_id where winner_id IS NOT NULL order by name")"

echo -e "\nYear and team name of all the champions:"
echo "$($PSQL "SELECT year,name from teams left join games on teams.team_id=games.winner_id where round='Final' AND winner_id IS NOT NULL order by year")"

echo -e "\nList of teams that start with 'Co':"
echo "$($PSQL "SELECT name from teams where name LIKE 'Co%'")"