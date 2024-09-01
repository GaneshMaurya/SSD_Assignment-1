#!/bin/bash

# b
length=$(( 12 + $RANDOM % 3 ))

declare -A freqMap
freqMap=(["0"]="3" ["1"]="3" ["2"]="3" ["4"]="3" ["5"]="3" ["6"]="3" ["7"]="3" ["8"]="3" ["9"]="3")

accountNumber=""
# Initial String gen
for (( i=1; i<=$length; i++ ));
do
    x=$(( $RANDOM % 10 ))
    while (( freqMap["$x"] <= 0 ));
    do
        x=$(( $RANDOM % 10 ))
    done

    freqMap["$x"]=$((freqMap["$x"]-1))
    accountNumber+=$x
done

# for i in "${!freqMap[@]}"; do
#     echo "$i: ${freqMap[$i]}"
# done

# echo "Old : $accountNumber"

# Checking
chars=($(echo "$accountNumber" | grep -o .))
if [[ ${chars[0]} == 0 ]];
then
    freqMap["${chars["0"]}"]=$((freqMap["${chars["0"]}"]+1))
    x=$(( $RANDOM % 10 ))
    while (( freqMap["$x"] <= 0 ));
    do
        x=$(( $RANDOM % 10 ))
    done
    chars[0]=$x
    freqMap["$x"]=$((freqMap["$x"]-1))
fi

prev=${chars[0]}
curr=${chars[1]}

for (( i=2; i<$length; i++ ));
do
    sum=$((prev + curr))

    if [[ $sum == ${chars[$i]} ]];
    then
        freqMap["${chars[$i]}"]=$((freqMap["${chars[$i]}"]+1))
        x=$(( $RANDOM % 10 ))
        while (( freqMap["$x"] <= 0 && $sum == ${chars[$i]} ));
        do
            x=$(( $RANDOM % 10 ))
        done
        chars[$i]=$x
        freqMap["$x"]=$((freqMap["$x"]-1))
    fi

    prev=$curr
    curr=${chars[$i]}
done

# for i in "${!freqMap[@]}"; do
#     echo "$i: ${freqMap[$i]}"
# done

newAccountNumber=""
for (( i=0; i<$length; i++ ));
do
    newAccountNumber+=${chars[$i]}
done

echo "Account Number : $newAccountNumber"