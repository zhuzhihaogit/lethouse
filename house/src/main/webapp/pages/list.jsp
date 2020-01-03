<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ZZH_PC
  Date: 2020/1/2
  Time: 14:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="../static/easyUI/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="../static/easyUI/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="../static/easyUI/css/demo.css">
    <LINK rel=stylesheet type=text/css href="../static/easyUI/css/style.css">
    <script src="../static/js/jquery-1.8.3.js" language="JavaScript" type="text/javascript"></script>
    <!--jquery.easyui.min.js包含了easyUI中的所有插件-->
    <script src="../static/js/jquery.easyui.min.js" language="JavaScript" type="text/javascript"></script>
</head>
<body>
<DIV id=header class=wrap>
    <DIV id=logo><IMG src="../static/images/logo.gif"></DIV></DIV>
<DIV id=navbar class=wrap>
    <DL class="search clearfix">
        <form id="myForm"  method="post" action="/showHouseByCondition">
            <!--隐藏保存当前页码-->
            <input type="hidden" value="1" name="page" id="savePage">

            标题:<input type="text" name="title" value="${condition.title}">
            区域:<select id="district_id" name="districtId"><option value="">请选择</option></select>
            街道:<select id="street_id" name="streetId"><option value="">请选择</option></select>
            类型:<select id="typeid" name="typeId"><option value="">请选择</option></select>
            价格:<input type="text" size="10" value="${condition.minPrice}" name="minPrice">-<input value="${condition.maxPrice}" size="10"  type="text" name="maxPrice">
            <input type="submit" value="搜索" >
        </form>
    </DL></DIV>
<DIV class="main wrap">
    <TABLE class=house-list>
        <TBODY>
        <c:forEach items="${pageInfo.list}" var="h">
            <TR>
                <TD class=house-thumb><span><A href="" target="_blank"><img src="http://localhost:8089/${h.path}" width="100" height="75" alt=""></a></span></TD>
                <TD>
                    <DL>
                        <DT><A href="" target="_blank">${h.title}</A></DT>
                        <DD>${h.districtName}-${h.streetName},${h.floorage}平米<BR>联系方式：${h.contact} </DD></DL></TD>
                <TD class=house-type>${h.typeName}</TD>
                <TD class=house-price><SPAN>${h.price}</SPAN>元/月</TD>
            </TR>
        </c:forEach>
        </TBODY>
    </TABLE>

    <DIV class=pager>
        <UL>
            <LI class=current><A href="javascript:goPage(1)">首页</A></LI>
            <LI><A href="javascript:goPage(${pageInfo.pageNum-1})">上一页</A></LI>
            <LI><A href="javascript:goPage(${pageInfo.pageNum+1})">下一页</A></LI>
            <LI><A href="javascript:goPage(${pageInfo.pages})">末页</A></LI></UL><SPAN
            class=total>${pageInfo.pageNum==0?1:pageInfo.pageNum}/${pageInfo.pages}页</SPAN> </DIV></DIV>
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

        $("#district_id").val(${condition.districtId});

        $("#street_id").empty();
        $.post("${pageContext.request.contextPath}/showStreet",{districtId:$("#district_id").val()},function (data) {
            for (var i=0;i<data.length;i++) {
                var option = $("<option value='"+data[i].id+"'>"+data[i].name+"</option>");
                $("#street_id").append(option);
            }
            $("#street_id").val(${condition.streetId});
        },"json")

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
        $("#typeid").val(${condition.typeId})
    },"json");

    function goPage(page) {
        $("#savePage").val(page);
        $("#myForm").submit();
    }

</script>
</html>
