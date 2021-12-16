package Dao;

import POJO.Message;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import java.util.List;
import java.util.Map;

public interface MessageDao {
    @Select("select * , messages_text text from blog.message where is_delete is false")
    List<Message> getMessage();
    @Update("update blog.message set is_delete=true where id=#{id}")
    Integer delMessage(Map<String,Object> paramMap);
    @Insert("insert into blog.message(messages_text, author) values (#{text},#{author})")
    Integer setMessage(Map<String,Object> paramMap);
}
