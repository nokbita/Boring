<%@ page import="java.awt.image.BufferedImage" %>
<%@ page import="java.awt.*" %>
<%@ page import="java.util.Random" %>
<%@ page import="javax.imageio.ImageIO" %>
<%@ page import="java.awt.geom.AffineTransform" %><%--
  Created by IntelliJ IDEA.
  User: nokbita
  Date: 2022/5/6
  Time: 14:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>生成验证码图片</title>
</head>
<body>
<%
    response.setHeader("Cache-Control", "no-cache");
    // 在内存中创建图像
    int width = 60, height = 20;
    BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);

    // 获取画笔
    Graphics graphics = image.getGraphics();
    // 设定背景色
    graphics.setColor(new Color(255,255,255));
    graphics.fillRect(0, 0, width, height);
    // 产生随机验证码
    Random r = new Random();
    int rNum = r.nextInt(8999) + 1000;
    String rStr = String.valueOf(rNum);
    // 将验证码存入 session
    session.setAttribute("rStr", rStr);
    // 将验证码画到图片中
    int xx = 8;
    for (int i = 0; i < rStr.length(); i++) {
        char c = rStr.charAt(i);
        // 设置字体
        int f = i % 2 == 0 ? 1 : 2;
        graphics.setFont(new Font("", f, 20));
        // 随机产生颜色
        int rC = (int) (Math.random() * 255);
        int gC = (int) (Math.random() * 255);
        int bC = (int) (Math.random() * 255);
        graphics.setColor(new Color(rC, gC, bC));
        // 画字符串
        graphics.drawString(String.valueOf(c), xx, 17);
        xx += 12;
    }

    graphics.setColor(Color.BLACK);
    // 产生随机的50个干扰点
    for (int i = 0; i < 50; i++) {
        int x = r.nextInt(width);
        int y = r.nextInt(height);
        graphics.drawOval(x, y, 1, 1);
    }
    // 产生随机的4个直线干扰
    for (int i = 0; i < 3; i++) {
        int x = r.nextInt(width);
        int y = r.nextInt(height);
        int x2 = r.nextInt(width);
        int y2 = r.nextInt(height);
        graphics.drawLine(x,y,x2,y2);
    }
    // 输出图像到页面
    ImageIO.write(image, "JPEG", response.getOutputStream());
    out.clear();
    out = pageContext.pushBody();
%>
</body>
</html>
