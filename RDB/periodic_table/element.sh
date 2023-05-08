if [[ ! $1 ]]
then
echo Please provide an element as an argument.
else
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align --csv -c"
if [[ $1 =~ ^[0-9]+$ ]]
then
condition="atomic_number=$1"
else
condition="symbol='$1' OR name='$1'"
fi
IFS=',' read z name symbol type u melting boiling <<<$($PSQL "SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE $condition")
if [[ $z ]]
then
echo "The element with atomic number $z is $name ($symbol). It's a $type, with a mass of $u amu. $name has a melting point of $melting celsius and a boiling point of $boiling celsius." 
else
echo "I could not find that element in the database."
fi
fi
