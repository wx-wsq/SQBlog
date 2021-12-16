package Service;

public interface LoginService {
    Integer isExistUser(String username);
    Integer isLegalUser(String username,String password);
    Integer setUser(String username,String password);
}
