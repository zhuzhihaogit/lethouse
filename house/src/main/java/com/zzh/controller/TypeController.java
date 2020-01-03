package com.zzh.controller;

import com.zzh.domain.Type;
import com.zzh.service.TypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by ZZH_PC on 2019/12/27.
 */
@Controller
public class TypeController {

    @Autowired
    private TypeService typeService;

    @RequestMapping("/showType")
    @ResponseBody
    public List<Type> showType(){

        List<Type> typeList = typeService.getTypeAll();

        return typeList;
    }
}
