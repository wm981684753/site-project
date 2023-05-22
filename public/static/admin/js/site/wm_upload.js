var element = layui.element, form = layui.form, layer = layui.layer, table = layui.table, laydate = layui.laydate, util = layui.util, tree = layui.tree , upload = layui.upload;
element.render();

function videoUpload(button,progress) {
    layui.use('upload', function () {
        var upload = layui.upload;
        //执行实例
        var uploadInst = upload.render({
            elem: button //绑定元素
            , url: '/dwadmin/ajax/upload' //上传接口
            ,accept: 'video'
            , done: function (res) {
                //上传完毕回调
                layer.msg("上传成功", {icon: 1, scrollbar: false, time: 2000, shadeClose: true});
                $('#name').val(res.data.url)

                setTimeout(function () {
                    // $('#name-percent').addClass('layui-hide');
                    $(progress).parents('.progress').addClass('layui-hide');
                    $(progress).attr("lay-percent", '0%');
                },2000)
            }
            , error: function () {
                //请求异常回调
            }
            , before: function () {
                $(progress).attr("lay-percent", '0%');
                $(progress).parents('.progress').removeClass('layui-hide');
            }
            , progress: function (n) {
                var percent = n + '%' //获取进度百分比
                $("#uploadImg").attr("lay-percent", percent);
                element.render(); //进度条
            }
        });
    });
}