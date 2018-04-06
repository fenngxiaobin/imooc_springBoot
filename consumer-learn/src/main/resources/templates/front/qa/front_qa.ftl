<#include "../base/header.ftl" />

<link rel="stylesheet" href="${base}/front/css/qa.css" type="text/css">

<div id="main" style="background-color: white;">
    <div class="wenda clearfix">
        <div class="js-layout-change">
            <div class="l wenda-main">
                <div class="wd-top-slogan">
                <#if "${(userFront.id)!}"=="">
                    <input type="hidden" id="userName" value="0" />
                <#else>
                    <input type="hidden" id="userName" value="${(userFront.username)!}" />
                    <input type="hidden" id="userImage" value="${(userFront.headimg)!}"/>
                    <input type="hidden" id="base" value="${base}">
                </#if>
                    <span>程序员自己的问答社区</span>
                    <a class="js-quiz" data-toggle="modal" data-target="#myModal">我要提问</a>
                    <!-- 模态框（Modal） -->
                    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                    <h4 class="modal-title" id="myModalLabel">提问</h4>
                                    <textarea id="ques_title" placeholder="请输入问题："></textarea>
                                </div>
                                <div class="modal-body">
                                    <textarea id="ques_content" placeholder="输入问题描述："></textarea>

                                </div>
                                <div class="modal-body">
                                    <div class="dropdown">
                                        <button type="button" class="btn dropdown-toggle" id="dropdownMenu1" data-toggle="dropdown">请选择问题标签:
                                            <span class="caret"></span>
                                        </button>
                                        <ul id="ulList" class="dropdown-menu" role="menu"  aria-labelledby="dropdownMenu1">
                                            <li role="presentation"  ><a role="menuitem" tabindex="-1" href="#" style="background-color: #fff;height: 38px;float: left">前端开发</a></li>
                                            <li role="presentation" ><a role="menuitem" tabindex="-1" href="#" style="background-color: #fff;height: 38px;float: left">后端开发</a></li>
                                            <li role="presentation"  ><a role="menuitem" tabindex="-1" href="#" style="background-color: #fff;height: 38px;float: left">数据库</a></li>
                                        </ul>
                                    </div>
                                </div>

                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                    <button type="button" id="addQuestionBtn" class="btn btn-primary" onclick="addQuestion()">提交更改</button>
                                </div>
                            </div><!-- /.modal-content -->
                        </div><!-- /.modal -->
                    </div>

                </div>
                <div class="nav">
                    <#--<ul id="myTab" class="frontQa-menu">-->
                        <a class="active" href="#recommend" data-toggle="tab" id="recommendMenu" style="margin-right: 50px" onclick="choose()">推荐</a>
                        <a href="#new" data-toggle="tab" id="newMenu"  style="margin-right: 50px"  onclick="choose1()">最新</a>
                        <a href="#wait" data-toggle="tab" id="waitMenu"  onclick="choose2()">等待回答</a>
                    <#--</ul>-->
                    <div id="myTabContent" class="tab-content lists-container list-wrap " style="margin-top: 20px;border-top: 1px solid #d0d6d9">
                        <div class="tab-pane fade in active" id="recommend">
                            <div class="wenda-list">
                            <#list qaList?sort_by("answers")?reverse as qa>
                                <div class="ques-answer no-answer">
                                    <div class="tag-img">
                                        <a href="" target="_blank">
                                            <img src="${base}/upload/${qa.user.headimg}" title="JAVA">
                                        </a>
                                    </div><!--.tag-img end-->
                                    <div class="from-tag">        来自
                                        <a href="https://www.imooc.com/wenda/3" target="_blank">${qa.label}</a>
                                    </div><!--.from-tag end-->
                                    <div class="ques-con">
                                        <a href="${base}/qa/qaView?id=${qa.id}" class="ques-con-content" target="_blank" title="${qa.title}">${qa.title}</a>
                                    </div><!--.ques-con end-->
                                    <div class="info-bar clearfix">
                                        <a href="${base}/qa/qaView?id=${qa.id}" class="to-answer">撰写答案</a>
                                        <#--<p class="integral-info"><a href="https://www.imooc.com/about/faq?t=3" target="_blank">回答问题最高可获<span>2积分</span>哦！</a></p>-->
                                        <a href="${base}/qa/qaView?id=${qa.id}" class="answer-num">${qa.answers}个回答</a>
                                        <a href="javascript:;" class="follow" data-ques-id="386605"><i class="heart">关注</i></a>
                                    </div><!--.info-bar end-->
                                </div><!--.ques-answer end-->
                            </#list>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="new">
                            <div class="wenda-list">
                            <#list qaList?sort_by("createDate")?reverse as qa>
                                <div class="ques-answer no-answer">
                                    <div class="tag-img">
                                        <a href="https://www.imooc.com/wenda/3" target="_blank">
                                            <img src="${base}/upload/${qa.user.headimg}" title="JAVA">
                                        </a>
                                    </div><!--.tag-img end-->
                                    <div class="from-tag">        来自
                                        <a href="https://www.imooc.com/wenda/3" target="_blank">${qa.label}</a>
                                    </div><!--.from-tag end-->
                                    <div class="ques-con">
                                        <a href="${base}/qa/qaView?id=${qa.id}" class="ques-con-content" target="_blank" title="${qa.title}">${qa.title}</a>
                                    </div><!--.ques-con end-->
                                    <div class="info-bar clearfix">
                                        <a href="${base}/qa/qaView?id=${qa.id}" class="to-answer">撰写答案</a>
                                        <p class="integral-info"><a href="https://www.imooc.com/about/faq?t=3" target="_blank">回答问题最高可获<span>2积分</span>哦！</a></p>
                                        <a href="${base}/qa/qaView?id=${qa.id}" class="answer-num">${qa.answers}个回答</a>
                                        <a href="javascript:;" class="follow" data-ques-id="386605"><i class="heart">关注</i></a>
                                    </div><!--.info-bar end-->
                                </div><!--.ques-answer end-->
                            </#list>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="wait">
                            <div class="wenda-list">
                            <#list qaList as qa>
                                <#if qa.answers==0>
                                    <div class="ques-answer no-answer">
                                        <div class="tag-img">
                                            <a href="https://www.imooc.com/wenda/3" target="_blank">
                                                <img src="${base}/upload/${qa.user.headimg}" title="JAVA">
                                            </a>
                                        </div><!--.tag-img end-->
                                        <div class="from-tag">        来自
                                            <a href="https://www.imooc.com/wenda/3" target="_blank">${qa.label}</a>
                                        </div><!--.from-tag end-->
                                        <div class="ques-con">
                                            <a href="${base}/qa/qaView?id=${qa.id}" class="ques-con-content" target="_blank" title="${qa.title}">${qa.title}</a>
                                        </div><!--.ques-con end-->
                                        <div class="info-bar clearfix">
                                            <a href="${base}/qa/qaView?id=${qa.id}" class="to-answer">撰写答案</a>
                                            <p class="integral-info"><a href="https://www.imooc.com/about/faq?t=3" target="_blank">回答问题最高可获<span>2积分</span>哦！</a></p>
                                            <a href="${base}/qa/qaView?id=${qa.id}" class="answer-num">${qa.answers}个回答</a>
                                            <a href="javascript:;" class="follow" data-ques-id="386605"><i class="heart">关注</i></a>
                                        </div><!--.info-bar end-->
                                    </div><!--.ques-answer end-->
                                </#if>
                            </#list>
                            </div>
                        </div>
                    </div>

                </div><!--.nav end-->
                <!--推荐位-->
                <ul class="recommend">
                    <#--<li>-->
                        <#--<a href="https://www.imooc.com/wenda/issue" class="recommend-tag canlink">本期话题<i class="icon-right2"></i></a>-->
                        <#--<a href="https://www.imooc.com/wenda/issuedetail/24" class="recommend-link" data-ast="yuanwenindex_1_1499" target="_blank" title="【花式填坑】第23期 运维进化篇：成为Python DevOps工程师有哪些必备条件？">【花式填坑】第23期 运维进化篇：成为Python DevOps工程师...</a>-->
                    <#--</li>-->
                </ul>
                <!--recommend end-->
                <!--左侧列表内容-->
                <#--<div class="wenda-list">-->
                <#--<#list qaList as qa>-->
                    <#--<div class="ques-answer no-answer">-->
                        <#--<div class="tag-img">-->
                            <#--<a href="${base}/mycenter/myprofile" target="_blank">-->
                                <#--<img src="${base}/upload/${(qa.user.headimg)!}" title="JAVA">-->
                            <#--</a>-->
                        <#--</div><!--.tag-img end&ndash;&gt;-->
                        <#--<div class="from-tag">        来自-->
                            <#--<a href="" target="_blank">${qa.label}</a>-->
                        <#--</div><!--.from-tag end&ndash;&gt;-->
                        <#--<div class="ques-con">-->
                            <#--<a href="${base}/qa/qaView?id=${qa.id}" class="ques-con-content" target="_blank" title="${qa.title}">${qa.title}</a>-->
                        <#--</div><!--.ques-con end&ndash;&gt;-->
                        <#--<div class="info-bar clearfix">-->
                            <#--<a href="${base}/qa/qaView?id=${qa.id}" class="to-answer">撰写答案</a>-->
                            <#--<p class="integral-info"><a href="" target="_blank">回答问题最高可获<span>2积分</span>哦！</a></p>-->
                            <#--<a href="${base}/qa/qaView?id=${qa.id}" class="answer-num">${qa.answers}个回答</a>-->
                            <#--<a href="javascript:;" class="follow" data-ques-id="386605"><i class="heart">关注</i></a>-->
                        <#--</div><!--.info-bar end&ndash;&gt;-->
                    <#--</div><!--.ques-answer end&ndash;&gt;-->
                <#--</#list>-->
                <#--</div>-->
            <#--</div>-->



        </div>
            <div class="r wenda-slider">
                <div class="user-about">
                    <div class="user-info">
                        <div class="user-pic">
                            <a href="https://www.imooc.com/u/1328987/bbs">
                                <img src="${base}/upload/${(userFront.headimg)!}" alt="${(userFront.username)!}">
                            </a>
                        </div>
                        <div class="user-name">
                        <#if Session["userFront"]?exists>
                            <a href="">${Session["userFront"].username}</a>
                        <#else >
                            <a href="">未登录</a>
                        </#if>

                        </div>
                        <div class="integral-info clearifx">
                            <a href="${base}/headFrame/mall" class="integral">积分：${(credits.credit)!}</a>
                            <a href="${base}/headFrame/mall" class="integral-mall">积分商城</a>
                        </div>
                    </div><!--.user-info end-->
                    <#--<div class="user-action">-->
                        <#--<span class="ques"><a href="">提问</a><!-- <i></i>&ndash;&gt;</span>-->
                        <#--<span class="reply"><a href="">回答</a></span>-->
                        <#--<span class="follow"><a href="">关注</a></span>-->
                    <#--</div><!--.user-action end&ndash;&gt;-->
                </div><!--.user-about end-->

                <#--<!--.my-follow-class登录后可见&ndash;&gt;-->
                <#--<div class="my-follow-class">-->
                    <#--<h3>我关注的分类 <span class="js-open">+</span></h3>-->
                    <#--<div class="tag-box clearfix">-->
                        <#--<a href="https://www.imooc.com/wenda/17">JavaScript</a>-->
                        <#--<a href="https://www.imooc.com/wenda/5">Html/CSS</a>-->
                        <#--<a href="https://www.imooc.com/wenda/14">Html5</a>-->
                        <#--<a href="https://www.imooc.com/wenda/15">JQuery</a>-->
                        <#--<a href="https://www.imooc.com/wenda/25">CSS3</a>-->
                        <#--<a href="https://www.imooc.com/wenda/3">JAVA</a>-->
                    <#--</div><!--.tag-box end&ndash;&gt;-->
                <#--</div><!--.my-follow-class end&ndash;&gt;-->


                <#--<div class="advertisement">-->
                    <#--<a href="" data-ast="yuanwenindexright_1_871">-->
                        <#--<img src="" alt="【花23】">-->
                    <#--</a>-->
                <#--</div><!--.advertisement end&ndash;&gt;-->
                <div class="hot-ques">
                    <h3 class="title">热门问题</h3>
                    <ul>
                    <#if hotQaList??>
                        <#list hotQaList as qa>
                            <li>
                                <p class="content"><a target="_blank" href="">${qa.title}</a></p>
                                <div class="info-bar clearfix">
                                    <a target="_blank" href="" class="answer-num">${qa.answers} 回答</a>
                                    <a target="_blank" href="" class="from">来自 ${qa.label}</a>
                                </div>
                            </li>
                        </#list>
                    </#if>
                    </ul><!--ul end-->
                </div><!--.hot-ques end-->

                <div class="leifeng-sort">
                    <h3 class="title clearfix">
                        <span>回答雷锋榜</span>
                        <span class="leifeng-tab js-leifeng-tab" data-type="week">一周</span>
                        <#--<span class="leifeng-tab js-leifeng-tab active" data-type="day">今日</span>-->
                    </h3>

                    <div class="leifeng-tab-box leifeng-day js-leifeng-tab-box" data-type="day">
                        <ul class="leifeng-tab-box-min">
                        <#if hotUserList??>
                            <#list hotUserList as user>
                                <li>
                                    <div class="ranking first">${user_index+1}</div>
                                    <div class="user-pic">
                                        <a target="_blank" >
                                            <img src="${base}/upload/${user.headimg!}" title="${user.username}">
                                        </a>
                                    </div><!--.user-pic end-->
                                    <div class="user-name">
                                        <a target="_blank" >${user.username}</a>
                                    </div><!--.user-name end-->
                                    <div class="user-info clearfix">
                                        <span class="role">${user.position}</span>
                                        <span class="answer-num">${hash[user.username]!}回答</span>
                                    </div><!--.user-info end-->
                                </li>
                            </#list>
                        </#if>
                        </ul>
                    </div>
                </div><!--.leifeng-sort end-->

            </div>
    </div>
