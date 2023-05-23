define(["jquery", "easy-admin"], function ($, ea) {

    var init = {
        table_elem: '#currentTable',
        table_render_id: 'currentTableRenderId',
        index_url: 'site.index_banner/index',
        add_url: 'site.index_banner/add',
        edit_url: 'site.index_banner/edit',
        delete_url: 'site.index_banner/delete',
        export_url: 'site.index_banner/export',
        modify_url: 'site.index_banner/modify',
    };

    var Controller = {

        index: function () {
            ea.table.render({
                init: init,
                cols: [[
                    {type: 'checkbox'},
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