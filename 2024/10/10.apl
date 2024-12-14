⎕IO←0

⎕←input←⎕D⍳↑⊃⎕NGET 'input.txt' 1

'disp' ⎕CY 'dfns'
Trace←{⍵⊣⎕←disp ⍵}
⎕pw←12345

trailheads←⍸0=input
d←↓⍪∘-⍨∘.=⍨⍳2
⎕←+/≢¨⊃{∪(⊢⊢⍤/⍨⍺=⌷∘input¨)(((0∧.≤⊢)∧(⍴input)∧.>⊢)¨⊢⍤/⊢),d∘.+⍵}¨/(⌽1+⍳9),⊂,⍤⊂¨trailheads    ⍝ part 1
⎕←+/≢¨⊃{ (⊢⊢⍤/⍨⍺=⌷∘input¨)(((0∧.≤⊢)∧(⍴input)∧.>⊢)¨⊢⍤/⊢),d∘.+⍵}¨/(⌽1+⍳9),⊂,⍤⊂¨trailheads    ⍝ part 2
