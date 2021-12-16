package POJO;

import lombok.Data;
import java.util.Date;

@Data
public class Message {
    private Integer id;
    private String text;
    private String author;
    private Date createTime;
    private boolean isDelete;
    public Message(){}

    public Message(Integer id, String text, String author,Date createTime, boolean isDelete) {
        this.id = id;
        this.text = text;
        this.author = author;
        this.createTime=createTime;
        this.isDelete = isDelete;
    }
}
