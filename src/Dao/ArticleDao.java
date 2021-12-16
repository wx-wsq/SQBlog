package Dao;

import POJO.Blog;
import POJO.Comment;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;
import java.util.Map;

public interface ArticleDao {
    @Select("select * from blog.log where id=#{blogId} and blog.log.is_delete=false")
    Blog getArticle(Map<String,Object> paramMap);
    @Select("select * from blog.comment join blog.log on comment.blog_id =log.ID where blog.log.id=#{blogId} and blog.comment.is_delete=false")
    List<Comment> getComment(Map<String,Object> paramMap);
    @Insert("insert into blog.comment(comment_text, blog_id, author) values (#{commentText},#{blogId},#{commentAuthor})")
    Integer setComment(Map<String,Object> paramMap);
    @Update("update blog.comment set is_delete=true where blog.comment.id=#{commentId}")
    Integer delComment(Map<String,Object> paramMap);
}
