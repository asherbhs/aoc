year‿day‿part‿path ← •args
input ← •FChars path
SolvePart1‿SolvePart2 ← •Import "year"∾year∾"/day"∾day∾".bqn"
•Show {
	"1": SolvePart1 input;
	"2": SolvePart2 input
} part