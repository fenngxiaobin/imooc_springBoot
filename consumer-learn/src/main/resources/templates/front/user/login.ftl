<#include "../base/header.ftl">
<link rel="stylesheet" href="${base}/front/css/yzm.css">
<script type="text/javascript" src="${base}/front/js/yzm.js"></script>
<!-- Main Container  -->
<div class="main-container container" style="padding-bottom: 50px;">
    <ul class="breadcrumb">
        <li><a href="#"><i class="fa fa-home"></i></a></li>
        <li><a href="#">账户</a></li>
        <li><a href="#">登录</a></li>
    </ul>

    <div class="row">
        <div id="content" class="col-sm-12">
            <div class="page-login">
                <div class="account-border">
                    <div class="row">
                        <div class="col-sm-6 new-customer">
                            <div class="well">
                                <h2>
                                    <i class="fa fa-file-o" aria-hidden="true"></i> 新的用户
                                </h2>
                                <p>通过创建一个帐户，您将能够更全面获得赛事服务，最新的赛事资讯，并跟踪您以前的投票、关注、参与状态。</p>
                            </div>
                            <div class="bottom-form">
                                <a href="${base}/user/frontRegister" class="btn btn-default pull-right">注册</a>
                            </div>
                        </div>

                        <form id="loginWindowForm" method="post"
                              enctype="multipart/form-data">
                            <div class="col-sm-6 customer-login">
                                <div class="well">
                                    <h2>
                                        <i class="fa fa-file-text-o" aria-hidden="true"></i> 服务登录
                                    </h2>
                                    <p>
                                        <strong style="color: grey;font-size: 12px;">普通用户  /  管理员</strong>
                                    </p>
                                    <div class="form-group">
                                        <i class="fa fa-search"></i>
                                        <label class="control-label " for="input-username">用户名</label>
                                        <input type="text" id="loginWindowMemberUsername"
                                               name="username" class="form-control" />
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label " for="input-password">密码</label>
                                        <input type="password" id="loginWindowMemberPassword"
                                               name="password" class="form-control" />
                                    </div>
                                    <div class="form-group">
                                        <input type="hidden" id="yzm" value="0" />
                                        <div id="slideBar"></div>
                                        <script type="text/javascript">
                                            var dataList = ["0","1"];
                                            var options = {
                                                dataList: dataList,
                                                success:function(){
                                                    console.log("show");
                                                    document.getElementById("yzm").value=1;
                                                },
                                                fail: function(){
                                                    console.log("fail");
                                                    document.getElementById("yzm").value=0;
                                                }
                                            };
                                            SliderBar("slideBar", options);
                                        </script>
                                    </div>
                                </div>
                                <div class="bottom-form">
                                    <a href="/backPassword" class="forgot">忘记密码</a>&nbsp;&nbsp;&nbsp;&nbsp;
                                    <a href="/user/frontRegister">注册一个账号</a>
                                    <input type="button" value="登录" onclick="memberLogin();" class="btn btn-default pull-right" />
                                </div>

                            </div>
                        </form>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
<!-- //Main Container -->

<#include "../base/footer.ftl">