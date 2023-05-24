define(["jquery", "easy-admin"], function ($, ea) {

    var init = {
        table_elem: '#currentTable',
        table_render_id: 'currentTableRenderId',
        index_url: 'site.index_model/index',
        add_url: 'site.index_model/add',
        edit_url: 'site.index_model/edit',
        delete_url: 'site.index_model/delete',
        export_url: 'site.index_model/export',
        modify_url: 'site.index_model/modify',
    };

    var Controller = {

        index: function () {
            ea.table.render({
                init: init,
                cols: [[
                    {type: 'checkbox'},
                    {field: 'id', title: 'ID'},
                    {field: 'title', title: '标题'},
                    {field: 'content', title: '文案'},
                    {field: 'image', title: '图片', templet: ea.table.image},
                    {field: 'button', title: '按钮'},
                    {field: 'link', title: '跳转链接'},
                    {width: 250, title: '操作', templet: ea.table.tool},
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