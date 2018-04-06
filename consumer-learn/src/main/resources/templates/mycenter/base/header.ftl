<!DOCTYPE html >
<html>
<head>
    <title>My Center</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <!-- bootstrap -->
    <#--<link href="css/bootstrap/bootstrap.css" rel="stylesheet" />-->
    <link href="${base}/mycenter/css/bootstrap/bootstrap-responsive.css" rel="stylesheet" />
    <#--<link href="css/bootstrap/bootstrap-overrides.css" type="text/css" rel="stylesheet" />-->

    <!-- libraries -->
    <link href="${base}/mycenter/css/lib/jquery-ui-1.10.2.custom.css" rel="stylesheet" type="text/css" />
    <link href="${base}/mycenter/css/lib/font-awesome.css" type="text/css" rel="stylesheet" />

    <!-- global styles -->
    <link rel="stylesheet" type="text/css" href="${base}/mycenter/css/layout.css" />
    <link rel="stylesheet" type="text/css" href="${base}/mycenter/css/elements.css" />
    <link rel="stylesheet" type="text/css" href="${base}/mycenter/css/icons.css" />
    <link rel="stylesheet" type="text/css" href="${base}/mycenter/css/new.css" />
    <link rel="stylesheet" type="text/css" href="${base}/mycenter/css/zcity.css">
    <link rel="stylesheet" type="text/css" href="${base}/mycenter/css/course_history.css">

    <!-- this page specific styles -->
    <link rel="stylesheet" href="${base}/mycenter/css/compiled/index.css" type="text/css" media="screen" />

    <!-->
    <#--<link rel="stylesheet" href="${base}/front/css/animate.css">-->
    <link    rel="stylesheet" href="${base}/front/css/icomoon.css">
    <link    rel="stylesheet" href="${base}/front/css/bootstrap.css">
    <#--<link rel="stylesheet" href="${base}/front/css/magnific-popup.css">-->
    <#--<link rel="stylesheet" href="${base}/front/css/owl.carousel.min.css">-->
    <#--<link rel="stylesheet" href="${base}/front/css/owl.theme.default.min.css">-->
    <#--<link rel="stylesheet" href="${base}/front/css/flexslider.css">-->
    <#--<link rel="stylesheet" href="${base}/front/css/pricing.css">-->
    <link     rel="stylesheet" href="${base}/front/css/style.css">
    <#--<link     rel="stylesheet" href="${base}/front/css/a.css" type="text/css">-->
    <link     rel="stylesheet" href="${base}/front/css/new.css" type="text/css">
    <#--<link rel="stylesheet" href="${base}/front/css/teacher.css">-->
    <#--<link href="${base}/front/css/test.css" rel="stylesheet" type="text/css" />-->
    <link    rel="stylesheet" href="${base}/front/css/index_search.css">
    <#--<link rel="stylesheet" href="${base}/front/css/lib/font-awesome.css">-->
    <!-->



    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>
<body>
<#if "${(userFront.username)!}"=="">
<script>
    window.location.href="/front/index";
