input←↓⍉↑(2⊃⎕VFI)¨⊃⎕NGET'input.txt'1

⎕←+/|⊃-/{⍵[⍋⍵]}¨input     ⍝ part 1
⎕←+/⊃(⊣×(+/∘.=))/input    ⍝ part 2
