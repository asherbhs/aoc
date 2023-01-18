#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "year2015/day01.c"

int main(int argc, char ** argv) {
	char * year = argv[1];
	char * day  = argv[2];
	char * part = argv[3];
	char * path = argv[4];

	// load the input
	FILE * input_file = fopen (path, "rb");                    // open file in Read Bytes mode
	fseek(input_file, 0, SEEK_END);                            // go to end of file
	long int input_file_size = ftell(input_file);              // get the position (the length of the file in bytes)
	rewind(input_file);                                        // go back to the start of the file
	char * input = malloc(sizeof(char) * input_file_size + 1); // allocate enough space for all bytes in the file (and a null byte)
	fread(input, 1, input_file_size, input_file);              // read the whole file
	input[input_file_size] = '\0';                             // set the null byte at the end of the input

	if (strcmp(year, "2015") == 0) {
		if (strcmp(day, "01") == 0) {
			if (strcmp(part, "1") == 0)
				printf("%d\n", solve_2015_01_1(input));
			else
				printf("%d\n", solve_2015_01_2(input));
		}
	}

	fclose(input_file);
	free(input);
}