package service;

import java.util.Date;
import java.util.Properties;
import jakarta.mail.*;
import jakarta.mail.internet.*;

public class email {
    static final String FROM_EMAIL = "nguyenquanbao2632005@gmail.com";
    static final String PASSWORD = "zxqe eqmf zsud kgwf";

    private static Session getMailSession() {
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        Authenticator auth = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(FROM_EMAIL, PASSWORD);
            }
        };

        return Session.getInstance(props, auth);
    }

    public static boolean sendEmail(String to, String subject, String htmlContent) {
        try {
            Session session = getMailSession();
            MimeMessage message = new MimeMessage(session);

            message.setFrom(new InternetAddress(FROM_EMAIL));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
            message.setSubject(subject, "UTF-8");
            message.setSentDate(new Date());
            message.setContent(htmlContent, "text/html; charset=UTF-8");

            Transport.send(message);
            System.out.println("✅ Email đã được gửi đến: " + to);
            return true;
        } catch (Exception e) {
            System.err.println("❌ Lỗi khi gửi email: " + e.getMessage());
            return false;
        }
    }

    public String buildEmail(String name, String title, String content) {
    	return "<!DOCTYPE html>\n" +
                "<html>\n" +
                "<head>\n" +
                "  <meta charset=\"UTF-8\">\n" +
                "  <style>\n" +
                "    body { font-family: Arial, sans-serif; background-color: #ffffff; margin: 0; padding: 0; }\n" +
                "    .container { max-width: 600px; margin: auto; padding: 30px; background-color: #f9f9f9;\n" +
                "                border-radius: 10px; box-shadow: 0 0 8px rgba(0,0,0,0.05); }\n" +
                "    .logo { text-align: center; margin-bottom: 20px; }\n" +
                "    .logo img { width: 80px; }\n" +
                "    .content { font-size: 16px; line-height: 1.6; color: #333; }\n" +
                "    .content h2 { color: #007BFF; text-align: center; }\n" +
                "    .highlight-name { color: #d35400; font-weight: bold; }\n" +
                "    .contact-info { margin-top: 20px; font-size: 14px; color: #444; }\n" +
                "    .contact-info a { color: #007BFF; text-decoration: none; }\n" +
                "    .footer { border-top: 1px solid #ccc; margin-top: 40px; padding-top: 20px;\n" +
                "              text-align: center; font-size: 14px; color: #666; }\n" +
                "    .social-icons { margin-top: 10px; margin-bottom: 10px; }\n" +
                "    .social-icons img { width: 28px; margin: 0 6px; vertical-align: middle; }\n" +
                "    .footer a { color: #007BFF; text-decoration: none; }\n" +
                "  </style>\n" +
                "</head>\n" +
                "<body>\n" +
                "  <div class=\"container\">\n" +
                "    <div class=\"logo\">\n" +
                "      <img src=\"https://i.ibb.co/1fmNVHm2/logo.png\" alt=\"WOMTech Logo\">\n" +
                "    </div>\n" +
                "    <div class=\"content\">\n" +
                "      <h2>" + title + "</h2>\n" +
                "      <p>Xin chào <span class=\"highlight-name\">" + name + "</span>,</p>\n" +
                "      <p>" + content + "</p>\n" +
                "      <p class=\"contact-info\">\n" +
                "        Trân trọng,<br>\n" +
                "        <strong>Công ty cổ phần công nghệ và dịch vụ WOMTech</strong><br>\n" +
                "        45 Đinh Tiên Hoàng, Bến Nghé, Q1, TP HCM<br>\n" +
                "        Website: <a href=\"https://www.womtechshop.com\" target=\"_blank\">www.womtechshop.com</a><br>\n" +
                "        Tel: <a href=\"tel:0812514389\">0812514389</a>\n" +
                "      </p>\n" +
                "    </div>\n" +
                "    <div class=\"footer\">\n" +
                "      <div class=\"social-icons\">\n" +
                "        <a href=\"#\"><img src=\"https://cdn-icons-png.flaticon.com/512/5968/5968958.png\" alt=\"X\"></a>\n" +
                "        <a href=\"#\"><img src=\"https://cdn-icons-png.flaticon.com/512/3046/3046122.png\" alt=\"TikTok\"></a>\n" +
                "        <a href=\"#\"><img src=\"https://cdn-icons-png.flaticon.com/512/2111/2111615.png\" alt=\"Telegram\"></a>\n" +
                "        <a href=\"https://www.facebook.com/profile.php?id=61578107927228\"><img src=\"https://cdn-icons-png.flaticon.com/512/733/733547.png\" alt=\"Facebook\"></a>\n" +
                "        <a href=\"#\"><img src=\"https://cdn-icons-png.flaticon.com/512/174/174857.png\" alt=\"LinkedIn\"></a>\n" +
                "        <a href=\"#\"><img src=\"https://cdn-icons-png.flaticon.com/512/2111/2111589.png\" alt=\"Reddit\"></a>\n" +
                "      </div>\n" +
                "      <p>Cảm ơn bạn đã lựa chọn <strong style=\"color:#007BFF;\">WOMTech Shop</strong>.<br>\n" +
                "        Bạn cần hỗ trợ? <a href=\"mailto:23110181@student.hcmute.edu.vn\">Liên hệ bộ phận hỗ trợ khách hàng</a>\n" +
                "      </p>\n" +
                "      <p style=\"font-size: 13px;\">©2025 womtechshop.com. Đã đăng ký bản quyền</p>\n" +
                "    </div>\n" +
                "  </div>\n" +
                "</body>\n" +
                "</html>";
    }

    public static void sendWelcomeEmail(String to, String name) {
        String title = "Chào mừng đến với WOMTechShop!";
        String content = "Cảm ơn bạn đã đăng ký tài khoản. Chúc bạn có trải nghiệm tuyệt vời cùng chúng tôi.";
        email emailService = new email();
        String html = emailService.buildEmail(name, title, content);
        sendEmail(to, title, html);
    }

    public static void sendResetPasswordEmail(String to, String name, String resetLink) {
        String title = "Yêu cầu đặt lại mật khẩu";
        String content = "Click vào liên kết bên dưới để đặt lại mật khẩu:<br><a href='" + resetLink + "'>Đặt lại mật khẩu</a>";
        email emailService = new email();
        String html = emailService.buildEmail(name, title, content);
        sendEmail(to, title, html);
    }

    public static void sendOrderConfirmationEmail(String to, String name, String orderId, String orderDate, String total) {
        String title = "Xác nhận đơn hàng #" + orderId;
        String content = """
                Chúng tôi đã nhận được đơn hàng của bạn:<br>
                - Mã đơn: <strong>%s</strong><br>
                - Ngày: %s<br>
                - Tổng: %s<br><br>
                Chúng tôi sẽ xử lý trong thời gian sớm nhất.
                """.formatted(orderId, orderDate, total);
        email emailService = new email();
        String html = emailService.buildEmail(name, title, content);
        sendEmail(to, title, html);
    }

    public static void sendPromotionEmail(String to, String name, String promoCode, String validUntil) {
        String title = "Ưu đãi dành cho bạn!";
        String content = """
                Nhập mã <strong>%s</strong> để được giảm giá đặc biệt!<br>
                Có hiệu lực đến hết: <strong>%s</strong>
                """.formatted(promoCode, validUntil);
        email emailService = new email();
        String html = emailService.buildEmail(name, title, content);
        sendEmail(to, title, html);
    }

    public static void main(String[] args) {
        sendWelcomeEmail("23110181@student.hcmute.edu.vn", "Nguyễn Quân Bảo");
    }
}
