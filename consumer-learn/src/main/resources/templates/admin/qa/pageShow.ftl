
<#-- 分页控件-->
<#-- <author= quzishen date=2010-08-03> -->
<#macro pageShow _totalPageNum _currentPageNo _pageName _pageSize=15 _maxShowNums=10 _defaultPageParameter="p" _styleClassName="digg">
<#-- 本段默认起始页 -->
    <#local _pageStartNo = 1/>
<#-- 本段默认结束页 -->
    <#local _pageEndNo = _maxShowNums/>
<#-- 分页的第一页 -->
    <#local _firstPageNo = 1 />
<#-- 分页的最后一页 -->
    <#local _lastPageNo = _totalPageNum>
<#-- 前一页号码 -->
    <#local _prePageNo = _currentPageNo - 1 />
<#-- 后一页号码 -->
    <#local _nextPageNo = _currentPageNo + 1 />
<#-- 首页判断 -->
    <#if _currentPageNo == _pageStartNo>
        <#local _prePageNo = _pageStartNo />
    </#if>
<#-- 尾页判断 -->
    <#if _currentPageNo == _lastPageNo>
        <#local _nextPageNo = _lastPageNo />
    </#if>
<#-- 如果当前页数大于最大展示页数 -->
    <#if _currentPageNo gt _maxShowNums>
        <#local _thisPageSegment = (_currentPageNo / _maxShowNums)?int + 1/>
        <#assign _thisPageStartNo = _pageStartNo + (_thisPageSegment-1) * _maxShowNums/>
        <#assign _thisPageEndNo = _pageEndNo + (_thisPageSegment-1) * _maxShowNums/>
        <#if _thisPageEndNo gt _totalPageNum>
            <#assign _thisPageEndNo = _totalPageNum>
        </#if>
    <#else>
    <#-- 关键 -->
        <#assign _thisPageStartNo = _pageStartNo />
    <#-- 如果总的页数小于默认结束页 -->
        <#if _totalPageNum lt _pageEndNo>
            <#assign _thisPageEndNo=_totalPageNum/>
        <#else >
            <#assign _thisPageEndNo = _pageEndNo />
        </#if>

    </#if>

    <#local _pages=[] />
    <#if _totalPageNum != 0>
        <#list _thisPageStartNo .. _thisPageEndNo as _index>
            <#if _currentPageNo == _index >
                <#local _pages = _pages + [{"pageNum" : _index ,"url" : _pageName+"&"+_defaultPageParameter+"="+_index , "current" : true}] />
            <#else>
                <#local _pages = _pages + [{"pageNum" : _index ,"url" : _pageName+"&"+_defaultPageParameter+"="+_index , "current" : false}] />
            </#if>
        </#list>
    </#if>

    <#local _htmlNoLinkLine>
    <a href = "${base}/${_pageName}&${_defaultPageParameter}=${_firstPageNo}" target = "_self">首页</a>
        <#if _currentPageNo != _pageStartNo>
        <a href = "${base}/${_pageName}&${_defaultPageParameter}=${_prePageNo}" target = "_self">上一页</a>
        </#if>
        <#list _pages as page>
            <#if page.current?default(false)>
            <span class="current" >${page.pageNum}</span>
            <#else>
            <a href="${base}/${page.url}" mce_href="${base}/${page.url}" target="_self">${page.pageNum}</a>
            </#if>
        </#list>

    <a href = "${base}/${_pageName}&${_defaultPageParameter}=${_nextPageNo}" target = "_self">下一页</a>
    <a href = "${base}/${_pageName}&${_defaultPageParameter}=${_lastPageNo}" target = "_self">末页</a>
    <span>共${_totalPageNum?default(0)}页</span>
    </#local>

<div class="${_styleClassName}">
${_htmlNoLinkLine}
</div>

