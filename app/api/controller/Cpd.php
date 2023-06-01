<?php

namespace app\api\controller;

use app\admin\model\SiteBanner;
use app\admin\model\SiteCpdModel;
use app\admin\model\SiteJob;

class Cpd extends BaseController
{
    public function data(){
        //banner
        $data["banner"] = (new SiteBanner())->withoutField("id")->where("cate_id",5)->where("status",1)->find();

        $data["model1"] = (new SiteCpdModel())->withoutField("id")->where("id",1)->find();

        $data["model2"] = [
            "title"=>(new SiteJob())->where("group","title")->value("title"),
            "data"=>(new SiteJob())->withoutField(["id","title"])->where("group","list")->select(),
        ];

        return $this->jsonResponse->success($data);
    }
}