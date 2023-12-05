⎕io←0
input←↑⊃⎕nget'input.txt'1

⍝ part 1
d←(⊂⊢⊆⍳⍤≢)⍤1⊢input∊⎕d                    ⍝ chunks of indices indicating where the numbers are on each line
a←⊂⍤⍸⍤1({∨/(⎕d,'. ')~⍤∊⍨,⍵}⌺3 3)input    ⍝ indices which are adjacent to a symbol on each line
ad←d{⍺/⍨⍺∨/⍤∊¨⊂⍵}¨a                      ⍝ chunks of indices of numbers which are adjacent to a symbol
⎕←+/⍎¨⊃,/(↓input){⍵⊂⍤⌷⍤0 1⊢⍺}¨ad         ⍝ extract the numbers adjacent to symbols and sum

⍝ part 2
d←(⊂⊢⊆⍳⍤≢)⍤1⊢input∊⎕d                    ⍝ chunks of indices indicating where the numbers are on each line
m←'*'=input                              ⍝ mask of locations of *s
ids←1+⍳+/+/m                             ⍝ list of * ids
a←({⊂(0∘≠⊢⍤/⊢),⍵}⌺3 3)ids@⊢m             ⍝ lists of * ids which each cell is adjacent to
s←d∪¨⍤(,/)⍤⌷⍤0 1¨↓a                      ⍝ * ids each number is adjacent to
n←d{⍺⊂⍤⌷⍤0 1⊢⍵}¨↓input                   ⍝ numbers on each row
sn←⊃,¨⌿n{⍺⊂⍤/⍨⍤1⊢ids∘.∊⍵}¨s              ⍝ numbers for each *
⎕←+/×⍥⍎/¨sn/⍨2=≢¨sn                      ⍝ sum of gear ratios (exactly 2 numbers adjacent)

