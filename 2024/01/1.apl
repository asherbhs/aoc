input←↓⍉↑(2⊃⎕VFI)¨⊃⎕NGET'input.txt'1

⎕←+/|⊃-/{⍵[⍋⍵]}¨input     ⍝ part 1
⎕←+/⊃(⊣×(+/∘.=))/input    ⍝ part 2

⍝ part 2 faster
(l r)←input
(n c)←↓⍉{⍺,≢⍵}⌸r
⎕←l+.×(c,0)[n⍳l]

⍝ 'cmpx' ⎕CY 'dfns'
⍝ cmpx '+/⊃(⊣×(+/∘.=))/input' '{(l r)←input ⋄ (n c)←↓⍉{⍺,≢⍵}⌸r ⋄ l+.×(c,0)[n⍳l]}⍬'
