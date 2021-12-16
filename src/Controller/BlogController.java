package Controller;

import Service.BlogListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BlogController {
    @Autowired
    private BlogListService blogListService;

    @RequestMapping(value = "/BlogPage", method = RequestMethod.GET)
    public String pageHandler(Model model, Integer page,String search,Integer time, String badge) {
        model.addAttribute("page",blogListService.getBlogs(page,search,time,badge));
        model.addAttribute("badges",blogListService.getBadges());
        Integer pageSum = blogListService.getPageSum();
        model.addAttribute("pageSum", pageSum % 3 == 0 ? pageSum / 3 : pageSum / 3 + 1);
        return "/blog/logList/list";
    }
}
