package Service.impl;

import Dao.MessageDao;
import POJO.Faq;
import POJO.Message;
import Service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class MessageServiceImpl implements MessageService {
    @Autowired
    private MessageDao messageDao;
    @Autowired
    private Map<String,Object> paramMap;
    @Override
    public List<Message> getMessage() {
        return messageDao.getMessage();
    }
    @Override
    public Integer delMessage(Integer id){
        paramMap.clear();
        paramMap.put("id",id);
        return messageDao.delMessage(paramMap);
    }
    @Override
    public Integer setMessage(String author, String text) {
        paramMap.clear();
        paramMap.put("author",author);
        paramMap.put("text",text);
        return messageDao.setMessage(paramMap);
    }
}
