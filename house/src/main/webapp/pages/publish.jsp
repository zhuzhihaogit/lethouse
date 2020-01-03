<%--
  Created by IntelliJ IDEA.
  User: ZZH_PC
  Date: 2019/12/27
  Time: 13:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../static/easyUI/css/style.css">
    <link rel="stylesheet" type="text/css" href="../static/easyUI/css/demo.css">
    <link rel="stylesheet" type="text/css" href="../static/easyUI/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../static/easyUI/themes/icon.css" />
    <script src="../static/js/jquery-1.8.3.js"></script>
    <script src="../static/js/jquery.easyui.min.js"></script>
</head>
<body>
<DIV id=header class=wrap>
    <DIV id=logo><IMG src="../static/images/logo.gif"></DIV></DIV>
<DIV id=regLogin class=wrap>
    <DIV class=dialog>
        <DL class=clearfix>
            <DT>新房屋信息发布</DT>
            <DD class=past>填写房屋信息</DD></DL>
        <DIV class=box>
            <FORM id=add_action enctype="multipart/form-data" method=post name=add.action>
                <input type="hidden" name="user" id="user" value="${user.name}">
                <DIV class=infos>
                    <TABLE class=field>
                        <TBODY>
                        <TR>
                            <TD class=field>标　　题：</TD>
                            <TD><INPUT id=add_action_title class=text type=text name=title> </TD></TR>
                        <TR>
                            <TD class=field>户　　型：</TD>
                            <TD><SELECT class=text name=typeId id="typeid">
                                <option value="">请选择</option>
                            </SELECT></TD></TR>
                        <TR>
                            <TD class=field>面　　积：</TD>
                            <TD><INPUT id=floorAge class=text type=text
                                       name=floorage></TD></TR>
                        <TR>
                            <TD class=field>价　　格：</TD>
                            <TD><INPUT id=add_action_price class=text type=text name=price> </TD></TR>
                        <TR>
                            <TD class=field>房产证日期：</TD>
                            <TD><INPUT class=text type="date" name=pubdate></TD></TR>
                        <TR>
                            <TD class=field>位　　置：</TD>
                            <TD>区：
                                <SELECT class=text id="district_id" name=district_id>
                                    <option value="">请选择</option>
                                </SELECT>
                                街：<SELECT class=text
                                          name=streetId id="street_id">
                                    <option value="">请选择</option>
                                </SELECT> </TD></TR>
                        <TR>
                            <TD class=field>联系方式：</TD>
                            <TD><INPUT id=add_action_contact class=text type=text name=contact> </TD></TR>
                        <TR>
                            <TD class=field>详细信息：</TD>
                            <TD><TEXTAREA name=description></TEXTAREA></TD></TR>
                        <TR>
                            <TD class=field>图片：</TD>
                            <TD><input type="file" name="pfile"></TD></TR>
                        </TBODY></TABLE>
                    <DIV class=buttons><INPUT  value=立即发布 type="button" id="btn">
                    </DIV></DIV></FORM></DIV></DIV></DIV>
<DIV id=footer class=wrap>
    <DL>
        <DT>青鸟租房 © 2018 北大青鸟 京ICP证1000001号</DT>
        <DD>关于我们 · 联系方式 · 意见反馈 · 帮助中心</DD></DL></DIV>
</body>
<script>
    //加载区域信息
    $.post("${pageContext.request.contextPath}/showDistrict",null,function (data) {
        for (var i=0;i<data.length;i++) {
            var option = $("<option value='"+data[i].id+"'>"+data[i].name+"</option>");
            $("#district_id").append(option);
        }
    },"json");
    //根据区域加载街道信息
    $("#district_id").change(function () {
        $("#street_id").empty();
        $.post("${pageContext.request.contextPath}/showStreet",{districtId:$("#district_id").val()},function (data) {
            for (var i=0;i<data.length;i++) {
                var option = $("<option value='"+data[i].id+"'>"+data[i].name+"</option>");
                $("#street_id").append(option);
            }
        },"json")
    });
    //加载租房类型
    $.post("${pageContext.request.contextPath}/showType",null,function (data) {
        for (var i=0;i<data.length;i++) {
            var option = $("<option value='"+data[i].id+"'>"+data[i].name+"</option>");
            $("#typeid").append(option);
        }
    },"json");

    $("#btn").click(function () {
        if ($("#user").val()!=null && $("#user").val()!='') {
            $("#add_action").form("submit",{
                url:"/addHouse",
                success:function (data) {
                    var obj = $.parseJSON(data);
                    if (obj.result>0) {
                        location.href="${pageContext.request.contextPath}/showHouse?page=1";
                    } else {
                        $.messager.alert("温馨提示","发布失败！","info");
                    }
                }
            })
        } else {
            $.messager.alert("温馨提示","您还未登录！","info");
        }
    })
</script>
</html>
