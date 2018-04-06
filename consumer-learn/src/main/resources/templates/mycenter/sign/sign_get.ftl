
<style type="text/css">
    #active1{
        color:black;
    }
</style>
<style>
    #p_active2{  display: none;  }
    #p_active3{  display: none;  }
    #p_active4{  display: none;  }
    #p_active5{  display: none;  }
    #p_active6{  display: none;  }
    #p_active7{  display: none;  }
</style>推荐系统技术.评估及高效算法 中文版 弗朗西斯科里奇

<#include  "../base/header.ftl" >
<link rel="stylesheet" href="${base}/mycenter/css/sign.css">

<!-- main container -->
<div class="content">
    <div class="container" style="width: 800px;margin-top: 30px">
        <div class="row">
            <div class="col-xs-12 clearPadding">
                <div class="">
                    <img src="${base}/mycenter/img/sign_bg.jpg" class="img-responsive">
                </div>

                <div class="calendar">
                    <div class="calenbox">
                        <div id="calendar"></div>
                    </div>
                    <div class="text-center">
                        <#if "${(flag)!}" != "1">
                            <button class="btn btn-qiandao" onClick="signIn()">马上签到</button>
                        <#else>
                            <button class="btn btn-qiandao" onclick="alert('您今天已经签过到了！！')">马上签到</button>
                        </#if>
                    </div>
                </div>
                <!-- <div class="padding10">
                    <div class="font16 pb10 borderb"><strong>连续签到礼包</strong></div>
                    <div class="libaolist">
                        <div class="clearfix borderb ptb10">
                            <div class="col-xs-9 clearPadding">
                                <div class="media">
                                    <a class="media-left pt3" href="javascript:void(0);">
                                        <img src="images/dou.png" style="width:30px;height:30px;">
                                    </a>
                                    <div class="media-body">
                                        <div class="">5天礼包（200菲亚时尚欢乐豆）</div>
                                        <div class="text-muted font12">连续签到5天即可领取</div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-3 clearPadding text-right pt2">
                                <button class="btn btn-lingqu">领取</button>
                            </div>
                        </div>
                        <div class="clearfix borderb ptb10">
                            <div class="col-xs-9 clearPadding">
                                <div class="media">
                                    <a class="media-left pt3" href="javascript:void(0);">
                                        <img src="images/dou.png" style="width:30px;height:30px;">
                                    </a>
                                    <div class="media-body">
                                        <div class="">10天礼包（400菲亚时尚欢乐豆）</div>
                                        <div class="text-muted font12">连续签到10天即可领取</div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-3 clearPadding text-right pt2">
                                <button class="btn btn-disable" disable>已领取</button>
                            </div>
                        </div>
                        <div class="clearfix borderb ptb10">
                            <div class="col-xs-9 clearPadding">
                                <div class="media">
                                    <a class="media-left pt3" href="javascript:void(0);">
                                        <img src="images/dou.png" style="width:30px;height:30px;">
                                    </a>
                                    <div class="media-body">
                                        <div class="">15天礼包（800菲亚时尚欢乐豆）</div>
                                        <div class="text-muted font12">连续签到15天即可领取</div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-3 clearPadding text-right pt2">
                                <button class="btn btn-lingqu">领取</button>
                            </div>
                        </div>
                        <div class="clearfix borderb ptb10">
                            <div class="col-xs-9 clearPadding">
                                <div class="media">
                                    <a class="media-left pt3" href="javascript:void(0);">
                                        <img src="images/dou.png" style="width:30px;height:30px;">
                                    </a>
                                    <div class="media-body">
                                        <div class="">20天礼包（1200菲亚时尚欢乐豆）</div>
                                        <div class="text-muted font12">连续签到20天即可领取</div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-3 clearPadding text-right pt2">
                                <button class="btn btn-lingqu">领取</button>
                            </div>
                        </div>
                        <div class="clearfix borderb ptb10">
                            <div class="col-xs-9 clearPadding">
                                <div class="media">
                                    <a class="media-left pt3" href="javascript:void(0);">
                                        <img src="images/dou.png" style="width:30px;height:30px;">
                                    </a>
                                    <div class="media-body">
                                        <div class="">25天礼包（1800菲亚时尚欢乐豆）</div>
                                        <div class="text-muted font12">连续签到25天即可领取</div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-3 clearPadding text-right pt2">
                                <button class="btn btn-lingqu">领取</button>
                            </div>
                        </div>
                        <div class="clearfix borderb ptb10">
                            <div class="col-xs-9 clearPadding">
                                <div class="media">
                                    <a class="media-left pt3" href="javascript:void(0);">
                                        <img src="images/dou.png" style="width:30px;height:30px;">
                                    </a>
                                    <div class="media-body">
                                        <div class="">30天礼包（3000菲亚时尚欢乐豆）</div>
                                        <div class="text-muted font12">连续签到30天即可领取</div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-3 clearPadding text-right pt2">
                                <button class="btn btn-lingqu">领取</button>
                            </div>
                        </div>
                    </div>
                </div> -->
            </div>
        </div>
    </div>
    <div class="maskbox"></div>

    <div class="qdbox">
        <div class="text-center text-green font18"><strong>签到成功！</strong></div>
        <#--<div class="text-center pt10">您已经连续签到&nbsp;<span class="text-green">10</span>&nbsp;天</div>-->
        <div class="text-center ptb15"><img src="${base}/mycenter/img/gift.png" style="width:125px;margin-left:20px;"></div>
        <div class="close_box text-center">
            <button  class="btn btn-lottery">
                确定
            </button>
        </div>
    </div>
</div>

<script src="${base}/mycenter/js/jquery-1.9.1.min.js"></script>
<script src="${base}/mycenter/js/calendar.js"></script>
<script>
    function  signIn(){
        var date = new Date();
        var day = date.getDate();
//        alert(day);
        var userId = ${(userFront.id)!};
        $.ajax({
            url:  "/sign/addSign",
            data: {day:day,userId:userId},
            type: "POST",
            cache: false,
            success: function(data) {
                if (data == "success") {
                }else{
                    alert("签到失败，请重试！！！");
                }
            },
            complete: function() {
            }
        });

        $(".maskbox").fadeIn();
        $(".qdbox").fadeIn();
        $(".maskbox").height($(document).height());
    }
//    $(".maskbox").click(function(){
//        $(".maskbox").fadeOut();
//        $(".qdbox").fadeOut();
//    });
    $(".close_box").click(function(){
        $(".maskbox").fadeOut();
        $(".qdbox").fadeOut();
        window.location.reload();
//        window.location.href="/sign/getSign?userId="+userId;
    });
    $(function(){
        //ajax获取日历json数据
        var arr = [];
        <#list signList as sign>
        var temp = {"signDay":${sign.day}}
        arr.push(temp);
        </#list>
//        var signList=[{"signDay":"10"},{"signDay":"11"},{"signDay":"12"},{"signDay":"13"}];
        calUtil.init(arr);
    });
</script>
</body>
</html>