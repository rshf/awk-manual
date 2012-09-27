BEGIN {
	while("who" | getline) n++
	print(n)
}
