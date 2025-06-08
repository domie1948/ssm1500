<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-cn">

<head>
    <%@ include file="../../static/head.jsp" %>
    <link href="http://www.bootcss.com/p/bootstrap-datetimepicker/bootstrap-datetimepicker/css/datetimepicker.css"
          rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap-select.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript" charset="utf-8">
        window.UEDITOR_HOME_URL = "${pageContext.request.contextPath}/resources/ueditor/"; //UEDITOR_HOME_URL、config、all这三个顺序不能改变
    </script>
    <script type="text/javascript" charset="utf-8"
            src="${pageContext.request.contextPath}/resources/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8"
            src="${pageContext.request.contextPath}/resources/ueditor/ueditor.all.min.js"></script>
    <script type="text/javascript" charset="utf-8"
            src="${pageContext.request.contextPath}/resources/ueditor/lang/zh-cn/zh-cn.js"></script>
</head>
<style>
    .error {
        color: red;
    }
</style>
<body>
<!-- Pre Loader -->
<div class="loading">
    <div class="spinner">
        <div class="double-bounce1"></div>
        <div class="double-bounce2"></div>
    </div>
</div>
<!--/Pre Loader -->
<div class="wrapper">
    <!-- Page Content -->
    <div id="content">
        <!-- Top Navigation -->
        <%@ include file="../../static/topNav.jsp" %>
        <!-- Menu -->
        <div class="container menu-nav">
            <nav class="navbar navbar-expand-lg lochana-bg text-white">
                <button class="navbar-toggler" type="button" data-toggle="collapse"
                        data-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="ti-menu text-white"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul id="navUl" class="navbar-nav mr-auto">

                    </ul>
                </div>
            </nav>
        </div>
        <!-- /Menu -->
        <!-- Breadcrumb -->
        <!-- Page Title -->
        <div class="container mt-0">
            <div class="row breadcrumb-bar">
                <div class="col-md-6">
                    <h3 class="block-title">编辑家长交流</h3>
                </div>
                <div class="col-md-6">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="${pageContext.request.contextPath}/index.jsp">
                                <span class="ti-home"></span>
                            </a>
                        </li>
                        <li class="breadcrumb-item">家长交流管理</li>
                        <li class="breadcrumb-item active">编辑家长交流</li>
                    </ol>
                </div>
            </div>
        </div>
        <!-- /Page Title -->

        <!-- /Breadcrumb -->
        <!-- Main Content -->
        <div class="container">

            <div class="row">
                <!-- Widget Item -->
                <div class="col-md-12">
                    <div class="widget-area-2 lochana-box-shadow">
                        <h3 class="widget-title">家长交流信息</h3>
                        <form id="addOrUpdateForm">
                            <div class="form-row">
                            <!-- 级联表的字段 -->
                                    <div class="form-group col-md-6 aaaaa">
                                        <label>家长</label>
                                        <div>
                                            <select id="jiazhangSelect" name="jiazhangSelect"
                                                    class="selectpicker form-control"  data-live-search="true"
                                                    title="请选择" data-header="请选择" data-size="5">
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group col-md-6 aaaaa">
                                        <label>姓名</label>
                                        <input id="name" name="name" class="form-control"
                                               placeholder="姓名" readonly>
                                    </div>
                                    <div class="form-group col-md-6 aaaaa">
                                        <label>手机号</label>
                                        <input id="phone" name="phone" class="form-control"
                                               placeholder="手机号" readonly>
                                    </div>
                                    <div class="form-group col-md-6 aaaaa">
                                        <label>身份证号</label>
                                        <input id="idNumber" name="idNumber" class="form-control"
                                               placeholder="身份证号" readonly>
                                    </div>
                                    <div class="form-group col-md-6 aaaaa">
                                        <label>性别</label>
                                        <input id="sexValue" name="sexValue" class="form-control"
                                               placeholder="性别" readonly>
                                    </div>
                                    <div class="form-group col-md-6 bbbbbb">
                                        <label>老师</label>
                                        <input id="uusername" name="uusername" class="form-control"
                                               placeholder="用户名" readonly>
                                    </div>
                            <!-- 当前表的字段 -->
                                    <input id="updateId" name="id" type="hidden">
                                <input id="usersId" name="usersId" type="hidden">
                                   <div class="form-group  col-md-12">
                                       <label>留言内容</label>
                                       <input id="usersContentupload" name="file" type="file">
                                       <script id="usersContentEditor" type="text/plain"
                                               style="width:800px;height:230px;"></script>
                                       <script type = "text/javascript" >
                                       //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
                                       //相见文档配置属于你自己的编译器
                                       var usersContentUe = UE.getEditor('usersContentEditor', {
                                           toolbars: [
                                               [
                                                   'undo', //撤销
                                                   'bold', //加粗
                                                   'redo', //重做
                                                   'underline', //下划线
                                                   'horizontal', //分隔线
                                                   'inserttitle', //插入标题
                                                   'cleardoc', //清空文档
                                                   'fontfamily', //字体
                                                   'fontsize', //字号
                                                   'paragraph', //段落格式
                                                   'inserttable', //插入表格
                                                   'justifyleft', //居左对齐
                                                   'justifyright', //居右对齐
                                                   'justifycenter', //居中对
                                                   'justifyjustify', //两端对齐
                                                   'forecolor', //字体颜色
                                                   'fullscreen', //全屏
                                                   'edittip ', //编辑提示
                                                   'customstyle', //自定义标题
                                               ]
                                           ]
                                       });
                                       </script>
                                       <input type="hidden" name="usersContent" id="usersContent-input">
                                   </div>
                                   <div class="form-group col-md-6 bbbbbb ">
                                       <label>留言时间</label>
                                       <input id="insertTime-input" name="insertTime" size="20" class="form-control"  type="datetime" readonly>
                                   </div>
                                <input id="jiazhangId" name="jiazhangId" type="hidden">
                                   <div class="form-group  col-md-12">
                                       <label>家长回复</label>
                                       <input id="jiazhangContentupload" name="file" type="file">
                                       <script id="jiazhangContentEditor" type="text/plain"
                                               style="width:800px;height:230px;"></script>
                                       <script type = "text/javascript" >
                                       //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
                                       //相见文档配置属于你自己的编译器
                                       var jiazhangContentUe = UE.getEditor('jiazhangContentEditor', {
                                           toolbars: [
                                               [
                                                   'undo', //撤销
                                                   'bold', //加粗
                                                   'redo', //重做
                                                   'underline', //下划线
                                                   'horizontal', //分隔线
                                                   'inserttitle', //插入标题
                                                   'cleardoc', //清空文档
                                                   'fontfamily', //字体
                                                   'fontsize', //字号
                                                   'paragraph', //段落格式
                                                   'inserttable', //插入表格
                                                   'justifyleft', //居左对齐
                                                   'justifyright', //居右对齐
                                                   'justifycenter', //居中对
                                                   'justifyjustify', //两端对齐
                                                   'forecolor', //字体颜色
                                                   'fullscreen', //全屏
                                                   'edittip ', //编辑提示
                                                   'customstyle', //自定义标题
                                               ]
                                           ]
                                       });
                                       </script>
                                       <input type="hidden" name="jiazhangContent" id="jiazhangContent-input">
                                   </div>
                                   <div class="form-group col-md-6 aaaaa">
                                       <label>回复时间</label>
                                       <input id="updateTime-input" name="updateTime" size="20" type="month" class="form-control" readonly>
                                   </div>
                                <div class="form-group col-md-12 mb-3">
                                    <button id="submitBtn" type="button" class="btn btn-primary btn-lg">提交</button>
                                    <button id="exitBtn" type="button" class="btn btn-primary btn-lg">返回</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <!-- /Widget Item -->
            </div>
        </div>
        <!-- /Main Content -->
    </div>
    <!-- /Page Content -->
