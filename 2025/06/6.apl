⎕IO←0
⎕PP←17

x←⊃⎕NGET'example.txt'2             ⍝ lines
n←↓⍉↑(1⊃⎕VFI)¨↓¯1↓x                ⍝ human-style columns
m←(0=(¯1+≢x)|⍳⍤≢)⍛⊂1⊃' +*'⎕VFI,⍉x  ⍝ cephalopod-style columns:
⍝ │               │└────────────┴───── parse cephalopod-style, abusing the last row as separators
⍝ └───────────────┴─────────────────── split in column-sized chunks
pm←'+'='+*'∩⍨⊢⌿x                   ⍝ mask of columns to sum
p←⍸ pm                             ⍝ column indices to sum
t←⍸~pm                             ⍝ column indices to multiply
⎕←+/×/¨@t+/¨@p⊢n                   ⍝ part 1
⎕←+/×/¨@t+/¨@p⊢m                   ⍝ part 2
