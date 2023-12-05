use std::ops::Add;

pub fn solve_part_1(input: String) -> i32 {
	input
		.chars()
		.map(|c| match c {
			'(' => 1,
			')' => -1,
			_   => unreachable!(),
		})
		.sum()
}

pub fn solve_part_2(input: String) -> usize {
	input
		.chars()
		.map(|c| match c {
			'(' => 1,
			')' => -1,
			_   => unreachable!(),
		})
		.scan(0, |floor, n| { *floor += n; Some(*floor) })
		.position(|floor| floor < 0)
		.unwrap()
		.add(1)
}