<style type="text/css">
    #active3{
        color:black;
        font-weight: bold;
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
</style>
<style>
    #p_active1{  display: none;  }
    #p_active2{  display: none;  }
    #p_active4{  display: none;  }
    #p_active5{  display: none;  }
    #p_active6{  display: none;  }
    #p_active7{  display: none;  }
</style>
<#include  "../base/header.ftl" >


<div class="content">
    <div class="bg-other user-head-info">
        <div class="user-info clearfix">
            <div class="user-pic" data-is-fans="" data-is-follows="">

            </div>



        </div><!-- .user-info end -->
    </div><!-- .big-pic end -->
    <div class="wrap">
        <div class="u-container">
            <div class="c-tab clearfix">
                <div class="tool-left l">
                    <a href="${base}/mycenter/myquestion" class="sort-item">我的提问</a>
                    <a href="${base}/mycenter/myanswer"  class="sort-item active">我的回答</a>
                </div>
                <div class="tool-right r">
                    <div class="tool-all">
                    </div>
                </div>
            </div>

            <div class="js-course-list my-space-course study-tl">
            <#if qaReplyLists?size==0><div class="else_span">对不起，您没有任何回复</div></#if>
            <#list qaReplyLists as ql>
                <div class="clearfix tl-item  tl-item-first">
			            <span class="time">
                <#--<b>2018</b>-->
                <#--<em>02月25日</em>-->
                    <b>${ql.createDate?string("yyyy-MM-dd HH:mm:ss")?substring(0,4)}年</b>
                    <em>${ql.createDate?string("yyyy-MM-dd HH:mm:ss")?substring(5,7)}月${ql.createDate?string("yyyy-MM-dd HH:mm:ss")?substring(8,10)}日</em>
            </span>
                    <div class="course-list course-list-m">
                        <ul class="clearfix">
                            <li class="course-one" data-courseid="725" data-uid="6362103" style="padding: 10px 0px 70px 0px;">
                                <div class="course-list-img l">
                                <#--<a href="${base}/chapter/listChapter?id=${showUserCourseList[ql_index].id}" target="_blank">-->
                                        <#--<img width="200" height="113" alt="" src="${base}/admin/upload/${showUserCourseList[ql_index].filePath}">-->
                                    <#--</a>-->
                                </div>
                                <div class="course-list-cont" style="padding-left: 0px">
                                    <h3 class="study-hd">
                                        你回复<br>
                                        “<span style="font-size: 80%;font-weight: 600;color: #4d4d4d">${(ql.content)!}</span>”
                                        <div class="common_source_top"></div>
                                        <div class="common_source_main" >
                                            <a href="${base}/qa/qaView?id=${(qaLists[ql_index].id)!}" style="font-size: 75%;font-weight: 400;color: #2D6CDF">
                                            ${(qaLists[ql_index].title)!}
                                            </a>
                                            <span style="font-size: 70% ;color:#63676a">回答(${(qaLists[ql_index].answers)!})-</span>
                                            <span style="font-size: 75%">来自</span>
                                            <a href="${base}/chapter/listChapter?id=${(courseLists[ql_index].id)!}" style="font-size: 75%;font-weight: 400;color: #2D6CDF">
                                            ${(courseLists[ql_index].courseName)!}
                                            </a>
                                        </div>
                                        <div class="common_source_bottom"></div>


                                    <#--<span class="i-new">更新至${showUserCourseList[ql_index].createDate?date}</span>-->
                                        <!-- 收藏和删除 -->
                                        <div class="share-box clearfix">
                                            <div class="show-btn"><i class="icon-down2"></i></div>
                                            <div class="share-box-con courses-r">
                                                <a href="javascript:;" title="收藏" class="follow custom_f"><i class="icon icon-star_outline"></i></a>
                                                <a href="javascript:;" title="删除" class="del"><i class="icon icon-notdisplay"></i></a>

                                            </div>
                                        </div>
                                    </h3>
                                    <div class="study-points">
                                        <#--<span class="i-left span-common">回答：${(ql.answers)!}个</span>-->
                                    </div>
                                    <div class="catog-points">
                                        <span class="i-right span-common"><a href="#"><i></i></a></span>

                                        <a href="${base}/qa/qaView?id=${(qaLists[ql_index].id)!}" target="_blank" class="btn-red continute-btn">点击查看</a>

                                    </div>
                                </div>


                            </li>
                        </ul>
                    </div>
                </div>
            </#list>

            </div>
            <!-- 分页 -->
            <div class="qa-comment-page">
            </div>


        </div><!-- .container end -->
    </div><!-- .wrap end-->

