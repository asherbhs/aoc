my $input = 'input.txt'.IO.slurp;

# my $time = now;

# part 1
say $input
	.match(/'mul(' (\d+) ',' (\d+) ')'/, :g)
	.map({.[0] × .[1]})
	.sum
;

# say "{now - $time}s";
# $time = now;

# part 2
say $input
	.match(/"don't()" || 'do()' || 'mul(' (\d+) ',' (\d+) ')'/, :g)
	.grep({!("don't()" fff 'do()') && /mul/})
	.map({.[0] × .[1]})
	.sum
;

# say "{now - $time}s";
