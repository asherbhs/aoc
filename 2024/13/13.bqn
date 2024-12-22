[[ax, ay], [bx, by], [px, py]]←2‿0‿1⍉∘‿3‿2⥊∾{•ParseFloat¨𝕩⊔˜1-˜⊐m×+`¬m←𝕩∊"0123456789"}¨""⊸≢¨⊸/•FLines "input.txt"

# part 1
{
	ma←ay÷ax
	mb←by÷bx
	c←py-mb×px
	x←c÷ma-mb
	Round←(⌊0.5⊸+)⌾(1000000⊸×)
	na←Round x÷ax
	nb←Round (px-x)÷bx
	m←na∧○(⌊⊸=)nb
	•Show +´+˝3‿1×m⊸/˘na≍nb
}

# part 2
{
	px+↩10000000000000
	py+↩10000000000000
	ma←ay÷ax
	mb←by÷bx
	c←py-mb×px
	x←c÷ma-mb
	Round←(⌊0.5⊸+)⌾(1000⊸×) # rougher rounding to avoid overflow
	na←Round x÷ax
	nb←Round (px-x)÷bx
	m←na∧○(⌊⊸=)nb
	•Show +´+˝3‿1×m⊸/˘na≍nb
}
