⟨SolvePart1, SolvePart2⟩⇐

⟨Lines⟩⇐•Import "../util.bqn"

SolvePart1 ← { +´ '#'= (<˘∘⍉ ↕∘≠ ≍ (≠⊏)| 3× ↕∘≠)⊸⊑ > Lines 𝕩 }
SolvePart2 ← { +´ '#'= (<˘∘⍉ ↕∘≠ ≍ (≠⊏)| 3× ↕∘≠)⊸⊑ > Lines 𝕩 }