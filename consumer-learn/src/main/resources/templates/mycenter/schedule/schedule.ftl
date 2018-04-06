    <style type="text/css">
        #active5{
            color:black;
            font-weight: bold;
        }
        .jalendar-wood{
            box-sizing: content-box;
        }
        .option{
            left: 0px !important;
            top: 0px !important;
            margin-top: 0px !important;
            margin-bottom: 0px !important;
        }
    </style>
    <style>
        #p_active1{  display: none;  }
        #p_active2{  display: none;  }
        #p_active3{  display: none;  }
        #p_active4{  display: none;  }
        #p_active6{  display: none;  }
        #p_active7{  display: none;  }
    </style>
    <link rel="stylesheet" href="${base}/mycenter/css/documentation.css" type="text/css" />
    <link rel="stylesheet" href="${base}/mycenter/css/jalendar.css" type="text/css" />

<#include  "../base/header.ftl" >

<div class="content">
    <article style="margin-left: -400px">

        <!-- <div id="myId" class="jalendar">
            <div class="added-event" data-date="14/12/2017" data-time="Tüm Gün" data-title="WWDC 13 on San Francisco, LA"></div>
            <div class="added-event" data-date="16/12/2017" data-time="20:45" data-title="Tarkan İstanbul Concert on Harbiye Açık Hava Tiyatrosu"></div>
            <div class="added-event" data-date="17/12/2017" data-time="21:00" data-title="CodeCanyon İstanbul Meeting on Starbucks, Kadıköy"></div>
            <div class="added-event" data-date="17/12/2017" data-time="22:00" data-title="Front-End Design and Javascript Conferance on Haliç Kongre Merkezi"></div>
            <div class="added-event" data-date="17/12/2017" data-time="22:00" data-title="Lorem ipsum dolor sit amet"></div>
        </div>

    <div id="myId2" class="jalendar"></div> -->

        <div id="myId3" class="jalendar mid">
            <#list scheduleLists as sl>
                <div class="added-event" data-date="${(sl.day)!}" data-time="${(sl.time)!}" data-title="${(sl.title)!}" data-del="${(sl.id)!}"></div>
            </#list>
        </div>
    </article>
</div>



<script type="text/javascript" src="${base}/mycenter/js/jquery-1.10.2.min.js"></script><!--jQuery-->
<script type="text/javascript" src="${base}/mycenter/js/jalendar.js"></script>
<script type="text/javascript">
    $(function () {
        $('#myId').jalendar({
            customDay: '2017/12/01',  // Format: Year/Month/Day
            color: '#ed145a', // Unlimited Colors
            lang: 'EN' // Format: English — 'EN', Türkçe — 'TR'
        });
        $('#myId2').jalendar({
            customDay: '2016/02/29',
            color: '#023447',
            lang: 'ES'
        });
        $('#myId3').jalendar();
    });
</script>

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