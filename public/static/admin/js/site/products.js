define(["jquery", "easy-admin"], function ($, ea) {

    var init = {
        table_elem: '#currentTable',
        table_render_id: 'currentTableRenderId',
        index_url: 'site.products/index',
        add_url: 'site.products/add',
        edit_url: 'site.products/edit',
        delete_url: 'site.products/delete',
        export_url: 'site.products/export',
        modify_url: 'site.products/modify',
    };

    var Controller = {

        index: function () {
            ea.table.render({
                init: init,
                cols: [[
                    {type: 'checkbox'},
                    // {field: 'id', title: 'ID'},
                    // {field: 'group', title: '区分list和title'},
                    {field: 'title', title: '标题'},
                    {field: 'content', title: '描述'},
                    {field: 'img', title: '图片', templet: ea.table.image},
                    {field: 'sort', title: '排序', edit: 'text'},
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