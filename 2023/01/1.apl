input←⊃⎕nget'input.txt'1

⍝ part 1
⎕←+/{(⍎⊃,⊃⍤⌽)(⍵∊⎕d)/⍵}¨input

⍝ part 2
digits←'one' 'two' 'three' 'four' 'five' 'six' 'seven' 'eight' 'nine'⍪⍉⍪1↓⎕d
⎕←+/{⊃(⊢+10×⊣)/(⊃⍸)⍤1⊢o∘.∊⍨(⌊/,⌈/)⊃,/o←⍸¨∨⌿digits⍷¨⊂⍵}¨input

