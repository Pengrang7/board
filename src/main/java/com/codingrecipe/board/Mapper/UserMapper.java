package com.codingrecipe.board.Mapper;

import java.util.List;

import com.codingrecipe.board.dto.user;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface UserMapper {
    List<user> getUserList();
}