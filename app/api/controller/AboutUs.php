<?php

namespace app\api\controller;

use app\admin\model\SiteAboutUsModel;
use app\admin\model\SiteAboutUsModel2;
use app\admin\model\SiteBanner;

class AboutUs extends BaseController
{
    public function data(){
        //banner
        $data["banner"] = (new SiteBanner())->withoutField("id")->where("cate_id",2)->where("status",1)->find();

        $data["model1"] = [
            "title"=>(new SiteAboutUsModel2())->field(["title","content"])->where("group","title")->find(),
            "data"=>(new SiteAboutUsModel2())->field(["title","img","link"])->where("group","list")->order("sort")->select(),
        ];

        $data["model2"] = (new SiteAboutUsModel())->withoutField(["id"])->where("id",1)->find();
        $data["model3"] = (new SiteAboutUsModel())->field(["title","title_s","content"])->where("id",2)->find();
        return $this->jsonResponse->success($data);
    }
}