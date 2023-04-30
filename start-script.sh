#!/bin/bash

if [[ -z "$APP" ]]
then
        printf "The environment variable APP does not exist.\n"
        exit 1
else

    pid=$( jps | grep $APP | awk '{print $1}' )
    printf "$APP pid = $pid.\n"

    printf "Try to kill $APP pid = $pid.\n"
    kill $pid
    printf "$APP pid = $pid was killed.\n"

    sleep 3
    printf "Start $APP with 'nohup' command.\n"
    nohup mvn clean package -DskipTests spring-boot:run > log &

    printf "Please, 'tail -f log' for log output.\n"
fi
exit 1