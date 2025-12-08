⎕IO←0

⍝ parse
x←⍉⎕CSV'input.txt' ⍬ 2                ⍝ load coords
n←1⊃⍴x                                ⍝ number of boxes
a←(,b∘.<b)⌿⍉[,b∘.⊣b←⍳n ⋄ ,b∘.⊢b]      ⍝ all possible wires (triangular mask of all possible id pairs)
w⌽⍨←</(≢w)2⍴≠,w←a[⍋.5*⍨+⌿×⍨-/x[;a];]  ⍝ wires ordered by length:
⍝│           ││    └─────────────┴─│───── length of each wire
⍝│           │└────────────────────┴───── sorted wires
⍝└───────────┴─────────────────────────── ensure that a newly connected box is in the first column (minor performance improvement)

⍝ part 1
p←⍳n                         ⍝ parent vector for forest of circuits, initialised to self-loops
R←{p[⍵]}⍣≡                   ⍝ finds root of a node
{p[R ⍺]←R ⍵}/⍤1⊢1000↑w       ⍝ find circuits after 1000 connections with a disjoint-set tree:
⍝│          │└───────┴────────── for each wire
⍝└──────────┴─────────────────── merge box ⍺'s circuit with box ⍵'s circuit
⎕←×/3↑{⍵[⍒⍵]}{≢⍵}⌸{⍵[⍵]}⍣≡p  ⍝ answer:
⍝ │         ││   │└───────┴───── circuit id (root) of each box
⍝ │         │└───┴────────────── tally up each circuit
⍝ └─────────┴─────────────────── product of three largest sizes

⍝ part 2
p←⍳n                            ⍝ circuit forest as above
c←n                             ⍝ number of circuits
:For (i j) :In ↓w               ⍝ for each wire in order of length:
	(r s)←{p[⍵]}⍣≡¨i j          ⍝ roots of circuits of i and j
	c-←p[r]≠s                   ⍝ decrement c if r is merging with another circuit
	p[r]←s                      ⍝ merge box i's circuit with box j's circuit
	:If c>1 ⋄ :Continue ⋄ :End  ⍝ if all circuits are not merged together, keep going
	⎕←×/x[0;i j] ⋄ :Leave       ⍝ else, the answer is product of x-coords of i and j
:End
