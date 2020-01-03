<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>青鸟租房 - 用户管理</title>
    <link rel="stylesheet" href="../static/easyUI/css/style.css">
    <link rel="stylesheet" type="text/css" href="../static/easyUI/css/demo.css">
    <link rel="stylesheet" type="text/css" href="../static/easyUI/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../static/easyUI/themes/icon.css" />
    <script src="../static/js/jquery-1.8.3.js"></script>
    <script src="../static/js/jquery.easyui.min.js"></script>
</head>
<body>
<DIV id=header class=wrap>
    <DIV id=logo><IMG src="../static/images/logo.gif"></DIV>
    <DIV class=search><LABEL class="ui-green searchs"><a href="${pageContext.request.contextPath}/pages/publish.jsp" title="">发布房屋信息</a></LABEL>
        <LABEL class=ui-green><INPUT onclick='loginOut()' value="退       出" type=button name=search></LABEL>
        欢迎:${sessionScope["user"].name}
    </DIV></DIV>
<DIV class="main wrap">
    <DIV id=houseArea>
        <TABLE class=house-list>
            <TBODY>
            <c:forEach items="${pageInfo.list}" var="house">
                <TR>
                    <TD class=house-thumb><SPAN><A href="details.htm" target="_blank"><img src="http://localhost:8089/${house.path}" width="100" height="75" alt=""></A></SPAN></TD>
                    <TD>
                        <DL>
                            <DT><A href="details.htm" target="_blank">${house.title}</A></DT>
                            <DD>${house.streetName},${house.floorage}平米,${house.typeName}------价格:${house.price}<BR>联系方式：${house.contact} </DD></DL></TD>
                    <TD class=house-type><LABEL class=ui-green><INPUT onclick=update(${house.id}) value="修      改" type=button name=search></LABEL></TD>
                    <TD class=house-price><LABEL class=ui-green><INPUT value="删    除" type=button onclick="delHouse(${house.id})"></LABEL></TD></TR>
            </c:forEach>
            </TBODY></TABLE></DIV>
    <DIV class=pager>
        <UL>
            <c:forEach begin="1" end="${pageInfo.pages}" var="i">
                <LI class=current><A id=widget_338868862
                                     href="/showHouse?page=${i}"
                                     parseContent="true" showError="true" targets="houseArea"
                                     ajaxAfterValidation="false" validate="false"
                                     dojoType="struts:BindAnchor">${i}</A>
                </LI>
            </c:forEach>
            </UL><SPAN class=total>${pageInfo.pageNum}/${pageInfo.pages}页</SPAN> </DIV></DIV>
<DIV id=footer class=wrap>
    <DL>
        <DT>青鸟租房 © 2018 北大青鸟 京ICP证1000001号</DT>
        <DD>关于我们 · 联系方式 · 意见反馈 · 帮助中心</DD></DL></DIV>
</body>
<script>
    function update(id) {
        location.href="${pageContext.request.contextPath}/updateHouseUI?id="+id;
    }

    function loginOut() {
        ${sessionScope.clear()}
        location.href="${pageContext.request.contextPath}/pages/login.jsp";
    }

    function delHouse(id) {
        $.messager.confirm("温馨提示","确定要删除吗？",function (r) {
            if (r) {
                location.href="${pageContext.request.contextPath}/delHouse?id="+id+"&isdel=1";
            }
        })
    }
</script>
</html>
