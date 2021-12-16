package Dao;

import POJO.Blog;
import java.util.List;
import java.util.Map;

public interface BlogListDao {
    Integer getPageSum(Map<String,Object> paramMap);
    List<String> getBadges();
    List<Blog> getBlogs(Map<String,Object> paramMap);
}
