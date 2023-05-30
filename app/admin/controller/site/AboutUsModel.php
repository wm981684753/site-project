<?php

namespace app\admin\controller\site;

use app\common\controller\AdminController;
use app\Request;
use EasyAdmin\annotation\ControllerAnnotation;
use EasyAdmin\annotation\NodeAnotation;
use think\App;

/**
 * @ControllerAnnotation(title="site_aboutUs_model")
 */
class AboutUsModel extends AdminController
{

    use \app\admin\traits\Curd;

    public function __construct(App $app)
    {
        parent::__construct($app);

        $this->model = new \app\admin\model\SiteAboutUsModel();
        
    }

    /**
    * @NodeAnotation(title="列表")
    */
    public function index(Request $request)
    {
        $id = $request->param("id","");
        $data = $this->model->where('id',$id)->find()->toArray();
        $this->assign('data',$data);
        return $this->fetch("site/about_us_model/index{$id}");
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
                'title_s'=>$post['title_s'] ?? "",
                'content'=>$post['content'] ?? "",
                'button'=>$post['button'] ?? "",
                'img'=>$post['img'] ?? "",
                'link'=>$post['link'] ?? "",
            ];
            $this->model->where('id',$id)->update($update);
        } catch (\Exception $e) {
            $this->error('保存失败');
        }
        $this->success('保存成功');
    }

    
}