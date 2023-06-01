define(["jquery", "easy-admin"], function ($, ea) {

    var init = {
        table_elem: '#currentTable',
        table_render_id: 'currentTableRenderId',
        index_url: 'site.index_news/index',
        add_url: 'site.index_news/add',
        edit_url: 'site.index_news/edit',
        delete_url: 'site.index_news/delete',
        export_url: 'site.index_news/export',
        modify_url: 'site.index_news/modify',
    };

    var Controller = {

        index: function () {
            ea.table.render({
                init: init,
                cols: [[
                    {type: 'checkbox'},                    {field: 'id', title: 'ID'},                    {field: 'title', title: '标题'},                    {field: 'content', title: '文案'},                    {field: 'button', title: '按钮'},                    {field: 'link', title: '跳转链接'},                    {field: 'news1_title', title: 'news1_title'},                    {field: 'news1_img', title: 'news1_img'},                    {field: 'news1_ln', title: 'new表id'},                    {field: 'news2_title', title: 'news2_title'},                    {field: 'news2_img', title: 'news2_img'},                    {field: 'news2_ln', title: 'news2_ln'},                    {field: 'news3_title', title: 'news3_title'},                    {field: 'news3_img', title: 'news3_img'},                    {field: 'news3_ln', title: 'news3_ln'},                    {width: 250, title: '操作', templet: ea.table.tool},
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