package year2015;

public class Day01 {
	public static int solvePart1(String input) {
		int floor = 0;
		for (char c : input.toCharArray()) {
			if (c == '(') floor++;
			if (c == ')') floor--;
		}
		return floor;
	}

	public static int solvePart2(String input) {
		int floor = 0;
		int position = 1;
		for (char c : input.toCharArray()) {
			if (c == '(') floor++;
			if (c == ')') floor--;
			if (floor < 0)
				return position;
			position++;
		}
		return -1; // unreachable for valid input
	}
}
