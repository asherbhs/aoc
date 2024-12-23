map←↑⊃⎕NGET 'input.txt' 1
s←⊃⍸'S'=map
e←⊃⍸'E'=map
d←(0 1)(1 0)(0 ¯1)(¯1 0)

⍝ part 1
fl←s∘+¨d
score←1000××/⍴map
v←1001@(fl,⊂s)⊢score⍴⍨⍴map
m←'.'=map[fl]
fl/⍨←m
fd←m/d
fs←1001⍨¨fl
{
	gl←fl∘.+d
	m←map[gl]∊'.E'
	gl⊂⍤/⍤1⍨←m
	gd←m⊂⍤/⍤1⊢d⍴⍨4,⍨≢fl
	gs←(1000×gd≢¨∘⊂¨fd)+1+m⊂⍤/⍤1⊢4/⍤0⊢fs
	fl⊢←⊃,/gl
	fd⊢←⊃,/gd
	fs⊢←⊃,/gs
	m←fs<v[fl]
	fl/⍨←m
	fd/⍨←m
	fs/⍨←m
	v[fl]⌊←fs
	m←e∘≢¨fl
	fl/⍨←m
	fd/⍨←m
	fs/⍨←m
	⍝ ⎕pw←12345
	⍝ disp←map
	⍝ disp←' '@{(~map∊'#SE')∧v<score}disp
	⍝ disp[fl]←0
	⍝ disp[fl]+←1
	⍝ disp[fl]←⎕UCS disp[fl]+⎕UCS'0'
	⍝ ⎕←disp
	⍝ _←⍞
⍬}⍣{
	0=≢fl
}⍬
⎕←e⌷v

⍝ part 2
fl←s∘+¨d
score←1000××/⍴map
v←1001@(fl,⊂s)⊢score⍴⍨⍴map
m←'.'=map[fl]
fl/⍨←m
fd←m/d
fs←1001⍨¨fl
fp←(⊂s)∘,¨⊂¨fl
es←⍬
ep←⍬
{
	gl←fl∘.+d
	m←map[gl]∊'.E'
	gl⊂⍤/⍤1⍨←m
	gd←m⊂⍤/⍤1⊢d⍴⍨4,⍨≢fl
	gs←(1000×gd≢¨∘⊂¨fd)+1+m⊂⍤/⍤1⊢4/⍤0⊢fs
	gp←fp{(⍺,⊂)¨⍵}¨gl
	fl⊢←⊃,/gl
	fd⊢←⊃,/gd
	fs⊢←⊃,/gs
	fp⊢←⊃,/gp
	m←fs<v[fl]
	fl/⍨←m
	fd/⍨←m
	fs/⍨←m
	fp/⍨←m
	v[fl]⌊←fs
	m←e∘≡¨fl
	es,←m/fs
	ep,←m/fp
	m←~m
	fl/⍨←m
	fd/⍨←m
	fs/⍨←m
	fp/⍨←m
⍬}⍣{
	0=≢fl
}⍬
⎕←≢⊃∪/ep/⍨es=e⌷v
