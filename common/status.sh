#!/usr/bin/env zsh


status () {
	local message=$1
	shift
	RED=$(tput setaf 1)
	GREEN=$(tput setaf 2)
	YELLOW=$(tput setaf 3)
	NORMAL=$(tput sgr0)
	
	local tcol=$(tput cols) # change this to whatever column you want the output to start at
	local col=`expr $tcol - ${#message}`
	printf '%s' "$message"
	"$@" >> /dev/null && printf '%*s%s' $col "[$GREEN  OK  $NORMAL]" || printf '%*s%s' $col "[$RED FAIL $NORMAL]"
	echo ""
}

status_skip () {	
	local message=$1
	shift
	RED=$(tput setaf 1)
	GREEN=$(tput setaf 2)
	YELLOW=$(tput setaf 3)
	NORMAL=$(tput sgr0)
	
	local tcol=$(tput cols) # change this to whatever column you want the output to start at
	local col=`expr $tcol - ${#message}`
	printf '%s' "$message"
	printf '%*s%s' $col "[$YELLOW SKIP $NORMAL]"
	echo ""
}
