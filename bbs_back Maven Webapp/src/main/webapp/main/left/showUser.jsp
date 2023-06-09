<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="base_path" value="${pageContext.request.contextPath }"></c:set>
<script type="text/javascript">
var list1 = new Array;
var list2 = new Array;
list1[list1.length] = "北京";
list1[list1.length] = "天津";
list1[list1.length] = "河北";
list1[list1.length] = "山西";
list1[list1.length] = "内蒙古";
list1[list1.length] = "辽宁";
list1[list1.length] = "吉林";
list1[list1.length] = "黑龙江";
list1[list1.length] = "上海";
list1[list1.length] = "江苏";
list1[list1.length] = "浙江";
list1[list1.length] = "安徽";
list1[list1.length] = "福建";
list1[list1.length] = "江西";
list1[list1.length] = "山东";
list1[list1.length] = "河南";
list1[list1.length] = "湖北";
list1[list1.length] = "湖南";
list1[list1.length] = "广东";
list1[list1.length] = "广西";
list1[list1.length] = "海南";
list1[list1.length] = "重庆";
list1[list1.length] = "四川";
list1[list1.length] = "贵州";
list1[list1.length] = "云南";
list1[list1.length] = "西藏";
list1[list1.length] = "陕西";
list1[list1.length] = "甘肃";
list1[list1.length] = "青海";
list1[list1.length] = "宁夏";
list1[list1.length] = "新疆";
list1[list1.length] = "香港";
list1[list1.length] = "澳门";
list1[list1.length] = "台湾";
list1[list1.length] = "其他";

list2[list2.length] = new Array("北京", "东城区", "西城区", "崇文区", "宣武区", "朝阳区", "丰台区", "石景山区", " 海淀区（中关村）", "门头沟区", "房山区", "通州区", "顺义区", "昌平区", "大兴区", "怀柔区", "平谷区", "密云县", "延庆县", " 其他");
list2[list2.length] = new Array("和平区", "河东区", "河西区", "南开区", "红桥区", "塘沽区", "汉沽区", "大港区",
            "西青区", "津南区", "武清区", "蓟县", "宁河县", "静海县", "其他");
list2[list2.length] = new Array("石家庄", "张家口", "承德", "秦皇岛", "唐山", "廊坊", "衡水",
            "沧州", "邢台", "邯郸", "保定", "其他");
list2[list2.length] = new Array("太原", "朔州", "大同", "长治", "晋城", "忻州", "晋中", "临汾",
            "吕梁", "运城 ", "其他");
list2[list2.length] = new Array("呼和浩特", "包头", "赤峰", "呼伦贝尔", "鄂尔多斯", "乌兰察布",
            "巴彦淖尔", "兴安盟", "阿拉善盟", "锡林郭勒盟", "其他");
list2[list2.length] = new Array("沈阳 ", "朝阳 ", "阜新 ", "铁岭 ", "抚顺 ", "丹东 ", "本溪 ", "辽阳 ",
            "鞍山", "大连", "营口", "盘锦", "锦州", "葫芦岛", "其他");
list2[list2.length] = new Array("长春", "白城", "吉林", "四平", "辽源", "通化", "白山", "延边", "其他");
list2[list2.length] = new Array("哈尔滨", "七台河", "黑河", "大庆", "齐齐哈尔", "伊春", "佳木斯",
            "双鸭山", "鸡西", "大兴安岭", "牡丹江", "鹤岗", "绥化", "其他");
list2[list2.length] = new Array("黄浦区", "卢湾区", "徐汇区", "长宁区", "静安区", "普陀区", "闸北区", "虹口区",
            "杨浦区", "闵行区", "宝山区", "嘉定区", "浦东新区", "金山区", "松江区", "青浦区", "南汇区", "奉贤区", "崇明县", "其他");
list2[list2.length] = new Array("南京", "徐州", "连云港", "宿迁", "淮安", "盐城", "扬州", "泰州",
            "南通", "镇江", "常州", "无锡", "苏州", "其他");
list2[list2.length] = new Array("杭州 ", "湖州 ", "嘉兴 ", "舟山 ", "宁波 ", "绍兴 ", "衢州 ", "金华 ",
            "台州", "温州", "丽水", "其他");
