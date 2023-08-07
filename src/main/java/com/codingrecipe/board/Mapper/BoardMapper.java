package com.codingrecipe.board.Mapper;

import com.codingrecipe.board.dto.BoardDTO;
import com.codingrecipe.board.entity.BoardEntity;

public interface BoardMapper {
    BoardDTO boardEntityToDto(BoardEntity boardEntity);
}
