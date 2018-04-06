<#include "../base/header.ftl" />
<link rel="stylesheet" href="${base}/front/css/more_info.css" type="text/css">

<div id="main">

    <div class="container clearfix">
        <ul class="other-left l">
            <li>
                <a href="${base}/front/aboutUs"><span>关于我们</span></a>
            </li>
            <li>
                <a href="${base}/front/teamInfo"><span>团队介绍</span></a>
            </li>
            <li class="selected">
                <a href="${base}/front/lectureEnroll"><span>讲师招募</span></a>
            </li>
            <li>
                <a href="${base}/front/contactUs"><span>联系我们</span></a>
            </li>

            <li>
                <a no-pjajx="" href="${base}/front/friendLink"><span>友情链接</span></a>
            </li>

            <li>
                <a href="${base}/front/creditsRule"><span>积分规则</span></a>
            </li>
        </ul>
        <div class="other-right ">
            <div class="other-right-wrap">
                <div id="pjax-tiper" class="alert" style="display:none">正在加载...</div>
                <div id="pjax-container">

                    <div class="others">
                        <h1>讲师招募</h1>
                        <div class="space-side">
                            <p>想试水尝尝网络讲师的滋味？快加入智能学习平台的讲师队伍吧！</p>
                            <div class="job-block">
                                <h2>我们希望你：</h2>
                                <ol>
                                    <li>-&nbsp;热衷分享；</li>
                                    <li>-&nbsp;有项目开发经验者优先；</li>
                                    <li>-&nbsp;至少精通前端开发技术、JAVA、Python、大数据开发、go语言开发、移动端开发，软件测试、UI设计中的一项；</li>
                                </ol>
                                <h2>你的收获：</h2>
                                <ol>
                                    <li>-&nbsp;额外收入；</li>
                                    <li>-&nbsp;技术的沉淀与分享；</li>
                                    <li>-&nbsp;迅速增长的粉丝及业内知名度；</li>
                                </ol>
                                <br>
                                <#if "${(userFront.id)!}" != "">
                                    <#if "${(userFront.userType)!}"=="2">
                                        <a onclick="alert('您已经是讲师了！(^_^)。')" class="btn btn-green">立即加入</a>
                                    <#else>
                                        <a href="${base}/front/lectureEnrollInfo" class="btn btn-green">立即加入</a>
                                    </#if>
                                <#else>
                                    <a onclick="alert('您还没有登录！(^_^)。')" class="btn btn-green">立即加入</a>
                                </#if>

                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>

</div>

<#include "../base/footer.ftl" />