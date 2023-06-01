define(["jquery", "easy-admin"], function ($, ea) {

    var init = {
        table_elem: '#currentTable',
        table_render_id: 'currentTableRenderId',
        index_url: 'site.index_edr/index',
        add_url: 'site.index_edr/add',
        edit_url: 'site.index_edr/edit',
        delete_url: 'site.index_edr/delete',
        export_url: 'site.index_edr/export',
        modify_url: 'site.index_edr/modify',
    };

    var Controller = {

        index: function () {
            ea.table.render({
                init: init,
                cols: [[
                    {type: 'checkbox'},                    {field: 'id', title: 'ID'},                    {field: 'title', title: '标题'},                    {field: 'content', title: '文案'},                    {field: 'edr1_title', title: 'edr1_title'},                    {field: 'edr1_img', title: 'edr1_img'},                    {field: 'edr1_link', title: 'edr1_link'},                    {field: 'edr2_title', title: 'edr2_title'},                    {field: 'edr2_img', title: 'edr2_img'},                    {field: 'edr2_link', title: 'edr2_link'},                    {field: 'edr3_title', title: 'edr3_title'},                    {field: 'edr3_img', title: 'edr3_img'},                    {field: 'edr3_link', title: 'edr3_link'},                    {width: 250, title: '操作', templet: ea.table.tool},
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