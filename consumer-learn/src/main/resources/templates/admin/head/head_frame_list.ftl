<!DOCTYPE html>
<html lang="en">
<#include "../base/header.ftl">

<!-- start: Content -->
<div id="content">
    <div class="panel box-shadow-none content-header">
        <div class="panel-body">
            <div class="col-md-12">
                <h3 class="animated fadeInLeft">头像框管理</h3>
                <p class="animated fadeInDown">
                    头像框管理 <span class="fa-angle-right fa"></span> 头像框信息
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
                                <div class="col-sm-4">
                                    <div class="dataTables_length" id="datatables-example_length">
                                        <label>课程名称：
                                    </div>
                                </div>
                                <div class="col-sm-5">
                                    <div id="datatables-example_filter" class="dataTables_filter">

                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div id="datatables-example_filter" class="dataTables_filter">
                                        <button data-toggle="modal" data-target="#myModal" class=" btn ripple-infinite btn-3d btn-primary" value="primary"
                                                style="margin-top: -10px;">
                                            <span><i class="fa fa-plus-square fa-lg"></i>&nbsp;&nbsp;添加头像框</span>
                                        </button>

                                        <!-- 模态框（Modal） -->
                                        <div style="margin-top: 50px" class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                                            &times;
                                                        </button>
                                                        <h4 class="modal-title" id="myModalLabel">
                                                            添加头像框
                                                        </h4>
                                                    </div>
                                                    <form action="${base}/headFrame/addHeadFrame" method="post" enctype="multipart/form-data">
                                                        <div class="modal-body" style="height:200px;width:400px">
                                                            <label for="name" class="col-sm-3 control-label">名称</label>
                                                            <div class="col-sm-9">
                                                                <input type="text" name="name" placeholder="请输入头像框名称" />
                                                            </div>
                                                            <label for="name" class="col-sm-3 control-label">文件</label>
                                                            <div class="col-sm-9">
                                                                <input type="file" style="width: 400px;" class="form-control" name="filePath"
                                                                       placeholder="请输入文件">
                                                            </div>
                                                            <label for="name" class="col-sm-3 control-label">价格</label>
                                                            <div class="col-sm-9">
                                                                <input type="text" name="price" placeholder="请输入头像框价格" />
                                                            </div>
                                                            <#--<label for="name" class="col-sm-3 control-label">介绍</label>-->
                                                            <#--<div class="col-sm-9">-->
                                                                <#--<textarea id="editor" style="width:360px;height:400px;"></textarea>-->
                                                                <#--<script type="text/javascript">-->
                                                                    <#--UE.getEditor('editor');-->
                                                                <#--</script>-->
                                                            <#--</div>-->
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                                                            </button>
                                                            <input type="submit" value="提交" class="btn btn-primary" />
                                                        </div>
                                                    </form>
                                                </div><!-- /.modal-content -->
                                            </div><!-- /.modal -->
                                        </div>
                                    </div>
                                </div>
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
                                                aria-label="Name: activate to sort column ascending">头像框名称
                                            </th>
                                            <th class="sorting_desc" tabindex="0" aria-controls="datatables-example"
                                                rowspan="1" colspan="1" style="width: 205px;"
                                                aria-label="Position: activate to sort column ascending"
                                                aria-sort="descending">头像框预览
                                            </th>
                                            <th class="sorting_desc" tabindex="0" aria-controls="datatables-example"
                                                rowspan="1" colspan="1" style="width: 205px;"
                                                aria-label="Position: activate to sort column ascending"
                                                aria-sort="descending">头像框价格
                                            </th>
                                            <th class="sorting" tabindex="0" aria-controls="datatables-example"
                                                rowspan="1" colspan="1" style="width: 125px;"
                                                aria-label="Office: activate to sort column ascending">创建时间
                                            </th>
                                            <th class="sorting" tabindex="0" aria-controls="datatables-example"
                                                rowspan="1" colspan="1" style="width: 125px;"
                                                aria-label="Office: activate to sort column ascending">修改时间
                                            </th>
                                            <th class="sorting" tabindex="0" aria-controls="datatables-example"
                                                rowspan="1" colspan="1" style="width: 95px;"
                                                aria-label="Salary: activate to sort column ascending">操作
                                            </th>
                                        </tr>
                                        </thead>
                                        <tbody>

                                        <#assign count=0>
                                        <#--<@lectureList count=100; lectureList>-->
                                        <#list headFrameList as headFrame>
                                            <#assign count=count+1>
                                        <tr role="row" class="odd">
                                            <td class="">
                                                &nbsp;&nbsp;&nbsp;${(headFrame.name)!}</td>
                                            <td class="sorting_1"><img style="width: 50px;height: 50px;" src="${base}/uploadHead/${(headFrame.filePath)!}"></td>
                                            <td class="sorting_1">${(headFrame.price)!}</td>
                                            <td class="">
                                            ${headFrame.createDate?string('yyyy-MM-dd HH:mm:ss')}
                                            </td>
                                            <td class="">
                                            ${headFrame.modifyDate?string('yyyy-MM-dd HH:mm:ss')}
                                            </td>
                                            <td>
                                                <a href="${base}/headFrame/deleteHeadFrame?id=${headFrame.id}"
                                                   onclick="javascript:return p_del()" title="删除">[删除]</a>
                                                <a href="" data-toggle="modal" data-target="#myModal_update${count}" title="修改头像框信息">[修改]</a>
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
                                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                                                &times;
                                                            </button>
                                                            <h4 class="modal-title" id="myModalLabel">
                                                                修改头像框信息
                                                            </h4>
                                                        </div>
                                                        <form action="${base}/headFrame/updateHeadFrame" method="post" enctype="multipart/form-data">
                                                            <div class="modal-body" style="height:200px;width:400px">

                                                                <label for="name" class="col-sm-3 control-label">头像框名称</label>
                                                                <div class="col-sm-9">
                                                                    <input type="hidden" name="id" value="${headFrame.id}" />
                                                                    <input type="text" name="name" value="${headFrame.name}" placeholder="请输入头像框名称"/>
                                                                </div>
                                                                <label for="name" class="col-sm-3 control-label">文件</label>
                                                                <div class="col-sm-9">
                                                                    <input type="file" style="width: 400px;" class="form-control" name="filePath" /">
                                                                </div>
                                                                <label for="name" class="col-sm-3 control-label">头像框价格</label>
                                                                <div class="col-sm-9">
                                                                    <input type="text" name="price" value="${(headFrame.price)!}" placeholder="请输入头像框价格"/>
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
                                         aria-live="polite">Showing 1 to ${headFrameList?size} entries
                                    </div>
                                </div>
                                <div class="col-sm-7">
                                    <div class="dataTables_paginate paging_simple_numbers"
                                         id="datatables-example_paginate">
                                        <#--<ul class="pagination">-->
                                            <#--<li class="paginate_button previous disabled"-->
                                                <#--id="datatables-example_previous">-->
                                                <#--<a href="#" aria-controls="datatables-example" data-dt-idx="0"-->
                                                   <#--tabindex="0">Previous</a>-->
                                            <#--</li>-->
                                            <#--<li class="paginate_button active">-->
                                                <#--<a href="#" aria-controls="datatables-example" data-dt-idx="1"-->
                                                   <#--tabindex="0">1</a>-->
                                            <#--</li>-->
                                            <#--<li class="paginate_button "><a href="#" aria-controls="datatables-example"-->
                                                                            <#--data-dt-idx="2" tabindex="0">2</a>-->
                                            <#--</li>-->
                                            <#--<li class="paginate_button "><a href="#" aria-controls="datatables-example"-->
                                                                            <#--data-dt-idx="3" tabindex="0">3</a>-->
                                            <#--</li>-->
                                            <#--<li class="paginate_button "><a href="#" aria-controls="datatables-example"-->
                                                                            <#--data-dt-idx="4" tabindex="0">4</a>-->
                                            <#--</li>-->
                                            <#--<li class="paginate_button "><a href="#" aria-controls="datatables-example"-->
                                                                            <#--data-dt-idx="5" tabindex="0">5</a>-->
                                            <#--</li>-->
                                            <#--<li class="paginate_button "><a href="#" aria-controls="datatables-example"-->
                                                                            <#--data-dt-idx="6" tabindex="0">6</a>-->
                                            <#--</li>-->
                                            <#--<li class="paginate_button next" id="datatables-example_next">-->
                                                <#--<a href="#" aria-controls="datatables-example" data-dt-idx="7"-->
                                                   <#--tabindex="0">Next</a>-->
                                            <#--</li>-->
                                        <#--</ul>-->
                                    </div>
                                </div>
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