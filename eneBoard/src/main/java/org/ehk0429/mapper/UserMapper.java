package org.ehk0429.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.ehk0429.domain.UserVO;

public interface UserMapper {

	@Select("SELECT * FROM user")
	public List<UserVO> getList();
}
