{for(i = 2; i <= NF; i++) {Number[$i]++}}
END {for(course in Number){printf("%-10s %2d\n",course, Number[course])}}
