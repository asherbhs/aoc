tests‿calibrations←<˘⍉>((+`-2×⊢)':'⊸=)⊸⊔¨•FLines "input.txt"
tests•ParseFloat¨↩
calibrations(•ParseFloat¨((¬×+`-1˙)⊸-' '⊸=)⊸⊔)¨↩

# part 1
•Show +´tests/˜(⊑¨calibrations)⊑∘∊¨(⋈¨tests)(÷∾-)˜´¨1↓¨calibrations
•Show +´tests/˜tests⊑∘∊¨{(𝕨×𝕩)∾(𝕨+𝕩)}´∘⌽¨calibrations

#part 2
•Show +´tests/˜(⊑¨calibrations)⊑∘∊¨(⋈¨tests){
	p←(𝕩-𝕨)÷10⋆1+⌊10⋆⁼𝕨+𝕨=0
	(p/˜(p≠0)∧p=⌊p)∾(𝕩÷𝕨)∾(𝕩-𝕨)
}´¨1↓¨calibrations
•Show +´tests/˜tests⊑∘∊¨{(𝕨×𝕩)∾(𝕨+𝕩)∾𝕨+𝕩×10⋆1+⌊10⋆⁼𝕨+𝕨=0}´∘⌽¨calibrations
