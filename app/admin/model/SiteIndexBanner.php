<?php

namespace app\admin\model;

use app\common\model\TimeModel;

class SiteIndexBanner extends TimeModel
{

    protected $name = "site_index_banner";

    protected $deleteTime = false;

    public function __construct(array $data = [])
    {
        parent::__construct($data);
        $this->name = $this->name . $this->site;
    }
    
    public function getStatusList()
    {
        return ['0'=>'禁用','1'=>'启用',];
    }


}