<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="/static/modules/wlpt/front/css/analysis/global.css"/>
</head>
<body>

<div class="container-fluid" id="main-container">
    <div id="page-content" class="clearfix content" style="background-color: #eee;margin: 0px;padding: 0px;">
        <div class="box-top">平台会员分析中心</div>
        <div class="box">
            <div class="split-title">平台用户分析</div><!--分隔标题-->
            <div class="data-echart bgcolr-white">
                <iframe name="mainFrame" id="userFrame" frameborder="0"
                        src="${wlpt}/wlpt/dataCenter/user_roleauthen"
                        style="margin:0 auto;width:100%;height:100%;" scrolling="no"></iframe>
            </div>
            <div class="split-title">用户发展趋势分析</div><!--分隔标题-->
            <div class="data-echart bgcolr-white">
                <iframe name="mainFrame" id="orderFrame" frameborder="0"
                        src="${wlpt}/wlpt/dataCenter/user_trend"
                        style="margin:0 auto;width:100%;height:100%;" scrolling="no"></iframe>
            </div>
            <div class="split-title">平台车型数据分析</div><!--分隔标题-->
            <div class="data-echart bgcolr-white">
                <iframe name="mainFrame" frameborder="0" 
                        src="${wlpt}/wlpt/dataCenter/car_trend"
                        style="margin:0 auto;width:100%;height:100%;" scrolling="no"></iframe>

            </div>

        </div>

    </div><!--/#page-content-->
</div><!--/.fluid-container#main-container-->
<script src="${ctxStatic }/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
<script type="text/javascript" src="/static/echarts/echarts.min.js"></script>


</body>
</html>

