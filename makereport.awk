#!/bin/sh
awk '
	
BEGIN{
	FS="\n"
	RS=""
	split("一.二.三.四.五.六.七.八.九",C_NUMBER, ".")
}

{
	printf("\n%s 报告人: %s \n", C_NUMBER[NR],$1)
	for(i = 2; i < NF; i++){
		printf("%d. %s\n",i-1,$i)
	}
}

' $*