list2[list2.length] = new Array("合肥", "宿州 ", "淮北 ", "亳州 ", "阜阳 ", "蚌埠 ", "淮南 ", "滁州 ",
            "马鞍山 ", "芜湖 ", "铜陵", "安庆 ", "黄山 ", "六安 ", "巢湖 ", "池州 ", "宣城 ", "其他");
list2[list2.length] = new Array("福州", "南平 ", "莆田 ", "三明 ", "泉州 ", "厦门 ", "漳州 ", "龙岩 ", "宁德 ", "其他");
list2[list2.length] = new Array("南昌", "九江 ", "景德镇 ", "鹰潭 ", "新余 ", "萍乡 ", "赣州 ", "上饶 ",
            "抚州 ", "宜春 ", "吉安 ", "其他");
list2[list2.length] = new Array("济南", "聊城", "德州 ", "东营 ", "淄博 ", "潍坊 ", "烟台 ", "威海 ",
            "青岛", "日照", "临沂", "枣庄", "济宁", "泰安 ", "莱芜 ", "滨州 ", "菏泽 ", "其他");
list2[list2.length] = new Array("郑州", "三门峡", "洛阳", "焦作", "新乡", "鹤壁", "安阳", "濮阳",
            "开封", "商丘", "许昌", "漯河", "平顶山", "南阳", "信阳", "周口", "驻马店", "其他");
list2[list2.length] = new Array("武汉", "十堰", "襄樊", "荆门", "孝感", "黄冈", "鄂州", "黄石",
            "咸宁 ", "荆州 ", "宜昌", "随州", "恩施", "仙桃", "天门", "潜江", "神农架", "其他");
list2[list2.length] = new Array("长沙 ", "张家界 ", "常德 ", "益阳 ", "岳阳 ", "株洲 ", "湘潭 ", "衡阳 ",
            "郴州 ", "永州 ", "邵阳 ", "怀化 ", "娄底 ", "湘西土家族苗族自治州", "其他");
list2[list2.length] = new Array("广州 ", "清远", "韶关", "河源", "梅州", "潮州", "汕头", "揭阳",
            "汕尾", "惠州", "东莞", "深圳", "珠海", "中山", "江门", "佛山", "肇庆", "云浮",
            "阳江", "茂名", "湛江", "其他");
list2[list2.length] = new Array("南宁", "桂林", "柳州", "梧州", "贵港", "玉林", "钦州", "北海",
            "防城港", "崇左", "百色", "河池", "来宾", "贺州", "其他");
list2[list2.length] = new Array("海口 ", "三亚 ", "其他");
list2[list2.length] = new Array("渝中区", "大渡口区", "江北区", "沙坪坝区", "九龙坡区", "南岸区", "北碚区",
            "万盛区", "双桥区", "渝北区", "巴南区", "万州区", "涪陵区", "黔江区", "长寿区", "合川 ", "永川 ",
            "江津 ", "南川 ", "綦江县", "潼南县", "铜梁县", "大足县", "璧山县", "垫江县", "武隆县", "丰都县",
            "城口县", "开县", "巫溪县", "巫山县", "奉节县", "云阳县", "忠县", "石柱土家族自治县", "彭水苗族土家族自治县",
            "酉阳土家族苗族自治县", "秀山土家族苗族自治县", "其他");
list2[list2.length] = new Array("成都 ", "广元 ", "绵阳 ", "德阳 ", "南充 ", "广安 ", "遂宁 ",
            "内江 ", "乐山 ", "自贡 ", "泸州 ", "宜宾 ", "攀枝花 ", "巴中 ", "资阳 ", "眉山 ", "雅安",
            "阿坝藏族羌族自治州", "甘孜藏族自治州", "凉山彝族自治州县", "其他");
list2[list2.length] = new Array("贵阳 ", "六盘水 ", "遵义 ", "安顺 ", "毕节地区", "铜仁地区",
            "黔东南苗族侗族自治州", "黔南布依族苗族自治州", "黔西南布依族苗族自治州", "其他");
