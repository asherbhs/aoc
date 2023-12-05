Parse←{
    lines←(⎕UCS 10)(≠⊆⊢)⍵
    sets←(';'(≠⊆⊢)⍳∘':'↓⊢)¨lines
    colours←(','(≠⊆⊢)⊢)¨¨sets
    names←'red' 'green' 'blue'
    ↑¨((,⍨∘(~∨/)⍨names∘.(∨/⍷)⊢)(⊃⍤/⍤1)0,(⍎∊∘⎕D⊢⍤/⊢)¨)¨¨colours
}
SolvePart1←{+/⍸(12 13 14∧.≥⌈⌿)¨Parse⍵}
SolvePart2←{+/(×/⌈⌿)¨Parse⍵}
