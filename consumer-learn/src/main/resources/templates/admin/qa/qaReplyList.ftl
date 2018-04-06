<!DOCTYPE html>
<html lang="en">
<#include "../base/header.ftl">
<#include "pageShow.ftl">
<!-- start: Content -->
<div id="content">
    <div class="panel box-shadow-none content-header">
        <div class="panel-body">
            <div class="col-md-12">
                <h3 class="animated fadeInLeft">问答信息管理</h3>
                <p class="animated fadeInDown">
                    <a href="${base}/qa/qaList?s=1&p=1">问答管理</a> <span class="fa-angle-right fa"></span>回答信息
                </p>
            </div>
        </div>
    </div>
    <div class="col-md-12 top-20 padding-0">
        <div class="col-md-12">
            <div class="panel">
            <#--<div class="panel-heading"><h3>Data Tables</h3></div>-->
                <div class="panel-body">
                    <div class="responsive-table">
                        <div id="datatables-example_wrapper"
                             class="dataTables_wrapper form-inline dt-bootstrap no-footer">
                            <div class="row">
                                <div class="col-sm-12">
                                    <table id="datatables-example"
                                           class="table table-striped table-bordered dataTable no-footer" role="grid"
                                           aria-describedby="datatables-example_info" style="width: 100%;" width="100%"
                                           cellspacing="0">
                                        <thead>
                                        <tr role="row">
                                            <th class="sorting" tabindex="0" aria-controls="datatables-example"
                                                rowspan="1" colspan="1" style="width: 185px;"
                                                aria-label="Name: activate to sort column ascending">回答者
                                            </th>
                                            <th class="sorting_desc" tabindex="0" aria-controls="datatables-example"
                                                rowspan="1" colspan="1" style="width: 110px;"
                                                aria-label="Position: activate to sort column ascending"
                                                aria-sort="descending">回答内容
                                            </th>
                                            <th class="sorting" tabindex="0" aria-controls="datatables-example"
                                                rowspan="1" colspan="1" style="width: 117px;"
                                                aria-label="Age: activate to sort column ascending">评论数
                                            </th>
                                            <th class="sorting" tabindex="0" aria-controls="datatables-example"
                                                rowspan="1" colspan="1" style="width: 117px;"
                                                aria-label="Age: activate to sort column ascending">回答时间
                                            </th>
                                            <th class="sorting" tabindex="0" aria-controls="datatables-example"
                                                rowspan="1" colspan="1" style="width: 74px;"
                                                aria-label="Salary: activate to sort column ascending">操作
                                            </th>
                                        </tr>
                                        </thead>
                                        <tbody>

                                        <#assign count=0 />
                                        <#if (qaReplyList?size > 0)>
                                        <#--<@lectureList count=100; lectureList>-->
                                            <#list qaReplyList as qaReply>
                                                <#assign count=count + 1 />
                                            <#--<#if "${lecture.userType}" != "1">-->
                                            <tr role="row" class="odd">
                                                <td class=""><img width="50px" height="50px" style="border-radius: 30%" src="${base}/admin/upload/${(qaReply.user.headimg)!}" />
                                                    &nbsp;&nbsp;&nbsp;${qaReply.user.username}</td>
                                                <td class="sorting_1">${qaReply.content}</td>
                                                <td class="">
                                                    <#if (qaReply.answers>0) >
                                                    ${qaReply.answers}<a href="${base}/qa/answerReplyList?qaReplyId=${qaReply.id}&p=1" title="查看评论">[查看评论]</a>
                                                    <#else >
                                                    ${qaReply.answers}
                                                    </#if>

                                                </td>
                                                <td><#if qaReply.createDate??>
                                                    <span title="${qaReply.createDate?string("yyyy-MM-dd HH:mm:ss")}">${qaReply.createDate?string('yyyy-MM-dd HH:mm:ss')}</span>
                                                <#else>
                                                    &nbsp;
                                                </#if>
                                                </td>
                                                <td>
                                                    <a href="${base}/qa/deleteQaReply?qaReplyId=${qaReply.id}" onclick="javascript:return p_del()" title="删除">[删除]</a>

                                                    <script language="javascript">
                                                        function p_del() {
                                                            var msg = "您真的确定要删除吗？\n\n请确认！";
                                                            if (confirm(msg) == true) {
                                                                return true;
                                                            } else {
                                                                return false;
                                                            }
                                                        }
                                                    </script>
                                                </td>
                                            </tr>
                                            </#list>
                                        <#else>
                                        没有记录
                                        </#if>


                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-5">
                                    <div class="dataTables_info" id="datatables-example_info" role="status"
                                         aria-live="polite">Showing 1 to 10 of 57 entries
                                    </div>
                                </div>
                            <#--新添加的分页系统-->
                            <@pageShow (qaReplySize/4)?ceiling,current_Page,"qa/qaReplyList?qaId=${qa.id}"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- end: content -->
<#include "../base/right_menu.ftl">