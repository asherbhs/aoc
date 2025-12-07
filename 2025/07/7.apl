⎕IO ⎕PP←0 17

⍝ parse
x←⊃⎕NGET'input.txt'2  ⍝ input as a matrix
s←⌽↓'^'=1↓x           ⍝ positions of the splitters (set up for a reduction)
b←'S'=x[0;]           ⍝ starting position of the beam

⍝ part 1
n←0                      ⍝ accumulator for number of splits
{
	(s b)←⍺ ⍵            ⍝ next row of splitters, and current beam positions
	h←b∧s                ⍝ where a beam hits a splitter
	n+←+/h               ⍝ count these
	(b∧~s)∨(1⌽h)∨(¯1⌽h)  ⍝ new beam positions:
⍝	│    │ └──────────┴───── on the left or right of a hit, or
⍝	└────┴────────────────── where a beam didn't hit a splitter, and carries on
}/s,⊂b
⎕←n

⍝ part 2
⍝ as above, but with no counter, and changing ∨∧ to +× so
⍝ we count number of paths rather than just existence.
⍝ then, sum the timelines in the end.
⎕←+/⊃{(⍵×~⍺)+(1∘⌽+¯1∘⌽)⍵×⍺}/s,⊂b
