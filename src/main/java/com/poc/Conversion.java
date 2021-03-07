package com.poc;

public class Conversion {
	public static String camelCase(String value) {
		StringBuilder finalString = new StringBuilder();
		if (value == null || value.isEmpty()) {
			return value;
		} else {
			int len = value.length();
			char[] ch = value.toCharArray();
			for (int i = 0; i < len; i++) {
				if (i == 0) {
					finalString.append(Character.toLowerCase(value.charAt(i)));
				} else if (ch[i] == ' ') {
					i = checkEmpty(i, ch);
					finalString.append(Character.toUpperCase(value.charAt(i)));
				} else
					finalString.append(Character.toLowerCase(value.charAt(i)));
			}
			return finalString.toString();
		}
	}

	private static int checkEmpty(int i, char[] ch) {
		int x = i;
		if (ch[i] == ' ') {
			i++;
			x = checkEmpty(i, ch);
		}
		return x;
	}
}