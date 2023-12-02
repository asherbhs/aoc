package year2023day02

import "core:strconv"
import "core:fmt"
import "core:strings"

solve_part_1 :: proc(input: string) -> int {
	red   := 0
	green := 0
	blue  := 0
	line  := 1
	sum   := 0
	// for each line
	for i := 0; i < len(input); {
		// skip to start of first number
		for ; input[i] != ':'; i += 1 {}
		i += 2

		// parse all sets
		for {
			// parse set
			for {
				// parse number
				n_start := i
				for ; '0' <= input[i] && input[i] <= '9'; i += 1 {}
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
		if red <= 12 && green <= 13 && blue <= 14 { sum += line }
		red, green, blue = 0, 0, 0
		line += 1
		i += 1
	}
	return sum
}

solve_part_2 :: proc(input: string) -> int {
	red   := 0
	green := 0
	blue  := 0
	line  := 1
	sum   := 0
	// for each line
	for i := 0; i < len(input); {
		// skip to start of first number
		for ; input[i] != ':'; i += 1 {}
		i += 2

		// parse all sets
		for {
			// parse set
			for {
				// parse number
				n_start := i
				for ; '0' <= input[i] && input[i] <= '9'; i += 1 {}
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
		sum += red * blue * green
		red, green, blue = 0, 0, 0
		line += 1
		i += 1
	}
	return sum
}
