package Controller;

import Service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
@Controller
public class MessageController {
    @Autowired
    MessageService messageService;
    @RequestMapping(value="/messages",method = RequestMethod.GET)
    public String getMessage(Model model){
        model.addAttribute("messages",messageService.getMessage());
        return "blog/message/message";
    }
    @RequestMapping(value = "/delMessage",method = RequestMethod.POST)
    public String delMessage(@RequestParam("delMessage") Integer id){

        if(messageService.delMessage(id)>0) {
            return "redirect:/messages";
        }
        else
            throw new RuntimeException("messageController中delMessage方法出错...");
    }
    @RequestMapping(value = "setMessage",method = RequestMethod.POST)
    public String setMessage(@RequestParam("text") String text,@RequestParam(value = "author",defaultValue = "无名") String author){
        if((text.contains("</script>")&&text.contains("<script>"))||(text.contains("</SCRIPT>")&&text.contains("<SCRIPT>"))){
            text=text.replace("<script>","");
            text=text.replaceFirst("</script>","");
            text=text.replace("<SCRIPT>","");
            text=text.replaceFirst("</SCRIPT>","");
        }
        if(messageService.setMessage(author, text)>0)
            return "redirect:messages";
        else
            throw new RuntimeException("messageController中setMessage方法出错...");
    }
}
