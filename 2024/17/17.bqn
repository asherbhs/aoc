aa‿bb‿cc‿·‿p←12‿12‿12‿0‿9↓¨•FLines "input.txt"
aa‿bb‿cc•ParseFloat¨↩
p↩•ParseFloat∘⋈¨p/˜¬2|↕≠p

out←⟨⟩
ip←0
a‿b‿c←aa‿bb‿cc
Combo←{
	4: a ;
	5: b ;
	6: c ;
	𝕩
}
ToBinary←{
	𝕊0: ⟨⟩ ;
	{d←⌊n÷𝕩 ⋄ n↩𝕩|n ⋄ d}¨⌽2⋆↕⌊1+2⋆⁼n←𝕩
}
FromBinary←0{𝕨+2×𝕩}´⌽
Xor←FromBinary∘{
	l←-𝕨⌈○≠𝕩
	𝕨≠○(l⊸↑)𝕩
}○ToBinary
# Xor↩⊑32•bit._xor○⋈
Do←{
	𝕊 0‿x: a↩⌊a÷2⋆Combo x    ;
	𝕊 1‿x: b Xor↩x           ;
	𝕊 2‿x: b↩8|Combo x       ;
	𝕊 3‿x: ip↩(x-2)⊣⍟(a≠0)ip ;
	𝕊 4‿x: b Xor↩c           ;
	𝕊 5‿x: out∾↩8|Combo x    ;
	𝕊 6‿x: b↩⌊a÷2⋆Combo x    ;
	𝕊 7‿x: c↩⌊a÷2⋆Combo x
}

# part 1
out↩⟨⟩
ip↩0
a‿b‿c↩aa‿bb‿cc
{·:
	Do p⊏˜0‿1+ip
	ip+↩2
}•_while_{·:
	ip<¯1+≠p
}@
•Out ¯1↓∾(•Fmt∾','˙)¨ out

# part 2
# ┌─                           a    b                    c          out
# ╵ 2 4  bst a  b←8|a  ←────┐    a                  8|a          c
#   1 1  bxl 1  b←b≠1       │    a                1≠8|a          c
#   7 5  cdv b  c←b»a       │    a                1≠8|a  (1≠8|a)»a
#   1 5  bxl 5  b←b≠5       │    a              5≠1≠8|a  (1≠8|a)»a
#   0 3  adv 3  a←3»a       │  3»a              5≠1≠8|a  (1≠8|a)»a
#   4 3  bxc 3  b←b≠c       │  3»a  ((1≠8|a)»a)≠5≠1≠8|a  (1≠8|a)»a
#   5 5  out b  out,←8|b    │  3»a  ((1≠8|a)»a)≠5≠1≠8|a  (1≠8|a)»a  8|((1≠8|a)»a)≠5≠1≠8|a
#   3 0  jnz 0  ────────────┘
#       ┘

tens←(¯10↑ToBinary)¨↕2⋆10
ns←{FromBinary(1‿0‿1⊸≠≠¯3↑𝕩↓˜-∘FromBinary)0‿0‿1≠¯3↑𝕩}¨tens
•Show ⌊´FromBinary¨⟨10⥊0⟩(∾´{(𝕩∾¯3⊸↑)¨((¯7↑𝕩)≡7⊸↑)¨⊸/tens/˜ns=𝕨}¨)´p
