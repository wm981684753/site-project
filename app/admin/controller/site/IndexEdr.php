<?php

namespace app\admin\controller\site;

use app\common\controller\AdminController;
use app\Request;
use EasyAdmin\annotation\ControllerAnnotation;
use EasyAdmin\annotation\NodeAnotation;
use think\App;

/**
 * @ControllerAnnotation(title="site_index_edr")
 */
class IndexEdr extends AdminController
{

    use \app\admin\traits\Curd;

    public function __construct(App $app)
    {
        parent::__construct($app);

        $this->model = new \app\admin\model\SiteIndexEdr();
        
    }

    /**
     * @NodeAnotation(title="列表")
     */
    public function index(Request $request)
    {
        $data = $this->model->where('id',1)->find();
        $this->assign('data',$data);
        return $this->fetch();
    }

    /**
     * @NodeAnotation(title="保存")
     */
    public function save(Request $request)
    {
        $this->checkPostRequest();
        $post = $this->request->post();
        try {
            $update = [
                'title'=>$post['title'] ?? "",
                'content'=>$post['content'] ?? "",
                'edr1_title'=>$post['edr1_title'] ?? "",
                'edr1_img'=>$post['edr1_img'] ?? "",
                'edr1_link'=>$post['edr1_link'] ?? "",
                'edr2_title'=>$post['edr2_title'] ?? "",
                'edr2_img'=>$post['edr2_img'] ?? "",
                'edr2_link'=>$post['edr2_link'] ?? "",
                'edr3_title'=>$post['edr3_title'] ?? "",
                'edr3_img'=>$post['edr3_img'] ?? "",
                'edr3_link'=>$post['edr3_link'] ?? "",
            ];
            $this->model->where('id',1)->update($update);
        } catch (\Exception $e) {
            $this->error('保存失败');
        }
        $this->success('保存成功');
    }
}