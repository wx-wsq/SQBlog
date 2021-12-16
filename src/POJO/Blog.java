package POJO;

import lombok.Data;
import java.util.Date;

@Data
public class Blog {
    private Integer ID;
    private String title;
    private byte[] blogText;
    private String author;
    private Date createTime;
    private Date modifyTime;
    private String badge;
    private boolean isDelete;

    public Blog() {}

    public Blog(Integer ID, String title, byte[] blogText, String author, Date createTime, Date modifyTime, String badge, boolean isDelete) {
        this.ID = ID;
        this.title = title;
        this.blogText = blogText;
        this.author = author;
        this.createTime = createTime;
        this.modifyTime = modifyTime;
        this.badge = badge;
        this.isDelete = isDelete;
    }
}
