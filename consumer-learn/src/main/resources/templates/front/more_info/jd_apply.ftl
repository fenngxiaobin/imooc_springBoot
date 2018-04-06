<#include "../base/header.ftl"/>
<link href="${base}/front/css/lecture_enroll_info.css" rel="stylesheet" type="text/css"/>

<div id="main">

    <div class="seek-container clearfix">
        <div class="l seek-l">
            <div class="head">
                <h2 class="deepen-col">如果您的账号已被冻结，在此可以申请解冻哦！</h2>
            </div>
            <div class="content">
                <form action="${base}/user/jdApply" method="post">
                    <table id="tbzss">
                        <tbody><tr>
                            <td class="label"><span>&nbsp;</span>我的简介&申请理由</td>
                            <td class="textarea warning">
                                <textarea class="apply-introduction" id="apply-introduction" readonly="readonly"></textarea>
                                <p class="tip font-num">

                                </p>
                                <div class="portrait">
                                    <a href="https://www.imooc.com/space/u/uid/2247085"><img src="${base}/upload/default.png"></a>
                                    <div class="nickname deepen-col">XXX</div>
                                    <div class="userstate">您的用户已被冻结</div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="label"><span>&nbsp;</span>我的姓名</td>
                            <td class="warning">
                                <input id="apply-name" class="true-name" type="text" value="" readonly="readonly">
                                <p class="tip"></p>
                            </td>
                        </tr>
                        <tr>
                            <td class="label"><span>&nbsp;</span>我的邮箱</td>
                            <td class="warning">
                                <input id="apply-phone" class="phone-num" type="text" value="" readonly="readonly">
                                <p class="tip"></p>
                            </td>
                        </tr>

                        <#--<tr>-->
                            <#--<td class="label"><span>&nbsp;</span>申请理由</td>-->
                            <#--<td class="textarea warning">-->
                                <#--<textarea class="apply-introduction" id="apply-introduction" placeholder="请输入申请理由..."></textarea>-->
                        <#--</tr>-->

                        <tr>
                            <td class="label"></td>
                            <td>
                                <button class="submit" type="button" id="lecturer-submit">提交申请</button>
                                <p class="warning tip"></p>
                            </td>
                        </tr>
                        </tbody></table>
                </form>
            </div>
        </div>
    </div>

</div>

<#include "../base/footer.ftl"/>