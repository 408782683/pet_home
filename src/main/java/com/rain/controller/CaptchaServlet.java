package com.rain.controller;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Random;

@WebServlet("/api/captcha/generate")
public class CaptchaServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        // 设置响应类型
        resp.setContentType("image/jpeg");
        resp.setHeader("Pragma", "no-cache");
        resp.setHeader("Cache-Control", "no-cache");
        resp.setDateHeader("Expires", 0);

        // 图片宽高
        int width = 120;
        int height = 40;

        // 创建图片缓冲区
        BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        Graphics2D g = image.createGraphics();

        // 设置背景色
        g.setColor(new Color(240, 240, 240));
        g.fillRect(0, 0, width, height);

        // 生成4位验证码
        String code = generateCode(4);
        System.out.println(code + "..........");

        // 将验证码存入session
        HttpSession session = req.getSession();
        session.setAttribute("captcha", code.toLowerCase());

        // 绘制干扰线
        Random random = new Random();
        g.setColor(new Color(200, 200, 200));
        for (int i = 0; i < 5; i++) {
            int x1 = random.nextInt(width);
            int y1 = random.nextInt(height);
            int x2 = random.nextInt(width);
            int y2 = random.nextInt(height);
            g.drawLine(x1, y1, x2, y2);
        }

        // 绘制验证码字符
        g.setFont(new Font("Arial", Font.BOLD, 28));
        for (int i = 0; i < code.length(); i++) {
            // 随机颜色
            g.setColor(new Color(random.nextInt(100), random.nextInt(100), random.nextInt(100)));

            // 随机角度
            int degree = random.nextInt(30) - 15;

            // 字符位置
            int x = 20 + i * 25;
            int y = 28;

            // 旋转绘制
            g.rotate(Math.toRadians(degree), x, y);
            g.drawString(String.valueOf(code.charAt(i)), x, y);
            g.rotate(-Math.toRadians(degree), x, y);
        }

        // 绘制干扰点
        for (int i = 0; i < 30; i++) {
            int x = random.nextInt(width);
            int y = random.nextInt(height);
            g.setColor(new Color(random.nextInt(200), random.nextInt(200), random.nextInt(200)));
            g.fillRect(x, y, 2, 2);
        }

        g.dispose();

        // 输出图片
        OutputStream out = resp.getOutputStream();
        ImageIO.write(image, "JPEG", out);
        out.flush();
        out.close();
    }

    /**
     * 生成随机验证码字符串
     * @param length 验证码长度
     * @return 验证码字符串
     */
    private static String generateCode(int length) {
        String chars = "0123456789abcdefghijklmnopqrstuvwxyz";
        Random random = new Random();
        StringBuilder code = new StringBuilder();
        for (int i = 0; i < length; i++) {
            code.append(chars.charAt(random.nextInt(chars.length())));
        }
        return code.toString();
    }
}
