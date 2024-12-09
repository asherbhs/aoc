input←⊑•FLines "input.txt"

n←"0123456789"⊐input
m←2|↕≠n
disk_map←∾´n⥊¨¯1¨⌾(m⊸/)+`m

map←disk_map
{
	i‿j: ¯1≠i⊑map ? (i+1)‿j ;
	i‿j: ¯1=j⊑map ? i‿(j-1) ;
	i‿j:
		map⌽⌾(i‿j⊸⊏)↩
		⟨i+1, j-1⟩
}•_while_(<´)0∾¯1+≠map
•Show +´↕∘≠⊸×0⌈map

map↩disk_map
l‿p←n⋈○(m⊸/)»+`n
{
	¯1=𝕩⊑disk_map ? -⟜1•_while_(¯1=⊑⟜disk_map)𝕩 ;
	id←𝕩⊑disk_map
	j←-⟜1•_while_(id=⊑⟜disk_map)𝕩
	d←𝕩-j
	i←⊑1⊐˜(j≥p)∧(d≤l)
	move←i<≠l
	q←(move×i)⊑p
	map⌽⌾(((q+↕d)∾j+1+↕d)⊸⊏)⍟move↩
	l-⟜d⌾(i⊸⊑)⍟move↩
	p+⟜d⌾(i⊸⊑)⍟move↩
	j
}•_while_(0≠⊑⟜disk_map)¯1+≠disk_map
•Show +´↕∘≠⊸×0⌈map
