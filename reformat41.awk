#!/bin/sh
awk '

BEGIN {
	SYS_SORT="sort -k 1 >> today_rpt41"
	RESULT="today_rpt41"
	FS="[[:blank:]:]+"	
	"date" | getline
	print "Today is ", $2, $3 > RESULT
	print "==================================" >> RESULT
	print "ID Number Arrival Time" >> RESULT
	close(RESULT)

	LATE_FILE=$2"late.dat"
	while((getline < LATE_FILE) > 0) cnt[$1]+=$2
	close(LATE_FILE)	
	
	print RESULT
	print SYS_SORT
	print LATE_FILE
}

{
	arrival=HM2M($2, $3)
	if(arrival > 480){
		mark = "*"
		cnt[$1]++
	}else{
		mark = ""
	}	
	
	msg = cnt[$1] > 0 ? cnt[$1]" times" : ""
	printf("%-10s %2d:%2d %5s %s\n", $1, $2, $3, mark, msg) | SYS_SORT
	total+=arrival
}
	
END{
	close(RESULT)
	close(SYS_SORT)
	printf("Average Arrival Time : %d:%d\n", total/NR/60, (total/NR)%60) >> RESULT
	close(RESULT)	

	for(per in cnt) printf("%-10s %d\n", per, cnt[per]) > LATE_FILE
}

function HM2M(hour, min){
	return hour  * 60 + min
}

' $*
