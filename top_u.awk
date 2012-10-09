awk '
BEGIN{
	FS="[[:blank:]:]"
	RESULT="sort -u -k2b -k1nr |sort -u -k2 |sort -nr  | sed -n 1,50p"
}

##{match($0,/([0-9A-Za-z\.//_:]+[[:blank:]]TIME:[[:digit:]])/)}
{match($0,/( [0-9A-Za-z\.\/]+ TIME:[0-9]+)/)}

RSTART != 0 {
	{content=substr($0, RSTART, RLENGTH)} 
	idxTime = index(content, "TIME")
	time=substr(content,idxTime + 5, length(content) - idxTime - 5)
	class=substr(content,1,idxTime - 2)
	{ printf("%-8d %-s\n",time, class) | RESULT }
}
	
' $*
