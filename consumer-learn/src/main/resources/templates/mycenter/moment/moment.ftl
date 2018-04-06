<style type="text/css">
    #active1{
        color:black;
        font-weight: bold;
    }
    input{
        line-height: normal !important;
    }
    .span5{
        width: 200px !important;
        display: inline-block !important;
    }
</style>
<style>
    #p_active2{  display: none;  }
    #p_active3{  display: none;  }
    #p_active4{  display: none;  }
    #p_active5{  display: none;  }
    #p_active6{  display: none;  }
    #p_active7{  display: none;  }
</style>
<link rel="stylesheet" type="text/css" href="${base}/mycenter/css/font-awesome.4.6.0.css">
<link rel="stylesheet" href="${base}/mycenter/css/amazeui.min.css">
<link rel="stylesheet" href="${base}/mycenter/css/amazeui.cropper.css">
<link rel="stylesheet" href="${base}/mycenter/css/custom_up_img.css">
<style type="text/css">
    .up-img-cover {width: 100px;height: 100px;}
    .up-img-cover img{width: 100%;}
</style>

<#include  "../base/header.ftl" >
<!-- main container -->
<div class="content">

    <!--add-->
    <center>
        <div class="up-img-cover"  id="up-img-touch" >
            <img class="am-circle" alt="点击图片上传" src="img/hu.jpg" data-am-popover="{content: '点击上传', trigger: 'hover focus'}" >
        </div>
    </center>
    <div><a style="text-align: center; display: block;"  id="pic"></a></div>

    <!--add-->
    <!--图片上传框-->
    <div class="am-modal am-modal-no-btn up-frame-bj " tabindex="-1" id="doc-modal-1">
        <div class="am-modal-dialog up-frame-parent up-frame-radius">
            <div class="am-modal-hd up-frame-header">
                <label>修改头像</label>
                <a href="javascript: void(0)" class="am-close am-close-spin" data-am-modal-close>&times;</a>
            </div>
            <div class="am-modal-bd  up-frame-body">
                <div class="am-g am-fl">
                    <div class="am-form-group am-form-file">
                        <div class="am-fl">
                            <button type="button" class="am-btn am-btn-default am-btn-sm">
                                <i class="am-icon-cloud-upload"></i> 选择要上传的文件</button>
                        </div>
                        <input type="file" id="inputImage">
                    </div>
                </div>
                <div class="am-g am-fl" >
                    <div class="up-pre-before up-frame-radius">
                        <img alt="" src="" id="image" >
                    </div>
                    <div class="up-pre-after up-frame-radius">
                    </div>
                </div>
                <div class="am-g am-fl">
                    <div class="up-control-btns">
                        <span class="am-icon-rotate-left"  onclick="rotateimgleft()"></span>
                        <span class="am-icon-rotate-right" onclick="rotateimgright()"></span>
                        <span class="am-icon-check" id="up-btn-ok" url="admin/user/upload.action"></span>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <!--加载框-->
    <div class="am-modal am-modal-loading am-modal-no-btn" tabindex="-1" id="my-modal-loading">
        <div class="am-modal-dialog">
            <div class="am-modal-hd">正在上传...</div>
            <div class="am-modal-bd">
                <span class="am-icon-spinner am-icon-spin"></span>
            </div>
        </div>
    </div>

    <!--警告框-->
    <div class="am-modal am-modal-alert" tabindex="-1" id="my-alert">
        <div class="am-modal-dialog">
            <div class="am-modal-hd">信息</div>
            <div class="am-modal-bd"  id="alert_content">
                成功了
            </div>
            <div class="am-modal-footer">
                <span class="am-modal-btn">确定</span>
            </div>
        </div>
    </div>


    <div class="bg-other user-head-info">
        <div class="user-info clearfix">
            <div class="user-pic" data-is-fans="" data-is-follows="">

            </div>



        </div><!-- .user-info end -->
    </div><!-- .big-pic end -->
    <div class="wrap">
        <div class="u-container">
            <div class="c-tab clearfix">
                <div class="mt_char">
                    修改资料
                </div>
                <div class="tool-right r">
                    <div class="tool-all">
                    </div>
                </div>
            </div>
            <form action="/user/updateFrontUser" method="post" enctype="multipart/form-data">
                <div class="field-box">
                    <label class="m_char">头像:</label><div class="personal_info_img3" style="background-image: url(${base}/upload/${(userFront.headimg)!});"></div>
                    <input type="hidden" name="id" value="${(userFront.id)!}" style="display: inline-block">
                    <input class="span5 inline-input" type="file" name="headimg" value="修改" style="display: inline-block" onChange="fileUpload_CheckType(this.files);"/>
                    <p id="check_remind"></p>
                    <ul id="show_pic"></ul>
                </div>
                <div class="field-box">
                    <label class="m_char">用户名:</label>
                    <input class="span5 inline-input" name="username" type="text" value="${(userFront.username)!}" />
                </div>
                <div class="field-box">
                    <label class="m_char">邮箱:</label>
                    <input class="span5 inline-input" type="text" name="email" value="${(userFront.email)!}" />
                </div>
                <div class="field-box">
                    <label class="m_char">城市:</label>
                    <div class="ui-select">
                        <div class="zcityGroup" city-range="{'level_start':1,'level_end':2}" city-ini="${(userFront.city)!}">
                        </div>
                    </div>
                </div>
                <div class="field-box">
                    <label class="m_char">职位:</label>
                    <input class="span5 inline-input" type="text" name="position" value="${(userFront.position)!}" />
                </div>
                <div class="field-box">
                    <label class="m_char">签名:</label>
                    <input class="span5 inline-input" name="introduction" type="text" value="${(userFront.introduction)!}" />
                </div>
                <div class="span6 field-box actions">
                    <input type="submit" class="btn-glow primary" value="保存" />
                    <span></span>
                    <input type="reset" value="重置" class="reset" />
                </div>
            </form>
        </div>
    </div>




</div>
    <script src="js/jquery-1.8.3.min.js"></script>
    <script src="js/amazeui.min.js" charset="utf-8"></script>
    <script src="js/cropper.min.js" charset="utf-8"></script>
    <script src="js/custom_up_img.js" charset="utf-8"></script>

