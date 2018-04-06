
<style type="text/css">
    #active1{
        color:black;
        font-weight: bold;
    }
    input{
        line-height: normal !important;
    }
    .span5{
        width: 200px !important;
        display: inline-block !important;
    }
</style>
<style>
    #p_active2{  display: none;  }
    #p_active3{  display: none;  }
    #p_active4{  display: none;  }
    #p_active5{  display: none;  }
    #p_active6{  display: none;  }
    #p_active7{  display: none;  }
</style>
<link rel="stylesheet" type="text/css" href="${base}/mycenter/css/font-awesome.4.6.0.css">
<link rel="stylesheet" href="${base}/mycenter/css/amazeui.min.css">
<link rel="stylesheet" href="${base}/mycenter/css/amazeui.cropper.css">
<link rel="stylesheet" href="${base}/mycenter/css/custom_up_img.css">
<style type="text/css">
    .up-img-cover {width: 200px;height: 100px;}
    .up-img-cover img{width: 50%;}
</style>

<#include  "../base/header.ftl" >
<script src="${base}/front/js/login.js"></script>
    <div class="content">
        <!--add-->
        <center>
            <#--<div class="up-img-cover"  id="up-img-touch" >-->
                <#--<img class="am-circle" alt="点击图片上传" src="img/hu.jpg" data-am-popover="{content: '点击上传', trigger: 'hover focus'}" >-->
            <#--</div>-->
        </center>
        <div><a style="text-align: center; display: block;"  id="pic"></a></div>


        <div class="wrap">
            <div class="u-container" style="margin-top: 200px;">
                <div class="c-tab clearfix">
                    <div class="mt_char">
                        修改资料
                    </div>
                    <div class="tool-right r">
                        <div class="tool-all">
                        </div>
                    </div>
                </div>
                    <form id="validateForm" method="post" enctype="multipart/form-data">
                        <div class="field-wrap">
                            <input type="hidden" name="id" value="${(userFront.id)!}" />
                            <label>用户名：</label>
                            <input type="text" name="username" value="${(userFront.username)!}" readonly/>
                        </div>
                        <div class="field-wrap">
                            <label>新密码：</label>
                            <input type="password" name="password" id="password" />
                        </div>
                        <div class="field-wrap">
                            <label>再次输入密码：</label>
                            <input type="password" name="confirm" id="confirm" />
                        </div>

                        <div class="span6 field-box actions">
                            <input type="button"onclick="updatepassword()" class="btn-glow primary" value="保存" />
                            <span></span>
                            <#--<input type="reset" value="重置" class="reset" />-->
                        </div>
                    </form>

                </div>
            </div>



    </div>
<script>
    function reload() {
        location.reload();
    }
</script>
<script src="${base}/mycenter/js/jquery-1.8.3.min.js"></script>
<script src="${base}/mycenter/js/amazeui.min.js" charset="utf-8"></script>
<script src="${base}/mycenter/js/cropper.min.js" charset="utf-8"></script>
<script src="${base}/mycenter/js/custom_up_img.js" charset="utf-8"></script>

<script type="text/javascript" src="js/zcity.js"></script>
<script type="text/javascript">
    zcityrun('.zcityGroup');
</script>
<#--<!-- scripts &ndash;&gt;-->
<#--<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>-->
<#--<script type="text/javascript" src="js/zcity.js"></script>-->

<#--<script type="text/javascript">-->
    <#--zcityrun('.zcityGroup');-->
<#--</script>-->

<#--<!-- scripts &ndash;&gt;-->
<#--<script src="js/jquery-latest.js"></script>-->
<#--<script src="js/bootstrap.min.js"></script>-->
<#--<script src="js/jquery-ui-1.10.2.custom.min.js"></script>-->
<#--<!-- knob &ndash;&gt;-->
<#--<script src="js/jquery.knob.js"></script>-->
<#--<!-- flot charts &ndash;&gt;-->
<#--<script src="js/jquery.flot.js"></script>-->
<#--<script src="js/jquery.flot.stack.js"></script>-->
<#--<script src="js/jquery.flot.resize.js"></script>-->
<#--<script src="js/theme.js"></script>-->

