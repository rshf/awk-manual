BEGIN {
	print("ID Number Arrival Time") > "today_rpt1"
	print("======================") > "today_rpt1"
}
{printf(" %s %s\n", $1, $2) > "today_rpt1"}

