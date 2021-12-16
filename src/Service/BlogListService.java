package Service;

import POJO.Blog;
import java.util.List;

public interface BlogListService {
    Integer getPageSum();
    List<String> getBadges();
    List<Blog> getBlogs(Integer page, String search, Integer time, String badge);
}
