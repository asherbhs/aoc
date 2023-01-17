import java.nio.file.Files;
import java.nio.file.Path;

import year2015.Day01;

public class AOC {
	public static void main(String[] args) {
		String year = args[0];
		String day  = args[1];
		String part = args[2];
		String path = args[3];

		String input = null;
		try {
			input = Files.readString(Path.of(path));
		} catch (Exception e) {
			System.exit(0);
		}

		switch (year) {
		case "2015":
			switch (day) {
			case "01":
				if (part.equals("1"))
					System.out.println(year2015.Day01.solvePart1(input));
				else
					System.out.println(year2015.Day01.solvePart2(input));
				break;
			}
			break;
		}
	}
}