<?php

namespace app\api\controller;

use app\admin\model\SiteBanner;
use app\admin\model\SiteNews;
use app\Request;

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

    /**
     * @note 获取新闻分类列表
     * @param Request $request
     * @param SiteNews $siteNews
     * @return mixed
     */
    public function list(Request $request,SiteNews $siteNews){
        $cate = $request->param("cate","1");
        $page = $request->param("page","1");

        $limit = 10;
        $newsList = $siteNews->alias("news")
            ->field(["news.id","news.title","news.description","news.img","news.up_date","nc.name as cate_name","nc.cid"])
            ->leftJoin("ea_site_news_cate nc","news.cate_id = nc.cid")
            ->where("nc.language_code",$this->site)
            ->where("news.cate_id",$cate)
            ->order("news.status",1)
            ->order("news.up_date","desc")
            ->page($page, $limit)
            ->select();

        $count = $siteNews->where('cate_id',1)->where("status",1)->count();

        $data = [
            'list' => $newsList,
            'page' => (int)$page,
            'limit' => $limit,
            'page_num' => ceil($count / $limit),
        ];
        return $this->jsonResponse->success($data);
    }

    /**
     * @note 获取新闻详情
     * @param Request $request
     * @param SiteNews $siteNews
     * @return mixed
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function details(Request $request,SiteNews $siteNews){
        $id = $request->param("id","0");
        $details = $siteNews->where("id",$id)->find();

        $next = $siteNews->where("id",">",$id)->field(["id","title"])->order("id","asc")->find();
        $prev = $siteNews->where("id","<",$id)->field(["id","title"])->order("id","desc")->find();

        $data = [
            "details"=>$details,
            "prev"=>$prev,
            "next"=>$next,
        ];
        return $this->jsonResponse->success($data);
    }
}