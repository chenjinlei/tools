#!/bin/bash

### 1. this is a stupid thing I wrote to get myself relax.
### 2. and `fortune` is a very interesting command which here
### I take advantage of.
### 3. I try to let every character out just like I type each out.
###
### NOTE: But it's a bug, even if time interval is small engouth,
### to try to use time random to stimulate, 
###	cause there occur some `discontiunous points` in between those hits.
### `discontiuous points` which I mean here is
### that speed we type is generally a continuous function I guess,
### which in return make this bizarre.

function random()
{
    min=$1;
    max=`$2-$1`;
    num=$(date +%s+%N);
    ((retnum=num%max+min));

    echo $retnum;
}

while true
do
    str=`fortune`
    #echo $str
    for (( i = 0; i < ${#str}; ++ i ))
    do
        #printf "%c" "${str:$i:1}"
        echo -n "${str:$i:1}"
        #sleep $(random 1 5);
        tm=`awk 'BEGIN{srand();printf "%.2f\n",rand()}'`
        sleep "$tm"
        #sleep 0.2
    done
    echo 
    echo
    echo
done