list2[list2.length] = new Array("昆明 ", "曲靖 ", "玉溪 ", "保山 ", "昭通 ", "丽江 ", "普洱 ",
            "临沧 ", "宁德 ", "德宏傣族景颇族自治州", "怒江傈僳族自治州", "楚雄彝族自治州", "红河哈尼族彝族自治州",
            "文山壮族苗族自治州", "大理白族自治州", "迪庆藏族自治州", "西双版纳傣族自治州", "其他");
list2[list2.length] = new Array("拉萨 ", "那曲地区", "昌都地区", "林芝地区", "山南地区", "日喀则地区", "阿里地区", "其他");
list2[list2.length] = new Array("西安 ", "延安 ", "铜川 ", "渭南 ", "咸阳 ", "宝鸡 ", "汉中 ", "安康 ", "商洛 ", "其他");
list2[list2.length] = new Array("兰州  ", "嘉峪关 ", "金昌 ", "白银 ", "天水 ", "武威 ", "酒泉 ",
            "张掖 ", "庆阳 ", "平凉 ", "定西 ", "陇南 ", "临夏回族自治州", "甘南藏族自治州", "其他");
list2[list2.length] = new Array("西宁 ", "海东地区", "海北藏族自治州", "黄南藏族自治州", "玉树藏族自治州",
            "海南藏族自治州", "果洛藏族自治州", "海西蒙古族藏族自治州", "其他");
list2[list2.length] = new Array("银川 ", "石嘴山 ", "吴忠 ", "固原 ", "中卫 ", "其他");
list2[list2.length] = new Array("乌鲁木齐 ", "克拉玛依 ", "喀什地区", "阿克苏地区", "和田地区", "吐鲁番地区",
            "哈密地区", "塔城地区", "阿勒泰地区", "克孜勒苏柯尔克孜自治州", "博尔塔拉蒙古自治州",
            "昌吉回族自治州伊犁哈萨克自治州", "巴音郭楞蒙古自治州", "河子 ", "阿拉尔 ", "五家渠 ", "图木舒克 ", "其他");
list2[list2.length] = new Array("香港", "其他");
list2[list2.length] = new Array("澳门", "其他");
list2[list2.length] = new Array("台湾", "其他");

var ddlProvince = document.getElementById("province");
var ddlCity = document.getElementById("city");
for(var i =0;i<list1.length; i++)
{
    var option = document.createElement("option");
    option.appendChild(document.createTextNode(list1[i]));
    option.value = list1[i];
    ddlProvince.appendChild(option);
    //city initialize
    var firstprovince = list2[0];
    for (var j = 0; j < firstprovince.length; j++) {
        var optioncity = document.createElement("option");
        optioncity.appendChild(document.createTextNode(firstprovince[j]));
        optioncity.value = firstprovince[j];
        ddlCity.appendChild(optioncity);
    }
}
function indexof(obj,value)
{
    var k=0;
    for(;k<obj.length;k++)
    {
        if(obj[k] == value)
        return k;
    }
    return k;
}
function selectprovince(obj) {
    ddlCity.options.length = 0;//clear
    var index = indexof(list1,obj.value);
    var list2element = list2[index];
    for(var i =0;i<list2element.length; i++)
    {
        var option = document.createElement("option");
        option.appendChild(document.createTextNode(list2element[i]));
        option.value = list2element[i];
        ddlCity.appendChild(option);
    }
}
	
    $(function () {
        $('#showUsers').edatagrid({
            url:'${pageContext.request.contextPath}/user/showUsersByPage.do',
            columns:[[
                {field:'user_name',title:'用户名',width:65},
               /*  {field:'user_pwd',title:'密码',width:100}, */
                {field:'qq',title:'qq',width:100,},
               /*  {field:'wechat',title:'微信号',width:100,}, */
                {field:'province',title:'省份',width:100,},
                {field:'city',title:'城市',width:100,},
                {field:'sex',title:'性别',width:80,},
                {field:'register_time',title:'注册时间',width:150,},
                {field:'last_time',title:'最后登录时间',width:100,}
            ]],
            fit:true,
            fitColumns:true,
            pagination:true,
            pageList:[5,8,10],
            pageSize:5,
            //updateUrl:"${base_path}/page/updatePageDetail.do",
            toolbar: [{
                text:"导出模板",
                iconCls: 'icon-edit',
                handler: function(){
                    location.href="${base_path}/user/exportTitle.do";
                }
            },'-',{
                text:"导出所有用户信息",
                iconCls: 'icon-help',
                handler: function(){
                    location.href="${base_path}/user/exportAll.do";
                }
            },'-',{
                text:"导入用户信息",
                iconCls: 'icon-help',
                handler: function(){
                    $('#addUsers').dialog('open');
                }
            },'-',{
                text:"修改用户信息",
                iconCls: 'icon-help',
                handler: function(){
                	if($("#showUsers").edatagrid("getSelected")==null){
                		//$.messager.alert('警告','警告消息');    
                		$.messager.confirm('确认','请选择一个用户',function(r){    
                		    /* if (r){    
                		        alert('确认删除');    
                		    }   */  
                		}); 
                	}else{
                		//alert($("#showUsers").edatagrid("getSelected").city);
                		$('#dd_update').dialog('open');
                		$("#update_user_name").val($("#showUsers").edatagrid("getSelected").user_name);
                		$("#update_qq").val($("#showUsers").edatagrid("getSelected").qq);
                		$("#province").val($("#showUsers").edatagrid("getSelected").province);
                		selectprovince(document.getElementById("province"));
                		//$("#city").val($("#showUsers").edatagrid("getSelected").city);
                		$("#city").find("option[value = '"+$("#showUsers").edatagrid("getSelected").city+"']").attr("selected","selected");
                		$("#update_sex").val($("#showUsers").edatagrid("getSelected").sex);
                    	
                    	
                	}
                }
            }],
            view: detailview,
            detailFormatter: function(rowIndex, rowData){
                return '<table><tr>' +
                    '<td rowspan=2 style="border:0"><img src="${base_path}/main/image/user.png' +' "style="height:50px;"></td>' +
                    '<td style="border:0">' +
                    '<p>描述: ' + '统一用户头像' + '</p>' +
                    /* '<p>状态: ' + rowData.status + '</p>' + */
                    '</td>' +
                    '</tr></table>';
            }
        });
    });
    
    
    
