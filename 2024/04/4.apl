⎕IO←0

input←↑⊃⎕NGET'input.txt'1

'disp'⎕cy'dfns'
⎕pw←12345

Sin←1∘○
Cos←2∘○

⍝ part 1
star ←⌊.5+(0,¨⍨⍳4)∘.(+.×)⍨+.×\4⍴⊂2 2⍴(Cos,-⍤Sin,Sin,Cos)2÷⍨○1
star⍪←⌊.5+( ,⍨¨⍳4)∘.(+.×)⍨+.×\4⍴⊂2 2⍴(Cos,-⍤Sin,Sin,Cos)2÷⍨○1
⎕←+/'XMAS'≡⍤1⊢input[i⌿⍨∧/∧/¨(0∘≤∧<∘(≢input))i←,[0 1]star∘.+⍨⍸'X'⍷input]

⍝ part 2
star ←⍉⍪⌊.5++.×∘(1  1)¨+.×\2⍴⊂2 2⍴(Cos,-⍤Sin,Sin,Cos)○1
star⍪←  ⌊.5++.×∘(1 ¯1)¨+.×\2⍴⊂2 2⍴(Cos,-⍤Sin,Sin,Cos)○1
⎕←+/∧/1=+/'SM'⍳input[i⌿⍨∧/∧/∧/¨(0∘≤∧<∘(≢input))i←star∘.+⍨⍸'A'⍷input]
