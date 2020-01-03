<%--
  Created by IntelliJ IDEA.
  User: ZZH_PC
  Date: 2019/12/31
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
    <script src="../static/js/jquery-1.8.3.js" language="JavaScript" type="text/javascript"></script>
    <!--jquery.easyui.min.js包含了easyUI中的所有插件-->
    <script src="../static/js/jquery.easyui.min.js" language="JavaScript" type="text/javascript"></script>
</head>
<body>
<div id="ToolBar">
    <div style="height: 40px;">
        <a href="javascript:passHouse()" class="easyui-linkbutton"
           iconCls="icon-edit" plain="true">确认审核</a>
        <a href="javascript:passSomeHouse()" class="easyui-linkbutton"
           iconCls="icon-remove" plain="true">批量审核</a>
    </div>
</div>
<table id="dg"></table>
</body>
<script>
    $("#dg").datagrid({
        toolbar:'#ToolBar' //指定工具栏
    });

    $("#dg").datagrid({
        url:'/isPass',
        pagination:true,  //开启分页
        pageSize:5,  //初始化页大小
        pageList:[3,5,8,10,20],  //页大小选项
        columns:[[
            {checkbox:true,width:100,align:'right'},
            {field:'id',title:'编号',width:100,align:'right'},
            {field:'userName',title:'房东名称',width:100,align:'right'},
            {field:'typeName',title:'租房类型',width:100,align:'right'},
            {field:'contact',title:'联系方式',width:100,align:'right'},
            {field:'ispass',title:'状态',width:100,align:'right',
                formatter: function(value,row,index){
                    if (value == "0"){
                        return "未审核";
                    } else if (value == "1"){
                        return "已审核";
                    }
                }}
        ]]
    });

    function passHouse() {
        var sel = $("#dg").datagrid("getSelections");
        if (sel.length == 1){
            if (sel[0].ispass == "1") {
                $.messager.alert("温馨提示", "该租房已审核!", "info");
            } else {
                $.post("/passHouse",{id:sel[0].id},function (data) {
                    var obj = $.parseJSON(data);
                    if (obj.result == "0"){
                        $.messager.alert("温馨提示","审核失败!","info");
                    } else {
                        $("#dg").datagrid("reload");
                    }
                },"json")
            }
        } else {
            $.messager.alert("温馨提示","请只选择一个进行审核!","info");
        }
    }
</script>
</html>
