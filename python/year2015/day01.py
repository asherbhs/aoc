def solve_part_1(input: str) -> int:
    floor = 0
    for c in input:
        match c:
            case '(': floor += 1
            case ')': floor -= 1
    return floor

def solve_part_2(input: str) -> int:
    floor = 0
    position = 1
    for c in input:
        match c:
            case '(': floor += 1
            case ')': floor -= 1
        if floor < 0:
            return position
        position += 1
    return -1 # unreachable on valid input