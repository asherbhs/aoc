package main

import "core:fmt"
import "core:os"
import "core:unicode"

main :: proc() {
	input_bytes, ok := os.read_entire_file("input.txt")
	if !ok { panic("could not read input") }
	input := string(input_bytes)

	// part 1
	{
		sum := 0
		i := 0
		for {
			for input[i] < '1' || '9' < input[i] { i += 1 }
			sum += 10 * int(input[i] - '0')
			j := i
			for input[i] != '\n' {
				if '1' <= input[i] && input[i] <= '9' { j = i }
				i += 1
			}
			sum += int(input[j] - '0')
			i += 1
			if i == len(input) {
				fmt.println(sum)
				break
			}
		}
	}

	// part 2
	{
		get_digit :: proc(input: string, i: int) -> (int, bool) {
			if '1' <= input[i] && input[i] <= '9' { return int(input[i] - '0'), true }
			if len(input) - i < 3 { return 0, false }
			if input[i:i+3] == "one"   { return 1, true }
			if input[i:i+3] == "two"   { return 2, true }
			if input[i:i+3] == "six"   { return 6, true }
			if len(input) - i < 4 { return 0, false }
			if input[i:i+4] == "four"  { return 4, true }
			if input[i:i+4] == "five"  { return 5, true }
			if input[i:i+4] == "nine"  { return 9, true }
			if len(input) - i < 5 { return 0, false }
			if input[i:i+5] == "three" { return 3, true }
			if input[i:i+5] == "seven" { return 7, true }
			if input[i:i+5] == "eight" { return 8, true }
			return 0, false
		}

		sum := 0
		i := 0
		last_digit := 0
		for {
			for {
				digit, ok := get_digit(input, i)
				if ok {
					sum += 10 * digit
					last_digit = digit
					break
				}
				i += 1
			}
			for input[i] != '\n' {
				digit, ok := get_digit(input, i)
				if ok { last_digit = digit }
				i += 1
			}
			sum += last_digit
			i += 1
			if i == len(input) {
				fmt.println(sum)
				break
			}
		}
	}
}

