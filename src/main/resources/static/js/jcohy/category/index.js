layui.define(['laypage', 'layer', 'form', 'table'], function (exports) {
    var $ = layui.jquery,
        layer = layui.layer,
        form = layui.form,
        laypage = layui.laypage,
        table  = layui.table ;
    table.render({
        elem: '#test'
        ,height: 332
        ,method:'POST'
        ,url: '/category/all' //数据接口
        ,page: true //开启分页
        ,cols: [[ //表头
            {type: 'checkbox', align:'center',unresize:true}
            ,{field: 'id', align:'center', title: 'ID', sort: true,unresize:true}
            ,{field: 'name', align:'center', title: '名称',unresize:true}
            ,{field: 'count', align:'center', title: '数量',sort: true,unresize:true}
            ,{field: 'status', align:'center', title: '状态',unresize:true}
            ,{field: 'createDate', title: '创建日期',unresize:true}
            ,{fixed: 'right', width:200, align:'center', toolbar: '#barDemo',unresize:true}
        ]]
    });
    //监听工具条
    table.on('tool(demo)', function(obj){
        var data = obj.data;
        if(obj.event === 'detail'){
            layer.msg('ID：'+ data.id + ' 的查看操作');
        } else if(obj.event === 'del'){
            layer.confirm('真的删除行么', function(index){
                obj.del();
                layer.close(index);
            });
        } else if(obj.event === 'edit'){
            layer.alert('编辑行：<br>'+ JSON.stringify(data))
        }
    });
    //分页
    laypage.render({
        elem: 'pageDemo' //分页容器的id
        ,count: 100 //总页数
        ,skin: '#1E9FFF' //自定义选中色值
        //,skip: true //开启跳页
        ,jump: function(obj, first){
            if(!first){
                layer.msg('第'+ obj.curr +'页');
            }
        }
    });
    //添加数据
    $('#addCategory').click(function () {
        var index = layer.load(1);
        setTimeout(function () {
            layer.close(index);
            layer.msg('打开添加窗口');
        }, 500);
    });

    //输出接口，主要是两个函数，一个删除一个编辑
    var datalist = {
        deleteData: function (id) {
            layer.confirm('确定删除？', {
                btn: ['确定', '取消'] //按钮
            }, function () {
                layer.msg('删除Id为【' + id + '】的数据');
            }, function () {

            });
        },
        editData: function (id) {
            layer.msg('编辑Id为【' + id + '】的数据');
        }
    };


    exports('category/index', datalist);
});