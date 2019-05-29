/**
 * 目录
 * verifyPhone			验证手机号码
 * verifyPostbox		验证邮箱地址
 * verifyqqNum			验证QQ号码
 * verifyWeChat			验证微信号码
 * verifyPwIntensity	验证密码强度
 * cbodataByID			绑定下拉框
 * timestampToTime		时间戳转换成日期格式
 * clearNoNum           数字判断(只有一个小数点，小数点后面限制n个数字)
 */


/**
 * 验证手机号码
 * @param phone 手机号码
 * @returns {Boolean} {false:正确,true:出错}
 */
function verifyPhone (obj) {
	var id = $(obj).attr("id");
    var phone = $.trim($("#" + id).val());
	if (phone != "" && phone.length > 0) {
		if (/^[0-9]+$/.test(phone)) {
			if (/^134[0-8]\d{7}|((13([0-3]|[5-9]))|149|15([0-3]|[5-9])|166|17(3|[5-8])|18[0-9]|19[8-9])\d{8}$/.test(phone)) {
		        return;
		    }
		}
	}
	$("#" + id).val("");
}

/**
 * 验证邮箱地址
 * @param postbox 邮箱地址
 * 名称+@+网站，例如：名称@163.com、名称@126.com、名称@sina.com
 * @returns {Boolean} {false:正确,true:出错}
 */
function verifyPostbox (obj) {
	var id = $(obj).attr("id");
	var postbox = $.trim($("#" + id).val());
	if (postbox != "" && postbox.length > 0) {
		if (/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/.test(postbox)) {
			return;
		}
	}
	$("#" + id).val("");
}

/**
 * 验证QQ号码
 * @param qqNum QQ号码
 * @returns {Boolean} {false:正确,true:出错}
 */
function verifyqqNums (obj) {
	var id = $(obj).attr("id");
	var qqNum = $.trim($("#" + id).val());
	if (qqNum != "" && qqNum.length > 0) {
		if (/^[1-9][0-9]{5,10}$/.test(qqNum)) {
			return;
		}
	}
	$("#" + id).val("");
}

/**
 * 验证微信号码
 * @param wechat 微信号码
 * 1、微信号是微信的唯一凭证，只能设置1次；
 * 2、可使用6-20个字母、数字、下划线和减号。例如：“weixin”、“qq_123”、“qq-123”；
 * 3、必须以字母开头（字母不区分大小写）；
 * 4、不支持设置中文。
 * @returns {Boolean} {false:正确,true:出错}
 */
function verifyWeChat (obj) {
	var id = $(obj).attr("id");
	var wechat = $.trim($("#" + id).val());
	if (wechat != "" && wechat.length > 0) {
		if (/^[a-zA-Z][a-zA-Z0-9_-]{5,19}$/.test(wechat)) {
			return;
		}
	}
	$("#" + id).val("");
}

/**
 * 验证密码强度
 * @param pw 密码
 * @returns {Number} {0:密码包含特殊字符-强,1:密码长度小于6，大于20,2:密码全部为正整数且长度小于9-弱,3:密码全部为正整数，长度大于9-中,4:密码包含字母-中}
 */
function verifyPwIntensity (pw) {
	if (pw != "" && pw.length > 0) {
		if (/^.{6,20}$/.test(pw)) {
			if (!/^\d+$/.test(pw)) {
				if (/^[a-z0-9A-Z]+$/.test(pw)) {
					return 4;//密码包含字母-中
				}
			} else {
				if (pw.length < 9) return 2;//密码全部为正整数且长度小于9-弱
				else return 3;//密码全部为正整数，长度大于9-中
			}
		}
		else return 1;//密码长度小于6，大于20
	}
	return 0;//密码包含特殊字符-强
}

/**
 * 绑定下拉框
 * @param url
 * @param id
 */
function cbodataByID(url, id) {
    $.post(url, function (data) {
        $.each(data.list, function (i) {
        	$('<option></option>').val(data.list[i].typeId).text(data.list[i].type).appendTo($("#" + id));
        });
    });
};

/**
 * 修改回填绑定下拉框
 * selectLoadDataes(selectId, url, k)
 * selectLoadDataes("list", "${ctx}/xxx.do", "1")
 */
function selectLoadDataes(selectId, url, k) {
    $.post(url, function (data) {
        $.each(data.list, function (i) {
            $('<option></option>').val(data.list[i].typeId).text(data.list[i].type).appendTo($("#" + selectId));
        });
        $("#" + selectId).val(k);
    });
}

/**
 * 时间戳转换成日期格式
 * @param timestamp 毫秒级别的时间戳
 * @returns {String} {1544489962000:2018-12-11 8:59:22}
 */
function timestampToTime(timestamp) {
    var date = new Date(timestamp);//时间戳为10位需*1000，时间戳为13位的话不需乘1000
    var Y = date.getFullYear() + '-';//2018-
    var M = (date.getMonth()+1 < 10 ? '0'+(date.getMonth()+1) : date.getMonth()+1) + '-';//12-
    var D = (date.getDate().toString().length < 2 ? '0'+date.getDate() : date.getDate()) + ' ';//11 
    var h = (date.getHours().toString().length < 2 ? '0'+date.getHours() : date.getHours()) + ':';//8:
    var m = (date.getMinutes().toString().length < 2 ? '0'+date.getMinutes() : date.getMinutes()) + ':';//59:
    var s = (date.getSeconds().toString().length < 2 ? '0'+date.getSeconds() : date.getSeconds());//22
    return Y+M+D+h+m+s;
}
function timestampToShortTime(timestamp) {
    var date = new Date(timestamp);//时间戳为10位需*1000，时间戳为13位的话不需乘1000
    var Y = date.getFullYear() + '-';//2018-
    var M = (date.getMonth()+1 < 10 ? '0'+(date.getMonth()+1) : date.getMonth()+1) + '-';//12-
    var D = (date.getDate().toString().length < 2 ? '0'+date.getDate() : date.getDate()) + ' ';//11 
    return Y+M+D;
}
//数字判断(只有一个小数点，小数点后面限制n个数字)
function clearNoNum(obj)
{
  //先把非数字的都替换掉，除了数字和.
  obj.value = obj.value.replace(/[^\d.]/g,"");
  //保证只有出现一个.而没有多个.
  obj.value = obj.value.replace(/\.{2,}/g,".");
  //必须保证第一个为数字而不是.
  obj.value = obj.value.replace(/^\./g,"");
  //保证.只出现一次，而不能出现两次以上
  obj.value = obj.value.replace(".","$#$").replace(/\./g,"").replace("$#$",".");
  //只能输入两个小数
  // obj.value = obj.value.replace(/^(\-)*(\d+)\.(\d\d).*$/,'$1$2.$3');
  //只能输入一个小数
  obj.value = obj.value.replace(/^(\-)*(\d+)\.(\d).*$/,'$1$2.$3');
}
//判断是否纯数字
function submitNumber(num) {
	var reg = /^[0-9]*$/;
	if (!reg.test(num)) {
	   return false;
	}else{
		return true;
	}
}
