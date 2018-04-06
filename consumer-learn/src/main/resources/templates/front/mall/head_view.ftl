<#include "../base/header.ftl" />
<link rel="stylesheet" href="${base}/front/css/mall.css" type="text/css">
<div id="main">

    <div class="container clearfix">
        <div class="mall-left l">
            <h2 class="page-title">
                <a href="${base}/headFrame/mall">积分商城</a> 商品详情
            </h2>

            <div class="product-details" data-id="155">
                <div class="product-top">
                    <div class="product-img l">
                        <img alt="${headFrame.name}" src="${base}/uploadHead/${headFrame.filePath}" width="360" height="360">
                    </div>
                    <div class="product-info r" id="product-info" data-type="1">
                        <#--<form action="${base}/headFrame/addUserHeadFrame" method="post">-->
                      <span class="product-info-t">
                        头像框
                      </span>
                        <h3 class="js-good-name">${headFrame.name}</h3>

                        <div class="product-price">
                            <span id="pro-price">${headFrame.price}</span> <b>积分</b>
                            <div class="pro-warning clearfix">
                                <i class="icon-warning"></i>
                                <span>请勿刷分，违者积分清零</span>
                            </div>
                        </div>
                        <span class="product-info-t">选择类型:</span>
                        <ul class="js-goods-size">
                            <li class=" curr" data-catid="293" data-size="白男款M" data-store="9">${headFrame.name}</li>
                        </ul>
                            <input id="userId" type="hidden" name="user.id" value="${(userFront.id)!}" />
                            <input id="headFrameId" type="hidden" name="headFrame.id" value="${(headFrame.id)!}" />
                            <a class="btn btn-red js-btn-exchange" onclick="addUserHeadFrame()" data-credit="0">立即兑换</a>

                        <div class="product-info-c">已选择“${headFrame.name}”，库存<span id="store_num">999999</span>件</div>
                    </div>
                </div>
                <script>
                    function addUserHeadFrame(){
                        var userId = "${(userFront.id?js_string)!}";
                        <#--var headFrameId = "${(userFront.id?js_string)!}";-->
                        var headFrameId = "${(headFrame.id?js_string)!}";
                        if(userId == ""){
                            alert("您还没有登录，登录了之后才能兑换");
                            return false;
                        }
                        $.ajax({
                            type: "POST",
                            url: "/headFrame/addUserHeadFrame",
                            data:{"user.id":userId,"headFrame.id":headFrameId},
                            success:function(data){
                                if(data == "success"){
                                    alert("兑换成功（><）");
                                    window.location.href="/front/index";
                                }else if(data =="headFrame_have"){
                                    alert("您已经拥有这个头像框了，换换别的试试");
                                }else if(data == "credit_error"){
                                    alert("您的积分不足，参加活动换取积分吧！");
                                }
                            },
                            complete: function() {
                            }
                        });
                    }
                </script>
                <#--<h4>商品详情</h4>-->
                <div class="product-content">
                </div>
            </div>
            <!-- 分页 -->
            <#--<div id="pagenation" class="pagenation"></div>-->
        </div>
        <!-- 右侧 -->
        <div class="mall-right r">
            <div class="panel">
                <div class="panel-heading">
                    <h2 class="panel-title">TA们在买 </h2>
                </div>

                <ul class="mall-users">
                <#assign  count = 0 />
                <#list userHeadFrameList?sort_by("createDate")?reverse as userHead>
                <#assign  count =count +1 />
                <#if count <= 15>
                    <li>
                        <a title="${userHead.user.username}" target="_blank" class="l roll-head" href="">
                            <img src="${base}/upload/${userHead.user.headimg}" width="48" height="48">
                        </a>
                        <a class="rankingnickname" title="${userHead.user.username}" target="_blank" href="">${userHead.user.username}</a>
                        <span class="archieve">购买了<a href="">${userHead.headFrame.name}</a></span>
                    </li>
                </#if>
                </#list>
                </ul>
            </div>
        </div>
    </div>

</div>


<#include  "../base/footer.ftl" />