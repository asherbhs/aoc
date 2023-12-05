package main

import "core:fmt"
import "core:os"
import "core:strconv"

main :: proc() {
	input_bytes, ok := os.read_entire_file("input.txt")
	if !ok { panic("could not read input") }
	input := string(input_bytes)

	// interpret the input as a 2d array
	height := 0
	for c in input { if c == '\n' { height += 1 } }
	width := 0
	for input[width] != '\n' { width += 1 }
	get :: proc(height, width, i, j: int) -> int { return (width + 1) * i + j }
	is_digit  :: proc(c: u8) -> bool { return '0' <= c && c <= '9' }
	is_symbol :: proc(c: u8) -> bool { return c != '.' && !is_digit(c) }
	parse_int :: proc(input: string, height, width, i, j1, j2: int) -> int {
		n, ok := strconv.parse_int(input    \
			[ get(height, width, i, j1) \
			: get(height, width, i, j2) \
			]                           \
		)
		assert(ok)
		return n
	}

	// part 1
	{
		part1 := 0
		i     := 0
		j     := 0
		for {
			if is_digit(input[get(height, width, i, j)]) {
				start := j
				for {
					j += 1
					if j == width { break }
					if !is_digit(input[get(height, width, i, j)]) { break }
				}
				adjacent_to_symbol := false
				if i >= 1 {
					for k in (start >= 1 ? start - 1 : start)..<(j == width ? j : j + 1) {
						if is_symbol(input[get(height, width, i - 1, k)]) {
							adjacent_to_symbol = true
							break
						}
					}
				}
				if start >= 1 { adjacent_to_symbol |= is_symbol(input[get(height, width, i, start - 1)]) }
				if j < width  { adjacent_to_symbol |= is_symbol(input[get(height, width, i, j        )]) }
				if i < height - 1 {
					for k in (start >= 1 ? start - 1 : start)..<(j == width ? j : j + 1) {
						if is_symbol(input[get(height, width, i + 1, k)]) {
							adjacent_to_symbol = true
							break
						}
					}
				}
				if adjacent_to_symbol { part1 += parse_int(input, height, width, i, start, j) }
			} else {
				j += 1
			}
			if j == width {
				j = 0
				i += 1
				if i == height { break }
			}
		}
		fmt.println(part1)
	}

	// part 2
	{
		part2 := 0
		for i in 0..<height { for j in 0..<width {
			if input[get(height, width, i, j)] != '*' { continue }
			n: int
			m: int
			found := 0
			if i >= 1 {
				if is_digit(input[get(height, width, i - 1, j)]) {
					l := j
					r: int
					for l = j; l >= 0    && is_digit(input[get(height, width, i - 1, l)]); l -= 1 {}
					for r = j; r < width && is_digit(input[get(height, width, i - 1, r)]); r += 1 {}
					switch found {
					case 0: n = parse_int(input, height, width, i - 1, l + 1, r)
					case 1: m = parse_int(input, height, width, i - 1, l + 1, r)
					}
					found += 1
				} else {
					if j > 0 && is_digit(input[get(height, width, i - 1, j - 1)]) {
						l: int
						for l = j - 1; l >= 0 && is_digit(input[get(height, width, i - 1, l)]); l -= 1 {}
						switch found {
						case 0: n = parse_int(input, height, width, i - 1, l + 1, j)
						case 1: m = parse_int(input, height, width, i - 1, l + 1, j)
						}
						found += 1
					}
					if j + 1 < width && is_digit(input[get(height, width, i - 1, j + 1)]) {
						r: int
						for r = j + 1; r < width && is_digit(input[get(height, width, i - 1, r)]); r += 1 {}
						switch found {
						case 0: n = parse_int(input, height, width, i - 1, j + 1, r)
						case 1: m = parse_int(input, height, width, i - 1, j + 1, r)
						}
						found += 1
					}
				}
			}
			if j > 0 && is_digit(input[get(height, width, i, j - 1)]) {
				l: int
				for l = j - 1; l >= 0 && is_digit(input[get(height, width, i, l)]); l -= 1 {}
				switch found {
				case 0: n = parse_int(input, height, width, i, l + 1, j)
				case 1: m = parse_int(input, height, width, i, l + 1, j)
				}
				found += 1
			}
			if j + 1 < width && is_digit(input[get(height, width, i, j + 1)]) {
				r: int
				for r = j + 1; r < width && is_digit(input[get(height, width, i, r)]); r += 1 {}
				switch found {
				case 0: n = parse_int(input, height, width, i, j + 1, r)
				case 1: m = parse_int(input, height, width, i, j + 1, r)
				}
				found += 1
			}
			if i + 1 < height {
				if is_digit(input[get(height, width, i + 1, j)]) {
					l: int
					r: int
					for l = j; l >= 0    && is_digit(input[get(height, width, i + 1, l)]); l -= 1 {}
					for r = j; r < width && is_digit(input[get(height, width, i + 1, r)]); r += 1 {}
					switch found {
					case 0: n = parse_int(input, height, width, i + 1, l + 1, r)
					case 1: m = parse_int(input, height, width, i + 1, l + 1, r)
					}
					found += 1
				} else {
					if j > 0 && is_digit(input[get(height, width, i + 1, j - 1)]) {
						l: int
						for l = j - 1; l >= 0 && is_digit(input[get(height, width, i + 1, l)]); l -= 1 {}
						switch found {
						case 0: n = parse_int(input, height, width, i + 1, l + 1, j)
						case 1: m = parse_int(input, height, width, i + 1, l + 1, j)
						}
						found += 1
					}
					if j + 1 < width && is_digit(input[get(height, width, i + 1, j + 1)]) {
						r: int
						for r = j + 1; r < width && is_digit(input[get(height, width, i + 1, r)]); r += 1 {}
						switch found {
						case 0: n = parse_int(input, height, width, i + 1, j + 1, r)
						case 1: m = parse_int(input, height, width, i + 1, j + 1, r)
						}
						found += 1
					}
				}
			}
			if found == 2 { part2 += n * m }
		}}
		fmt.println(part2)
	}
}
