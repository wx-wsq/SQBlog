package Service.impl;

import Dao.ArticleDao;
import POJO.Blog;
import POJO.Comment;
import Service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
@Service
public class ArticleServiceImpl implements ArticleService {
    @Autowired
    ArticleDao articleDao;
    @Autowired
    Map<String,Object> paramMap;

    @Override
    public Blog getArticle(String blogId) {
        paramMap.clear();
        if(blogId==null||blogId.equals("")||blogId.equals("null"))
            paramMap.put("blogId",1);
        else
            paramMap.put("blogId",blogId);
        return articleDao.getArticle(paramMap);
    }

    @Override
    public List<Comment> getComment(String blogId) {
        paramMap.clear();
        if(blogId==null||blogId.equals("")||blogId.equals("null"))
            paramMap.put("blogId",1);
        else
            paramMap.put("blogId",blogId);
        return articleDao.getComment(paramMap);
    }

    @Override
    public Integer setComment(String commentText, Integer blogId, String commentAuthor) {
        paramMap.clear();
        paramMap.put("commentText",commentText);
        paramMap.put("blogId",blogId);
        paramMap.put("commentAuthor",commentAuthor);
        return articleDao.setComment(paramMap);
    }

    @Override
    public Integer delComment(Integer commentId) {
        paramMap.clear();
        paramMap.put("commentId",commentId);
        return articleDao.delComment(paramMap);
    }
}
