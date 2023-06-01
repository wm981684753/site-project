<?php

namespace app\admin\controller\site;

use app\admin\model\SiteNews;
use app\common\controller\AdminController;
use app\Request;
use EasyAdmin\annotation\ControllerAnnotation;
use EasyAdmin\annotation\NodeAnotation;
use think\App;

/**
 * @ControllerAnnotation(title="site_index_news")
 */
class IndexNews extends AdminController
{

    use \app\admin\traits\Curd;

    public function __construct(App $app)
    {
        parent::__construct($app);

        $this->model = new \app\admin\model\SiteIndexNews();
        
    }

    /**
     * @NodeAnotation(title="列表")
     */
    public function index(Request $request)
    {
        $data = $this->model->where('id',1)->find();
        $this->assign('data',$data);

        //获取新闻列表
        $newsList = (new SiteNews())->alias("news")
            ->field(["news.id","news.title","news.description","news.img","news.up_date","nc.name as cate_name","nc.cid"])
            ->leftJoin("ea_site_news_cate nc","news.cate_id = nc.cid")
            ->where("nc.language_code","cn")
            ->where("news.status",1)
            ->order("news.up_date","desc")
            ->select();
        $news = [];
        foreach ($newsList??[] as $item){
            if($item["cid"]==1) {
                $news["company"]["list"][] = $item;
                $news["company"]["cate_title"] = $item["cate_name"];
            }else{
                $news["industry"]["list"][] = $item;
                $news["industry"]["cate_title"] = $item["cate_name"];
            }
        }
        $this->assign("newsList",$news);
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
                'button'=>$post['button'] ?? "",
                'link'=>$post['link'] ?? "",
                'news1_title'=>$post['news1_title'] ?? "",
                'news1_img'=>$post['news1_img'] ?? "",
                'news1_ln'=>$post['news1_ln'] ?? 0,
                'news2_title'=>$post['news2_title'] ?? "",
                'news2_img'=>$post['news2_img'] ?? "",
                'news2_ln'=>$post['news2_ln'] ?? 0,
                'news3_title'=>$post['news3_title'] ?? "",
                'news3_img'=>$post['news3_img'] ?? "",
                'news3_ln'=>$post['news3_ln'] ?? 0,
                'news4_title'=>$post['news3_title'] ?? "",
                'news4_img'=>$post['news3_img'] ?? "",
                'news4_ln'=>$post['news3_ln'] ?? 0,
            ];
            $this->model->where('id',1)->update($update);
        } catch (\Exception $e) {
            $this->error('保存失败');
        }
        $this->success('保存成功');
    }
}