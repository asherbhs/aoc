input ← •FChars 3 ⊑ •args
solutions ← { y‿d: •Import "year" ∾ y ∾ "/day" ∾ d ∾ ".bqn" } 2 ↑ •args
•Show { "1": solutions.SolvePart1 input; "2": solutions.SolvePart2 input } 2 ⊑ •args