</script>
</#if>
<!-- navbar -->
<#--<div class="navbar navbar-inverse">-->
    <#--<div class="navbar-inner">-->
        <#--<button type="button" class="btn btn-navbar visible-phone" id="menu-toggler">-->
            <#--<span class="icon-bar"></span>-->
            <#--<span class="icon-bar"></span>-->
            <#--<span class="icon-bar"></span>-->
        <#--</button>-->

        <#--<a class="brand" href="${base}/front/index"><img src="img/logo.png" /></a>-->

        <#--<ul class="nav pull-right">-->
            <#--<li class="hidden-phone">-->
                <#--<input class="search" type="text" />-->
            <#--</li>-->
            <#--<li class="notification-dropdown hidden-phone">-->
                <#--<a href="#" class="trigger">-->
                    <#--<i class="icon-warning-sign"></i>-->
                    <#--<span class="count">8</span>-->
                <#--</a>-->
                <#--<div class="pop-dialog">-->
                    <#--<div class="pointer right">-->
                        <#--<div class="arrow"></div>-->
                        <#--<div class="arrow_border"></div>-->
                    <#--</div>-->
                    <#--<div class="body">-->
                        <#--<a href="#" class="close-icon"><i class="icon-remove-sign"></i></a>-->
                        <#--<div class="notifications">-->
                            <#--<h3>You have 6 new notifications</h3>-->
                            <#--<a href="#" class="item">-->
                                <#--<i class="icon-signin"></i> New user registration-->
                                <#--<span class="time"><i class="icon-time"></i> 13 min.</span>-->
                            <#--</a>-->
                            <#--<a href="#" class="item">-->
                                <#--<i class="icon-signin"></i> New user registration-->
                                <#--<span class="time"><i class="icon-time"></i> 18 min.</span>-->
                            <#--</a>-->
                            <#--<a href="#" class="item">-->
                                <#--<i class="icon-envelope-alt"></i> New message from Alejandra-->
                                <#--<span class="time"><i class="icon-time"></i> 28 min.</span>-->
                            <#--</a>-->
                            <#--<a href="#" class="item">-->
                                <#--<i class="icon-signin"></i> New user registration-->
                                <#--<span class="time"><i class="icon-time"></i> 49 min.</span>-->
                            <#--</a>-->
                            <#--<a href="#" class="item">-->
                                <#--<i class="icon-download-alt"></i> New order placed-->
                                <#--<span class="time"><i class="icon-time"></i> 1 day.</span>-->
                            <#--</a>-->
                            <#--<div class="footer">-->
                                <#--<a href="#" class="logout">View all notifications</a>-->
                            <#--</div>-->
                        <#--</div>-->
                    <#--</div>-->
                <#--</div>-->
            <#--</li>-->

            <#--<li class="notification-dropdown hidden-phone">-->
                <#--<a href="#" class="trigger">-->
                    <#--<i class="icon-envelope-alt"></i>-->
                <#--</a>-->
                <#--<div class="pop-dialog">-->
                    <#--<div class="pointer right">-->
                        <#--<div class="arrow"></div>-->
                        <#--<div class="arrow_border"></div>-->
                    <#--</div>-->
                    <#--<div class="body">-->
                        <#--<a href="#" class="close-icon"><i class="icon-remove-sign"></i></a>-->
                        <#--<div class="messages">-->
                            <#--<a href="#" class="item">-->
                                <#--<img src="img/contact-img.png" class="display" />-->
                                <#--<div class="name">Alejandra Galván</div>-->
                                <#--<div class="msg">-->
                                    <#--There are many variations of available, but the majority have suffered alterations.-->
                                <#--</div>-->
                                <#--<span class="time"><i class="icon-time"></i> 13 min.</span>-->
                            <#--</a>-->
                            <#--<a href="#" class="item">-->
                                <#--<img src="img/contact-img2.png" class="display" />-->
                                <#--<div class="name">Alejandra Galván</div>-->
                                <#--<div class="msg">-->
                                    <#--There are many variations of available, have suffered alterations.-->
                                <#--</div>-->
                                <#--<span class="time"><i class="icon-time"></i> 26 min.</span>-->
                            <#--</a>-->
                            <#--<a href="#" class="item last">-->
                                <#--<img src="img/contact-img.png" class="display" />-->
                                <#--<div class="name">Alejandra Galván</div>-->
                                <#--<div class="msg">-->
                                    <#--There are many variations of available, but the majority have suffered alterations.-->
                                <#--</div>-->
                                <#--<span class="time"><i class="icon-time"></i> 48 min.</span>-->
                            <#--</a>-->
                            <#--<div class="footer">-->
                                <#--<a href="#" class="logout">View all messages</a>-->
                            <#--</div>-->
                        <#--</div>-->
                    <#--</div>-->
                <#--</div>-->
            <#--</li>-->
            <#--<li class="dropdown">-->
                <#--<a href="#" class="dropdown-toggle hidden-phone" data-toggle="dropdown">-->
                    <#--Your account-->
                    <#--<b class="caret"></b>-->
                <#--</a>-->
                <#--<ul class="dropdown-menu">-->
                    <#--<li><a href="personal-info.html">Personal info</a></li>-->
                    <#--<li><a href="#">Account settings</a></li>-->
                    <#--<li><a href="#">Billing</a></li>-->
                    <#--<li><a href="#">Export your data</a></li>-->
                    <#--<li><a href="#">Send feedback</a></li>-->
                <#--</ul>-->
            <#--</li>-->
            <#--<li class="settings hidden-phone">-->
                <#--<a href="personal-info.html" role="button">-->
                    <#--<i class="icon-cog"></i>-->
                <#--</a>-->
            <#--</li>-->
            <#--<li class="settings hidden-phone">-->
                <#--<a href="signin.html" role="button">-->
                    <#--<i class="icon-share-alt"></i>-->
                <#--</a>-->
            <#--</li>-->
        <#--</ul>-->
    <#--</div>-->
