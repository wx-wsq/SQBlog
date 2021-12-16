package Service.impl;

import Dao.FaqDao;
import POJO.Faq;
import Service.FaqService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class FaqServerImpl implements FaqService {
    @Autowired
    FaqDao faqDao;
    @Override
    public List<Faq> getFaqs() {
        return faqDao.getFaqs();
    }
}
