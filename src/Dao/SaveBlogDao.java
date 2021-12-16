package Dao;

import POJO.Blog;

public interface SaveBlogDao {
    Integer createBlog(Blog blog);

    Integer modifyBlog(Blog blog);

    Blog getBlog(Integer id);
}
