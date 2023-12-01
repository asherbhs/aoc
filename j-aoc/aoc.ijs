'year day part path'=:2}.ARGV
input=:1!:1<path
0!:0<'year',year,'/day',day,'.ijs'
echo{{
	if.    y-:'1' do. SolvePart1 input
	elseif.y-:'2' do. SolvePart2 input
	end.
}}part
exit''
