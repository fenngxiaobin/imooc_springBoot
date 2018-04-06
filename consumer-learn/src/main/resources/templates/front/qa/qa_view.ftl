<#include "../base/header.ftl">
<link rel="stylesheet" href="${base}/front/css/test1.css" type="text/css">

<script type="text/javascript" src="${base}/kindeditor/themes/default/default.css"></script>
<script type="text/javascript" src="${base}/kindeditor/plugins/code/prettify.css"></script>
<script type="text/javascript" src="${base}/kindeditor/kindeditor.js"></script>
<script type="text/javascript" src="${base}/kindeditor/lang/zh_CN.js"></script>
<script type="text/javascript" src="${base}/kindeditor//plugins/code/prettify.js"></script>
<style>
    body{
        background-color: #edeff0
    }
    .common_source_top {
        width: 623px;
        height: 12px;
        background: url(${base}/mycenter/img/icons.gif) no-repeat scroll 0 -875px;
    }
    .common_source_main {
        border-left: 1px solid #dcdcdc;
        border-right: 1px solid #dcdcdc;
        background: #fafafa;
        padding: 12px 15px;
        margin-left: 1px;
        width: 587px;
        box-sizing: content-box;
    }
    .common_source_bottom {
        width: 623px;
        height: 12px;
        background: url(${base}/mycenter/img/icons.gif) no-repeat scroll 0 -890px;
    }
    .qa-comment-author1 img {
        width: 40px;
        border-radius: 50%;
    }
    .qa-comment-author1{
        width: 90px;
        text-align: center;
        float: left;
    }
    .qa-comment-time{
        font-size: 12px;
        color: #c8cdd2;
    }
    .qa-father{
        border-bottom: 1px solid #edf1f2;
        margin-top: 6px;
        width: 600px;
        height: 80px
    }
</style>

