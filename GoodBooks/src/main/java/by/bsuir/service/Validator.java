package by.bsuir.service;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Validator {

	public static boolean isNumberInString(String text) {
		Pattern p = Pattern.compile("[à-ÿÀ-ÿa-zA-Z]+");
		Matcher m = p.matcher(text);
		return m.matches();
	}

}
