<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: ZZH_PC
  Date: 2019/12/29
  Time: 16:13
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
            <DT>房屋信息修改</DT>
            <DD class=past>填写房屋信息</DD></DL>
        <DIV class=box>
            <FORM id=update_action enctype="multipart/form-data" method=post name=update.action >
                <input type="hidden" name="user" id="user" value="${user.name}">
                <input type="hidden" name="id" value="${house.id}">
                <input type="hidden" name="oldFile" value="${house.path}">
                <DIV class=infos>
                    <TABLE class=field>
                        <TBODY>
                        <TR>
                            <TD class=field>标　　题：</TD>
                            <TD><INPUT id=add_action_title class=text type=text name=title value="${house.title}"> </TD></TR>
                        <TR>
                            <TD class=field>户　　型：</TD>
                            <TD><SELECT class=text name=typeId id="typeid">
                                <option value="">请选择</option>
                            </SELECT></TD></TR>
                        <TR>
                            <TD class=field>面　　积：</TD>
                            <TD><INPUT id=floorAge class=text type=text
                                       name=floorage value="${house.floorage}"></TD></TR>
                        <TR>
                            <TD class=field>价　　格：</TD>
                            <TD><INPUT id=add_action_price class=text type=text name=price value="${house.price}"> </TD></TR>
                        <TR>
                            <TD class=field>房产证日期：</TD>
                            <TD><INPUT class=text type="date" name=pubdate value="<fmt:formatDate value="${house.pubdate}" pattern="yyyy-MM-dd"></fmt:formatDate>"></TD></TR>
                        <TR>
                            <TD class=field>位　　置：</TD>
                            <TD>区：
                                <SELECT class=text id="district_id" name=districtId>
                                    <option value="">请选择</option>
                                </SELECT>
                                街：<SELECT class=text
                                          name=streetId id="street_id">
                                    <option value="">请选择</option>
                                </SELECT> </TD></TR>
                        <TR>
                            <TD class=field>联系方式：</TD>
                            <TD><INPUT id=add_action_contact class=text type=text name=contact value="${house.contact}"> </TD></TR>
                        <TR>
                            <TD class=field>详细信息：</TD>
                            <TD><TEXTAREA name=description>${house.description}</TEXTAREA></TD></TR>
                        <TR>
                            <TD class=field>图片：</TD>
                            <TD>${house.path}<img src="http://localhost:8089/${house.path}" alt=""><input type="file" name="pfile"></TD></TR>
                        </TBODY></TABLE>
                    <DIV class=buttons><INPUT  value=确认修改 type="button" id="btn">
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
        $("#district_id").val(${house.districtId});

        $.post("${pageContext.request.contextPath}/showStreet",{districtId:$("#district_id").val()},function (data) {
            for (var i=0;i<data.length;i++) {
                var option = $("<option value='"+data[i].id+"'>"+data[i].name+"</option>");
                $("#street_id").append(option);
            }
            $("#street_id").val(${house.streetId});
        },"json");
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
        $("#typeid").val(${house.typeId});
    },"json");

    $("#btn").click(function () {
        $("#update_action").form("submit",{
            url:"/updateHouse",
            success:function (data) {
                if (data == "0") {
                    $.messager.alert("温馨提示","修改失败！","info")
                } else {
                    location.href="${pageContext.request.contextPath}/showHouse?page=1";
                }
            }
        })
    })
</script>
</html>
