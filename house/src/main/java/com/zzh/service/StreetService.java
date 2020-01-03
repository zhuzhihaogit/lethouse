package com.zzh.service;

import com.zzh.domain.Street;

import java.util.List;

/**
 * Created by ZZH_PC on 2019/12/27.
 */
public interface StreetService {
    List<Street> getStreetById(Integer districtId);
}
