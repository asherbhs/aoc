input←⍉>{•ParseFloat¨𝕩⊔˜(¬-˜⊢×·+`»⊸>)' '≠𝕩}¨•FLines "input.txt"

•Show +´|-˝∧˘input                 # part 1
•Show +´(⊣×⊐˜⊏0∾˜1+⊒⌾⌽∘⊢)˝input    # part 2
