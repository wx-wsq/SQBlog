package Controller;

import Service.FaqService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class FaqController {
    @Autowired
    FaqService faqService;
    @RequestMapping(value = "/Faq",method = RequestMethod.GET)
    public String getFaq(Model model){
        model.addAttribute("faqs",faqService.getFaqs());
        return "blog/faq/faq";
    }
}