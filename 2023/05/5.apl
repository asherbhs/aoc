input←⊃⎕nget'input.txt'
bits←(⊢⊆⍨(⎕ucs 10 10)~⍤⍷⊢)input
seeds←⍎7↓⊃bits
maps←{⍉{⍵[⍋⍵;]}↑(⊂⊂2 1 3)⌷¨⍎¨1↓(⎕ucs 10)(≠⊆⊢)⍵}¨1↓bits
map←{
    (from to range)←↓⍺
    ⍵+(⊂1+(⊢×⊢>⍵⍸⍨from+range⍨)from⍸⍵)⌷0,to-from
}
⎕←⌊/⊃map/⌽(⊂seeds),maps
