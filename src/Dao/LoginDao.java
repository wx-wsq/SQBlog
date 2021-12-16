package Dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.Map;

public interface LoginDao {
    @Select("select count(*) from blog.user where blog.user.user_name=#{username}")
    Integer isExistUser(Map<String, Object> paramMap);

    @Select("select count(*) from blog.user where blog.user.user_name=#{username} and binary blog.user.user_password=#{password}")
    Integer isLegalUser(Map<String, Object> paramMap);

    @Insert("insert into blog.user(user_name,user_password) values(#{username},#{password})")
    Integer setUser(Map<String, Object> paramMap);
}
