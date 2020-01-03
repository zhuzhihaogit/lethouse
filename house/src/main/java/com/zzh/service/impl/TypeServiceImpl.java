package com.zzh.service.impl;

import com.zzh.domain.Type;
import com.zzh.domain.TypeExample;
import com.zzh.mapper.TypeMapper;
import com.zzh.service.TypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by ZZH_PC on 2019/12/27.
 */
@Service
public class TypeServiceImpl implements TypeService{

    @Autowired
    private TypeMapper typeMapper;

    @Override
    public List<Type> getTypeAll() {
        return typeMapper.selectByExample(new TypeExample());
    }
}
