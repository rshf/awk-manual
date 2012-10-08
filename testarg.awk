awk '

BEGIN{
	number=ARGC
	ARGC=1
	for(i =0 ;i < number; i++){
		print ARGV[i]
	}
}

{
	print $1
}

'
