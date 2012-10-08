awk '
BEGIN{
	system("date > date.dat")
	getline < "date.dat"
	print "Today is ", $2, $3
	system("rm date.dat")
}' $*
