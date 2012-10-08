awk '

BEGIN {
	FS= "[[:blank:]:]"
	RESULT= "today_rpt3"
	SORT_RESULT= "sort -k 1 >> today_rpt3" 
	"date" | getline
	print "Today is",$2, $3 >> RESULT
	print "==============================="  >> RESULT
	print "ID Number Arrival Time" >> RESULT
	close(RESULT)
	print RESULT
	print SORT_RESULT

}	

{
	arrival = HM2M($2, $3)
	printf("%s %s:%s %s\n", $1, $2, $3, (arrival>480?"*":"")) | SORT_RESULT
        total += arrival
}

END{
	close(RESULT)
	close(SORT_RESULT)
	printf("Average arrival time : %d:%d\n", total/NR/60, (total/NR) % 60) >> RESULT
}


function HM2M(hour,min){
	return hour * 60 + min
}

' $*
