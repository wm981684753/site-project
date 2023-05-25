<?php

namespace app\admin\controller\site;

use app\common\controller\AdminController;
use app\Request;
use EasyAdmin\annotation\ControllerAnnotation;
use EasyAdmin\annotation\NodeAnotation;
use think\App;

/**
 * @ControllerAnnotation(title="site_cpd_model")
 */
class CpdModel extends AdminController
{

    use \app\admin\traits\Curd;

    public function __construct(App $app)
    {
        parent::__construct($app);

        $this->model = new \app\admin\model\SiteCpdModel();
        
    }

    /**
     * @NodeAnotation(title="列表")
     */
    public function index(Request $request)
    {
        $id = $request->param("id","");
        $data = $this->model->where('id',$id)->find()->toArray();
        $this->assign('data',$data);
        return $this->fetch("site/cpd_model/index{$id}");
    }

    /**
     * @NodeAnotation(title="保存")
     */
    public function save(Request $request)
    {
        $id = $request->param("id","");
        if(empty($id)){
            $this->error('保存失败');
        }
        $this->checkPostRequest();
        $post = $this->request->post();
        try {
            $update = [
                'title'=>$post['title'] ?? "",
                'content'=>$post['content'] ?? "",
                'img1_title'=>$post['img1_title'] ?? "",
                'img1'=>$post['img1'] ?? "",
                'img2_title'=>$post['img2_title'] ?? "",
                'img2'=>$post['img2'] ?? "",
                'img3_title'=>$post['img3_title'] ?? "",
                'img3'=>$post['img3'] ?? "",
                'img4_title'=>$post['img4_title'] ?? "",
                'img4'=>$post['img4'] ?? "",
            ];
            $this->model->where('id',$id)->update($update);
        } catch (\Exception $e) {
            $this->error('保存失败');
        }
        $this->success('保存成功');
    }
}