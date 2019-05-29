/**
 * jquery 根据json对象填充form表单
 * @author en
 * @param fromId form表单id
 * @param jsonDate json对象
 */
function loadDatatoForm(fromId, jsonDate) {
    var obj = jsonDate;
    var key, value, tagName, type, arr;
    for (x in obj) {//循环json对象
        key = x;
        value = obj[x];
        //$("[name='"+key+"'],[name='"+key+"[]']").each(function(){
        //更加form表单id 和 json对象中的key查找 表单控件
        $("#" + fromId + " [name='" + key + "'],#" + fromId + " [name='" + key + "[]']").each(function () {
            tagName = $(this)[0].tagName;
            type = $(this).attr('type');
            if (tagName == 'INPUT') {
                if (type == 'radio') {
                    $(this).attr('checked', $(this).val() == value);
                } else if (type == 'checkbox') {
                    try {
                        //数组
                        arr = value.split(',');
                        for (var i = 0; i < arr.length; i++) {
                            if ($(this).val() == arr[i]) {
                                $(this).attr('checked', true);
                                break;
                            }
                        }
                    } catch (e) {
                        //单个
                        $(this).attr('checked', value);
                    }
                } else {
                    $(this).val(value);
                }
            } else if (tagName == 'TEXTAREA') {
                $(this).val(value);
            } else if (tagName == 'SELECT') {
                //console.log($(this).hasClass("select2"));
                if ($(this).hasClass("select2")) {
                    //select2 插件的赋值方法
                    $(this).val(value).trigger("change");
                } else {
                    $(this).val(value);
                }

            }

        });
    }
}

/**
 * jquery 根据json对象创建Select下拉框
 * @author en
 * @param fromId form表单id
 * @param jsonDate json对象
 */
function selectLoadData(selectId, jsonData) {    
    $("#" + selectId).empty();//清空该元素
    for (k in jsonData) {
        $("#" + selectId).append('<option value="' + jsonData[k].id + '">' + jsonData[k].text + '</option>');
    }
}

function createSelect(selectId, url) {
    $.post(url, function (data) {
        selectLoadData(selectId, data);
    });
}


//function ColseMicrosoft() {

//}


/**
 * 图片大小压缩
 * @param {} maxWidth 
 * @param {} maxHeight 
 * @param {} objImg 
 * @returns {} 
 */
function AutoResizeImage(maxWidth, maxHeight, objImg) {
    var img = new Image();
    img.src = objImg.src;
    var hRatio;
    var wRatio;
    var Ratio = 1;
    var w = img.width;
    var h = img.height;
    wRatio = maxWidth / w;
    hRatio = maxHeight / h;
    if (maxWidth == 0 && maxHeight == 0) {
        Ratio = 1;
    } else if (maxWidth == 0) {//
        if (hRatio < 1) Ratio = hRatio;
    } else if (maxHeight == 0) {
        if (wRatio < 1) Ratio = wRatio;
    } else if (wRatio < 1 || hRatio < 1) {
        Ratio = (wRatio <= hRatio ? wRatio : hRatio);
    }
    if (Ratio < 1) {
        w = w * Ratio;
        h = h * Ratio;
    }
    objImg.height = h;
    objImg.width = w;
}

/**
 * 阿拉伯数字转换汉字
 */
var chnNumChar = ["零","一","二","三","四","五","六","七","八","九"];
var chnUnitSection = ["","万","亿","万亿","亿亿"];
var chnUnitChar = ["","十","百","千"];
function SectionToChinese(section){
	var strIns = '', chnStr = '';
	var unitPos = 0;
	var zero = true;
	while(section > 0){
		var v = section % 10;
		if(v === 0){
			if(!zero){
				zero = true;
				chnStr = chnNumChar[v] + chnStr;
			}
		}else{
			zero = false;
			strIns = chnNumChar[v];
			strIns += chnUnitChar[unitPos];
			chnStr = strIns + chnStr;
		}
		unitPos++;
		section = Math.floor(section / 10);
	}
	return chnStr;
}
function NumberToChinese(num){  
	  var unitPos = 0;  
	  var strIns = '', chnStr = '';  
	  var needZero = false;  
	   
	  if(num === 0){  
	    return chnNumChar[0];  
	  }  
	   
	  while(num > 0){  
	    var section = num % 10000;  
	    if(needZero){  
	      chnStr = chnNumChar[0] + chnStr;  
	    }  
	    strIns = SectionToChinese(section);  
	    strIns += (section !== 0) ? chnUnitSection[unitPos] : chnUnitSection[0];  
	    chnStr = strIns + chnStr;  
	    needZero = (section < 1000) && (section > 0);  
	    num = Math.floor(num / 10000);  
	    unitPos++;  
	  }  
	  return chnStr;  
}
////////////////////////////////////////////////////////////

/**
 * 汉字转换阿拉伯数字
 */
var chnChineseChar = {
		零:0,
		一:1,
		二:2,
		三:3,
		四:4,
		五:5,
		六:6,
		七:7,
		八:8,
		九:9
	};
	var chnNameValue = {
		十:{value:10, secUnit:false},
		百:{value:100, secUnit:false},
		千:{value:1000, secUnit:false},
		万:{value:10000, secUnit:true},
		亿:{value:100000000, secUnit:true}
	}
	function ChineseToNumber(chnStr){
		var rtn = 0;
		var section = 0;
		var number = 0;
		var secUnit = false;
		var str = chnStr.split('');

		for(var i = 0; i < str.length; i++){
			var num = chnChineseChar[str[i]];
			if(typeof num !== 'undefined'){
				number = num;
				if(i === str.length - 1){
					section += number;
				}
			}else{
				var unit = chnNameValue[str[i]].value;
				secUnit = chnNameValue[str[i]].secUnit;
				if(secUnit){
					section = (section + number) * unit;
					rtn += section;
					section = 0;
				}else{
					section += (number * unit);
				}
				number = 0;
			}
		}
		return rtn + section;
	}
//////////////////////////////////////////////////////////////////	
	