<footer id="fh5co-footer" role="contentinfo" style="background-image: url(images/img_bg_4.jpg); width: 100%;">
    <div class="overlay"></div>
    <div class="container">
        <#--<div class="row row-pb-md">-->

        <#--</div>-->

        <div class="row copyright" style="margin-top: 30px;">
            <div class="col-md-12 text-center">
                <p>
                    <small style="font-size: 14px;">
                        <a style="color: white;" href="${base}/front/aboutUs">关于我们</a>&nbsp;&nbsp;&nbsp;&nbsp;
                        <a style="color: white;" href="${base}/front/teamInfo">团队介绍</a>&nbsp;&nbsp;&nbsp;&nbsp;
                        <a style="color: white;" href="${base}/front/lectureEnroll">讲师招募</a>&nbsp;&nbsp;&nbsp;&nbsp;
                        <a style="color: white;" href="${base}/front/contactUs">联系我们</a>&nbsp;&nbsp;&nbsp;&nbsp;
                        <a style="color: white;" href="${base}/front/friendLink">友情链接</a>&nbsp;&nbsp;&nbsp;&nbsp;
                        <a style="color: white;" href="${base}/front/creditsRule">积分规则</a>&nbsp;&nbsp;&nbsp;&nbsp;
                        <#if "${(userFront.id)!}" == "">
                        <a style="color: white;" href="${base}/front/jdApply">申请解冻</a>
                        <#else>
                            <a style="color: white;" href="" onclick="alert('该功能为用户解冻使用，您当前已经登录了，不可解冻')">申请解冻</a>
                        </#if>
                    </small>
                    <br/>
                    <small class="block">&copy; 2018 &nbsp;sixteen-group&nbsp;智能学习平台
                        <a href="http://www.miit.gov.cn/" target="_blank">
                            苏ICP备16019685号
                        </a>
                        <#--<script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_1273174676'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s22.cnzz.com/z_stat.php%3Fid%3D1273174676%26show%3Dpic' type='text/javascript'%3E%3C/script%3E"));</script>-->

                    </small>
                    <#--<script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_1273174676'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s22.cnzz.com/z_stat.php%3Fid%3D1273174676%26online%3D1%26show%3Dline' type='text/javascript'%3E%3C/script%3E"));</script>-->

                </p>
            </div>
        </div>

    </div>
</footer>
</div>

<div class="gototop js-top">
    <a href="#" class="js-gotop"><i class="icon-arrow-up"></i></a>
</div>


<!-- jQuery -->
<script src="${base}/front/js/jquery.min.js"></script>
<!-- jQuery Easing -->
<script src="${base}/front/js/jquery.easing.1.3.js"></script>
<!-- Bootstrap -->
<script src="${base}/front/js/bootstrap.min.js"></script>
<!-- Waypoints -->
<script src="${base}/front/js/jquery.waypoints.min.js"></script>
<!-- Stellar Parallax -->
<script src="${base}/front/js/jquery.stellar.min.js"></script>
<!-- Carousel -->
<script src="${base}/front/js/owl.carousel.min.js"></script>
<!-- Flexslider -->
<script src="${base}/front/js/jquery.flexslider-min.js"></script>
<!-- countTo -->
<script src="${base}/front/js/jquery.countTo.js"></script>
<!-- Magnific Popup -->
<script src="${base}/front/js/jquery.magnific-popup.min.js"></script>
<script src="${base}/front/js/magnific-popup-options.js"></script>
<!-- Count Down -->
<script src="${base}/front/js/simplyCountdown.js"></script>
<!-- Main -->
<script src="${base}/front/js/main.js"></script>
<script src="${base}/front/js/login.js"></script>
<script>
    var d = new Date(new Date().getTime() + 1000 * 120 * 120 * 2000);

    // default example
    simplyCountdown('.simply-countdown-one', {
        year: d.getFullYear(),
        month: d.getMonth() + 1,
        day: d.getDate()
    });

    //jQuery example
    $('#simply-countdown-losange').simplyCountdown({
        year: d.getFullYear(),
        month: d.getMonth() + 1,
        day: d.getDate(),
        enableUtc: false
    });
</script>
</body>
</html>