<#--</div>-->
<!-- end navbar -->

<nav class="fh5co-nav" role="navigation">
    <div class="top-menu" style="margin-top: -2px;">
        <div class="container_1">
            <div class="row">
                <div class="col-xs-2">
                    <div id="fh5co-logo">
                        <a href="${base}/front/index">
                            <img width="40px" height="40px" src="${base}/front/images/LOGOICON.png">
                            <img width="80px" height="45px" style="margin-bottom:-11px;margin-top: -8px;" src="${base}/front/images/LOGO2.png">
                        </a>
                    </div>
                </div>
            <#--发现的搜索框-->
                <div class="col-xs-3">
                    <form class="search_pos" name="sousuo" action="${base}/search/course">
                        <div id="search">
                            <input type="text" name="words">
                            <input type="image" class="search_icon" src="${base}/front/images/search.png">
                        </div>
                    </form>
                </div>

                <div class="col-xs-10 text-right menu-1">

                    <ul>
                        <li id="active1"><a href="${base}/front/index">首页</a></li>
                        <li id="active2"><a href="${base}/course/listCourse">课程</a></li>
                        <li id="active3"><a href="${base}/user/frontLecture">讲师</a></li>
                        <li id="active4"><a href="${base}/qa/frontQa">问答</a></li>
                        <#--<li id="active5"><a href="pricing.html">发现</a></li>-->
                    </ul>
                </div>
                <div class="col-xs-9">

                <#if "${(userFront.username)!}"=="">
                    <ul style="padding-bottom: 15px;padding-top: 5px">
                        <li class="btn-cta" style="padding-bottom: 12px"><a href="${base}/user/frontLogin"><span>登录</span></a></li>
                        <li class="btn-cta" style="padding-bottom: 12px"><a href="${base}/user/frontRegister"><span>注册</span></a></li>
                    </ul>
                <#else>
                    <ul>

                        <img width="25px" height="25px" style="border-radius: 50%;margin-top: -30px" src="${base}/front/images/bell.png">
                        <li class="test_hahaha">
                            <a id="dropdown-toggle_modify1" href="#">
                            <#--<img width="45px" height="45px" style="border-radius: 50%" src="${base}/admin/upload/${(userFront.headimg)!}">-->
                                <div class="personal_info_img1" style="background-image: url(${base}/upload/${(userFront.headimg)!})">

                                <img  class="headimgframe" width="60px" height="60px" src="${base}/uploadHead/${(userHeadFrame.headFrame.filePath)!}">
                                </div>
                            <#--<span class="caret"></span>-->
                                <div class="arrow1"></div>
                            </a>
                            <ul class="dropdown-menu personimg">
                                <div class="person_expand pe1">
                                    <a href="${base}/mycenter/myprofile">
                                        <div class="personal_info_img2" style="background-image: url(${base}/upload/${(userFront.headimg)!});">
                                        <img  class="headimgframe1" width="74px" height="74px" src="${base}/uploadHead/${(userHeadFrame.headFrame.filePath)!}">
                                        </div>
                                    </a>
                                </div>
                                <div class="person_expand pe2"><a id="peid2" href="#">${(userFront.username)!}</a></div>
                                <div class="person_expand pe3"><#if "${(userFront.introduction)!}"!="">
                                    <a href="${base}/mycenter/modify" id="peid3"><span><i class="icon-pen2"></i>${(userFront.introduction)!}</span></a>
                                <#else>
                                    <a href="${base}/mycenter/modify"  id="peid3"><span><i class="icon-pen2"></i>点击编辑个性签名</span></a>
                                </#if></div>
                                <div class="big">
                                    <div class="pe4"><a href="${base}/headFrame/mall"  id="peid4"><span>积分<img  style="margin-bottom: 4px" src="${base}/front/images/coin_gold.png">${(credits.credit)!}</span></a></div>
                                    <div class="pe5"><a href="${base}/mycenter/headframe"  id="peid5"><span>更改头像框</span></a></div>
                                </div>
                                <div class="person_expand">
                                    <div class="table">
                                        <div class="tr">
                                            <div class="td pe8">
                                                <div id="peid8">
                                                    <a href="${base}/mycenter/myprofile" id="peid6"><span class="user-center-icon icon-user2"> 用户中心</span></a>
                                                </div>
                                            </div>
                                            <div class="td pe9">
                                                <div id="peid9">
                                                    <a href="${base}/mycenter/favorite?userId=${(userFront.id)!}"  id="peid6"><span class=" user-center-icon icon-book2"> 我的课程</span></a>
                                                </div>
                                            </div>
                                        </div >
                                        <div class="tr">
                                            <div class="td pe10">
                                                <div id="peid10">
                                                    <a href="${base}/mycenter/myquestion"   id="peid6"><span class="icon-bubble3"> 我的问答</span></a>
                                                </div>
                                            </div>
                                            <div class="td pe11">
                                                <div id="peid11">
                                                    <a href="${base}/mycenter/score_list"  id="peid6""><span class="icon-paper"> 我的考试</span></a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="person_expand pe7"><a href="${base}/user/frontLogout"  id="peid7"><span class="icon-paperplane"> 注销</span></a></div>
                            </ul>
                        </li>
                    </ul>
                </#if>

                </div>
            </div>

        </div>
    </div>
