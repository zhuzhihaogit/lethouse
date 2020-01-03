package com.zzh.controller;

import com.zzh.domain.Street;
import com.zzh.service.StreetService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by ZZH_PC on 2019/12/27.
 */
@Controller
public class StreetController {

    @Autowired
    private StreetService streetService;

    @RequestMapping("/showStreet")
    @ResponseBody
    public List<Street> showStreet(Integer districtId){

        List<Street> streetList = streetService.getStreetById(districtId);

        return streetList;
    }

}
