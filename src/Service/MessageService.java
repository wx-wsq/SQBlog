package Service;

import POJO.Message;

import java.util.List;

public interface MessageService {
    List<Message> getMessage();
    Integer delMessage(Integer id);
    Integer setMessage(String author,String text);
}
