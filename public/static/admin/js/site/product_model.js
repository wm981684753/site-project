define(["jquery", "easy-admin"], function ($, ea) {

    var init = {
        table_elem: '#currentTable',
        table_render_id: 'currentTableRenderId',
        index_url: 'site.product_model/index',
        add_url: 'site.product_model/add',
        edit_url: 'site.product_model/edit',
        delete_url: 'site.product_model/delete',
        export_url: 'site.product_model/export',
        modify_url: 'site.product_model/modify',
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