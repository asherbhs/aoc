my $input = 'input.txt'.IO.slurp;

# part 1
say $input
	.match(/'mul(' (\d+) ',' (\d+) ')'/, :g)
	.map({.[0] × .[1]})
	.sum
;

# part 2
my $do = True;
say $input
	.match(/"don't()" || 'do()' || 'mul(' (\d+) ',' (\d+) ')'/, :g)
	.grep({
		when "don't()" { $do = False; False }
		when 'do()'    { $do = True;  False }
		$do
	})
	.map({.[0] × .[1]})
	.sum
;
