#![feature(iter_next_chunk)]

mod year2015 {
	pub mod day01;
}

use std::env;
use std::fs;

fn main() {
	let [_, year, day, part, path] = env::args().next_chunk::<5>().expect("should be passed: yyyy dd p path");
	let input = fs::read_to_string(path).expect("path should be valid");
	match year.as_str() {
		"2015" => match day.as_str() {
			"01" => match part.as_str() {
				"1" => println!("{}", year2015::day01::solve_part_1(input)),
				"2" => println!("{}", year2015::day01::solve_part_2(input)),
				_ => unreachable!(),
			},
			_ => unreachable!(),
		},
		_ => unreachable!(),
	}
}