<script type="text/javascript">
    window.onload=function myalert()
    {
        editor1.html("")
    }
    var editor1;
    KindEditor.ready(function(K) {
        editor1 = K.create('textarea[name="content"]', {
            cssPath : '${base}/kindeditor/plugins/code/prettify.css',
        <#--uploadJson : '${base}/kindeditor/jsp/upload_json.jsp',-->
        <#--fileManagerJson : '${base}/kindeditor/jsp/file_manager_json.jsp',-->
            allowFileManager : true,
            afterCreate : function() {
                var self = this;
                K.ctrl(document, 13, function() {
                    self.sync();
                    document.forms['example'].submit();
                });
                K.ctrl(self.edit.doc, 13, function() {
                    self.sync();
                    document.forms['example'].submit();
                });
            }
        });
        prettyPrint();
    });


    function addAnswer() {
        //关键所在，同步输入的值到textarea中
        editor1.sync();
        var content=document.getElementById("content_textarea").value
        var userName = document.getElementById("userName").value
        var QaId = document.getElementById("qaId").value;
//        alert(userName)
//        alert(content)
//        alert(QaId)



        var userImg=document.getElementById("userImage").value
        var base=document.getElementById("base").value
        var container=document.getElementById("answers");
        var date=new Date()
        var time=date.getFullYear()+'-'+date.getMonth()+'-'+date.getDate()+' '+date.getHours()+':'+date.getMinutes()+':'+date.getSeconds();
        var div=document.createElement("div");
        var text="<div class=\"qa-comments\" data-title=\"\">"+
                "                    <div class=\"qa-comment js-qa-comment\" data-cid=\"403529\" id=\"id_403529\">"+
                "                        <div class=\"qa-comment-wrap clearfix \">"+
                "                            <div class=\"qa-comment-author\">"+
                "                                <a href=\"/u/3355992/bbs\" title=\"\">"+
                "                                    <img src=\'${base}/upload/"+userImg+"\' width=\'40\' height=\'40\' />"+
                "                                    <span class=\"qa-comment-nick\">"+userName+"</span>"+
                "                                </a>"+
                "                            </div>"+
                "                            <div class=\"qa-comment-d \">"+
                "                                <!-- <div class=\"qa-triangle-left\"><i></i></div> -->"+
                "                                <div class=\"qa-comment-inner\">"+
                "                                    <div class=\"qa-comment-c aimgPreview\">"+
                "                                        <div class=\"rich-text\">"+
                "                                            <p>"+content+"</p>"+
                "                                        </div>"+
                "                                    </div>"+
                "                                    <div class=\"qa-comment-addon\">"+
                "                                        <span class=\"qa-comment-time\">"+time+"</span>"+
                "                                        <div class=\"qa-comment-addon-r\">"+
                "                                            <#--<span class=\"qa-total-reply js-reply-item-reply\" >-->"+
                "                                                <#--<i  class=\"icon-msg\"></i>-->"+
                "                                                <#--<span class=\"js-qa-tr-num\" id=\"reply${count}\">回复</span>-->"+
                "                                            <#--</span>-->"+
                "                                            <span class=\"js-qa-comment-support qa-comment-support  js-qacom-supported-user\" data-ids=\"250894-403529\">"+
                "                                                <i class=\"icon-reply2\"></i>"+
                "                                                        <input type=\"hidden\" id=\"hiddenReply\" value=\"\"/>"+
                "                                                <span  onclick=\"getReply()\">0个回复</span>"+
                "                                            </span>"+
                "                                        </div>"+
                "                                    </div>"+
                "                                </div>"+
                "                            </div>"+
                "                        </div>"+
                "                        <div class=\"qa-reply\" id=\"showQaReply\" style=\"display:none\">"+
                "                            <!-- 回复框 -->"+
                "                        <#--style=\"display:none;\"-->"+
                "                            <div class=\"js-qa-reply-ibox qa-reply-ibox  clearfix\" id=\"qa-reply-text\" >"+
                "                                <div class=\"qa-reply-iavator l\">"+
                "                                    <a href=\"/u/1328987/id\" title=\"luwei13218016163\">"+
                "                                        <img src=\'//img.mukewang.com/user/545846580001fede02200220-40-40.jpg\' width=\'40\' height=\'40\' />"+
                "                                    </a>"+
                "                                </div>"+
                "                                <div class=\"qa-reply-iwrap\">"+
                "                                    <div class=\"qa-reply-iarea\">"+
                "                                        <textarea name=\"\" id=\"reply_text_area\" class=\"js-reply-ipt-default ipt\"  placeholder=\"写下你的评论...\"></textarea>"+
                "                                    </div>"+
                "                                </div>"+
                "                                <div class=\"qa-reply-ifoot clearfix\">"+
                "                                    <div class=\"qa-reply-footright r\">"+
                "                                        <div class=\"captcha-verify-box js-reply-verify-box hide\"></div>"+
                "                                        <span class=\"qa-tips\"></span>"+
                "                                        <button class=\"btn-normal btn-mini js-ipt-cancel\" id=\"cancel\">取消</button>"+
                "                                    <#--问题id 回复id -->"+
                "                                        <button class=\"btn-mini btn-green  js-ipt-submit\"  onclick=\"addReply()\">提交</button>"+
                "                                    </div>"+
                "                                </div>"+
                "                            </div>"+
                "                        </div>"+
                "                    </div>"+
                "                </div>";
        div.innerHTML=text
        container.appendChild(div)


        if(userName != 0){
            $.ajax({
                type: "POST",
                url: "/qa/addAnswer",
                data:{"qaid":QaId,"content":content,"userName":userName},
                success:function(data){
                    editor1.html("");
//                    alert("123")
//                    location.reload();
                },
                complete: function() {
                    editor1.html("");
                    location.reload();
                }
            });
        }else{
            alert("登录才能评论");
            return;
        }
//        location.reload();
    }

</script>

<script>

</script>

<script type="text/javascript">
    //    var qaReplyToPOId=document.getElementById("reply").value

    function getReply(qaReply_index) {
        var replyListContainer=document.getElementById("showQaReply"+qaReply_index)
//        获取回答的Id
        if(replyListContainer.style.display=='none'){
            replyListContainer.style.display='block'
        }else if(replyListContainer.style.display=='block'){
            replyListContainer.style.display='none'
        }

    }

