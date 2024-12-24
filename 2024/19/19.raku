my @lines = 'input.txt'.IO.lines.List;
my @towels = @lines[0].split(', ').List;
my @patterns = @lines.skip(2);

# part 1
my %cache = '' => True;
sub possible(Str $s) {
	return %cache{$s} if %cache{$s}:exists;
	%cache{$s} = 0 < @towels.grep: -> $towel { $s ~~ /^$towel/ && possible $/.postmatch }
}
say +@patterns.grep: &possible;

# part 2
my %ways = '' => 1;
sub count(Str $s) {
	return %ways{$s} if %ways{$s}:exists;
	%ways{$s} = sum @towels.map: -> $towel { $s ~~ /^$towel/ ?? count $/.postmatch !! 0 }
}
say sum @patterns.map: &count;
