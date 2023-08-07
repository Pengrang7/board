package com.codingrecipe.board.Impl;

import java.util.List;

import com.codingrecipe.board.Mapper.UserMapper;
import com.codingrecipe.board.dto.user;
import com.codingrecipe.board.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService {
    private final UserMapper userMapper;

    @Override
    public List<user> getUserList() {
        return userMapper.getUserList();
    }

}