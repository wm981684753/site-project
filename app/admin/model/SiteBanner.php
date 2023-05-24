<?php

namespace app\admin\model;

use app\common\model\TimeModel;

class SiteBanner extends TimeModel
{

    protected $name = "site_banner";

    protected $deleteTime = false;

    
    public function sitePageCate()
    {
        return $this->belongsTo('\app\admin\model\SitePageCate', 'cate_id', 'id');
    }

    
    public function getSitePageCateList()
    {
        return \app\admin\model\SitePageCate::column('name', 'id');
    }
    public function getStatusList()
    {
        return ['0'=>'禁用','1'=>'启用',];
    }


}