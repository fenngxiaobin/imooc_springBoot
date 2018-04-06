<!DOCTYPE html>
<html lang="en">
<#include "../base/header.ftl">
<#include "../qa/pageShow.ftl">
<!-- start: Content -->
<div id="content">
    <div class="panel box-shadow-none content-header">
        <div class="panel-body">
            <div class="col-md-12">
                <h3 class="animated fadeInLeft">课程信息管理</h3>
                <p class="animated fadeInDown">
                    课程管理 <span class="fa-angle-right fa"></span> 课程信息
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
                                        <form action="${base}/course/listAdmin" id="formxx" method="GET">
                                            <label>Show
                                                <select onclick="A(this)" id="select" name="f" aria-controls="datatables-example"
                                                        class="form-control input-sm">
                                                <#--<option id="o" value="" selected="selected">请选择</option>-->
                                                    <option id="o4" value="4">4</option>
                                                    <option id="o8" value="8">8</option>
                                                    <option id="o12" value="12">12</option>
                                                </select> entries</label>
                                            <input type="hidden" name="p" value="1"></input>
                                        </form>
                                        <script>
                                            //                                            var sel = document.getElementById('select');
                                            ////                                            sel.value = 4;
                                            //                                            sel.addEventListener("onchange", A(sel), false);

                                            <#if page_Size??>
                                                <#if page_Size?eval==4>
                                                document.getElementById("o4").selected="selected";
                                                </#if>
                                                <#if page_Size?eval==8>
                                                document.getElementById("o8").selected="selected";
                                                </#if>
                                                <#if page_Size?eval==12>
                                                document.getElementById("o12").selected="selected";
                                                </#if>
                                            </#if>

                                            function A(obj)
                                            {

//                                                alert(obj.value);
                                                console.log(obj.value)
                                                var form=document.getElementById("formxx")
                                                form.submit()
//                                                alert(obj.value);
//                                                $.ajax({
//                                                    type: "GET",
//                                                    url: "/course/listAdmin",
//                                                    data:{"s":1,"p":1,"f":obj.value},
//                                                    success:function(data){
//
//                                                            location.reload();
//
//                                                    },
//                                                    complete: function() {
////                    alert("hello");
//                                                    }
//                                                });
                                            }
                                        </script>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div id="datatables-example_filter" class="dataTables_filter">
                                        <label>Search:<input class="form-control input-sm" placeholder=""
                                                             aria-controls="datatables-example" type="search"></label>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div id="datatables-example_filter" class="dataTables_filter">
                                        <button data-toggle="modal" data-target="#myModal" class=" btn ripple-infinite btn-3d btn-primary" value="primary"
                                                style="margin-top: -10px;">
                                            <span><i class="fa fa-plus-square fa-lg"></i>&nbsp;&nbsp;添加课程</span>
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
                                                            添加课程信息
                                                        </h4>
                                                    </div>
                                                    <form action="${base}/course/addCourse" method="post" enctype="multipart/form-data">
                                                        <div class="modal-body" style="height:450px;width:400px">
                                                            <label for="name" class="col-sm-2 control-label">课程名称</label>
                                                            <div class="col-sm-10">
                                                                <input type="hidden" name="userId" value="${userInfo.id}" />
                                                                <input type="text" style="width: 400px;" class="form-control" name="courseName"
                                                                       placeholder="请输入课程名称">
                                                            </div>
                                                            <label for="name" class="col-sm-2 control-label">章节数目</label>
                                                            <div class="col-sm-10">
                                                                <input type="text" style="width: 400px;" class="form-control" name="chapterNum"
                                                                       placeholder="请输入章节数目">
                                                            </div>
                                                            <label for="name" class="col-sm-2 control-label">时长</label>
                                                            <div class="col-sm-10">
                                                                <input type="text" style="width: 400px;" class="form-control" name="duration"
                                                                       placeholder="请输入时长">
                                                            </div>
                                                            <label for="name" class="col-sm-2 control-label">课时</label>
                                                            <div class="col-sm-10">
                                                                <input type="text" style="width: 400px;" class="form-control" name="hour"
                                                                       placeholder="请输入课时">
                                                            </div>
                                                            <label for="name" class="col-sm-2 control-label">类别</label>
                                                            <div class="col-sm-10">
                                                                <input type="text" style="width: 400px;" class="form-control" name="type"
                                                                       placeholder="请输入类别">
                                                            </div>
                                                            <label for="name" class="col-sm-2 control-label">简介</label>
                                                            <div class="col-sm-10">
                                                                <input type="text" style="width: 400px;" class="form-control" name="introduction"
                                                                       placeholder="请输入简介">
                                                            </div>
                                                            <label for="name" class="col-sm-2 control-label">难易等级</label>
                                                            <div class="col-sm-10">
                                                                <input type="text" style="width: 400px;" class="form-control" name="level"
                                                                       placeholder="请输入难易等级">
                                                            </div>
                                                            <label for="name" class="col-sm-2 control-label">评分</label>
                                                            <div class="col-sm-10">
                                                                <input type="text" style="width: 400px;" class="form-control" name="score"
                                                                       placeholder="请输入评分">
                                                            </div>
                                                            <label for="name" class="col-sm-2 control-label">课程图片</label>
                                                            <div class="col-sm-10">
                                                                <input type="file" style="width: 400px;" class="form-control" name="filePath"
                                                                       placeholder="请输入课程图片">
                                                            </div>
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
                                                rowspan="1" colspan="1" style="width: 185px;"
                                                aria-label="Name: activate to sort column ascending">课程名称
                                            </th>
                                            <th class="sorting_desc" tabindex="0" aria-controls="datatables-example"
                                                rowspan="1" colspan="1" style="width: 110px;"
                                                aria-label="Position: activate to sort column ascending"
                                                aria-sort="descending">时长
                                            </th>
                                            <th class="sorting" tabindex="0" aria-controls="datatables-example"
                                                rowspan="1" colspan="1" style="width: 53px;"
                                                aria-label="Office: activate to sort column ascending">课时
                                            </th>
                                            <th class="sorting" tabindex="0" aria-controls="datatables-example"
                                                rowspan="1" colspan="1" style="width: 117px;"
                                                aria-label="Age: activate to sort column ascending">创建时间
                                            </th>
                                            <th class="sorting" tabindex="0" aria-controls="datatables-example"
                                                rowspan="1" colspan="1" style="width: 95px;"
                                                aria-label="Start date: activate to sort column ascending">章节数目
                                            </th>
                                            <th class="sorting" tabindex="0" aria-controls="datatables-example"
                                                rowspan="1" colspan="1" style="width: 95px;"
                                                aria-label="Salary: activate to sort column ascending">难度等级
                                            </th>
                                            <th class="sorting" tabindex="0" aria-controls="datatables-example"
                                                rowspan="1" colspan="1" style="width: 95px;"
                                                aria-label="Salary: activate to sort column ascending">评分
                                            </th>
                                            <th class="sorting" tabindex="0" aria-controls="datatables-example"
                                                rowspan="1" colspan="1" style="width: 74px;"
                                                aria-label="Salary: activate to sort column ascending">操作
                                            </th>
                                        </tr>
                                        </thead>
                                        <tbody>

                                        <#assign count=0 />
                                        <#if (courseList?size > 0)>
                                        <#--<@lectureList count=100; lectureList>-->
                                            <#list courseList as course>
                                                <#assign count=count + 1 />
                                            <#--<#if "${lecture.userType}" != "1">-->
                                            <tr role="row" class="odd">
                                                <td class=""><img width="50px" height="50px" style="border-radius: 30%" src="${base}/upload/${(course.filePath)!}" />
                                                    &nbsp;&nbsp;&nbsp;${course.courseName}</td>
                                                <td class="sorting_1">${course.duration}</td>
                                                <td class="">
                                                ${course.hour}
                                                </td>
                                                <td><#if course.createDate??>
                                                    <span title="${course.createDate?string("yyyy-MM-dd HH:mm:ss")}">${course.createDate?string('yyyy-MM-dd HH:mm:ss')}</span>
                                                <#else>
                                                    &nbsp;
                                                </#if>
                                                </td>
                                                <td>
                                                ${course.chapterNum}
                                                </td>
                                                <td>
                                                    <#if course.level == 1><span style="color: green">容易</span>
                                                    <#elseif course.level == 2><span style="color: orange">中级</span>
                                                    <#else><span style="color: red">高级</span>
                                                    </#if>
                                                </td>
                                                <td>
                                                ${course.score}
                                                </td>
                                                <td>
                                                    <a href="${base}/chapter/chapterManage?id=${course.id}" title="课程管理">[课程管理]</a>
                                                    <a href="${base}/course/deleteCourse?id=${course.id}" onclick="javascript:return p_del()" title="删除">[删除]</a>

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
                                                    <a href="" data-toggle="modal" data-target="#myModal_update${count}" title="修改课程信息">[修改]</a>
                                                    <!-- 模态框（Modal） 修改课程信息-->
                                                    <div style="margin-top: 50px" class="modal fade" id="myModal_update${count}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                                        <div class="modal-dialog">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                                                        &times;
                                                                    </button>
                                                                    <h4 class="modal-title" id="myModalLabel">
                                                                        修改课程信息
                                                                    </h4>
                                                                </div>
                                                                <form action="${base}/course/updateCourse" method="post" enctype="multipart/form-data">
                                                                    <div class="modal-body" style="height:450px;width:400px">
                                                                        <label for="name" class="col-sm-2 control-label">课程名称</label>
                                                                        <div class="col-sm-10">
                                                                            <input type="hidden" name="id" value="${course.id}" />
                                                                            <input type="text" style="width: 400px;" class="form-control" name="courseName"
                                                                                   value="${(course.courseName)!}" placeholder="请输入课程名称">
                                                                        </div>
                                                                        <label for="name" class="col-sm-2 control-label">章节数目</label>
                                                                        <div class="col-sm-10">
                                                                            <input type="text" style="width: 400px;" class="form-control" name="chapterNum"
                                                                                   value="${(course.chapterNum)!}" placeholder="请输入章节数目">
                                                                        </div>
                                                                        <label for="name" class="col-sm-2 control-label">时长</label>
                                                                        <div class="col-sm-10">
                                                                            <input type="text" style="width: 400px;" class="form-control" name="duration"
                                                                                   value="${(course.duration)!}" placeholder="请输入时长">
                                                                        </div>
                                                                        <label for="name" class="col-sm-2 control-label">课时</label>
                                                                        <div class="col-sm-10">
                                                                            <input type="text" style="width: 400px;" class="form-control" name="hour"
                                                                                   value="${(course.hour)!}" placeholder="请输入课时">
                                                                        </div>
                                                                        <label for="name" class="col-sm-2 control-label">类别</label>
                                                                        <div class="col-sm-10">
                                                                            <input type="text" style="width: 400px;" class="form-control" name="type"
                                                                                   value="${(course.type)!}" placeholder="请输入类别">
                                                                        </div>
                                                                        <label for="name" class="col-sm-2 control-label">简介</label>
                                                                        <div class="col-sm-10">
                                                                            <input type="text" style="width: 400px;" class="form-control" name="introduction"
                                                                                   value="${(course.introduction)!}" placeholder="请输入简介">
                                                                        </div>
                                                                        <label for="name" class="col-sm-2 control-label">难易等级</label>
                                                                        <div class="col-sm-10">
                                                                            <input type="text" style="width: 400px;" class="form-control" name="level"
                                                                                   value="${(course.level)!}" placeholder="请输入难易等级">
                                                                        </div>
                                                                        <label for="name" class="col-sm-2 control-label">评分</label>
                                                                        <div class="col-sm-10">
                                                                            <input type="text" style="width: 400px;" class="form-control" name="score"
                                                                                   value="${(course.score)!}" placeholder="请输入评分">
                                                                        </div>
                                                                        <label for="name" class="col-sm-2 control-label">课程图片</label>
                                                                        <div class="col-sm-10">
                                                                            <input type="file" style="width: 400px;" class="form-control" name="filePath"
                                                                                   placeholder="请输入课程图片">
                                                                        </div>
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
                                                <#--<a href="income!view.action?id=${income.id}" title="查看">[查看]</a>-->
                                                </td>
                                            </tr>
                                            <#--</#if>-->
                                            </#list>
                                        <#--</@lectureList>-->
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
                            <#--<#if current_Page??>-->
                            <#--<p>${current_Page}</p>-->
                            <#--</#if>-->
                            <#--<#if course_size??>-->
                            <#--<p>${course_size}</p>-->
                            <#--</#if>-->
                            <#if page_Size??>
                                <@pageShow (course_size/page_Size?eval)?ceiling,current_Page,"course/listAdmin?s=1&f=${page_Size}"/>
                            <#else >
                                <@pageShow (course_size/4)?ceiling,current_Page,"course/listAdmin?s=1"/>
                            </#if>
                            <#--<@pageShow (course_size/page_Size)?ceiling,current_Page,"course/listAdmin?s=1"/>-->
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