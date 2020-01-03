package com.zzh.domain;

import com.zzh.util.PageUtil;

/**
 * Created by ZZH_PC on 2019/12/24.
 */
public class Condition extends PageUtil{
    private String name;
    private String tele;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTele() {
        return tele;
    }

    public void setTele(String tele) {
        this.tele = tele;
    }
}
