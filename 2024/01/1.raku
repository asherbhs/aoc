my (@l, @r) := [Z] 'input.txt'.IO.lines».words».Int;

say (@l.sort Z- @r.sort)».abs.sum; # part 1
say sum @l Z× @r.Bag{@l};          # part 2
