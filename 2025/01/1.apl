⎕IO←0
input←⍉⊃⎕NGET'input.txt'2

⍝ part 1
⎕←0+.=100|+\50,(~⍛-'L'=0⌷input)×10⊥10|⎕D⍳(-' '+.=input)⊖1↓input

⍝ part 2
l←'L'=0⌷input                                  ⍝ mask of rotations which go left (go down)
d←+\50,(~⍛-l)×10⊥10|⎕D⍳(-' '+.=input)⊖1↓input  ⍝ position after rotation (right is positive)
z←0=100|d                                      ⍝ mask of rotations which end on zero
l←0,l                                          ⍝ include starting point
⎕←+/+/[                                        ⍝ sum up:
	|0,2-/⌊d÷100                               ⍝   number of hundreds boundaries we passed over
	l∧z                                        ⍝   if we landed on a zero, and came from above, also count this zero
	-l∧¯1⌽z                                    ⍝   if we came from a zero, and came from above, don't count passing through the start point
]
