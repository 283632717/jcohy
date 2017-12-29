﻿layui.define(['laypage', 'layer', 'table','form', 'pagesize','laytpl'], function (exports) {
    var $ = layui.jquery,
        layer = layui.layer,
        form = layui.form,
        laytpl = layui.laytpl,
        table = layui.table;
        laypage = layui.laypage;
    var laypageId = 'pageNav';

    table.render({
        elem: '#blog'
        ,height: 500
        ,method:'GET'
        ,url: '/blog/list' //数据接口
        ,page: true //开启分页
        ,cols: [[ //表头
            {type: 'checkbox', align:'center',unresize:true}
            // ,{field: 'id', align:'center', title: 'ID',unresize:true}
            ,{field: 'title', align:'center', title: '标题',unresize:true}
            ,{field: 'author', align:'center', title: '作者',unresize:true,templet: '<div>{{d.author.name}}</div>'}
            ,{field: 'category', align:'center', title: '分类',unresize:true,templet: '<div>{{d.category.name}}</div>'}
            ,{field: 'tags', align:'center', title: '标签',unresize:true}
            ,{field: 'createDate', title: '创建日期',unresize:true}
            ,{title: '选项',templet: '#choicesTpl',unresize:true}
            ,{fixed: 'right',  title:'操作',align:'center', toolbar: '#operator',unresize:true}
        ]]
    });

    table.on('tool(table)', function(obj){
        var data = obj.data;
        // if(obj.event === 'detail'){
        //     common.frame_show('分类添加','/category/form','720','430');
        //     // layer.msg('ID：'+ data.id + ' 的查看操作');
        // } else
        if(obj.event === 'del'){
            del(data.id);
        } else if(obj.event === 'edit'){
            common.frame_show('分类编辑','/category/form?id='+data.id,'720','430');
        }
    });

    //监听置顶CheckBox
    form.on('checkbox(top)', function (data) {
        var index = layer.load(1);
        setTimeout(function () {
            layer.close(index);
            if (data.elem.checked) {
                data.elem.checked = false;
            }
            else {
                data.elem.checked = true;
            }
            layer.msg('操作失败，返回原来状态');
            form.render();  //重新渲染
        }, 300);
    });

    //监听推荐CheckBox
    form.on('checkbox(recommend)', function (data) {
        var index = layer.load(1);
        setTimeout(function () {
            layer.close(index);
            layer.msg('操作成功');
        }, 300);
    });
    //添加数据
    $('#addArticle').click(function () {
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


    exports('blog/index', datalist);
});