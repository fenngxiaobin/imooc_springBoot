<#--<style type="text/css">-->
    <#--#active1{-->
        <#--color:black;-->
        <#--font-weight: bold;-->
    <#--}-->
<#--</style>-->
<style xmlns="http://www.w3.org/1999/html">
    #p_active1{  display: none;  }
    #p_active2{  display: none;  }
    #p_active3{  display: none;  }
    #p_active4{  display: none;  }
    #p_active5{  display: none;  }
    #p_active6{  display: none;  }
    #p_active7{  display: none;  }
</style>

<#include  "../base/header.ftl" >

<!-- main container -->
<div class="content">
    <form method="post" action="${base}/mycenter/chooseheadframe">
        <div class="headframemain">
            <div class="headframesub1" style="margin: 40px 450px;" ><input type="submit" value="确认选择" class="headframesub" style=""></div>
        <#list userHeadFramesList as uh>
            <#if uh.choice==1>
            <div class="headframepos">
                <input type="radio" name="uhchoice" value="${uh.id}" id="${uh.id}" onfocus="myFunction1(this)" onblur="myFunction2(this)" style="opacity: 0">
                <label for="${uh.id}" style="opacity:1.0;margin-bottom: 0px;cursor:pointer" ><img width="120px" height="120px" src="${base}/uploadHead/${uh.headFrame.filePath}"></label>
            </div>
            <#else>
            <div class="headframepos">
                <input type="radio" name="uhchoice" value="${uh.id}" id="${uh.id}" onfocus="myFunction1(this)" onblur="myFunction2(this)"  style="opacity: 0">
                <label for="${uh.id}" style="opacity:0.4;margin-bottom: 0px;cursor:pointer" ><img width="120px" height="120px" src="${base}/uploadHead/${uh.headFrame.filePath}"></label>
            </div>
            </#if>
        </#list>
            <#list headFramesLeft as ul>
            <div class="headframepos">
                <input type="radio" name="uhchoice"  style="opacity: 0;cursor:default" disabled>
                <img width="120px" height="120px" style="opacity:0.4; " src="${base}/uploadHead/${ul.filePath}"><img width="40px" height="40px" style="position: absolute;right: 72px;top: 35px;" src="${base}/mycenter/img/lock.png">
            </div>
            </#list>
        </div>
    </form>
        <script>
//            function controller() {
//                document.getElementsByTagName()
//            }
            function myFunction1(x){
                var la =document.getElementsByTagName('label');
                for(var i=0;i<document.getElementsByTagName('label').length;i++){
                    la[i].style.opacity=0.4;
                }
                document.querySelector('label[for="'+x.value+'"]').style.opacity=1.0;
            }
            function myFunction2(y) {
                document.querySelector('label[for="'+y.value+'"]').style.opacity=0.4;
            }
        </script>

</div>

    <#--<script>-->
        <#--function myFunction(x){-->
            <#--x.style.backgroundColor="yellow";-->
        <#--}-->
    <#--</script>-->
