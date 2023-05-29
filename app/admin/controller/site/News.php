<?php

namespace app\admin\controller\site;

use app\common\controller\AdminController;
use EasyAdmin\annotation\ControllerAnnotation;
use EasyAdmin\annotation\NodeAnotation;
use think\App;

/**
 * @ControllerAnnotation(title="site_news")
 */
class News extends AdminController
{

    use \app\admin\traits\Curd;

    public function __construct(App $app)
    {
        parent::__construct($app);

        $this->model = new \app\admin\model\SiteNews();
        
        $this->assign('getStatusList', $this->model->getStatusList());

    }

    /**
     * @NodeAnotation(title="列表")
     */
    public function index()
    {
        if ($this->request->isAjax()) {
            if (input('selectFields')) {
                return $this->selectList();
            }
            list($page, $limit, $where) = $this->buildTableParames();
            $count = $this->model
                ->where($where)
                ->count();
            $list = $this->model
                ->where($where)
                ->page($page, $limit)
                ->order($this->sort)
                ->select();
            //有的表可能会将标题和数据集存储在一个表，所以通过group进行区分
            foreach ($list as $k=>&$item){
                $item["cate_name"] = $item["cate_id"]==1?"公司新闻":"行业新闻";
                if (isset($item["group"]) && $item["group"]=="title"){
                    unset($list[$k]);
                }
            }
            $data = [
                'code'  => 0,
                'msg'   => '',
                'count' => $count,
                'data'  => $list,
            ];
            return json($data);
        }
        $title = $this->model->where("id",1)->find();
        if(isset($title["group"]) && $title["group"]=="title"){
            $this->assign("title",$title);
        }
        return $this->fetch();
    }
}