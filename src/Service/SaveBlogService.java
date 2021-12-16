package Service;

import POJO.Blog;
import org.apache.ibatis.annotations.Param;

public interface SaveBlogService {
    Integer modifyBlogData(Integer id,String title,String blogText,String author,String badge);
    Blog getBlog(@Param("id") Integer id);
}
