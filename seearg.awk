awk '
	
BEGIN{
	for(i=0 ;i < ARGC; i++) print ARGV[i]
}
' $*
