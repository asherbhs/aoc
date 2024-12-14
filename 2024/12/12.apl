⎕IO←0

input←↑⊃⎕NGET 'input.txt' 1

visited←0⍴⍨⍴input
d←(0 1)(1 0)(0 ¯1)(¯1 0)
Flood←{
	start←⍵
	(start⌷visited)←1
	plant←⍵⌷input
	block←,⊂⍵
	_←{
		i←∪,d∘.+⍵
		i/⍨←((0∧.≤⊢)∧(⍴input)∧.>⊢)¨i
		i/⍨←~visited[i]
		i/⍨←plant=input[i]
		block,←i
		visited[i]←1
		i
	}⍣(0=≢⍤⊣)block
	block
}
blocks←⍬
{blocks,←⊂Flood⊃⍸~visited}⍣{~0∊visited}⍬

⍝ part 1
⎕←+/{(≢⍵)×+/4-+/⍵∊⍨⍵∘.+d}¨blocks

⍝ part 2
⎕←+/{
	block←⍵
	(≢block)×+/{
		+/((d⊃⍨4|⍵+1)∘+¨~⍤∊⊢)(⊢⊢⍤/⍨(⍵⊃d)∘+¨~⍤∊⊢)block
	}¨⍳4
}¨blocks
