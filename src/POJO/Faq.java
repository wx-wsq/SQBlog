package POJO;

import lombok.Data;

import java.util.Date;

@Data
public class Faq {
    private Integer ID;
    private String versionNumber;
    private String versionNumberText;
    private String versionBodyTitle;
    private byte[] versionBodyText;
    private String bugTitle;
    private String bugText;
    private String contactTitle;
    private String contactText;
    private boolean isDelete;
    private Date createTime;
    public Faq(){}

    public Faq(Integer ID, String versionNumber, String versionNumberText, String versionBodyTitle, byte[] versionBodyText,
               String bugTitle, String bugText, String contactTitle, String contactText, Date createTime, boolean isDelete) {
        this.ID = ID;
        this.versionNumber = versionNumber;
        this.versionNumberText = versionNumberText;
        this.versionBodyTitle = versionBodyTitle;
        this.versionBodyText = versionBodyText;
        this.bugTitle = bugTitle;
        this.bugText = bugText;
        this.contactTitle = contactTitle;
        this.contactText = contactText;
        this.createTime=createTime;
        this.isDelete = isDelete;
    }
}
