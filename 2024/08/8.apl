⎕IO←0
⎕DIV←0

input←↑⊃⎕NGET 'input.txt' 1

⎕←≢(((0 0∧.<⊢)∧(⍴input)∧.≥⊢)¨⊢⍤/⊢)∪⊃,/{(,∘.≠⍨⍳≢⍵)/,∘.{⍵-⍺-⍵}⍨⍵}¨(⊂input)⍸⍤=¨⎕D,⎕A,⎕C⎕A
⎕←≢∪⊃,/{
	⊃,/,∘.{
		⍺≡⍵: ⍬
		d←⍺-⍵
		⍵∘-¨d∘×¨⍳1+⌊/⌊|d÷⍨⍵-⍨⊃(0⌈-×d)⌷⊃∘.,/0,¨¯1+⍴input
	}⍨⍵
}¨(⊂input)⍸⍤=¨⎕D,⎕A,⎕C⎕A
