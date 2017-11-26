#!/usr/bin/env bash
PARENT='~/.i3/select_screen'


echo "laptop mode"
echo "external mode"
echo "laptop+external mode"

if [ -n "$@" ]
then
    if [ "$@" = "laptop mode" ]
    then
	echo $PARENT$" laptop" | sh

    fi
    
    if  [ "$@" = "external mode" ]
    then
	echo $PARENT$" external" | sh
    fi
    
    if [ "$@" = "laptop+external mode" ]
    then
	echo $PARENT$" both" | sh

    fi
   
fi
