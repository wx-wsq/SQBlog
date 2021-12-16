package Service.impl;

import Dao.BlogListDao;
import POJO.Blog;
import Service.BlogListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class BlogListServiceImpl implements BlogListService {
    private static final Integer limitIndex = 3;
    @Autowired
    private BlogListDao blogListDao;
    @Autowired
    private Map<String, Object> paramMap;

    @Override
    public Integer getPageSum() {
        return blogListDao.getPageSum(paramMap);
    }

    @Override
    public List<String> getBadges() {
        return blogListDao.getBadges();
    }

    @Override
    public List<Blog> getBlogs(Integer page, String search, Integer time, String badge) {
        paramMap.clear();
        if (page == null)
            page = 1;
        if (time != null)
            paramMap.put("time", time);
        if (isNotSearchSplit(search))
            paramMap.put("allText", search);
        if (badge != null)
            paramMap.put("badge", badge);
        paramMap.put("start", (page - 1) * limitIndex);
        paramMap.put("offset", limitIndex);
        return blogListDao.getBlogs(paramMap);
    }

    private boolean isNotSearchSplit(String search) {
        if (search != null && (search.split(";").length > 1 || search.split(";")[0].split(":").length > 1)) {
            String[] initParams = search.split(";");
            String[][] params = new String[initParams.length][2];
            for (int i = 0; i < initParams.length; i++)
                params[i] = initParams[i].split(":");
            for (String[] param : params) paramMap.put(param[0], param[1]);
            return false;
        } else
            return true;
    }
}
