package POJO;

import lombok.Data;

@Data
public class Link {
    private Integer ID;
    private String title;
    private String imageUrl;
    private String linkText;
    private String url;
    public Link(){}

    public Link(Integer ID, String title, String imageUrl, String linkText,String url) {
        this.ID = ID;
        this.title = title;
        this.imageUrl = imageUrl;
        this.linkText = linkText;
        this.url=url;
    }
}
