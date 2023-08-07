package com.codingrecipe.board.Impl;

import com.codingrecipe.board.Mapper.CommentMapper;
import com.codingrecipe.board.dto.CommentDTO;
import com.codingrecipe.board.entity.CommentEntity;
import org.springframework.stereotype.Component;

@Component
public class CommentMapperImpl implements CommentMapper {

    @Override
    public CommentDTO commentEntityToDto(CommentEntity commentEntity, Long boardId) {
        return CommentDTO.toCommentDTO(commentEntity, boardId);
    }
}