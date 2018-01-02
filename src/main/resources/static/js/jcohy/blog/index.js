﻿layui.define(['laypage', 'layer', 'table','form', 'pagesize','laytpl','common','tags','upload'], function (exports) {
    var $ = layui.jquery,
        layer = layui.layer,
        form = layui.form,
        laytpl = layui.laytpl,
        table = layui.table,
        common = layui.common,
        tags = layui.tags,

        laypage = layui.laypage;

    var laypageId = 'pageNav';

    tags.init();

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
            common.frame_show('文章编辑','/blog/form?id='+data.id,$(window).width(),$(window).height());
        }
    });

    //监听置顶CheckBox
    form.on('checkbox(isTop)', function (data) {
        $.ajax({
            type: "GET",
            dataType: "json",
            data: {"type":"isTop"},
            url: "/blog/" + data.value + "/change",
            success: function (ret) {
                if (ret.isOk) {
                    layer.msg("操作成功", {time: 2000}, function () {
                        layer.close(index);
                        window.location.href = "/blog/index";
                    });
                } else {
                    layer.msg(ret.msg, {time: 2000});
                }
            }
        })
    });


    //监听推荐CheckBox
    form.on('checkbox(isRecommend)', function (data) {
        $.ajax({
            type: "GET",
            dataType: "json",
            data: {"type":"isRecommend"},
            url: "/blog/" + data.value + "/change",
            success: function (ret) {
                if (ret.isOk) {
                    layer.msg("操作成功", {time: 2000}, function () {
                        layer.close(index);
                        window.location.href = "/blog/index";
                    });
                } else {
                    layer.msg(ret.msg, {time: 2000});
                }
            }
        })
    });


    //监听私密CheckBox
    form.on('checkbox(privacy)', function (data) {
        $.ajax({
            type: "GET",
            dataType: "json",
            data: {"type":"privacy"},
            url: "/blog/" + data.value + "/change",
            success: function (ret) {
                if (ret.isOk) {
                    layer.msg("操作成功", {time: 2000}, function () {
                        layer.close(index);
                        window.location.href = "/blog/index";
                    });
                } else {
                    layer.msg(ret.msg, {time: 2000});
                }
            }
        })
    });

    //添加数据
    $('#addArticle').click(function () {
        var index = layer.load(1);
        setTimeout(function () {
            layer.close(index);
            common.frame_show('文章添加','/blog/form',$(window).width(),$(window).height());
            // layer.msg('打开添加窗口');
        }, 500);
    });

    //输出接口，主要是两个函数，一个删除一个编辑
    var datalist = {
        deleteData: function (id) {
            layer.confirm('确定删除？', {
                btn: ['确定', '取消'] //按钮
            }, function () {
                del(id);
                // layer.msg('删除Id为【' + id + '】的数据');
            }, function () {

            });
        },
        editData: function (id) {
            common.frame_show('文章编辑','/blog/form?id='+id,$(window).width(),$(window).height());
            // layer.msg('编辑Id为【' + id + '】的数据');
        }
    };

    function del(id) {
        $.ajax({
            method:"DELETE",
            dataType:"JSON",
            url:"/blog/"+id+"/del",
            success:function (ret) {
                if (ret.isOk) {
                    layer.msg("操作成功", {time: 2000}, function () {
                        layer.close(index);
                        window.location.href = "/blog/index";
                    });
                } else {
                    layer.msg(ret.msg, {time: 2000});
                }
            }
        })
    }
    //上传文件设置
    layui.upload({
        url: '/php/upload.php',
        before: function(input) {
            box = $(input).parent('form').parent('div').parent('.layui-input-block');
            if (box.next('div').length > 0) {
                box.next('div').html('<div class="imgbox"><p>上传中...</p></div>');
            } else {
                box.after('<div class="layui-input-block"><div class="imgbox"><p>上传中...</p></div></div>');
            }
        },
        success: function(res) {
            if (res.status == 200) {
                box.next('div').find('div.imgbox').html('<img src="' + res.url + '" alt="..." class="img-thumbnail">');
                box.find('input[type=hidden]').val(res.url);
                form.check(box.find('input[type=hidden]'));
            } else {
                box.next('div').find('p').html('上传失败...')
            }
        }
    });

    exports('blog/index', datalist);
});