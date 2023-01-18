from sys       import argv
from importlib import import_module

[year, day, part, path] = argv[1:]

input_file = open(path, 'r')
input = input_file.read()
input_file.close()

solutions = import_module('year' + year + '.' + 'day' + day)
solve = solutions.solve_part_1 if part == '1' else solutions.solve_part_2

print(solve(input))