</script>

<table id="showUsers"></table>

<div id="addUsers" class="easyui-dialog" title="导入用户信息" style="width:400px;height:200px;text-align: center"
     data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true,
buttons:[{
				text:'上传',
				handler:function(){
                $('#ff_addUsers').form('submit', {url:'${base_path}/user/importUses.do',success:function(){$('#addUsers').dialog('close');$('#showUsers').edatagrid('reload')}})
				}
			},  {
				text:'关闭',
				handler:function(){
				     $('#addUsers').dialog('close');
				}
			}]">
    <form id="ff_addUsers" method="post" enctype="multipart/form-data">
        <div>
            <label for="excel" style="width: 250px">请选择上传与模板相同格式的xls文件:</label>
            <br/>
            <input id="excel" name="excel"  type="file" data-options="required:true" />
        </div>
    </form>
</div>

<div id="dd_update" class="easyui-dialog" title="修改用户信息" style="width:400px;height:200px;text-align: center"
     data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true,
buttons:[{
				text:'保存',
				handler:function(){
                $('#ff_update').form('submit', {url:'${base_path}/user/update.do',success:function(){$('#dd_update').dialog('close');$('#showUsers').datagrid('reload');;$.messager.show({
						title:'系统提示',
						msg:'修改成功!'
					});}})
				}
			}]">
    <form id="ff_update" method="post" enctype="multipart/form-data">
        <input id="update_user_name" type="hidden" name="user_name"  />
        <div style="margin-bottom:5px">
            <label for="description">qq号</label>
            <input id="update_qq" class="easyui-validatebox" type="text" name="qq"  /><!-- data-options="required:true" -->
        </div>
        <div style="margin-bottom:5px">
            <label for="status">省份</label>
            <select id="province" runat="server" onchange="selectprovince(this);" style=" width:95px;" name="province"></select>
			
        </div>
        <div style="margin-bottom:5px">
            <label for="upload">城市 </label>
            <select id="city" runat="server" style=" width:95px;" name="city"></select>
        </div>
        <div style="margin-bottom:5px">
            <label for="upload">性别</label>
            <select style=" width:95px;" name="sex" id="update_sex">
            	<option value="男">男</option>
				<option value="女">女</option>
            </select>
        </div>
    </form>
</div>