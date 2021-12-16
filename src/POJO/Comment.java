package POJO;

import lombok.Data;

@Data
public class Comment {
    private Integer ID;
    private String commentText;
    private Integer blogId;
    private String author;
    private boolean isDelete;
    public Comment(){}

    public Comment(Integer ID, String commentText, Integer blogId, boolean isDelete,String author) {
        this.ID = ID;
        this.commentText = commentText;
        this.blogId = blogId;
        this.isDelete = isDelete;
        this.author = author;
    }
}
