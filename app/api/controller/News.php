<?php

namespace app\api\controller;

use app\admin\model\SiteBanner;
use app\admin\model\SiteNews;

class News extends BaseController
{
    public function data(){
        //banner
        $data["banner"] = (new SiteBanner())->withoutField("id")->where("cate_id",6)->where("status",1)->find();

        $newsList = (new SiteNews())->alias("news")
            ->field(["news.id","news.title","news.description","news.img","news.up_date","nc.name as cate_name","nc.cid"])
            ->leftJoin("ea_site_news_cate nc","news.cate_id = nc.cid")
            ->where("nc.language_code",$this->site)
            ->order("news.status",1)
            ->order("news.up_date","desc")
            ->select();

        foreach ($newsList??[] as $item){
            if($item["cid"]==1) {
                $data["news"]["company"]["list"][] = $item;
                $data["news"]["company"]["cate_title"] = $item["cate_name"];
            }else{
                $data["news"]["industry"]["list"][] = $item;
                $data["news"]["industry"]["cate_title"] = $item["cate_name"];
            }
        }

        return $this->jsonResponse->success($data);
    }
}