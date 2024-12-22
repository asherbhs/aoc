⎕IO←0

(px py vx vy)←↓⍉↑{(⊃1⊃⎕VFI)¨'-'⎕R'¯'¨⍵⊆⍨⍵∊'-',⎕D}¨⊃⎕NGET 'input.txt' 1

⍝ part 1
⍝ x←11|px+100×vx
⍝ y← 7|py+100×vy
x←101|px+100×vx
y←103|py+100×vy
⍝ ⎕←×/≢⍤⊢⌸{⍵⌿⍨∧/0≠⍵}⍉↑(5(>-<)x),⍥⊂3(>-<)y
⎕←×/≢⍤⊢⌸{⍵⌿⍨∧/0≠⍵}⍉↑(50(>-<)x),⍥⊂51(>-<)y

⍝ part 2
⎕PW←12345

⍝ to manually search through:
⍝ n←0
⍝ {
⍝ 	⎕←n
⍝ 	x←101|px+n×vx
⍝ 	y←103|py+n×vy
⍝ 	⎕←' ''"=⌸######'[⍸⍣¯1{⍵[⍋⍵]}x,¨y]
⍝ 	n+←1
⍝ 	_←⍞
⍝ 	⍬
⍝ }⍣{0}⍬

⍝ a patterns that looks like
⍝ 
⍝ =======
⍝ =======
⍝ 
⍝ first occurs after 30 seconds, and a pattern that looks like
⍝ 
⍝   ||
⍝   ||
⍝   ||
⍝   ||
⍝ 
⍝ first occurs after 81 seconds
⍝ the answer (7858) is the smallest integer n such that 30=103|n and 81=101|n (the patterns happen both horizontally and vertically)

x←101|px+7858×vx
y←103|py+7858×vy
⎕←' ''"=⌸######'[⍸⍣¯1{⍵[⍋⍵]}y,¨x]
