package com.zzh.util;

/**
 * Created by ZZH_PC on 2020/1/5.
 */
public class TeleCheckUtil {
    private static String Uid = "奥利给干了";
    private static String Key = "d41d8cd98f00b204e980";

    public static int sendMsg(String tel,String msg){

        HttpClientUtil client = HttpClientUtil.getInstance();

        int i = client.sendMsgUtf8(Uid, Key, msg, tel);

        return i;
    }
}
