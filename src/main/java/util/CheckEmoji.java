package util;

public class CheckEmoji {
	public static boolean containsEmoji(String input) {
		return input != null && input.codePoints()
				.anyMatch(codepoint -> Character.getType(codepoint) == Character.SURROGATE
						|| (codepoint >= 0x1F600 && codepoint <= 0x1F64F)
						|| (codepoint >= 0x1F300 && codepoint <= 0x1F5FF)
						|| (codepoint >= 0x1F680 && codepoint <= 0x1F6FF)
						|| (codepoint >= 0x2600 && codepoint <= 0x26FF));
	}
}