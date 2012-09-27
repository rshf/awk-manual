BEGIN{
	"date" | getline
	print("Today is",$2,$3) > "today_rpt2"
	print("======================") > "today_rpt2"
	print("ID Number Arrival Time") > "today_rpt2"
	close("today_rpt2")
}
{printf("%s %s\n", $1, $2) | "sort -k 1 >> today_rpt2"}
