package Dao;

import POJO.Faq;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface FaqDao {
    @Select("select * from blog.blog_version where is_delete is false")
    List<Faq> getFaqs();
}
