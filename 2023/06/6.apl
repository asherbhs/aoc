input←⊃⎕nget'input.txt'1

⍝ part 1
(t d)←(⍎⍳∘':'↓⊢)¨input
⍝ hack: add a small amount to d so we don't include equaling the record
⍝ inputs are integers so adding 0.1 doesn't affect the solutions we care about
⎕←×/-⌿⌈¯2÷⍨t-⍨⍤1⊢¯1 1∘.×0.5*⍨(t*2)-4×d+0.1

⍝ part 2
(t d)←((⍎' '∘≠⊢⍤/⊢)⍳∘':'↓⊢)¨input
⎕←-/⌈¯2÷⍨t-⍨¯1 1×0.5*⍨(t*2)-4×d+0.1
