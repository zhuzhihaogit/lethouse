package com.zzh.mapper;

import com.zzh.domain.Street;
import com.zzh.domain.StreetExample;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface StreetMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Street record);

    int insertSelective(Street record);

    List<Street> selectByExample(StreetExample example);

    Street selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Street record);

    int updateByPrimaryKey(Street record);
}