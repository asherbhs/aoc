rules‿updates←((+`-2×⊢)⟨⟩⊸≡¨)⊸⊔•FLines"input.txt"
rules  ↩>•ParseFloat¨¨((+`-2×⊢)'|'⊸=)⊸⊔¨rules
updates↩ •ParseFloat¨¨((+`×¬)⊸-','⊸=)⊸⊔¨updates

lesser‿greater←<˘⍉rules
from←⍷lesser
to←(<⟨⟩)∾˜greater⊔˜¯1+(≠lesser)|1+from⊐lesser

# part 1
# •Show +´(⌊≠÷2˙)⊸⊑¨{∧´≤´˘(∧´˘∘¬(≠𝕩)⊸⍷)⊸/𝕩⊐rules}¨⊸/updates
•Show +´(⌊≠÷2˙)⊸⊑¨{∧´∧´¨(↕≠𝕩)<𝕩⊸⊐¨to⊏˜from⊐𝕩}¨⊸/updates

# part 2 (this is disgusting and I hate it)
•Show +´(⌊≠÷2˙)⊸⊑¨updates(≢¨/⊢){𝕊update:
	update⊏˜⍋-⊑¨{count‿next:
		⟨count+1, ((≠update)≠update⊸⊐)⊸/∘(∾to⊏˜from⊐⊢)next⟩
	}•_while_{·‿next: 0<≠next}¨(0⋈⋈)¨update
}¨updates
