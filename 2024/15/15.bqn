lines←•FLines "input.txt"
split←⊑lines⊐<""
map  ←>    split↑lines
moves←∾(split+1)↓lines

# part 1
{
	d←[
		[ 0,  1],
		[ 1,  0],
		[ 0, ¯1],
		[¯1,  0],
	]
	w←[
		¯1+≢map,
		¯1+≢map,
		[0, 0],
		[0, 0],
	]
	map←map
	r←⊑(⥊'@'=map)/⥊↕≢map
	{
		d←𝕩⊏d
		w←𝕩⊏w
		i←(r+d×⊢)¨1+↕|⊑(d≠0)/d÷˜r-w
		p←i⊑map
		o←∧`'O'=p
		{𝕊𝕩:
			map'O'¨⌾((i/˜»o)⊸⊑)↩
			map'.'⌾(r⊸⊑)↩
			r+↩d
			map'@' ⌾(r⊸⊑)↩
		}⍟('.'=p⊑˜⊑o⊐0)@
	}¨">v<^"⊐moves
	•Show +´(+´100‿1×⊢)¨(⥊'O'=map)/⥊↕≢map
}

# part 2
{
	map←(1‿2×≢map)⥊["##", "[]", "..", "@."]⊏˜"#O.@"⊐map
	r←⊑(⥊'@'=map)/⥊↕≢map
	# couldn't be arsed to make this smaller
	{
		𝕊'>':
			i←r⊸+¨0∾¨1+↕(¯1+1⊑≢map)-1⊑r
			p←i⊑map
			o←∧`p∊"[]"
			{𝕊𝕩:
				map(o/map⊑˜i)⌾((i/˜»o)⊸⊑)↩
				map'.'⌾(r⊸⊑)↩
				r+↩0‿1
				map'@'⌾(r⊸⊑)↩
			}⍟('.'=p⊑˜⊑o⊐0)@
		;
		𝕊'v':
			b←⋈r
			(⋈r){
				i←(0⊑r)+𝕨
				bb←1‿0⊸+¨⥊∨´˘∘∊⟜𝕩⊸/(i-1)∾¨0‿1+⌜˜/'['=i⊏map
				b∾↩bb
				bb
			}´⌽1+↕(¯1+0⊑≢map)-0⊑r
			bb←1‿0⊸+¨b
			{𝕊𝕩:
				r+↩1‿0
				s←b⊑map
				map'.'¨⌾( b⊸⊑)↩
				map   s⌾(bb⊸⊑)↩
			}⍟(¬'#'∊bb⊑map)@
		;
		𝕊'<':
			i←r⊸-¨0∾¨1+↕1⊑r
			p←i⊑map
			o←∧`p∊"[]"
			{𝕊𝕩:
				map(o/map⊑˜i)⌾((i/˜»o)⊸⊑)↩
				map'.'⌾(r⊸⊑)↩
				r+↩0‿¯1
				map'@'⌾(r⊸⊑)↩
			}⍟('.'=p⊑˜⊑o⊐0)@
		;
		𝕊'^':
			b←⋈r
			(⋈r){
				i←(0⊑r)-𝕨
				bb←¯1‿0⊸+¨⥊∨´˘∘∊⟜𝕩⊸/(i+1)∾¨0‿1+⌜˜/'['=i⊏map
				b∾↩bb
				bb
			}´⌽1+↕0⊑r
			bb←¯1‿0⊸+¨b
			{𝕊𝕩:
				r+↩¯1‿0
				s←b⊑map
				map'.'¨⌾( b⊸⊑)↩
				map   s⌾(bb⊸⊑)↩
			}⍟(¬'#'∊bb⊑map)@
	}¨moves
	•Show +´(+´100‿1×⊢)¨(⥊'['=map)/⥊↕≢map
}
