{for(i = 2; i <= NF; i++) Number[$i]++ }
END {for(course in Number) printf("%-10s %d \n", course, Number[course]) | "sort -k 2"}
