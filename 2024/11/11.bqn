input←•ParseFloat¨((⊢-˜+`×¬)' '=⊢)⊸⊔⊑•FLines "input.txt"

•Show≠{
	m←0≠𝕩
	∾(¬m)+{
		nd←⌊1+10⋆⁼𝕩
		m←2|nd
		nd(10⋆÷⟜2)⊸(⌊∘÷˜<˘∘⍉∘≍|)⌾((¬m)⊸/)2024⊸×⌾(m⊸/)𝕩
	}⌾(m⊸/)𝕩
}⍟25 input

map←⟨⟩•HashMap⟨⟩
•Show +´75{
	𝕨=0 ? 1 ;
	𝕩=0 ? (𝕨-1)𝕊1 ;
	map.Has 𝕨‿𝕩 ? map.Get 𝕨‿𝕩 ;
	nd←⌊1+10⋆⁼𝕩
	odd←2|nd
	new←nd(10⋆÷⟜2)⊸(⌊∘÷˜∾|)⍟(¬odd)2024⋈∘×⍟odd 𝕩
	news←(𝕨-1)𝕊¨new
	((𝕨-1)⋈¨new) map.Set¨ news
	+´news
}¨input
