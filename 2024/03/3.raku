my $input = 'input.txt'.IO.slurp;

# part 1
say $input
	.match(/'mul(' (\d+) ',' (\d+) ')'/, :g)
	.map({.[0] × .[1]})
	.sum
;

# part 2
say $input
	.match(/"don't()" || 'do()' || 'mul(' (\d+) ',' (\d+) ')'/, :g)
	.grep({!("don't()" fff 'do()') && /mul/})
	.map({.[0] × .[1]})
	.sum
;
