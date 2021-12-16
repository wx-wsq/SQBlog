package Controller;

import Service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ArticleController {
    @Autowired
    ArticleService articleService;
    @RequestMapping(value = "/Article",method = RequestMethod.GET)
    public String defaultArticle(Model model,String id){
        model.addAttribute("blog",articleService.getArticle(id));
        model.addAttribute("comments",articleService.getComment(id));
        return "/blog/log/log";
    }
    @RequestMapping(value = "/delComment",method = RequestMethod.POST)
    public String delComment(@RequestParam("commentId") Integer commentId, @RequestParam("blogId") Integer blogId){
        if(articleService.delComment(commentId)>0)
            return "redirect:/Article"+"?id="+blogId;
        else
            throw new RuntimeException("ArticleService中delComment方法出错");
    }
    @RequestMapping(value = "/setComment",method = RequestMethod.POST)
    public String setComment(@RequestParam("text") String commentText,@RequestParam("blogId") Integer blogId,@RequestParam(value = "author",defaultValue = "无名") String author){
        if((commentText.contains("</script>")&&commentText.contains("<script>"))||(commentText.contains("</SCRIPT>")&&commentText.contains("<SCRIPT>"))){
            commentText=commentText.replace("<script>","");
            commentText=commentText.replaceFirst("</script>","");
            commentText=commentText.replace("<SCRIPT>","");
            commentText=commentText.replaceFirst("</SCRIPT>","");
        }
        if(articleService.setComment(commentText,blogId,author)>0)
            return "redirect:/Article"+"?id="+blogId;
        else
            throw new RuntimeException("ArticleService中setComment方法出错");
    }
}
