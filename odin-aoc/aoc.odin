package main

import "core:fmt"
import "core:os"

import y2015d01 "year2015/day01"

main :: proc() {
	year := os.args[1]
	day  := os.args[2]
	part := os.args[3]
	path := os.args[4]
	input_bytes, ok := os.read_entire_file_from_filename(path)
	if !ok { os.exit(1) }
	input := string(input_bytes)
	switch year {
	case "2015":
		switch day {
		case "01":
			switch part {
			case "1": fmt.println(y2015d01.solve_part_1(input))
			case "2": fmt.println(y2015d01.solve_part_2(input))
			}
		}
	}
}