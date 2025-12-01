⎕IO←0
input←⍉⊃⎕NGET'input.txt'2

⍝ part 1
⎕←0+.=100|+\50,(~⍛-'L'=0⌷input)×10⊥10|⎕D⍳(-' '+.=input)⊖1↓input
⍝ │  ││       ││               ││       │└────────────────────┴ put digits in the right place
⍝ │  ││       ││               │└───────┴────────────────────── decode digits to get (absolute) distances
⍝ │  ││       │└───────────────┴─────────────────────────────── left rotations are negative
⍝ │  │└───────┴──────────────────────────────────────────────── find cumulative position on the dial
⍝ └──┴───────────────────────────────────────────────────────── count zeros

⍝ part 2
l←'L'=0⌷input                                  ⍝ mask of rotations which go left (go down)
d←+\50,(~⍛-l)×10⊥10|⎕D⍳(-' '+.=input)⊖1↓input  ⍝ position after rotation (right is positive)
z←0=100|1↓d                                    ⍝ mask of rotations which end on zero
⎕←+/+/[                                        ⍝ sum up:
	|2-/⌊d÷100                                 ⍝   number of hundreds boundaries each rotation passed over
	l∧z                                        ⍝   if we landed on a zero, and came from above, also count this zero
	-l∧¯1⌽z                                    ⍝   if we came from a zero, and came from above, don't count passing through the start point
]