</div>
<!-- Back to Top -->
<a id="back-to-top" href="#" class="back-to-top">
    <span class="ti-angle-up"></span>
</a>
<!-- /Back to Top -->
<%@ include file="../../static/foot.jsp" %>
<script src="${pageContext.request.contextPath}/resources/js/vue.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.ui.widget.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.fileupload.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.form.js"></script>
<script type="text/javascript" charset="utf-8"
        src="${pageContext.request.contextPath}/resources/js/validate/jquery.validate.min.js"></script>
<script type="text/javascript" charset="utf-8"
        src="${pageContext.request.contextPath}/resources/js/validate/messages_zh.js"></script>
<script type="text/javascript" charset="utf-8"
        src="${pageContext.request.contextPath}/resources/js/validate/card.js"></script>
<script type="text/javascript" charset="utf-8"
        src="${pageContext.request.contextPath}/resources/js/datetimepicker/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" charset="utf-8"
        src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js">
</script><script type="text/javascript" charset="utf-8"
                 src="${pageContext.request.contextPath}/resources/js/bootstrap-select.js"></script>
<script>
    <%@ include file="../../utils/menu.jsp"%>
    <%@ include file="../../static/setMenu.js"%>
    <%@ include file="../../utils/baseUrl.jsp"%>

    var tableName = "jiazhangjiaoliu";
    var pageType = "add-or-update";
    var updateId = "";
    var crossTableId = -1;
    var crossTableName = '';
    var ruleForm = {};
    var crossRuleForm = {};


    // 下拉框数组
        <!-- 当前表的下拉框数组 -->
        <!-- 级联表的下拉框数组 -->
    var jiazhangOptions = [];
    var userOptions = [];

    var ruleForm = {};


    // 文件上传
    function upload() {

        <!-- 当前表的文件上传 -->

        $('#usersContentupload').fileupload({
            url: baseUrl + 'file/upload',
            headers: {token: window.sessionStorage.getItem("token")},
            dataType: 'json',
            done: function (e, data) {
                UE.getEditor('usersContentEditor').execCommand('insertHtml', '<img src=\"' + baseUrl + 'upload/' + data.result.file + '\" width=900 height=560>');
            }
        });


        $('#jiazhangContentupload').fileupload({
            url: baseUrl + 'file/upload',
            headers: {token: window.sessionStorage.getItem("token")},
            dataType: 'json',
            done: function (e, data) {
                UE.getEditor('jiazhangContentEditor').execCommand('insertHtml', '<img src=\"' + baseUrl + 'upload/' + data.result.file + '\" width=900 height=560>');
            }
        });


    }

    // 表单提交
    function submit() {
        if (validform() == true && compare() == true) {
            let data = {};
            getContent();

            let value = $('#addOrUpdateForm').serializeArray();
            $.each(value, function (index, item) {
                data[item.name] = item.value;
            });
            let json = JSON.stringify(data);
            var urlParam;
            var successMes = '';
            if (updateId != null && updateId != "null" && updateId != '') {
                urlParam = 'update';
                successMes = '修改成功';
            } else {
                urlParam = 'save';
                successMes = '添加成功';
            }
            httpJson("jiazhangjiaoliu/" + urlParam, "POST", data, (res) => {
                if(res.code == 0)
                {
                    window.sessionStorage.removeItem('addjiazhangjiaoliu');
                    window.sessionStorage.removeItem('updateId');
                    let flag = true;
                    if (flag) {
                        alert(successMes);
                    }
                    if (window.sessionStorage.getItem('onlyme') != null && window.sessionStorage.getItem('onlyme') == "true") {
                        window.sessionStorage.removeItem('onlyme');
                        window.sessionStorage.setItem("reload","reload");
                        window.parent.location.href = "${pageContext.request.contextPath}/index.jsp";
                    } else {
                        window.location.href = "../home/home.jsp";
                    }
                }
            });
        } else {
            alert("表单未填完整或有错误");
        }
    }

    // 查询列表
        <!-- 查询当前表的所有列表 -->
        <!-- 查询级联表的所有列表 -->
        function jiazhangSelect() {
            //填充下拉框选项
            http("jiazhang/page?page=1&limit=100&sort=&order=", "GET", {}, (res) => {
                if(res.code == 0){
                    jiazhangOptions = res.data.list;
                }
            });
        }

        function jiazhangSelectOne(id) {
            http("jiazhang/info/"+id, "GET", {}, (res) => {
                if(res.code == 0){
                ruleForm = res.data;
                jiazhangShowImg();
                jiazhangDataBind();
            }
        });
        }



    // 初始化下拉框
    <!-- 初始化当前表的下拉框 -->

    <!-- 初始化级联表的下拉框(要根据内容修改) -->
    <!-- 初始化级联表的下拉框(要根据内容修改) -->
    <!-- 初始化级联表的下拉框(要根据内容修改) -->
    <!-- 初始化级联表的下拉框(要根据内容修改) -->
    <!-- 初始化级联表的下拉框(要根据内容修改) -->
    <!-- 初始化级联表的下拉框(要根据内容修改) -->
        function initializationjiazhangSelect() {
            var jiazhangSelect = document.getElementById('jiazhangSelect');
            if(jiazhangSelect != null && jiazhangOptions != null  && jiazhangOptions.length > 0 ) {
                for (var i = 0; i < jiazhangOptions.length; i++) {
                        jiazhangSelect.add(new Option(jiazhangOptions[i].name, jiazhangOptions[i].id));
                }

                $("#jiazhangSelect").change(function(e) {
                        jiazhangSelectOne(e.target.value);
                });
            }

        }



    // 下拉框选项回显
    function setSelectOption() {

        <!-- 当前表的下拉框回显 -->
        <!--  级联表的下拉框回显  -->
            var jiazhangSelect = document.getElementById("jiazhangSelect");
            if(jiazhangSelect != null && jiazhangOptions != null  && jiazhangOptions.length > 0 ) {
                for (var i = 0; i < jiazhangOptions.length; i++) {
                    if (jiazhangOptions[i].id == ruleForm.jiazhangId) {//下拉框value对比,如果一致就赋值汉字
                        jiazhangSelect.options[i+1].selected = true;
                        $("#jiazhangSelect" ).selectpicker('refresh');
                    }
                }
            }
            var userSelect = document.getElementById("userSelect");
            if(userSelect != null && userOptions != null  && userOptions.length > 0 ) {
                for (var i = 0; i < userOptions.length; i++) {
                    if (userOptions[i].id == ruleForm.userId) {//下拉框value对比,如果一致就赋值汉字
                        userSelect.options[i+1].selected = true;
                        $("#userSelect" ).selectpicker('refresh');
                    }
                }
            }
    }


    // 填充富文本框
    function setContent() {

        <!-- 当前表的填充富文本框 -->
        if (ruleForm.usersContent != null && ruleForm.usersContent != 'null' && ruleForm.usersContent != '') {
            var usersContentUeditor = UE.getEditor('usersContentEditor');
            usersContentUeditor.ready(function () {
                var mes = '' + ruleForm.usersContent;
                usersContentUeditor.setContent(mes);
            });
        }
        if (ruleForm.jiazhangContent != null && ruleForm.jiazhangContent != 'null' && ruleForm.jiazhangContent != '') {
            var jiazhangContentUeditor = UE.getEditor('jiazhangContentEditor');
            jiazhangContentUeditor.ready(function () {
                var mes = '' + ruleForm.jiazhangContent;
                jiazhangContentUeditor.setContent(mes);
            });
        }
    }
    // 获取富文本框内容
    function getContent() {

        <!-- 获取当前表的富文本框内容 -->
        var usersContentEditor =UE.getEditor('usersContentEditor');
        if (usersContentEditor.hasContents()) {
                $('#usersContent-input').attr('value', usersContentEditor.getPlainTxt());
        }
        var jiazhangContentEditor =UE.getEditor('jiazhangContentEditor');
        if (jiazhangContentEditor.hasContents()) {
                $('#jiazhangContent-input').attr('value', jiazhangContentEditor.getPlainTxt());
        }
    }
    //数字检查
        <!-- 当前表的数字检查 -->

    function exit() {
        window.sessionStorage.removeItem("updateId");
        window.sessionStorage.removeItem('addjiazhangjiaoliu');
        window.location.href = "../home/home.jsp";
    }
    // 表单校验
    function validform() {
        return $("#addOrUpdateForm").validate({
            rules: {
                usersId: "required",
                usersContent: "required",
                insertTime: "required",
                jiazhangId: "required",
                jiazhangContent: "required",
            },
            messages: {
                usersId: "老师id不能为空",
                usersContent: "留言内容不能为空",
                insertTime: "留言时间不能为空",
                jiazhangId: "家长id不能为空",
                jiazhangContent: "家长回复不能为空",
            }
        }).form();
    }

    // 获取当前详情
    function getDetails() {
        var addjiazhangjiaoliu = window.sessionStorage.getItem("addjiazhangjiaoliu");
        if (addjiazhangjiaoliu != null && addjiazhangjiaoliu != "" && addjiazhangjiaoliu != "null") {
            window.sessionStorage.removeItem('addjiazhangjiaoliu');
            //注册表单验证
            $(validform());
            $('#submitBtn').text('新增');

        } else {
            $('#submitBtn').text('修改');
            var userId = window.sessionStorage.getItem('userId');
            updateId = userId;//先赋值登录用户id
            var uId  = window.sessionStorage.getItem('updateId');//获取修改传过来的id
            if (uId != null && uId != "" && uId != "null") {
                //如果修改id不为空就赋值修改id
                updateId = uId;
            }
            window.sessionStorage.removeItem('updateId');
            http("jiazhangjiaoliu/info/" + updateId, "GET", {}, (res) => {
                if(res.code == 0)
                {
                    ruleForm = res.data
                    // 是/否下拉框回显
                    setSelectOption();
                    // 设置图片src
                    showImg();
                    // 数据填充
                    dataBind();
                    // 富文本框回显
                    setContent();
                    //注册表单验证
                    $(validform());
                }

            });
        }
    }

    // 清除可能会重复渲染的selection
    function clear(className) {
        var elements = document.getElementsByClassName(className);
        for (var i = elements.length - 1; i >= 0; i--) {
            elements[i].parentNode.removeChild(elements[i]);
        }
    }

    function dateTimePick() {

    }


    function dataBind() {


    <!--  级联表的数据回显  -->
        jiazhangDataBind();
        userDataBind();


    <!--  当前表的数据回显  -->
        $("#updateId").val(ruleForm.id);
        $("#usersId").val(ruleForm.usersId);
        $("#usersContent").val(ruleForm.usersContent);
        $("#insertTime-input").val(ruleForm.insertTime);
        $("#jiazhangId").val(ruleForm.jiazhangId);
        $("#jiazhangContent").val(ruleForm.jiazhangContent);
        $("#updateTime-input").val(ruleForm.updateTime);

    }
    <!--  级联表的数据回显  -->
    function jiazhangDataBind(){

                    <!-- 把id赋值给当前表的id-->
        $("#jiazhangId").val(ruleForm.id);

        $("#yonghuId").val(ruleForm.yonghuId);
        $("#username").val(ruleForm.username);
        $("#password").val(ruleForm.password);
        $("#name").val(ruleForm.name);
        $("#phone").val(ruleForm.phone);
        $("#idNumber").val(ruleForm.idNumber);
        $("#sexValue").val(ruleForm.sexValue);
    }

    function userDataBind(){
        $("#uusername").val(ruleForm.uusername);
        $("#upassword").val(ruleForm.upassword);
        $("#urole").val(ruleForm.urole);
        $("#uaddtime").val(ruleForm.uaddtime);
    }


    //图片显示
    function showImg() {
        <!--  当前表的图片  -->

        <!--  级联表的图片  -->
        jiazhangShowImg();
        userShowImg();
    }


    <!--  级联表的图片  -->

    function jiazhangShowImg() {
        $("#myPhotoImg").attr("src",ruleForm.myPhoto);
    }


    function userShowImg() {
    }



    $(document).ready(function () {
        //设置右上角用户名
        $('.dropdown-menu h5').html(window.sessionStorage.getItem('username'))
        //设置项目名
        $('.sidebar-header h3 a').html(projectName)
        //设置导航栏菜单
        setMenu();
        $('#exitBtn').on('click', function (e) {
            e.preventDefault();
            exit();
        });
        //初始化时间插件
        dateTimePick();
        //查询所有下拉框
            <!--  当前表的下拉框  -->
            <!-- 查询级联表的下拉框(用id做option,用名字及其他参数做名字级联修改) -->
            jiazhangSelect();



        // 初始化下拉框
            <!--  初始化当前表的下拉框  -->
            <!--  初始化级联表的下拉框  -->
            initializationjiazhangSelect();

        $(".selectpicker" ).selectpicker('refresh');
        getDetails();
        //初始化上传按钮
        upload();
    <%@ include file="../../static/myInfo.js"%>
                $('#submitBtn').on('click', function (e) {
                    e.preventDefault();
                    //console.log("点击了...提交按钮");
                    submit();
                });
        readonly();
    });

    function readonly() {
        if (window.sessionStorage.getItem('role') == '管理员') {
            $(".bbbbbb").remove();
            var jiazhangContentUeditor = UE.getEditor('jiazhangContentEditor');
            jiazhangContentUeditor.ready(function () {
                jiazhangContentUeditor.setDisabled('fullscreen');
            });
        }else if(window.sessionStorage.getItem('role') == '家长'){
            $(".aaaaa").remove();
            var usersContentUeditor = UE.getEditor('usersContentEditor');
            usersContentUeditor.ready(function () {
                usersContentUeditor.setDisabled('fullscreen');
            });
        }else{
            //学生

            var jiazhangContentUeditor = UE.getEditor('jiazhangContentEditor');
            jiazhangContentUeditor.ready(function () {
                jiazhangContentUeditor.setDisabled('fullscreen');
            });
            var usersContentUeditor = UE.getEditor('usersContentEditor');
            usersContentUeditor.ready(function () {
                usersContentUeditor.setDisabled('fullscreen');
            });

        }
    }

    //比较大小
    function compare() {
        var largerVal = null;
        var smallerVal = null;
        if (largerVal != null && smallerVal != null) {
            if (largerVal <= smallerVal) {
                alert(smallerName + '不能大于等于' + largerName);
                return false;
            }
        }
        return true;
    }


    // 用户登出
    <%@ include file="../../static/logout.jsp"%>
</script>
</body>

</html>