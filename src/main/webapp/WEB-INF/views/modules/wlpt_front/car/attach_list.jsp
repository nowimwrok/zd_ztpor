<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>司机管理</title>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${ctxStatic}/modules/wlpt/front/css/personal.css">
    <link rel="stylesheet" type="text/css" href="${ctxStatic}/modules/wlpt/front/css/top_menu.css">
    <style type="text/css">
        body {
            padding: 0;
            margin: 0;
            width: 100%;
            height: 950px;
            margin: 0 auto;
            text-align: center;
            border: 1px solid #D6D3CE;
            font-family: "微软雅黑";
        }

        ul p span a input td {
            font-family: "微软雅黑";
        }

        .goods-manage td, .goods-manage th {
            text-align: center;
        }

        .goods-manage td p {
            text-align: center;
            margin: 10px 0px;
        }

        .car_search {
            height: 35px;
            width: 15%;
        }

        .goods-manage td .last a {
            padding: 3px 12px;
            width: 95px;
            border-radius: 0px;
            background-color: #FFC52F;
            border-color: #FFC52F;
        }

        .loading_lock {
            display: none;
            width: 100%;
            height: 100%;
            z-index: 999;
            position: fixed;
            background-color: rgba(165, 160, 154, 0.34);
            top: 0px;
            text-align: center;
        }

        .loading_lock img {
            margin-top: 25%;
        }

        .datainit {
            display: none;
        }
    </style>
</head>
<body ng-app="dataHall" ng-controller="dataHallCtrl">
<p class="user_data">
    <img src="${ctxStatic }/images/wlptfront/line-left.png"><span class="title_blue">司机</span><span
        class="title_orange">管理</span><img src="${ctxStatic }/images/wlptfront/line-right.png">
</p>
<div class="select_title">
    <form action="" method="get" class="search-bar" style="text-align: center">
        <input id="drivername" type="text" class="car_search car_phone_search" ng-model="searchData.drivername"
               placeholder="司机姓名"/>
        <input id="driverphone" type="text" class="car_search car_phone_search" ng-model="searchData.driverphone"
               placeholder="手机号码"/>
        <select id="isagree" class="car_search" ng-model="searchData.isagree">
            <option value=''></option>
            <option value='0'>申请中</option>
            <option value='1'>同意</option>
            <option value='2'>不同意</option>
        </select>
        <button type="button" name="search-btn" id="search-btn"
                style="width:80px;margin-top:-2px;margin-bottom:0px;border-radius:0px;border-color:#FFC52F;margin-left:15px;background-color:#FFC52F;margin-right:30px;"
                class="btn btn-warning" ng-click="onSelectPage(1)">
            <span class="glyphicon glyphicon-search"></span><span class="goods_search_btn">搜索</span>
        </button>
        <a class="icon_blue fabu" id="fabu" style="margin: 0px;" href="${wlpt}/wlpt/driver/toSave"
           onclick="return check();" target="content"><span class="btn btn-warning"
                                                            style="border-radius:0px;background-color:#FFC52F;border-color:#FFC52F;width:80px;height:36px;">司机绑定</span></a>
    </form>
</div>
<table class="goods-manage">
    <thead>
    <tr class="goods_col_1" style="border:none;">
        <td style="width:20%">登录名</td>
        <td style="width:15%">真实姓名</td>
        <td style="width:20%">手机号码</td>
        <td style="width:15%">是否同意</td>
        <td style="width:20%">操作</td>
    </tr>
    </thead>
    <tbody class="datainit">
    <tr ng-repeat="x in data">
        <td>
            <p class="car_number" ng-if="x.flag ==0">{{x.reuser.loginName}}</p>
            <p class="car_number" ng-if="x.flag ==1">{{x.user.loginName}}</p>
        </td>
        <td>
            <p class="car_number" ng-if="x.flag ==0">{{x.reuser.name}}</p>
            <p class="car_number" ng-if="x.flag ==1">{{x.user.name}}</p>
        </td>
        <td>
            <p class="car_number" ng-if="x.flag ==0">{{x.reuser.phone}}</p>
            <p class="car_number" ng-if="x.flag ==1">{{x.user.phone}}</p>
        </td>
        <td>
            <p ng-if="x.isagree == 0">申请中</p>
            <p ng-if="x.isagree == 1">同意</p>
            <p ng-if="x.isagree == 2">不同意</p>
        </td>
        <td>
            <p class="last" ng-if="x.flag ==0"><a href="javascript:;" ng-click="find(x.reuser.id)" target="content" class="btn btn-warning">查看用户</a></p>
            <p class="last" ng-if="x.flag ==1"><a href="javascript:;" ng-click="find(x.user.id)" target="content" class="btn btn-warning">查看用户</a></p>
            <p class="last"><a href="${wlpt}/wlpt/driver/isAgree?id={{x.id}}&isagree=1" target="content"
                               ng-if="x.flag ==1&&x.isagree == 0" class="btn btn-warning">同意</a></p>
            <p class="last"><a href="${wlpt}/wlpt/driver/isAgree?id={{x.id}}&isagree=2" target="content"
                               ng-if="x.flag ==1&&x.isagree == 0" class="btn btn-warning">不同意</a></p>
            <p class="last"><a href="javascript:;" ng-click="isDelete(x.id)" target="content" ng-if="x.isagree == 1 && x.user.id != x.reuser.id"
                               class="btn btn-warning">解除</a></p>
        </td>
    </tr>
    </tbody>
