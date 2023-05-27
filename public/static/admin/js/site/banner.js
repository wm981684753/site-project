define(["jquery", "easy-admin"], function ($, ea) {

    var init = {
        table_elem: '#currentTable',
        table_render_id: 'currentTableRenderId',
        index_url: 'site.banner/index',
        add_url: 'site.banner/add',
        edit_url: 'site.banner/edit',
        delete_url: 'site.banner/delete',
        export_url: 'site.banner/export',
        modify_url: 'site.banner/modify',
    };

    var Controller = {

        index: function () {
            ea.table.render({
                init: init,
                cols: [[
                    {type: 'checkbox'},
                    // {field: 'id', title: 'ID'},
                    {field: 'sitePageCate.name', title: '所属页面'},
                    {field: 'title', title: '标题'},
                    {field: 'content', title: '文案'},
                    {field: 'path', title: '图片路径', templet: ea.table.image},
                    {field: 'button', title: '按钮'},
                    {field: 'link', title: '跳转链接'},
                    {field: 'status', search: 'select', selectList: ["禁用","启用"], title: '状态', templet: ea.table.switch},
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