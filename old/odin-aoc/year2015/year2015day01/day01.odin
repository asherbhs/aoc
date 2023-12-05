package day01

import "core:fmt"

solve_part_1 :: proc(input: string) -> int {
	floor := 0
	for c in input { floor += c == '(' ? 1 : -1 }
	return floor
}

solve_part_2 :: proc(input: string) -> int {
	floor := 0
	for c, i in input {
		floor += c == '(' ? 1 : -1
		if floor < 0 { return i + 1 }
	}
	unreachable()
}