</table>
<div class="loading"><img src="/static/images/loading.gif">
    <p>加载中</p></div>
<div class="loading_lock"><img src="${ctxStatic }/images/loading.gif">
    <p>等待中</p></div>
<div id="noneData" style="display:none;text-align: center;width: 100%;line-height: 25px;">暂无数据</div>
<div class="paging" id="paging">
    <ul class="pagination pager" id="pagination" on-select-page="selectPage(page)">
        <li ng-class="{active: isActive(page)}"><a ng-click="selectPage(1)">第一页</a></li>
        <li ng-class="{disabled: noPrevious()}"><a ng-click="selectPrevious()">上一页</a></li>
        <li ng-repeat="page in pages" ng-class="{active: isActive(page)}">
            <a ng-click="selectPage(page)">{{page}}</a>
        </li>
        <li ng-class="{disabled: noNext()}"><a ng-click="selectNext()">下一页</a></li>
        <li ng-class="{active: isActive(page)}"><a ng-click="selectPage(numPages)">最后一页</a></li>
    </ul>
</div>
<script src="${ctxStatic }/jquery/jquery-1.9.1.js"></script>
<script src="http://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
<script src="${ctxStatic}/modules/wlpt/front/js/angular/angular.min.js"></script>
<script type="text/javascript" src="${ctxStatic }/modules/wlpt/front/js/jquery.tips.js"></script>
<script src="${ctxStatic}/flash/zoom.min.js" type="text/javascript"></script>
<script src="${ctxStatic}/modules/wlpt/front/js/msgbox.js" type="text/javascript"></script>
<script>

    var app = angular.module("dataHall", []);
    app.controller('dataHallCtrl', function ($scope, $http) {
        $scope.currentPage = 1;
        $scope.pageSize = 5;
        $scope.pages = [];
        ///初始化搜索条件
        $scope.searchData = {
            drivername: '', driverphone: '', isagree: ''
        };
        $scope.isDelete = function (id) {
            if (id == null || id == "") {
                return;
            }
          //  $(".loading_lock").show();
            $.MsgBox.Confirm("解绑提示","是否解除该绑定?", function () {
            	$.ajax({
                    url: "${wlpt}/wlpt/driver/deleteAttach",
                    data: {
                        id: id,
                    },
                    dataType: 'json',
                    cache: false,
                    success: function (data) {
                        $.MsgBox.Alert("删除提示",data.value);
                        $scope.onSelectPage(1);
                    }
                });
            }, function () {
                $(".loading_lock").hide();
            });
        }
        $scope.find = function (id) {
     	   if (id == null || id == "") {
                return;
            }
     	   $.ajax({
                url: "${wlpt}/wlpt/credit/getCredit",
                data: {
                    id: id,
                },
                dataType: 'json',
                cache: false,
                success: function (data) {
             	   if(data==1){
             		   top.location.href="${wlpt}/wlpt/credit/CompanyCredit?id="+id;
             	   }
             	   if(data==2){
             		   top.location.href="${wlpt}/wlpt/credit/carCredit?id="+id;
             	   }
             	   if(data==0){
             		  $.alert("用户不存在");
             	   }
                }
            });
     	   
        };
        ////isloading ==1:加载数据2:查询不到数据3:查询到数据
        $scope.isloading = function (isloading) {
            if (isloading == 1) {
                $(".loading").show();
                $("#noneData").hide();
            } else if (isloading == 2) {
                $(".loading").hide();
                $("#noneData").show();
            } else {
                $(".loading").hide();
                $("#noneData").hide();
                $(".datainit").show();
            }
        };
        //get first page
        $http({
            url: '${wlpt}/wlpt/driver/getDriverList',
            method: 'post',
            params: {
                'pageNo': $scope.currentPage,
                'pageSize': $scope.pageSize
            }
        }).success(function (response) {
            $scope.data = response.value.list;
            if (!$scope.data) {
                $scope.isloading(2);
            } else {
                $scope.isloading(3);
            }
            $scope.numPages = Math.ceil(response.value.count / response.value.pageSize);

            //分页要repeat的数组
            $scope.newPages = $scope.numPages > 5 ? 5 : $scope.numPages;
            for (var i = 0; i < $scope.newPages; i++) {
                $scope.pages.push(i + 1);
            }

        });

        $scope.onSelectPage = function (page) {
            //replace your real data
            $scope.isloading(1);
            $http({
                url: '${wlpt}/wlpt/driver/getDriverList',
                method: 'post',
                params: {
                    'pageNo': $scope.currentPage,
                    'pageSize': $scope.pageSize,
                    'namesearch': $("#drivername").val(),
                    'phonesearch': $("#driverphone").val(),
                    'isagree': $("#isagree").val()
                }
            }).success(function (response) {
                $scope.data = response.value.list;
                $scope.pages = [];
                if (!$scope.data) {
                    $scope.isloading(2);
                } else {
                    $scope.isloading(3);
                }
                $scope.numPages = Math.ceil(response.value.count / response.value.pageSize);
                if ($scope.numPages == 0) {
                    $scope.numPages = 1;
                }
                $scope.newPages = $scope.numPages > 5 ? 5 : $scope.numPages;
                for (var i = 0; i < $scope.newPages; i++) {
                    var num = $scope.currentPage - 3;
                    if (num < 0) {
                        num = 0;
                    }
                    $scope.pages.push(num + 1);
                }
                $("#datainit").show();
            });
        };
    });

    app.directive('paging', function () {
        return {
            restrict: 'AEC',
            //scope: {
            //    numPages: '=',
            //    currentPage: '=',
            //    onSelectPage: '&'
            //},
            template: '',
            replace: true,
            link: function (scope, element, attrs) {
                scope.$watch('numPages', function (value) {

                    if (scope.currentPage > value) {
                        scope.selectPage(value);
                    }
                });
                scope.isActive = function (page) {
                    return scope.currentPage === page;
                };
                scope.selectPage = function (page) {
                    //不能小于1大于最大
                    if (page < 1 || page > scope.numPages) return;
                    //最多显示分页数5
                    if (page > 2) {
                        //因为只显示5个页数，大于2页开始分页转换
                        var newpageList = [];
                        for (var i = (page - 3); i < ((page + 2) > scope.numPages ? scope.numPages : (page + 2)); i++) {
                            newpageList.push(i + 1);
                        }
                        scope.pages = newpageList;
                    }
                    if (page == 1) {
                        scope.pages = [];
                        for (var k = 0; k < scope.newPages; k++) {
                            scope.pages.push(k + 1);
                        }
                    }


                    if (!scope.isActive(page)) {
                        scope.currentPage = page;
                        scope.onSelectPage(page);
                    }
                };
                scope.selectPrevious = function () {
                    if (!scope.noPrevious()) {
                        scope.selectPage(scope.currentPage - 1);
                    }
                };
                scope.selectNext = function () {
                    if (!scope.noNext()) {
                        scope.selectPage(scope.currentPage + 1);
                    }
                };
                scope.noPrevious = function () {
                    return scope.currentPage == 1;
                };
                scope.noNext = function () {
                    return scope.currentPage == scope.numPages;
                };

            }
        };


    });

    function check() {
        var status = "${user.userinfo.status}";
        if (status != '2') {
            $("#fabu").tips({
                side: 3,
                msg: '您还未认证！',
                bg: '#00A2E9',
                time: 4
            });
            return false;
        }
        return true;
    }
</script>
</body>
</html>
