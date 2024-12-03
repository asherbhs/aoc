input←⊃⎕nget'input.txt'1
data←⍎¨'-'⎕r'¯'⊢input
⎕←+/{d←2-⍨/⍵ ⋄ l←⊃⌽⍵ ⋄ ∧/0=d:l ⋄ l+∇d}¨data
⎕←+/{d←2-⍨/⍵ ⋄ f←⊃ ⍵ ⋄ ∧/0=d:f ⋄ f-∇d}¨data
