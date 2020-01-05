<%--
  Created by IntelliJ IDEA.
  User: ZZH_PC
  Date: 2019/12/26
  Time: 13:52
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
<input type="hidden" name="checkCode" id="checkCode">
<DIV id=header class=wrap>
    <DIV id=logo><img src="../static/images/logo.gif"></DIV></DIV>
<DIV id=regLogin class=wrap>
    <DIV class=dialog>
        <DIV class=box>
            <H4>用户登录</H4>
            <form method="post" id="myForm" >
                <DIV class=infos>
                    <TABLE class=field>
                        <TBODY>
                        <TR>
                            <TD colSpan=2></TD></TR>
                        <TR>
                            <TD class=field>手 机 号：</TD>
                            <TD><!-- <input type="text" class="text" name="name" /> --><INPUT
                                    id=inputtel class=text type=text name=tel> <input type="button" value="获取验证码" onclick="getCode()"></TD>
                            </TR>
                        <TR>
                            <TD class=field>验 证 码：</TD>
                            <TD><!-- <input type="password" class="text" name="password" /> --><INPUT
                                    id=inputCode class=text type=password name=checkCode> </TD></TR><!--
						<tr>
							<td class="field">验 证 码：</td>
							<td><input type="text" class="text verycode" name="veryCode" /></td>
						</tr>
						--></TBODY></TABLE>
                    <DIV class=buttons> <INPUT  value=登陆 type=button id="sub"> <INPUT onclick='document.location="register.jsp"' value=注册 type=button>
                    </DIV></DIV></form></DIV></DIV></DIV>
<span id="sp"></span>
<DIV id=footer class=wrap>
    <DL>
        <DT>青鸟租房 © 2018 北大青鸟 京ICP证1000001号</DT>
        <DD>关于我们 · 联系方式 · 意见反馈 · 帮助中心</DD></DL></DIV>
</body>
<script>
    $("#sub").click(function () {
        if ($("#checkCode").val()==$("#inputCode").val()) {
            $.post("/login",{username:"${sessionScope.user.name}",password:"${sessionScope.user.password}"},function () {
                var obj = $.parseJSON(data);
                if (obj.result=='success') {
                    location.href="${pageContext.request.contextPath}/showHouse?page=1";
                } else {
                    $.messager.alert("温馨提示","您输入的验证码错误！","info");
                }
            },"json")
        } else {
            $.messager.alert("温馨提示","您输入的验证码错误！","info");
        }
    });

    function getCode() {
        $.post("/getCode",{tel:$("#inputtel").val()},function (data) {
            $("#checkCode").val(data);
        },"json")
    }
</script>
</html>
