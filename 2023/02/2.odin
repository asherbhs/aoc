package main

import "core:fmt"
import "core:os"
import "core:strconv"
import "core:strings"

main :: proc() {
	input_bytes, ok := os.read_entire_file("input.txt")
	if !ok { panic("could not read input") }
	input := string(input_bytes)

	red   := 0
	green := 0
	blue  := 0
	line  := 1
	part1 := 0
	part2 := 0
	i     := 0
	for {
		// skip to start of first number
		for ; input[i] != ':'; i += 1 {}
		i += 2

		// parse all sets
		for {
			// parse set
			for {
				// parse number
				n_start := i
				for '0' <= input[i] && input[i] <= '9' { i += 1 }
				n, ok := strconv.parse_int(input[n_start:i])
				if !ok { panic(strings.concatenate({"couldn't parse ", input[n_start:i]})) }

				// find colour
				i += 1
				switch input[i] {
				case 'r':
					red = max(red, n)
					i += 3
				case 'g':
					green = max(green, n)
					i += 5
				case 'b':
					blue = max(blue, n)
					i += 4
				}

				// if there isn't another number, break
				if input[i] != ',' { break }
				i += 2
			}
			if input[i] == '\n' { break }
			i += 2
		}
		if red <= 12 && green <= 13 && blue <= 14 { part1 += line }
		part2 += red * green * blue
		red, green, blue = 0, 0, 0
		i += 1
		if i == len(input) {
			fmt.println(part1)
			fmt.println(part2)
			break
		}
		line += 1
	}
}
