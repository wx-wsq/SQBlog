package Service.impl;

import Dao.LinkDao;
import POJO.Link;
import Service.LinkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
@Service
public class LinkServiceImpl implements LinkService {
    @Autowired
    LinkDao linkDao;
    @Override
    public List<Link> getLink() {
        return linkDao.getLink();
    }
}
