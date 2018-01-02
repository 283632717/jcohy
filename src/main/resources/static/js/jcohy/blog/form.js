﻿layui.define(['layer','form','common','tags','upload'], function (exports) {
    var $ = layui.jquery,
        layer = layui.layer,
        form = layui.form,
        common = layui.common,
        tags = layui.tags,
        upload = layui.upload;

    tags.init();

    //监听置顶radio
    form.on('radio(top)', function (data) {
        console.log(data.value);
    });

    //监听推荐radio
    form.on('radio(commend)', function (data) {
        console.log(data.value);
    });

    //监听私密radio
    form.on('radio(privacy)', function (data) {
        console.log(data.value);
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
    upload.render({
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

    form.on('submit(*)', function(data){
        console.log(data.elem); //被执行事件的元素DOM对象，一般为button对象
        console.log(data.form); //被执行提交的form对象，一般在存在form标签时才会返回
        console.log(data.field); //当前容器的全部表单字段，名值对形式：{name: value}
        return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
    });
    exports('blog/form', datalist);
});