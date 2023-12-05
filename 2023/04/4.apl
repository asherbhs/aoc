input←↑⊃⎕nget'input.txt'1
data←⍎¨1↓⍤1⊢input⊆⍨∧⌿':|'∘.≠1⌷input
wins←+/¨∊/⍤1⊢data    ⍝ number of winning numbers on each card

⍝ part 1
⎕←+/2*1-⍨(>∘0⊢⍤/⊢)wins

⍝ part 2
ns←⍳n←≢data                              ⍝ all card numbers
nexts←ns+⍳¨wins                          ⍝ copies made by each card
cards←0
{cards+←+/⍵ ⋄ +/ns∘.=⊃,/⍵/nexts}⍣≡n⍴1    ⍝ starting with one copy of each card (n⍴1), continue to generate copies until no more are generated
⎕←cards
