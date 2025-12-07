⎕IO ⎕PP←0 17
x←⊃⎕NGET'input.txt'2  ⍝ input (as a matrix)
n←↓⍉↑(1⊃⎕VFI)¨↓¯1↓x   ⍝ human-style columns
m←((1⌽~)⍛/1,' '∧.=x)⊂1⊃' +*'⎕VFI,⍉x  ⍝ cephalopod-style columns:
⍝ ││     ││       │ │└────────────┴───── parse cephalopod-style, abusing the last row as separators
⍝ └│─────││───────│─┴─────────────────── split into columns:
⍝  │     │└───────┴─────────────────────── mask of column starts
⍝  └─────┴──────────────────────────────── delete empty columns from mask - there's nothing there in the numbers
pm←'+'='+*'∩⍨⊢⌿x      ⍝ mask of columns to sum
p←⍸ pm                ⍝ column indices to sum
t←⍸~pm                ⍝ column indices to multiply
⎕←+/×/¨@t+/¨@p⊢n      ⍝ part 1
⎕←+/×/¨@t+/¨@p⊢m      ⍝ part 2