</nav>


<!-- sidebar -->
<div id="sidebar-nav">
    <ul id="dashboard-menu">
        <li>
            <div id="p_active1" >
                <div class="pointer">
                    <div class="arrow"></div>
                    <div class="arrow_border"></div>
                </div>
            </div>
            <a href="${base}/mycenter/myprofile">
                <div id="active1">
                <i class="icon1-home"></i>
                <span>资料</span>
                </div>
            </a>
        </li>
        <li>
            <div id="p_active2"  >
            <div class="pointer">
                <div class="arrow"></div>
                <div class="arrow_border"></div>
            </div>
        </div>
            <a href="${base}/mycenter/favorite?userId=${(userFront.id)!}">
                <div id="active2">
                <i class="icon1-signal"></i>
                <span>课程</span>
                </div>
            </a>
        </li>
        <li>
            <div id="p_active3">
                <div class="pointer">
                    <div class="arrow"></div>
                    <div class="arrow_border"></div>
                </div>
            </div>
            <a class="dropdown-toggle" href="#">
                <div id="active3">
                <i class="icon1-group"></i>
                <span>问答</span>
                <i class="icon1-chevron-down"></i>
                </div>
            </a>
            <ul class="submenu">
                <li><a href="${base}/mycenter/myquestion"><span class="drop-item">我的提问</span></a></li>
                <li><a href="${base}/mycenter/myanswer"><span class="drop-item">我的回答</span></a></li>
            </ul>
        </li>
        <li>
            <div id="p_active4">
                <div class="pointer">
                    <div class="arrow"></div>
                    <div class="arrow_border"></div>
                </div>
            </div>
            <a href="${base}/mycenter/score_list"id="active4">
                <div id="active4">
                <i class="icon1-edit"></i>
                <span>成绩</span>
                </div>
            </a>
        </li>
        <li>
            <div id="p_active5">
                <div class="pointer">
                    <div class="arrow"></div>
                    <div class="arrow_border"></div>
                </div>
            </div>
            <a href="${base}/mycenter/schedule" id="active5">
                <div id="active5">
                <i class="icon1-calendar-empty"></i>
                <span>计划</span>
                </div>
            </a>
        </li>
        <#--<li>-->
            <#--<div id="p_active6">-->
                <#--<div class="pointer">-->
                    <#--<div class="arrow"></div>-->
                    <#--<div class="arrow_border"></div>-->
                <#--</div>-->
            <#--</div>-->
            <#--<a href="${base}/mycenter/community" id="active6">-->
                <#--<div id="active6">-->
                <#--<i class="icon1-th-large"></i>-->
                <#--<span>社区</span>-->
                <#--</div>-->
            <#--</a>-->
        <#--</li>-->
        <#--<li>-->
            <#--<div id="p_active7">-->
                <#--<div class="pointer">-->
                    <#--<div class="arrow"></div>-->
                    <#--<div class="arrow_border"></div>-->
                <#--</div>-->
            <#--</div>-->
            <#--<a href="${base}/mycenter/setting" id="active7">-->
                <#--<div id="active7">-->
                <#--<i class="icon1-cog"></i>-->
                <#--<span>设置</span>-->
                <#--</div>-->
            <#--</a>-->
        <#--</li>-->
        <li>
            <a href="${base}/front/index">
                <i class="icon1-share-alt"></i>
                <span>退出</span>
            </a>
        </li>
    </ul>
</div>
<!-- end sidebar -->