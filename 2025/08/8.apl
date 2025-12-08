⎕IO←0

⍝ parse
x←⍉⎕CSV'input.txt' ⍬ 2                ⍝ load coords
n←1⊃⍴x                                ⍝ number of boxes
a←(,b∘.<b)⌿⍉[,b∘.⊣b←⍳n ⋄ ,b∘.⊢b]      ⍝ all possible wires (triangular mask of all possible id pairs)
w⌽⍨←</(≢w)2⍴≠,w←a[⍋.5*⍨+⌿×⍨-/x[;a];]  ⍝ wires ordered by length:
⍝│           ││    └─────────────┴─│───── length of each wire
⍝│           │└────────────────────┴───── sorted wires
⍝└───────────┴─────────────────────────── ensure that a newly connecting box is in the first column (minor performance improvement)

⍝ part 1
p←⍳n                         ⍝ parent vector for forest of circuits, initialised to self-loops
R←{p[⍵]}⍣≡                   ⍝ finds root of a node
_←{p[R ⍺]←R ⍵}/⍤1⊢1000↑w     ⍝ find circuits after 1000 connections with a disjoint-set tree:
⍝ │           │└───────┴──────── for each wire
⍝ └───────────┴───────────────── merge box ⍺'s circuit with box ⍵'s circuit
⎕←×/3↑{⍵[⍒⍵]}{≢⍵}⌸{⍵[⍵]}⍣≡p  ⍝ answer:
⍝ │         ││   │└───────┴───── circuit id (root) of each box
⍝ │         │└───┴────────────── tally up each circuit
⍝ └─────────┴─────────────────── product of three largest sizes

⍝ part 2
p←⍳n                      ⍝ circuit forest as above
c←n                       ⍝ number of circuits overall (will go down as we merge them)
F←{                       ⍝ connect a wire, merging circuits, ⍵: index of next wire to look at
	(r s)←{p[⍵]}⍣≡¨w[⍵;]  ⍝ roots of circuits each box on this wire
	c-←p[r]≠s             ⍝ decrement c if r is merging with another circuit
	p[r]←s                ⍝ merge the circuits
	⍵+1                   ⍝ next wire
}
⎕←×/x[0;w[¯1+F⍣{c=1}0;]]  ⍝ answer:
⍝ │     │    └──────┴─││───── connect boxes until all circuits merged
⍝ │     └─────────────┴│───── last wire we connected
⍝ └────────────────────┴───── product of x-coords of boxes on that wire

⍝ part 2 oneliner for fun
⎕←×/x[0;w[¯1+{r s←{p[⍵]}⍣≡¨w[⍵;]⋄c-←p[r]≠s⋄p[r]←s⋄⍵+1}⍣{c=1}0;]]⊣p←⍳c←n
