BEGIN {

	while("who" | getline){
		count++
	}
	
	print count
}
