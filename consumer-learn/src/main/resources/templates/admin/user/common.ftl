<!DOCTYPE html>
<html lang="en">
<#include "../base/header.ftl">
<#include "../qa/pageShow.ftl">
<!-- start: Content -->
<div id="content">
    <div class="panel box-shadow-none content-header">
        <div class="panel-body">
            <div class="col-md-12">
                <h3 class="animated fadeInLeft">普通用户管理</h3>
                <p class="animated fadeInDown">
                    用户管理 <span class="fa-angle-right fa"></span> 普通用户
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
                                <div class="col-sm-6">
                                    <div class="dataTables_length" id="datatables-example_length">
                                        <label>Show
                                            <select name="datatables-example_length" aria-controls="datatables-example"
                                                    class="form-control input-sm">
                                                <option value="10" selected="selected">10</option>
                                                <option value="25">25</option>
                                                <option value="50">50</option>
                                                <option value="100">100</option>
                                            </select> entries</label>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div id="datatables-example_filter" class="dataTables_filter">
                                        <#if "${(userInfo.userType)!}"=="0">
                                            <#else>

                                        <select name="course.id" id="courseId">
                                            <#if courseList?exists>
                                                <#list courseList as course>
                                                    <option value ="${course.id}">${course.id}${course.courseName}</option>
                                                </#list>
                                            </#if>
                                        </select>
                                        &nbsp;&nbsp;&nbsp;&nbsp;<i style="font-size: 20px;color: #0c66ae;cursor:pointer;" title="按课程号查找" onclick="choiceCourse()" class="fa fa-search"></i>
                                        <script>
                                            function choiceCourse(){
                                                var courseId = document.getElementById("courseId").value;
                                                window.location.href="/user/common?courseId="+courseId;
                                            }
                                        </script>
                                            </#if>
                                    </div>
                                </div>
                            <#--<div class="col-sm-3">-->
                            <#--<div id="datatables-example_filter" class="dataTables_filter">-->
                            <#--<button class=" btn ripple-infinite btn-3d btn-primary" value="primary" style="margin-top: -10px;">-->
                            <#--<span><i class="fa fa-plus-square fa-lg"></i>&nbsp;&nbsp;添加用户</span>-->
                            <#--</button>-->
                            <#--</div>-->
                            <#--</div>-->
                            </div>
                            <div class="row">
                                <div class="col-sm-12">
                                    <table id="datatables-example"
                                           class="table table-striped table-bordered dataTable no-footer" role="grid"
                                           aria-describedby="datatables-example_info" style="width: 100%;" width="100%"
                                           cellspacing="0">
                                        <thead>
                                        <tr role="row">
                                            <th class="sorting" tabindex="0" aria-controls="datatables-example"
                                                rowspan="1" colspan="1" style="width: 165px;"
                                                aria-label="Name: activate to sort column ascending">Username
                                            </th>
                                            <th class="sorting_desc" tabindex="0" aria-controls="datatables-example"
                                                rowspan="1" colspan="1" style="width: 205px;"
                                                aria-label="Position: activate to sort column ascending"
                                                aria-sort="descending">Email
                                            </th>
                                            <th class="sorting" tabindex="0" aria-controls="datatables-example"
                                                rowspan="1" colspan="1" style="width: 125px;"
                                                aria-label="Office: activate to sort column ascending">用户状态
                                            </th>
                                            <th class="sorting" tabindex="0" aria-controls="datatables-example"
                                                rowspan="1" colspan="1" style="width: 117px;"
                                                aria-label="Age: activate to sort column ascending">创建账户
                                            </th>
                                            <th class="sorting" tabindex="0" aria-controls="datatables-example"
                                                rowspan="1" colspan="1" style="width: 117px;"
                                                aria-label="Start date: activate to sort column ascending">信息修改
                                            </th>
                                            <th class="sorting" tabindex="0" aria-controls="datatables-example"
                                                rowspan="1" colspan="1" style="width: 95px;"
                                                aria-label="Salary: activate to sort column ascending">操作
                                            </th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <#assign count=0>
                                        <#if commonList?exists>
                                        <#list commonList as common>
                                                <#assign count=count+1>
                                            <tr role="row" class="odd">
                                                <td class=""><img width="50px" height="50px" style="border-radius: 30%" src="${base}/upload/${(common.headimg)!}" />
                                                    &nbsp;&nbsp;&nbsp;${common.username}</td>
                                                <td class="sorting_1">${common.email}</td>
                                                <td class="">
                                                    <#if common.userStatus ==0 ><i class="fa fa-check-square-o"
                                                                                    style="color: green">正常</i>
                                                        <#if "${(userInfo.userType)!}"=="0">
                                                            <#if "${(common.userType)!}"=="0">
                                                                <span title="您无权冻结管理员">[冻结锁定]</span>
                                                            <#else>
                                                                <a href="${base}/user/view?id=${common.id}" title="操作冻结">[冻结锁定]</a>
                                                            </#if>
                                                        </#if>
                                                    <#elseif common.userStatus == 1><i class="fa fa-hourglass-half"
                                                                                        style="color:orange">待审核</i>
                                                        <#if "${(userInfo.userType)!}"=="0">
                                                            <a href="${base}/user/view?id=${common.id}"
                                                               title="操作通过审核">[审核操作]</a>
                                                        </#if>
                                                    <#elseif common.userStatus == 2>
                                                        <i class="fa fa-lock" style="color: red">锁定</i>
                                                        <#if "${(userInfo.userType)!}"=="0">
                                                            <a href="${base}/user/view?id=${common.id}"
                                                               title="操作解除冻结">[解除冻结]</a>
                                                        </#if>
                                                    <#else>
                                                        <i class="fa fa-times" style="color: grey">审核未通过</i>
                                                        <#if "${(userInfo.userType)!}"=="0">
                                                            <a href="${base}/user/view?id=${common.id}"
                                                               title="操作审核">[重新审核]</a>
                                                        </#if>
                                                    </#if>
                                                </td>
                                                <td><#if common.createDate??>
                                                    <span title="${common.createDate?string("yyyy-MM-dd HH:mm:ss")}">${common.createDate?string('yyyy-MM-dd HH:mm:ss')}</span>
                                                <#else>
                                                    &nbsp;
                                                </#if>
                                                </td>
                                                <td><#if common.modifyDate??>
                                                    <span title="${common.modifyDate?string("yyyy-MM-dd HH:mm:ss")}">${common.modifyDate?string('yyyy-MM-dd HH:mm:ss')}</span>
                                                <#else>
                                                    &nbsp;
                                                </#if></td>
                                                <td>
                                                    <#if "${(userInfo.userType)!}"=="0">
                                                    <a href="${base}/user/delete?id=${common.id}"
                                                       onclick="javascript:return p_del()" title="删除">[删除]</a>
                                                    <a href="" data-toggle="modal" data-target="#myModal_update${count}" title="修改用户信息">[修改]</a>
                                                    </#if>
                                                </td>
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

                                                <!-- 模态框（Modal） ---------修改信息-->
                                                <div style="margin-top: 50px" class="modal fade" id="myModal_update${count}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                                    <div class="modal-dialog">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                            <#--<button type="button" class="close" data-dismiss="modal" aria-hidden="true">-->
                                                            <#--&times;-->
                                                            <#--</button>-->
                                                                <h4 class="modal-title" id="myModalLabel">
                                                                    修改用户信息
                                                                </h4>
                                                            </div>
                                                            <form action="${base}/user/updateUser" method="post" enctype="multipart/form-data">
                                                                <div class="modal-body" style="height:550px;width:400px">

                                                                    <label for="name" class="col-sm-2 control-label">用户名</label>
                                                                    <div class="col-sm-10">
                                                                        <input type="hidden" name="id" value="${common.id}" />
                                                                        <input type="text" style="width: 400px;" class="form-control" name="username"
                                                                               value="${(common.username)!}" placeholder="请输入用户">
                                                                    </div>
                                                                    <label for="name" class="col-sm-2 control-label">Email</label>
                                                                    <div class="col-sm-10">
                                                                        <input type="text" style="width: 400px;" class="form-control" name="email"
                                                                               value="${(common.email)!}" placeholder="请输入用户email">
                                                                    </div>
                                                                    <label for="name" class="col-sm-2 control-label">用户状态</label>
                                                                    <div class="col-sm-10">
                                                                        <input type="text" style="width: 400px;" class="form-control" name="userStatus"
                                                                               value="${(common.userStatus)!}" placeholder="请输入用户状态">
                                                                    <#--<textarea id="quick_post" name="content" rows="10" cols="80" placeholder="请输入赛事内容">${(sportInfo.content)!}</textarea>-->
                                                                    </div>
                                                                    <label for="name" class="col-sm-2 control-label">用户类别</label>
                                                                    <div class="col-sm-10">
                                                                        <input type="text" style="width: 400px;" class="form-control" name="userType"
                                                                               value="${(common.userType)!}" placeholder="请输入用户类别">
                                                                    </div>
                                                                    <label for="name" class="col-sm-2 control-label">所在城市</label>
                                                                    <div class="col-sm-10">
                                                                        <input type="text" style="width: 400px;" class="form-control" name="city"
                                                                               value="${(common.city)!}" placeholder="请输入所在城市">
                                                                    </div>
                                                                    <label for="name" class="col-sm-2 control-label">用户介绍</label>
                                                                    <div class="col-sm-10">
                                                                        <textarea id="quick_post" name="introduction" rows="10" cols="50" placeholder="请输入用户介绍">${(common.introduction)!}</textarea>
                                                                    </div>
                                                                    <label for="name" class="col-sm-2 control-label">职位</label>
                                                                    <div class="col-sm-10">
                                                                        <input type="text" style="width: 400px;" class="form-control" name="position"
                                                                               value="${(common.position)!}" placeholder="请输入用户职位">
                                                                    </div>

                                                                    <label for="name" class="col-sm-2 control-label">头像</label>
                                                                    <div class="col-sm-10">
                                                                        <input type="file" style="width: 400px;" class="form-control" name="headimg" />
                                                                    </div>
                                                                </div>
                                                                <div class="modal-footer">
                                                                    <input type="button" value="关闭" class="col-sm-4 btn btn-default" data-dismiss="modal" />
                                                                    <input type="submit" value="提交" class="col-sm-4 btn btn-primary" />
                                                                </div>
                                                            </form>
                                                        </div><!-- /.modal-content -->
                                                    </div><!-- /.modal -->
                                                </div>
                                            </tr>
                                        </#list>
                                        </#if>
                                        <#--</@lectureList>-->


                                        <#if count == 0>
                                        <tr role="row" class="odd">
                                            <td class="" colspan="6">没有记录</td>
                                        </tr>
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
                            <@pageShow (commonListSize/4)?ceiling,current_Page,"user/common?s=1"/>
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