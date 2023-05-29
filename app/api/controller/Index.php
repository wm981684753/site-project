<?php

namespace app\api\controller;

use app\admin\model\SiteBanner;
use app\admin\model\SiteIndexModel;
use app\admin\model\SiteIndexModel2;

class Index extends BaseController
{
    public function data(){
        //banner
        $data["banner"] = (new SiteBanner())->withoutField("id")->where("cate_id",1)->select();
        //获取首页数据
        $data["model1"] = (new SiteIndexModel())->field(["title","content","img","button","link"])->where("id",1)->find();
        $data["model2"] = [
            "title"=>(new SiteIndexModel2())->where("id",1)->field(["title","button","link"])->find(),
            "data"=>(new SiteIndexModel2())->withoutField(["id","content","button","link"])->where("group","list")->select()->toArray(),
        ];
        $data["model3"] = (new SiteIndexModel())->withoutField(["id"])->where("id",2)->find();

        return $this->jsonResponse->success($data);
    }
}