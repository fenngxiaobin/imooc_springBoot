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
                    <a href="${base}/qa/qaList?p=1">问答管理</a> <span class="fa-angle-right fa"></span> <a href="${base}/qa/qaReplyList?qaId=${qaReplyId}&p=1">回答信息</a><span class="fa-angle-right fa"></span>回复信息
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
                                                aria-label="Name: activate to sort column ascending">评论者
                                            </th>
                                            <th class="sorting_desc" tabindex="0" aria-controls="datatables-example"
                                                rowspan="1" colspan="1" style="width: 110px;"
                                                aria-label="Position: activate to sort column ascending"
                                                aria-sort="descending">评论内容
                                            </th>
                                            <th class="sorting" tabindex="0" aria-controls="datatables-example"
                                                rowspan="1" colspan="1" style="width: 117px;"
                                                aria-label="Age: activate to sort column ascending">评论时间
                                            </th>
                                            <th class="sorting" tabindex="0" aria-controls="datatables-example"
                                                rowspan="1" colspan="1" style="width: 74px;"
                                                aria-label="Salary: activate to sort column ascending">操作
                                            </th>
                                        </tr>
                                        </thead>
                                        <tbody>

                                        <#assign count=0 />
                                        <#if (answerReplyList?size > 0)>
                                            <#list answerReplyList as qaAnswerReply>
                                                <#assign count=count + 1 />
                                            <tr role="row" class="odd">
                                                <td class=""><img width="50px" height="50px" style="border-radius: 30%" src="${base}/admin/upload/${(qaAnswerReply.user.headimg)!}" />
                                                    &nbsp;&nbsp;&nbsp;${qaAnswerReply.user.username}</td>
                                                <td class="sorting_1">${qaAnswerReply.content}</td>
                                                <td><#if qaAnswerReply.createDate??>
                                                    <span title="${qaAnswerReply.createDate?string("yyyy-MM-dd HH:mm:ss")}">${qaAnswerReply.createDate?string('yyyy-MM-dd HH:mm:ss')}</span>
                                                <#else>
                                                    &nbsp;
                                                </#if>
                                                </td>
                                                <td>
                                                    <a href="${base}/qa/deleteQaAnswerReply?qaReplyId=${qaAnswerReply.id}" onclick="javascript:return p_del()" title="删除">[删除]</a>

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
                            <@pageShow (qaReplyAnswerSize/4)?ceiling,current_Page,"qa/answerReplyList?qaReplyId=${qaReplyId}"/>
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