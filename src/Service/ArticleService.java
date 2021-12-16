package Service;

import POJO.Blog;
import POJO.Comment;

import java.util.List;

public interface ArticleService {
    Blog getArticle(String id);
    List<Comment> getComment(String blogId);
    Integer setComment(String commentText,Integer blogId,String commentAuthor);
    Integer delComment(Integer commentId);
}
