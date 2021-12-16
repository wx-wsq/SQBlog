package Controller;

import Service.SaveBlogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
@Controller
public class ModifyBlogDataController {
    @Autowired
    private SaveBlogService saveBlogService;
    @RequestMapping(value = "saveBlogData",method = RequestMethod.POST)
        public String saveBlogData(Integer ID, String title, String blogText, String author, String badge) {
        ID=saveBlogService.modifyBlogData(ID, title, blogText, author, badge);
        return "redirect:/modifyBlogData"+"?ID="+ID;
    }
    @RequestMapping(value = "modifyBlogData",method = RequestMethod.GET)
    public String createOrModifyBlogByID(Model model, Integer ID){
        model.addAttribute("blog",saveBlogService.getBlog(ID));
        return "/blog/log/modifyBlog";
    }
}
