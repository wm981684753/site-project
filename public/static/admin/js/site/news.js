define(["jquery", "easy-admin"], function ($, ea) {

    var init = {
        table_elem: '#currentTable',
        table_render_id: 'currentTableRenderId',
        index_url: 'site.news/index',
        add_url: 'site.news/add',
        edit_url: 'site.news/edit',
        delete_url: 'site.news/delete',
        export_url: 'site.news/export',
        modify_url: 'site.news/modify',
    };

    var Controller = {

        index: function () {
            ea.table.render({
                init: init,
                cols: [[
                    {type: 'checkbox'},
                    // {field: 'cate_id', title: '分类cid'},
                    {field: 'cate_name', title: '分类'},
                    {field: 'title', title: '标题'},
                    {field: 'description', title: '描述'},
                    {field: 'img', title: '简介图', templet: ea.table.image},
                    {field: 'up_date', title: '发布时间'},
                    {field: 'status', search: 'select', selectList: ["禁用","启用"], title: '状态', templet: ea.table.switch},
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