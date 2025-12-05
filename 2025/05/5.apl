⎕IO←0
⎕PP←17
⎕CT←0

⍝ parse
nl←⎕UCS 10      ⍝ newline
(r f)←(1⊃'-'nl⎕VFI⊢)¨(~nl nl⍷⊢)⍛⊆⊃⎕NGET'input.txt'0
⍝     └────parse────┘└──split───┘
r⍴⍨←(.5×≢r) 2   ⍝ a cell for each range
(l u)←↓⍉r[⍋r;]  ⍝ sort ranges by beginning, split lower and upper

⍝ part 1
⎕←+/∨/(f∘.≥l)∧(f∘.≤u)

⍝ part 2
v←⌈\u                 ⍝ carry forward high upper bounds
m←1,⍨(¯1↓v)<(1↓l)     ⍝ end of a merged range
⎕←+/1+(m/v)-(¯1⌽m)/l  ⍝ total extent of merged ranges
