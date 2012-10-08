BEGIN{
	x = 35
	y = 45
	test_var(x)
	printf("Return to main : arg1=%d, x=%d, y=%d, z=%d\n", arg1, x, y, z)
}

function test_var(arg1){
	arg1++
	y++
	z = 55
	printf("Inside the function arg1=%d, x=%d, y=%d, z=%d\n", arg1, x, y, z)
}
