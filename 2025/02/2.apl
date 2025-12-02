⎕IO←0
⎕PP←17
⎕PW←12345

⍝ load ranges
⍝ note: ranges are non-overlapping
r←,0 1+⍤1{⍵[⍋⍵;]}(2,⍨.5×≢)⍛⍴1⊃'-,'⎕VFI¯1↓⊃⎕NGET'input.txt'0
⍝ ││    ││                 ││        │└───────────────────┴ get input (one line)
⍝ ││    ││                 │└────────┴───────────────────── parse numbers
⍝ ││    │└─────────────────┴─────────────────────────────── sort ranges (by start, they are non-overlapping)
⍝ │└────┴────────────────────────────────────────────────── adjust to be [s, e) ranges
⍝ └──────────────────────────────────────────────────────── flatten for use by ⍸

⍝ part 1
⍝ note: ⌈10⍟1+⍵ is an idomatic way to find the number of digits of ⍵
⎕←n+.×~2|r⍸n←n+n×10*⌈10⍟1+n←1+⍳¯1+10*⌊.5×⌈10⍟1+⊢/r
⍝ │  ││   ││             ││         │└───────────┴ max size of a repeated pattern in an invalid id (that we care about)
⍝ │  ││   ││             │└─────────┴───────────── all possible leading patterns
⍝ │  ││   │└─────────────┴──────────────────────── double up pattern
⍝ │  │└───┴─────────────────────────────────────── does each invalid id appear in a range (even intervals ←→ inside a range)
⍝ └──┴──────────────────────────────────────────── sum up those invalid ids

⍝ part 2
d←⌈10⍟1+⊢/r              ⍝ digits in last range end
w←⌊d÷2                   ⍝ maximum width of a pattern
p←(⌊⍛=10⍟⊢)⍛⊂1+⍳¯1+10*w  ⍝ patterns of each size
x←10*i×⍳¨⌊d÷i←1+⍳w       ⍝ pattern repetition factors for each size
n←∪∊p{1↓⍤1+\⍺∘.×⍵}¨x     ⍝ candidate invalid ids
⎕←n+.×~2|r⍸n             ⍝ sum those in the supplied ranges

⍝ part 2 as a oneliner for fun
⎕←n+.×~2|r⍸n←∪∊((⌊⍛=10⍟⊢)⍛⊂1+⍳¯1+10*w){1↓⍤1+\⍺∘.×⍵}¨10*i×⍳¨⌊d÷i←1+⍳w←⌊.5×d←⌈10⍟1+⊢/r
