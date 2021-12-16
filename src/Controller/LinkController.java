package Controller;

import Dao.LinkDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LinkController {
    @Autowired
    LinkDao linkDao;
    @RequestMapping(value = "links",method = RequestMethod.GET)
    public String getLink(Model model){
        model.addAttribute("links",linkDao.getLink());
        return "blog/links/links";
    }
}