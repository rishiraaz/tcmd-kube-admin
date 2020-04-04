#!/bin/bash

if [ "$1" = "on" ] || [ -z $1 ] ; then
  echo Creating demo deployment.
  kubectl -n default create deploy demo --image=nginx
fi

if [ "$1" = "off" ] ; then
  echo Deleting demo deployment.
  kubectl -n default delete deploy demo
fi

NUMBER=$1
if [ "$NUMBER" = "one" ]; then export NUMBER=1; fi
if [ "$NUMBER" = "to" ]; then export NUMBER=2; fi
if [ "$NUMBER" = "too" ]; then export NUMBER=2; fi
if [ "$NUMBER" = "two" ]; then export NUMBER=2; fi
if [ "$NUMBER" = "three" ]; then export NUMBER=3; fi
if [ "$NUMBER" = "four" ]; then export NUMBER=4; fi
if [ "$NUMBER" = "five" ]; then export NUMBER=5; fi
if [ "$NUMBER" = "six" ]; then export NUMBER=6; fi
if [ "$NUMBER" = "seven" ]; then export NUMBER=7; fi
if [ "$NUMBER" = "eight" ]; then export NUMBER=8; fi
if [ "$NUMBER" = "nine" ]; then export NUMBER=9; fi
if [ "$NUMBER" = "ten" ]; then export NUMBER=10; fi
RE='^[0-9]+$'
if [ $NUMBER=~$RE ] ; then
   echo Scaling demo deployment to $NUMBER pods.
   kubectl -n default scale --replicas=$NUMBER deployment demo
fi
