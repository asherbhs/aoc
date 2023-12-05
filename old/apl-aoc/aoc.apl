(year day part path)←1↓2⎕nq#'GetCommandLineArgs'
input←⊃⎕nget path
2⎕fix{(⊂':namespace ns'),⍵,⊂':endnamespace'}⊃⎕nget('year',year,'/day',day,'.apl')1 ⍝ you have to wrap it in a namespace to make it work idk
⎕←{
	⍵≡,'1': ns.SolvePart1 input
	⍵≡,'2': ns.SolvePart2 input
}part
