<#include "../base/header.ftl"/>
<link href="${base}/front/css/lecture_enroll_info.css" rel="stylesheet" type="text/css"/>
<div id="main">
<#if "${(userFront.username)!}"=="">
    <script>
        window.location.href="/front/lectureEnroll";
    </script>
</#if>
    <div class="seek-container clearfix">
        <div class="l seek-l">
            <div class="head">
                <h2 class="deepen-col">欢迎加入Hi课讲师团，世界因你而精彩</h2>
            </div>
            <div class="content">
                <form action="${base}/user/applyLecture" method="post">
                    <table>
                        <tbody>
                        <tr>
                            <td class="label"><span class="star">*&nbsp;</span>我的简介</td>
                            <td class="textarea warning">
                                <input type="hidden" name="id" value="${(userFront.id)!}" />
                        <#if userToLecture?exists>
                            <#if "${(userToLecture.userStatus)!}"=="1">
                                <textarea name="introduction" class="apply-introduction" id="apply-introduction" readonly>${(userFront.introduction)!}</textarea>
                            </#if>
                        <#else>
                            <textarea name="introduction" class="apply-introduction" id="apply-introduction" >${(userFront.introduction)!}</textarea>
                        </#if>
                                <p class="tip font-num">

                                </p>
                                <div class="portrait">
                                    <a href="https://www.imooc.com/space/u/uid/2247085"><img src="${base}/upload/${(userFront.headimg)!}"></a>
                                    <div class="nickname deepen-col">${(userFront.username)!}</div>
                                    <div class="nickname deepen-col">${(userFront.city)!}</div>
                                    <div class="nickname deepen-col">${(userFront.position)!}</div>

                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="label"><span class="star">*&nbsp;</span>我的姓名(不可编辑)</td>
                            <td class="warning">
                                <input id="apply-name" class="true-name" type="text" value="${(userFront.username)!}" readonly="readonly">
                                <p class="tip"></p>
                            </td>
                        </tr>
                        <tr>
                            <td class="label"><span class="star">*&nbsp;</span>我的邮箱(不可编辑)</td>
                            <td class="warning">
                                <input id="apply-phone" class="phone-num" type="text" value="${(userFront.email)!}" readonly="readonly">
                                <p class="tip"></p>
                            </td>
                        </tr>

                        <tr>
                            <td class="label"></td>
                            <td>
                                <#--<button class="submit" type="button" id="lecturer-submit">提交</button>-->
                                    <#if userToLecture?exists>
                                        <#if "${(userToLecture.userStatus)!}"=="1">

                                            <input type="button" class="btn btn-block btn-lg" value="等待审核中...">
                                            <p style="color: red;">您的申请已经提交到后台管理员处审核，当前状态是:审核中...&nbsp;&nbsp;&nbsp;请耐心等待</p>
                                        </#if>
                                    <#else>
                                        <input type="submit" class="btn btn-success btn-lg" value="提交" />
                                    </#if>

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
