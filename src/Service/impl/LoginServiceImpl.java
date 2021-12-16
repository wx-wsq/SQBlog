package Service.impl;

import Dao.LoginDao;
import Service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
public class LoginServiceImpl implements LoginService {
    @Autowired
    private LoginDao loginDao;
    @Autowired
    private Map<String,Object> paramMap;
    @Override
    public Integer isExistUser(String username) {
        paramMap.clear();
        paramMap.put("username",username);
        return loginDao.isExistUser(paramMap);
    }

    @Override
    public Integer isLegalUser(String username, String password) {
        paramMap.clear();
        paramMap.put("username",username);
        paramMap.put("password",password);
        return loginDao.isLegalUser(paramMap);
    }

    @Override
    public Integer setUser(String username, String password) {
        paramMap.clear();
        paramMap.put("username",username);
        paramMap.put("password",password);
        return loginDao.setUser(paramMap);
    }
}