<#--<script type="text/javascript">-->
    <#--$(function () {-->

        <#--// jQuery Knobs-->
        <#--$(".knob").knob();-->



        <#--// jQuery UI Sliders-->
        <#--$(".slider-sample1").slider({-->
            <#--value: 100,-->
            <#--min: 1,-->
            <#--max: 500-->
        <#--});-->
        <#--$(".slider-sample2").slider({-->
            <#--range: "min",-->
            <#--value: 130,-->
            <#--min: 1,-->
            <#--max: 500-->
        <#--});-->
        <#--$(".slider-sample3").slider({-->
            <#--range: true,-->
            <#--min: 0,-->
            <#--max: 500,-->
            <#--values: [ 40, 170 ],-->
        <#--});-->



        <#--// jQuery Flot Chart-->
        <#--var visits = [[1, 50], [2, 40], [3, 45], [4, 23],[5, 55],[6, 65],[7, 61],[8, 70],[9, 65],[10, 75],[11, 57],[12, 59]];-->
        <#--var visitors = [[1, 25], [2, 50], [3, 23], [4, 48],[5, 38],[6, 40],[7, 47],[8, 55],[9, 43],[10,50],[11,47],[12, 39]];-->

        <#--var plot = $.plot($("#statsChart"),-->
                <#--[ { data: visits, label: "Signups"},-->
                    <#--{ data: visitors, label: "Visits" }], {-->
                    <#--series: {-->
                        <#--lines: { show: true,-->
                            <#--lineWidth: 1,-->
                            <#--fill: true,-->
                            <#--fillColor: { colors: [ { opacity: 0.1 }, { opacity: 0.13 } ] }-->
                        <#--},-->
                        <#--points: { show: true,-->
                            <#--lineWidth: 2,-->
                            <#--radius: 3-->
                        <#--},-->
                        <#--shadowSize: 0,-->
                        <#--stack: true-->
                    <#--},-->
                    <#--grid: { hoverable: true,-->
                        <#--clickable: true,-->
                        <#--tickColor: "#f9f9f9",-->
                        <#--borderWidth: 0-->
                    <#--},-->
                    <#--legend: {-->
                        <#--// show: false-->
                        <#--labelBoxBorderColor: "#fff"-->
                    <#--},-->
                    <#--colors: ["#a7b5c5", "#30a0eb"],-->
                    <#--xaxis: {-->
                        <#--ticks: [[1, "JAN"], [2, "FEB"], [3, "MAR"], [4,"APR"], [5,"MAY"], [6,"JUN"],-->
                            <#--[7,"JUL"], [8,"AUG"], [9,"SEP"], [10,"OCT"], [11,"NOV"], [12,"DEC"]],-->
                        <#--font: {-->
                            <#--size: 12,-->
                            <#--family: "Open Sans, Arial",-->
                            <#--variant: "small-caps",-->
                            <#--color: "#697695"-->
                        <#--}-->
                    <#--},-->
                    <#--yaxis: {-->
                        <#--ticks:3,-->
                        <#--tickDecimals: 0,-->
                        <#--font: {size:12, color: "#9da3a9"}-->
                    <#--}-->
                <#--});-->

        <#--function showTooltip(x, y, contents) {-->
            <#--$('<div id="tooltip">' + contents + '</div>').css( {-->
                <#--position: 'absolute',-->
                <#--display: 'none',-->
                <#--top: y - 30,-->
                <#--left: x - 50,-->
                <#--color: "#fff",-->
                <#--padding: '2px 5px',-->
                <#--'border-radius': '6px',-->
                <#--'background-color': '#000',-->
                <#--opacity: 0.80-->
            <#--}).appendTo("body").fadeIn(200);-->
        <#--}-->

        <#--var previousPoint = null;-->
        <#--$("#statsChart").bind("plothover", function (event, pos, item) {-->
            <#--if (item) {-->
                <#--if (previousPoint != item.dataIndex) {-->
                    <#--previousPoint = item.dataIndex;-->

                    <#--$("#tooltip").remove();-->
                    <#--var x = item.datapoint[0].toFixed(0),-->
                            <#--y = item.datapoint[1].toFixed(0);-->

                    <#--var month = item.series.xaxis.ticks[item.dataIndex].label;-->

                    <#--showTooltip(item.pageX, item.pageY,-->
                            <#--item.series.label + " of " + month + ": " + y);-->
                <#--}-->
            <#--}-->
            <#--else {-->
                <#--$("#tooltip").remove();-->
                <#--previousPoint = null;-->
            <#--}-->
        <#--});-->
    <#--});-->
<#--</script>-->

<#--</body>-->
<#--</html>-->