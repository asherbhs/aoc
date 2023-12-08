⎕io←1
input←⊃⎕nget'input.txt'1
(hands bids)←↓⍉↑' '(≠⊆⊢)¨input
hands1←'23456789TJQKA'∘⍳¨hands
hands2←'J23456789TQKA'∘⍳¨hands
bids←⍎¨bids

⍝ j[1+number of jokers; type of hand] is new type of hand after converting js (0 is not a valid hand)
j←↑(1 2 3 4 5 6 7)(2 4 5 6 0 7 0)(0 4 6 0 7 0 0)(0 0 0 6 7 0 0)(0 0 0 0 0 7 0)(0 0 0 0 0 0 7)

⎕←+/bids[o]×⍋⍋{             ⌈/⍸(1,2∘∊,(2=2+/⍤=⊢),3∘∊,(∧/3 2∘∊),4∘∊,5∘∊)≢⍤⊢⌸⍵}¨hands1[o←⍋hands1]
⎕←+/bids[o]×⍋⍋{j⌷⍨(1++/1=⍵),⌈/⍸(1,2∘∊,(2=2+/⍤=⊢),3∘∊,(∧/3 2∘∊),4∘∊,5∘∊)≢⍤⊢⌸⍵}¨hands2[o←⍋hands2]
