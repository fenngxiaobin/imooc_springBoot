function $$(id){

	return document.getElementById(id);
}

function fileUpload_CheckType(f){
	var strP="";
	strN="";
	intJ=0;
	
	
	//图片预览
	if(typeof FileReader == 'undefined'){
		alert('检测到您的浏览器不支持FileReader对象');
	}
	var strHTML= "";

	var strFileType= /image.*/;
	for(var intI = 0;intI<f.length;intI++){
		var tmpFile = f[intI];
		var reader= new FileReader();
		reader.readAsDataURL(tmpFile);
		reader.onload=function(e){
			strHTML = strHTML +"<span>";
			strHTML = strHTML + "<img src='"+e.target.result+"' alt='' />";
			strHTML = strHTML + "</span>";
			$$("show_pic").innerHTML = "<li>"+ strHTML +"</li>";
		}

		if(!tmpFile.type.match(strFileType)){
			intJ = intJ +1;
			strN =strN +tmpFile.name + "<br>";
		}
	}

	strP = "检测到（"+intJ+")个非图片格式文件。";

	if(intJ > 0){
		strP = strP + "文件名如下：<p>"+strN + "</p>";
		$("#head_submit").attr("disabled","disabled");
	}else{
		$("#head_submit").removeAttr("disabled");
	}
	$$("check_remind").innerHTML = strP;
}