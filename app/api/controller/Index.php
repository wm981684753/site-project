<?php

namespace app\api\controller;

use app\admin\model\SiteBanner;
use app\admin\model\SiteIndexEdr;
use app\admin\model\SiteIndexModel;
use app\admin\model\SiteIndexModel2;
use app\admin\model\SiteIndexNews;
use app\admin\model\SiteNews;

class Index extends BaseController
{
    public function data(){
        //banner
        $data["banner"] = (new SiteBanner())->withoutField("id")->where("cate_id",1)
            ->where("status",1)
            ->order("sort")
            ->select();
        //获取首页数据
        $data["model1"] = (new SiteIndexModel())->field(["title","content","img","button","link"])->where("id",1)->find();
        $data["model2"] = [
            "title"=>(new SiteIndexModel2())->where("id",1)->field(["title","button","link"])->find(),
            "data"=>(new SiteIndexModel2())->withoutField(["id","content","button","link"])->where("group","list")->select()->toArray(),
        ];
        $data["model3"] = (new SiteIndexModel())->withoutField(["id"])->where("id",2)->find();

        //edr
        $data["model4"] = (new SiteIndexEdr())->field(["title","content","edr1_title","edr1_img","edr2_title","edr2_img","edr3_title","edr3_img"])->where("id",1)->find();

        //News
        $data["model5"] = (new SiteIndexNews())
            ->field(["title","content","button","link","news1_img","news1_ln","news2_img","news2_ln","news3_img","news3_ln","news4_img","news4_ln"])
            ->where("id",1)
            ->find();

        $news1_info = (new SiteNews())->where("id",$data["model5"]["news1_ln"])->find();
        $time1 = strtotime($news1_info["up_date"]);
        $data["model5"]["news1_title"] = $news1_info["title"];
        $data["model5"]["news1_date"] = [date("Y",$time1),date("m",$time1),date("d",$time1)];
        $news2_info = (new SiteNews())->where("id",$data["model5"]["news3_ln"])->find();
        $time2 = strtotime($news2_info["up_date"]);
        $data["model5"]["news2_title"] = $news2_info["title"];
        $data["model5"]["news2_date"] = date("Y-m-d",$time2);
        $news3_info = (new SiteNews())->where("id",$data["model5"]["news3_ln"])->find();
        $time3 = strtotime($news3_info["up_date"]);
        $data["model5"]["news3_title"] = $news3_info["title"];
        $data["model5"]["news3_date"] = date("Y-m-d",$time3);
        $news4_info = (new SiteNews())->where("id",$data["model5"]["news4_ln"])->find();
        $time4 = strtotime($news3_info["up_date"]);
        $data["model5"]["news4_title"] = $news4_info["title"];
        $data["model5"]["news4_date"] = date("Y-m-d",$time4);

        return $this->jsonResponse->success($data);
    }
}