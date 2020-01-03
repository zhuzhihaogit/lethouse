package com.zzh.util;

import org.springframework.stereotype.Component;

/**
 * Created by ZZH_PC on 2019/12/24.
 */
@Component
public class PageUtil {
    private Integer page;
    private Integer rows;

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public Integer getRows() {
        return rows;
    }

    public void setRows(Integer rows) {
        this.rows = rows;
    }
}
