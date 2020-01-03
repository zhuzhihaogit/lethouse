package com.zzh.controller;

import com.github.pagehelper.PageInfo;
import com.zzh.domain.District;
import com.zzh.service.DistrictService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by ZZH_PC on 2019/12/22.
 */
@Controller
public class DistrictController {

    @Autowired
    private DistrictService districtService;

    @RequestMapping("/getDistrictData")
    @ResponseBody
    public Map<String,Object> getDistrictData(Integer page,Integer rows){
        PageInfo pageInfo = districtService.getDistrictAll(page, rows);

        Map<String,Object> map = new HashMap<>();
        map.put("total",pageInfo.getTotal());
        map.put("rows",pageInfo.getList());

        return map;
    }

    @RequestMapping("/add")
    @ResponseBody
    public Map<String,Object> add(District district){

        Integer i = districtService.addDistrict(district);

        Map<String,Object> map = new HashMap<>();

        map.put("result",i);

        return map;
    }

    @RequestMapping("/update")
    @ResponseBody
    public Map<String,Object> update(District district){

        Integer i = districtService.updateDistrict(district);

        Map<String,Object> map = new HashMap<>();

        map.put("result",i);

        return map;
    }

    @RequestMapping("/deleteSome")
    @ResponseBody
    public Map<String,Object> deleteSome(String ids){

        String[] id = ids.split(",");
        Integer[] idList = new Integer[id.length];

        for (int i = 0; i < id.length; i++) {
            idList[i] = new Integer(id[i]);
        }

        Integer i = districtService.removeSome(idList);

        Map<String,Object> map = new HashMap<>();

        map.put("result",i);

        return map;
    }

    @RequestMapping("/showDistrict")
    @ResponseBody
    public List<District> showDistrict(){

        List<District> districtList = districtService.getDistrictAll();

        return districtList;
    }

}
