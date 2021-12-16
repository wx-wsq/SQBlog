package Controller;

import Service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
public class LoginController {
    @Autowired
    private LoginService loginService;

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(HttpSession session, HttpServletResponse httpServletResponse, @RequestParam(value = "username", defaultValue = "") String username, @RequestParam("password") String password, @RequestParam(value = "rememberMe", defaultValue = "false") boolean rememberMe) {
        if (loginService.isLegalUser(username, password) == 1) {
            session.setAttribute("loginUser", username);
            if (rememberMe) {
                httpServletResponse.addCookie(new Cookie("loginUser", username));
                httpServletResponse.addCookie(new Cookie("UserPassword", password));
            }
        } else if (loginService.isExistUser(username) == 1)
            session.setAttribute("loginError", "已存在此用户,但密码或用户名错误");
        else {
            if (loginService.setUser(username, password) > 0) {
                session.setAttribute("register", "注册成功！");
                session.setAttribute("loginUser", username);
            } else
                session.setAttribute("loginError", "注册时出现不知名错误...");
        }
        return "index";
    }

    @RequestMapping("/offline")
    public String offlineOfAdmin(HttpSession session) {
        session.removeAttribute("loginUser");
        return "index";
    }
}
