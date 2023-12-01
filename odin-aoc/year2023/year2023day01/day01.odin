package year2023day01

import "core:unicode"

solve_part_1 :: proc(input: string) -> int {
	sum := 0
	for i := 0; i < len(input); i += 1 {
		for ; input[i] < '1' || '9' < input[i]; i += 1 {}
		sum += 10 * int(input[i] - '0')
		j := i
		for ; input[i] != '\n'; i += 1 {
			if '1' <= input[i] && input[i] <= '9' { j = i }
		}
		sum += int(input[j] - '0')
	}
	return sum
}

solve_part_2 :: proc(input: string) -> int {
	get_digit :: proc(input: string, i: int) -> (int, int, bool) {
		if '1' <= input[i] && input[i] <= '9' { return int(input[i] - '0'), i + 1, true }
		if len(input) - i < 3 { return 0, 0, false }
		if input[i:i+3] == "one"   { return 1, i + 3, true }
		if input[i:i+3] == "two"   { return 2, i + 3, true }
		if input[i:i+3] == "six"   { return 6, i + 3, true }
		if len(input) - i < 4 { return 0, 0, false }
		if input[i:i+4] == "four"  { return 4, i + 4, true }
		if input[i:i+4] == "five"  { return 5, i + 4, true }
		if input[i:i+4] == "nine"  { return 9, i + 4, true }
		if len(input) - i < 5 { return 0, 0, false }
		if input[i:i+5] == "three" { return 3, i + 5, true }
		if input[i:i+5] == "seven" { return 7, i + 5, true }
		if input[i:i+5] == "eight" { return 8, i + 5, true }
		return 0, 0, false
	}
	sum := 0
	for i := 0; i < len(input); i += 1 {
		last_digit: int
		for ; ; i += 1 {
			digit, j, ok := get_digit(input, i)
			if ok {
				i = j
				sum += 10 * digit
				last_digit = digit
				break
			}
		}
		for ; input[i] != '\n'; i += 1 {
			digit, _, ok := get_digit(input, i)
			if ok { last_digit = digit }
		}
		sum += last_digit
	}
	return sum
}
