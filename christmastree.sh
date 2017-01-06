#!/bin/bash
let HALFTWIDTH=$(tput cols)/2
let TERMINALWIDTH=$HALFTWIDTH*2
let TERMINALHEIGHT=$(tput lines)
i=0
TREE=
while [ $i -lt $TERMINALWIDTH ] 
do
	TREE+='-'
	let i+=1
done
BASE=$TREE
BASE=${BASE:0:($HALFTWIDTH-2)}\|--\|${BASE:0:($HALFTWIDTH-2)}
BASE=${BASE//-/' '}
MSSIGN=${TREE:0:($HALFTWIDTH-8)}'MERRY CHRISTMAS!'${TREE:0:($HALFTWIDTH-8)}


if [ $TERMINALWIDTH -lt 16 ] 
then
	# echo Terminal has to be at least 16 columns width
	exit 1
fi

if [ -z $1 ] || [ $1 -lt 5 ]
then
	n=15
else
	n=$1
fi

if [ $n -gt $HALFTWIDTH ] 
then
	exit 1
fi

let MIN_HEIGHT=$n+6
if [ $MIN_HEIGHT -gt $TERMINALHEIGHT ]
then
	# echo Terminal is too short
	exit 1
fi


# CLEAR THAT MESSY TERMINAL
clear

echo
echo "$MSSIGN"
echo

i=0
while [ $i -lt $n ]
do
	TREE=${TREE:0:($HALFTWIDTH-$i-1)}L${TREE:($HALFTWIDTH-$i):(2*$i)}R${TREE:($HALFTWIDTH+$i+1):($HALFTWIDTH-$i-1)}
	let i+=1
	SHOWTREE=${TREE//-/' '}
	SHOWTREE=${SHOWTREE//L/\/}
	SHOWTREE=${SHOWTREE//R/\\}
	echo "$SHOWTREE"
done

echo "$BASE"
echo ${BASE//' '/_}
exit 0
