⎕io←0
input←↑⊃⎕nget'input.txt'1

⍝ parsing to adjacency matrix
readable←' S┘┐┌└─│'['.SJ7FL-|'⍳input]
oN oS oE oW←'S┘└│' 'S┐┌│' 'S┌└─' 'S┘┐─'∊⍨¨⊂readable
cN←oN∧¯1↓   0⍪oS
cS←oS∧ 1↓     oN⍪0
cE←oE∧ 1↓⍤1⊢  oW,0
cW←oW∧¯1↓⍤1⊢0,oE
g←(⊢-∘.=⍨⍤⍳⍤≢)(,⍳⍴readable)(⊣∊⍤1∘⍉+⍤1)↑(⊂0 ¯1∘×¨,cW),(⊂0 1∘×¨,cE),(⊂1 0∘×¨,cS),(⊂¯1 0∘×¨,cN)
n←≢g
s←'S'⍳⍨,readable

inf←+/+/g
h←(∘.≠⍨⍳n)×inf 1[g]
⎕←⌈/(⊢×inf≠⊢)⌊.+∘h⍣n⊢0@s⊢n⍴inf
