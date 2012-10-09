awk '

BEGIN{	
	while(getline < ARGV[1]){
		English[++n]=$1
		Chinese[n]=$2
	}
	ARGV[1]="-"
	srand()
	question()
}

{
	if($1 != English[ind]){
		print "Try Agagin!", $1, English[ind]
	}else{
		print "\nYou area right!! Please Enter to Chinese--"
		getline
		question()
	}
}

function question(){
	ind = int(rand() * n) + 1
	##system("clear")
	
	print ind
	for(c in Chinese) print Chinese[c]
	for(e in English) print English[e]	
	
	print "Press \"Ctl-d\" to exit"
	printf("\n%s", Chinese[ind]" English is : ")

}

' $*
