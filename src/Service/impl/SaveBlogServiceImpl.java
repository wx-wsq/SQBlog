package Service.impl;

import Dao.SaveBlogDao;
import POJO.Blog;
import Service.SaveBlogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.nio.charset.StandardCharsets;
@Service
public class SaveBlogServiceImpl implements SaveBlogService {
    @Autowired
    private SaveBlogDao saveBlogDao;
    @Override
    public Integer modifyBlogData(Integer ID, String title, String blogText, String author, String badge) {
        Blog blog;
        if (ID == null) {
            blog = new Blog(null, title, blogText.getBytes(StandardCharsets.UTF_8), author, null, null, badge, false);
            saveBlogDao.createBlog(blog);
        } else {
            blog = new Blog(ID, title, blogText.getBytes(StandardCharsets.UTF_8), author, null, null, badge, false);
            saveBlogDao.modifyBlog(blog);
        }
        return blog.getID();
    }

    @Override
    public Blog getBlog(Integer id) {
        return saveBlogDao.getBlog(id);
    }
}
