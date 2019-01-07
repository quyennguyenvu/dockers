#!/bin/bash
echo Wait for servers to be up
sleep 10

HOSTPARAMS="--host db-1 --insecure"
SQL="/cockroach/cockroach.sh sql $HOSTPARAMS"

# $SQL -e "CREATE DATABASE tarun;"
# $SQL -d tarun -e "CREATE TABLE articles(name VARCHAR);"