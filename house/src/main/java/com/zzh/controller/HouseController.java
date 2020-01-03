package com.zzh.controller;

import com.github.pagehelper.PageInfo;
import com.zzh.domain.House;
import com.zzh.domain.SearchCondition;
import com.zzh.domain.User;
import com.zzh.service.HouseService;
import com.zzh.util.FileUploadUtil;
import com.zzh.util.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by ZZH_PC on 2019/12/27.
 */
@Controller
public class HouseController {

    @Autowired
    private HouseService houseService;

    @RequestMapping("/addHouse")
    @ResponseBody
    public Map<String,Object> addHouse(House house, HttpSession session,@RequestParam(value = "pfile",required = false) CommonsMultipartFile com){

        String filename = com.getOriginalFilename();
        //获取后缀名
        String sufName = filename.substring(filename.lastIndexOf("."));
        //新文件名
        String newName = System.currentTimeMillis() + sufName;
        //存储位置
        String path = "G:\\images\\" + newName;

        File file = new File(path);
        try {
            com.transferTo(file);
        } catch (IOException e) {
            e.printStackTrace();
        }
        User user = (User) session.getAttribute("user");

        house.setId(System.currentTimeMillis()+"");
        house.setUserId(user.getId());
        house.setPath(newName);

        Integer i = houseService.addHouse(house);

        Map<String,Object> map = new HashMap<>();

        map.put("result",i);

        return map;
    }

    @RequestMapping("/showHouse")
    public ModelAndView showHouse(PageUtil pageUtil, HttpSession session, ModelAndView mv){
        User user = (User) session.getAttribute("user");

        pageUtil.setRows(5);

        if(pageUtil.getPage()==null || pageUtil.getPage()==0){
            pageUtil.setPage(1);
        }

        PageInfo<House> pageInfo = houseService.findHouseByUser(user.getId(), pageUtil);

        mv.addObject("pageInfo",pageInfo);

        mv.setViewName("manage");

        return mv;
    }

    @RequestMapping("/updateHouseUI")
    public ModelAndView updateHouseUI(String id,ModelAndView mv){

        House house = houseService.findHouseById(id);

        mv.addObject("house",house);

        mv.setViewName("updateHouse");

        return mv;
    }

    @RequestMapping("/updateHouse")
    public Integer updateHouse(House house,String oldFile,@RequestParam(value = "pfile",required = false) CommonsMultipartFile com){

        if(com.getOriginalFilename()!=null && com.getOriginalFilename()!=""){
            File file = new File(FileUploadUtil.path + oldFile);

            if(file.exists()){
                file.delete();
            }

            String newName = FileUploadUtil.fileUpload(com.getOriginalFilename(), com);

            house.setPath(newName);
        }

        Integer i = houseService.modifyHouse(house);

        return i;
    }

    @RequestMapping("/delHouse")
    public String delHouse(String id,Integer isdel){
        houseService.delHouse(id, isdel);

        return "redirect:showHouse";
    }

    @RequestMapping("/isPass")
    @ResponseBody
    public Map<String,Object> isPass(PageUtil pageUtil){

        if (pageUtil.getPage()==0 || pageUtil.getPage() == null) {
            pageUtil.setPage(1);
        }

        PageInfo<House> pageInfo = houseService.isPassHouse(pageUtil);

        Map<String,Object> map = new HashMap<>();

        map.put("total",pageInfo.getTotal());
        map.put("rows",pageInfo.getList());

        return map;
    }

    @RequestMapping("/passHouse")
    @ResponseBody
    public String passHouse(String id){
        Integer i = houseService.passHouse(id);

        return "{\"result\":\""+i+"\"}";
    }

    @RequestMapping("/showAllHouse")
    public ModelAndView showAllHouse(ModelAndView mv,PageUtil pageUtil){

        pageUtil.setRows(5);

        if(pageUtil.getPage() == null){
            pageUtil.setPage(1);
        }

        PageInfo<House> pageInfo = houseService.findAllHouse(pageUtil);

        mv.addObject("pageInfo",pageInfo);

        mv.setViewName("list");

        return mv;
    }

    @RequestMapping("/showHouseByCondition")
    public ModelAndView showHouseByCondition(SearchCondition condition,PageUtil pageUtil,ModelAndView mv){

        pageUtil.setRows(5);

        PageInfo<House> pageInfo = houseService.findHouseByCondition(condition, pageUtil);

        mv.addObject("pageInfo",pageInfo);
        mv.addObject("condition",condition);

        mv.setViewName("list");

        return mv;
    }
}
