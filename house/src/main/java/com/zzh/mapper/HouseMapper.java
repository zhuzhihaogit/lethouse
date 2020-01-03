package com.zzh.mapper;

import com.zzh.domain.House;
import com.zzh.domain.HouseExample;
import com.zzh.domain.SearchCondition;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface HouseMapper {
    int deleteByPrimaryKey(String id);

    int insert(House record);

    int insertSelective(House record);

    List<House> selectByExample(HouseExample example);

    House selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(House record);

    int updateByPrimaryKey(House record);

    List<House> selectHouseByUser(Integer userId);

    House selectHouseById(String id);

    Integer delHouse(@Param("id")String id,@Param("isdel") Integer isdel);

    List<House> isPassHouse();

    Integer passHouse(String id);

    @Select("select h.ID,h.USER_ID userId,h.TYPE_ID typeId,h.TITLE,h.DESCRIPTION,h.PRICE,h.PUBDATE,h.FLOORAGE,h.CONTACT,h.STREET_ID streetId,h.path ,u.`NAME` userName,s.`NAME` streetName,t.`NAME` typeName,s.district_id districtId,h.ispass,h.isdel,d.name districtName from house h " +
            "    left join users u on h.USER_ID = u.ID " +
            "    left join street s on s.ID = h.STREET_ID " +
            "    left join type t on t.ID = h.TYPE_ID " +
            "    left join district d on d.ID = s.district_id " +
            "    where h.ispass = 1 and h.isdel = 0 ")
    List<House> selectAllHouse();

    List<House> selectHouseByCondition(SearchCondition condition);
}