</div>

<!-- scripts -->
<script src="js/jquery-latest.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery-ui-1.10.2.custom.min.js"></script>
<!-- knob -->
<script src="js/jquery.knob.js"></script>
<!-- flot charts -->
<script src="js/jquery.flot.js"></script>
<script src="js/jquery.flot.stack.js"></script>
<script src="js/jquery.flot.resize.js"></script>
<script src="js/theme.js"></script>

<script type="text/javascript">
    $(function () {

        // jQuery Knobs
        $(".knob").knob();



        // jQuery UI Sliders
        $(".slider-sample1").slider({
            value: 100,
            min: 1,
            max: 500
        });
        $(".slider-sample2").slider({
            range: "min",
            value: 130,
            min: 1,
            max: 500
        });
        $(".slider-sample3").slider({
            range: true,
            min: 0,
            max: 500,
            values: [ 40, 170 ],
        });



        // jQuery Flot Chart
        var visits = [[1, 50], [2, 40], [3, 45], [4, 23],[5, 55],[6, 65],[7, 61],[8, 70],[9, 65],[10, 75],[11, 57],[12, 59]];
        var visitors = [[1, 25], [2, 50], [3, 23], [4, 48],[5, 38],[6, 40],[7, 47],[8, 55],[9, 43],[10,50],[11,47],[12, 39]];

        var plot = $.plot($("#statsChart"),
                [ { data: visits, label: "Signups"},
                    { data: visitors, label: "Visits" }], {
                    series: {
                        lines: { show: true,
                            lineWidth: 1,
                            fill: true,
                            fillColor: { colors: [ { opacity: 0.1 }, { opacity: 0.13 } ] }
                        },
                        points: { show: true,
                            lineWidth: 2,
                            radius: 3
                        },
                        shadowSize: 0,
                        stack: true
                    },
                    grid: { hoverable: true,
                        clickable: true,
                        tickColor: "#f9f9f9",
                        borderWidth: 0
                    },
                    legend: {
                        // show: false
                        labelBoxBorderColor: "#fff"
                    },
                    colors: ["#a7b5c5", "#30a0eb"],
                    xaxis: {
                        ticks: [[1, "JAN"], [2, "FEB"], [3, "MAR"], [4,"APR"], [5,"MAY"], [6,"JUN"],
                            [7,"JUL"], [8,"AUG"], [9,"SEP"], [10,"OCT"], [11,"NOV"], [12,"DEC"]],
                        font: {
                            size: 12,
                            family: "Open Sans, Arial",
                            variant: "small-caps",
                            color: "#697695"
                        }
                    },
                    yaxis: {
                        ticks:3,
                        tickDecimals: 0,
                        font: {size:12, color: "#9da3a9"}
                    }
                });

        function showTooltip(x, y, contents) {
            $('<div id="tooltip">' + contents + '</div>').css( {
                position: 'absolute',
                display: 'none',
                top: y - 30,
                left: x - 50,
                color: "#fff",
                padding: '2px 5px',
                'border-radius': '6px',
                'background-color': '#000',
                opacity: 0.80
            }).appendTo("body").fadeIn(200);
        }

        var previousPoint = null;
        $("#statsChart").bind("plothover", function (event, pos, item) {
            if (item) {
                if (previousPoint != item.dataIndex) {
                    previousPoint = item.dataIndex;

                    $("#tooltip").remove();
                    var x = item.datapoint[0].toFixed(0),
                            y = item.datapoint[1].toFixed(0);

                    var month = item.series.xaxis.ticks[item.dataIndex].label;

                    showTooltip(item.pageX, item.pageY,
                            item.series.label + " of " + month + ": " + y);
                }
            }
            else {
                $("#tooltip").remove();
                previousPoint = null;
            }
        });
    });
</script>

</body>
</html>