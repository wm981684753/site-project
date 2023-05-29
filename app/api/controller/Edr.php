<?php

namespace app\api\controller;

use app\admin\model\SiteBanner;
use app\admin\model\SiteEdrModel;
use app\admin\model\SiteEdrModel2;

class Edr extends BaseController
{
    public function data(){
        //banner
        $data["banner"] = (new SiteBanner())->withoutField("id")->where("cate_id",4)->where("status",1)->find();

        $data["model1"] = [
            "title"=>(new SiteEdrModel2())->field(["title","content"])->where("group","title")->find(),
            "data"=>(new SiteEdrModel2())->field(["title","content","img","link"])->where("group","list")->order("sort")->select(),
        ];

        $data["model2"] = (new SiteEdrModel())->field(["content","button","link"])->where("id",1)->find();

        return $this->jsonResponse->success($data);
    }
}