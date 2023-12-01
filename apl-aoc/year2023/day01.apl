SolvePart1←{+/{(⍎⊃,⊃⍤⌽)(⍵∊⎕d)/⍵}¨(⎕ucs 10)(≠⊆⊢)⍵}
digits←'one' 'two' 'three' 'four' 'five' 'six' 'seven' 'eight' 'nine'⍪⍉⍪1↓⎕d
SolvePart2←{+/{⊃⊃(⊢+10×⊣)/(⍸o∊⍨¨⊢)¨(⌊/,⌈/)⊃,/o←⍸¨∨⌿digits⍷¨⊂⍵}¨(⎕ucs 10)(≠⊆⊢)⍵}