</div>

<#include "../base/footer.ftl" />
<script>
     function choose(){
    document.getElementById("recommendMenu").style.color="red";
    document.getElementById("newMenu").style.color="#93999F";
    document.getElementById("waitMenu").style.color="#93999F"
     }
     function choose1(){
         document.getElementById("recommendMenu").style.color="#93999F";
         document.getElementById("newMenu").style.color="red";
         document.getElementById("waitMenu").style.color="#93999F"
     }
     function choose2(){
         document.getElementById("recommendMenu").style.color="#93999F";
         document.getElementById("newMenu").style.color="#93999F";
         document.getElementById("waitMenu").style.color="red"
     }


</script>
<script type="text/javascript">

    var userImage = document.getElementById("userImage").value
    var base=document.getElementById("base").value
    console.log(userName)
    var label=null
    //  获取标签
    $(document).ready(function(){
        $("#ulList li").click(function(){
            console.log("hahaha")
            label=$(this).text();
            alert(label);
        });
    });

    function addQuestion() {
        $('#myModal').modal('hide');
        var userName = document.getElementById("userName").value
        var title=document.getElementById("ques_title").value
        var content=document.getElementById("ques_content").value
        console.log("添加问题")
        console.log(title)
        console.log(content)
        if(userName != 0){
            $.ajax({
                type: "POST",
                url: "/qa/addQuestion",
                data:{"userName":userName,"label":label,"content":content,"title":title,"videoId":1},
                success:function(data){
                    if(data == "success"){
                        var str="";
                    }
                    location.reload()

                },
                complete: function() {
//                    alert("hello");
                }
            });
//            console.log(video.currentTime);
        }else{
            alert("登录才能评论");
            return;
        }
        document.getElementById("ques_title").value=null
        document.getElementById("ques_content").value=null

    }
</script>