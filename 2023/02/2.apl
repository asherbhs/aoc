⍝ parse
lines←⊃⎕nget'input.txt'1
sets←(';'(≠⊆⊢)⍳∘':'↓⊢)¨lines
colours←(','(≠⊆⊢)⊢)¨¨sets
names←'red' 'green' 'blue'
data←↑¨((,⍨∘(~∨/)⍨names∘.(∨/⍷)⊢)(⊃⍤/⍤1)0,(⍎∊∘⎕D⊢⍤/⊢)¨)¨¨colours

⎕←+/⍸(12 13 14∧.≥⌈⌿)¨data    ⍝ part 1
⎕←+/(×/⌈⌿)¨data              ⍝ part 2
