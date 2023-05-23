define(["jquery", "easy-admin"], function ($, ea) {

    var init = {
        table_elem: '#currentTable',
        table_render_id: 'currentTableRenderId',
        index_url: 'site.index_model1/index',
        add_url: 'site.index_model1/add',
        edit_url: 'site.index_model1/edit',
        delete_url: 'site.index_model1/delete',
        export_url: 'site.index_model1/export',
        modify_url: 'site.index_model1/modify',
    };

    var Controller = {

        index: function () {
            ea.table.render({
                init: init,
                cols: [[
                    {type: 'checkbox'},                    {field: 'id', title: 'ID'},                    {field: 'title', title: '标题'},                    {field: 'content', title: '文案'},                    {field: 'image', title: '图片', templet: ea.table.image},                    {field: 'button', title: '按钮'},                    {field: 'link', title: '跳转链接'},                    {width: 250, title: '操作', templet: ea.table.tool},
                ]],
            });

            ea.listen();
        },
        add: function () {
            ea.listen();
        },
        edit: function () {
            ea.listen();
        },
    };
    return Controller;
});