<#include  "../base/header.ftl" />
<link rel="stylesheet" href="${base}/front/css/mall.css" type="text/css">
<div id="main">
    <div class="container clearfix">
        <div class="mall-left l">
            <h2 class="page-title">
                <a href="${base}/headFrame/mall">积分商城</a>
                <a href="${base}/front/creditsRule" target="_blank" class="howget">如何获取积分？</a>
            </h2>
            <div class="course-nav-row clearfix">
                <span class="hd l" style="width: 80px;">商品类型 :</span>
                <div class="bd l">
                    <ul>
                        <li class="course-nav-item on"><a href="${base}/headFrame/mall">全部</a></li>
                        <li class="course-nav-item on"><a href="${base}/headFrame/mall">头像框</a></li>
                    </ul>
                </div>
            </div>
            <div class="product-list">
                <ul>
                    <#list headFrameList as head>
                    <li>
                        <div class="product-list-img">
                            <a target="_blank" href="${base}/headFrame/mallView?id=${head.id}">
                                <img alt="${head.name}" src="${base}/uploadHead/${head.filePath}" width="200" height="200">
                            </a>
                            <#--<i class="out-product">售罄</i>-->
                        </div>
                        <div class="product-list-info">
                            <a href="${base}/headFrame/mallView?id=${head.id}" title="${head.name}">${head.name}</a>
                            <span>${head.price}积分</span>
                        </div>
                    </li>
                    </#list>
                </ul>
            </div>
            <!-- 分页 -->
            <!-- <div id="pagenation" class="pagenation"></div> -->
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
                        <a title="" target="_blank" class="l roll-head" href="#">
                            <img src="${base}/upload/${(userHead.user.headimg)!}" width="48" height="48">
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

<#include "../base/footer.ftl" />