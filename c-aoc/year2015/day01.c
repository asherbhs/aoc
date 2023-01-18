int solve_2015_01_1(char * input)
{
	int floor = 0;
	while (*input) {
		if (*input == '(') floor++;
		if (*input == ')') floor--;
		input++;
	}
	return floor;
}

int solve_2015_01_2(char * input)
{
	int floor = 0;
	int position = 1;
	while (*input) {
		if (*input == '(') floor++;
		if (*input == ')') floor--;
		if (floor < 0) return position;
		position++;
		input++;
	}
	return -1; // unreachable for valid input
}