<mce:style type="text/css">
<#--/*CSS Digg style pagination*/-->

		<#--DIV.digg {-->
			<#--FONT-SIZE: 12px;FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif;-->
			<#--PADDING-RIGHT: 3px; PADDING-LEFT: 3px; PADDING-BOTTOM: 3px; MARGIN: 3px; PADDING-TOP: 3px; TEXT-ALIGN: center-->
		<#--}-->
		<#--DIV.digg A {-->
			<#--BORDER-RIGHT: #aaaadd 1px solid; PADDING-RIGHT: 5px; BORDER-TOP: #aaaadd 1px solid; PADDING-LEFT: 5px; PADDING-BOTTOM: 2px; MARGIN: 2px; BORDER-LEFT: #aaaadd 1px solid; COLOR: #000099; PADDING-TOP: 2px; BORDER-BOTTOM: #aaaadd 1px solid; TEXT-DECORATION: none-->
		<#--}-->
		<#--DIV.digg A:hover {-->
			<#--BORDER-RIGHT: #000099 1px solid; BORDER-TOP: #000099 1px solid; BORDER-LEFT: #000099 1px solid; COLOR: #000; BORDER-BOTTOM: #000099 1px solid-->
		<#--}-->
		<#--DIV.digg A:active {-->
			<#--BORDER-RIGHT: #000099 1px solid; BORDER-TOP: #000099 1px solid; BORDER-LEFT: #000099 1px solid; COLOR: #000; BORDER-BOTTOM: #000099 1px solid-->
		<#--}-->
		<#--DIV.digg SPAN.current {-->
			<#--BORDER-RIGHT: #000099 1px solid; PADDING-RIGHT: 5px; BORDER-TOP: #000099 1px solid; PADDING-LEFT: 5px; FONT-WEIGHT: bold; PADDING-BOTTOM: 2px; MARGIN: 2px; BORDER-LEFT: #000099 1px solid; COLOR: #fff; PADDING-TOP: 2px; BORDER-BOTTOM: #000099 1px solid; BACKGROUND-COLOR: #000099-->
		<#--}-->
		<#--DIV.digg SPAN.disabled {-->
			<#--BORDER-RIGHT: #eee 1px solid; PADDING-RIGHT: 5px; BORDER-TOP: #eee 1px solid; PADDING-LEFT: 5px; PADDING-BOTTOM: 2px; MARGIN: 2px; BORDER-LEFT: #eee 1px solid; COLOR: #ddd; PADDING-TOP: 2px; BORDER-BOTTOM: #eee 1px solid-->
		<#--}-->
</mce:style><style type="text/css" mce_bogus="1">		/*CSS Digg style pagination*/

DIV.digg {
    FONT-SIZE: 12px;FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif;
    PADDING-RIGHT: 3px; PADDING-LEFT: 3px; PADDING-BOTTOM: 3px; MARGIN: 3px; PADDING-TOP: 3px; TEXT-ALIGN: center
}
DIV.digg A {
    BORDER-RIGHT: #aaaadd 1px solid; PADDING-RIGHT: 5px; BORDER-TOP: #aaaadd 1px solid; PADDING-LEFT: 5px; PADDING-BOTTOM: 2px; MARGIN: 2px; BORDER-LEFT: #aaaadd 1px solid; COLOR: #000099; PADDING-TOP: 2px; BORDER-BOTTOM: #aaaadd 1px solid; TEXT-DECORATION: none
}
DIV.digg A:hover {
    BORDER-RIGHT: #000099 1px solid; BORDER-TOP: #000099 1px solid; BORDER-LEFT: #000099 1px solid; COLOR: #000; BORDER-BOTTOM: #000099 1px solid
}
DIV.digg A:active {
    BORDER-RIGHT: #000099 1px solid; BORDER-TOP: #000099 1px solid; BORDER-LEFT: #000099 1px solid; COLOR: #000; BORDER-BOTTOM: #000099 1px solid
}
DIV.digg SPAN.current {
    BORDER-RIGHT: #000099 1px solid; PADDING-RIGHT: 5px; BORDER-TOP: #000099 1px solid; PADDING-LEFT: 5px; FONT-WEIGHT: bold; PADDING-BOTTOM: 2px; MARGIN: 2px; BORDER-LEFT: #000099 1px solid; COLOR: #fff; PADDING-TOP: 2px; BORDER-BOTTOM: #000099 1px solid; BACKGROUND-COLOR: #000099
}
DIV.digg SPAN.disabled {
    BORDER-RIGHT: #eee 1px solid; PADDING-RIGHT: 5px; BORDER-TOP: #eee 1px solid; PADDING-LEFT: 5px; PADDING-BOTTOM: 2px; MARGIN: 2px; BORDER-LEFT: #eee 1px solid; COLOR: #ddd; PADDING-TOP: 2px; BORDER-BOTTOM: #eee 1px solid
}
</style>
</#macro>