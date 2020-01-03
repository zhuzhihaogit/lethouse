<%--
  Created by IntelliJ IDEA.
  User: ZZH_PC
  Date: 2019/12/26
  Time: 13:56
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
            <DT>新用户注册</DT>
            <DD class=past>填写个人信息</DD></DL>
        <DIV class=box>
            <FORM method="post" id="myForm">
                <DIV class=infos>
                    <TABLE class=field>
                        <TBODY>
                        <TR>
                            <TD class=field>用 户 名：</TD>
                            <TD><INPUT class=text id="inputname" type=text name=name><span id="sp"></span></TD></TR>
                        <TR>
                            <TD class=field>密　　码：</TD>
                            <TD><INPUT class=text type=password name=password id="password"></TD></TR>
                        <TR>
                            <TD class=field>确认密码：</TD>
                            <TD><INPUT class=text type=password name=repassword id="repassword"> </TD></TR>
                        <TR>
                            <TD class=field>电　　话：</TD>
                            <TD><INPUT class=text type=text name=telephone id="tel"> </TD></TR>
                        <TR>
                            <TD class=field>年　　龄：</TD>
                            <TD><INPUT class=text type=text name=age> </TD></TR></TBODY></TABLE>
                    <DIV class=buttons>
                        <INPUT  value=立即注册 type=button id="sub">
                    </DIV></DIV></FORM></DIV></DIV></DIV>
<div id="msg"></div>
<DIV id=footer class=wrap>
    <DL>
        <DT>青鸟租房 © 2018 北大青鸟 京ICP证1000001号</DT>
        <DD>关于我们 · 联系方式 · 意见反馈 · 帮助中心</DD></DL></DIV>
</body>
<script>
    $("#inputname").blur(function () {
        $.post("/checkName",{name:$("#inputname").val()},function (data) {
            console.log(data);
            if ($("#inputname").val() == ''){
                $("#sp").html("请输入用户名！").css({color:"red"});
            } else if (data) {
                $("#sp").html("用户名可用！").css({color:"green"});
            } else {
                $("#sp").html("用户名已存在！").css({color:"red"});
            }
        },"json")
    })

    $("#sub").click(function () {
        $("#myForm").form("submit",{
            url:"/register",
            onSubmit:function () {
                var pwd = $("#password").val();
                var rpwd = $("#repassword").val();
                var tel = $("#tel").val();
                var sp = $("#sp").html();
                if(sp!='用户名可用！'){
                    $.messager.alert("温馨提示","用户名输入有误！","info");
                    return false;
                }
                if(pwd==''){
                    $.messager.alert("温馨提示","请输入密码！","info");
                    return false;
                } else if (pwd!=rpwd) {
                    $.messager.alert("温馨提示","两次密码输入不一致！","info");
                    return false;
                }
                if(tel==''){
                    $.messager.alert("温馨提示","请输入电话号码！","info");
                    return false;
                }
                return true;
            },
            success:function (data) {
                if (data) {
                    window.location.href="${pageContext.request.contextPath}/pages/login.jsp";
                } else {
                    $("#msg").html("注册失败...").css({color:"red"});
                }
            }
        })
    })
</script>
</html>
