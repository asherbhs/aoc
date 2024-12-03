⎕io←0
input←⊃⎕nget'input.txt'1
d←'LR'⍳⊃input
(n l r)←↓⍉↑{⍵[⍋⍵]}(26⊥¨(⊂⎕a)⍳¨∊∘⎕a⊆⊢)¨2↓input
(l r)←l r{⍺@⊢⍵}¨⊂⍸⍣¯1⊢n

⍝ part 1
z←+/25×26*2 1 0
i←¯1
{⍵⊃d[(≢d)|i⊢←1+i]⊃l r}⍣(z=⊣)0
⎕←1+i

⍝ part 2
(a z)←/∘n¨0 25=⊂26|n
⎕←{⍵⍕⍨0,⍨⌈10⍟⍵}∧/{i←¯1 ⋄ _←{⍵⊃d[(≢d)|i⊢←1+i]⊃l r}⍣(z∊⍨⊣)⍵ ⋄ 1+i}¨a    ⍝ you shouldn't be able to just ∧/ it but hey you can idk
