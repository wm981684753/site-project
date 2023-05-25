define(["jquery", "easy-admin"], function ($, ea) {

    var init = {
        table_elem: '#currentTable',
        table_render_id: 'currentTableRenderId',
        index_url: 'site.edr_model2/index',
        add_url: 'site.edr_model2/add',
        edit_url: 'site.edr_model2/edit',
        delete_url: 'site.edr_model2/delete',
        export_url: 'site.edr_model2/export',
        modify_url: 'site.edr_model2/modify',
    };

    var Controller = {

        index: function () {
            ea.table.render({
                init: init,
                cols: [[
                    {type: 'checkbox'},
                    // {field: 'id', title: 'ID'},
                    {field: 'title', title: '标题'},
                    {field: 'content', title: '文案'},
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