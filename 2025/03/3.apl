⎕IO←0
⎕PW←12345
⎕PP←17

⍝ parse
j←⎕D⍳⊃⎕NGET'input.txt'2

⍝ part 1
⎕←+/(10×m)+j(⌈/↓⍨)⍤1 0⊢1+j⍳⍤1 0⊢m←⌈/¯1↓⍤1⊢j

⍝ part 2
Do←{
	n←⍺             ⍝ digit we're doing (0-indexed)
	(x j)←⍵         ⍝ numbers so far, and remaining digits
	m←n(⌈/-⍛↓)¨j    ⍝ digits we're going to add (last n are needed later, so don't sample)
	(
		m+10×x      ⍝ add digits to end
		j↓¨⍨1+j⍳¨m  ⍝ delete the digits we took
	)
}
⎕←+/⊃⊃Do/(⍳12),⊂(j≢⍛⍴⍬ ⋄ ↓j)  ⍝ do it

