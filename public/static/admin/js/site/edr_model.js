define(["jquery", "easy-admin"], function ($, ea) {

    var init = {
        table_elem: '#currentTable',
        table_render_id: 'currentTableRenderId',
        index_url: 'site.edr_model/index',
        add_url: 'site.edr_model/add',
        edit_url: 'site.edr_model/edit',
        delete_url: 'site.edr_model/delete',
        export_url: 'site.edr_model/export',
        modify_url: 'site.edr_model/modify',
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