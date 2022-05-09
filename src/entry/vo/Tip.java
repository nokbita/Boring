package entry.vo;

import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

public class Tip {
    private String text;
    private String color;
    private int status;

    public Tip(String text, String color, int status) {
        this.text = text;
        this.color = color;
        this.status = status;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String toJSON() {
        return "{" +
                "\"text\":\"" + text + "\"," +
                "\"color\":\"" + color + "\"," +
                "\"status\":" + status +
                "}";
    }

    public String toURLParam() {
        return "text=" + URLEncoder.encode(text, StandardCharsets.UTF_8) + "&" +
                "color=" + color + "&" +
                "status=" + status;
    }
}
