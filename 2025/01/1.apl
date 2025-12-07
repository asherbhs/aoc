⎕IO←0

⍝ parse
x←⊃⎕NGET'input.txt'2
l←'L'=x[;0]         ⍝ mask of rotations which go left (go down)
n←1⊃' LR'⎕VFI 1↓,x  ⍝ size of each rotation

⍝ part 1
⎕←0+.=100|+\50,n×~⍛-l
⍝ │  ││       │└────┴ left rotations are negative
⍝ │  │└───────┴────── find cumulative position on the dial
⍝ └──┴─────────────── count zeros

⍝ part 2
d←+\50,n×~⍛-l   ⍝ position after rotation (right is positive)
z←0=100|1↓d     ⍝ mask of rotations which end on zero
⎕←+/+/[         ⍝ sum up:
	|2-/⌊d÷100  ⍝   number of hundreds boundaries each rotation passed over
	l∧z         ⍝   if we landed on a zero, and came from above, also count this zero
	-l∧0,¯1↓z   ⍝   if we came from a zero, and came from above, don't count passing through the start point
]
