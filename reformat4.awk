awk '

BEGIN{
	FS = "[[:blank:]:]+"	
	"date" | getline
	LATE_FILE=$2"latefile"
	while( (getline < LATE_FILE) > 0) {
		cnt[$1]+=$2
	}
	close(LATE_FILE)
}

{
	arrival=HM2M($2, $3)
	if(arrival > 480) cnt[$1]++
}

END{
	for(per in cnt) printf("%-10s %d\n", per, cnt[per]) > LATE_FILE
}

function HM2M(hour, min){
	return hour * 60 + min
}

' $*
