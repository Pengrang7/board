package com.codingrecipe.board.Mapper;

import com.codingrecipe.board.dto.CommentDTO;
import com.codingrecipe.board.entity.CommentEntity;

public interface CommentMapper {
    CommentDTO commentEntityToDto(CommentEntity commentEntity, Long boardId);
}
