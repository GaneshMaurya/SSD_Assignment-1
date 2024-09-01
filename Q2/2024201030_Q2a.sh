#!/bin/bash

# a
specialChars="%&\#\$@()!"
alphabetsLower="abcedfghijklmnopqrstuvwxyz"
alphabetsUpper="ABCDEFGHIJKLMNOPQRSTUVWXYZ"

length=$(( 8 + $RANDOM % 3 ))

a=$(( $RANDOM % 9 ))
b=$(( $RANDOM % 26 ))
c=$(( $RANDOM % 26 ))

password=""
password+=${specialChars:$a:1}
password+=${alphabetsLower:$b:1}
password+=${alphabetsUpper:$c:1}

allPossible="%&\#\$@()!abcedfghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

length=$((length - 3))
for (( i=1; i<=$length; i++ ));
do
    d=$(( $RANDOM % 61 ))
    password+=${allPossible:$d:1}
done

n=$(( length + 3 ))
chars=($(echo $password | fold -w1))

for (( i=0; i<$n; i++ ));
do
    x=$(( $RANDOM % $n ))
    y=$(( $RANDOM % $n ))
    temp=${chars[$x]}
    chars[$x]=${chars[$y]}
    chars[$y]=$temp
done

newPassword=""
for (( i=0; i<$n; i++ ));
do
    newPassword+=${chars[$i]}
done

echo "Password:  $newPassword"