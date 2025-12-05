⎕IO←0
⎕PP←17
⎕CT←0

⍝ parse
nl←⎕UCS 10  ⍝ newline
(r f)←(1⊃'-'nl⎕VFI⊢)¨(~nl nl⍷⊢)⍛⊆⊃⎕NGET'input.txt'0
⍝     └────parse────┘└──split───┘
(l u)←↓⍉⊂⍤⍋⍛⌷r⍴⍨(.5×≢r) 2  ⍝ sort ranges by lower, split lower and upper

⍝ part 1
⎕←+/∨/(f∘.≥l)∧(f∘.≤u)

⍝ part 2
⎕←+/1+(m/v)-l/⍨¯1⌽m←1,⍨(1↓l)>¯1↓v←⌈\u
⍝   │            ││            │└───┴ carry forward merged upper limits
⍝   │            │└────────────┴───── mask of ends of merged ranges
⍝   └────────────┴─────────────────── extent of each merged range
