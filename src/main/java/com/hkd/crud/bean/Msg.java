package com.hkd.crud.bean;

import java.util.HashMap;
import java.util.Map;

public class Msg {
    //状态码 成功：100 失败：200
    private int code;
    //提示信息
    private String msg;
    //用户要返回给浏览器的数据
    private Map<String ,Object> msgData = new HashMap<String,Object>();

    public static Msg Msgsuccess(){
        Msg msg = new Msg();
        msg.setCode(100);
        msg.setMsg("处理成功");
        return msg;
    }
    public static Msg Msgfail(){
        Msg msg = new Msg();
        msg.setCode(200);
        msg.setMsg("处理失败");
        return msg;
    }

    public Msg add(String key,Object value){
        this.msgData.put(key,value);
        return  this;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Map<String, Object> getMsgData() {
        return msgData;
    }

    public void setMsgData(Map<String, Object> msgData) {
        this.msgData = msgData;
    }
}
