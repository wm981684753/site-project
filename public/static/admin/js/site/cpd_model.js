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