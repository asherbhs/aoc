Parse←{
    lines←(⎕UCS 10)(≠⊆⊢)⍵
    sets←(';'(≠⊆⊢)⍳∘':'↓⊢)¨lines
    colours←(','(≠⊆⊢)⊢)¨¨sets
    ↑¨((,⍨∘(~∨/)⍨'red' 'green' 'blue'∘.(∨/⍷)⊢)(⊃⍤/⍤1)0,(⍎∊∘⎕D⊢⍤/⊢)¨)¨¨colours
}
SolvePart1←{+/⍸(12 13 14∧.≥⌈⌿)¨Parse⍵}
SolvePart2←{+/(×/⌈⌿)¨Parse⍵}
