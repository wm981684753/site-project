<?php
/**
 * Created by PhpStorm.
 * User: weiming
 * Date: 2023/5/29
 * Time: 21:50
 */

namespace app\api\controller;


use app\admin\model\SiteBanner;
use app\admin\model\SiteProductModel;
use app\admin\model\SiteProducts;

class Products extends BaseController
{
    public function data(){
        //banner
        $data["banner"] = (new SiteBanner())->withoutField("id")->where("cate_id",3)->where("status",1)->find();
        $data["model1"] = [
            "title"=>(new SiteProducts())->where("group","title")->value("content"),
            "data"=>(new SiteProducts())->withoutField("id")->where("group","list")->select(),
        ];
        $data["model2"] = (new SiteProductModel())->withoutField(["id","title"])->where("id",1)->find();
        return $this->jsonResponse->success($data);
    }
}