#!/bin/bash

mkdir temp_activity
cd temp_activity/

touch temp{1..50}.sh

updateFiles=25
currFile=1
modifyFile() {
    if [[ $currFile -gt $updateFiles ]];
    then
        return;
    fi

    mv temp${currFile}.sh temp${currFile}.txt
    ((currFile++))
    modifyFile
}

modifyFile