define(["jquery", "easy-admin"], function ($, ea) {

    var init = {
        table_elem: '#currentTable',
        table_render_id: 'currentTableRenderId',
        index_url: 'site.job/index',
        add_url: 'site.job/add',
        edit_url: 'site.job/edit',
        delete_url: 'site.job/delete',
        export_url: 'site.job/export',
        modify_url: 'site.job/modify',
    };

    var Controller = {

        index: function () {
            ea.table.render({
                init: init,
                cols: [[
                    {type: 'checkbox'},
                    // {field: 'id', title: 'ID'},
                    {field: 'job', title: '岗位'},
                    {field: 'salary', title: '薪资'},
                    {field: 'education', title: '学历'},
                    {field: 'seniority', title: '工作年限'},
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