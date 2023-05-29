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

        $data["model2"] = (new SiteJob())->withoutField("id")->select();

        return $this->jsonResponse->success($data);
    }
}