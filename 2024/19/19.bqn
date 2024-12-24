towels‿patterns←(⊑⋈2⊸↓)•FLines "input.txt"
towels((2÷˜2⊸×-˜+`×¬)∊⟜", ")⊸⊔↩

# part 1
possible←⟨""⟩•HashMap⟨1⟩
•Show +´{
	possible.Has 𝕩 ? possible.Get 𝕩 ;
	p⊣𝕩 possible.Set p←∨´𝕊¨(↓⟜𝕩¨/˜towels≡¨↑⟜𝕩¨)≠¨towels
}¨patterns

# part 1
count←⟨""⟩•HashMap⟨1⟩
•Show +´{
	count.Has 𝕩 ? count.Get 𝕩 ;
	p⊣𝕩 count.Set p←+´𝕊¨(↓⟜𝕩¨/˜towels≡¨↑⟜𝕩¨)≠¨towels
}¨patterns
