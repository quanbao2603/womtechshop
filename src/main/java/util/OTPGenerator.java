package util;

public class OTPGenerator {
	public static String generateOTP(int length) {
		String numbers = "0123456789";
		StringBuilder otp = new StringBuilder();
		for (int i = 0; i < length; i++) {
			int index = (int) (Math.random() * numbers.length());
			otp.append(numbers.charAt(index));
		}
		return otp.toString();
	}
}
