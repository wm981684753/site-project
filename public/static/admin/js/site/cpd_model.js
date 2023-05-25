define(["jquery", "easy-admin"], function ($, ea) {

    var init = {
        table_elem: '#currentTable',
        table_render_id: 'currentTableRenderId',
        index_url: 'site.cpd_model/index',
        add_url: 'site.cpd_model/add',
        edit_url: 'site.cpd_model/edit',
        delete_url: 'site.cpd_model/delete',
        export_url: 'site.cpd_model/export',
        modify_url: 'site.cpd_model/modify',
    };

    var Controller = {

        index: function () {
            ea.table.render({
                init: init,
                cols: [[
                    {type: 'checkbox'},                    {field: 'id', title: 'ID'},                    {field: 'title', title: '标题'},                    {field: 'content', title: '文案'},                    {field: 'img1_title', title: 'img1_title'},                    {field: 'img1', title: '图片1'},                    {field: 'img2_title', title: 'img2_title'},                    {field: 'img2', title: 'img2'},                    {field: 'img3_title', title: 'img3_title'},                    {field: 'img3', title: 'img3'},                    {field: 'img4_title', title: 'img4_title'},                    {field: 'img4', title: 'img4'},                    {width: 250, title: '操作', templet: ea.table.tool},
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