</script>
<script>
    function addReply(qaId,ReplyId,qaReply_index) {
        console.log(qaId,ReplyId)
        var userName = document.getElementById("userName").value;
        var userImg=document.getElementById("userImage").value
        var base=document.getElementById("base").value
        var content=document.getElementById("reply_text_area"+qaReply_index).value
        console.log(userName)
        console.log(content)
        if(userName != 0){
            $.ajax({
                type: "POST",
                url: "/qa/addReply",
                data:{"QaId":qaId,"ReplyId":ReplyId,"content":content,"userName":userName},
                success:function(data){
                    if(data == "success"){
                        var str="";
                        document.getElementById("reply_text_area"+qaReply_index).value=null
                    }
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

        var container=document.getElementById("ul-reply"+qaReply_index);
        var li=document.createElement("li");
        var text="<div class=\'qa-father\' >"+
                "<div class=\"qa-comment-author1\">"+
                "                                                                <a href=\"/u/3355992/bbs\" title=\"\">"+
                "                                                                    <img src=\'"+base+"/upload/"+userImg+"\' width=\'40\' height=\'40\' />"+
                "                                                                    <span class=\"qa-comment-nick\">"+userName+"</span>"+
                "                                                                </a>"+
                "                                                            </div>"+
                "                                                            <div >"+
                "                                                                    <p>"+content+"</p>"+
                "                                                            </div>"+"</div>";
        li.innerHTML=text
        container.appendChild(li)
    }
</script>

<script>
    function hideInputArea(qaReply_index){
        var replyListContainer=document.getElementById("showQaReply"+qaReply_index)
                <#--<a href="#Anchor${qaReply_index}" title="">-->
            replyListContainer.style.display='none'
            document.getElementById("js-content-main").scrollIntoView();
//        }
    }
</script>




<div id="main" style="background-color: #fff">
<#if "${(userFront.id)!}"=="">
    <input type="hidden" id="userName" value="0" />
<#else>
    <input type="hidden" id="userName" value="${(userFront.username)!}" />
    <input type="hidden" id="userImage" value="${(userFront.headimg)!}">
    <input type="hidden" id="base" value="${base}">
    <input type="hidden" id ="qaId" value="${qa.id}">
</#if>
    <div class="container qa-container clearfix">
        <div class="qa-left l">
            <div class="qa-left-wrap">
                <div class="qa-header">
                    <div class="qa-header-right r">
                        <!-- credit -->

                        <#--<a href="javascript:;" data-id="250894" data-type="5" data-uid="2894744" class="js-tip-off l tipoff" >举报</a>-->
                        <!-- share -->
                        <div class="small-share l">
                            <ul class="share-wrap">
                                <li>
                                    <#--<span class="share-txt">分享</span>-->
                                </li>
                                <li class="weichat-posi">
                                    <div class="bdsharebuttonbox weichat-style bdshare-button-style0-16" data-tag="share_1">
                                        <a href="#" class="icon-cloud4" data-cmd="weixin" title="分享到微信"></a>
                                        <a href="#" class="icon-renren" data-cmd="qzone" title="分享到qq空间"></a>
                                        <a href="#" class="icon-sina-weibo" data-cmd="tsina" title="分享到新浪微博"></a>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <em class="split l"></em>
                        <!-- follow -->
                        <#--<a href="javascript:void(0)" data-id="250894" class="l wenda-add-collection js-collection-btn">-->
                            <#--<i class="icon-heart4" style="color: red"></i>-->
                        <#--</a>-->
                        <#--<span class="care l">关注</span>-->
                    </div>

                </div>
                <div class="qa-content" data-qid="250894" style="margin-left: 100px">
                    <div style="width: 90px;text-align: center;margin-left: -100px;float: left">
                        <a href="#" target="_blank" class="qa-author"><img src='${base}/upload/${(qa.user.headimg)!}' width='40' height='40' style="margin-right: 0px"/>
                            <span class="qa-comment-nick">${qa.user.username}</span></a>
                    </div>
                    <div class="qa-content-inner aimgPreview">
                        <div id="js-content-main">
                            <h1 class="js-qa-wenda-title qa-wenda-title">${qa.title}</h1>
                            <div id="js-qa-content" class="qa-disscus rich-text"><p>${qa.content}</p></div>
                        </div>
                    </div>
                    <div class="share-rl-tips cont-credit">
                        <#--<span>快来回答问题，最佳答案可 +</span><strong>2积分</strong>-->
                        <#--<a target="_blank" href="#" class="credit-rl">什么是积分？</a>-->
                    </div>

                    <div class="qa-content-addon clearfix">
                        <span class="qa-createtime l"></span>
                        <a href="${base}/video/videoView?id=${qa.video.id}" class="qa-course-from"> 源自：${qa.video.videoName}... ${qa.video.serialNumber}</a>
                        <span class="qa-view-num r">33 浏览</span>
                    <#--<span class="qa-total-comment r">${qaReplyList?size} 回答</span>-->
                    </div>
                </div>

                <div id="answers">
                <#list qaReplyList1 as qaReply>
                    <#assign  key=qaReply_index />
                    <div class="qa-comments" data-title="">
                        <div class="qa-comment js-qa-comment" data-cid="403529" id="id_403529">
                            <div class="qa-comment-wrap clearfix ">
                                <div class="qa-comment-author">
                                    <a href="#Anchor${qaReply_index}" title="">
                                        <img src='${base}/upload/${(qaReply.user.headimg)!}' width='40' height='40' />
                                        <span class="qa-comment-nick">${(qaReply.user.username)!}</span>
                                    </a>
                                </div>
                                <div class="qa-comment-d ">
                                    <!-- <div class="qa-triangle-left"><i></i></div> -->
                                    <div class="qa-comment-inner">
                                        <div class="qa-comment-c aimgPreview">
                                            <div class="rich-text">
                                                <p>${(qaReply.content)!}</p>
                                            </div>
                                        </div>
                                        <div class="qa-comment-addon">
                                            <span class="qa-comment-time">${(qaReply.createDate?string("yyyy-MM-dd HH:mm:ss"))!}</span>
                                            <div class="qa-comment-addon-r">
                                                <#--<a>点赞</a>-->
                                                <#--<a>反对</a>-->
                                                <#--<a href="#" data-id="403529" data-type="6" data-uid="3355992" class="js-tip-off l tipoff" >举报</a>-->
                                            <#--<span class="qa-total-reply js-reply-item-reply" >-->
                                            <#--<i  class="icon-msg"></i>-->
                                            <#--<span class="js-qa-tr-num" id="reply${count}">回复</span>-->
                                            <#--</span>-->

                                                <span class="js-qa-comment-support qa-comment-support  js-qacom-supported-user" data-ids="250894-403529">
                                                <i class="icon-reply2"></i>

                                                        <input type="hidden" id="hiddenReply${qaReply_index}" value="${qaReply.id}"/>


                                                <span  onclick="getReply(${qaReply_index})">${qaReply.answers!0}个回复</span>
                                            </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        <#-- 回复处理 -->
                            <div class="qa-reply" id="showQaReply${qaReply_index}" style="display:none">
                                <div class="qa-reply-header"></div>
                                <div class="qa-replies">

                                    <div class="common_source_top"></div>
                                    <div class="common_source_main" >


                                <#--style="display:none;"-->
                                    <div class="qa-reply-c" id="replysContainer" >
                                    <#--<p class="qa-reply-loading">-->
                                    <#--加载中...-->
                                    <#--</p>-->
                                    <#--默认显示三条回复的回复-->
                                        <ul id="ul-reply${qaReply_index}">
                                            <#if map[qaReply.content]??>
                                                <#assign qaReplys=map[qaReply.content]>
                                                <#list qaReplys as qa>
                                                    <#if qa.qaReplyToPOId??>
                                                        <li>
                                                            <div class="qa-father">
                                                            <div class="qa-comment-author1" >
                                                                <a href="" title="">
                                                                    <img src='${base}/upload/${(qa.user.headimg)!}' width='40' height='40' />
                                                                    <span class="qa-comment-nick">${qa.user.username}</span>
                                                                </a>
                                                            </div>
                                                                <span class="qa-comment-time">${(qaReply.createDate?string("yyyy-MM-dd HH:mm:ss"))!}</span>
                                                            <div >
                                                                <p>${qa.content}</p>
                                                            </div>
                                                            </div>
                                                        </li>
                                                    <#else >
                                                    </#if >

                                                </#list>
                                            </#if>

                                        </ul>
                                    </div>
                                    </div>
                                    <div class="common_source_bottom"></div>


                                </div>
                                <!-- 回复框 -->
                            <#--style="display:none;"-->
                                <div class="js-qa-reply-ibox qa-reply-ibox  clearfix" id="qa-reply-text${qaReply_index}" >
                                    <div class="qa-reply-iavator l">
                                        <a href="" title="luwei13218016163">
                                            <img src='${base}/upload/${(userFront.headimg)!}' width='40' height='40' />
                                        </a>
                                    </div>
                                    <div class="qa-reply-iwrap">
                                        <div class="qa-reply-iarea">
                                            <textarea name="" id="reply_text_area${qaReply_index}" class="js-reply-ipt-default ipt"  placeholder="写下你的评论..."></textarea>
                                        </div>
                                    </div>
                                    <div class="qa-reply-ifoot clearfix">
                                        <div class="qa-reply-footright r">
                                            <div class="captcha-verify-box js-reply-verify-box hide"></div>
                                            <span class="qa-tips"></span>
                                            <button class="btn-normal btn-mini js-ipt-cancel" id="cancel${qaReply_index}" onclick="hideInputArea(${qaReply_index})">取消</button>
                                        <#--问题id 回复id -->
                                            <button class="btn-mini btn-green  js-ipt-submit"  onclick="addReply(${qaReply.qa.id},${(qaReply.id)!0},${qaReply_index})">提交</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>


                </#list>
                </div>




                <div id="js-qa-comment-input" class="qa-comment-input js-msg-context  clearfix">
                    <div class="qa-ci-avator l">

                        <a href="" title="luwei13218016163"><img src='${base}/upload/${(userFront.headimg)!}' width='40' height='40' /></a>
                    </div>
                    <div class="qa-ci-wrap">
                        <form action="/qa/addAnswer" method="post">
                            <div id="js-reply-editor-box" class="qa-comment-box js-ci-inner ">
                            <#--<input type="hidden" name="user.id" value="${(userFront.id)!}" />-->
                            <#--<input type="hidden" name="qa.id" value="${(qa.id)!}" />-->
                                <textarea id="content_textarea" name="content" cols="100" rows="16"></textarea>
                            </div>
                            <div id="js-qa-ci-footer" class="qa-ci-footer clearfix">
                                <div class="qa-ci-footright r">
                                    <div class="captcha-verify-box js-verify-box hide"></div>
                                    <span class="qa-tips"></span>
                                <#if "${(userFront.id)!}"=="">
                                    <input type="button" id="js-qa-ci-submit" onclick="javascript:alert('您还没有登录！请登录之后回复。')" class="btn btn-green " value="回答" />
                                <#else>
                                    <input type="button" onclick="addAnswer()" id="js-qa-ci-submit" class="btn btn-green " data-qid="250894" value="回答" />
                                </#if>

                                </div>
                            </div>
                    </div>
                </div>
            </div>
            <div class="tipoff-block js-tipoff-block"></div>
            <div class="tipoff-box js-tipoff-box">
                <div class="tipoff-top-box clearfix">
                    <p class="l tipoff-title">举报</p>
                    <span class="r tipoff-close-btn icon-close2 js-tipoff-close"></span>
                </div>
                <div class="tipoff-type-box js-tipoff-typebox clearfix">
                    <div class="tipoff-loading">
                        <div class="bounce1"></div>
                        <div class="bounce2"></div>
                        <div class="bounce3"></div>
                    </div>
                </div>
                <div class="tipoff-content">
                    <textarea name="tipoff-content" class="tipoff-desc js-tipoff-desc" placeholder="写下举报理由"></textarea>
                    <div class="tipoff-text"><span class="js-tipoff-text">0</span>/150</div>
                </div>
                <div class="tipoff-btn-box clearfix">
                    <div class="r tipoff-submit-btn js-tipoff-submit" data-tipofftype="">提交</div>
                    <div class="r tipoff-cancel-btn js-tipoff-close">取消</div>
                </div>
            </div>




        </div>
    <#--右侧提问区-->
        <div class="qa-right r">
            <div class="wenda-slider">
                <!-- 发新问题 -->
                <div class="newques-container">
                    <a href="${base}/qa/frontQa" class="newques-btn" id="js-newques" target="_blank">返回问题中心</a>
                </div>
                <!--user info-->
                <div class="wenda-my">
                <#if Session["userFront"]?exists>
                    <div class="user-info">
                        <a class="user-img" href="">
                            <img src="${base}/upload/${(Session["userFront"].user.headimg)!}" alt=""/>
                        </a>
                        <p class="username">${(Session["userFront"].user.username)!}</p>
                        <a href="" target="_blank" class="credit-count">我的积分：0</a>
                    </div>

                <#else >
                    <a href="" target="_blank" class="credit-count">我的积分：0</a>
                </#if>

                </div>
            <#-- 右侧问答区 -->
                <div class="panel about-ques">
                    <div class="panel-heading">
                        <h2 class="panel-title">相关问题</h2>
                    </div>
                    <div class="panel-body clearfix">
                    <#if recommendQaList??>
                        <#list recommendQaList as reQa>
                            <div class="mkhotlist padtop"><a href="${base}/qa/qaView?id=${reQa.id}" target="_blank">${reQa.title}</a></div>
                        </#list>

                    </#if>
                    </div>
                </div>

                <!-- reply rank -->
                <!-- course relations -->
            </div>
        </div>
    </div>

    <div id="reply-box" style="display:none;">
        <div class="js-qa-reply-ibox qa-reply-ibox clearfix aaa" >
            <div class="qa-reply-iavator l">
                <a href="" title="${(qaReply.user.username)!}">
                    <img src='' width='40' height='40' />
                </a>
            </div>
            <div class="qa-reply-iwrap">
                <div class="qa-reply-iarea">
                    <textarea maxlength="300" name="" id="" class="js-reply-ipt" readonly placeholder="写下你的评论..."></textarea>
                </div>
                <div class="qa-reply-ifoot clearfix">
                    <div class="qa-reply-footright r">
                        <div class="captcha-verify-box js-reply-verify-box hide"></div>
                        <span class="qa-tips"></span>
                        <button class="btn-mc-light js-ipt-cancel">取消</button>
                        <button class="btn-mc btn-mini btn-mc-green disabled">提交</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>




<#include "../base/footer.ftl" />


<script>
    $(document).ready(function() {
        $(".js-reply-item-reply").on('click',function(e){
            var num = e.target.id;
            console.log(num);
//            var num = $(".js-qa-tr-num").attr("id");
            var last_num = num.charAt(num.length - 1);
            console.log(last_num);
//            $("#reply" + last_num).click(function () {
            $("#qa-reply-text" + last_num).css("display","block")
//            });
            $("#cancel"+last_num).click(function () {
                $("#qa-reply-text"+last_num).css("display","none")
            });
        })
    <#--var num = ${qaReplyList?size?js_string};-->
    <#--var temp1 = ${count?js_string};-->
    <#--//        alert(temp1);-->
    <#--for(temp=1 ; temp <= temp1 ; temp++){-->
    <#--alert(temp);-->
    <#--$("#reply"+temp).click(function () {-->
    <#--$("#qa-reply-text"+temp).css("display","block")-->
    <#--});-->
    <#--$("#cancel"+temp).click(function () {-->
    <#--$("#qa-reply-text"+temp).css("display","none")-->
    <#--});-->
    <#--}-->
    })

</script>