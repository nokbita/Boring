<%@ page import="java.awt.image.BufferedImage" %>
<%@ page import="java.awt.*" %>
<%@ page import="java.util.Random" %>
<%@ page import="javax.imageio.ImageIO" %><%--
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
    graphics.setColor(new Color(200,200,200));
    graphics.fillRect(0, 0, width, height);
    // 产生随机验证码
    Random r = new Random();
    int rNum = r.nextInt(8999) + 1000;
    String rStr = String.valueOf(rNum);
    // 将验证啊存入 session
    session.setAttribute("rStr", rStr);
    // 将验证码画到图片中
    graphics.setColor(Color.BLACK);
    graphics.setFont(new Font("", Font.PLAIN, 20));
    graphics.drawString(rStr, 10, 17);
    // 产生随机的100个干扰点
    for (int i = 0; i < 100; i++) {
        int x = r.nextInt(width);
        int y = r.nextInt(height);
        graphics.drawOval(x, y, 1, 1);
    }
    // 输出图像到页面
    ImageIO.write(image, "JPEG", response.getOutputStream());
    out.clear();
    out = pageContext.pushBody();
%>
</body>
</html>
