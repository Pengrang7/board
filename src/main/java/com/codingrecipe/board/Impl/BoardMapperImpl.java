package com.codingrecipe.board.Impl;

import com.codingrecipe.board.Mapper.BoardMapper;
import com.codingrecipe.board.dto.BoardDTO;
import com.codingrecipe.board.entity.BoardEntity;
import org.springframework.stereotype.Component;

@Component
public class BoardMapperImpl implements BoardMapper {

    @Override
    public BoardDTO boardEntityToDto(BoardEntity boardEntity) {
        return BoardDTO.toBoardDTO(boardEntity);
    }
}