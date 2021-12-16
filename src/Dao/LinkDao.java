package Dao;

import POJO.Link;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface LinkDao {
    @Select("select * from blog.links")
    List<Link> getLink();
}
